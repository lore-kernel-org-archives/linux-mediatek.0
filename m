Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984CBC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 05:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHOFyrxSQV5e4/8OufEYkvFbZePe0Tf/mFa8HkxOMXk=; b=jeGRQ5Ay8WH1tJ
	brpVPMjfMre7zuAd+x1R44/DOPZBh5n3Qy0wnk1t0PCywdSxhf4Zg2HNQ0vxMxQjQcgCOy7yXLlJB
	Gxg/lQhKOagcq69JhRo56q2CFA9usd+kYl7qGRr6ujTnpPkt21q75AGXalBqcMAuNQG0C5Xfd1THT
	bwr3QlBLUHVCUw47mlwqnM4j8fm1Di6UrmO5x8cWVdeGMt2nPFcJYXAuULf0ZSG0UkoHh3a9KdQcA
	7kETk8XlI7vA9VPT5D3CBGFedcgus0eop25rF74K9GcuTsA4+31Dna6wdev5kMzT2Ael1bc6P35oO
	EI89+YL0BpWfd9TdfY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0zGT-0077Ya-5g; Tue, 14 Jun 2022 05:38:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0zGQ-0077Ve-SG; Tue, 14 Jun 2022 05:38:56 +0000
X-UUID: 9c9ccaedca3e495eb06d49cfc188ce98-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:d2ae8d72-f96d-42ce-b179-f1bf4d0e2f3a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:d5aa8207-b57a-4a25-a071-bc7b4972bc68,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9c9ccaedca3e495eb06d49cfc188ce98-20220613
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1940652529; Mon, 13 Jun 2022 22:38:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 22:38:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 14 Jun 2022 13:38:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 14 Jun 2022 13:38:39 +0800
Message-ID: <acaf3f8a2cfa14cb050be1550c917ba84c0d81dd.camel@mediatek.com>
Subject: Re: [PATCH v11 07/12] drm/mediatek: dpi: move swap_shift to SoC
 config
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 14 Jun 2022 13:38:39 +0800
In-Reply-To: <20220613064841.10481-8-rex-bc.chen@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
	 <20220613064841.10481-8-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_223854_949399_A8D66D2F 
X-CRM114-Status: GOOD (  15.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bo-Chen:

On Mon, 2022-06-13 at 14:48 +0800, Bo-Chen Chen wrote:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> Add flexibility by moving the swap shift value to SoC specific
> config.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index afd81ae307da..2c0e9670c209 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -131,6 +131,7 @@ struct mtk_dpi_conf {
>  	u32 dimension_mask;
>  	/* HSIZE and VSIZE mask (no shift) */
>  	u32 hvsize_mask;
> +	u32 channel_swap_shift;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -349,7 +350,9 @@ static void mtk_dpi_config_channel_swap(struct
> mtk_dpi *dpi,
>  		break;
>  	}
>  
> -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
> CH_SWAP_MASK);
> +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> +		     val << dpi->conf->channel_swap_shift,
> +		     CH_SWAP_MASK << dpi->conf->channel_swap_shift);
>  }
>  
>  static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool
> enable)
> @@ -821,6 +824,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -835,6 +839,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -848,6 +853,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -861,6 +867,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
