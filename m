From: John Crispin <john@phrozen.org>
Subject: Re: [V3 1/2] phy: ralink-usb: add driver for Mediatek/Ralink
Date: Thu, 3 Aug 2017 13:56:07 +0200
Message-ID: <3e78faeb-4da0-75b5-bfb4-0ffa9548c29d@phrozen.org>
References: <1501756323-61555-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501756323-61555-1-git-send-email-harvey.hunt@imgtec.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Harvey Hunt <harvey.hunt@imgtec.com>, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, kishon@ti.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Harvey,

Thanks for picking up my stale patch. small comment inline ...


On 03/08/17 12:32, Harvey Hunt wrote:
> From: John Crispin <john@phrozen.org>
>
> Add a driver to setup the USB phy on Mediatek/Ralink SoCs.
> The driver is trivial and only sets up power and host mode.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> ---
> Changes in V3
> * Separate DT bindings
> * Update Kconfig text
> * Modify John's email address
> * Rebase onto v4.13-rc3
>
> Changes in V2
> * remove refcounting
> * drop empty functions
> * dont use static globals
> * use explicit compatible strings
>
>   drivers/phy/Kconfig          |   8 ++
>   drivers/phy/Makefile         |   1 +
>   drivers/phy/phy-ralink-usb.c | 175 +++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 184 insertions(+)
>   create mode 100644 drivers/phy/phy-ralink-usb.c
>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index c1807d4..79f966a 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -41,6 +41,14 @@ config PHY_PISTACHIO_USB
>   	help
>   	  Enable this to support the USB2.0 PHY on the IMG Pistachio SoC.
>   
> +config PHY_RALINK_USB
> +	tristate "Ralink USB PHY driver"
> +	select GENERIC_PHY
> +	depends on RALINK
> +	help
> +	  This option enables support for the Ralink USB PHY found inside
> +	  RT3352, MT7620, MT7628 and MT7688.
> +
>   config PHY_XGENE
>   	tristate "APM X-Gene 15Gbps PHY support"
>   	depends on HAS_IOMEM && OF && (ARM64 || COMPILE_TEST)
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index f252201..60ed30b 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
>   obj-$(CONFIG_PHY_MT65XX_USB3)		+= phy-mt65xx-usb3.o
>   obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
>   obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
> +obj-$(CONFIG_PHY_RALINK_USB)		+= phy-ralink-usb.o
>   
>   obj-$(CONFIG_ARCH_SUNXI)		+= allwinner/
>   obj-$(CONFIG_ARCH_MESON)		+= amlogic/
> diff --git a/drivers/phy/phy-ralink-usb.c b/drivers/phy/phy-ralink-usb.c
> new file mode 100644
> index 0000000..c693fb1
> --- /dev/null
> +++ b/drivers/phy/phy-ralink-usb.c
> @@ -0,0 +1,175 @@
> +/*
> + * Allwinner ralink USB phy driver
We should remove the "Allwinner" from the header

     John



> + *
> + * Copyright (C) 2016 John Crispin <john@phrozen.org>
> + *
> + * Based on code from
> + * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/of_platform.h>
> +
> +#include <asm/mach-ralink/ralink_regs.h>
> +
> +#define RT_SYSC_REG_SYSCFG1		0x014
> +#define RT_SYSC_REG_CLKCFG1		0x030
> +#define RT_SYSC_REG_USB_PHY_CFG		0x05c
> +
> +#define RT_RSTCTRL_UDEV			BIT(25)
> +#define RT_RSTCTRL_UHST			BIT(22)
> +#define RT_SYSCFG1_USB0_HOST_MODE	BIT(10)
> +
> +#define MT7620_CLKCFG1_UPHY0_CLK_EN	BIT(25)
> +#define MT7620_CLKCFG1_UPHY1_CLK_EN	BIT(22)
> +#define RT_CLKCFG1_UPHY1_CLK_EN		BIT(20)
> +#define RT_CLKCFG1_UPHY0_CLK_EN		BIT(18)
> +
> +#define USB_PHY_UTMI_8B60M		BIT(1)
> +#define UDEV_WAKEUP			BIT(0)
> +
> +struct ralink_usb_phy {
> +	struct reset_control	*rstdev;
> +	struct reset_control	*rsthost;
> +	u32			clk;
> +	struct phy		*phy;
> +};
> +
> +static int ralink_usb_phy_power_on(struct phy *_phy)
> +{
> +	struct ralink_usb_phy *phy = phy_get_drvdata(_phy);
> +	u32 t;
> +
> +	/* enable the phy */
> +	rt_sysc_m32(0, phy->clk, RT_SYSC_REG_CLKCFG1);
> +
> +	/* setup host mode */
> +	rt_sysc_m32(0, RT_SYSCFG1_USB0_HOST_MODE, RT_SYSC_REG_SYSCFG1);
> +
> +	/* deassert the reset lines */
> +	reset_control_deassert(phy->rsthost);
> +	reset_control_deassert(phy->rstdev);
> +
> +	/*
> +	 * The SDK kernel had a delay of 100ms. however on device
> +	 * testing showed that 10ms is enough
> +	 */
> +	mdelay(10);
> +
> +	/* print some status info */
> +	t = rt_sysc_r32(RT_SYSC_REG_USB_PHY_CFG);
> +	dev_info(&phy->phy->dev, "remote usb device wakeup %s\n",
> +		(t & UDEV_WAKEUP) ? ("enabled") : ("disabled"));
> +	if (t & USB_PHY_UTMI_8B60M)
> +		dev_info(&phy->phy->dev, "UTMI 8bit 60MHz\n");
> +	else
> +		dev_info(&phy->phy->dev, "UTMI 16bit 30MHz\n");
> +
> +	return 0;
> +}
> +
> +static int ralink_usb_phy_power_off(struct phy *_phy)
> +{
> +	struct ralink_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +	/* disable the phy */
> +	rt_sysc_m32(phy->clk, 0, RT_SYSC_REG_CLKCFG1);
> +
> +	/* assert the reset lines */
> +	reset_control_assert(phy->rstdev);
> +	reset_control_assert(phy->rsthost);
> +
> +	return 0;
> +}
> +
> +static struct phy_ops ralink_usb_phy_ops = {
> +	.power_on	= ralink_usb_phy_power_on,
> +	.power_off	= ralink_usb_phy_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct of_device_id ralink_usb_phy_of_match[] = {
> +	{
> +		.compatible = "ralink,rt3352-usbphy",
> +		.data = (void *) (RT_CLKCFG1_UPHY1_CLK_EN |
> +				  RT_CLKCFG1_UPHY0_CLK_EN)
> +	},
> +	{
> +		.compatible = "mediatek,mt7620-usbphy",
> +		.data = (void *) (MT7620_CLKCFG1_UPHY1_CLK_EN |
> +				  MT7620_CLKCFG1_UPHY0_CLK_EN) },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ralink_usb_phy_of_match);
> +
> +static int ralink_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *phy_provider;
> +	const struct of_device_id *match;
> +	struct ralink_usb_phy *phy;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	match = of_match_device(ralink_usb_phy_of_match, &pdev->dev);
> +	if (!match)
> +		return -ENODEV;
> +
> +	phy->clk = (int) match->data;
> +
> +	phy->rsthost = devm_reset_control_get(&pdev->dev, "host");
> +	if (IS_ERR(phy->rsthost)) {
> +		dev_err(dev, "host reset is missing\n");
> +		return PTR_ERR(phy->rsthost);
> +	}
> +
> +	phy->rstdev = devm_reset_control_get(&pdev->dev, "device");
> +	if (IS_ERR(phy->rstdev)) {
> +		dev_err(dev, "device reset is missing\n");
> +		return PTR_ERR(phy->rstdev);
> +	}
> +
> +	phy->phy = devm_phy_create(dev, NULL, &ralink_usb_phy_ops);
> +	if (IS_ERR(phy->phy)) {
> +		dev_err(dev, "failed to create PHY\n");
> +		return PTR_ERR(phy->phy);
> +	}
> +	phy_set_drvdata(phy->phy, phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static struct platform_driver ralink_usb_phy_driver = {
> +	.probe	= ralink_usb_phy_probe,
> +	.driver = {
> +		.of_match_table	= ralink_usb_phy_of_match,
> +		.name  = "ralink-usb-phy",
> +	}
> +};
> +module_platform_driver(ralink_usb_phy_driver);
> +
> +MODULE_DESCRIPTION("Ralink USB phy driver");
> +MODULE_AUTHOR("John Crispin <john@phrozen.org>");
> +MODULE_LICENSE("GPL v2");
