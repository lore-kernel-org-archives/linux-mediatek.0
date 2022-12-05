Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A34C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjD5jvfs1Q2x/cdcxaQ+cfzZKHiqKwOk2YSAqbwKlVo=; b=fccGJ+e8YXybGafNYdbCfcmbRD
	m1lgwirbor3Z25HskxzZzFFG0Rw1Ijj7Moe4SjT7jfeKikcHsv+uYJWuTvSLDGCDyeeNRcA3cpEhd
	TXg5rqDGnXEyr+z6Rvwl7Q0/C2h/ipCgI8CxbZ7ILT6LjwqTTxMwgo1thWwn0JeGBTxXgHzPGQW2J
	yEhmvl5z9F1HdYQcA1Jg7TjWuWF/7x9tbP47wdrpKQaD+dUHmZ4SDPZ4+2XyPpGyZsSUV7CwiP03Y
	V37FNaNoKtv6/vzM8fQKVtOMFpyQeSE6qOzc1OvIAdWKBWpzFC3QAH+KKEwWP/m+5equgOAoeGU7x
	Z7xWGdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Ffw-007v6y-GU; Mon, 05 Dec 2022 17:54:44 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Ffl-007ucO-Rl; Mon, 05 Dec 2022 17:54:35 +0000
Received: by mail-oi1-f178.google.com with SMTP id e205so13889130oif.11;
        Mon, 05 Dec 2022 09:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjD5jvfs1Q2x/cdcxaQ+cfzZKHiqKwOk2YSAqbwKlVo=;
        b=i8nbzMmSWxYIUflUHUF8//bjnktRTdNWyq9hVLNn5FpvwUddoQ3Revdow7IO6Y7luN
         +yAunr1CjYm6LRWkvZZo9gtZzgYrtvlICt++Xak7qixXBLbliwcWst6BBb3hHRiyKMtP
         FkZdJ1uibX8W801QYkKkbgRT2Rz64V6IRZ1LbD90fhj72ISr5X3iNLGYr1kCsD1arwp4
         Ms1Fq2DJLGTGizh0kvfSjp4/6Wh6VnLg6f2vC/g9qa2MidNX1eTdQdp1JrKQpZ8kw9nO
         x4jHa5pFcKMm+1LIOp67dPEyoieX+GQ776r+0GVsXVU4BkVo9mx53Szrwirga2qef5/u
         hedQ==
X-Gm-Message-State: ANoB5pnMbGeliAvBvgwdzwkw1zLQ1zbvmUc6ETlFmUqf9u963Wjd/K/U
	31LlW/s5wpI8aM39R+QKfXS8D7fShQ==
X-Google-Smtp-Source: AA0mqf7MQR4VlM3j15dfYZl5T10+IaF4xou+7DEW3p2t0/AF/R9GuAMvPe+A/m3AS1CZqrt91T0rvQ==
X-Received: by 2002:a05:6808:1246:b0:354:4b35:2809 with SMTP id o6-20020a056808124600b003544b352809mr40266726oiv.256.1670262871784;
        Mon, 05 Dec 2022 09:54:31 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m6-20020a056870a40600b0012d939eb0bfsm9448668oal.34.2022.12.05.09.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 09:54:31 -0800 (PST)
Received: (nullmailer pid 2143933 invoked by uid 1000);
	Mon, 05 Dec 2022 17:54:30 -0000
Date: Mon, 5 Dec 2022 11:54:30 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4,1/3] media: dt-bindings: media: mediatek: vcodec:
 adapt to the 'clock-names' of different platforms
Message-ID: <20221205175430.GA2136513-robh@kernel.org>
References: <20221202034450.3808-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202034450.3808-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_095433_922251_1B86D6E0 
X-CRM114-Status: GOOD (  16.27  )
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

On Fri, Dec 02, 2022 at 11:44:48AM +0800, Yunfei Dong wrote:
> mt8195 and mt8192 have different clock numbers, separate 'clock-names'
> according to compatible name.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> compared with v3:
> - rewrite clock-names according to different platforms.
> 
> Reference series:
> [1]: v5 of this series is presend by Allen-KH Cheng.
>      message-id: 20221128143832.25584-4-allen-kh.cheng@mediatek.com
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 41 ++++++++++++++++---
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index 7c5b4a91c59b..a08b2c814f40 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -110,15 +110,12 @@ patternProperties:
>            Refer to bindings/iommu/mediatek,iommu.yaml.
>  
>        clocks:
> +        minItems: 1

Why 1? Looks like it should be 4 or 5 clocks.

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
>  
>        assigned-clocks:
>          maxItems: 1
> @@ -159,6 +156,38 @@ then:
>    required:
>      - interrupts
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8192-vcodec-dec
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: sel
> +            - const: soc-vdec
> +            - const: soc-lat
> +            - const: vdec
> +            - const: top
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-vcodec-dec
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: sel
> +            - const: vdec
> +            - const: lat
> +            - const: top
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.18.0
> 
> 

