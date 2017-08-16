From: Harvey Hunt <Harvey.Hunt@imgtec.com>
Subject: Re: [V6 1/2] phy: ralink-usb: add driver for Mediatek/Ralink
Date: Wed, 16 Aug 2017 17:02:51 +0100
Message-ID: <65c77bba-2c92-92f2-c92b-ccba35ff3aaf@imgtec.com>
References: <1502801223-20833-1-git-send-email-harvey.hunt@imgtec.com>
 <16e3c1c7-f2df-984f-1965-a4b48a9094be@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <16e3c1c7-f2df-984f-1965-a4b48a9094be@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com
Cc: james.hogan@imgtec.com, John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Kishon,

Thanks for the review.

On 16/08/17 14:57, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Tuesday 15 August 2017 06:17 PM, Harvey Hunt wrote:
>> From: John Crispin <john@phrozen.org>
>>
>> Add a driver to setup the USB phy on Mediatek/Ralink SoCs.
>> The driver sets up power and host mode, but also needs to
>> configure PHY registers for the MT7628 and MT7688.
>>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mediatek@lists.infradead.org
>> ---
>> Changes in V6
>> * Add binding for MT7628
>> * Configure PHY registers for MT76{2,8}8
>>
>> Changes in V5
>> * Depend on MIPS
>>
>> Changes in V4
>> * Remove Allwinner from comment
>> * Depend on COMPILE_TEST
>>
>> Changes in V3
>> * Separate DT bindings
>> * Update Kconfig text
>> * Modify John's email address
>> * Rebase onto v4.13-rc3
>>
>> Changes in V2
>> * remove refcounting
>> * drop empty functions
>> * dont use static globals
>> * use explicit compatible strings
>>
>>   drivers/phy/Kconfig          |   9 ++
>>   drivers/phy/Makefile         |   1 +
>>   drivers/phy/phy-ralink-usb.c | 238 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 248 insertions(+)
>>   create mode 100644 drivers/phy/phy-ralink-usb.c
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index c1807d4..a95394b 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -41,6 +41,15 @@ config PHY_PISTACHIO_USB
>>   	help
>>   	  Enable this to support the USB2.0 PHY on the IMG Pistachio SoC.
>>   
>> +config PHY_RALINK_USB
>> +	tristate "Ralink USB PHY driver"
>> +	depends on RALINK || COMPILE_TEST
>> +	depends on MIPS
> 
> depends on (RALINK && MIPS) || COMPILE_TEST ??

Aren't they equivalent?

Besides, I will be able to drop the MIPS dependency once I implement 
syscon, as discussed later...

>> +	select GENERIC_PHY
>> +	help
>> +	  This option enables support for the Ralink USB PHY found inside
>> +	  RT3352, MT7620, MT7628 and MT7688.
>> +
>>   config PHY_XGENE
>>   	tristate "APM X-Gene 15Gbps PHY support"
>>   	depends on HAS_IOMEM && OF && (ARM64 || COMPILE_TEST)
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index f252201..60ed30b 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -7,6 +7,7 @@ obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
>>   obj-$(CONFIG_PHY_MT65XX_USB3)		+= phy-mt65xx-usb3.o
>>   obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
>>   obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
>> +obj-$(CONFIG_PHY_RALINK_USB)		+= phy-ralink-usb.o
>>   
>>   obj-$(CONFIG_ARCH_SUNXI)		+= allwinner/
>>   obj-$(CONFIG_ARCH_MESON)		+= amlogic/
>> diff --git a/drivers/phy/phy-ralink-usb.c b/drivers/phy/phy-ralink-usb.c
>> new file mode 100644
>> index 0000000..d027c43
>> --- /dev/null
>> +++ b/drivers/phy/phy-ralink-usb.c
> 
> We have separate directories for every vendor. Care to add a new directory for
> ralink?

Done

