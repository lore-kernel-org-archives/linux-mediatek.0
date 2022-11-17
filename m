Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A786C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jw7AXNLDquiKmb0cINuRMfIIFbIpSHUSTUYkwNek1L8=; b=p0rnrdeM5mGjUmfl4nMvQ48Gei
	fFlpwXU3yxzQf8e2TtZKpJuHNpkABiJNxykzLOZV5gt+plBzMAEpy+cAMH5hntCS2Z1X3xvP8e34b
	qESmkQSRi2UsiyOo+kGj8QL/c4bXE4EBJfZu6MRntZeeQfnEedGohImaFvHHG6jF0JDVicOyQrhnf
	EHJj84683CvebxIGIwLnk16Qovt1JvC9wfFFOoVh7n6g+eng+l5COHUvGddjhnBKYJKgFwdLgITjJ
	PwJ0d35gnouGzmvvpgyUY+VN1xZw/vYmlXz/KyJeCsYFTuUdGB0qr1SV0e8+XTLFH42EgOqGdfk72
	3XjL88Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhFv-00FbOL-34; Thu, 17 Nov 2022 15:56:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhFs-00FbLB-PF; Thu, 17 Nov 2022 15:56:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so2096918wmg.2;
        Thu, 17 Nov 2022 07:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jw7AXNLDquiKmb0cINuRMfIIFbIpSHUSTUYkwNek1L8=;
        b=EMUM9y0qHFTq+fyZfZPjr80/ZVBOVEtb/zBw5xodvQA4wG6FLabyEIo8El5oxnRoL9
         WTu5f+yqCYJajEvu4a94XN2XfeQN3HoNS1HY4b8X67zajEYV2cG0dySjS8Lz8nhRJhC3
         B2ZOB47D/YZuR4Z5fc5vUJbTNZRrGddtS1caO+4A07Yv0BaeBah1apqpbIRMWxYHGL24
         DA1fcNj44DcfL3eH4u0JfM++YqLwEiu9TPuNaHfETpnZGlLCR8EMKiqqtCcaZqIP/hEF
         OMKPmThfVFPXZ7s9ZPza5sJGl/XSZgyiBJjjNhBHHavxffgtIye+/zLC4nCvW6amGZqB
         68eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jw7AXNLDquiKmb0cINuRMfIIFbIpSHUSTUYkwNek1L8=;
        b=SwzWP3VJJF6PABe68Gc8Ps3FuOL4+4at36yjcI80EdKEBaMcEg9RDDO8eYiOvoBjEZ
         6+H1DYVxMJ9F7JOiSrc5auh3UhExuMosPeb+TJ8pR2q42lGv3tO1oHWJtlkBRnbfMK5m
         +6LNCWwaES2fHOIu1FYONjFRNOwQgwva6+yHaJt6PMQiSfzfKUDTTQ6ARE6nDmc+NqJM
         C3LO24ge6BV0GXD4ETS20b1j0se0ljhDdmFEhuA0/OFACokdW8I9JxlWwuFgXntdasA/
         OJO/kot/gg848ZGgwbEylYAwbYKjLm4kuDeTmq0cOT5cb9MVFgMdP4fyAWT3hsDeQeBc
         K9/A==
X-Gm-Message-State: ANoB5pkGKeROnE+bEzviLo7/lcTygcUX/EC8ttKWuic18QX4uKfLCaZf
	k0h5xhKrOmLeI8V6Lv/FyCM=
X-Google-Smtp-Source: AA0mqf7PU6ZAl4D73Eqi1u337u3E+gX3npBMxRRcNin3zcfg82KMPzDIVP8aXn+bmx3EksJgOFP/Zw==
X-Received: by 2002:a7b:ca53:0:b0:3cf:74ef:3313 with SMTP id m19-20020a7bca53000000b003cf74ef3313mr2170849wml.41.1668700602684;
        Thu, 17 Nov 2022 07:56:42 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t1-20020a1c7701000000b003cf4d99fd2asm1612146wmi.6.2022.11.17.07.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 07:56:41 -0800 (PST)
Message-ID: <10300d7f-30d5-7601-6f79-10c6799c89b3@gmail.com>
Date: Thu, 17 Nov 2022 16:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 08/10] arm64: dts: mt8173: change node name
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Flora Fu <flora.fu@mediatek.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-8-8210d955dd3d@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221005-mt6357-support-v5-8-8210d955dd3d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_075644_866969_F4CD1F0D 
X-CRM114-Status: GOOD (  16.02  )
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



On 16/11/2022 13:33, Alexandre Mergnat wrote:
> - Change the node name from "mt6397" to "pmic" to be consistent
> with mediatek,pwrap.yaml documentation.
> 

Same here as in 7/10.

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
>   arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index e21feb85d822..a8f5c48e1782 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -913,7 +913,7 @@ &pwm0 {
>   };
>   
>   &pwrap {
> -	pmic: mt6397 {
> +	pmic: pmic {
>   		compatible = "mediatek,mt6397";
>   		#address-cells = <1>;
>   		#size-cells = <1>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index 0b5f154007be..755df5694234 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -300,7 +300,7 @@ &pwrap {
>   	/* Only MT8173 E1 needs USB power domain */
>   	power-domains = <&spm MT8173_POWER_DOMAIN_USB>;
>   
> -	pmic: mt6397 {
> +	pmic: pmic {
>   		compatible = "mediatek,mt6397";
>   		interrupt-parent = <&pio>;
>   		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
> 

