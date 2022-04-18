Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A82C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 11:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKCIYZAjGS11JjL8meDyImHnfCfrpvMaGGvRHGzMgD4=; b=xI4MD8t+9lAf4T
	tls0OgzH2rFC9GGKcXqeOxnwVW/lLuAoUkXYJABIPUQwj2i6DRFUHulLo5iPKwgwJTnokL/yhmkpv
	l3vyE+6huTeliKA8lK4D96PA/CH1/dQGXpY7qXZashfogsg0S6yUpKWA+peh0vxTrpG0U2ruthChn
	c3drr/iK1Dc99ZVVbz3gbgf5JLECVxWVUA6kn2Wp4nT/2Qml2kO2g5HWilA8pEC7S9j/n4oG/CRta
	ALQu3hkWxwbkxh0akyarvxmLdFZxpEThbfadY8W+wrGdA1eydcZ150RtrkCbfEBUcU2JXUsIEUFVS
	d8BV3SQ5t7Vpv3MEBbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngPtM-00GYA9-LX; Mon, 18 Apr 2022 11:50:04 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngPsn-00GXsD-8M
 for linux-mediatek@lists.infradead.org; Mon, 18 Apr 2022 11:49:31 +0000
Received: by mail-ed1-x535.google.com with SMTP id s25so16710407edi.13
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Apr 2022 04:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Su46te7HNW++2zKgguxu+adMxrQIv2yQPrMKfptRGag=;
 b=Wow3Xq7cPhtHQfiCZO1z4xGsOQSgEraNXhtcAJR+p9ahYFh+UIfpwJjb9ewnX9N810
 rceUBq35zYdLxYRlbvVGzDAVGaBNZqCA7bMp1VlUs9QZ6WUuiqIgGTvoR8eEb5tutur7
 vpdfCjxVi4d6+oN10r4XW/BXHm619ZVAhb2OKaqFhHpDItUc7jJ/87xRjWkMwd3JCg3K
 +peY2iRIUzoCyGLAc4DXiMeFiV44Xqo1KgQLqu2oa60LUldbHs2aROrHQpSdhm+ChGa4
 ags2SP48yGsoglA5lbFxWFP+fqvxKXSxTlkAeJlp0Ipoc7eL32wrkSjftiXeUXauetrB
 NuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Su46te7HNW++2zKgguxu+adMxrQIv2yQPrMKfptRGag=;
 b=PvJFrofZLScLy+xTL+b8/ZltUnBjydW/ZxQPpqT6eG2XV/kDWvKq01KJGOkUTkNMOD
 wmVZAFhKbgsETNMguRJHRtatRub1rDUMoHyi9vdjhvsI5D863PZN2mT3z7/Gf3yQ2aBd
 6S7nxHn9A3cZdzmGmHyRjgT0UfoK3E44Xjb8fsxJabs/xqMshIP3a0DOfUeNGUdV47rf
 7VAwe0hUW0dhYKSyRtNPahrtl/2uL+1zSQTHJ+o9Zif8+lkPWDxVq0+VC83vOo/umdre
 FSChZxQ5Ui/agCs69ZnrQ0a/GsTEXsvDDVrsPDIywSBUHfJneExPgpcxUk1gH8hRKjJQ
 FEAg==
X-Gm-Message-State: AOAM532Efb7YJIl38n4LIrxPtkexhH6vm0gOlTZT76Z+bWUwsXb013m1
 KMkHTYIiAX6DhKTEem/FDqZONQ==
X-Google-Smtp-Source: ABdhPJyjLcgXf19Bziy6YywbbTjReCFm8EmqOP+nJT4RSe4RjCjRYH99uE2rINOfOjdDhXQpbYrSpA==
X-Received: by 2002:a05:6402:2689:b0:422:15c4:e17e with SMTP id
 w9-20020a056402268900b0042215c4e17emr11945878edd.33.1650282567594; 
 Mon, 18 Apr 2022 04:49:27 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 t4-20020a1709067c0400b006ef810aab6fsm2338044ejo.213.2022.04.18.04.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 04:49:27 -0700 (PDT)
Message-ID: <fb275639-096e-78c2-3cbb-1bb10f4bbb08@linaro.org>
Date: Mon, 18 Apr 2022 13:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: ufs: mediatek,ufs: add compatible for
 MT8195 SoC
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220415165939.1861470-1-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220415165939.1861470-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_044929_364149_E4F86E72 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 15/04/2022 18:59, Fabien Parent wrote:
> Add bindings for the MT8195 UFS support.
> 
> The MT8195 SoC requires more clocks to be enabled compared to MT8183 and
> MT8192. Document the clocks required for MT8195.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/ufs/mediatek,ufs.yaml | 27 ++++++++++++++-----
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> index 32fd535a514a..5ed36e95e933 100644
> --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> @@ -14,16 +14,31 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt8183-ufshci
> -      - mediatek,mt8192-ufshci
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8183-ufshci
> +          - mediatek,mt8192-ufshci
> +      - items:
> +          - const: mediatek,mt8195-ufshci
> +          - const: mediatek,mt8183-ufshci

Are you sure that these devices are compatible? Amount of clock
differences suggests that not (or original bindings were not complete).

>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 8
>  
>    clock-names:
> -    items:
> -      - const: ufs
> +    oneOf:
> +      - items:
> +          - const: ufs
> +      - items:
> +          - const: ufs
> +          - const: ufs_aes
> +          - const: ufs_tick
> +          - const: unipro_sysclk
> +          - const: unipro_tick
> +          - const: unipro_mp_bclk
> +          - const: ufs_tx_symbol
> +          - const: ufs_mem_sub

Add allOf:if:then: which specifies these clocks per different compatible.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
