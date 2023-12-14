Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94AAC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lqm+O42Et0l1C8kjCXTEaZPYl4lSAnjZoxDsY05ULg=; b=CbqioEiDwdQWa8fsFt0JVo59ad
	o+dQkbPps8exjJRNK6jUuW/Z0eV8femiaxZ/5nkaaYC1yy4DXkxC2YL7Eg4m+wrdEx4FTvlraRNVD
	AalQmo6UBO8tP3LMAjPyS6lT5J5OjfVSsDDRt/ezw1JErHBEM1I996ARZMJF0eQ3ep94HOmq6NGSS
	8sQfi/k30kEusYO+7vmmRtBv0H0u90ArhMZWaJlhnq9NTaPWDL0C43vk5dLa3MmW2cx1pr/iB3rmh
	KzWtjGrbex+A8WXgs6BoCM4Sbua+RNmWeHFK1R4pf5Rib+o+mci2/Wc1Teiwx+E6FYqFeY5PPUnxb
	vGbqh/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj0P-00HTmQ-2m;
	Thu, 14 Dec 2023 10:31:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj0M-00HTlB-2H;
	Thu, 14 Dec 2023 10:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702549903;
	bh=hAEE7gN/tX8xVA6dmhtKspxa0JnRlGiTqZPWAS3zgDY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uqycB/5RIGAkwL3i+H8xhqNcU3DDhsjo6RCTvOyBuZVcSYxuk9BdrepCKV7XxrJVR
	 1wA2DrKCxY6hMxHSX4LpIp6XF2uypcIY7d7hlP6ItfpgMibAP4OlSTagHMfvUnXrob
	 fORXnpWP1gDU+5SI+xtxjfxb9uDUZzzdwPCy+oF54gBSnAPI9/X8vyduw14+E2An/B
	 iozcd6fInEgMZl5HLQ1IOQ52Y16TIk84nX1+I1aHqJ4AHbe+s6OlV+Z+PNNNVG0AFs
	 pbFuzogNkQkk7Oba4znaBYFPB9+U2Nk+WmEjEOZiA39HF9+JG6zLbfJxxhk4LGpcPD
	 SPT4wYIgA4IOA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4E065378000B;
	Thu, 14 Dec 2023 10:31:42 +0000 (UTC)
Message-ID: <13c8ccbc-0eef-43f5-ae37-29ec64d1606b@collabora.com>
Date: Thu, 14 Dec 2023 11:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eugen Hristev <eugen.hristev@collabora.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231213150435.4134390-1-wenst@chromium.org>
 <20231213150435.4134390-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231213150435.4134390-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_023146_879723_65FAE2AB 
X-CRM114-Status: GOOD (  27.99  )
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

