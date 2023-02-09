Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86CFC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmWeTxm3eAR69llILe3yLFx61s6S09dltEYFO6LRpqs=; b=Ep6tOvSSZfVwtgfFiHO762Cka7
	5Kqej3GoX8USYdKI6EC1KFGTQVvjx7ojbmw3XQaFkzKewYVWxA6mhUX3hZ+48N9NVSXafIfRj2cRI
	9PnDhEgjYxsC82DNpcThCHrMv+NcMayL5ta1LM9bFDN5k9vslKPefp/2Gd67FzrsM5JSvaIFglX+Z
	vxDRgRbNMHtqSwdElUAqAxHi930Q+WezC3WzAiodas+hxkTdW/2EHCzBCCEki5phnnzKpbgpLACXj
	iBmkRvwKcsD2F/pVI5CNScNrlJSCJ4hS0A/ne5evNOX25K0fhI45rfVNZoV9tVYglllV870sogvSp
	FZOnpGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAx9-002br5-C9; Thu, 09 Feb 2023 17:43:23 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAwy-002boV-MO; Thu, 09 Feb 2023 17:43:13 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1685cf2003aso3454595fac.12;
        Thu, 09 Feb 2023 09:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmWeTxm3eAR69llILe3yLFx61s6S09dltEYFO6LRpqs=;
        b=68NN5GYgYFS6C9pZf2mgl1ZNiCcWSCbZF7jx+N0XnXfiei/VeCTz7DXO5wY4uKsuyg
         ukIgeEhKKxqT8XCsYxzRPVrg3iooPrQAUoBuKHTzVPOyI0kQFAGknLwP6N2GKo5R8dyq
         HkNmJFtf606W+U2txHA602GHRHv4sUEc73CDuvCH8EF0SDGDb2jJ6bAbHZ5kC59dIPHU
         yDB8S2wJlf3m9jddevMGmYjOfOs5+2njqHnNgm3U1qiAV3MY90gN4bfWnlit8Jul4dRm
         N0R9sFTFBVTS1+1SY9Np6bja6DHIAhouH7INxSkQFgRwLJyYbPVYnP6K0uSvzBsciG2y
         KrGw==
X-Gm-Message-State: AO0yUKUmtnMKL4S+ezFkJTEpi8wCKrQMTvBWKLqarjh7R83opcf50pFi
	TSRt12smmCrM5hH78EiTVA==
X-Google-Smtp-Source: AK7set9i8Yc0as8tcS+G5ABFmialaz9E/t1quo/d+glus4OAQlGXNCIBfTxURc1sXvd6sOHL45g/YQ==
X-Received: by 2002:a05:6870:a11d:b0:163:d167:80bc with SMTP id m29-20020a056870a11d00b00163d16780bcmr2886406oae.49.1675964590032;
        Thu, 09 Feb 2023 09:43:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ky15-20020a056871404f00b0014fc049fc0asm900969oab.57.2023.02.09.09.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 09:43:09 -0800 (PST)
Received: (nullmailer pid 553172 invoked by uid 1000);
	Thu, 09 Feb 2023 17:43:08 -0000
Date: Thu, 9 Feb 2023 11:43:08 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org, kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, youlin.pei@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, chengci.xu@mediatek.com, mingyuan.ma@mediatek.com, devicetree@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com, iommu@lists.linux.dev, libo.kang@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, yf.wang@mediatek.com, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, nfraprado@collabora.com, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: media: mediatek,vcodec: Remove
 dma-ranges property
Message-ID: <167596458765.553111.2698863120254622830.robh@kernel.org>
References: <20230208053643.28249-1-yong.wu@mediatek.com>
 <20230208053643.28249-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208053643.28249-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_094312_754573_00FF3993 
X-CRM114-Status: GOOD (  15.83  )
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


On Wed, 08 Feb 2023 13:36:34 +0800, Yong Wu wrote:
> After commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
> controllers"), the dma-ranges of the leaf node doesn't work. Remove
> it for vcodec here.
> 
> 1) For mediatek,vcodec-decoder.yaml and mediatek,vcodec-encoder.yaml,
> this property is in the leaf node, it is invalid as the above comment.
> 
> Currently there is only mt8195 VENC node has this property in upstream.
> Indeed, VENC is affected, but it is not a fatal issue. Originally it
> expects its iova range locate at 4GB-8GB. However after that commit, its
> expectation doesn't come true, it will fall back to 0-4GB iova and also
> could work well.
> 
> 2) For mediatek,vcodec-subdev-decoder.yaml, It already uses parent-child
> node, this property works. Instead, MediaTek iommu will control the
> masters' iova ranges by the master's larb/port id internally, then the
> dma-ranges property is unnecessary for the master's node.
> 
> Cc: Tiffany Lin <tiffany.lin@mediatek.com>
> Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/media/mediatek,vcodec-decoder.yaml | 5 -----
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml | 5 -----
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml     | 7 -------
>  3 files changed, 17 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


