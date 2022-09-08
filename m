Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174B7C54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssphXCw9dVc4K1o06caOSpIrGhXG1PGN20aX3IK807o=; b=fRC2YW1n/m64le68nBUV9G72gS
	3olPSKA0Tp72vwXwdvelw03HfOMo864Bj+oXHi394NQv0AhrmwpJCHzTQsebtw7K4nvXH4rmK2WbN
	FRQz+ttlZb7TPtHr8pD9IFAzEZprJ8GGkQxTOB9Eer+iU3XtW9iAy6Li5lX6mXRYOcaVrTdURQjG/
	Qf7AMhLlJ5hCPHM7ZpkLbPXWMuoPXKBPprXd1b5Knv/LsITA72OF5OaczdsI+8UvnOVvxhQKhXzrg
	PFyx7WEuZDYIRTe6v8l0qDTiuvkcxRdAdQ/Scbd/PpOosHCvvWJ3lK/gkvWKFBps1zG5GahY3TfSB
	y04Iu+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHfg-003uaa-FK; Thu, 08 Sep 2022 13:34:20 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHcD-003ryc-44
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 13:30:47 +0000
Received: by mail-lf1-x12c.google.com with SMTP id f11so13724576lfa.6
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Sep 2022 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ssphXCw9dVc4K1o06caOSpIrGhXG1PGN20aX3IK807o=;
        b=ck4sfwitUujJ4vxU9ZOv8HwJvjGvsMZ6KqMM5evDrri5Rht9kYsiegBuwDv4+9EDIf
         sjrTTy8Gxx3SQwy8ByST/AKQejNj1a9cAEZQMJ+OuTI9ffYAJspQo7EsHenHmbfiqJxp
         PEZpXP253o7D9JwQ0QVeyamH+8975QarrG1O9qxnYlX01CoXQMLyJAXjtGKtxP69JJ+h
         kjKArCDi/ob5rxLp/VO4NN8u6S1qY0VkMfXrMBwFqaeJosDzvFQOTvcY4IIoUr47HXLM
         DB55Olq9kSsyaqRMyHVoAq2kr3zBVhcFSj15d6Fm8od7qVplq7ZQnBF7R6EkZ5cBxBJA
         H/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ssphXCw9dVc4K1o06caOSpIrGhXG1PGN20aX3IK807o=;
        b=vu3LibrlL5MdIkIBG2ILp10yC/+DvopH6zJzvzbdwIqM7JPjG0bXYGeUyKm4R4jox7
         nDhOanZySFPxwfuuMrET7v1s5qiZz+cKadlfk14xNm7sNccNJ59SOD28Z+qXvA+qhDYe
         TAqsksxyCktj8HfZ/b0rWuLCcYuTJURaYiRXvR/susVG/ni2G6NQBwwfiZT5iRFjWVq/
         OHK66IZ1I74fqSlVZQvh/EIDMRqN7q8cSee9jCHZgooEow6zTDKW7EeEO0erEPCdrO7K
         99rCAKmG4h8Bae/sNlJor9RZqEYFbkMkTRBFq4fHlocX82uDJj5vsCucsu3XrHjJpTlM
         1Mbw==
X-Gm-Message-State: ACgBeo15jZuEQwMv79xSvJtKFgxEf4ZSOdz5VpVBnPTOjk7IHjxa2y59
	5Hh3w95q8nBi2TlyWPFyyfjhvw==
X-Google-Smtp-Source: AA6agR4Cnrp8WVFsJsdGAqok1HmTtsifWI0ssMvOubIq728013GinG5Ar6anwjFrPPS71YUeXLYwHg==
X-Received: by 2002:a05:6512:3ba9:b0:497:ab81:dca5 with SMTP id g41-20020a0565123ba900b00497ab81dca5mr1972140lfv.129.1662643839504;
        Thu, 08 Sep 2022 06:30:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 5-20020ac25f45000000b00498f0434efdsm221661lfz.19.2022.09.08.06.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:30:39 -0700 (PDT)
Message-ID: <eff1c862-e3f4-d28b-fafa-c6053c48189c@linaro.org>
Date: Thu, 8 Sep 2022 15:30:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1] dt-bindings: iommu: mediatek: mt8195: Fix max
 interrupts
Content-Language: en-US
To: matthias.bgg@kernel.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 iommu@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
References: <20220908132535.9350-1-matthias.bgg@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908132535.9350-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_063045_211182_6ABD4DA3 
X-CRM114-Status: GOOD (  16.65  )
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

On 08/09/2022 15:25, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The mt8195-iommu-infra has five banks and one interrupt for each.
> Reflect that in the binding.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> 
> ---
> 
>  .../bindings/iommu/mediatek,iommu.yaml        | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index fee0241b50988..621aca2adfb7f 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -91,7 +91,7 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1

Keep here wide constraints - minItems:1, maxItems:5

> +    description: each bank has one dedicated interrupt


>  
>    clocks:
>      items:
> @@ -183,6 +183,19 @@ allOf:
>        required:
>          - mediatek,infracfg
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8195-iommu-infra
> +
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 5

and then minItems:5

> +      required:
> +        - interrupts

This seems unrelated and not really needed.

> +
>    - if: # The IOMMUs don't have larbs.
>        not:
>          properties:
> @@ -191,8 +204,12 @@ allOf:
>                const: mediatek,mt8195-iommu-infra
>  
>      then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
>        required:
>          - mediatek,larbs
> +        - interrupts

This seems unrelated and not really needed.

>  
>  additionalProperties: false
>  


Best regards,
Krzysztof

