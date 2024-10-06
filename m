Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945B5CFB43F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LXc3VvcS2bv/VDZDwYb6dmpmtw0H48ML4SkMQj9K4k=; b=cxfG4+RbfHsm4ENWzEUaqbG9LS
	rnqxHOAqQh37VYFq+LDcwtov8e5LGexXsOzhocZXCyagWpu/tgmnylPJTwKaLyvks6NOK/28ked2o
	aTHYQZ15A0k+Y5wdvgxLnOtzaWRHieXeHnvgmWjxR0uLeLZoZlGJrw1YJXEqQH5sfJpRcVy38bGv9
	Sm2cldRCTtHHYqgFmRCzsdY/mEOVSZKdkB5Ik54kd7yflE4vTGoMrnFA1I2JtTk9phmEi+uvSu4jP
	ldNle3VSWN+NH4mkOmXfHz/aMGF3NbcBaR+JdYKOcBwznxise3ROoGVV8xjDhfIjY2wAZbcdQcIGw
	mreKG6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxQgz-0000000031Y-1kSy;
	Sun, 06 Oct 2024 12:48:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxQfi-000000002s1-0TDN;
	Sun, 06 Oct 2024 12:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D40BA40D0B;
	Sun,  6 Oct 2024 12:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF33AC4CEC5;
	Sun,  6 Oct 2024 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728218856;
	bh=AvaqHiW6YBwhtBJJbJKHvvdReZ767Nx9pY7bI7eLXLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3fe97gFneWXirJqu9oC4yIjBak7BMOaI2EGU0tGl5B00h9IcuR4TUUwGmyhL9CQL
	 eCHAQVT+AtdTOnOw8zCDpWTG4SD/T0HtGYO3qROCo1rdPnWlEfZTqh0I9Yr2MszMxh
	 6EEeDETov8pr9JhkXfZRkMZWwBUDTEIzarRWW35pEhLC5CAerYhjwDGgNQM8y93I2B
	 2zUtAlxy9a8SgkPm7wAO9bF6vnrIvWqpseH/LVR1HCobkBMSag/+MntlVrQkSXWq9l
	 IKMx4JD54Jqvco0dYT6X3gVDW7TfhqT3T6QIEQOVlxDYPtC2l9MS+5QZRoZwWYObNX
	 RiWu/3upU2a0w==
Date: Sun, 6 Oct 2024 14:47:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v1 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Message-ID: <4pmhzc5sf2c7dww3tihyqq5coco6u5nx7xvtqami7u55442gij@mqvyvqrpa6ft>
References: <20241006102154.17087-1-linux@fw-web.de>
 <20241006102154.17087-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241006102154.17087-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_054738_237832_DFF5318A 
X-CRM114-Status: GOOD (  12.75  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, eladwf@gmail.com, john@phrozen.org, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, daniel@makrotopia.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, ansuelsmth@gmail.com, Chaotian Jing <chaotian.jing@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 06, 2024 at 12:21:48PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add binding definitions for mmc on MT7988 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index c532ec92d2d9..db7d1c570aea 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -21,6 +21,7 @@ properties:
>            - mediatek,mt7620-mmc
>            - mediatek,mt7622-mmc
>            - mediatek,mt7986-mmc
> +          - mediatek,mt7988-mmc
>            - mediatek,mt8135-mmc
>            - mediatek,mt8173-mmc
>            - mediatek,mt8183-mmc
> @@ -263,6 +264,29 @@ allOf:
>              - const: bus_clk
>              - const: sys_cg
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt7988-mmc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: Advanced eXtensible Interface
> +            - description: Advanced High-performance Bus clock

Why ahb is optional?

Best regards,
Krzysztof


