Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1235DCDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93zEsPEOHLXBxL00VQmIfdGRZhW+/S8e+e5fVdxWvNo=; b=ORZoDEIsiUXdj+yp2KqA477C2f
	t/2w4j1GGeHiWK6Ai0AnmW/lh58vLCQ8ThxlFVpuwm62RC+DFuN25MJAc3MJmn8Is/xrTiFWBMQaG
	VTrB+QD/UfyYFUzCkobhpyxyiqYhiTiPStm0KXGI2SEdKGRQrSw6S1nx38dk2og/yuBYou4MvzEvO
	pvUiP11dVkw9E23+nVBlfwBawkcNDlLkgMNpS7+Ju/wIPkhuei/KjPRnqq8EoqTerVRnCukvfitqZ
	/nMPG0c6C8Q59LEURlpdk6v86CkaTOtfTU0GpZ4jN775O5f9uFozWsRqAlI5DBNb46JGvjZOpiF9V
	rX5+vrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSPO-00HMGx-38;
	Thu, 19 Oct 2023 12:45:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSPJ-00HMEy-0q
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 12:45:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so72138765e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Oct 2023 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697719538; x=1698324338; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93zEsPEOHLXBxL00VQmIfdGRZhW+/S8e+e5fVdxWvNo=;
        b=E051RqZrfF+Rut7S9+kHo2QzJN1dEvf5aRDwNl9/GkDwq43jrRF2wtM7D3np8vbZZa
         i5o//vhagelmk7ZFhb0GaxRMq/cXb25FjsWjwzlaJfugyFtxJpbaVm79INa0LpX+aGbM
         K+PBLepR6a2Ao3mpAjpKlwDnBib7gHjxwu8XzXuzrHiNlKVw48AR8k9xLMrww2idOsIr
         w7cwuRzctsUEXeWDNUfFM+B5K8yvCcj5ZT/rKdUHaQ0uY+n4cYzkpRDkMU3IT48DXLZU
         GQlxu5s5vM4a7G24ffacgExnwR1zsfsYumdL5WJoduMnwFA+vdP8jWOoZyUcRNswz/CR
         RfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719538; x=1698324338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93zEsPEOHLXBxL00VQmIfdGRZhW+/S8e+e5fVdxWvNo=;
        b=ngAnrq8VBKIw3H8nPXF/gFcGHYorzpbgo3pXBzYGj8uXymZyYOqZt8Ya50ONnOBcxp
         7Wx7XOGdBwxaAphfMTkP2t9tZRH/Jp9lRKoE7iftWStsgFpXT7RsgzBVuEMN4BfP9rV2
         0DuNfKl7Jgjw64Dd/enmwcSjN6VsyYrnHSVOaimfa6IvAoJMERQHFTmEXztB4Su0bgUa
         xR+EIBB0pTFE9IkG8KwZ+Ny/FBZDe5EigA4NSdqASi2QZQ7NC1E8GD21hoDiALxgZ5Wo
         93ZBaMd3pPojg+a4F6t6z3J3GfKyH56Q+xg9ps8eGlb1jzdXI24pFepSL915nY9zcm37
         mMyw==
X-Gm-Message-State: AOJu0YxDLVELaeis+5oC9omrICuq9VHgjciA94ycl5dxE7lnKSNQqVTP
	kL3PZ7Zs0EU9/UqoWHntrEWTLw==
X-Google-Smtp-Source: AGHT+IH/+fzIWzBMhN8VnSrHu6p5FZVEm14aZ9INCSAQYU0LD9/seapmP548W1TUhwqdg+ecv3tu8g==
X-Received: by 2002:a05:600c:1385:b0:407:859c:a1b2 with SMTP id u5-20020a05600c138500b00407859ca1b2mr1615732wmf.14.1697719538455;
        Thu, 19 Oct 2023 05:45:38 -0700 (PDT)
Received: from [10.1.5.76] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c35c400b0040531f5c51asm4476866wmq.5.2023.10.19.05.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 05:45:38 -0700 (PDT)
Message-ID: <c4161d95-cc4c-4801-b436-31bb82263635@baylibre.com>
Date: Thu, 19 Oct 2023 14:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: mediatek: Add device tree for
 MT8365-based Pumpkin i350
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Julien Stephan <jstephan@baylibre.com>,
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
 Ted Larson <ted@ologicinc.com>
References: <20231016215123.30343-1-laurent.pinchart@ideasonboard.com>
 <20231016215123.30343-4-laurent.pinchart@ideasonboard.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231016215123.30343-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_054545_524491_771AF1E8 
X-CRM114-Status: GOOD (  26.27  )
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