>> @@ -0,0 +1,238 @@
>> +/*
>> + * Copyright (C) 2016 John Crispin <john@phrozen.org>
> 
> 2017

Updated

>> + *
>> + * Based on code from
>> + * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +#include <linux/of_platform.h>
>> +
>> +#include <asm/mach-ralink/ralink_regs.h>
> 
> Er.. I think we can't add COMPILE_TEST with this. Why do you have to include
> arch specific headers?

I'll remove this header and instead add a syscon node to the SoC's DT
so that the PHY driver can enable its clock and host mode. I'll update 
the bindings accordingly.

>> +
>> +#define RT_SYSC_REG_SYSCFG1		0x014
>> +#define RT_SYSC_REG_CLKCFG1		0x030
>> +#define RT_SYSC_REG_USB_PHY_CFG		0x05c
>> +
>> +#define OFS_U2_PHY_AC0			0x800
>> +#define OFS_U2_PHY_AC1			0x804
>> +#define OFS_U2_PHY_AC2			0x808
>> +#define OFS_U2_PHY_ACR0			0x810
>> +#define OFS_U2_PHY_ACR1			0x814
>> +#define OFS_U2_PHY_ACR2			0x818
>> +#define OFS_U2_PHY_ACR3			0x81C
>> +#define OFS_U2_PHY_ACR4			0x820
>> +#define OFS_U2_PHY_AMON0		0x824
>> +#define OFS_U2_PHY_DCR0			0x860
>> +#define OFS_U2_PHY_DCR1			0x864
>> +#define OFS_U2_PHY_DTM0			0x868
>> +#define OFS_U2_PHY_DTM1			0x86C
>> +
>> +#define RT_RSTCTRL_UDEV			BIT(25)
>> +#define RT_RSTCTRL_UHST			BIT(22)
>> +#define RT_SYSCFG1_USB0_HOST_MODE	BIT(10)
>> +
>> +#define MT7620_CLKCFG1_UPHY0_CLK_EN	BIT(25)
>> +#define MT7620_CLKCFG1_UPHY1_CLK_EN	BIT(22)
>> +#define RT_CLKCFG1_UPHY1_CLK_EN		BIT(20)
>> +#define RT_CLKCFG1_UPHY0_CLK_EN		BIT(18)
>> +
>> +#define USB_PHY_UTMI_8B60M		BIT(1)
>> +#define UDEV_WAKEUP			BIT(0)
>> +
>> +struct ralink_usb_phy {
>> +	struct reset_control	*rstdev;
>> +	struct reset_control	*rsthost;
>> +	u32			clk;
>> +	struct phy		*phy;
>> +	void __iomem		*base;
>> +};
>> +
>> +static void u2_phy_w32(struct ralink_usb_phy *phy, u32 val, u32 reg)
>> +{
>> +	iowrite32(val, phy->base + reg);
>> +}
> 
> Why iowrite?

I'll switch to writel and readl.

>> +
>> +static u32 u2_phy_r32(struct ralink_usb_phy *phy, u32 reg)
>> +{
>> +	return ioread32(phy->base + reg);
>> +}
>> +
>> +static void ralink_usb_phy_init(struct ralink_usb_phy *phy)
>> +{
>> +	u2_phy_r32(phy, OFS_U2_PHY_AC2);
>> +	u2_phy_r32(phy, OFS_U2_PHY_ACR0);
>> +	u2_phy_r32(phy, OFS_U2_PHY_DCR0);
>> +
>> +	u2_phy_w32(phy, 0x00ffff02, OFS_U2_PHY_DCR0);
>> +	u2_phy_r32(phy, OFS_U2_PHY_DCR0);
>> +	u2_phy_w32(phy, 0x00555502, OFS_U2_PHY_DCR0);
>> +	u2_phy_r32(phy, OFS_U2_PHY_DCR0);
>> +	u2_phy_w32(phy, 0x00aaaa02, OFS_U2_PHY_DCR0);
>> +	u2_phy_r32(phy, OFS_U2_PHY_DCR0);
>> +	u2_phy_w32(phy, 0x00000402, OFS_U2_PHY_DCR0);
>> +	u2_phy_r32(phy, OFS_U2_PHY_DCR0);
>> +	u2_phy_w32(phy, 0x0048086a, OFS_U2_PHY_AC0);
>> +	u2_phy_w32(phy, 0x4400001c, OFS_U2_PHY_AC1);
>> +	u2_phy_w32(phy, 0xc0200000, OFS_U2_PHY_ACR3);
>> +	u2_phy_w32(phy, 0x02000000, OFS_U2_PHY_DTM0);
> 
> That's too many magic values. But I guess I'm getting used to such
> configurations in PHY drivers.

It does look pretty gross, but I can't find any public documentation for 
the PHY registers...

>> +}
>> +
>> +static int ralink_usb_phy_power_on(struct phy *_phy)
>> +{
>> +	struct ralink_usb_phy *phy = phy_get_drvdata(_phy);
>> +	u32 t;
>> +
>> +	/* enable the phy */
>> +	rt_sysc_m32(0, phy->clk, RT_SYSC_REG_CLKCFG1);
>> +
>> +	/* setup host mode */
>> +	rt_sysc_m32(0, RT_SYSCFG1_USB0_HOST_MODE, RT_SYSC_REG_SYSCFG1);
> 
> Instead of such arch-specific functions, why not use regmap API's?

