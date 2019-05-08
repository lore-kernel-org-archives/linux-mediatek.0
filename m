From: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] [v3,2/2] mt8183: emi: add bandwidth driver support
Date: Wed, 8 May 2019 13:45:38 +0800
Message-ID: <1557294338-24713-1-git-send-email-xixi.chen@mediatek.com>
References: <mt8183 emi driver>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <mt8183 emi driver>
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
 drivers/memory/mtk-emi.c   | 395 +++++++++++++++++++++++++++++++++++++++++++++
 include/soc/mediatek/emi.h | 116 +++++++++++++
 4 files changed, 521 insertions(+)
 create mode 100644 drivers/memory/mtk-emi.c
 create mode 100644 include/soc/mediatek/emi.h

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 2d91b00..2a76bfe 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -129,6 +129,15 @@ config JZ4780_NEMC
 	  the Ingenic JZ4780. This controller is used to handle external
 	  memory devices such as NAND and SRAM.
 
+config MTK_EMI_MBW
+	bool "Mediatek EMI bandwidth driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  This driver is for MTK EMI control.
+	  If unsure, use N.
+	  This is the first time emi upstream.
+	  Only support emi bw statistics.
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
index 0000000..20181d5
--- /dev/null
+++ b/drivers/memory/mtk-emi.c
@@ -0,0 +1,395 @@
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
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/time.h>
+#include <linux/timer.h>
+#include <soc/mediatek/emi.h>
+
+/* 67ms emi bw  */
+#define EMI_BW_ARRAY_SIZE	67
+
+#define MT8173_SMI_LARB_NR	6
+#define MT8167_SMI_LARB_NR	3
+#define MTK_SMI_LARB_NR_MAX	8
+#define MT8173_MMU_EN		0xf00
+#define MT8167_MMU_EN		0xfc0
+#define MT8167_LARB0_OFF	0
+#define MT8167_LARB1_OFF	8
+#define MT8167_LARB2_OFF	21
+
+/*****************************************************************************
+ *  Type Definitions
+ *****************************************************************************/
+enum DDRTYPE {
+	TYPE_LPDDR3 = 1,
+	TYPE_LPDDR4,
+	TYPE_LPDDR4X
+};
+
+struct mtk_emi {
+	void __iomem *cen_emi_base;
+	void __iomem *chn_emi_base[MAX_CH];
+	void __iomem *emi_mpu_base;
+
+	struct timer_list emi_bw_timer;
+	struct timeval old_tv;
+
+	unsigned long long emi_bw_array[EMI_BW_ARRAY_SIZE];
+	int emi_bw_cur_idx;
+};
+
+/* because timer can't pass argument, so add the global
+ * static struct device * for timer callback usage
+ */
+static struct device *emi_dev;
+
+unsigned long long emi_get_max_bw_in_last_array(struct device *dev,
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
+unsigned long long mtk_emi_get_max_bw(void)
+{
+	struct mtk_emi *emi;
+
+	if (!emi_dev)
+		return 0;
+
+	emi = dev_get_drvdata(emi_dev);
+	return emi_get_max_bw_in_last_array(emi_dev,
+		emi->emi_bw_array, ARRAY_SIZE(emi->emi_bw_array));
+}
+EXPORT_SYMBOL(mtk_emi_get_max_bw);
+
+static void emi_update_bw_array(struct device *dev, unsigned int val)
+{
+	struct mtk_emi *emi = dev_get_drvdata(emi_dev);
+
+	if (emi->emi_bw_cur_idx == emi->EMI_BW_ARRAY_SIZE) {
+		/* remove the first array element */
+		memmove(emi->emi_bw_array, emi->emi_bw_array + 1,
+			sizeof(unsigned long long) * (emi->EMI_BW_ARRAY_SIZE - 1));
+		emi->emi_bw_array[emi->EMI_BW_ARRAY_SIZE - 1] = val;
+	} else
+		emi->emi_bw_array[emi->emi_bw_cur_idx++] = val;
+}
+
+static void emi_dump_bw_array(struct device *dev)
+{
+	int i = 0;
+	const int unit = 10;
+	struct mtk_emi *emi = dev_get_drvdata(emi_dev);
+
+	while (i < emi->EMI_BW_ARRAY_SIZE) {
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
+	struct mtk_emi *emi = dev_get_drvdata(dev);
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
+	struct mtk_emi *emi = dev_get_drvdata(dev);
+	const unsigned int value = readl(EMI_BMEN);
+
+	/* BW monitor */
+	writel(value | BUS_MON_PAUSE, EMI_BMEN);
+}
+
+static void emi_counter_continue(struct device *dev)
+{
+	struct mtk_emi *emi = dev_get_drvdata(dev);
+	const unsigned int value = readl(EMI_BMEN);
+
+	/* BW monitor */
+	writel(value & (~BUS_MON_PAUSE), EMI_BMEN);
+}
+
+static void emi_counter_enable(struct device *dev, const unsigned int enable)
+{
+	unsigned int value, value_set;
+	struct mtk_emi *emi = dev_get_drvdata(dev);
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
+/*****************************************************************************
+ *  APIs
+ *****************************************************************************/
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
+	struct mtk_emi *emi = dev_get_drvdata(dev);
+
+	if (!dev) {
+		pr_warn("dev is null!!\n");
+		return 0;
+	}
+
+	var = mtk_emi_get_max_bw();
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
+	var = mtk_emi_get_max_bw();
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
+static void emi_bw_timer_callback(struct timer_list *tm)
+{
+	struct timeval tv;
+	unsigned long long val, cur_max;
+	struct mtk_emi *emi = from_timer(mtk_emi, tm, emi_bw_timer);
+
+	do_gettimeofday(&tv);
+
+	/* pasue emi monitor for get WACT value*/
+	mtk_emi_mon_stop(emi_dev);
+
+	val = readl(EMI_WSCT4);	/* GPU BW */
+	val *= 8;
+
+	cur_max = mtk_emi_get_max_bw();
+	emi_update_bw_array(emi_dev, val);
+
+	/* set mew timer expires and restart emi monitor */
+	emi->old_tv = tv;
+	emi->emi_bw_timer.expires = jiffies + msecs_to_jiffies(emi_bw_ms);
+
+	add_timer(&(emi->emi_bw_timer));
+	mtk_emi_mon_restart(emi_dev);
+}
+
+static int emi_probe(struct platform_device *pdev)
+{
+	struct mtk_emi *emi;
+	struct resource *res;
+	struct device *dev = &pdev->dev;
+	int i, ret;
+
+	emi = devm_kzalloc(dev, sizeof(*emi), GFP_KERNEL);
+	if (!emi)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	emi->cen_emi_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(emi->cen_emi_base)) {
+		pr_err("[EMI] unable to map cen_emi_base\n");
+		devm_kfree(dev, emi);
+		return -EINVAL;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	emi->emi_mpu_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(emi->emi_mpu_base)) {
+		pr_err("[EMI] unable to map emi_mpu_base\n");
+		devm_kfree(dev, emi);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < MAX_CH; i++) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 2 + i);
+		emi->chn_emi_base[i] = devm_ioremap_resource(dev, res);
+		if (IS_ERR(emi->chn_emi_base[i])) {
+			pr_err("[EMI] unable to map ch%d_emi_base\n", i);
+			devm_kfree(dev, emi);
+			return -EINVAL;
+		}
+	}
+
+	platform_set_drvdata(pdev, emi);
+
+	emi_dev = dev;
+	/* start emi bw monitor */
+	mtk_emi_mon_start(dev);
+
+	/* setup timer */
+	timer_setup(&(emi->emi_bw_timer), NULL, 0);
+	do_gettimeofday(&(emi->old_tv));
+
+	emi->emi_bw_timer.function = emi_bw_timer_callback;
+	emi->emi_bw_timer.expires = jiffies + msecs_to_jiffies(1);
+	add_timer(&(emi->emi_bw_timer));
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
+	del_timer(&(emi->emi_bw_timer));
+	device_remove_file(dev, &dev_attr_bw);
+err_create_attr_bw:
+	devm_kfree(dev, emi);
+	return -ENOMEM;
+}
+
+static int emi_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_emi *emi = dev_get_drvdata(dev);
+
+	del_timer(&(emi->emi_bw_timer));
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
+		pr_err("[EMI/BWL] fail to register emi_bw_driver\n");
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
index 0000000..83bdaeb
--- /dev/null
+++ b/include/soc/mediatek/emi.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0  */
+/*
+ * Copyright (c) 2015-2016 MediaTek Inc.
+ * Author: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ */
+
+#ifndef _MTK_EMI_H_
+#define _MTK_EMI_H_
+
+#define MAX_CH		2
+#define MAX_RK		2
+
+struct emi_info_t {
+	unsigned int dram_type;
+	unsigned int ch_num;
+	unsigned int rk_num;
+	unsigned int rank_size[MAX_RK];
+};
+
+/*****************************************************************************
+ *  Macro Definiations
+ *****************************************************************************/
+#define EMI_REG_BASE                (0x10219000)
+#define EMI_REG_BASE_MAPPED         (emi->cen_emi_base)
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
+#define EMI_CH0_REG_BASE            (0x1022D000)
+#define EMI_CH0_REG_BASE_MAPPED     (emi->chn_emi_base[0])
+#define EMI_CH0_DRS_ST2             (EMI_CH0_REG_BASE_MAPPED + 0x17C)
+#define EMI_CH0_DRS_ST3             (EMI_CH0_REG_BASE_MAPPED + 0x180)
+#define EMI_CH0_DRS_ST4             (EMI_CH0_REG_BASE_MAPPED + 0x184)
+
+#define EMI_CH1_REG_BASE            (0x10235000)
+#define EMI_CH1_REG_BASE_MAPPED     (emi->chn_emi_base[1])
+#define EMI_CH1_DRS_ST2             (EMI_CH1_REG_BASE_MAPPED + 0x17C)
+#define EMI_CH1_DRS_ST3             (EMI_CH1_REG_BASE_MAPPED + 0x180)
+#define EMI_CH1_DRS_ST4             (EMI_CH1_REG_BASE_MAPPED + 0x184)
+
+/*
+ * DEFAULT_VALUE
+ */
+#define EMI_BMEN_DEFAULT_VALUE    (0x00FF0000)
+#define EMI_BMEN2_DEFAULT_VALUE   (0x02000000)
+#define EMI_BMRW0_DEFAULT_VALUE   (0xFFFFFFFF)
+#define EMI_MSEL_DEFAULT_VALUE    (0x00030024)
+#define EMI_MSEL2_DEFAULT_VALUE   (0x000000C0)
+#define BC_OVERRUN                (0x00000100)
+
+/* EMI_BMEN */
+#define BUS_MON_EN          BIT(0)
+#define BUS_MON_PAUSE       BIT(1)
+#define BUS_MON_IDLE        BIT(3)
+
+#define MAX_DRAM_CH_NUM     (2)
+#define DRAM_RANK_NUM       (2)
+#define DRAM_PDIR_NUM       (8)
+#define EMI_TTYPE_NUM       (21)
+#define EMI_TSCT_NUM        (3)
+#define EMI_MDCT_NUM        (2)
+#define EMI_DRS_ST_NUM      (3)
+#define EMI_BW_LIMIT_NUM    (8)
+
+#define DRAMC_CG_SHIFT      (9)
+
+#define EMI_IDX_SIZE        (1024)
+
+#define EMI_BWVL_UNIT       (271)
+
+#define MBW_BUF_LEN         (0x800000)
+#define DATA_CNT_PER_BLK    (35)
+#define BLK_CNT_PER_BUF     (0x800)
+
+/* public apis */
+unsigned long long emi_get_max_bw(void);
+
+#endif
-- 
1.9.1
