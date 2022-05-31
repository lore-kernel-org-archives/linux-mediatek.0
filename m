Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F50C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 11:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7NRkGLowM+cM5erlSIg58QPi6WwktRO0pdm9L39XWY=; b=yQRATfgmnHE1jT
	2TFZ8lciNlpbvb8CLRkdhybLitYKmQTXOSGPrNuXe4xNHx7Yg3d/RJAoIP3978wdCPImX++vNQlf2
	QZRmxdBqq4ta0i6RAiKFgCJB2HnDm3+Wj+sT8mWhcPxmxi1qpUIP10BZtojTXnMCGYFgYvXTrTwfm
	LGAKdeaQXcQm8Dh6BPIYwRjoSP+1u1wBQz7ISBr3wxmHrpNQg28lUn2sbS2NKm3Ju9aFtDWo8qMO+
	/20zBnLdHJPVgi/vycQcsul4OWu6LQDMAK2flB7GlSJryVQ91hhVp8qAfzl1nGrTmV0x1TCRsF7Cv
	ECeJhbT8e1IsOBVUmA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0RW-00AbcL-RC; Tue, 31 May 2022 11:53:46 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0RU-00AbbW-0P
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 11:53:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id q1so9618368ejz.9
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 04:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aZv3mvyH3YwBv75DPbWyCn0ZYruAzdYgAgL6PD0leyM=;
        b=sEekkrr6ZDYJGypMUv4kxJnQIqV1gbcVTncftHFHezDhnkayrx1pwsyyCBA2tRbn0G
         luiuIlu72eZpdya+jg76kOE6AKlZG6/Lp21I5f0mB37j8D8kCv0KxXK5e6dIO8CcVmW8
         5DWYe0a/H5TsRqYT0IkCMYboOQm45AxJWEEzg2JI4t5WpuBu1EQA4G0nFkSfWY3QgIxn
         ttzMqDrP+OnyWebrjqooAUNkydJi1CMpvuI/cqKrnLMx4DwR/3A6O3waKyv8OXCUVSA9
         AWExUukGBEWn3pbRssql9oNEc8iA876VKtN7zmtQ2W2SWb2aOckkwKo5DZX0/kT3p2n2
         AMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aZv3mvyH3YwBv75DPbWyCn0ZYruAzdYgAgL6PD0leyM=;
        b=C5lfNn1M6WD2rAzf+C80Qau5sDHPaylEuoacrRpJZwspGiNKHyiTCwmXOBtPRVwdHj
         Hrl9VndpAJjBkZBNyV1iO3OwVwNW1HxDARq59bKPDwyaDTWatmlE/dLyYsE2bo6X/f3u
         G2gDgvjDNCO7hwVdhvpNnNhCemcCtRonpR0lRH/qG5D8jBW0NxhYSKsnwEedk/SorFXe
         WbYaiRY07xXZVp4XsNCYFEKRLH6auI5bYP+bylObqfsxdCkWBRPWVKNCjCLEFoe0KMGk
         FLJQ+79CKFnSNLm473VwRSV4gi6ITeLiWWlniYCC3zdJZbbUPzSteqTuP8czhofzysSv
         9J+w==
X-Gm-Message-State: AOAM532AtIoQA7ygLhFW4hA3O/A/GcUIjaDRKYxXPW7E7spmaf6XnLfe
	1SPypUk4ANnfl5TeSIJn3RDmCg==
X-Google-Smtp-Source: ABdhPJymW8FmeTjxdKGYmtGd9rjreWcOisc6PcJr915f/Hv4wEXVceV9u1qf7rs6m1f5pLD06Pogkw==
X-Received: by 2002:a17:907:2cc4:b0:6fe:2100:de21 with SMTP id hg4-20020a1709072cc400b006fe2100de21mr52520891ejc.462.1653998022758;
        Tue, 31 May 2022 04:53:42 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l27-20020a50d6db000000b0042dc25fdf5bsm5320894edj.29.2022.05.31.04.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 04:53:42 -0700 (PDT)
Message-ID: <ce04b6b1-1082-0da6-1852-9819459ccfb7@linaro.org>
Date: Tue, 31 May 2022 13:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/7] dt-bindings: display: mediatek: dpi: add binding for
 MT8365
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, matthias.bgg@gmail.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220530201436.902505-1-fparent@baylibre.com>
 <20220530201436.902505-2-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220530201436.902505-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_045344_104703_17C3C890 
X-CRM114-Status: GOOD (  14.07  )
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

On 30/05/2022 22:14, Fabien Parent wrote:
> DPI for MT8365 is compatible with MT8192 but requires an additional
> clock. Modify the documentation to requires this clock only on MT8365 SoCs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../display/mediatek/mediatek,dpi.yaml        | 44 ++++++++++++++++---
>  1 file changed, 37 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index caf4c88708f4..c9c9f4d5ebe7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -17,13 +17,18 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt2701-dpi
> -      - mediatek,mt7623-dpi
> -      - mediatek,mt8173-dpi
> -      - mediatek,mt8183-dpi
> -      - mediatek,mt8186-dpi
> -      - mediatek,mt8192-dpi
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dpi
> +          - mediatek,mt7623-dpi
> +          - mediatek,mt8173-dpi
> +          - mediatek,mt8183-dpi
> +          - mediatek,mt8186-dpi
> +          - mediatek,mt8192-dpi
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-dpi
> +          - const: mediatek,mt8192-dpi
>  
>    reg:
>      maxItems: 1
> @@ -32,16 +37,20 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 3
>      items:
>        - description: Pixel Clock
>        - description: Engine Clock
>        - description: DPI PLL
> +      - description: DPI Clock
>  
>    clock-names:
> +    minItems: 3
>      items:
>        - const: pixel
>        - const: engine
>        - const: pll
> +      - const: dpi
>  
>    pinctrl-0: true
>    pinctrl-1: true
> @@ -71,6 +80,27 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8365-dpi
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          maxItems: 4

These should be minItems instead.

> +
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
