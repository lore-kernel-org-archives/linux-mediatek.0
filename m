Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D51CDE026
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQmo4ArBeVA562Gap9sJulg8QLMD7VaAgirv+7YR2Pg=; b=qCiGLfttYlsHZdxMD9uhTqbjTD
	oGs25wYCPpwe7SnxrNqjz4bZhctwaAKJ8jmqKUf5BFfv1SieH3xikVarZTsVDyYnxwBU+iSJkj91t
	tArDytZBRHTOYriW9XUdasvrT73J4JrPECfj4RGxvotvM+SGtwId/soLJGp2OhjBqI8pvq8Tt/tMY
	y5m+94r8bu2EQEXGZ0XEGYphME3DzlMGKwuAFXwE5hA3uYjqil/elam+E3p1wUMway4YXfj18XObP
	4LAC0iAwypJgZbCyZVuNhK0XybvlCi0E5YN9f3ajPAopDosqraZg3cgyAWC3cSaqLO4kJ8avbdfC2
	s6iW7dUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stsi7-0000000947X-0tP0;
	Thu, 26 Sep 2024 17:55:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stsgu-000000093t0-1BVb;
	Thu, 26 Sep 2024 17:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2DD9CA436B4;
	Thu, 26 Sep 2024 17:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4071C4CEC5;
	Thu, 26 Sep 2024 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727373251;
	bh=lXPOdfXYiJSIOPk0X98x8wE/c1zTD2p+6mktwIChUvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PN3H9EtlobMXbvdAL8DZSVOktwc+8F2pVFoTxbCmf+WKXMxcp6MyHaQledrpLJhvo
	 8sN9UElr0KicTKG0wJEZm1pVQvJFOtmX4aybnrkpJ/Qb9a0Y8gnnKDaQVH2CgBtFH+
	 k1r0ST6uwj3gtmhHXxffEefApV23sS+XTmFv3k1RokhidAXtIjA1AjZKiqBFoeoOzf
	 ZsDbj9VUwa8nNx3wfJawSbJzSaWpCCj3iLEc/dA3+7O8FBxkllH7x9VScC2EAzZM3f
	 W7JW5RmfHCGB+xRqGrB7FWIiSOYPoRH1bcXR6b7LRW01SV3KOq28FyYRNk1pZKZgDh
	 sDHAqWFwm1HsQ==
Date: Thu, 26 Sep 2024 12:54:09 -0500
From: Rob Herring <robh@kernel.org>
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: ulf.hansson@linaro.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
	wenbin.mei@mediatek.com, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: mmc: mtk-sd: Add support for MT8196
Message-ID: <20240926175409.GA2644361-robh@kernel.org>
References: <20240926070405.20212-1-andy-ld.lu@mediatek.com>
 <20240926070405.20212-3-andy-ld.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926070405.20212-3-andy-ld.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_105412_477059_0F4BD8DD 
X-CRM114-Status: GOOD (  19.77  )
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

On Thu, Sep 26, 2024 at 03:03:18PM +0800, Andy-ld Lu wrote:
> Extend the devicetree bindings to include the MT8196 mmc controller
> by adding the compatible string 'mediatek,msdc-v2', which could be
> also used for future compatible SoCs that support new tx/rx.

Generally, every SoC ends up changing at least slightly. So we don't do 
version numbers except when there's a well defined versioning scheme of 
the h/w (e.g. FPGA IP blocks). So, use SoC for compatible string.

> 
> Add three properties for MT8196 settings:
> - 'mediatek,prohibit-gate-cg', indicate if the source clock CG could
>   be disabled when CPU access IP registers.
> 
> - 'mediatek,stop-dly-sel', configure read data clock stops at block gap.
> 
> - 'mediatek,pop-en-cnt', configure the margins of write and read
>   pointers while begin to pop data transfer.
> 
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index c532ec92d2d9..82d1a9fac67c 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -25,6 +25,7 @@ properties:
>            - mediatek,mt8173-mmc
>            - mediatek,mt8183-mmc
>            - mediatek,mt8516-mmc
> +          - mediatek,msdc-v2
>        - items:
>            - const: mediatek,mt7623-mmc
>            - const: mediatek,mt2701-mmc
> @@ -154,6 +155,30 @@ properties:
>      enum: [32, 64]
>      default: 32
>  
> +  mediatek,stop-dly-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some SoCs need to set appropriate stop-dly-sel to configure read data clock
> +      stops at block gap. The valid range is from 0 to 0xf.

SoC dependent or board dependent? Imply from the compatible for the 
former. A property is fine for the latter case.

> +    minimum: 0
> +    maximum: 0xf
> +
> +  mediatek,pop-en-cnt:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Some SoCs need to set appropriate pop-en-cnt to configure the margins of write
> +      and read pointers while begin to pop data transfer. The valid range is from 0
> +      to 0xf.
> +    minimum: 0
> +    maximum: 0xf

Same question.

> +
> +  mediatek,prohibit-gate-cg:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Decide if source clock CG could be disabled when CPU access IP registers.
> +      If present, source clock CG could not be disabled.
> +      If not present, source clock CG could be disabled.


Sounds like you need to describe the clock in "clocks".

> +
>    resets:
>      maxItems: 1
>  
> @@ -191,6 +216,7 @@ allOf:
>              - mediatek,mt8188-mmc
>              - mediatek,mt8195-mmc
>              - mediatek,mt8516-mmc
> +            - mediatek,msdc-v2
>      then:
>        properties:
>          clocks:
> -- 
> 2.46.0
> 

