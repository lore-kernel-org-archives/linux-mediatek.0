Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CD3C64990
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P62ueRssPRWFG3vaYmpYNrxNqu1MLhdwYO9xXHU3Eok=; b=fToh+I5ciG2BLgBIx+M+HDJEFF
	SvhQuSslfcdctuVyJvk/Zf2OU/FSnvLoX0qT81JstT6euNvF3Sut54EQwIBqq3W4X/+ANH39HczFP
	576/laPSJAWQRZpveTEpFJvluWtbE2KP07TOHjmVQhDHP7k8b7e+Ocmp7dbeAyBrF5zUVv9TObUvP
	UuMDYMnyuObUcQ9Io0h7PjIKl3R3bukzGnE5zmVOesMEjM2khH+VS694oYpul0vu7KtlDkaXWalhF
	/JZ19WIQkFDEVFvxD4MpNQOmu4C9rwIiH+5V14BoOGInfJSVWdUGBKVwGMAFIZ/lxrq7eFW7nqgWt
	3tIFDzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRD79-00EwcV-OE; Thu, 25 Aug 2022 13:41:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRD6W-00Ew9A-IH; Thu, 25 Aug 2022 13:41:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so2720638wmk.3;
        Thu, 25 Aug 2022 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=P62ueRssPRWFG3vaYmpYNrxNqu1MLhdwYO9xXHU3Eok=;
        b=o5f4hFjZI45NTZlz/j+gp1PsNXot+ZFmfK1pjCF3c/ZkKON5KO2U/U4z3qjDJ5pKHh
         CfMu6+BUgs0fadkrXr33bOXYs5nZcCUNtREG1btzb00TRe5IV0Fw2MLKDbobygsbSmv+
         ulmFWzsKO1LCy7kZMuRaScxVZX/sSB2Q1tOelifSdAS+YWR/Dfk2+lsEoaDrc5WOpa8s
         +ALI41zvnNIBFnNZ3Y4wAAIGxZ9es+16UZ//ZoLewVyBXhkaVmHAnoKsi1PE0YD7jzTi
         +TLD7NKMIzJAoYCRfdP2kxriS9Khnex1VnPO48BPSWgzf7BXhICyZIiRB72cN/l9tpvT
         6VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=P62ueRssPRWFG3vaYmpYNrxNqu1MLhdwYO9xXHU3Eok=;
        b=Fy1K3KDjg00FFNrPkoEqQ8lma+r9BoPMwq8v2RnESIQFSHUSx0xjPxe+9ivx1Nv40t
         epFBrlDuC96Uz8U0jjBRre3wPMbkXuDY/oukmaEqVUR5qz1188kWu8FAmc+7ZO2E5FxX
         rUQ/tT5pabR/9di/+zfhgKmZBM4XZzXpfKv0VCQng7imL+E3Knb2XeojsM5fLsNNSwiV
         PMJk9Ftyi901yedbhrFM+UvNrUrRCWSsOe7/r+e425T+WMa6XuJEsLXsDuCwd0Qv3mqI
         k//ZBZVcsE5CWAazsBYjX4JnAgxzLS2DdYit7WOFBiiod5DNw7la/C2kuNksODqW5/Ee
         ZBdQ==
X-Gm-Message-State: ACgBeo2QiDLiW01tFLFSck8W/9ttKf5Y3QWozioZPAvTrZyJGN3plRG+
	OtgQXoejTKijUGZayXpulMc=
X-Google-Smtp-Source: AA6agR6HwtACnz86Wj1DGMwmnKmttU1V08jHhgJSrlxz8gPmsiWwe1E9CpRcuRMT3D/r04OwZIh6QA==
X-Received: by 2002:a05:600c:3508:b0:3a6:10a9:8115 with SMTP id h8-20020a05600c350800b003a610a98115mr8721228wmq.164.1661434862814;
        Thu, 25 Aug 2022 06:41:02 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g8-20020adffc88000000b002258619d342sm641503wrr.2.2022.08.25.06.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:41:01 -0700 (PDT)
Message-ID: <ad4d2ed4-5ea0-f6a8-65da-9f61ca54b891@gmail.com>
Date: Thu, 25 Aug 2022 15:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v6 01/20] dt-bindings: iommu: mediatek: Increase max
 interrupt number
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220811025813.21492-1-tinghan.shen@mediatek.com>
 <20220811025813.21492-2-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220811025813.21492-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_064104_698778_1039F416 
X-CRM114-Status: GOOD (  14.24  )
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



On 11/08/2022 04:57, Tinghan Shen wrote:
> mt8195 infra iommu uses 5 interrupts.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Joerg, will you take this through your tree or shall I take care of it?

Regards,
Matthias

> ---
>   .../bindings/iommu/mediatek,iommu.yaml        | 29 ++++++++++++++-----
>   1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index fee0241b50988..f5634c1642e20 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -91,7 +91,8 @@ properties:
>       maxItems: 1
>   
>     interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5
>   
>     clocks:
>       items:
> @@ -183,14 +184,28 @@ allOf:
>         required:
>           - mediatek,infracfg
>   
> -  - if: # The IOMMUs don't have larbs.
> -      not:
> -        properties:
> -          compatible:
> -            contains:
> -              const: mediatek,mt8195-iommu-infra
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8195-iommu-infra
>   
>       then:
> +      properties:
> +        interrupts:
> +          description: The IOMMU has 5 banks. Each bank has its own interrupt.
> +          items:
> +            - description: The interrupt for IOMMU bank0
> +            - description: The interrupt for IOMMU bank1
> +            - description: The interrupt for IOMMU bank2
> +            - description: The interrupt for IOMMU bank3
> +            - description: The interrupt for IOMMU bank4
> +
> +    else: # For the MM IOMMU
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>         required:
>           - mediatek,larbs
>   

