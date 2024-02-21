Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D745BC48BF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZkk+VifwTVhwQXd5JCWCyfB6CF9OiAs/R8LFPJZnu4=; b=yU8epedZ4s/Jn9E7ulUEZ5pdrA
	RmnBE3chaPF7daGoiFFnTVf0sGa7dSydNpQZuqmwww9JMdRrL40kOj1Y691WrcLMQiomK+JQGhH8s
	HjKF9f+hGIsdKJ3hMUGMyydo93vKBj7GvzKFMWMrH1ktjYqgPjdQvsXm189VBmTu66jyVA2fnQ9f2
	djyIQeATGPcJEAraGK5073KApSw23OthTJE6UGWfkarlQwYP1RlCp+TO4LdvlFdjckC8djYnt57f+
	GWSMvK4tGzCpzrHibIwSrizS94j5fFjSu3qTU180SxcGToKQ+yj5VYrBAxkVfMvEG8eoOogc1uVhd
	gDFx7M9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjZQ-00000000Ram-1Om4;
	Wed, 21 Feb 2024 10:11:20 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjZN-00000000RZC-1fGT;
	Wed, 21 Feb 2024 10:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708510276;
	bh=PQ4awJ6u0XbeOr9tOY44kUabcmxQpFzwRQS1dKIQKTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Du87FHdkJ/XW+3K5x6dd3zCH92Bw9hgZVorVoMzH/4EegYAWh1H67UQNi9rUtSotL
	 NPqVL6lW0d2iIHN8/OKwf9RR2fB8tIkDSHQCERSzVpxYIcn7ktN5Kw80mmkw8oTKsX
	 NxaeSqV+LWm+fslV/0TURzqVr8hwuab/Y+NObBfOqwxljwaDKIyN5bPg17Oh4XVKEc
	 vmcZPgwQ5N7Jai2SIamTtxJG7OBb2wFv8enNqwoyByFsoaU587dkvS+4bJozzhY+SG
	 u6cE4QRUurQhRTJOG0mZB3lX/r20xyHmE9oEG22E5GLnJbi3l2Ji9N80dhIOKgM/US
	 7M3mC2oINYOvQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BB8FD378107C;
	Wed, 21 Feb 2024 10:11:14 +0000 (UTC)
Message-ID: <2fdf724e-4994-4873-971a-56c19b9fc471@collabora.com>
Date: Wed, 21 Feb 2024 11:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: Add Cudy WR3000 V1
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240221073524.20947-1-zajec5@gmail.com>
 <20240221073524.20947-5-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240221073524.20947-5-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_021117_589700_1609652D 
X-CRM114-Status: GOOD (  16.29  )
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

Il 21/02/24 08:35, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Cudy WR3000 V1 is an MT7981B (AKA Filogic 820) based wireless router. It
> has 256 MiB of RAM, some LEDs & buttons and (not described yet) 4
> Ethernet ports.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>   .../dts/mediatek/mt7981b-cudy-wr3000-v1.dts   | 74 +++++++++++++++++++
>   2 files changed, 75 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 37b4ca3a87c9..96da4ad640aa 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts b/arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts
> new file mode 100644
> index 000000000000..cb36a089518a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +/dts-v1/;
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +#include "mt7981b.dtsi"
> +
> +/ {
> +	compatible = "cudy,wr3000-v1", "mediatek,mt7981b";
> +	model = "Cudy WR3000 V1";
> +
> +	memory@40000000 {
> +		reg = <0 0x40000000 0 0x10000000>;
> +		device_type = "memory";
> +	};
> +
> +	keys {
> +		compatible = "gpio-keys";
> +
> +		key-wps {
> +			label = "WPS";
> +			gpios = <&pio 0 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_WPS_BUTTON>;
> +		};
> +
> +		key-reset {
> +			label = "RESET";
> +			gpios = <&pio 1 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_RESTART>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			function = LED_FUNCTION_WAN;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 5 GPIO_ACTIVE_LOW>;

Can we please order those properties alphabetically, as it doesn't impact
on human readability in any way?
Just a nitpick, anyway.

color = <LED_COLOR_ID_BLUE>;
function = LED_FUNCTION_WAN;
gpios = <&pio 5 GPIO_ACTIVE_LOW>;

> +		};
> +
> +		led-1 {
> +			function = LED_FUNCTION_WLAN_2GHZ;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 6 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-2 {
> +			function = LED_FUNCTION_WLAN_5GHZ;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 7 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-3 {
> +			function = LED_FUNCTION_LAN;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 9 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-4 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 10 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-5 {
> +			function = "online";

Uhm, what does "online" mean?

Are you sure that you can't use any of the LED_FUNCTION_XXX standard definitions?

Cheers,
Angelo


