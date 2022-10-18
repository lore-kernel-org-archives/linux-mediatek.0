Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C81BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6hCJkFqagNxMfW9SDbCFBpsm7z3HVXT6Fjd2UYXEv4=; b=wJ1QriYN77eCiH
	MA07TO38rSPpnvs6dicCACSApISBUJJjAus8Ler1m6wQ4Q3MstRCijC78t07s08PQ+y6TjKA3Ab2/
	uxHfskGxzKn6gmWL0sUPdPoCXa5xi05j2BrLnVz0q2eOoIR2aVSTgBJSEoxkCT6QJUNmTqqPlvSS7
	x7aI2x4WZxR+l7y0J+j0Vt0CVLNVTNPSq3WW2JmAqF/Qchq4L/vbg1vKAi8rPNCWvA/ys0rsCjhsQ
	Us0niO3qjdqjLtbjSReYoKwIRPJ0aBxnvbHzwMVDwiwXqrkMWAOzwBp9Q/Ep05zioDY+g2yg0pOrc
	cSlC3NSg8BrotK+Q2Fkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okojS-007qlN-7e; Tue, 18 Oct 2022 15:42:18 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okogB-007nbt-72
	for linux-mediatek@lists.infradead.org; Tue, 18 Oct 2022 15:38:57 +0000
Received: by mail-qk1-x732.google.com with SMTP id 8so8889071qka.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Oct 2022 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6hCJkFqagNxMfW9SDbCFBpsm7z3HVXT6Fjd2UYXEv4=;
        b=Ne/MjDOGNroy+zY/MyDh4x9b4cUAtHXC3Rm/aJyvKhXjbC/tyGcNEPVVgFHPPcKwma
         TKIUjPHHuaMnNg893nblJ9gtPaaoEmQ+1Pz4mWg1V1IoxKKiB0YxSs4ko/Bj7ria4e1w
         VSRdItIayeT7oo91BgVScj5mPAGGwIWE9J7HcCUSgyRNZlWO+3V1S+g6+UMfsqpMNmil
         9teAO4pdFzJ7d2tsjW8DD5x0Wk7li2NWrOTpMdXam/ifK1q7jcYSYTbPcdqk6k9r3zWL
         gMvgi+8Dcj7Iiy3Dtd7uZuOxaXYwLCEii5mzglfB+YA7rCyc57id1xYfXlI8Evn9KRAZ
         VBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6hCJkFqagNxMfW9SDbCFBpsm7z3HVXT6Fjd2UYXEv4=;
        b=74H66FQn5zg6jBfzAZVyjBab59ToHEjW7P2hvNms8s4mWPmno2c2sizbdwigii9ec1
         x0GLoMpvohF4HXSaXzQUbvm9tX60gG5fWo872DyNqc6bXATgMbEdJnTINDqvmirMEyv4
         BtdVcsoxrkQFySbJfXOv7f4F9ng5Sl59bpNRDAdpfX52QmdEtVHvQoIPaBbDyPb/ntvz
         FdaSZ28AV9mFlF+BjxsG4hdXMMQ0BwjvCFl9R9thhbc+IwW8DA8hgz2E6gusHBLpHx8a
         o+YF568BI1AECPX9QPQHL2KEXu0V5U0ak7KvFCHSVA6l/eiXF+xmCd0Z6LDSFsyfXsee
         ybGA==
X-Gm-Message-State: ACrzQf3t51ksFk2j4bXiDm9/5yOXZUxdGVShb+LlBWRkkCfK81zQ1iX9
	gbMfpJVeClHfltw58IkGZ3Kt9Q==
X-Google-Smtp-Source: AMsMyM4cbC5maHuTSb+jVctbnXvXXi+FVdljAiIPuL3j2ArNw+LTIgMURFTk7wgx40DS5DtMd5h66w==
X-Received: by 2002:a05:620a:1709:b0:6ed:4817:1d02 with SMTP id az9-20020a05620a170900b006ed48171d02mr2275958qkb.73.1666107532699;
        Tue, 18 Oct 2022 08:38:52 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id ci19-20020a05622a261300b0035badb499c7sm2157359qtb.21.2022.10.18.08.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 08:38:52 -0700 (PDT)
Message-ID: <a0ffab83-6797-f769-bb4f-946c7098a4bc@linaro.org>
Date: Tue, 18 Oct 2022 11:38:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC v1 12/12] arm64: dts: mt7986: add Bananapi R3
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221017104141.7338-1-linux@fw-web.de>
 <20221017104141.7338-13-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017104141.7338-13-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_083855_361716_0DA97276 