On 16/10/2023 23:51, Laurent Pinchart wrote:
> Add a minimal device tree for the Genio i350 Pumpkin development board,
> which is based on a MediaTek MT8365.
> 
> The device tree is based on an initial version by Fabien Parent Based
> written against the MediaTek BSP kernel ([1]). It has been cleaned up,
> some features have been added (GPIO LEDs, ethernet), and some features
> removed (audio, camera, display and dual-role USB). Those features will
> be added back once the corresponding DT bindings and/or drivers become
> available in the upstream kernel.
> 
> [1] https://gitlab.com/mediatek/aiot/bsp/linux/-/blob/mtk-v5.15-dev/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> 
> Co-developed-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Co-developed-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes compared to the BSP version:
> 
> - Add ethernet controller
> - Add GPIO LEDs
> - Add reserved memory region for BL31
> - Update board model and compatible
> - Rename enable-sdio-wakeup to wakeup-source
> - Drop audio support
> - Drop display support
> - Drop dual role USB support
> - Don't use underscores in node names
> - Normalize pinmux node names
> - Remove unneeded labels
> - Drop unneeded always-on
> - Drop unused pinmux nodes
> - Drop camera GPIO hog
> - Update copyright
> - Fix formatting
> - Sort alphabetically
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>   .../boot/dts/mediatek/mt8365-pumpkin.dts      | 542 ++++++++++++++++++
>   2 files changed, 543 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index c99c3372a4b5..bbc232bdadc4 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -53,4 +53,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r3.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> new file mode 100644
> index 000000000000..88fa5d19c627
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> @@ -0,0 +1,542 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 BayLibre, SAS.
> + * Copyright (c) 2023 Ideas on Board Oy
> + *
> + * Author: Fabien Parent <fparent@baylibre.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/mt8365-pinfunc.h>
> +
> +#include "mt8365.dtsi"
> +#include "mt6357.dtsi"
> +
> +/ {
> +	model = "OLogic Pumpkin i350 EVK";
> +	compatible = "ologic,pumpkin-i350", "mediatek,mt8365";
> +
> +	aliases {
> +		ethernet0 = &ethernet_usb;
> +		mmc0 = &mmc0;
> +		mmc1 = &mmc1;
> +		mmc2 = &mmc2;

Are mmc aliases needed ?

> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:921600n8";
> +	};
> +
> +	firmware {
> +		optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-red {
> +			gpios = <&gpio_exp 12 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_RED>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		led-green {
> +			gpios = <&gpio_exp 13 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
> +		secmon@43000000 {
> +			no-map;
> +			reg = <0 0x43000000 0 0x30000>;
> +		};
> +
> +		/*
> +		 * 12 MiB reserved for OP-TEE (BL32)
> +		 * +-----------------------+ 0x43e0_0000
> +		 * |      SHMEM 2MiB       |
> +		 * +-----------------------+ 0x43c0_0000
> +		 * |        | TA_RAM  8MiB |
> +		 * + TZDRAM +--------------+ 0x4340_0000
> +		 * |        | TEE_RAM 2MiB |
> +		 * +-----------------------+ 0x4320_0000
> +		 */
> +		optee@43200000 {
> +			no-map;
> +			reg = <0 0x43200000 0 0x00c00000>;
> +		};
> +	};
> +
> +	usb_otg_vbus: usb-otg-vbus-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "otg_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pio 25 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&cpu0 {
> +	proc-supply = <&mt6357_vproc_reg>;
> +	sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu1 {
> +	proc-supply = <&mt6357_vproc_reg>;
> +	sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu2 {
> +	proc-supply = <&mt6357_vproc_reg>;
> +	sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu3 {
> +	proc-supply = <&mt6357_vproc_reg>;
> +	sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&i2c0 {
> +	status = "okay" > +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +
> +	clock-frequency = <100000>;

Property order:
- clock
- pinctrl
- status

Actually, status should be at the end.
Apply this for the other nodes please.

> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +
> +	clock-frequency = <100000 > +
> +	gpio_exp: gpio@20 {
> +		compatible = "ti,tca6416";
> +		reg = <0x20>;
> +		reset-gpios = <&pio 78 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tca6416_pins>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +
> +	clock-frequency = <100000>;
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins>;
> +
> +	clock-frequency = <100000>;
> +};
> +
> +&keypad {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&keypad_pins>;
> +
> +	keypad,num-rows = <2>;
> +	keypad,num-columns = <1>;
> +	mediatek,debounce-us = <32000>;
> +	mediatek,double-keys;
> +
> +	linux,keymap = <MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN)
> +			MATRIX_KEY(0x01, 0x00, KEY_VOLUMEUP)>;
> +};
> +
> +/* eMMC */
> +&mmc0 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_pins_default>;
> +	pinctrl-1 = <&mmc0_pins_uhs>;
> +
> +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
> +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> +
> +	bus-width = <8>;
> +	max-frequency = <200000000>;
> +
> +	vmmc-supply = <&mt6357_vemc_reg>;
> +	vqmmc-supply = <&mt6357_vio18_reg>;
> +
> +	cap-mmc-highspeed;
> +	cap-mmc-hw-reset;
> +	hs400-ds-delay = <0x12012>;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	no-sd;
> +	no-sdio;
> +	non-removable;

That's how it should be ordered:
     bus-width = <8>;
     max-frequency = <200000000>;

     cap-mmc-highspeed;
     cap-mmc-hw-reset;
     hs400-ds-delay = <0x12012>;
     mmc-hs200-1_8v;
     mmc-hs400-1_8v;
     no-sd;
     no-sdio;
     non-removable;

     vmmc-supply = ...
     vqmmc-supply = ...

     pinctrl-0 ...
     pinctrl-1 ...
     pinctrl-names ...

     status = "okay";

Apply this for other node please.

> +};
> +
> +/* SD card connector */
> +&mmc1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc1_pins_default>;
> +	pinctrl-1 = <&mmc1_pins_uhs>;
> +
> +	bus-width = <4>;
> +	max-frequency = <200000000>;
> +
> +	vmmc-supply = <&mt6357_vmch_reg>;
> +	vqmmc-supply = <&mt6357_vmc_reg>;
> +
> +	cap-sd-highspeed;
> +	cd-gpios = <&pio 76 GPIO_ACTIVE_LOW>;
> +	sd-uhs-sdr104;
> +	sd-uhs-sdr50;
> +};
> +
> +/* WiFi module */
> +&mmc2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc2_pins_default>;
> +	pinctrl-1 = <&mmc2_pins_uhs>;
> +
> +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>;
> +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> +
> +	bus-width = <4>;
> +	max-frequency = <200000000>;
> +
> +	vmmc-supply = <&mt6357_vemc_reg>;
> +	vqmmc-supply = <&mt6357_vio18_reg>;
> +
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	wakeup-source;
> +	hs400-ds-delay = <0x12012>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	sd-uhs-sdr104;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +};
> +
> +&mt6357_pmic {
> +	interrupt-parent = <&pio>;
> +	interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;
> +};
> +
> +&pio {
> +	i2c0_pins: i2c0-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
> +				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
> +			mediatek,pull-up-adv = <3>;
> +			mediatek,drive-strength-adv = <00>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +
> +	i2c1_pins: i2c1-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
> +				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
> +			mediatek,pull-up-adv = <3>;
> +			mediatek,drive-strength-adv = <00>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	i2c2_pins: i2c2-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_61_SDA2__FUNC_SDA2_0>,
> +				 <MT8365_PIN_62_SCL2__FUNC_SCL2_0>;
> +			mediatek,pull-up-adv = <3>;
> +			mediatek,drive-strength-adv = <00>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	i2c3_pins: i2c3-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_63_SDA3__FUNC_SDA3_0>,
> +				 <MT8365_PIN_64_SCL3__FUNC_SCL3_0>;
> +			mediatek,pull-up-adv = <3>;
> +			mediatek,drive-strength-adv = <00>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	keypad_pins: keypad-pins {
> +		pins {
> +			pinmux = <MT8365_PIN_22_KPROW0__FUNC_KPROW0>,
> +				 <MT8365_PIN_23_KPROW1__FUNC_KPROW1>,
> +				 <MT8365_PIN_24_KPCOL0__FUNC_KPCOL0>;
> +		};
> +	};
> +
> +	mmc0_pins_default: mmc0-default-pins {
> +		clk-pins {
> +			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
> +			bias-pull-down;
> +		};
> +
> +		cmd-dat-pins {
> +			pinmux = <MT8365_PIN_103_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
> +				 <MT8365_PIN_102_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
> +				 <MT8365_PIN_101_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
> +				 <MT8365_PIN_100_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
> +				 <MT8365_PIN_96_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
> +				 <MT8365_PIN_95_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
> +				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
> +				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
> +				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		rst-pins {
> +			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	mmc0_pins_uhs: mmc0-uhs-pins{
> +		clk-pins {
> +			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
> +			drive-strength = <MTK_DRIVE_10mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		cmd-dat-pins {
> +			pinmux = <MT8365_PIN_103_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
> +				 <MT8365_PIN_102_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
> +				 <MT8365_PIN_101_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
> +				 <MT8365_PIN_100_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
> +				 <MT8365_PIN_96_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
> +				 <MT8365_PIN_95_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
> +				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
> +				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
> +				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
> +			input-enable;
> +			drive-strength = <MTK_DRIVE_10mA>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		ds-pins {
> +			pinmux = <MT8365_PIN_104_MSDC0_DSL__FUNC_MSDC0_DSL>;
> +			drive-strength = <MTK_DRIVE_10mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		rst-pins {
> +			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
> +			drive-strength = <MTK_DRIVE_10mA>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	mmc1_pins_default: mmc1-default-pins {
> +		cd-pins {
> +			pinmux = <MT8365_PIN_76_CMDAT8__FUNC_GPIO76>;
> +			bias-pull-up;
> +		};
> +
> +		clk-pins {
> +			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		cmd-dat-pins {
> +			pinmux = <MT8365_PIN_89_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
> +				 <MT8365_PIN_90_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
> +				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
> +				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
> +				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
> +			input-enable;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +	};
> +
> +	mmc1_pins_uhs: mmc1-uhs-pins {
> +		cd-pins {
> +			pinmux = <MT8365_PIN_76_CMDAT8__FUNC_GPIO76>;
> +			bias-pull-up;
> +		};
> +
> +		clk-pins {
> +			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
> +			drive-strength = <MTK_DRIVE_8mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		cmd-dat-pins {
> +			pinmux = <MT8365_PIN_89_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
> +				 <MT8365_PIN_90_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
> +				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
> +				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
> +				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
> +			input-enable;
> +			drive-strength = <MTK_DRIVE_6mA>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +	};
> +
> +	mmc2_pins_default: mmc2-default-pins {
> +		clk-pins {
> +			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
> +			drive-strength = <MTK_DRIVE_4mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		cmd-dat-pins {
> +			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
> +				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
> +				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
> +				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
> +				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
> +			input-enable;
> +			drive-strength = <MTK_DRIVE_4mA>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		sysrstb-en-pins {
> +			pinmux = <MT8365_PIN_74_CMDAT6__FUNC_GPIO74>;
> +			output-low;
> +		};
> +	};
> +
> +	mmc2_pins_uhs: mmc2-uhs-pins {
> +		clk-pins {
> +			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
> +			drive-strength = <MTK_DRIVE_8mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		cmd-dat-pins {
> +			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
> +				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
> +				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
> +				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
> +				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
> +			input-enable;
> +			drive-strength = <MTK_DRIVE_8mA>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		ds-pins {
> +			pinmux = <MT8365_PIN_86_MSDC2_DSL__FUNC_MSDC2_DSL>;
> +			drive-strength = <MTK_DRIVE_8mA>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		sysrstb-en-pins {
> +			pinmux = <MT8365_PIN_126_DMIC3_CLK__FUNC_GPIO126>;
> +			output-high;
> +		};
> +	};
> +
> +	tca6416_pins: tca6416-pins {
> +		rst-n-pins {
> +			pinmux = <MT8365_PIN_78_CMHSYNC__FUNC_GPIO78>;
> +			output-high;
> +		};
> +
> +		int-n-pins {
> +			pinmux = <MT8365_PIN_79_CMVSYNC__FUNC_GPIO79>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	usb_pins: usb-pins {
> +		hub-rst-pins {
> +			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>;
> +			output-low;
> +		};
> +
> +		id-pins {
> +			pinmux = <MT8365_PIN_39_URXD2__FUNC_GPIO39>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		vbus-pins {
> +			pinmux = <MT8365_PIN_25_KPCOL1__FUNC_USB_DRVVBUS>;
> +		};
> +	};
> +};
> +
> +&ssusb {
> +	status = "okay";
> +
> +	pinctrl-0 = <&usb_pins>;
> +	pinctrl-names = "default";
> +
> +	/* Host mode only for now, TUSB322 support is missing. */
> +	dr_mode = "host";
> +	maximum-speed = "high-speed";
> +	vusb33-supply = <&mt6357_vusb33_reg>;

Re-order please.

> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb_host {
> +	status = "okay";
> +
> +	vusb33-supply = <&mt6357_vusb33_reg>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;

Order:
#address-cells = <1>;
#size-cells = <0>;

vusb33-supply = <&mt6357_vusb33_reg>;
status = "okay";


> +
> +	hub@2 {
> +		reg = <2>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethernet_usb: ethernet@1 {
> +			compatible = "usb424,ec00";
> +			reg = <1>;
> +		};
> +	};
> +};

-- 
Regards,
Alexandre

