Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DBFC38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 10:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45U4JNMPzdhCKxqPyu/vblXV0uvneI0UY12mqqikmNY=; b=4jR8IRH63+lf35n3d17GMqYoDf
	sJmTEN0JC7nYXVHd76QUqW8zCzi2XhSlijezzBV4kuBZTxsTbnkhmjYQ3CKBfUVwpVqH4+HIvkGY+
	GISEFp+XcubzB9kitMFDk7l69fX/H0y/wB02vXdAmS33EJ11iWJgnjNT4Nezqm6z2LWDJ54pyz4j6
	DS6wXastEtRa1jIERHjp0AUGgviAcpz4KUoQfQlHA/m9PaK02OEBJZ9BerMIPxs+zth7IyrHlrZVW
	MaM6q8yM8uFpPj8gF/9nBHUL9SjLPu4rXa5jIbmtK1cKWK6DoCWQIEvVh8oVqYzjuQptw79lwlSb4
	Oa5LL8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooN5G-00GpUz-Nl; Fri, 28 Oct 2022 10:59:30 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooN3e-00GoRw-Ks; Fri, 28 Oct 2022 10:57:54 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 5A38F5FF91;
	Fri, 28 Oct 2022 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666954665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45U4JNMPzdhCKxqPyu/vblXV0uvneI0UY12mqqikmNY=;
	b=qYKXa4p1a/mfedbUiCOoRY73YxiNLK5k2wUfxc/gMihZXF2P++EOfXckS6Ipr35feNZ3hU
	GCOHd1S3ehvX9Ks26/zkTp4PlqcxFhlBl+qejn5h3FeLxM8pkgY3qsE9hfh1k8X/8fdDvy
	jbKwxXbjVEv5iEuvI9DrfJgxs3qI5g8=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPA id D10C3403ED;
	Fri, 28 Oct 2022 10:57:44 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 28 Oct 2022 12:57:44 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v2 7/7] arm64: dts: mt7986: add Bananapi R3
In-Reply-To: <64daf96b-b2b5-6f02-91aa-58d19083ee01@collabora.com>
References: <20221026093650.110290-1-linux@fw-web.de>
 <20221026093650.110290-8-linux@fw-web.de>
 <64daf96b-b2b5-6f02-91aa-58d19083ee01@collabora.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <a97aa98a6230e7f33a6b5f5e2c9e54ce@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: a0790789-d43a-4d9d-b1a0-321851b4552d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_035751_032735_84797C41 
