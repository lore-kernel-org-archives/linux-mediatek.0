Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C566CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 23:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGjAfESow6+4+ffZdaTFVv+WtGA9rt5Tc3vc+VeK/lU=; b=hEx/dLDYg8jha8u4nFHR2Q63Uc
	xLtiPFnBPeYUoc+ON452p+OL+lXoSooNA/9ipujuzgzdhQbb5V2C2JRlNxcJsZcNzwjPBUAJ3e709
	60P9DU/bOWuGvgF73Olu8hBkzFHzC9nneT96ygJi/9fDWXmLMAOVzzvdlaWuY6nKjz8tPjC7W26X7
	q/lb4RMe6v3ADieLDecz4O395P2MShbDFaerUeDwCjftMzIXGHGPdrVZEr6kFaxxrxj6EXsSOO6WV
	JXDCQGg9FNbsU/LJj8qJsxHGqLNJA12W1fu6Uk/lDiBe2uS7nQL04s8lV3rWHG+/adyTQvWbRMrGq
	q9dYf0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0tRE-00BuPU-Ar; Thu, 01 Dec 2022 23:57:56 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0tQu-00BuHt-HD; Thu, 01 Dec 2022 23:57:37 +0000
Received: by mail-oi1-f178.google.com with SMTP id n205so3795070oib.1;
        Thu, 01 Dec 2022 15:57:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGjAfESow6+4+ffZdaTFVv+WtGA9rt5Tc3vc+VeK/lU=;
        b=gpU509L2nyPBda8y2n+KnUhEcp5R79XJnAqwgdQHKIuxrm7pYK/Rk3ijyLFacdC/t8
         A/MkpTg8GZT/o7bKyCmUyuRbz9Hgn0b+hKaipKBnOQX2XQ95HG18K59nwpDQPnqI3PKh
         dg31w1b5/T0ZxLdPuZwMzRsrze0Fo+6UONqPQPSpdFgO/tiWr/GGxaqJA3rao5n8lpwD
         bgmp/z6OVWWlQCTon0jLhl0lo1Xgfh4VHGVGfj6wTpTOzoULmm1SF/f1leF0+4dA+KNK
         wP5zLOcITqE+RbC3Ft6hgUo/H/8i56/lhTF9UQOVGYnp1uGEe373Pr60h1PyDikGUNMS
         7gKg==
X-Gm-Message-State: ANoB5pmNkI8lgcdZHc9/skE7ndsF/3nhAWuV8TWFZWcJWVVJXP/YmRfV
	RU5zxJghziajzpyWfGQVtN3mb6/QCA==
X-Google-Smtp-Source: AA0mqf4x71P/cAMC4DADS7DjF+bxxae/KaWzMASeyQYj1p6he19Sq612XtNSF3yVmq/PoVjNDHksOQ==
X-Received: by 2002:aca:4285:0:b0:354:893b:7004 with SMTP id p127-20020aca4285000000b00354893b7004mr35969032oia.50.1669939050467;
        Thu, 01 Dec 2022 15:57:30 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y204-20020aca32d5000000b00359b83e3df1sm2407880oiy.9.2022.12.01.15.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:57:29 -0800 (PST)
Received: (nullmailer pid 1719312 invoked by uid 1000);
	Thu, 01 Dec 2022 23:57:29 -0000
Date: Thu, 1 Dec 2022 17:57:29 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3,1/3] media: dt-bindings: media: mediatek: vcodec: Fix
 clock num not correctly
Message-ID: <20221201235729.GA1718283-robh@kernel.org>
References: <20221201121525.30777-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201121525.30777-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_155736_592652_2505AF5F 
X-CRM114-Status: GOOD (  16.33  )
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

On Thu, Dec 01, 2022 at 08:15:22PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> mt8195 and mt8192 have different clock numbers, can't write 'clocks' and
> 'clock-names' with const value.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> Reference series:
> [1]: v5 of this series is presend by Allen-KH Cheng.
>      message-id: 20221128143832.25584-4-allen-kh.cheng@mediatek.com
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml   | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index 7c5b4a91c59b..09781ef02193 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -110,15 +110,12 @@ patternProperties:
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

Names need to be defined. This is a step backwards.

Rob

>  
>        assigned-clocks:
>          maxItems: 1
> -- 
> 2.18.0
> 
> 