Il 13/12/23 16:04, Chen-Yu Tsai ha scritto:
> Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> Krabby design.
> 
> Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> convertible device with touchscreen and stylus.
> 
> Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
> device. It does not have a touchscreen or stylus.
> 
> The two devices both have two variants. The difference is a second
> source touchpad controller that shares the same address as the original,
> but is incompatible.
> 
> The extra SKU IDs for the Tentacruel devices map to different sensor
> components attached to the Embedded Controller. These are not visible
> to the main processor.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes since v3:
> - Reorder some properties to conform better to the newly proposed DT
>    style guidelines
> - Drop unused labels
> - Rename bt-sco node name to bt-sco-codec
> - Drop i2s*-share properties from afe node
> - Drop aud_gpio_tdm_{on,off} pinctrl nodes
> - Replace interrupts with interrupts-extended in tpm node
> - Enable adsp device
> 
> Changes since v2:
> - Picked up Conor's ack
> - Rename touchpad to trackpad
> - Drop pinctrl properties from trackpad in tentacruel/tentacool second
>    source trackpad
> 
> Changes since v1:
> - Reorder SKU numbers in descending order.
> - Fixed pinconfig node names
> - Moved pinctrl-* properties after interrupts-*
> - Switched to interrupts-extended for external components
> - Marked ADSP as explicitly disabled, with a comment explaining that it
>    stalls the system
> - Renamed "touchpad" to "trackpad"
> - Dropped bogus "no-laneswap" property from it6505 node
> - Moved "realtek,jd-src" property to after all the regulator supplies
> - Switched to macros for MT6366 regulator "regulator-allowed-modes"
> - Renamed "vgpu" regulator name to allow coupling, with a comment
>    containing the name used in the design
> - Renamed "cr50" node name to "tpm"
> - Moved trackpad_pins reference up to i2c2; workaround for second source
>    component resource sharing.
> - Fix copyright year
> - Fixed touchscreen supply name
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |    4 +
>   .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  129 ++
>   .../mt8186-corsola-tentacool-sku327681.dts    |   57 +
>   .../mt8186-corsola-tentacool-sku327683.dts    |   24 +
>   .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
>   .../mt8186-corsola-tentacruel-sku262148.dts   |   26 +
>   .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1707 +++++++++++++++++
>   7 files changed, 1991 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index e6e7592a3645..442af61b1305 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -43,6 +43,10 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327683.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262144.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262148.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r5-sku2.dtb

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
> new file mode 100644
> index 000000000000..447b57b12b41
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +
> +#include "mt8186-corsola-tentacruel-sku262144.dts"
> +
> +/ {
> +	compatible = "google,tentacruel-sku262151", "google,tentacruel-sku262150",
> +		     "google,tentacruel-sku262149", "google,tentacruel-sku262148",
> +		     "google,tentacruel", "mediatek,mt8186";
> +};
> +
> +/* This variant replaces only the trackpad controller. */
> +&i2c2 {
> +	/delete-node/ trackpad@15;
> +
> +	trackpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x15>;
> +		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> +		hid-descr-addr = <0x0001>;
> +		vdd-supply = <&pp3300_s3>;
> +		wakeup-source;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> new file mode 100644
> index 000000000000..adbeb0c765d3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -0,0 +1,1707 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2022 MediaTek Inc.
> + */
> +/dts-v1/;
> +#include "mt8186.dtsi"
> +#include <dt-bindings/pinctrl/mt8186-pinfunc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
> +

..snip..

> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	/*
> +	 * Trackpad pin put here to work around second source components
> +	 * sharing the pinmux in steelix designs.
> +	 */
> +	pinctrl-0 = <&i2c2_pins>, <&trackpad_pin>;
> +	clock-frequency = <400000>;
> +	i2c-scl-internal-delay-ns = <10000>;
> +	status = "okay";
> +
> +	trackpad@15 {
> +		compatible = "elan,ekth3000";

You forgot to change this one.

Remove compatible from this node and stop using /delete-node/ in device specific
devicetrees.

> +		reg = <0x15>;
> +		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply = <&pp3300_s3>;
> +		wakeup-source;
> +	};
> +};


corsola.dtsi (here):

&i2c2 {
	pinctrl-names = "default";
	/*
	 * Trackpad pin put here to work around second source components
	 * sharing the pinmux in steelix designs.
	 */
	pinctrl-0 = <&i2c2_pins>, <&trackpad_pin>;
	clock-frequency = <400000>;
	i2c-scl-internal-delay-ns = <10000>;
	status = "okay";

	trackpad_i2c2_15: trackpad@15 {
		/*
		 * Those are common properties for i2c2 trackpad on Corsola boards.
		 * The compatible string is declared in device specific devicetrees
		 */
		reg = <0x15>;
		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
		vcc-supply = <&pp3300_s3>;
		wakeup-source;
		status = "disabled";
	};
};

corsola-some-device.dts:

&trackpad_i2c2_15 {
	compatible = "hid-over-i2c";
	hid-descr-addr = <0x0001>;
	status = "okay";
};

corsola-some-other-device.dts:

&trackpad_i2c2_15 {
	compatible = "elan,ekth3000";
	status = "okay";
};

....everything else looks good.

Cheers,
Angelo

