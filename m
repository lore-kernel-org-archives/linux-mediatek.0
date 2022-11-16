Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E54C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 17:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiZRwJ+mJX0JujaVc55ipnODAd5lXgBHhurRBqfzsSI=; b=UMdX2Mylzlc/hFjZNCZWsqkTWP
	GxwMuRuJ9wBLRCqaJrovDtVw+kUwpGtiYkNqVB+/5dHeCYYGh3/vRA5BCHcD2QFN/t9H5flnjz62C
	nMgwNXNzkInipWd3prPuYOcwVA5J2Z2A87rkH//JiXorn6KZS1u+oUIRKFFx39ci3LYYecM6B83B7
	u3OI38f+ao3DbQBz715fQU6+pt+ttnrSfqGkklwf8FkPSYErFoc2w26lrLccQqRxIcNR2xyHpEgA5
	fJRBpPPosVYkFGMUTVENlIHJ3P5r+Aevqsomx7JKCwpbf8OElYbtueRa/tcb3j531GkrVma1pFMNW
	qSQgEpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMEf-006QrZ-40; Wed, 16 Nov 2022 17:30:05 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMET-006Qo4-CI; Wed, 16 Nov 2022 17:29:54 +0000
Received: by mail-oo1-f51.google.com with SMTP id g15-20020a4a894f000000b0047f8e899623so2595087ooi.5;
        Wed, 16 Nov 2022 09:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiZRwJ+mJX0JujaVc55ipnODAd5lXgBHhurRBqfzsSI=;
        b=a4q3sRP+UZHuB7Pey2AUQoayerNwjpWYjt43JRtq0jVvV3CQONWHr8IFn7mKvat+IR
         ZYNtlimuDQslRxqX68izy7W48UrrLrowT58x4GRALHGeBxNGj4YWKawBS6LvAFU+HFZT
         exyqo8jL28SgXaDnRdiBsWCxmQo2P9EPhRGXXyuA4tnMc3UqM8JXiXtuHW/jFuJ9yBUq
         ZZwOPehZ/vOsGuvLhE8uVbxCYaJKgHoa3CQ7nOphSoYpA/tKpVK0jDKjrf6EaYz0TUXw
         /lRutARxTiIuKeXrE2m1rBOuGiUG0LhnUL4vKETDZyulNfps7d2IInOGo2U+pFgQYUso
         JN6w==
X-Gm-Message-State: ANoB5pk2haZaaf0KNmANQwtnYemEHd0B2a0/THOR3l7RIVMuVbOicWS/
	r2x+0eQEbF44acu5pvN+lA==
X-Google-Smtp-Source: AA0mqf7cJeNBtZVp0MmQORg/6QiAJfJWHo09p0aiOG4XwqyXKGRbJY+74MdCHUSoYXUWALOVHDxhQw==
X-Received: by 2002:a4a:c298:0:b0:49e:a604:b053 with SMTP id b24-20020a4ac298000000b0049ea604b053mr10169038ooq.85.1668619790882;
        Wed, 16 Nov 2022 09:29:50 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z9-20020a4ade49000000b0049eedb106e2sm6289417oot.15.2022.11.16.09.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 09:29:50 -0800 (PST)
Received: (nullmailer pid 554417 invoked by uid 1000);
	Wed, 16 Nov 2022 17:29:52 -0000
Date: Wed, 16 Nov 2022 11:29:52 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2,1/3] media: dt-bindings: media: mediatek: vcodec: Fix
 clock num not correctly
Message-ID: <20221116172952.GA461876-robh@kernel.org>
References: <20221110102834.8946-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110102834.8946-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_092953_441012_2F6A2D5E 
X-CRM114-Status: GOOD (  17.33  )
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

On Thu, Nov 10, 2022 at 06:28:32PM +0800, Yunfei Dong wrote:
> mt8195 and mt8192 have different clock numbers, can't write 'clocks' and
> 'clock-names' with const value.

Not a compatible change. Explain why that is okay if it is.

> 
> Move 'assigned-clocks' and 'assigned-clock-parents' to parent node.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 119 +++++++++++-------
>  1 file changed, 72 insertions(+), 47 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index c4f20acdc1f8..794012853834 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -89,23 +89,33 @@ properties:
>  
>    ranges: true
>  
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5

Why do both the parent and child have clocks?

> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1

You can just drop assigned-clock properties. They are allowed in any 
node with 'clocks'.

> +
>  # Required child node:
>  patternProperties:
> -  '^vcodec-lat@[0-9a-f]+$':
> +  '^vcodec-lat-soc@[0-9a-f]+$':
>      type: object
>  
>      properties:
>        compatible:
>          enum:
> -          - mediatek,mtk-vcodec-lat
>            - mediatek,mtk-vcodec-lat-soc
>  
>        reg:
>          maxItems: 1
>  
> -      interrupts:
> -        maxItems: 1
> -

Dropping interrupts? Not explained in the commit msg (why?).

>        iommus:
>          minItems: 1
>          maxItems: 32
> @@ -114,22 +124,55 @@ patternProperties:
>            Refer to bindings/iommu/mediatek,iommu.yaml.
>  
>        clocks:
> +        minItems: 1
>          maxItems: 5
>  
>        clock-names:
> -        items:
> -          - const: sel
> -          - const: soc-vdec
> -          - const: soc-lat
> -          - const: vdec
> -          - const: top
> +        minItems: 1
> +        maxItems: 5

We had names defined and now we don't. That's a step backwards.

>  
> -      assigned-clocks:
> +      power-domains:

Adding power-domains?

Rob

