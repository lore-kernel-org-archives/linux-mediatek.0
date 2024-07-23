Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660F6C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 13:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hztw1JV07q0zcTn4ERx2MJW+nf9ib/hl2J0PmH8KVX8=; b=Hlmkr3nHGPog9UXE6JtiEzrNkA
	4q2mN43exXHsYicflrrK7wGJ+8GnP355qfp2IfO4ukMQRGBcmIIsktC7tdstkxcs7VdJsxK+Ou1cC
	OdzRHHTpmf0S36PXd07xssqkAMVe1cMsJwRLe4i1S8DhNLF9+OY/I24qiZDOLHAPc8xAC1ot/8rWt
	cBafAXHx7DeAw7Lz4dVQTN8JYEdOdmmo9C/p78G29T689NX8ziy6TBngpXIuIsVNErvx08faX4pvE
	zrGFMAmClucf+Lxtm6I8XzoCO9lpZjacPHd0QJ3cao7Qj3q+4QfqO2U+9w/G7hEmOeHT8ShoRZGGv
	Clc7aTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWFtF-0000000CbvX-3pnc;
	Tue, 23 Jul 2024 13:49:17 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWFsr-0000000Cbqv-49E5;
	Tue, 23 Jul 2024 13:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721742530;
	bh=0101h3AR4t4tFHVUYl3vvkl6dP4t7mFrAs0dfnHYuhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yqs/oV3d3A1c9LPaI+1J5zcGWIdbIDEd8yNoKJImvMjSIp6l/09WU08rOuXUhLqyl
	 m9XQt16rECAQLjSLEJojCGwauE0Wc+HHvk8wlDyNEYGNzSNcXefQXGrg5tPrLXuYjn
	 mJXYXOp0n+koAORglzN6PNWoSFc8HRcvX16VQQ9d7Jqk5UonTABPcqWD1TYcHjWcnz
	 c8VvjbruG2l5h1T9ZQ0nWvBmIF/pgXn/PXswv7YI9SgZlXzDQF/VXmWV/ZuRWcG4h3
	 5xVnvwVt7Kc3XtFMPwtqsLKlBCQxC2KtXe7XhFW24XqoHMDz24MbtFRp0k9xhzhCqP
	 Az+w45WA3ZZKA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 07829378143B;
	Tue, 23 Jul 2024 13:48:49 +0000 (UTC)
Message-ID: <229cecc5-33b9-4ab7-bd3b-3243415cfa4e@collabora.com>
Date: Tue, 23 Jul 2024 15:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt8183: Add kukui-jacuzzi-cerise series
 boards
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240723-jacuzzi_dt-v1-1-3e994a2b5e24@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240723-jacuzzi_dt-v1-1-3e994a2b5e24@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_064854_196357_23F31D2E 
X-CRM114-Status: GOOD (  18.76  )
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

Il 23/07/24 11:56, Hsin-Te Yuan ha scritto:
> Cerise is known as ASUS Chromebook CZ1.
> Stern is known as ASUS Chromebook Flip CZ1.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>   .../dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts   | 25 ++++++++++++++++
>   .../dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi  | 21 +++++++++++++
>   .../dts/mediatek/mt8183-kukui-jacuzzi-stern.dts    | 35 ++++++++++++++++++++++
>   3 files changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts
> new file mode 100644
> index 000000000000..b4f4ed701253
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2021 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8183-kukui-jacuzzi-cerise.dtsi"
> +#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
> +
> +/ {
> +	model = "Google cerise board";
> +	compatible = "google,cerise-sku0", "google,cerise", "mediatek,mt8183";
> +};
> +
> +&mt6358codec {
> +	mediatek,dmic-mode = <1>; /* one-wire */
> +};
> +
> +&touchscreen {
> +	status = "disabled";
> +};
> +
> +&qca_wifi {
> +	qcom,ath10k-calibration-variant = "GO_CERISE";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
> new file mode 100644
> index 000000000000..087a0ef33e13
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2021 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8183-kukui-jacuzzi.dtsi"
> +
> +&cpu_thermal {
> +	sustainable-power = <4500>; /* milliwatts */
> +};
> +
> +&mmc1_pins_uhs {
> +	pins-clk {
> +		drive-strength = <MTK_DRIVE_6mA>;
> +	};
> +};
> +
> +&i2c2 {
> +	i2c-scl-internal-delay-ns = <13200>;
> +};

It's really just a few lines, unless more than two devicetrees use those, I'm
more for just putting those in cerise.dts and stern.dts instead of having yet
another dtsi to walk through...


> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts
> new file mode 100644
> index 000000000000..15e00feae3a9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2021 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8183-kukui-jacuzzi-cerise.dtsi"
> +#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
> +
> +/ {
> +	model = "Google stern board";
> +	compatible = "google,cerise-sku1", "google,cerise", "mediatek,mt8183";
> +};
> +
> +&mt6358codec {
> +	mediatek,dmic-mode = <0>; /* two-wire */
> +};
> +
> +&touchscreen {

You are referencing to the touchscreen@10 node from mt8183-kukui-jacuzzi.dtsi...

> +	status = "okay";

...which is not disabled by default, so this property is useless, and

> +
> +	compatible = "hid-over-i2c";

It's originally elan,ekth3500, you override it with hid-over-i2c, that's ok, but

> +	reg = <0x10>;

the node already has this property....

> +	interrupt-parent = <&pio>; > +	interrupts = <155 IRQ_TYPE_LEVEL_LOW>;

...and this one, actually even better, it's using interrupts-extended instead...

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&touchscreen_pins>;

....and it's the same for this

> +
> +	post-power-on-delay-ms = <10>;
> +	hid-descr-addr = <0x0001>;

...but those two aren't present.

So you only need three properties in here :-)

> +};
> +

Apart from that, there's no google,cerise (nor the skus, of course) in the bindings
so please add those to arm/mediatek.yaml between Burnet and Cozmo; only then I will
be able to accept new board dts.

Thanks!
Angelo


