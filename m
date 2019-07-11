From: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 3/3] mt8183: emi: add bandwidth driver support
Date: Thu, 11 Jul 2019 15:10:02 +0800
Message-ID: <1562829002-24650-4-git-send-email-xixi.chen@mediatek.com>
References: <1562829002-24650-1-git-send-email-xixi.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1562829002-24650-1-git-send-email-xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

EMI provides interface for get bandwidth  on every 1 miliseconds.
Currently, just support GPU bandwidth info.

Signed-off-by: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/memory/Kconfig     |   9 ++
 drivers/memory/Makefile    |   1 +
 drivers/memory/mtk-emi.c   | 346 +++++++++++++++++++++++++++++++++++++++++++++
 include/soc/mediatek/emi.h |  70 +++++++++
 4 files changed, 426 insertions(+)
 create mode 100644 drivers/memory/mtk-emi.c
 create mode 100644 include/soc/mediatek/emi.h

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 2d91b00..72ec6d6 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -129,6 +129,15 @@ config JZ4780_NEMC
 	  the Ingenic JZ4780. This controller is used to handle external
 	  memory devices such as NAND and SRAM.
 
+config MTK_EMI_MBW
+	bool "Mediatek EMI bandwidth driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  This driver is for MTK EMI(External Memory Interface) control.
+	  It contains features like bandwidth, MPU and so on.
+	  Bandwidth feature is for getting different port throughoutput,
+	  like CPU, GPU, MM and so on.
+
 config MTK_SMI
 	bool
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index 90161de..4f8b241 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_FSL_CORENET_CF)	+= fsl-corenet-cf.o
 obj-$(CONFIG_FSL_IFC)		+= fsl_ifc.o
 obj-$(CONFIG_MVEBU_DEVBUS)	+= mvebu-devbus.o
 obj-$(CONFIG_JZ4780_NEMC)	+= jz4780-nemc.o
+obj-$(CONFIG_MTK_EMI_MBW)	+= mtk-emi.o
 obj-$(CONFIG_MTK_SMI)		+= mtk-smi.o
 obj-$(CONFIG_DA8XX_DDRCTL)	+= da8xx-ddrctl.o
 obj-$(CONFIG_PL353_SMC)		+= pl353-smc.o
