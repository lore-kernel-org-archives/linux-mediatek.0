Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF7EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MaWXwDJogifA3H/7jlwLPNHJdBh1ZwdxwWosnwINQ54=; b=Do5IGD2mx+vQU3
	GejUtGs54VNG0by8qfuHkqXxeuz/HqLmngjtiNmenac4Q2BfBGCv8zCankNSSD/TP/g8c35ybTCn8
	bCkc4VNLvFO/Jz4q0mS2q2S+RLqAD2hP5hcPrkFNltCiQWaT4CjkgY3KzXpwfkQyLeNWDvxkFMO00
	fQpyvzKVM2exyx9RhHEGO9a/xR56MyaeN7hEvQtY1A4M5msYPbvYV9dDv6Kk2XhTWkLnQSMrK6bGr
	ugsq3Bxog1hWz0rpW9GJAXAneqLZq+mh3iyS/+v25HysqUqUsdfEDZkGusV11HvHgdri9elHQ1umJ
	z1iqpsTnKuNxj5CG1PxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18He-00A6xB-DS; Tue, 14 Jun 2022 15:16:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18Hc-00A6wJ-AL; Tue, 14 Jun 2022 15:16:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id o16so11741915wra.4;
        Tue, 14 Jun 2022 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vhkIKfkGo8kjikdx6e7XD32K64ham8C6J5zyVmKGo9E=;
        b=mn9mH9dlcktjsbOMweXezuaZH6SedKsBiAp/sPrP+O/C4uzVoiTXk0Hp2qzmmYN8mH
         txJIAOk0oCR3M4iXvuNWj36oJ5TXwOXGhsvH3FLUorO0KJCZXKZZnwWPJYbZ4ESJmdf+
         S9WtMjEksOcMwWCn4jHjLhFrSaYEUPcJJYtLmzE22G2yT6MVn3QND8NEpCxaaCqm3Ba+
         gvFcCl7VOOzuOSf69Is+3ei0t5tbkfcY56+nNn/6GSoQ1xMsJVcD9FYC47Z8mjUp5kUg
         uQaJfFGtgXl9F1UOXFC7ht0yd3Euz9EUuj6jKHpk+ZOw4NXqoY1LWCjP56Rtws3Oujb5
         ClmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vhkIKfkGo8kjikdx6e7XD32K64ham8C6J5zyVmKGo9E=;
        b=zZs8AADjvC0JSUp1HfC6nPBB/CmAs2BWyZ74JZuSKxCAkszbs7Co8eBrLs+gsNRL2I
         Rn3IWD0lz4UqubdMzL/s1Zrktfv3VHNc2HwsHVVVbrk9VCipu6JfJ+8srPNS4iYiOsgX
         kAG8xyqipN9iWwUlfbuYP1let1lK94PrSfHSz4g1IrsnUv8WCGILegOqMwSGq1aZdf2E
         tRI5CdNTrPIpomaa3EuuG+/iCrgUyITXjiBpepvA5pliioe8mCMfVYHAQhEBKyyuthY1
         1MmOFv/N61TdCYnI9zaHrMdSbj2uyBjeCo6kUOpAWVYyhNKws60yK/URfYr3LJLwQ6DZ
         ndew==
X-Gm-Message-State: AJIora9vnbKMIEMQgQA3BkMsozgtpZnhsuEIOVFV9Zo9xX/M2C7br2KJ
	InzlQTMN4rdX7FfOkMksEuY=
X-Google-Smtp-Source: AGRyM1sTU/BX79X8IM4FR68caCqL83NVFcemJZ7ybhRIwDuMBFF47IEvxKSKZvZKgUvjv9UhRysOaA==
X-Received: by 2002:adf:f584:0:b0:218:5a97:8f05 with SMTP id f4-20020adff584000000b002185a978f05mr5365598wro.333.1655219802133;
        Tue, 14 Jun 2022 08:16:42 -0700 (PDT)
Received: from [192.168.0.36] ([37.223.143.134])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c024400b0039c811077d3sm13490956wmj.22.2022.06.14.08.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 08:16:41 -0700 (PDT)
Message-ID: <9a5afd0c-0c92-52c3-72d9-2c2f6c469e05@gmail.com>
Date: Tue, 14 Jun 2022 17:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 5/6] dt-bindings: iommu: mediatek: Add mediatek,pericfg
 phandle
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski@linaro.org
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
 <20220609100802.54513-6-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220609100802.54513-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_081644_407571_7F26C356 
X-CRM114-Status: GOOD (  16.23  )
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



On 09/06/2022 12:08, AngeloGioacchino Del Regno wrote:
> Add property "mediatek,pericfg" to let the mtk_iommu driver retrieve
> a phandle to the infracfg syscon instead of performing a per-soc
> compatible lookup in the entire devicetree and set it as a required
> property for MT8195's infra IOMMU.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewd-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/iommu/mediatek,iommu.yaml  | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 4142a568b293..d5e3272a54e8 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -116,6 +116,10 @@ properties:
>         Refer to bindings/memory-controllers/mediatek,smi-larb.yaml. It must sort
>         according to the local arbiter index, like larb0, larb1, larb2...
>   
> +  mediatek,pericfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle to the mediatek pericfg syscon
> +
>     '#iommu-cells':
>       const: 1
>       description: |
> @@ -183,6 +187,16 @@ allOf:
>         required:
>           - mediatek,infracfg
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8195-iommu-infra
> +
> +    then:
> +      required:
> +        - mediatek,pericfg
> +
>     - if: # The IOMMUs don't have larbs.
>         not:
>           properties:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
