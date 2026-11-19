Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA54C60A261A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B90w2JFz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7wO+0Jd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RmdpddYozjJPVb6GiCDyPK6GgcDok35FRFm3gKsU32s=; b=B90w2JFz1BWOaGzOBftvDNHS0I
	c/ppKQ+lHq9Bfe0uMUTpnwabNkEQOb9HzjPnbJvMZf1dX2rc84RFPlu52Bd2R8hINsxpPG0tuO9vB
	yYSG9vH6eXKiGdrAG6NTp1AhbmxC4hrxH5Us1WfwRXruq5KLGPKUeAXCgKQTHkb/H8aXT8WUX6IfT
	lJeciXhzUGQEOrWP3VTSM5LAqjIl3pajvEJQAT/i5vUx7XqPtRSOCOjza7X1005f1jmyserQ3jkkF
	kdlNUMZgYxGGgHG/OjHzpm5pEFFb4kxYVwBos67OMs5KMSYbQyxdxA+TKTTswn+hcWAviHPDkpdyw
	atwASlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7XA-0000000DAT4-2Oy5;
	Thu, 19 Nov 2026 19:11:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7X8-0000000DAS9-25Ne;
	Thu, 19 Nov 2026 19:10:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C793347217;
	Thu, 19 Nov 2026 19:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B461F000C8;
	Thu, 19 Nov 2026 19:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795115457;
	bh=RmdpddYozjJPVb6GiCDyPK6GgcDok35FRFm3gKsU32s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G7wO+0JdhpiJYvZZBUE7uwCeGyUhReO7BHSnwt+i9vFE/Zvid9NCxYAsqXULdhs33
	 GMMofY/ROk5vYToVnE3QVvmF8pcXUjkIVC6yODjq9kZtk4DBNE0DRpgnG7DxRrXPw0
	 NdNBquIzspf4qJGYfCiH/fCYh3khzvSwRdmwZw6QzVJOtVM/TIbnAgrA+wm5vMrFuG
	 D1o6OEss5IDWm0KP6WjMRzDoKSjLR4oqQhI5GUi/oV/+7HA6DpIznFxeMsbDomJ5nX
	 kTrad4OnLMeRfEWRuXy7YhWtVpB5nBxM4P/9qq/n4OlikvR6pue9U7rGlNcCKOpdFb
	 Fl6D+NDyceImQ==
Date: Thu, 19 Nov 2026 13:10:55 -0600
From: Rob Herring <robh@kernel.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Kyrie Wu <kyrie.wu@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: mediatek,vcodec-subdev-decoder: Fix
 child node if/then schemas
Message-ID: <20261119191055.GA3803102-robh@kernel.org>
References: <20261019212431.4109371-1-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019212431.4109371-1-robh@kernel.org>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:24:29PM -0500, Rob Herring (Arm) wrote:
> The if/then schemas in mediatek,vcodec-subdev-decoder are all at the
> wrong level as they apply to child nodes. The clock-names schemas
> applies to the parent node, but the clock-names properties are in the
> child nodes. Move the clock-names definitions to the child node
> clock-names property. This exposes that the MT8186 clocks are not
> documented, so add them as well.
> 
> The interrupts if/then schema is never true as the parent compatible
> will never match the child compatible. The subschema also belongs in the
> child node.
> 
> Fixes: 3fbf1eac01b5 ("media: dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for lat soc")
> Closes: https://sashiko.dev/#/bug/linux-5ab90035-1914-412f-8310-097fb05bda15
> Fixes: 355e9472ccb0 ("media: dt-bindings: media: mediatek: vcodec: adapt to the 'clock-names' of different platforms")
> Closes: https://sashiko.dev/#/bug/linux-caa6adb1-38de-4889-9517-2beede7c8f96
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 77 ++++++++-----------
>  1 file changed, 31 insertions(+), 46 deletions(-)

Ping! This one needs to be applied before 2 other series posted.

> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index d1d209cbbd43..6033ecffd707 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -135,8 +135,26 @@ patternProperties:
>          maxItems: 5
>  
>        clock-names:
> -        minItems: 4
> -        maxItems: 5
> +        oneOf:
> +          - description: MT8186 clocks
> +            items:
> +              - const: vdec-sel
> +              - const: vdec-soc-vdec
> +              - const: vdec
> +              - const: vdec-top
> +          - description: MT8192 clocks
> +            items:
> +              - const: sel
> +              - const: soc-vdec
> +              - const: soc-lat
> +              - const: vdec
> +              - const: top
> +          - description: MT8195 clocks
> +            items:
> +              - const: sel
> +              - const: vdec
> +              - const: lat
> +              - const: top
>  
>        assigned-clocks:
>          maxItems: 1
> @@ -159,6 +177,17 @@ patternProperties:
>  
>      additionalProperties: false
>  
> +    if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mtk-vcodec-core
> +              - mediatek,mtk-vcodec-lat
> +    then:
> +      required:
> +        - interrupts
> +
>  required:
>    - compatible
>    - reg
> @@ -166,50 +195,6 @@ required:
>    - mediatek,scp
>    - ranges
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - mediatek,mtk-vcodec-core
> -          - mediatek,mtk-vcodec-lat
> -
> -then:
> -  required:
> -    - interrupts
> -
> -allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - mediatek,mt8192-vcodec-dec
> -    then:
> -      properties:
> -        clock-names:
> -          items:
> -            - const: sel
> -            - const: soc-vdec
> -            - const: soc-lat
> -            - const: vdec
> -            - const: top
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - mediatek,mt8195-vcodec-dec
> -    then:
> -      properties:
> -        clock-names:
> -          items:
> -            - const: sel
> -            - const: vdec
> -            - const: lat
> -            - const: top
> -
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.53.0
> 
> 

