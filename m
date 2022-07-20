Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34438C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 22:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jimy4V1nUGJyZ9u+Dj99DopEP3pRUApHSD/GLN4AMmg=; b=mX7Owo5X7udCjH9XjeFuckzgzz
	pvh3BymitAdtAPhs+ylqFqKLF7Fa47q+SVYsQbqIm5nIfYLzXQrhCeygDsdlKlCYot6I9ojpDjgS3
	bTcpCjHKBjlr2EDU7qIsm0oFvbqosLaIQz9wPqA5G9tK54W+ohRpdtgX+V5aVehGqqB39K36GGUAw
	1aWq2wXktucY8Gl4qc5Myk1J16S69X3wW3z0jg6NpUpSM4jp++FKwWDDmkXEwotv+Zf2B0aCgl7So
	QQDa6X50aFuhN9BoNv10lWeY9KMvlIw4Lf2larTEaM4qZW64m6kWIfC0YqgPI/to+9GdVRspC5qlr
	dicd9MMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEI7k-00CMdT-SJ; Wed, 20 Jul 2022 22:24:56 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEI7i-00CMXv-DQ; Wed, 20 Jul 2022 22:24:55 +0000
Received: by mail-io1-f43.google.com with SMTP id n138so22990iod.4;
        Wed, 20 Jul 2022 15:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jimy4V1nUGJyZ9u+Dj99DopEP3pRUApHSD/GLN4AMmg=;
        b=xF7DZo3G+yK4V+iyBflREXWxK8YFj8tSb8zzzzn7yL9ymj4YOR4nBzTbxmuWWUtuYD
         OyXl+mEsIgj/XoJiTn9thc8UVRJsGhjI3C3oRs+13eIWroPOWdv2BcPLcd69hlv5UUpo
         FrcNbrKFRODms0txCZt1dmGoHdVzIVZbv7KbZlx7KjV9q/Yx8l+0/x3D0FUHqhci3nKw
         sr9sxkZTTXNEg5BODyPscHzg2+nGnVtfLphZ4xX8iTE10hlbxFdqetdBe+GFYoU0+5oZ
         ytJxMyjl2mfAPHckCUTV09AoAbSVIlQyOJjboerkPq+YSORY2L0hvgMH2B+T05UEFoUb
         dHSQ==
X-Gm-Message-State: AJIora8eTg5nLxqEgoz3G26JKrwSPOgNYe9YIP6VqEvMQp5rdMfFaCR1
	LbxBSitBV0EnuPsqx5y2VQ==
X-Google-Smtp-Source: AGRyM1sWYsUEabacHZSH2oMcZFw7tDZ5CPWOw5X+UvmaH7kUKyTq2euwNHlUXCeHEgjsImPt7Rb9JQ==
X-Received: by 2002:a05:6638:4813:b0:33f:27bf:f6fa with SMTP id cp19-20020a056638481300b0033f27bff6famr20388764jab.42.1658355890085;
        Wed, 20 Jul 2022 15:24:50 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f19-20020a056638113300b0033f3ab94271sm37469jar.139.2022.07.20.15.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 15:24:49 -0700 (PDT)
Received: (nullmailer pid 4089645 invoked by uid 1000);
	Wed, 20 Jul 2022 22:24:48 -0000
Date: Wed, 20 Jul 2022 16:24:48 -0600
From: Rob Herring <robh@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>, Rex-BC.Chen@mediatek.com, TingHan.Shen@mediatek.com, Liju-clr.Chen@mediatek.com, Jian.Yang@mediatek.com
Subject: Re: [PATCH 2/2] dt-bindings: PCI: mediatek-gen3: Add new clock name
Message-ID: <20220720222448.GA4083816-robh@kernel.org>
References: <20220716074349.28655-1-jianjun.wang@mediatek.com>
 <20220716074349.28655-3-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220716074349.28655-3-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_152454_478313_10B2F09C 
X-CRM114-Status: GOOD (  15.67  )
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

On Sat, Jul 16, 2022 at 03:43:49PM +0800, Jianjun Wang wrote:
> MT8188 and MT8195 use clock "peri_mem" instead of "top_133m", add new
> clock name "peri_mem" for MT8188 and MT8195.

This should be part of patch 1.

Clock names for IP blocks should be local to the IP block. IOW, named 
after the input name for the clocks or what their function is if you 
don't know that. Neither the old names nor the new name seem to follow 
this. At least make the new name follow that convention.

> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 42 ++++++++++++++-----
>  1 file changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 67d2ba25e336..038e25ae0be7 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -43,9 +43,6 @@ description: |+
>    each set has its own address for MSI message, and supports 32 MSI vectors
>    to generate interrupt.
>  
> -allOf:
> -  - $ref: /schemas/pci/pci-bus.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -85,13 +82,7 @@ properties:
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
> @@ -133,9 +124,40 @@ required:
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
> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.18.0
> 
> 