I'll do this, using syscon.

>> +
>> +	/* deassert the reset lines */
>> +	reset_control_deassert(phy->rsthost);
>> +	reset_control_deassert(phy->rstdev);
>> +
>> +	/*
>> +	 * The SDK kernel had a delay of 100ms. however on device
>> +	 * testing showed that 10ms is enough
>> +	 */
>> +	mdelay(10);
>> +
>> +	if (phy->base)
>> +		ralink_usb_phy_init(phy);
>> +
>> +	/* print some status info */
>> +	t = rt_sysc_r32(RT_SYSC_REG_USB_PHY_CFG);
>> +	dev_info(&phy->phy->dev, "remote usb device wakeup %s\n",
>> +		(t & UDEV_WAKEUP) ? ("enabled") : ("disabled"));
>> +	if (t & USB_PHY_UTMI_8B60M)
>> +		dev_info(&phy->phy->dev, "UTMI 8bit 60MHz\n");
>> +	else
>> +		dev_info(&phy->phy->dev, "UTMI 16bit 30MHz\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int ralink_usb_phy_power_off(struct phy *_phy)
>> +{
>> +	struct ralink_usb_phy *phy = phy_get_drvdata(_phy);
>> +
>> +	/* disable the phy */
>> +	rt_sysc_m32(phy->clk, 0, RT_SYSC_REG_CLKCFG1);
>> +
>> +	/* assert the reset lines */
>> +	reset_control_assert(phy->rstdev);
>> +	reset_control_assert(phy->rsthost);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct phy_ops ralink_usb_phy_ops = {
>> +	.power_on	= ralink_usb_phy_power_on,
>> +	.power_off	= ralink_usb_phy_power_off,
>> +	.owner		= THIS_MODULE,
>> +};
>> +
>> +static const struct of_device_id ralink_usb_phy_of_match[] = {
>> +	{
>> +		.compatible = "ralink,rt3352-usbphy",
>> +		.data = (void *) (RT_CLKCFG1_UPHY1_CLK_EN |
>> +				  RT_CLKCFG1_UPHY0_CLK_EN)
>> +	},
>> +	{
>> +		.compatible = "mediatek,mt7620-usbphy",
>> +		.data = (void *) (MT7620_CLKCFG1_UPHY1_CLK_EN |
>> +				  MT7620_CLKCFG1_UPHY0_CLK_EN)
>> +	},
>> +	{
>> +		.compatible = "mediatek,mt7628-usbphy",
>> +		.data = (void *) (MT7620_CLKCFG1_UPHY1_CLK_EN |
>> +				  MT7620_CLKCFG1_UPHY0_CLK_EN) },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, ralink_usb_phy_of_match);
>> +
>> +static int ralink_usb_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct resource *res;
>> +	struct phy_provider *phy_provider;
>> +	const struct of_device_id *match;
>> +	struct ralink_usb_phy *phy;
>> +
>> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>> +	if (!phy)
>> +		return -ENOMEM;
>> +
>> +	match = of_match_device(ralink_usb_phy_of_match, &pdev->dev);
>> +	if (!match)
>> +		return -ENODEV;
> 
> It's usual to have of_match_device before anything else in probe.

Fixed

> 
> Thanks
> Kishon
> 

Thanks,

Harvey