X-CRM114-Status: GOOD (  23.99  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/10/2022 06:41, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add support for Bananapi R3 SBC.
> 
> - SD/eMMC support (switching first 4 bits of data-bus with sw6/D)
> - all rj45 ports and both SFP working (eth1/lan4)
> - PCIe and all USB-Ports + SIM-Slot tested
> - i2c and all uarts tested
> - wifi tested

Thank you for your patch. There is something to discuss/improve.

> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> SPI-NAND/NOR switched (CS by sw5/C) not yet included
>   this is done with DT-Overlays in my tree, but i have no idea yet,
>   how to upstream
> 
> break some lines in wifi-eeprom-data because of checkpatch warnings.
> originally there were 8 x int32 per line
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>  .../mediatek/mt7986a-bananapi-bpi-r3-emmc.dts |  34 +
>  .../mediatek/mt7986a-bananapi-bpi-r3-sd.dts   |  29 +
>  .../dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi | 609 ++++++++++++++++++
>  4 files changed, 674 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 0ec90cb3ef28..c22cd3e6b98f 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtb> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb

Alphabetical order

>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
> new file mode 100644
> index 000000000000..859b4180ca11
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +#include "mt7986a-bananapi-bpi-r3.dtsi"
> +
> +/ {
> +	model = "Bananapi BPI-R3 (emmc)";
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_pins_default>;
> +	pinctrl-1 = <&mmc0_pins_uhs>;
> +	bus-width = <8>;
> +	max-frequency = <200000000>;
> +	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	hs400-ds-delay = <0x14014>;
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&reg_1p8v>;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	status = "okay";
> +};
> +
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
> new file mode 100644
> index 000000000000..57200407ab86
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +#include "mt7986a-bananapi-bpi-r3.dtsi"
> +
> +/ {
> +	model = "Bananapi BPI-R3 (sdmmc)";
> +};
> +
> +&mmc0 {
> +	//sdcard
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_pins_default>;
> +	pinctrl-1 = <&mmc0_pins_uhs>;
> +	bus-width = <4>;
> +	max-frequency = <52000000>;
> +	cap-sd-highspeed;
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&reg_1p8v>;
> +	status = "okay";
> +};
> +
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
> new file mode 100644
> index 000000000000..b2317e894855
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
> @@ -0,0 +1,609 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Authors: Sam.Shih <sam.shih@mediatek.com>
> + *          Frank Wunderlich <frank-w@public-files.de>
> + *          Daniel Golle <daniel@makrotopia.org>
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +#include "mt7986a.dtsi"
> +
> +/ {
> +	model = "Bananapi BPI-R3";
> +	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		factory {

key/button prefix

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

> +			label = "reset";
> +			linux,code = <KEY_RESTART>;
> +			gpios = <&pio 9 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		wps {
> +			label = "wps";
> +			linux,code = <KEY_WPS_BUTTON>;
> +			gpios = <&pio 10 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	/* i2c of the left SFP cage (wan) */
> +	i2c_sfp1: i2c-gpio-0 {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		i2c-gpio,delay-us = <2>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +
> +	/* i2c of the right SFP cage (lan) */
> +	i2c_sfp2: i2c-gpio-1 {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		i2c-gpio,delay-us = <2>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		green_led: led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_POWER;
> +			gpios = <&pio 69 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +
> +		blue_led: led-1 {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&pio 86 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};

Blank line
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0x40000000>;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-1.8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_5v: regulator-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	/* left SFP cage (wan) */
> +	sfp1: sfp1 {

sfp-1

> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c_sfp1>;
> +		los-gpio = <&pio 46 GPIO_ACTIVE_HIGH>;
> +		moddef0-gpio = <&pio 49 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpio = <&pio 20 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpio = <&pio 7 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	/* right SFP cage (lan) */
> +	sfp2: sfp2 {

sfp-2

> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c_sfp2>;
> +		los-gpios = <&pio 31 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&pio 47 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpios = <&pio 15 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpios = <&pio 48 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&crypto {
> +	status = "okay";
> +};
> +
> +&eth {
> +	status = "okay";
> +
> +	gmac0: mac@0 {
> +		compatible = "mediatek,eth-mac";
> +		reg = <0>;
> +		phy-mode = "2500base-x";
> +
> +		fixed-link {
> +			speed = <2500>;
> +			full-duplex;
> +			pause;
> +		};
> +	};
> +
> +	gmac1: mac@1 {
> +		compatible = "mediatek,eth-mac";
> +		reg = <1>;
> +		phy-mode = "2500base-x";
> +		sfp = <&sfp1>;
> +		managed = "in-band-status";
> +	};
> +
> +	mdio: mdio-bus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> +
> +&mdio {
> +	switch: switch@0 {
> +		compatible = "mediatek,mt7531";
> +		reg = <31>;

This does not match your unit address.

> +		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c_pins>;
> +	status = "okay";
> +};
> +
> +&pcie {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_pins>;
> +	status = "okay";
> +};
> +
> +&pcie_phy {
> +	status = "okay";
> +};
> +
> +&pio {
> +	i2c_pins: i2c-pins-3-4 {

Usually bindings expect certain suffix or prefix. Are you sure this
passes dtbs_check?


Best regards,
Krzysztof


