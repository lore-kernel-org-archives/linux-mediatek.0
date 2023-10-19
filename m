Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7851FC001DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 21:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kr2wzRvuJ3qddspDKua5Z7bxyOIqfiQFdhQHBVN4/UU=; b=wsmgrqnIvfOsKT9qS/0LfZW3QK
	RK2NHh83aJebzvW8P1YH/E3ywwDdQjD3iIg1DefEanTIDPNs+9syR2RZMsUfUd52myWg+waP+0y77
	Ihm4gwiMhGGNPC0Wo+Qd6uytfLY01Y9JpW/5D7mXVKGxOOb1m4Z1Fw7B1cf02YJyF5iJRFJeM6U5i
	cp4WH//PGvpTx+thHcygnuNgxKSnsm+YJKoRixmC1AFPEOf79it9cuMfWyhIy7ui5y2HMczUeVZaM
	AVZZCaUjFd2HcVSX5FsawHs7IRHkR0n4LMFqYt9VoQaLJxbW3ftz4hWix5wmthbbknm3/eB4Rn3TX
	1vyS3cYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtaGg-000iYC-0X;
	Thu, 19 Oct 2023 21:09:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtaGa-000iXb-2O;
	Thu, 19 Oct 2023 21:09:19 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBC58276;
	Thu, 19 Oct 2023 23:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697749744;
	bh=3Oq3+PDl4eoWOLTK8CAMZedT+3m7NbgWUITYQIcPcK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RoE0qNGJ24Ct04l96T7MYQ3BsIma79A2icJvVoflax4OI+WxotE/IjLwZrmQLC/zD
	 J0XWXmLEwmp0/fhE0IXySveOLTOfUWnCbiL9A6lQ2eUFdYGzV6dfPLWXBQOx96brDk
	 aWLVG7NmkwDX7FnTX7iZBM1zFGuK5QV7aeI7fCLQ=
Date: Fri, 20 Oct 2023 00:09:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Julien Stephan <jstephan@baylibre.com>,
	Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
	Ted Larson <ted@ologicinc.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: mediatek: Add device tree for
 MT8365-based Pumpkin i350
Message-ID: <20231019210918.GP14832@pendragon.ideasonboard.com>
References: <20231016215123.30343-1-laurent.pinchart@ideasonboard.com>
 <20231016215123.30343-4-laurent.pinchart@ideasonboard.com>
 <c4161d95-cc4c-4801-b436-31bb82263635@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4161d95-cc4c-4801-b436-31bb82263635@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_140917_100491_848F0A1B 
X-CRM114-Status: GOOD (  32.81  )
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

Hi Alexandre,

On Thu, Oct 19, 2023 at 02:45:36PM +0200, Alexandre Mergnat wrote:
> On 16/10/2023 23:51, Laurent Pinchart wrote:
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
> >   .../boot/dts/mediatek/mt8365-pumpkin.dts      | 542 ++++++++++++++++++
> >   2 files changed, 543 insertions(+)
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
> > index 000000000000..88fa5d19c627
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> > @@ -0,0 +1,542 @@
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
> > +		mmc2 = &mmc2;
> 
> Are mmc aliases needed ?

Likely not. For mmc2, I don't think so. For mmc0 and mmc1, aliases
provide a fixed ordering that helps differentiating between the eMMC and
the external SD card. I don't mind dropping them if that's preferred.

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
> > +	status = "okay" > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c0_pins>;
> > +
> > +	clock-frequency = <100000>;
> 
> Property order:
> - clock
> - pinctrl
> - status
> 
> Actually, status should be at the end.
> Apply this for the other nodes please.

OK, I'll reorder properties. Is there a document that clearly states the
preferred order ?

