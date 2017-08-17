From: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [V7] phy: ralink-usb: add driver for Mediatek/Ralink
Date: Thu, 17 Aug 2017 11:33:22 +0100
Message-ID: <1502966003-3776-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>

Add a driver to setup the USB phy on Mediatek/Ralink SoCs.
The driver sets up power and host mode, but also needs to
configure PHY registers for the MT7628 and MT7688.

Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Signed-off-by: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
Changes in V7
* Create ralink sub directory
* Switch from io{read,write}32 to {read,write}l
* Update copyright year
* Remove MIPS specific header
* Use regmap to access sysctl registers
* Parse syscon phandle to get regmap
* Select CONFIG_MFD_SYSCON
* Remove depends on MIPS
* Rearrange probe function

Changes in V6
* Add binding for MT7628
* Configure PHY registers for MT76{2,8}8

Changes in V5
* Depend on MIPS

Changes in V4
* Remove Allwinner from comment
* Depend on COMPILE_TEST

Changes in V3
* Separate DT bindings
* Update Kconfig text
* Modify John's email address
* Rebase onto v4.13-rc3

Changes in V2
* remove refcounting
* drop empty functions
* dont use static globals
* use explicit compatible strings

 drivers/phy/Kconfig                 |   1 +
 drivers/phy/Makefile                |   1 +
 drivers/phy/ralink/Kconfig          |  11 ++
 drivers/phy/ralink/Makefile         |   1 +
 drivers/phy/ralink/phy-ralink-usb.c | 249 ++++++++++++++++++++++++++++++++++++
 5 files changed, 263 insertions(+)
 create mode 100644 drivers/phy/ralink/Kconfig
 create mode 100644 drivers/phy/ralink/Makefile
 create mode 100644 drivers/phy/ralink/phy-ralink-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index c1807d4..3792fd7 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -55,6 +55,7 @@ source "drivers/phy/hisilicon/Kconfig"
 source "drivers/phy/marvell/Kconfig"
 source "drivers/phy/motorola/Kconfig"
 source "drivers/phy/qualcomm/Kconfig"
+source "drivers/phy/ralink/Kconfig"
 source "drivers/phy/renesas/Kconfig"
 source "drivers/phy/rockchip/Kconfig"
 source "drivers/phy/samsung/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index f252201..db9174d 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -18,6 +18,7 @@ obj-y					+= broadcom/	\
 					   marvell/	\
 					   motorola/	\
 					   qualcomm/	\
+					   ralink/	\
 					   samsung/	\
 					   st/		\
 					   ti/
