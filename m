Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93694C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 22:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLT3ZYBdhjAVbmPO/uc2xLKM7qGWQtc4/hcvgBHyd9s=; b=vp8M2VihC0JTJaxq2B2nPXtlbW
	PoRxgyDhbBhyu+YZwvm35fPKzt8U32AXl3hBlDAJYKKHtPHiAWnA2S/nba+bLhiSdr4HuLawnAz46
	n524gNzhMQMorNeQr/sv2OKQhKl+5ie3ve14dfdjdlYSVvo8eRvVqTBSjIMgaU8rTnjCbjkVd9kB5
	7t2Xxp8dtsJLvkd486rBagX61gKesGgxqJTdR6DcuMJPO8JPCClBFuNATtIk3lOENFzl+0FaBHjn5
	P0vzDHdiqdqE0P6+/8Ntd3u998yF5JucwnJ/880nhxJC2NQoHmiS76XK21l6gQdIVx/Q7sYB2J2xi
	psx7PWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeO3Y-00Blxv-9G; Fri, 30 Sep 2022 22:00:28 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeO3M-00Blru-VQ; Fri, 30 Sep 2022 22:00:18 +0000
Received: by mail-oo1-f52.google.com with SMTP id k11-20020a4ab28b000000b0047659ccfc28so3127489ooo.8;
        Fri, 30 Sep 2022 15:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=LLT3ZYBdhjAVbmPO/uc2xLKM7qGWQtc4/hcvgBHyd9s=;
        b=WYSH+5PVxXYuNR/1BgY60MD6CvxpdzyXqQBvIeS4WS5oGv4XzFPhWey5JyoUatxp2g
         MlJ+8VCIs+ncDx0FkDYtDveiYzipzXCdD9aKx070tbQHBY+nYUGJGv48kGjQqpFkMILp
         QKHAesDWAlvDGOVJ3BjnqQvBTPW3Zw+0jjKAGtlrUL/jZx5cpo+Q45C9WtoRjdGFZ/kb
         Ny6N5uTKZd0XrMQAq0LXl0+vj5x3yQTYnsUqWwytFxUP5PAByxsMbjm2jBDhvBfxroJV
         e7/0znBCC5S83ThXbCvcXBA/z0sCet7a4yv0q6uNQTrSg66lOYzQxEgrV3j/FOLbK9Ii
         3hMg==
X-Gm-Message-State: ACrzQf2FuDI76Q9cJLmhv37HlIGYioeYjkEzKlAd0frp0n1lso/iX0JI
	Z2HejPAn24p96REUPONk7A==
X-Google-Smtp-Source: AMsMyM6IrejG/870CvnrzUlNmyBET4I5DXOzFKtUrfEAwncNQElS2UqVUUb3+tMW/6JK2TF/26FdJg==
X-Received: by 2002:a9d:ed2:0:b0:657:438a:eefb with SMTP id 76-20020a9d0ed2000000b00657438aeefbmr4289417otj.239.1664575212616;
        Fri, 30 Sep 2022 15:00:12 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g65-20020acab644000000b0035028730c90sm782022oif.1.2022.09.30.15.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 15:00:11 -0700 (PDT)
Received: (nullmailer pid 1111251 invoked by uid 1000);
	Fri, 30 Sep 2022 22:00:11 -0000
Date: Fri, 30 Sep 2022 17:00:11 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/2] media: dt-bindings: mediatek: Rename child node
 names for decoder
Message-ID: <20220930220011.GA1107972-robh@kernel.org>
References: <20220930112237.14411-1-allen-kh.cheng@mediatek.com>
 <20220930112237.14411-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930112237.14411-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_150017_119392_27FB3B16 
X-CRM114-Status: GOOD (  17.30  )
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

On Fri, Sep 30, 2022 at 07:22:36PM +0800, Allen-KH Cheng wrote:
> In order to make the names of the child nodes more generic, we rename
> "vcodec" to "video-codec" for decoder in patternProperties and example.

They are either generic or they aren't. Until something generic is 
defined, I don't think it's worth the churn to change.


> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml    | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index c4f20acdc1f8..67fde48f991c 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -91,7 +91,7 @@ properties:
>  
>  # Required child node:
>  patternProperties:
> -  '^vcodec-lat@[0-9a-f]+$':
> +  '^video-codec-lat@[0-9a-f]+$':

Just 'video-codec' doesn't work?

>      type: object
>  
>      properties:
> @@ -145,7 +145,7 @@ patternProperties:
>  
>      additionalProperties: false
>  
> -  '^vcodec-core@[0-9a-f]+$':
> +  '^video-codec-core@[0-9a-f]+$':
>      type: object
>  
>      properties:
> @@ -241,7 +241,7 @@ examples:
>              #size-cells = <2>;
>              ranges = <0 0 0 0x16000000 0 0x40000>;
>              reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
> -            vcodec-lat@10000 {
> +            video-codec-lat@10000 {
>                  compatible = "mediatek,mtk-vcodec-lat";
>                  reg = <0 0x10000 0 0x800>;
>                  interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> @@ -264,7 +264,7 @@ examples:
>                  power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
>              };
>  
> -            vcodec-core@25000 {
> +            video-codec-core@25000 {
>                  compatible = "mediatek,mtk-vcodec-core";
>                  reg = <0 0x25000 0 0x1000>;
>                  interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> -- 
> 2.18.0
> 
> 