diff --git a/drivers/memory/mtk-emi.c b/drivers/memory/mtk-emi.c
new file mode 100644
index 0000000..24b3e16
--- /dev/null
+++ b/drivers/memory/mtk-emi.c
@@ -0,0 +1,346 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ */
+
+#include <linux/cdev.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/time.h>
+#include <linux/hrtimer.h>
+#include <linux/ktime.h>
+#include <soc/mediatek/emi.h>
+
+/* 67ms emi bw  */
+#define EMI_BW_ARRAY_SIZE	67
+#define EMI_BW_TIMER_INTERVAL	1000	/* unit: us */
+
+struct mtk_emi_bw {
+	struct device *dev;
+	void __iomem *emi_cen_base;
+
+	struct hrtimer emi_bw_timer;
+	struct timeval old_tv;
+	ktime_t kt;
+	unsigned long long	tm_interval;	/* unit: us */
+
+	unsigned long long emi_bw_array[EMI_BW_ARRAY_SIZE];
+	int emi_bw_cur_idx;
+};
+
+static unsigned long long emi_get_max_bw_in_last_array(struct device *dev,
+	unsigned long long arr[], unsigned int size)
+{
+	unsigned int i = 0;
+	unsigned long long max = arr[0];
+
+	while (i < size) {
+		if (arr[i] > max)
+			max = arr[i];
+		++i;
+	}
+	return max;
+}
+
+unsigned long long mtk_emi_get_max_bw(struct device *dev)
+{
+	struct mtk_emi_bw *emi;
+
+	if (!dev)
+		return 0;
+
+	emi = dev_get_drvdata(dev);
+	return emi_get_max_bw_in_last_array(dev,
+		emi->emi_bw_array, ARRAY_SIZE(emi->emi_bw_array));
+}
+EXPORT_SYMBOL(mtk_emi_get_max_bw);
+
+static void emi_update_bw_array(struct device *dev, unsigned int val)
+{
+	struct mtk_emi_bw *emi = dev_get_drvdata(dev);
+
+	if (emi->emi_bw_cur_idx == EMI_BW_ARRAY_SIZE) {
+		/* remove the first array element */
+		memmove(emi->emi_bw_array, emi->emi_bw_array + 1,
+			sizeof(unsigned long long) * (EMI_BW_ARRAY_SIZE - 1));
+		emi->emi_bw_array[EMI_BW_ARRAY_SIZE - 1] = val;
+	} else
+		emi->emi_bw_array[emi->emi_bw_cur_idx++] = val;
+}
+
+static void emi_dump_bw_array(struct device *dev)
+{
+	int i = 0;
+	const int unit = 10;
+	struct mtk_emi_bw *emi = dev_get_drvdata(dev);
+
+	while (i < EMI_BW_ARRAY_SIZE) {
+		if (i != 0 && i % unit == 0)
+			pr_info("\n");
+		pr_info("0x%x ", emi->emi_bw_array[i]);
+
+		++i;
+	}
+
+	pr_info("\n");
+}
+
+static void emi_counter_reset(struct device *dev)
+{
+	struct mtk_emi_bw *emi = dev_get_drvdata(dev);
+
+	writel(EMI_BMEN_DEFAULT_VALUE, EMI_BMEN);
+	writel(EMI_MSEL_DEFAULT_VALUE, EMI_MSEL);
+	writel(EMI_MSEL2_DEFAULT_VALUE, EMI_MSEL2);
+	writel(EMI_BMEN2_DEFAULT_VALUE, EMI_BMEN2);
+	writel(EMI_BMRW0_DEFAULT_VALUE, EMI_BMRW0);
+}
+
+static void emi_counter_pause(struct device *dev)
+{
+	struct mtk_emi_bw *emi = dev_get_drvdata(dev);
+	const unsigned int value = readl(EMI_BMEN);
+
+	/* BW monitor */
+	writel(value | BUS_MON_PAUSE, EMI_BMEN);
+}
+
+static void emi_counter_continue(struct device *dev)
+{
+	struct mtk_emi_bw *emi = dev_get_drvdata(dev);
+	const unsigned int value = readl(EMI_BMEN);
+
+	/* BW monitor */
+	writel(value & (~BUS_MON_PAUSE), EMI_BMEN);
+}
+
+static void emi_counter_enable(struct device *dev, const unsigned int enable)
+{
+	unsigned int value, value_set;
+	struct mtk_emi_bw *emi = dev_get_drvdata(dev);
+
+	value = readl(EMI_BMEN);
+	if (!enable) {	/* disable monitor circuit */
+		/*  bit3 =1	bit0 = 0-> clear */
+		value_set = (value) | (BUS_MON_IDLE);
+		writel(value_set, EMI_BMEN);
+
+		value_set = ((value) | (BUS_MON_IDLE)) & ~(BUS_MON_EN);
+		writel(value_set, EMI_BMEN);
+
+		value_set = ((value) & ~(BUS_MON_IDLE)) & ~(BUS_MON_EN);
+		writel(value_set, EMI_BMEN);
+	} else {		/* enable monitor circuit */
+		/*  bit3 =0	&   bit0=1 */
+		value_set = (value & ~(BUS_MON_IDLE));
+		writel(value_set, EMI_BMEN);
+
+		value_set = (value & ~(BUS_MON_IDLE)) | (BUS_MON_EN);
+		writel(value_set, EMI_BMEN);
+	}
+}
+
+static void mtk_emi_mon_start(struct device *dev)
+{
+	emi_counter_enable(dev, 0);
+	emi_counter_reset(dev);
+	emi_counter_enable(dev, 1);
+}
+
+static void mtk_emi_mon_restart(struct device *dev)
+{
+	emi_counter_continue(dev);
+	emi_counter_enable(dev, 0);
+	emi_counter_reset(dev);
+	emi_counter_enable(dev, 1);
+}
+
+static void mtk_emi_mon_stop(struct device *dev)
+{
+	emi_counter_pause(dev);
+}
+
+static ssize_t emi_show_max_bw(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	unsigned long long var, bw_cpu;
+	unsigned int bw_gpu;
+	struct mtk_emi_bw *emi = dev_get_drvdata(dev);
+
+	if (!dev) {
+		pr_warn("dev is null!!\n");
+		return 0;
+	}
+
+	var = mtk_emi_get_max_bw(dev);
+	bw_gpu = readl(EMI_BWVL_4TH) & 0x7f;
+	bw_cpu = readl(EMI_WSCT3);
+
+	return scnprintf(buf, PAGE_SIZE,
+		"gpu_max_bw:%llu(0x%x) EMI_BWVL_4TH:0x%x, cpu:%llu(0x%x)\n",
+		var, var, bw_gpu, bw_cpu, bw_cpu);
+}
+
+DEVICE_ATTR(bw,  0440, emi_show_max_bw, NULL);
+
+static ssize_t emi_dump_bw(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	unsigned long long var;
+
+	if (!dev) {
+		pr_warn("dev is null!!\n");
+		return 0;
+	}
+
+	emi_dump_bw_array(dev);
+	var = mtk_emi_get_max_bw(dev);
+
+	return scnprintf(buf, PAGE_SIZE,
+		"\temi_max_bw:%llu(0x%x)\n", var, var);
+}
+
+DEVICE_ATTR(dump_bw,  0440, emi_dump_bw, NULL);
+
+static int emi_bw_ms = 1;
+module_param_named(bw_ms, emi_bw_ms, int, 0664);
+
+enum hrtimer_restart		emi_bw_timer_callback(struct hrtimer *tm)
+{
+	unsigned long long val, cur_max;
+	struct mtk_emi_bw *emi =
+		container_of(tm, struct mtk_emi_bw, emi_bw_timer);
+
+	/* pasue emi monitor for get WACT value*/
+	mtk_emi_mon_stop(emi->dev);
+
+	val = readl(EMI_WSCT4);	/* GPU BW */
+	val *= 8;
+
+	cur_max = mtk_emi_get_max_bw(emi->dev);
+	emi_update_bw_array(emi->dev, val);
+
+	mtk_emi_mon_restart(emi->dev);
+
+	return HRTIMER_RESTART;	/* timer AUTO restart! */
+}
+
+static int emi_probe(struct platform_device *pdev)
+{
+	struct mtk_emi_bw *emi;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = pdev->dev.of_node;
+	int ret;
+
+	emi = devm_kzalloc(dev, sizeof(*emi), GFP_KERNEL);
+	if (!emi)
+		return -ENOMEM;
+
+	emi->emi_cen_base = of_iomap(np, 0);
+	if (!emi->emi_cen_base) {
+		pr_err("iomap emi_cenbase fail:0x%x!\n", emi->emi_cen_base);
+		return -EINVAL;
+	}
+
+	platform_set_drvdata(pdev, emi);
+	emi->dev = dev;
+	emi->tm_interval = EMI_BW_TIMER_INTERVAL;
+
+	/* start emi bw monitor */
+	mtk_emi_mon_start(dev);
+
+	/* setup timer */
+	emi->kt = ktime_set(0, emi->tm_interval * 1000);
+	emi->emi_bw_timer.function = emi_bw_timer_callback;
+	hrtimer_start(&(emi->emi_bw_timer), emi->kt, HRTIMER_MODE_REL);
+
+	/* debug node */
+	ret = device_create_file(dev, &dev_attr_bw);
+	if (ret) {
+		dev_err(dev, "create bw file failed!\n");
+		goto err_create_attr_bw;
+	}
+	ret = device_create_file(dev, &dev_attr_dump_bw);
+	if (ret) {
+		dev_err(dev, "create dump_bw file failed!\n");
+		goto err_create_attr_dump_bw;
+	}
+
+	return 0;
+
+err_create_attr_dump_bw:
+	hrtimer_cancel(&(emi->emi_bw_timer));
+	device_remove_file(dev, &dev_attr_bw);
+err_create_attr_bw:
+	devm_kfree(dev, emi);
+	return -ENOMEM;
+}
+
+static int emi_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_emi_bw *emi = dev_get_drvdata(dev);
+
+	hrtimer_cancel(&(emi->emi_bw_timer));
+	device_remove_file(dev, &dev_attr_dump_bw);
+	device_remove_file(dev, &dev_attr_bw);
+
+	devm_kfree(dev, emi);
+	return 0;
+}
+
+
+#ifdef CONFIG_OF
+static const struct of_device_id emi_of_ids[] = {
+	{.compatible = "mediatek,mt8183-emi",},
+	{}
+};
+#endif
+
+static struct platform_driver emi_bw_driver = {
+	.probe = emi_probe,
+	.remove = emi_remove,
+	.driver = {
+		.name = "emi_bw",
+		.owner = THIS_MODULE,
+		.pm = NULL,
+#ifdef CONFIG_OF
+		.of_match_table = emi_of_ids,
+#endif
+	},
+};
+
+
+static int __init emi_bw_init(void)
+{
+	int ret;
+
+	/* register EMI ctrl interface */
+	ret = platform_driver_register(&emi_bw_driver);
+	if (ret) {
+		pr_err("fail to register emi_bw_driver\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void __exit emi_bw_exit(void)
+{
+	platform_driver_unregister(&emi_bw_driver);
+}
+
+postcore_initcall(emi_bw_init);
+module_exit(emi_bw_exit);
+
diff --git a/include/soc/mediatek/emi.h b/include/soc/mediatek/emi.h
new file mode 100644
index 0000000..9b885f9
--- /dev/null
+++ b/include/soc/mediatek/emi.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0  */
+/*
+ * Copyright (c) 2015-2016 MediaTek Inc.
+ * Author: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ */
+
+#ifndef _MTK_EMI_H_
+#define _MTK_EMI_H_
+
+#define EMI_REG_BASE_MAPPED         (emi->emi_cen_base)
+
+#define EMI_MDCT                    (EMI_REG_BASE_MAPPED + 0x078)
+#define EMI_MDCT_2ND                (EMI_REG_BASE_MAPPED + 0x07C)
+
+#define EMI_ARBA                    (EMI_REG_BASE_MAPPED + 0x100)
+#define EMI_ARBB                    (EMI_REG_BASE_MAPPED + 0x108)
+#define EMI_ARBC                    (EMI_REG_BASE_MAPPED + 0x110)
+#define EMI_ARBD                    (EMI_REG_BASE_MAPPED + 0x118)
+#define EMI_ARBE                    (EMI_REG_BASE_MAPPED + 0x120)
+#define EMI_ARBF                    (EMI_REG_BASE_MAPPED + 0x128)
+#define EMI_ARBG                    (EMI_REG_BASE_MAPPED + 0x130)
+#define EMI_ARBH                    (EMI_REG_BASE_MAPPED + 0x138)
+
+#define EMI_BMEN                    (EMI_REG_BASE_MAPPED + 0x400)
+#define EMI_BCNT                    (EMI_REG_BASE_MAPPED + 0x408)
+#define EMI_TACT                    (EMI_REG_BASE_MAPPED + 0x410)
+#define EMI_TSCT                    (EMI_REG_BASE_MAPPED + 0x418)
+#define EMI_WACT                    (EMI_REG_BASE_MAPPED + 0x420)
+#define EMI_WSCT                    (EMI_REG_BASE_MAPPED + 0x428)
+#define EMI_BACT                    (EMI_REG_BASE_MAPPED + 0x430)
+#define EMI_BSCT                    (EMI_REG_BASE_MAPPED + 0x438)
+#define EMI_MSEL                    (EMI_REG_BASE_MAPPED + 0x440)
+#define EMI_TSCT2                   (EMI_REG_BASE_MAPPED + 0x448)
+#define EMI_TSCT3                   (EMI_REG_BASE_MAPPED + 0x450)
+#define EMI_WSCT2                   (EMI_REG_BASE_MAPPED + 0x458)
+#define EMI_WSCT3                   (EMI_REG_BASE_MAPPED + 0x460)
+#define EMI_WSCT4                   (EMI_REG_BASE_MAPPED + 0x464)
+#define EMI_MSEL2                   (EMI_REG_BASE_MAPPED + 0x468)
+
+#define EMI_BMEN2                   (EMI_REG_BASE_MAPPED + 0x4E8)
+
+#define EMI_BMRW0                   (EMI_REG_BASE_MAPPED + 0x4F8)
+
+#define EMI_TTYPE1                  (EMI_REG_BASE_MAPPED + 0x500)
+#define EMI_TTYPE17                 (EMI_REG_BASE_MAPPED + 0x580)
+
+#define EMI_BWVL                    (EMI_REG_BASE_MAPPED + 0x7D0)
+#define EMI_BWVL_2ND                (EMI_REG_BASE_MAPPED + 0x7D4)
+#define EMI_BWVL_3RD                (EMI_REG_BASE_MAPPED + 0x7D8)
+#define EMI_BWVL_4TH                (EMI_REG_BASE_MAPPED + 0x7DC)
+#define EMI_BWVL_5TH                (EMI_REG_BASE_MAPPED + 0x7E0)
+
+/*
+ * DEFAULT_VALUE
+ */
+#define EMI_BMEN_DEFAULT_VALUE    (0x00FF0000)
+#define EMI_BMEN2_DEFAULT_VALUE   (0x02000000)
+#define EMI_BMRW0_DEFAULT_VALUE   (0xFFFFFFFF)
+#define EMI_MSEL_DEFAULT_VALUE    (0x00030024)
+#define EMI_MSEL2_DEFAULT_VALUE   (0x000000C0)
+
+/* EMI_BMEN */
+#define BUS_MON_EN          BIT(0)
+#define BUS_MON_PAUSE       BIT(1)
+#define BUS_MON_IDLE        BIT(3)
+
+/* public apis */
+unsigned long long mtk_emi_get_max_bw(struct device *dev);
+
+#endif
-- 
1.9.1
