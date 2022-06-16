Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9283DC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 12:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gy0oFAby9fgPJK22xRJJtXNYPWrTCXwW8x6uK6X5dvU=; b=d1C6UA/fVjM7A+aDwxqXfEw8GK
	iXYZqayex6vlt8H08mDbUp1wI00rQrKoSOlyDnbQxoDm0Zw9bIU6WaA9yOMtXiUoq0y16e9GV8BrN
	o3XXl3sPAVBR8VYbch3RLx+jcgI9qn5iHDvLjMxn/pY1Yx1k2v1Hxi64ir3A4Mb/fjPJg2WCHYAhB
	yv2e5Wz6og8pESUbks7lP6t2NpPY7bsGAz5G1N3sx0auO0/HcsAD0Mqan3ojQg0SNcxxycRCGDUCn
	HHh2jlazm2nf4T7VxtdO7wBMpVrP8ufntWZ2Yn56SL0afypxboOporyqVj76LlPaGAk3A0KqHppmz
	/oE/3Esw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1p4W-002Mio-Ao; Thu, 16 Jun 2022 12:58:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1p4T-002MgW-Fq; Thu, 16 Jun 2022 12:58:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so2801833wmq.0;
        Thu, 16 Jun 2022 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gy0oFAby9fgPJK22xRJJtXNYPWrTCXwW8x6uK6X5dvU=;
        b=Z7w8dNVB6+HrIK1AfeHcndhIn6ZaWZVjaZIxWOsOukdpjyAuA9v5MRUoVszMrQBn3J
         OmEcavKPfNs572/UH5gmdKM7J3jRilp9xyNozanCQxRuPPAHSx18eI8pYMArV407v1zj
         ooLDM0oB0I+fjkcaMrNQZMsuuEmVZHOA89GLn8XQCQZPc5kCtcYe8LI/cYv7QVn7PPK0
         bBwexju2unXFq1uFUGN5CPtTg29DK4hfbDtw2leG52kDHQiU4m8uyyrpWyt7BxLV32vi
         kox7/OnNMP54x3gfxbTCLsOXe8nE6ebCUd2U82Z2pSCrj5cs18rIZzPc3yFkjojHXfaq
         nm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gy0oFAby9fgPJK22xRJJtXNYPWrTCXwW8x6uK6X5dvU=;
        b=vQIcxdPcBBsthUVUKnVKZG2B1Cb+k/v2g2m74ATpAxwHQcFOeWPjSDlu1gfpQabfbw
         jIsCogsG2gwb9pPJibCunHbDVAIYBWCCh2YUpviF2Q8/LXbj9YLycqG6mMaQILh99R58
         2Nvg1jGgT4Wvszb+ztiZeFL3mEsU2VCMZXO5NszdBgMCa6TRBe84TJ+gFHUporsPeRIS
         tRydgmLFwTBfQbXCRG9G+o7Gu3Cy/YnpCYVMj3VYztzVZJaP/vLyAGToqWO4INyeGehv
         COZcev4tVMET5qFb2McPfE4ZApWu+5ZBCzkzmQDdICHUCzzWX3vLacQT6ESKCjLGu1hK
         kdtQ==
X-Gm-Message-State: AJIora8sLkOP0un2LKQyCjyST6aG9IYO9+sojkWfZOyCsqsay0kT7jt6
	v64BO3sIHPhtMxPXVFTd3A0=
X-Google-Smtp-Source: AGRyM1vD+Ab3nz7tP2nVuzPb0dsUZnxwwUULdQcZmibPpfHs7wyej1w4JmMQtgxPcmsGhtrQP3nYMw==
X-Received: by 2002:a05:600c:3790:b0:39c:62b9:b164 with SMTP id o16-20020a05600c379000b0039c62b9b164mr4925109wmr.0.1655384277780;
        Thu, 16 Jun 2022 05:57:57 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d4107000000b0020fffbc122asm2161091wrp.99.2022.06.16.05.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 05:57:56 -0700 (PDT)
Message-ID: <d99deddb-c4a9-d5a1-d0a6-0e7f94fbdd9a@gmail.com>
Date: Thu, 16 Jun 2022 14:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/5] dt-bindings: iommu: mediatek: Add
 mediatek,infracfg phandle
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski@linaro.org, miles.chen@mediatek.com
References: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
 <20220616110830.26037-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616110830.26037-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_055801_597212_CE722EF4 
X-CRM114-Status: GOOD (  16.01  )
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



On 16/06/2022 13:08, AngeloGioacchino Del Regno wrote:
> Add property "mediatek,infracfg" to let the mtk_iommu driver retrieve
> a phandle to the infracfg syscon instead of performing a per-soc
> compatible lookup in the entire devicetree and set it as a required
> property for MT2712 and MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../bindings/iommu/mediatek,iommu.yaml          | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 2ae3bbad7f1a..fee0241b5098 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -101,6 +101,10 @@ properties:
>       items:
>         - const: bclk
>   
> +  mediatek,infracfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle to the mediatek infracfg syscon
> +
>     mediatek,larbs:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
>       minItems: 1
> @@ -167,6 +171,18 @@ allOf:
>         required:
>           - power-domains
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt2712-m4u
> +              - mediatek,mt8173-m4u
> +
> +    then:
> +      required:
> +        - mediatek,infracfg
> +
>     - if: # The IOMMUs don't have larbs.
>         not:
>           properties:
> @@ -191,6 +207,7 @@ examples:
>               interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
>               clocks = <&infracfg CLK_INFRA_M4U>;
>               clock-names = "bclk";
> +            mediatek,infracfg = <&infracfg>;
>               mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
>                                <&larb3>, <&larb4>, <&larb5>;
>               #iommu-cells = <1>;

