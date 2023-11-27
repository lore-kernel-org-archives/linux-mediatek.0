Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D036C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vmzncnFs4fYSkC3PHDdKYotCyVOAXBzuHAsUKr2mKcw=; b=H13CeWTkC34VyL
	MEBO+YgG7tTfjHgm9rCNP4jTy/dMdwqaJVnC+AJJTClppZ34qGjLQm3mALA34QrHzgBWKJlkIX7Fa
	ZmelpX6aLGzv2HFrR2a1zTagqvAtwlBqgx/D+KbOKiOd5LepP/YXAZ/STnBxRMvTyIQ6WAVYMYmuf
	2Vk4CcJ2F3zcWVKVjzW+0gJANkH5lHJkf2RwcQULdL/BxKyUVNkeq4uFPYU3po6dYlgDb6QrlWgNr
	xAZbVgeEm5FrjSjtm3Z+5Q0bIgLZYVdLdO+4TXS9rN+n6lJO9OMj0/xCrCw6ROkrACt86pSOHBws2
	6r/pMzxxyU/10ZDcAmjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eCE-002v92-1p;
	Mon, 27 Nov 2023 16:10:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eC8-002v6c-1g
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 16:10:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40838915cecso30772345e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Nov 2023 08:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701101447; x=1701706247; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vmzncnFs4fYSkC3PHDdKYotCyVOAXBzuHAsUKr2mKcw=;
        b=0fZBFEzvL9PkTNkqLnxK51KOAjUT3/oWWtxhp+7+Su0F/XXUKSZC+NUIC3EWGczcyA
         7c0LzENEuY2kSCKxX3eno/z8TgMW4QYOEjUZlCBHqszWCwSFpA2PVW3mu9iwFe0pHs49
         ejzNDmCLUtL7CiDJXJvucxWwI8fhkS34aiLyRa/uVJZTVvgeumBGRvVBn7/Dq85TIHPY
         jgPnhmaRrKa6QbFkTsGhNv6BbCm5cT9vo0X7LG7h7g8ePRzhH2siL79vOxODb2Kjwd6i
         9gZosbld2jBw0GPMjJqTaOd5LgtGl3pKXVRrshwS/gfM+/Ecr5dHGZj3y4cmCpx5+XGq
         p31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701101447; x=1701706247;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmzncnFs4fYSkC3PHDdKYotCyVOAXBzuHAsUKr2mKcw=;
        b=w6brUyRTJCkvsfKQk16+k3iEY3uvzxaWShkBa4uyOz2XfcxSYuClTGrJ4IHlxWoX0h
         vXwsw4LRi7A6WfpZOxrHQkLWZ+KxX1+hlIeAfw6YsC0GU7jOaV9x0HiN5yMHJfDeETXf
         YTamo2B2vArFl1ONsFUDxCdGi5zf3wXtjUPe5Z2bJncKegmeyXKZe86SyxLP4TQk7XBL
         PdubF/t4dsivVtDhTpcZ1ip3pFFvfdcuer9GXPJSLNvqT6PZq7ZAEicbsOWiRly8na1A
         xiKYs4mUkE14AiJpzOFS7Eh+XwDUzAx8kr3Ye9ANtgqOQdVTt9nmrBuDLt7vmj+rQq9N
         3SnQ==
X-Gm-Message-State: AOJu0YxI58rbknHXENKLVYJWQObfRLx51B/fFEGlsW6ZQDIHpSXnG1te
	c93lfRi3Otj1eVtozaVrbCT6jQ==
X-Google-Smtp-Source: AGHT+IHYE4hUc0lRq70z8hugnS2j70zK2Mk9ABl/t7P01RsAFlND8jX08hXv10zeeoZM2zUv5yNFUQ==
X-Received: by 2002:adf:f88c:0:b0:332:e2b0:c217 with SMTP id u12-20020adff88c000000b00332e2b0c217mr8485693wrp.62.1701101446552;
        Mon, 27 Nov 2023 08:10:46 -0800 (PST)