X-CRM114-Status: GOOD (  42.37  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 2022-10-28 11:19, schrieb AngeloGioacchino Del Regno:
> Il 26/10/22 11:36, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Add support for Bananapi R3 SBC.
>> 
>> - SD/eMMC support (switching first 4 bits of data-bus with sw6/D)
>> - all rj45 ports and both SFP working (eth1/lan4)
>> - all USB-Ports + SIM-Slot tested
>> - i2c and all uarts tested
>> - wifi tested
>> 
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> ---
>> SPI-NAND/NOR switched (CS by sw5/C) not yet included
>>    this is done with DT-Overlays in my tree, but i have no idea yet,
>>    how to upstream
>> 
>> break some lines in wifi-eeprom-data because of checkpatch warnings.
>> originally there were 8 x int32 per line
>> 
>> changes:
>> 
>> v2:
>> - remove pcie to be added later (discussion about clocks)
>> - some fixes based on suggestions on ML
>>    - add key suffix like it's done in mt7622-bpi-r64 devicetree
>>    - add dash in sfp node names
>>    - use reg as unit for switch-node
>>    - drop "-3-4" suffix from i2c-pins node name
>>    - fix order in Makefile
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>>   .../mediatek/mt7986a-bananapi-bpi-r3-emmc.dts |  34 +
>>   .../mediatek/mt7986a-bananapi-bpi-r3-sd.dts   |  29 +
>>   .../dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi | 593 
>> ++++++++++++++++++
>>   4 files changed, 658 insertions(+)
>>   create mode 100644 
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
>>   create mode 100644 
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
>>   create mode 100644 
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
>> 
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile 
>> b/arch/arm64/boot/dts/mediatek/Makefile
>> index 0ec90cb3ef28..e8902f2cc58f 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -7,6 +7,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>> diff --git 
>> a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts 
>> b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
>> new file mode 100644
>> index 000000000000..859b4180ca11
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
>> @@ -0,0 +1,34 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2021 MediaTek Inc.
>> + * Author: Sam.Shih <sam.shih@mediatek.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +#include "mt7986a-bananapi-bpi-r3.dtsi"
>> +
>> +/ {
>> +	model = "Bananapi BPI-R3 (emmc)";
>> +};
>> +
>> +&mmc0 {
>> +	pinctrl-names = "default", "state_uhs";
>> +	pinctrl-0 = <&mmc0_pins_default>;
>> +	pinctrl-1 = <&mmc0_pins_uhs>;
> 
> pinctrl properties and power supply properties can go to the shared
> mt7986a-bananapi-bpi-r3.dtsi file.

OK

> Also, I have a question here... so your hardware can take either eMMC
> or MicroSD... and... is there really no way to build in both 
> devicetrees
> and having the bootloader to select the right one based on hardware 
> version
> or on machine compatible?

as i wrote in description the board has both, an emmc-chip and 
microsd-slot, but they cannot be used simultanously as mt7986 has only 1 
mmc-controller. BPI-R3 has a switch that changes the first 4 data-lines 
either to emmc or microsd-slot. You have only 1 mmc-node that has to be 
configured to which mmc-device you have connected, so i have to use 2 
different devicetrees here.

> I can see, on the wiki, that both bootloader and ATF can be customized 
> (so,
> can be compiled and flashed just fine), so I would say that even if the
> "original" U-Boot doesn't distinguish devicetrees, you can definitely 
> easily
> implement that.

i already boot a fit-image with 2 dts (and 2 overlays for spi-nand/nor) 
and my uboot can check with "mmc partconf" if emmc is available and if 
not choose the sd-dts.

> If you have no idea how to recognize the boards, from a fast look at 
> the
> board schematics, I can see that there's a bootstrap setting based on 
> the
> state of GPIO0 and GPIO1... you can perhaps use that somehow?
> Otherwise, remember that, most of the times, there are other ways to 
> determine
> the board version, like Board ID resistors...

but how should this effect the dts files here? originally i had the 
sd-card dts as base and the emmc had overridden/deleted some properties 
there (so only 2 dts-files). Had talked to Matthias and he suggested 
having a base dtsi and 2 dts for the 2 mmc-configs.

> Also, still on the wiki, I can't see any no-eMMC version of this board: 
> is
> the sd-only a pre-production version or..?

no sd/emmc-only version...1 board with 1 mmc-controller, but 2 
"storages" connected (only 1 functional based on hw switch setting)

>> +	bus-width = <8>;
>> +	max-frequency = <200000000>;
>> +	cap-mmc-highspeed;
>> +	mmc-hs200-1_8v;
>> +	mmc-hs400-1_8v;
>> +	hs400-ds-delay = <0x14014>;
>> +	vmmc-supply = <&reg_3p3v>;
>> +	vqmmc-supply = <&reg_1p8v>;
>> +	non-removable;
>> +	no-sd;
>> +	no-sdio;
>> +	status = "okay";
>> +};
>> +
>> diff --git 
>> a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts 
>> b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
>> new file mode 100644
>> index 000000000000..57200407ab86
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
>> @@ -0,0 +1,29 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2021 MediaTek Inc.
>> + * Author: Sam.Shih <sam.shih@mediatek.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +#include "mt7986a-bananapi-bpi-r3.dtsi"
>> +
>> +/ {
>> +	model = "Bananapi BPI-R3 (sdmmc)";
>> +};
>> +
>> +&mmc0 {
>> +	//sdcard
> 
> C-style comments please

ok

>> +	pinctrl-names = "default", "state_uhs";
>> +	pinctrl-0 = <&mmc0_pins_default>;
>> +	pinctrl-1 = <&mmc0_pins_uhs>;
>> +	bus-width = <4>;
>> +	max-frequency = <52000000>;
>> +	cap-sd-highspeed;
>> +	vmmc-supply = <&reg_3p3v>;
>> +	vqmmc-supply = <&reg_1p8v>;
>> +	status = "okay";
>> +};
>> +
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
>> new file mode 100644
>> index 000000000000..fc100c3a6415
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
>> @@ -0,0 +1,593 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2021 MediaTek Inc.
>> + * Authors: Sam.Shih <sam.shih@mediatek.com>
>> + *          Frank Wunderlich <frank-w@public-files.de>
>> + *          Daniel Golle <daniel@makrotopia.org>
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>> +#include "mt7986a.dtsi"
>> +
>> +/ {
>> +	model = "Bananapi BPI-R3";
>> +	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
>> +
>> +	aliases {
>> +		serial0 = &uart0;
>> +		ethernet0 = &gmac0;
>> +		ethernet1 = &gmac1;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		factory-key {
> 
> I'd say that this is not "factory-key" but "reset-key"?

okay i rename it.

>> +			label = "reset";
>> +			linux,code = <KEY_RESTART>;
>> +			gpios = <&pio 9 GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		wps-key {
>> +			label = "wps";
>> +			linux,code = <KEY_WPS_BUTTON>;
>> +			gpios = <&pio 10 GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>> +
> 
> ..snip..
> 
>> +
>> +	memory@40000000 {
>> +		device_type = "memory";
>> +		reg = <0 0x40000000 0 0x40000000>;
> 
> Doesn't your bootloader fill-in the memory size automatically?

have not tried yet.

>> +	};
>> +
>> +	reg_1p8v: regulator-1p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "fixed-1.8V";
> 
> This is "avdd18", isn't it?

need to check

>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
> 
> All these regulators have a vin-supply: please fill it in.
> Moreover, in the schematics, I can also see other LDOs: 0.9VD (input 
> +12VD),
> AVDD12 (input 1.8VD), DDRV_VPP (input 3.3VD)...

ok

> Of course, this means that you have one more 1.8V regulator, called 
> 1.8vd.
> 
>> +	};
>> +
>> +	reg_3p3v: regulator-3p3v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "fixed-3.3V";
> 
> regulator-name = "3.3vd";
> 
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
> 
> vin-supply = <&dcin>; (dcin: regulator-12vd { ... })
> 
>> +	};
>> +
>> +	reg_5v: regulator-5v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "fixed-5V";
> 
> regulator-name  = "fixed-5p1";
> 
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
> 
> Schematics say "+5V: 5.1V/3A", so this is not 5000000.
> 
>> +		regulator-boot-on;
>> +		regulator-always-on;
> 
> 
> vin-supply = <&dcin>;
> 
>> +	};
>> +
> 
> ..snip..
> 
>> +
>> +&pio {
>> +	i2c_pins: i2c-pins {
>> +		mux {
>> +			function = "i2c";
>> +			groups = "i2c";
>> +		};
>> +	};
>> +
>> +	mmc0_pins_default: mmc0-pins {
>> +		mux {
>> +			function = "emmc";
>> +			groups = "emmc_51";
>> +		};
>> +		conf-cmd-dat {
>> +			pins = "EMMC_DATA_0", "EMMC_DATA_1", "EMMC_DATA_2",
>> +			       "EMMC_DATA_3", "EMMC_DATA_4", "EMMC_DATA_5",
>> +			       "EMMC_DATA_6", "EMMC_DATA_7", "EMMC_CMD";
>> +			input-enable;
>> +			drive-strength = <4>;
>> +			mediatek,pull-up-adv = <1>;	/* pull-up 10K */
> 
> Can we please stop using these custom pull-{up,down}-adv properties?
> Check what was done on pinctrl-mt8192.c (and dt schema) for more 
> information
> and examples.

need to check these with MTK.

>> +		};
>> +		conf-clk {
> 
> ..snip..
> 
>> +
>> +&wifi {
>> +	status = "okay";
>> +	pinctrl-names = "default", "dbdc";
>> +	pinctrl-0 = <&wf_2g_5g_pins>, <&wf_led_pins>;
>> +	pinctrl-1 = <&wf_dbdc_pins>, <&wf_led_pins>;
>> +
>> +	mediatek,eeprom-data = <0x86790900 0xc4326 0x60000000 0x00 0x00 0x00 
>> 0x00 0x00
> 
> Ouch! This looks like firmware unrolled in a devicetree property - that 
> can't
> be right.
> 
> Please dump that in a binary file and load it as firmware from 
> userspace.

it uses the mt76 driver and here eeprom can only be loaded from 
mtd-partition or from device tree. Previous attempts loading eeprom data 
from userspace file (like it's done for "normal" firmware) were 
rejected.

regards Frank

