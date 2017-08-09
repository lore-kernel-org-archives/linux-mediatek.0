From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [V4 1/2] phy: ralink-usb: add driver for Mediatek/Ralink
Date: Wed, 09 Aug 2017 23:23:29 +0100
Message-ID: <F7B73EAF-B32D-4FBC-BE9D-855954027CC0@imgtec.com>
References: <1502271340-29001-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502271340-29001-1-git-send-email-harvey.hunt@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Harvey Hunt <harvey.hunt@imgtec.com>, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, kishon@ti.com
Cc: John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 9 August 2017 10:35:39 BST, Harvey Hunt <harvey=2Ehunt@imgtec=2Ecom> wro=
te:
>From: John Crispin <john@phrozen=2Eorg>
>
>Add a driver to setup the USB phy on Mediatek/Ralink SoCs=2E
>The driver is trivial and only sets up power and host mode=2E
>
>Signed-off-by: John Crispin <john@phrozen=2Eorg>
>Signed-off-by: Harvey Hunt <harvey=2Ehunt@imgtec=2Ecom>
>Cc: linux-kernel@vger=2Ekernel=2Eorg
>Cc: linux-mediatek@lists=2Einfradead=2Eorg
>---
>Changes in V4
>* Remove Allwinner from comment
>* Depend on COMPILE_TEST
>
>Changes in V3
>* Separate DT bindings
>* Update Kconfig text
>* Modify John's email address
>* Rebase onto v4=2E13-rc3
>
>Changes in V2
>* remove refcounting
>* drop empty functions
>* dont use static globals
>* use explicit compatible strings
>
> drivers/phy/Kconfig          |   8 ++
> drivers/phy/Makefile         |   1 +
>drivers/phy/phy-ralink-usb=2Ec | 173
>+++++++++++++++++++++++++++++++++++++++++++
> 3 files changed, 182 insertions(+)
> create mode 100644 drivers/phy/phy-ralink-usb=2Ec
>
>diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>index c1807d4=2E=2E8fb5260 100644
>--- a/drivers/phy/Kconfig
>+++ b/drivers/phy/Kconfig
>@@ -41,6 +41,14 @@ config PHY_PISTACHIO_USB
> 	help
> 	  Enable this to support the USB2=2E0 PHY on the IMG Pistachio SoC=2E
>=20
>+config PHY_RALINK_USB
>+	tristate "Ralink USB PHY driver"
>+	select GENERIC_PHY
>+	depends on RALINK || COMPILE_TEST

given that the driver includes a asm/mach-ralink header, the COMPILE_TEST =
bit may break x86 allmodconfig?

maybe the header should be moved out of arch/mips or it should depend on M=
IPS only (so a mips allmodconfig catches it, but cant be enabled on x86 eve=
n with COMPILE_TEST=3Dy)

cheers
James