Received: from localhost ([2a04:cec2:a:b171:f74e:8fa7:e720:a97e])
        by smtp.gmail.com with ESMTPSA id j12-20020adff00c000000b00332eadd7ea4sm9451666wro.78.2023.11.27.08.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:10:45 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-mediatek@lists.infradead.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Paul Elder
 <paul.elder@ideasonboard.com>, Fabien Parent <fabien.parent@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, Julien Stephan
 <jstephan@baylibre.com>, Suhrid Subramaniam
 <suhrid.subramaniam@mediatek.com>, Ted Larson <ted@ologicinc.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: Add device tree for
 MT8365-based Pumpkin i350
In-Reply-To: <20231025210342.30995-4-laurent.pinchart@ideasonboard.com>
Date: Mon, 27 Nov 2023 17:10:44 +0100
Message-ID: <87sf4ryy63.fsf@build-fedora.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_081048_763429_074CAB7C 
X-CRM114-Status: GOOD (  25.63  )
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


Thanks laurent for adding the support of this board.

On Mon 27 Nov 2023 at 17:01, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

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
> Changes since v1:
> 
> - Drop mmc2 alias
> - Reorder properties of i2c, mmc and usb nodes
> 
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
>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>  .../boot/dts/mediatek/mt8365-pumpkin.dts      | 541 ++++++++++++++++++
>  2 files changed, 542 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index c99c3372a4b5..bbc232bdadc4 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -53,4 +53,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r3.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-pumpkin.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> new file mode 100644
> index 000000000000..9c75294c9889
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
> @@ -0,0 +1,541 @@
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
> +	clock-frequency = <100000>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	clock-frequency = <100000>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +
> +	status = "okay";
> +
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
> +	clock-frequency = <100000>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	clock-frequency = <100000>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins>;
> +
> +	status = "okay";
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
> +	bus-width = <8>;
> +	max-frequency = <200000000>;
> +
> +	cap-mmc-highspeed;
> +	cap-mmc-hw-reset;
> +	hs400-ds-delay = <0x12012>;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +
> +	vmmc-supply = <&mt6357_vemc_reg>;
> +	vqmmc-supply = <&mt6357_vio18_reg>;
> +
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_pins_default>;
> +	pinctrl-1 = <&mmc0_pins_uhs>;
> +
> +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
> +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> +
> +	status = "okay";
> +};
> +
> +/* SD card connector */
> +&mmc1 {
> +	bus-width = <4>;
> +	max-frequency = <200000000>;
> +
> +	cap-sd-highspeed;
> +	cd-gpios = <&pio 76 GPIO_ACTIVE_LOW>;
> +	sd-uhs-sdr104;
> +	sd-uhs-sdr50;
> +
> +	vmmc-supply = <&mt6357_vmch_reg>;
> +	vqmmc-supply = <&mt6357_vmc_reg>;
> +
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc1_pins_default>;
> +	pinctrl-1 = <&mmc1_pins_uhs>;
> +
> +	status = "okay";
> +};
> +
> +/* WiFi module */
> +&mmc2 {
> +	bus-width = <4>;
> +	max-frequency = <200000000>;
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
> +
> +	vmmc-supply = <&mt6357_vemc_reg>;
> +	vqmmc-supply = <&mt6357_vio18_reg>;
> +
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc2_pins_default>;
> +	pinctrl-1 = <&mmc2_pins_uhs>;
> +
> +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>;
> +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> +
> +	status = "okay";
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
> +	/* Host mode only for now, TUSB322 support is missing. */
> +	dr_mode = "host";
> +	maximum-speed = "high-speed";
> +	vusb33-supply = <&mt6357_vusb33_reg>;
> +
> +	pinctrl-0 = <&usb_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb_host {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	vusb33-supply = <&mt6357_vusb33_reg>;
> +
> +	status = "okay";
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
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 

This patch series conflict with:
f2b543a191b6 arm64: dts: mediatek: add device-tree for Genio 1200 EVK board

On i350 Pumpkin board (MT8365):
Tested-by: Julien Masson <jmasson@baylibre.com>

-- 
Julien Masson