diff --git a/drivers/phy/ralink/Kconfig b/drivers/phy/ralink/Kconfig
new file mode 100644
index 0000000..b17635b
--- /dev/null
+++ b/drivers/phy/ralink/Kconfig
@@ -0,0 +1,11 @@
+#
+# PHY drivers for Ralink platforms.
+#
+config PHY_RALINK_USB
+	tristate "Ralink USB PHY driver"
+	depends on RALINK || COMPILE_TEST
+	select GENERIC_PHY
+	select MFD_SYSCON
+	help
+	  This option enables support for the Ralink USB PHY found inside
+	  RT3352, MT7620, MT7628 and MT7688.
diff --git a/drivers/phy/ralink/Makefile b/drivers/phy/ralink/Makefile
new file mode 100644
index 0000000..5c9e326
--- /dev/null
+++ b/drivers/phy/ralink/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_PHY_RALINK_USB)	+= phy-ralink-usb.o
diff --git a/drivers/phy/ralink/phy-ralink-usb.c b/drivers/phy/ralink/phy-ralink-usb.c
new file mode 100644
index 0000000..cade326
--- /dev/null
+++ b/drivers/phy/ralink/phy-ralink-usb.c
@@ -0,0 +1,249 @@
+/*
+ * Copyright (C) 2017 John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
+ *
+ * Based on code from
+ * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#define RT_SYSC_REG_SYSCFG1		0x014
+#define RT_SYSC_REG_CLKCFG1		0x030
+#define RT_SYSC_REG_USB_PHY_CFG		0x05c
+
+#define OFS_U2_PHY_AC0			0x800
+#define OFS_U2_PHY_AC1			0x804
+#define OFS_U2_PHY_AC2			0x808
+#define OFS_U2_PHY_ACR0			0x810
+#define OFS_U2_PHY_ACR1			0x814
+#define OFS_U2_PHY_ACR2			0x818
+#define OFS_U2_PHY_ACR3			0x81C
+#define OFS_U2_PHY_ACR4			0x820
+#define OFS_U2_PHY_AMON0		0x824
+#define OFS_U2_PHY_DCR0			0x860
+#define OFS_U2_PHY_DCR1			0x864
+#define OFS_U2_PHY_DTM0			0x868
+#define OFS_U2_PHY_DTM1			0x86C
+
+#define RT_RSTCTRL_UDEV			BIT(25)
+#define RT_RSTCTRL_UHST			BIT(22)
+#define RT_SYSCFG1_USB0_HOST_MODE	BIT(10)
+
+#define MT7620_CLKCFG1_UPHY0_CLK_EN	BIT(25)
+#define MT7620_CLKCFG1_UPHY1_CLK_EN	BIT(22)
+#define RT_CLKCFG1_UPHY1_CLK_EN		BIT(20)
+#define RT_CLKCFG1_UPHY0_CLK_EN		BIT(18)
+
+#define USB_PHY_UTMI_8B60M		BIT(1)
+#define UDEV_WAKEUP			BIT(0)
+
+struct ralink_usb_phy {
+	struct reset_control	*rstdev;
+	struct reset_control	*rsthost;
+	u32			clk;
+	struct phy		*phy;
+	void __iomem		*base;
+	struct regmap		*sysctl;
+};
+
+static void u2_phy_w32(struct ralink_usb_phy *phy, u32 val, u32 reg)
+{
+	writel(val, phy->base + reg);
+}
+
+static u32 u2_phy_r32(struct ralink_usb_phy *phy, u32 reg)
+{
+	return readl(phy->base + reg);
+}
+
+static void ralink_usb_phy_init(struct ralink_usb_phy *phy)
+{
+	u2_phy_r32(phy, OFS_U2_PHY_AC2);
+	u2_phy_r32(phy, OFS_U2_PHY_ACR0);
+	u2_phy_r32(phy, OFS_U2_PHY_DCR0);
+
+	u2_phy_w32(phy, 0x00ffff02, OFS_U2_PHY_DCR0);
+	u2_phy_r32(phy, OFS_U2_PHY_DCR0);
+	u2_phy_w32(phy, 0x00555502, OFS_U2_PHY_DCR0);
+	u2_phy_r32(phy, OFS_U2_PHY_DCR0);
+	u2_phy_w32(phy, 0x00aaaa02, OFS_U2_PHY_DCR0);
+	u2_phy_r32(phy, OFS_U2_PHY_DCR0);
+	u2_phy_w32(phy, 0x00000402, OFS_U2_PHY_DCR0);
+	u2_phy_r32(phy, OFS_U2_PHY_DCR0);
+	u2_phy_w32(phy, 0x0048086a, OFS_U2_PHY_AC0);
+	u2_phy_w32(phy, 0x4400001c, OFS_U2_PHY_AC1);
+	u2_phy_w32(phy, 0xc0200000, OFS_U2_PHY_ACR3);
+	u2_phy_w32(phy, 0x02000000, OFS_U2_PHY_DTM0);
+}
+
+static int ralink_usb_phy_power_on(struct phy *_phy)
+{
+	struct ralink_usb_phy *phy = phy_get_drvdata(_phy);
+	u32 t;
+
+	/* enable the phy */
+	regmap_update_bits(phy->sysctl, RT_SYSC_REG_CLKCFG1,
+			   phy->clk, phy->clk);
+
+	/* setup host mode */
+	regmap_update_bits(phy->sysctl, RT_SYSC_REG_SYSCFG1,
+			   RT_SYSCFG1_USB0_HOST_MODE,
+			   RT_SYSCFG1_USB0_HOST_MODE);
+
+	/* deassert the reset lines */
+	reset_control_deassert(phy->rsthost);
+	reset_control_deassert(phy->rstdev);
+
+	/*
+	 * The SDK kernel had a delay of 100ms. however on device
+	 * testing showed that 10ms is enough
+	 */
+	mdelay(10);
+
+	if (phy->base)
+		ralink_usb_phy_init(phy);
+
+	/* print some status info */
+	regmap_read(phy->sysctl, RT_SYSC_REG_USB_PHY_CFG, &t);
+	dev_info(&phy->phy->dev, "remote usb device wakeup %s\n",
+		(t & UDEV_WAKEUP) ? ("enabled") : ("disabled"));
+	if (t & USB_PHY_UTMI_8B60M)
+		dev_info(&phy->phy->dev, "UTMI 8bit 60MHz\n");
+	else
+		dev_info(&phy->phy->dev, "UTMI 16bit 30MHz\n");
+
+	return 0;
+}
+
+static int ralink_usb_phy_power_off(struct phy *_phy)
+{
+	struct ralink_usb_phy *phy = phy_get_drvdata(_phy);
+
+	/* disable the phy */
+	regmap_update_bits(phy->sysctl, RT_SYSC_REG_CLKCFG1,
+			   phy->clk, 0);
+
+	/* assert the reset lines */
+	reset_control_assert(phy->rstdev);
+	reset_control_assert(phy->rsthost);
+
+	return 0;
+}
+
+static struct phy_ops ralink_usb_phy_ops = {
+	.power_on	= ralink_usb_phy_power_on,
+	.power_off	= ralink_usb_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static const struct of_device_id ralink_usb_phy_of_match[] = {
+	{
+		.compatible = "ralink,rt3352-usbphy",
+		.data = (void *) (RT_CLKCFG1_UPHY1_CLK_EN |
+				  RT_CLKCFG1_UPHY0_CLK_EN)
+	},
+	{
+		.compatible = "mediatek,mt7620-usbphy",
+		.data = (void *) (MT7620_CLKCFG1_UPHY1_CLK_EN |
+				  MT7620_CLKCFG1_UPHY0_CLK_EN)
+	},
+	{
+		.compatible = "mediatek,mt7628-usbphy",
+		.data = (void *) (MT7620_CLKCFG1_UPHY1_CLK_EN |
+				  MT7620_CLKCFG1_UPHY0_CLK_EN) },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ralink_usb_phy_of_match);
+
+static int ralink_usb_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct phy_provider *phy_provider;
+	const struct of_device_id *match;
+	struct ralink_usb_phy *phy;
+
+	match = of_match_device(ralink_usb_phy_of_match, &pdev->dev);
+	if (!match)
+		return -ENODEV;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	phy->clk = (int) match->data;
+	phy->base = NULL;
+
+	phy->sysctl = syscon_regmap_lookup_by_phandle(dev->of_node, "ralink,sysctl");
+	if (IS_ERR(phy->sysctl)) {
+		dev_err(dev, "failed to get sysctl registers\n");
+		return PTR_ERR(phy->sysctl);
+	}
+
+	/* The MT7628 and MT7688 require extra setup of PHY registers. */
+	if (of_device_is_compatible(dev->of_node, "mediatek,mt7628-usbphy")) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		phy->base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(phy->base)) {
+			dev_err(dev, "failed to remap register memory\n");
+			return PTR_ERR(phy->base);
+		}
+	}
+
+	phy->rsthost = devm_reset_control_get(&pdev->dev, "host");
+	if (IS_ERR(phy->rsthost)) {
+		dev_err(dev, "host reset is missing\n");
+		return PTR_ERR(phy->rsthost);
+	}
+
+	phy->rstdev = devm_reset_control_get(&pdev->dev, "device");
+	if (IS_ERR(phy->rstdev)) {
+		dev_err(dev, "device reset is missing\n");
+		return PTR_ERR(phy->rstdev);
+	}
+
+	phy->phy = devm_phy_create(dev, NULL, &ralink_usb_phy_ops);
+	if (IS_ERR(phy->phy)) {
+		dev_err(dev, "failed to create PHY\n");
+		return PTR_ERR(phy->phy);
+	}
+	phy_set_drvdata(phy->phy, phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver ralink_usb_phy_driver = {
+	.probe	= ralink_usb_phy_probe,
+	.driver = {
+		.of_match_table	= ralink_usb_phy_of_match,
+		.name  = "ralink-usb-phy",
+	}
+};
+module_platform_driver(ralink_usb_phy_driver);
+
+MODULE_DESCRIPTION("Ralink USB phy driver");
+MODULE_AUTHOR("John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
