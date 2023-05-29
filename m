Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C672FC7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czUg0GEsA4/pXkVvDlCWQ/xq4KtcNj5P7Uchklz5mQ8=; b=jRFmmIVcZVcQ6EbsxuroDf+IGY
	ScZGzl9s5JoW2Rqae0biAe3+u0Da/tpsiCzWKdM1UkNdZbbdEKVueKC06hPE7kFuU8aOBjL5OxPQH
	jmfywHkH4MOFixWJoe3H+O8Ui+JYFxXcB+K84CqflS026OQkxA7VMe7RrzL7o9eBbXOQElrM6Z1k3
	QtOo6iinFZ9xgD11/zCcZ/iiVw9tyUDwseiUcexzkr/xl1dKub+WBmzX1aKP6gCBNt1NTAMkbYVeh
	4hvDxlmv8/5mFZOIekrWM1eXpPYE6nTv/tHF6dZYM7ss/22jThxR5Fa7WAqbAvfwyc9HWA+34+MhF
	36RJDgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dQF-00Ah8B-1e;
	Mon, 29 May 2023 14:00:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dQC-00Ah77-2x;
	Mon, 29 May 2023 14:00:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30a892c45c4so1955165f8f.3;
        Mon, 29 May 2023 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685368825; x=1687960825;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czUg0GEsA4/pXkVvDlCWQ/xq4KtcNj5P7Uchklz5mQ8=;
        b=j6QlqVGDsb5MBvK6xpO9PmsCQzkb4YXc9jTOoj10YSyM3wKNZ7U9/DJfUoZZ9y7iF3
         aVPBszW4LrX4/yBLrPONK9Hya6xe/RJOQfU9SBS7Ygiz1WYILg69U4iYndjLN8aSXQ9H
         kKTVf8maGXd/Fv/aePNTtlrSxhhPcgTncc/qlCZHwd9tVhJngCXRjGsUg0OukApB0KYC
         PyjA0zfJhv/CumecS1wyWxunseHmCn0rU5IePGNMLoS7MlEcpe94wp+v8yMzWZW2sCQz
         o4o6FMk3v+Q0z0gEuPojqAcUBrJvy8Rvndm1eMod030LPgiCRvW0A32+fS/XG6Qbau6Y
         aELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368825; x=1687960825;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czUg0GEsA4/pXkVvDlCWQ/xq4KtcNj5P7Uchklz5mQ8=;
        b=XnzEs/Mlw0P0oUVUUDp7O5UH2QHuhAKH4ZK5G+zmvZ5m0hcF4ACjPVdpy4Em2Hp81T
         N50jqfPC6oogFf2EjysfTbTUngWmuyMoB6VEfKfdjCKoUeHtskhvhDQUMgG5PjLWBHN6
         PJfXMvjoO7kN5dqxvqva8jBj32LDd5tHrz1hisnv/XMy5Mn6/wfILSBWkAc7x/QpqC2S
         MsMbgyN0VaTogapvmH5pDMxesqsZqTSl3zrF5fVwJwBVVMdFJhDGvUL9arCCENsw8Gi7
         U300mOs5YL7OhXra+vSNYsTJ+tlN1jnrev2JZlg9yrH9QFOB631b4AQy/kq4x45uqKCw
         hqzw==
X-Gm-Message-State: AC+VfDyrIPbVRa8YrwwmjOAor9OBOTppgURHOOqNtnAAeBGWgmHEe3Cc
	j6O3tmbzv2b/7oTd9jYJoPo=
X-Google-Smtp-Source: ACHHUZ5YY0F8kf9d0QDQxU1ifflONL13Hhhhoz7ubJbKMoUbd8atPVWeXbHNhdhapWASVn5XN1KjHQ==
X-Received: by 2002:adf:f512:0:b0:307:88ba:c999 with SMTP id q18-20020adff512000000b0030788bac999mr7756125wro.62.1685368825106;
        Mon, 29 May 2023 07:00:25 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e6-20020adffc46000000b0030631f199f9sm68502wrs.34.2023.05.29.07.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 07:00:24 -0700 (PDT)
Message-ID: <731fa0b6-5576-94fc-7cf5-0ec768db9c7d@gmail.com>
Date: Mon, 29 May 2023 16:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 24/27] arm64: dts: mediatek: mt6795-xperia-m5: Add MT6331
 Combo PMIC
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-25-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-25-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_070028_958106_4ADF63EE 
X-CRM114-Status: GOOD (  18.01  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> This smartphone uses the Helio X10 standard MT6331+MT6332 combo PMICs:
> include the mt6331 devicetree and add the required interrupt.
> 
> Note that despite there being two interrupts, one for MT6331 and one
> for MT6332, in configurations using the companion PMIC, the interrupt
> of the latter fires for both events on MT6331 and for ones on MT6332,
> while the interrupt for the main PMIC fires only for events of the
> main PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> index a0e01a756f03..debe0f2553d9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> @@ -7,6 +7,7 @@
>   /dts-v1/;
>   #include <dt-bindings/gpio/gpio.h>
>   #include "mt6795.dtsi"
> +#include "mt6331.dtsi"
>   
>   / {
>   	model = "Sony Xperia M5";
> @@ -219,6 +220,15 @@ pins-tx {
>   	};
>   };
>   
> +&pmic {
> +	/*
> +	 * Smartphones, including the Xperia M5, are equipped with a companion
> +	 * MT6332 PMIC: when this is present, the main MT6331 PMIC will fire
> +	 * an interrupt on the companion, so we use the MT6332 IRQ GPIO.
> +	 */
> +	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
>   &uart0 {
>   	status = "okay";
>   

