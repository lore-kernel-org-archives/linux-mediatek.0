Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29369C47DDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XH0N7qwyzoiOquOXIU+a7EdmmXpDUtrm45+lLXzvaJ0=; b=xTPmPEB9kd09e2r/nPusg3gT2Y
	IoQ9gAZVSoIvR4iD536rScwMelBiVr4mLzWZ8TC/v1mvOo9ISmMQaH/n3CaZFNlxwI2rLiR+v9QoI
	LPHgixrV1xMMZ5/Xe2vvi6P3eiDnP7ghFb2YbnpBl/4NNIf31pOeDbE9LZd/gHf6MQW1cCqcauPIS
	idLkD6H7ybWJqck5aZ8s4FCTRcstPzStbM+QXEoAcBpSt2iWmWFlGZIjYdsQ6gtliPKnblvTJeFib
	sfBIP5uWIGNvodmtljuDEFmGS9EDa2y001UNORs61SmmNi8vxIX/bVdPPE5OG9tKyLLqmK8Gs+BmC
	5dy4PJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIIZ-00GxHV-2v;
	Tue, 23 Jan 2024 15:02:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIIV-00GxEL-1L;
	Tue, 23 Jan 2024 15:02:45 +0000
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E65F51571;
	Tue, 23 Jan 2024 16:01:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706022084;
	bh=L7Ay3iiZRAgJbN7wH086fFR5PwqkMl12v5AXznuMD3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5ATtRN7CvME+tv0AHM/uDb8UOBdrDaAb4fEdjZ75sT+AwuwLVoNmRAZtCTGO5dwG
	 YeR4OinyAzqjAovyIIBqtWW1sRzbaOuIIiFbixrrFXfNpJkWnduvyJQ0pJiOr5eUj4
	 t8AetpijdDVtKJd8XZ454Hipl3E30IZ4loOIKVUk=
Date: Tue, 23 Jan 2024 17:02:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
	Ted Larson <ted@ologicinc.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: Add device tree for
 MT8365-based Pumpkin i350
Message-ID: <20240123150236.GJ10679@pendragon.ideasonboard.com>
References: <20231025210342.30995-1-laurent.pinchart@ideasonboard.com>
 <20231025210342.30995-4-laurent.pinchart@ideasonboard.com>
 <cabd1f9d-340a-4778-96bb-4478ae3a791a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cabd1f9d-340a-4778-96bb-4478ae3a791a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_070243_754840_FE9EF759 
X-CRM114-Status: GOOD (  39.20  )
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

Hi Angelo,

