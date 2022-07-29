Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7800CC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 22:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdPiZGCx2gOg+Z8f5WWlV+ALjDbF5Hu969TqFhTswc8=; b=LkYuaOb27StEOoi/c7pK5PTEEN
	gRRwRpAzowseGluZUvmpBCoKkPOYd6Fm0k5/ghDXIbEDavl1PZWf8M+akYkvtNpkWqpyg7T/ljeq1
	B9HhaBc6TWLNsNB5EENnrcpMVJfIGFK88YaAC4FgVVOGW0VcPbHD43XB1ZmCorlML4B2mP0/BSWwO
	7YdQXhrl0lvWmXXnUL1I0tYEwLqxABAao+waj37j/jQU5aErUWQRPYQvf4pxdiBMAWBRNvJZS1O77
	EBKN3YE8M57oPfnnoQe6nL/EkVRUvWRXHXeNxJ9iAtuKEUtjb72Ovs6cN/umTu3wTiT8xjcmJWsum
	XE1+yCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHYrJ-00DSpf-QY; Fri, 29 Jul 2022 22:53:29 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHYrH-00DSoV-Io; Fri, 29 Jul 2022 22:53:28 +0000
Received: by mail-io1-f41.google.com with SMTP id q14so4665734iod.3;
        Fri, 29 Jul 2022 15:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=qdPiZGCx2gOg+Z8f5WWlV+ALjDbF5Hu969TqFhTswc8=;
        b=k39v9fXH/2PYMcx503TNlmVRulg/CrCunjGURgFTTHIg592YCfhGB1wmn0f9VpAz9e
         R63dA7Dn2n0vDWqPJloMYLEQcczB4/gkoX48BSTEgLDxuVyb2Hs2qknpkrO5K/ygB8MO
         LmyABFj0zW+mr09e1HNeIMf83GrmGxZtbo0s7v+acsnvk1zUSvvyc+pRnlpaF1Pdt6Ni
         9Ipk7gNDTaG8Wyd9pKIMBumDFS9AKYAdDc3yIcJGBdZQh93lLefLJtI1A7ZlkfQOIoE5
         QQn6Dj52TpePj5y+m3kEe3VCA4EZ+KxqTsyUH/E/LTYQvb0UBHZjyFz03D+Qaa+Z75BA
         XxDg==
X-Gm-Message-State: AJIora+3CUbHAynWwTUyEIEcuwXN30O9uyY83tpiR2+oG1/sXWaqpfSi
	T1WQ1KSgf8Dlb9qVKZH6qA==
X-Google-Smtp-Source: AGRyM1tVKy42bKeKa7Lz5BjK7FPG39AaKdNNz7b3gF69f/Zl3T81ORLeG5jHeetLJGrjQH3iD0lfEQ==
X-Received: by 2002:a5e:a618:0:b0:67c:27b4:1f93 with SMTP id q24-20020a5ea618000000b0067c27b41f93mr1846960ioi.75.1659135202913;
        Fri, 29 Jul 2022 15:53:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r1-20020a92c5a1000000b002ddd1e250c0sm1994579ilt.5.2022.07.29.15.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 15:53:22 -0700 (PDT)
Received: (nullmailer pid 87726 invoked by uid 1000);
	Fri, 29 Jul 2022 22:53:20 -0000
Date: Fri, 29 Jul 2022 16:53:20 -0600
From: Rob Herring <robh@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>, Rex-BC.Chen@mediatek.com, TingHan.Shen@mediatek.com, Liju-clr.Chen@mediatek.com, Jian.Yang@mediatek.com
Subject: Re: [PATCH v2] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8188 and MT8195
Message-ID: <20220729225320.GA82746-robh@kernel.org>
References: <20220729033331.3075-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729033331.3075-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_155327_644415_68D77BD6 
X-CRM114-Status: GOOD (  16.72  )
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

On Fri, Jul 29, 2022 at 11:33:31AM +0800, Jianjun Wang wrote:
> MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as MT8192.
> 
> Also add new clock name "peri_mem" since the MT8188 and MT8195 use clock
> "peri_mem" instead of "top_133m".
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
> Changes in v2:
> Merge two patches into one.
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 51 +++++++++++++++----
>  1 file changed, 40 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 0499b94627ae..038e25ae0be7 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -43,12 +43,16 @@ description: |+
>    each set has its own address for MSI message, and supports 32 MSI vectors
>    to generate interrupt.
>  
> -allOf:
> -  - $ref: /schemas/pci/pci-bus.yaml#
> -
>  properties:
>    compatible:
> -    const: mediatek,mt8192-pcie
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-pcie
> +              - mediatek,mt8195-pcie
> +          - const: mediatek,mt8192-pcie
> +      - items:
> +          - const: mediatek,mt8192-pcie
>  
>    reg:
>      maxItems: 1
> @@ -78,13 +82,7 @@ properties:
>      maxItems: 6
>  
>    clock-names:
> -    items:
> -      - const: pl_250m
> -      - const: tl_26m
> -      - const: tl_96m
> -      - const: tl_32k
> -      - const: peri_26m
> -      - const: top_133m
> +    maxItems: 6
>  
>    assigned-clocks:
>      maxItems: 1
> @@ -126,9 +124,40 @@ required:
>    - interrupts
>    - ranges
>    - clocks
> +  - clock-names
>    - '#interrupt-cells'
>    - interrupt-controller
>  
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8188-pcie
> +              - mediatek,mt8195-pcie
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: tl_96m
> +            - const: tl_32k
> +            - const: peri_26m
> +            - const: peri_mem
> +    else:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: tl_96m
> +            - const: tl_32k
> +            - const: peri_26m
> +            - const: top_133m

I'm not sure it's worth enforcing just the last clock name. Just do:

enum: [ peri_mem, top_133m ]

And key in the top level.

Rob