> > +};
> > +
> > +&i2c1 {
> > +	status = "okay";
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c1_pins>;
> > +
> > +	clock-frequency = <100000 > +
> > +	gpio_exp: gpio@20 {
> > +		compatible = "ti,tca6416";
> > +		reg = <0x20>;
> > +		reset-gpios = <&pio 78 GPIO_ACTIVE_LOW>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&tca6416_pins>;
> > +
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +	};
> > +};
> > +
> > +&i2c2 {
> > +	status = "okay";
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c2_pins>;
> > +
> > +	clock-frequency = <100000>;
> > +};
> > +
> > +&i2c3 {
> > +	status = "okay";
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c3_pins>;
> > +
> > +	clock-frequency = <100000>;
> > +};
> > +
> > +&keypad {
> > +	status = "okay";
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
> > +	status = "okay";
> > +
> > +	pinctrl-names = "default", "state_uhs";
> > +	pinctrl-0 = <&mmc0_pins_default>;
> > +	pinctrl-1 = <&mmc0_pins_uhs>;
> > +
> > +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
> > +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> > +
> > +	bus-width = <8>;
> > +	max-frequency = <200000000>;
> > +
> > +	vmmc-supply = <&mt6357_vemc_reg>;
> > +	vqmmc-supply = <&mt6357_vio18_reg>;
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
> That's how it should be ordered:
>      bus-width = <8>;
>      max-frequency = <200000000>;
> 
>      cap-mmc-highspeed;
>      cap-mmc-hw-reset;
>      hs400-ds-delay = <0x12012>;
>      mmc-hs200-1_8v;
>      mmc-hs400-1_8v;
>      no-sd;
>      no-sdio;
>      non-removable;
> 
>      vmmc-supply = ...
>      vqmmc-supply = ...
> 
>      pinctrl-0 ...
>      pinctrl-1 ...
>      pinctrl-names ...
> 
>      status = "okay";
> 
> Apply this for other node please.
> 
> > +};
> > +
> > +/* SD card connector */
> > +&mmc1 {
> > +	status = "okay";
> > +
> > +	pinctrl-names = "default", "state_uhs";
> > +	pinctrl-0 = <&mmc1_pins_default>;
> > +	pinctrl-1 = <&mmc1_pins_uhs>;
> > +
> > +	bus-width = <4>;
> > +	max-frequency = <200000000>;
> > +
> > +	vmmc-supply = <&mt6357_vmch_reg>;
> > +	vqmmc-supply = <&mt6357_vmc_reg>;
> > +
> > +	cap-sd-highspeed;
> > +	cd-gpios = <&pio 76 GPIO_ACTIVE_LOW>;
> > +	sd-uhs-sdr104;
> > +	sd-uhs-sdr50;
> > +};
> > +
> > +/* WiFi module */
> > +&mmc2 {
> > +	status = "okay";
> > +
> > +	pinctrl-names = "default", "state_uhs";
> > +	pinctrl-0 = <&mmc2_pins_default>;
> > +	pinctrl-1 = <&mmc2_pins_uhs>;
> > +
> > +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>;
> > +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> > +
> > +	bus-width = <4>;
> > +	max-frequency = <200000000>;
> > +
> > +	vmmc-supply = <&mt6357_vemc_reg>;
> > +	vqmmc-supply = <&mt6357_vio18_reg>;
> > +
> > +	cap-sd-highspeed;
> > +	cap-sdio-irq;
> > +	wakeup-source;
> > +	hs400-ds-delay = <0x12012>;
> > +	keep-power-in-suspend;
> > +	non-removable;
> > +	sd-uhs-sdr104;
> > +	sd-uhs-sdr25;
> > +	sd-uhs-sdr50;
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
> > +			bias-pull-up;
> > +		};
> > +	};
> > +
> > +
> > +	i2c1_pins: i2c1-pins {
> > +		pins {
> > +			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
> > +				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
> > +			mediatek,pull-up-adv = <3>;
> > +			mediatek,drive-strength-adv = <00>;
> > +			bias-pull-up;
> > +		};
> > +	};
> > +
> > +	i2c2_pins: i2c2-pins {
> > +		pins {
> > +			pinmux = <MT8365_PIN_61_SDA2__FUNC_SDA2_0>,
> > +				 <MT8365_PIN_62_SCL2__FUNC_SCL2_0>;
> > +			mediatek,pull-up-adv = <3>;
> > +			mediatek,drive-strength-adv = <00>;
> > +			bias-pull-up;
> > +		};
> > +	};
> > +
> > +	i2c3_pins: i2c3-pins {
> > +		pins {
> > +			pinmux = <MT8365_PIN_63_SDA3__FUNC_SDA3_0>,
> > +				 <MT8365_PIN_64_SCL3__FUNC_SCL3_0>;
> > +			mediatek,pull-up-adv = <3>;
> > +			mediatek,drive-strength-adv = <00>;
> > +			bias-pull-up;
> > +		};
> > +	};
> > +
> > +	keypad_pins: keypad-pins {
> > +		pins {
> > +			pinmux = <MT8365_PIN_22_KPROW0__FUNC_KPROW0>,
> > +				 <MT8365_PIN_23_KPROW1__FUNC_KPROW1>,
> > +				 <MT8365_PIN_24_KPCOL0__FUNC_KPCOL0>;
> > +		};
> > +	};
> > +
> > +	mmc0_pins_default: mmc0-default-pins {
> > +		clk-pins {
> > +			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
> > +			bias-pull-down;
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
> > +			bias-pull-up;
> > +		};
> > +
> > +		rst-pins {
> > +			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
> > +			bias-pull-up;
> > +		};
> > +	};
> > +
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
> > +	mmc1_pins_default: mmc1-default-pins {
> > +		cd-pins {
> > +			pinmux = <MT8365_PIN_76_CMDAT8__FUNC_GPIO76>;
> > +			bias-pull-up;
> > +		};
> > +
> > +		clk-pins {
> > +			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
> > +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		cmd-dat-pins {
> > +			pinmux = <MT8365_PIN_89_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
> > +				 <MT8365_PIN_90_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
> > +				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
> > +				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
> > +				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
> > +			input-enable;
> > +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> > +		};
> > +	};
> > +
> > +	mmc1_pins_uhs: mmc1-uhs-pins {
> > +		cd-pins {
> > +			pinmux = <MT8365_PIN_76_CMDAT8__FUNC_GPIO76>;
> > +			bias-pull-up;
> > +		};
> > +
> > +		clk-pins {
> > +			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
> > +			drive-strength = <MTK_DRIVE_8mA>;
> > +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		cmd-dat-pins {
> > +			pinmux = <MT8365_PIN_89_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
> > +				 <MT8365_PIN_90_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
> > +				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
> > +				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
> > +				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
> > +			input-enable;
> > +			drive-strength = <MTK_DRIVE_6mA>;
> > +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> > +		};
> > +	};
> > +
> > +	mmc2_pins_default: mmc2-default-pins {
> > +		clk-pins {
> > +			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
> > +			drive-strength = <MTK_DRIVE_4mA>;
> > +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		cmd-dat-pins {
> > +			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
> > +				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
> > +				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
> > +				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
> > +				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
> > +			input-enable;
> > +			drive-strength = <MTK_DRIVE_4mA>;
> > +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> > +		};
> > +
> > +		sysrstb-en-pins {
> > +			pinmux = <MT8365_PIN_74_CMDAT6__FUNC_GPIO74>;
> > +			output-low;
> > +		};
> > +	};
> > +
> > +	mmc2_pins_uhs: mmc2-uhs-pins {
> > +		clk-pins {
> > +			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
> > +			drive-strength = <MTK_DRIVE_8mA>;
> > +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		cmd-dat-pins {
> > +			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
> > +				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
> > +				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
> > +				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
> > +				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
> > +			input-enable;
> > +			drive-strength = <MTK_DRIVE_8mA>;
> > +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> > +		};
> > +
> > +		ds-pins {
> > +			pinmux = <MT8365_PIN_86_MSDC2_DSL__FUNC_MSDC2_DSL>;
> > +			drive-strength = <MTK_DRIVE_8mA>;
> > +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		sysrstb-en-pins {
> > +			pinmux = <MT8365_PIN_126_DMIC3_CLK__FUNC_GPIO126>;
> > +			output-high;
> > +		};
> > +	};
> > +
> > +	tca6416_pins: tca6416-pins {
> > +		rst-n-pins {
> > +			pinmux = <MT8365_PIN_78_CMHSYNC__FUNC_GPIO78>;
> > +			output-high;
> > +		};
> > +
> > +		int-n-pins {
> > +			pinmux = <MT8365_PIN_79_CMVSYNC__FUNC_GPIO79>;
> > +			input-enable;
> > +			bias-pull-up;
> > +		};
> > +	};
> > +
> > +	usb_pins: usb-pins {
> > +		hub-rst-pins {
> > +			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>;
> > +			output-low;
> > +		};
> > +
> > +		id-pins {
> > +			pinmux = <MT8365_PIN_39_URXD2__FUNC_GPIO39>;
> > +			input-enable;
> > +			bias-pull-up;
> > +		};
> > +
> > +		vbus-pins {
> > +			pinmux = <MT8365_PIN_25_KPCOL1__FUNC_USB_DRVVBUS>;
> > +		};
> > +	};
> > +};
> > +
> > +&ssusb {
> > +	status = "okay";
> > +
> > +	pinctrl-0 = <&usb_pins>;
> > +	pinctrl-names = "default";
> > +
> > +	/* Host mode only for now, TUSB322 support is missing. */
> > +	dr_mode = "host";
> > +	maximum-speed = "high-speed";
> > +	vusb33-supply = <&mt6357_vusb33_reg>;
> 
> Re-order please.
> 
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > +
> > +&usb_host {
> > +	status = "okay";
> > +
> > +	vusb33-supply = <&mt6357_vusb33_reg>;
> > +
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> 
> Order:
> #address-cells = <1>;
> #size-cells = <0>;
> 
> vusb33-supply = <&mt6357_vusb33_reg>;
> status = "okay";
> 
> 
> > +
> > +	hub@2 {
> > +		reg = <2>;
> > +
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethernet_usb: ethernet@1 {
> > +			compatible = "usb424,ec00";
> > +			reg = <1>;
> > +		};
> > +	};
> > +};

-- 
Regards,

Laurent Pinchart