>+	help
>+	  This option enables support for the Ralink USB PHY found inside
>+	  RT3352, MT7620, MT7628 and MT7688=2E
>+
> config PHY_XGENE
> 	tristate "APM X-Gene 15Gbps PHY support"
> 	depends on HAS_IOMEM && OF && (ARM64 || COMPILE_TEST)
>diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>index f252201=2E=2E60ed30b 100644
>--- a/drivers/phy/Makefile
>+++ b/drivers/phy/Makefile
>@@ -7,6 +7,7 @@ obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+=3D
>phy-lpc18xx-usb-otg=2Eo
> obj-$(CONFIG_PHY_MT65XX_USB3)		+=3D phy-mt65xx-usb3=2Eo
> obj-$(CONFIG_PHY_XGENE)			+=3D phy-xgene=2Eo
> obj-$(CONFIG_PHY_PISTACHIO_USB)		+=3D phy-pistachio-usb=2Eo
>+obj-$(CONFIG_PHY_RALINK_USB)		+=3D phy-ralink-usb=2Eo
>=20
> obj-$(CONFIG_ARCH_SUNXI)		+=3D allwinner/
> obj-$(CONFIG_ARCH_MESON)		+=3D amlogic/
>diff --git a/drivers/phy/phy-ralink-usb=2Ec
>b/drivers/phy/phy-ralink-usb=2Ec
>new file mode 100644
>index 0000000=2E=2E14a254a
>--- /dev/null
>+++ b/drivers/phy/phy-ralink-usb=2Ec
>@@ -0,0 +1,173 @@
>+/*
>+ * Copyright (C) 2016 John Crispin <john@phrozen=2Eorg>
>+ *
>+ * Based on code from
>+ * Allwinner Technology Co=2E, Ltd=2E <www=2Eallwinnertech=2Ecom>
>+ *
>+ * This program is free software; you can redistribute it and/or
>modify
>+ * it under the terms of the GNU General Public License as published
>by
>+ * the Free Software Foundation; either version 2 of the License, or
>+ * (at your option) any later version=2E
>+ *
>+ * This program is distributed in the hope that it will be useful,
>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>+ * GNU General Public License for more details=2E
>+ */
>+
>+#include <linux/delay=2Eh>
>+#include <linux/err=2Eh>
>+#include <linux/io=2Eh>
>+#include <linux/kernel=2Eh>
>+#include <linux/module=2Eh>
>+#include <linux/mutex=2Eh>
>+#include <linux/phy/phy=2Eh>
>+#include <linux/platform_device=2Eh>
>+#include <linux/reset=2Eh>
>+#include <linux/of_platform=2Eh>
>+
>+#include <asm/mach-ralink/ralink_regs=2Eh>
>+
>+#define RT_SYSC_REG_SYSCFG1		0x014
>+#define RT_SYSC_REG_CLKCFG1		0x030
>+#define RT_SYSC_REG_USB_PHY_CFG		0x05c
>+
>+#define RT_RSTCTRL_UDEV			BIT(25)
>+#define RT_RSTCTRL_UHST			BIT(22)
>+#define RT_SYSCFG1_USB0_HOST_MODE	BIT(10)
>+
>+#define MT7620_CLKCFG1_UPHY0_CLK_EN	BIT(25)
>+#define MT7620_CLKCFG1_UPHY1_CLK_EN	BIT(22)
>+#define RT_CLKCFG1_UPHY1_CLK_EN		BIT(20)
>+#define RT_CLKCFG1_UPHY0_CLK_EN		BIT(18)
>+
>+#define USB_PHY_UTMI_8B60M		BIT(1)
>+#define UDEV_WAKEUP			BIT(0)
>+
>+struct ralink_usb_phy {
>+	struct reset_control	*rstdev;
>+	struct reset_control	*rsthost;
>+	u32			clk;
>+	struct phy		*phy;
>+};
>+
>+static int ralink_usb_phy_power_on(struct phy *_phy)
>+{
>+	struct ralink_usb_phy *phy =3D phy_get_drvdata(_phy);
>+	u32 t;
>+
>+	/* enable the phy */
>+	rt_sysc_m32(0, phy->clk, RT_SYSC_REG_CLKCFG1);
>+
>+	/* setup host mode */
>+	rt_sysc_m32(0, RT_SYSCFG1_USB0_HOST_MODE, RT_SYSC_REG_SYSCFG1);
>+
>+	/* deassert the reset lines */
>+	reset_control_deassert(phy->rsthost);
>+	reset_control_deassert(phy->rstdev);
>+
>+	/*
>+	 * The SDK kernel had a delay of 100ms=2E however on device
>+	 * testing showed that 10ms is enough
>+	 */
>+	mdelay(10);
>+
>+	/* print some status info */
>+	t =3D rt_sysc_r32(RT_SYSC_REG_USB_PHY_CFG);
>+	dev_info(&phy->phy->dev, "remote usb device wakeup %s\n",
>+		(t & UDEV_WAKEUP) ? ("enabled") : ("disabled"));
>+	if (t & USB_PHY_UTMI_8B60M)
>+		dev_info(&phy->phy->dev, "UTMI 8bit 60MHz\n");
>+	else
>+		dev_info(&phy->phy->dev, "UTMI 16bit 30MHz\n");
>+
>+	return 0;
>+}
>+
>+static int ralink_usb_phy_power_off(struct phy *_phy)
>+{
>+	struct ralink_usb_phy *phy =3D phy_get_drvdata(_phy);
>+
>+	/* disable the phy */
>+	rt_sysc_m32(phy->clk, 0, RT_SYSC_REG_CLKCFG1);
>+
>+	/* assert the reset lines */
>+	reset_control_assert(phy->rstdev);
>+	reset_control_assert(phy->rsthost);
>+
>+	return 0;
>+}
>+
>+static struct phy_ops ralink_usb_phy_ops =3D {
>+	=2Epower_on	=3D ralink_usb_phy_power_on,
>+	=2Epower_off	=3D ralink_usb_phy_power_off,
>+	=2Eowner		=3D THIS_MODULE,
>+};
>+
>+static const struct of_device_id ralink_usb_phy_of_match[] =3D {
>+	{
>+		=2Ecompatible =3D "ralink,rt3352-usbphy",
>+		=2Edata =3D (void *) (RT_CLKCFG1_UPHY1_CLK_EN |
>+				  RT_CLKCFG1_UPHY0_CLK_EN)
>+	},
>+	{
>+		=2Ecompatible =3D "mediatek,mt7620-usbphy",
>+		=2Edata =3D (void *) (MT7620_CLKCFG1_UPHY1_CLK_EN |
>+				  MT7620_CLKCFG1_UPHY0_CLK_EN) },
>+	{ },
>+};
>+MODULE_DEVICE_TABLE(of, ralink_usb_phy_of_match);
>+
>+static int ralink_usb_phy_probe(struct platform_device *pdev)
>+{
>+	struct device *dev =3D &pdev->dev;
>+	struct phy_provider *phy_provider;
>+	const struct of_device_id *match;
>+	struct ralink_usb_phy *phy;
>+
>+	phy =3D devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>+	if (!phy)
>+		return -ENOMEM;
>+
>+	match =3D of_match_device(ralink_usb_phy_of_match, &pdev->dev);
>+	if (!match)
>+		return -ENODEV;
>+
>+	phy->clk =3D (int) match->data;
>+
>+	phy->rsthost =3D devm_reset_control_get(&pdev->dev, "host");
>+	if (IS_ERR(phy->rsthost)) {
>+		dev_err(dev, "host reset is missing\n");
>+		return PTR_ERR(phy->rsthost);
>+	}
>+
>+	phy->rstdev =3D devm_reset_control_get(&pdev->dev, "device");
>+	if (IS_ERR(phy->rstdev)) {
>+		dev_err(dev, "device reset is missing\n");
>+		return PTR_ERR(phy->rstdev);
>+	}
>+
>+	phy->phy =3D devm_phy_create(dev, NULL, &ralink_usb_phy_ops);
>+	if (IS_ERR(phy->phy)) {
>+		dev_err(dev, "failed to create PHY\n");
>+		return PTR_ERR(phy->phy);
>+	}
>+	phy_set_drvdata(phy->phy, phy);
>+
>+	phy_provider =3D devm_of_phy_provider_register(dev,
>of_phy_simple_xlate);
>+
>+	return PTR_ERR_OR_ZERO(phy_provider);
>+}
>+
>+static struct platform_driver ralink_usb_phy_driver =3D {
>+	=2Eprobe	=3D ralink_usb_phy_probe,
>+	=2Edriver =3D {
>+		=2Eof_match_table	=3D ralink_usb_phy_of_match,
>+		=2Ename  =3D "ralink-usb-phy",
>+	}
>+};
>+module_platform_driver(ralink_usb_phy_driver);
>+
>+MODULE_DESCRIPTION("Ralink USB phy driver");
>+MODULE_AUTHOR("John Crispin <john@phrozen=2Eorg>");
>+MODULE_LICENSE("GPL v2");


--
James Hogan
