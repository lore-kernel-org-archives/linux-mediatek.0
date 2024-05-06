Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C73C25B5F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxom0z842nlDF3xp6URF7mELMQBM07NX2QlRBP0eQIM=; b=sVmI5MBU0FqbQ7
	eST1+ZTxB/+biOfBx59wl5a84qex0LCUlxoUSMh+81UFYrT8Q3n96D4Cwt6sqNGOcM3il/TJeOc8s
	srd1KgF+64IeaT6P8t43ADMd8LcZuhKd+fV0Q7yJd+j+o3oFE7UkgHOKSVWVo2kr5Q/idEe4D9NPt
	ZMtTk3RTRNrKXEFPvPl60/2eTrZu4aIkmQjL9FH1FmL3aXeVmz4q0d1CRpwX5vReBJi1awLsNYhPp
	WYoHc7lMc06YdRh0YGBOGbxQ/v2co3TEqSxzbWLL/urJ1ZQNX0gaFMZ1XObKxqOWpPZStRROg9Kkr
	JszLAlhKj/W9cKOrIYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xmN-00000007LLk-2fJR;
	Mon, 06 May 2024 12:49:15 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xmC-00000007LB4-2G36;
	Mon, 06 May 2024 12:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714999742;
	bh=2oBQSzZfrsPoLPKYfY3SQczWXSAvlBqiIyWSsQhNYMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GAvw+jrfA1VJtA7Ai+fzIVi9HUWeJ3Z1JKjLH62eln6cImgj2JVD0poirjmtckcfy
	 BLNMjen6TmHUi2uRuIm8v72yI9YLt/pdFaCjQi9IBfWEPtkBKIwKCKjmEoMqk3NnZ7
	 gEsA5Sn3yrqI2eQsBJbi4o/KMufjj3ni+ry+2i3R7waEJDRPeJDE/41TkKfrPCKm8s
	 hHl1Y9Xu/dec0W3rdNiKFQT6x/+R8XaHPafxu70dV/+PumWVFXNhFGyBgX4r68dU5n
	 WzKYxaIMzmkIERr1jZAQiOASmL36BX7NPrTDCg8VZ5DRuyhXWP3yxIJqxCv/IDy6Xt
	 aqDw3DltBgzWg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D3A2B3782060;
	Mon,  6 May 2024 12:49:00 +0000 (UTC)
Message-ID: <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
Date: Mon, 6 May 2024 14:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 5/5] arm64: dts: mediatek: Add mt7986 based Bananapi R3
 Mini
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240505164549.65644-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_054904_897550_7EDB71B0 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, Tianling Shen <cnsztl@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 05/05/24 18:45, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add device Tree for Bananapi R3 Mini SBC.
> 
> Co-developed-by: Eric Woudstra <ericwouds@gmail.com>
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> Co-developed-by: Tianling Shen <cnsztl@gmail.com>
> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>   .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 486 ++++++++++++++++++
>   2 files changed, 487 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 37b4ca3a87c9..1763b001ab06 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-mini.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> new file mode 100644
> index 000000000000..c764b4dc4752
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> @@ -0,0 +1,486 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Authors: Frank Wunderlich <frank-w@public-files.de>
> + *          Eric Woudstra <ericwouds@gmail.com>
> + *          Tianling Shen <cnsztl@immortalwrt.org>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
> +#include "mt7986a.dtsi"
> +
> +/ {
> +	model = "Bananapi BPI-R3 Mini";
> +	chassis-type = "embedded";
> +	compatible = "bananapi,bpi-r3mini", "mediatek,mt7986a";
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
> +	dcin: regulator-12vd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "12vd";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	fan: pwm-fan {
> +		compatible = "pwm-fan";
> +		#cooling-cells = <2>;
> +		/* cooling level (0, 1, 2) - pwm inverted */
> +		cooling-levels = <255 96 0>;

Did you try to actually invert the PWM?

Look for PWM_POLARITY_INVERTED ;-)

> +		pwms = <&pwm 0 10000>;
> +		status = "okay";
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1.8vd";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&dcin>;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3.3vd";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&dcin>;
> +	};
> +
> +	usb_vbus: regulator-usb-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpios = <&pio 20 GPIO_ACTIVE_LOW>;
> +		regulator-boot-on;
> +	};
> +
> +	en8811_a: regulator-phy1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "phy1";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pio 16 GPIO_ACTIVE_LOW>;
> +		regulator-always-on;
> +	};
> +
> +	en8811_b: regulator-phy2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "phy2";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pio 17 GPIO_ACTIVE_LOW>;
> +		regulator-always-on;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		green_led: led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_POWER;
> +			gpios = <&pio 19 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		reset-key {
> +			label = "reset";
> +			linux,code = <KEY_RESTART>;
> +			gpios = <&pio 7 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +};
> +
> +&cpu_thermal {
> +	cooling-maps {
> +		map0 {
> +			/* active: set fan to cooling level 2 */
> +			cooling-device = <&fan 2 2>;
> +			trip = <&cpu_trip_active_high>;
> +		};
> +
> +		map1 {
> +			/* active: set fan to cooling level 1 */
> +			cooling-device = <&fan 1 1>;
> +			trip = <&cpu_trip_active_med>;
> +		};
> +
> +		map2 {
> +			/* active: set fan to cooling level 0 */
> +			cooling-device = <&fan 0 0>;
> +			trip = <&cpu_trip_active_low>;
> +		};
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
> +		phy-handle = <&phy14>;
> +	};
> +
> +	gmac1: mac@1 {
> +		compatible = "mediatek,eth-mac";
> +		reg = <1>;
> +		phy-mode = "2500base-x";
> +		phy-handle = <&phy15>;
> +	};
> +
> +	mdio: mdio-bus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_pins_default>;
> +	pinctrl-1 = <&mmc0_pins_uhs>;
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&reg_1p8v>;
> +};
> +
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c_pins>;
> +	status = "okay";
> +
> +	/* MAC Address EEPROM */
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +
> +		address-width = <8>;
> +		pagesize = <8>;
> +		size = <256>;
> +	};
> +};
> +
> +&mdio {

You can just move all this stuff to where you declare the mdio-bus....

> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	phy14: ethernet-phy@14 {

I say that this is `phy0: ethernet-phy@14` - because this is the first PHY on this
board.

> +		reg = <14>;

Uhm.. doesn't this require the ethernet-phy-id03a2.a411 compatible?

> +		interrupts-extended = <&pio 48 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pio 49 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <20000>;
> +		phy-mode = "2500base-x";
> +		full-duplex;
> +		pause;
> +		airoha,pnswap-rx;
> +
> +		leds {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 { /* en8811_a_gpio5 */
> +				reg = <0>;
> +				color = <LED_COLOR_ID_YELLOW>;
> +				function = LED_FUNCTION_LAN;
> +				function-enumerator = <1>;

Why aren't you simply using a label?

> +				default-state = "keep";
> +				linux,default-trigger = "netdev";
> +			};
> +			led@1 { /* en8811_a_gpio4 */
> +				reg = <1>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				function = LED_FUNCTION_LAN;
> +				function-enumerator = <2>;
> +				default-state = "keep";
> +				linux,default-trigger = "netdev";
> +			};
> +		};
> +	};
> +
> +	phy15: ethernet-phy@15 {
> +		reg = <15>;

Same here.

Cheers,
Angelo


