Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6FCCAC58F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehDN8c0/F5eZ831IVZll96+NWY7i1QcRKUtRMZjXuP0=; b=YJenefy6GbM7e5
	vxXgPUYKy05nDlbIO0IHYdLmezB5d8T8Ux0d9BhwYi2rFA/jbSlXPnk6oWABrNSkPMRzE05lYfl10
	+s94wOUGvvtP/t14MxfvyNjpjd2yPqt5qafzvDo/Ridvt45J226fYlAiq0mpvpH0iHQuuvDFFUqS/
	kGF+aQSJa+y+d08AGiqNID84C/LZlSVWDJ43tU7VngcvbAaY1w21XpFJ5WnfboJf+4KLY5NaNauKm
	+fnHSiJOtMK6aN3hTcWX9SCqtDNIC/qwckJe4E4Qk2tnIG39qJcmOzLJYwRrkkqyU1in8fD2otp45
	pfu1kkvJyHm8+jSjabjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4dY-00000009pK2-1Eb1;
	Fri, 12 Sep 2025 14:20:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4dW-00000009pHC-0CnD
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 14:20:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45df656889cso13514955e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 07:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686824; x=1758291624; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ehDN8c0/F5eZ831IVZll96+NWY7i1QcRKUtRMZjXuP0=;
        b=hjRwr+qzMqmY4wGzy7aK21A8OffdPKy7QW6lnhR6O0VZhqeq2IzJKqFqwxFdUzLADF
         jlAmRmeuoSxj5aUUBLdROQTGHTGvvdtk12aaNSdv7ag06Tjir1gAKf3oPlsbF00EBzug
         yoiCLleIOZXM3ryvjqoHp12Stm68yKj647vpFSyAUGJi50oGpu8WhNbKb3mwMeAyGIPj
         5c/LxPC5I2cIWJ7us15H1crSBBLkFDU1a8hyuWWPA/lS2da2xjd/PWE0mZn/AtSXUbYz
         b8RLvPKstv1fpJQMesvSLxtifVHfRGBvlvP8gpcJCj0aVirPlHw3rXMWwt13j+7ZNdNh
         rjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686824; x=1758291624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehDN8c0/F5eZ831IVZll96+NWY7i1QcRKUtRMZjXuP0=;
        b=NgBlnnOTbDPV8CS0D4Kjosrs1NGpqTRqAd1FxJpeE7sG5G1d7Jxf9QqlHW8gZ8gICi
         11uE8pJRuneWsiQYPwJihtu/dpFQrb28UncQLfDEFfdWOgcEdhuQ8wD/FI+LEk9FU4oc
         A+r9jazPWRHWg655sAwrLfSV+OAj1xGw8iS5nSzU8i4MDT56T83FmCV4XHcyhrzbtExV
         fvgKxTSL75Dqj6pMasTFZaiBN8BZvRMVrhInDucnPeM0UuoqpWwzFNapwJgGUjl9us7Z
         jBY//sRlD5dYuw4XKk+IfOuClzO6hs5bM7b8ElIadxHrhfmqRSydXVDhmoGUkdbeDX2U
         CMVA==
X-Forwarded-Encrypted: i=1; AJvYcCWrvTdnEPL83cXO5e3Au5t2wehz9cZTaIGPRaD9rj/JsDX0QkRwdCQZ53LnLFx4ZJ1TFXNuFGAfJkgemOjllA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr2eBPGt9OtAdcc0lNBUfx7lDY0neDaIhFWzvGzO7GEpgs+RrH
	lzsayRRK4lziU7GspVUdl2TujFr51B6RKOo4OzyGZH4iwWKDIOpm4HGi
X-Gm-Gg: ASbGncsUZ8RrFLpZzOTFvG8mr+/qvSvJzwKHW9hYamtZGf4jW42Qe1a9ekPmrvROB29
	AnQL6p1Nchhq1WjMZq6fdNzsfXAERpuKhRqfR2E9kWShCn91Cvsnm8yUvJjqNx/u0RGT+mGPIZ2
	QkEnFB+ye19BM4limoRvhb160wSRWQS7MtAMKtqTm3Ge+WwmvKOQgK62W1JNtJYzZcAVdyF/83X
	qtxRmygK4Lo8GmowHNOWyfvi+w92kI+cOa3GxQybJCSR7aGDFtfMo89c27hSjFT/ONPOzmRsY1q
	LaL+ZrbIdZOPG4X15/u1GMi0w5fuVilQKzFRnQGV3ElZTdGvzEv0HsqHz21/6h9kkWaL1LaaKa7
	3ImaCUgPVJLeWYk1WV7ex8VQ5uMaflZM=
X-Google-Smtp-Source: AGHT+IHtSSdiDkUB898paY6KoQvNDE3OgBxVTaH21P4AnZRGobWI8BJOt5uErOIC2i3WhKinxdthWA==
X-Received: by 2002:a05:600c:4585:b0:45c:8e6d:a45f with SMTP id 5b1f17b1804b1-45f211caa28mr37824695e9.5.1757686823899;
        Fri, 12 Sep 2025 07:20:23 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e03729c76sm64384065e9.6.2025.09.12.07.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:20:21 -0700 (PDT)
Message-ID: <e06e9568-1129-4262-83a9-ab652101831a@gmail.com>
Date: Fri, 12 Sep 2025 16:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/38] arm64: dts: mediatek: Fix node name for SYSIRQ
 controller on all SoCs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-23-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-23-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072026_128883_34DA8A97 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
> The sysirq has "intpol-controller" as node name, but being this an
> interrupt controller, it needs to be named "interrupt-controller"
> as per what the bindings (correctly) expect.
> 
> This commit brings no functional changes, but fixes a dtbs_check
> warning.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt6755.dtsi | 2 +-
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 2 +-
>   arch/arm64/boot/dts/mediatek/mt6797.dtsi | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6755.dtsi b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
> index b55d3fac9bd4..8da5c0a56a02 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6755.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
> @@ -98,7 +98,7 @@ timer {
>   			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>   	};
>   
> -	sysirq: intpol-controller@10200620 {
> +	sysirq: interrupt-controller@10200620 {
>   		compatible = "mediatek,mt6755-sysirq",
>   			     "mediatek,mt6577-sysirq";
>   		interrupt-controller;
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> index 5c579e88e749..70f3375916e8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -138,7 +138,7 @@ ppi_cluster1: interrupt-partition-1 {
>   
>   		};
>   
> -		sysirq: intpol-controller@c53a650 {
> +		sysirq: interrupt-controller@c53a650 {
>   			compatible = "mediatek,mt6779-sysirq",
>   				     "mediatek,mt6577-sysirq";
>   			interrupt-controller;
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 38f65aad2802..58833e5135c8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -404,7 +404,7 @@ pwrap: pwrap@1000d000 {
>   			clock-names = "spi", "wrap";
>   		};
>   
> -		sysirq: intpol-controller@10200620 {
> +		sysirq: interrupt-controller@10200620 {
>   			compatible = "mediatek,mt6795-sysirq",
>   				     "mediatek,mt6577-sysirq";
>   			interrupt-controller;
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> index f2d93bf6a055..8ac98a378fd6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -228,7 +228,7 @@ apmixedsys: apmixed@1000c000 {
>   		#clock-cells = <1>;
>   	};
>   
> -	sysirq: intpol-controller@10200620 {
> +	sysirq: interrupt-controller@10200620 {
>   		compatible = "mediatek,mt6797-sysirq",
>   			     "mediatek,mt6577-sysirq";
>   		interrupt-controller;