On Tue, Jan 23, 2024 at 02:53:58PM +0100, AngeloGioacchino Del Regno wrote:
> Il 25/10/23 23:03, Laurent Pinchart ha scritto:
> > Add a minimal device tree for the Genio i350 Pumpkin development board,
> > which is based on a MediaTek MT8365.
> > 
> > The device tree is based on an initial version by Fabien Parent Based
> > written against the MediaTek BSP kernel ([1]). It has been cleaned up,
> > some features have been added (GPIO LEDs, ethernet), and some features
> > removed (audio, camera, display and dual-role USB). Those features will
> > be added back once the corresponding DT bindings and/or drivers become
> > available in the upstream kernel.
> > 
> > [1] https://gitlab.com/mediatek/aiot/bsp/linux/-/blob/mtk-v5.15-dev/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> > 
> > Co-developed-by: Fabien Parent <fparent@baylibre.com>
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Co-developed-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Drop mmc2 alias
> > - Reorder properties of i2c, mmc and usb nodes
> > 
> > Changes compared to the BSP version:
> > 
> > - Add ethernet controller
> > - Add GPIO LEDs
> > - Add reserved memory region for BL31
> > - Update board model and compatible
> > - Rename enable-sdio-wakeup to wakeup-source
> > - Drop audio support
> > - Drop display support
> > - Drop dual role USB support
> > - Don't use underscores in node names
> > - Normalize pinmux node names
> > - Remove unneeded labels
> > - Drop unneeded always-on
> > - Drop unused pinmux nodes
> > - Drop camera GPIO hog
> > - Update copyright
> > - Fix formatting
> > - Sort alphabetically
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
> >   .../boot/dts/mediatek/mt8365-pumpkin.dts      | 541 ++++++++++++++++++
> >   2 files changed, 542 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index c99c3372a4b5..bbc232bdadc4 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -53,4 +53,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r3.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-pumpkin.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> > new file mode 100644
> > index 000000000000..9c75294c9889
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> > @@ -0,0 +1,541 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 BayLibre, SAS.
> > + * Copyright (c) 2023 Ideas on Board Oy
> > + *
> > + * Author: Fabien Parent <fparent@baylibre.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/pinctrl/mt8365-pinfunc.h>
> > +
> > +#include "mt8365.dtsi"
> > +#include "mt6357.dtsi"
> > +
> > +/ {
> > +	model = "OLogic Pumpkin i350 EVK";
> > +	compatible = "ologic,pumpkin-i350", "mediatek,mt8365";
> > +
> > +	aliases {
> > +		ethernet0 = &ethernet_usb;
> > +		mmc0 = &mmc0;
> > +		mmc1 = &mmc1;
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:921600n8";
> > +	};
> > +
> > +	firmware {
> > +		optee {
> > +			compatible = "linaro,optee-tz";
> > +			method = "smc";
> > +		};
> > +	};
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +
> > +		led-red {
> > +			gpios = <&gpio_exp 12 GPIO_ACTIVE_HIGH>;
> > +			color = <LED_COLOR_ID_RED>;
> > +			function = LED_FUNCTION_HEARTBEAT;
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +
> > +		led-green {
> > +			gpios = <&gpio_exp 13 GPIO_ACTIVE_HIGH>;
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			default-state = "off";
> > +		};
> > +	};
> > +
> > +	memory@40000000 {
> > +		device_type = "memory";
> > +		reg = <0 0x40000000 0 0x80000000>;
> > +	};
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
> > +		secmon@43000000 {
> > +			no-map;
> > +			reg = <0 0x43000000 0 0x30000>;
> 
> reg first, no-map last.
> 
> > +		};
> > +
> > +		/*
> > +		 * 12 MiB reserved for OP-TEE (BL32)
> > +		 * +-----------------------+ 0x43e0_0000
> > +		 * |      SHMEM 2MiB       |
> > +		 * +-----------------------+ 0x43c0_0000
> > +		 * |        | TA_RAM  8MiB |
> > +		 * + TZDRAM +--------------+ 0x4340_0000
> > +		 * |        | TEE_RAM 2MiB |
> > +		 * +-----------------------+ 0x4320_0000
> > +		 */
> > +		optee@43200000 {
> > +			no-map;
> > +			reg = <0 0x43200000 0 0x00c00000>;
> 
> same here.
> 
> > +		};
> > +	};
> > +
> > +	usb_otg_vbus: usb-otg-vbus-regulator {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "otg_vbus";
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +		gpio = <&pio 25 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +};
> > +
> > +&cpu0 {
> > +	proc-supply = <&mt6357_vproc_reg>;
> > +	sram-supply = <&mt6357_vsram_proc_reg>;
> > +};
> > +
> > +&cpu1 {
> > +	proc-supply = <&mt6357_vproc_reg>;
> > +	sram-supply = <&mt6357_vsram_proc_reg>;
> > +};
> > +
> > +&cpu2 {
> > +	proc-supply = <&mt6357_vproc_reg>;
> > +	sram-supply = <&mt6357_vsram_proc_reg>;
> > +};
> > +
> > +&cpu3 {
> > +	proc-supply = <&mt6357_vproc_reg>;
> > +	sram-supply = <&mt6357_vsram_proc_reg>;
> > +};
> > +
> > +&i2c0 {
> > +	clock-frequency = <100000>;
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c0_pins>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&i2c1 {
> > +	clock-frequency = <100000>;
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c1_pins>;
> > +
> > +	status = "okay";
> > +
> > +	gpio_exp: gpio@20 {
> > +		compatible = "ti,tca6416";
> > +		reg = <0x20>;
> > +		reset-gpios = <&pio 78 GPIO_ACTIVE_LOW>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&tca6416_pins>;
> > +
> > +		gpio-controller;
> 
> Please check Documentation/devicetree/bindings/dts-coding-style.rst

I assume you mean the "Order of Properties in Device Node" section ?
What part exactly ?

> > +		#gpio-cells = <2>;
> > +	};
> > +};
> > +
> > +&i2c2 {
> > +	clock-frequency = <100000>;
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c2_pins>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&i2c3 {
> > +	clock-frequency = <100000>;
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c3_pins>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&keypad {
> > +	status = "okay";
> 
> status goes last.
> 
> Please check Documentation/devicetree/bindings/dts-coding-style.rst
> 
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&keypad_pins>;
> > +
> > +	keypad,num-rows = <2>;
> > +	keypad,num-columns = <1>;
> > +	mediatek,debounce-us = <32000>;
> > +	mediatek,double-keys;
> > +
> > +	linux,keymap = <MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN)
> > +			MATRIX_KEY(0x01, 0x00, KEY_VOLUMEUP)>;
> > +};
> > +
> > +/* eMMC */
> > +&mmc0 {
> > +	bus-width = <8>;
> > +	max-frequency = <200000000>;
> > +
> > +	cap-mmc-highspeed;
> > +	cap-mmc-hw-reset;
> > +	hs400-ds-delay = <0x12012>;
> > +	mmc-hs200-1_8v;
> > +	mmc-hs400-1_8v;
> > +	no-sd;
> > +	no-sdio;
> > +	non-removable;
> 
> Please order by name.
> 
> > +
> > +	vmmc-supply = <&mt6357_vemc_reg>;
> > +	vqmmc-supply = <&mt6357_vio18_reg>;
> > +
> > +	pinctrl-names = "default", "state_uhs";
> > +	pinctrl-0 = <&mmc0_pins_default>;
> > +	pinctrl-1 = <&mmc0_pins_uhs>;
> > +
> > +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
> 
> assigned clocks and clock parents go first.
> 
> > +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +/* SD card connector */
> > +&mmc1 {
> > +	bus-width = <4>;
> > +	max-frequency = <200000000>;
> > +
> > +	cap-sd-highspeed;
> > +	cd-gpios = <&pio 76 GPIO_ACTIVE_LOW>;
> > +	sd-uhs-sdr104;
> > +	sd-uhs-sdr50;
> 
> Please order by name.
> 
> > +
> > +	vmmc-supply = <&mt6357_vmch_reg>;
> > +	vqmmc-supply = <&mt6357_vmc_reg>;
> > +
> > +	pinctrl-names = "default", "state_uhs";
> > +	pinctrl-0 = <&mmc1_pins_default>;
> > +	pinctrl-1 = <&mmc1_pins_uhs>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +/* WiFi module */
> > +&mmc2 {
> > +	bus-width = <4>;
> > +	max-frequency = <200000000>;
> > +
> > +	cap-sd-highspeed;
> > +	cap-sdio-irq;
> > +	wakeup-source;
> > +	hs400-ds-delay = <0x12012>;
> 
> Please order by name.
> 
> > +	keep-power-in-suspend;
> > +	non-removable;
> > +	sd-uhs-sdr104;
> > +	sd-uhs-sdr25;
> > +	sd-uhs-sdr50;
> > +
> > +	vmmc-supply = <&mt6357_vemc_reg>;
> > +	vqmmc-supply = <&mt6357_vio18_reg>;
> > +
> > +	pinctrl-names = "default", "state_uhs";
> > +	pinctrl-0 = <&mmc2_pins_default>;
> > +	pinctrl-1 = <&mmc2_pins_uhs>;
> > +
> > +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>;
> > +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&mt6357_pmic {
> > +	interrupt-parent = <&pio>;
> > +	interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
> > +	interrupt-controller;
> > +	#interrupt-cells = <2>;
> > +};
> > +
> > +&pio {
> > +	i2c0_pins: i2c0-pins {
> > +		pins {
> > +			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
> > +				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
> > +			mediatek,pull-up-adv = <3>;
> > +			mediatek,drive-strength-adv = <00>;
> 
> I don't know what 00 is here, and it's not a valid drive strength value in uA.

I don't know either, I didn't author that part. I'll look it up.

> Valid values are 125, 250, 500 and 1000 microamps.
> 
> P.S.: Here and everywhere else.
> 
> > +			bias-pull-up;
> > +		};
> > +	};
> > +
> > +
> 
> ..snip..
> 
> > +	mmc0_pins_uhs: mmc0-uhs-pins{
> > +		clk-pins {
> > +			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
> > +			drive-strength = <MTK_DRIVE_10mA>;
> > +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		cmd-dat-pins {
> > +			pinmux = <MT8365_PIN_103_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
> > +				 <MT8365_PIN_102_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
> > +				 <MT8365_PIN_101_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
> > +				 <MT8365_PIN_100_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
> > +				 <MT8365_PIN_96_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
> > +				 <MT8365_PIN_95_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
> > +				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
> > +				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
> > +				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
> > +			input-enable;
> > +			drive-strength = <MTK_DRIVE_10mA>;
> 
> There's no need to use MTK_DRIVE_xxxx definitions, as they're really just defining
> the same number that you can just clearly write.
> 
> In this case, it is
> 			drive-strength = <10>;
> 
> please change it here and everywhere else.

OK. Looks cleaner indeed.

> > +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> > +		};
> > +
> > +		ds-pins {
> > +			pinmux = <MT8365_PIN_104_MSDC0_DSL__FUNC_MSDC0_DSL>;
> > +			drive-strength = <MTK_DRIVE_10mA>;
> > +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		rst-pins {
> > +			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
> > +			drive-strength = <MTK_DRIVE_10mA>;
> > +			bias-pull-up;
> > +		};
> > +	};
> > +
> 
> ..snip..
> 
> > +
> > +&usb_host {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	vusb33-supply = <&mt6357_vusb33_reg>;
> > +
> > +	status = "okay";
> > +
> > +	hub@2 {
> > +		reg = <2>;
> > +
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethernet_usb: ethernet@1 {
> 
> Can you please explain why you need this node on a fully discoverable bus?
> Isn't it enough to just let USB auto enumerate this device at boot?

To let the boot loader fill in the MAC address in DT. Would you like me
to add a comment here ?

> > +			compatible = "usb424,ec00";
> > +			reg = <1>;
> > +		};
> > +	};
> > +};

-- 
Regards,

Laurent Pinchart

