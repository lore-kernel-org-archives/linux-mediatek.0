From: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/6] ARM: mediatek: add smp bringup code for MT6580
Date: Thu, 18 Jun 2015 10:46:24 +0800
Message-ID: <1434595587-25466-4-git-send-email-scott.shu@mediatek.com>
References: <Scott Shu <srv_scott.shu@mediatek.com>
 <1434595587-25466-1-git-send-email-scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1434595587-25466-1-git-send-email-scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: scott.shu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_wsdupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Miles.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mars.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, MY.Chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Add support for cpu enable-method "mediatek,mt6580-smp" for booting
secondary CPUs on MT6580.
---
 arch/arm/mach-mediatek/platsmp.c | 107 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index 12fefb3..2985913 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -21,10 +21,15 @@
 #include <linux/of_address.h>
 #include <linux/string.h>
 #include <linux/threads.h>
+#include <linux/delay.h>
+#include <asm/cacheflush.h>
+#include "generic.h"
 
 #define MTK_MAX_CPU		8
 #define MTK_SMP_REG_SIZE	0x1000
 
+static DEFINE_SPINLOCK(boot_lock);
+
 struct mtk_smp_boot_info {
 	unsigned long smp_base;
 	unsigned int jump_reg;
@@ -57,6 +62,101 @@ static const struct of_device_id mtk_smp_boot_infos[] __initconst = {
 static void __iomem *mtk_smp_base;
 static const struct mtk_smp_boot_info *mtk_smp_info;
 
+static void __cpuinit write_pen_release(int val)
+{
+	pen_release = val;
+	/* Make sure this is visible to other CPUs */
+	smp_wmb();
+	sync_cache_w(&pen_release);
+}
+
+static int mt6580_boot_secondary(unsigned int cpu, struct task_struct *idle)
+{
+	unsigned long timeout;
+
+	/*
+	 * Set synchronisation state between this boot processor
+	 * and the secondary one
+	 */
+	spin_lock(&boot_lock);
+
+	/*
+	 * The secondary processor is waiting to be released from
+	 * the holding pen - release it, then wait for it to flag
+	 * that it has been released by resetting pen_release.
+	 *
+	 * Note that "pen_release" is the hardware CPU ID, whereas
+	 * "cpu" is Linux's internal ID.
+	 */
+	write_pen_release(cpu);
+
+	/*
+	 * CPU power on control by SPM
+	 */
+	spm_cpu_mtcmos_on(cpu);
+
+	timeout = jiffies + (1 * HZ);
+	while (time_before(jiffies, timeout)) {
+		/* Read barrier */
+		smp_rmb();
+
+		if (pen_release == -1)
+			break;
+
+		usleep_range(10, 1000);
+	}
+
+	/*
+	 * Now the secondary core is starting up let it run its
+	 * calibrations, then wait for it to finish
+	 */
+	spin_unlock(&boot_lock);
+
+	return (pen_release != -1 ? -EINVAL : 0);
+}
+
+static void mt6580_secondary_init(unsigned int cpu)
+{
+	/*
+	 * Let the primary processor know we're out of the
+	 * pen, then head off into the C entry point
+	 */
+	write_pen_release(-1);
+
+	/*
+	 * Synchronise with the boot thread.
+	 */
+	spin_lock(&boot_lock);
+	spin_unlock(&boot_lock);
+}
+
+#define MT6580_INFRACFG_AO	0x10001000
+#define SW_ROM_PD		BIT(31)
+
+static void __init mt6580_smp_prepare_cpus(unsigned int max_cpus)
+{
+	static void __iomem *infracfg_ao_base;
+
+	infracfg_ao_base = ioremap(MT6580_INFRACFG_AO, 0x1000);
+
+	if (!infracfg_ao_base)
+		pr_err("%s: Unable to map I/O memory\n", __func__);
+
+	/* Enable bootrom power down mode */
+	writel_relaxed(readl(infracfg_ao_base + 0x804) | SW_ROM_PD,
+		       infracfg_ao_base + 0x804);
+
+	/* Write the address of slave startup into boot address
+	   register for bootrom power down mode */
+	writel_relaxed(virt_to_phys(secondary_startup_arm),
+		       infracfg_ao_base + 0x800);
+
+	iounmap(infracfg_ao_base);
+
+	/* Initial spm cpu mtcmos memory map */
+	spm_cpu_mtcmos_init();
+}
+
 static int mtk_boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
 	if (!mtk_smp_base)
@@ -143,3 +243,10 @@ static struct smp_operations mt65xx_smp_ops __initdata = {
 	.smp_boot_secondary = mtk_boot_secondary,
 };
 CPU_METHOD_OF_DECLARE(mt65xx_smp, "mediatek,mt65xx-smp", &mt65xx_smp_ops);
+
+static struct smp_operations mt6580_smp_ops __initdata = {
+	.smp_prepare_cpus = mt6580_smp_prepare_cpus,
+	.smp_secondary_init = mt6580_secondary_init,
+	.smp_boot_secondary = mt6580_boot_secondary,
+};
+CPU_METHOD_OF_DECLARE(mt6580_smp, "mediatek,mt6580-smp", &mt6580_smp_ops);
-- 
1.8.1.1.dirty
