Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D69C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dlGI39JQqALUHfUmQGWiASAJ4j3ky473uzbCLo/SUs=; b=ONzdbp5xaW27qY
	n3+upyYJN4OjOWNwFpnaQnht/MovyX/e6Wb4iwAvWy3fkEEhQICDNk0gssgEW/9dogUWL2baeZ33A
	RTM9lDQEC1VqJzibohxWoVQLpfnF7Pp5zBRP0c0xDgHUOl++YTHin/DPQX9fY9dFfkKQXFF2+9DOk
	dkkktgK0MOKgQYAnY48synOEivELvd3uO17hQGrSJdUfoDYUpE6O4uCrX3lEXMzLNrmYGT3FmeMaF
	TtifSUa88hppbX4nt3FKn54Nb1H5V0XL03BLbaiOvRUDTJ3127xd4j4yDKOj5mYrK9igGvUVcIj/K
	q6JBQnGyfnHX38BR/jKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2tPu-004HDl-Q7; Thu, 30 Dec 2021 11:16:18 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2tPi-004HC6-Mt; Thu, 30 Dec 2021 11:16:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id s1so49783863wra.6;
 Thu, 30 Dec 2021 03:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QJiEW3Than3rNAQomxhEQoj2KzhEMy6qK6t7gwsr+2M=;
 b=HvHh4ijHNsHDvId2hGgky/aPU3nNWF8es4944u4HzdAlAe03sTNPZeaac+m5be6+3O
 LtejdCYXCu587yewIk+PeFKRAZyLyXmkFSJoOe9yjKzZ4gVkYSPxPM9fJc4ihnIWZHir
 oTHXSwxHLeyD4HtU5EPsieyaW+h0F+ZSTj0rZm+nyYK7nQHGt9iWziw7Le2YQ32hkjeE
 0HX/F/zOxxQ5WrqNUHGkZwzOO7/4/HaJMfbWO/EFWTLB4mzTwNj0qMXHNb7PmWKF/lA7
 jfoEw+Zv2dTApwaijFc1ExIlAXHg4UFVm+u44nkptRc5S5vLnCRYiy/A8xm8vnYpbmbC
 Db1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QJiEW3Than3rNAQomxhEQoj2KzhEMy6qK6t7gwsr+2M=;
 b=XhZ8q2mXxTsTK87RFijLYGDlMEWmoNad41YYR+xE4WGp3plSQ63FaNMbZQzBSmgKbn
 J2dYOE8yGUK+a+nbJ0IsUWQC5WE5Qe4YvoWkGR8P6Ez5Wi0HfH0wDynfKJ7ZdnN3tJSB
 2lNGJA/j4fukI5o5JFw2W4gj/ZmdfpZT/sLvU+4OKXmbIxEvvQLJvlmCnR8shKrz4s6T
 5VYi+sKPc0S8R/CvAe+yoSoitLM+Hl643J2ExQyKQo6hvYCEzG6/Xoy93drolDTM5DYV
 h/ikv/SbYauzkpCUJ7386GcAi5yZy1GngDKPd6ITl7oMv4Jp0abvdpbN9UdT+7FAzJbh
 9eDA==
X-Gm-Message-State: AOAM533fC9Cg60PjWBY1s/04L2/ed53M99M2JvwrGBj9QAXAaJ7v3ind
 Lkino6ocww3MKe4lfAobxak=
X-Google-Smtp-Source: ABdhPJzAMl+79ZfKoM1ZNLCqQyUAb6N3yNKY7N29NsxfWK7w9PU8HOTmyKvUHqLoLn1KDOLK/JOqqQ==
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr25032781wry.495.1640862963935; 
 Thu, 30 Dec 2021 03:16:03 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id c9sm22553801wml.12.2021.12.30.03.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 03:16:03 -0800 (PST)
Message-ID: <2698260b-43c1-6fbd-b3af-fac01ee48c82@gmail.com>
Date: Thu, 30 Dec 2021 12:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/4] arm64: dts: mt8183: Add katsu board
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211213162856.235130-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211213162856.235130-1-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_031606_803482_9C59A4DF 
X-CRM114-Status: GOOD (  17.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/12/2021 17:28, Hsin-Yi Wang wrote:
> Katsu is known as ASUS Chromebook Detachable CZ1.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> This patch depends on [1] to add Himax8279d MIPI-DSI LCD panel driver.
> 
> [1] https://patchwork.freedesktop.org/patch/462468/
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>   .../dts/mediatek/mt8183-kukui-katsu-sku32.dts | 38 +++++++++++++++++
>   .../dts/mediatek/mt8183-kukui-katsu-sku38.dts | 42 +++++++++++++++++++
>   3 files changed, 82 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 1613259b686576..c130518c3293d5 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -28,6 +28,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu-sku22.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-katsu-sku32.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-katsu-sku38.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku288.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> new file mode 100644
> index 00000000000000..f923b8c3c49c36
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2021 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8183-kukui-kakadu.dtsi"
> +#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
> +
> +/ {
> +	model = "MediaTek katsu board";
> +	compatible = "google,katsu-sku32", "google,katsu", "mediatek,mt8183";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	/delete-node/touchscreen@10;
> +	touchscreen1: touchscreen@5d {
> +		compatible = "goodix,gt7375p";
> +		reg = <0x5d>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&open_touch>;
> +
> +		interrupt-parent = <&pio>;
> +		interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
> +
> +		reset-gpios = <&pio 156 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&panel {
> +	compatible = "starry,2081101qfh032011-53g";

Compatible not present in DT-Bindings.

> +};
> +
> +&qca_wifi {
> +	qcom,ath10k-calibration-variant = "GO_KATSU";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> new file mode 100644
> index 00000000000000..1ab14096a279c6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2021 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8183-kukui-kakadu.dtsi"
> +#include "mt8183-kukui-audio-rt1015p.dtsi"
> +
> +/ {
> +	model = "MediaTek katsu sku38 board";
> +	compatible = "google,katsu-sku38", "google,katsu", "mediatek,mt8183";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	/delete-node/touchscreen@10;
> +	touchscreen1: touchscreen@5d {
> +		compatible = "goodix,gt7375p";
> +		reg = <0x5d>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&open_touch>;
> +
> +		interrupt-parent = <&pio>;
> +		interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
> +
> +		reset-gpios = <&pio 156 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&panel {
> +	compatible = "starry,2081101qfh032011-53g";


Same here.

Regards,
Matthias

> +};
> +
> +&qca_wifi {
> +        qcom,ath10k-calibration-variant = "GO_KATSU";
> +};
> +
> +&sound {
> +	compatible = "mediatek,mt8183_mt6358_ts3a227_rt1015p";
> +};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
