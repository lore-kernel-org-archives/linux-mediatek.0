Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1503DC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 05:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtBmGspb7YVZVhQs/0igzOP9ozwtkMdNDmlRCCo4fJo=; b=nSmtEu0YtSjsB1
	u7t+2JImo3GOidP/+ia46+nBa3HEv5oeS87v4/BVKDxLTWggIZ/6qhE6PgZBebVXvsEI2SPrndHMQ
	i/PQB/P/GIVm5WjV9xit/glZ7HPS4QtrS1UA1gVS0xjJDAA1kdODsT8AMfZP2dEyD8HlMqyKmfz3n
	pD6xa5Pm2b7TtIt+GXN11tniKco/jzLi/GkeWwD3SVxfYfsGAUvLAjn7eUrl961ujOuDMCX9jFl11
	iqyWAPi9tFgnJ+HcagmamZE5LtQV5LsYzUrkbHluZ1PTIaeBqhsw6gKNxRc1oTW0bV/CHUt1TilPd
	uGfRgcyQtUsWN4JSf26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0zV2-0079ss-Gu; Tue, 14 Jun 2022 05:54:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0zUz-0079rx-Fe; Tue, 14 Jun 2022 05:53:58 +0000
X-UUID: 0563b139c45c4713a5c7adc2c96f002b-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:70251b62-b285-47db-83e2-7a05a7463e38,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:e63e8307-b57a-4a25-a071-bc7b4972bc68,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0563b139c45c4713a5c7adc2c96f002b-20220613
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1598565252; Mon, 13 Jun 2022 22:53:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 22:45:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 14 Jun 2022 13:45:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 14 Jun 2022 13:45:17 +0800
Message-ID: <c5c9fbe979baed91e096059a2ef14f6d5bb25263.camel@mediatek.com>
Subject: Re: [PATCH v11 09/12] drm/mediatek: dpi: move the csc_enable bit to
 SoC config
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
Date: Tue, 14 Jun 2022 13:45:16 +0800
In-Reply-To: <20220613064841.10481-10-rex-bc.chen@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
	 <20220613064841.10481-10-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_225357_561649_A035F19F 
X-CRM114-Status: GOOD (  16.05  )
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
> Add flexibility by moving the csc_enable bit to SoC specific config

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index b709b7776848..6b8cf648a5b5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -133,6 +133,7 @@ struct mtk_dpi_conf {
>  	u32 hvsize_mask;
>  	u32 channel_swap_shift;
>  	u32 yuv422_en_bit;
> +	u32 csc_enable_bit;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -364,7 +365,8 @@ static void mtk_dpi_config_yuv422_enable(struct
> mtk_dpi *dpi, bool enable)
>  
>  static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool
> enable)
>  {
> -	mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0,
> CSC_ENABLE);
> +	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_bit :
> 0,
> +		     dpi->conf->csc_enable_bit);
>  }
>  
>  static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool
> enable)
> @@ -828,6 +830,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
>  	.yuv422_en_bit = YUV422_EN,
> +	.csc_enable_bit = CSC_ENABLE,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -844,6 +847,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
>  	.yuv422_en_bit = YUV422_EN,
> +	.csc_enable_bit = CSC_ENABLE,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -859,6 +863,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
>  	.yuv422_en_bit = YUV422_EN,
> +	.csc_enable_bit = CSC_ENABLE,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -874,6 +879,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.hvsize_mask = HSIZE_MASK,
>  	.channel_swap_shift = CH_SWAP,
>  	.yuv422_en_bit = YUV422_EN,
> +	.csc_enable_bit = CSC_ENABLE,
>  	.limit = &mtk_dpi_limit,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
