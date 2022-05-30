Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C8EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1I+BQFZYDCuVcYnOa09p9j4lOPu5ZVUOcRCNaVnWCyg=; b=in0Kiw0vXAL3k2
	Ifqian63tgCeePPHSDdyCfbg5MPJvz6DOI3p/fhbU/QyurncREaOdgARW0QSFfO8W/G0lHHZ2jO7H
	Gdf4hJcw7EVZ/co8pIDAzsYlh637A107UcSQKQYeJXQCZIDVjS5wEZtT68ELiziM87NLfCx+OwJkB
	sOAYjy0xx0Ll1U09rjJeFtezYvQ/mft9BDDFemdo3QUjLtlx+vvDRZtlY3uHwpcfSFqiJNV2myizg
	37BQXErwV4jVWCZ9yU/EFfh07Ao98U+KIelPP7jHm6/O0Igg6dBErbzWo+h0v5w6YGHYx46FteinF
	EQbxoll9h06Sqz/5ILMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvaGC-005nii-F0; Mon, 30 May 2022 07:56:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvaFz-005ncR-TD; Mon, 30 May 2022 07:56:09 +0000
X-UUID: c4efc4e80d874d239ebea0ca90494f39-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:cd0e32ea-6ab0-40f1-91aa-d97538513259,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:9c50c0b8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: c4efc4e80d874d239ebea0ca90494f39-20220530
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1485516489; Mon, 30 May 2022 00:56:02 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 00:56:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 30 May 2022 15:55:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 15:55:58 +0800
Message-ID: <201747a8679474a1088aa12e5175b9e8ac21306e.camel@mediatek.com>
Subject: Re: [PATCH v10 09/21] drm/mediatek: dpi: move dimension mask to SoC
 config
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao shi <jitao.shi@mediatek.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-fbdev@vger.kernel.org>
Date: Mon, 30 May 2022 15:55:58 +0800
In-Reply-To: <20220523104758.29531-10-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-10-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_005608_005559_CB508BD6 
X-CRM114-Status: GOOD (  15.34  )
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

Hi, Guillaume:

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> Add flexibility by moving the dimension mask to the SoC config

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 454f8563efae..bf098f36a466 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -127,6 +127,8 @@ struct mtk_dpi_conf {
>  	u32 num_output_fmts;
>  	bool is_ck_de_pol;
>  	bool swap_input_support;
> +	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
> (no shift) */
> +	u32 dimension_mask;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -156,30 +158,30 @@ static void mtk_dpi_disable(struct mtk_dpi
> *dpi)
>  static void mtk_dpi_config_hsync(struct mtk_dpi *dpi,
>  				 struct mtk_dpi_sync_param *sync)
>  {
> -	mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
> -		     sync->sync_width << HPW, HPW_MASK);
> -	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
> -		     sync->back_porch << HBP, HBP_MASK);
> +	mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH, sync->sync_width << HPW,
> +		     dpi->conf->dimension_mask << HPW);
> +	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->back_porch << HBP,
> +		     dpi->conf->dimension_mask << HBP);
>  	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
> -		     HFP_MASK);
> +		     dpi->conf->dimension_mask << HFP);
>  }
>  
>  static void mtk_dpi_config_vsync(struct mtk_dpi *dpi,
>  				 struct mtk_dpi_sync_param *sync,
>  				 u32 width_addr, u32 porch_addr)
>  {
> -	mtk_dpi_mask(dpi, width_addr,
> -		     sync->sync_width << VSYNC_WIDTH_SHIFT,
> -		     VSYNC_WIDTH_MASK);
>  	mtk_dpi_mask(dpi, width_addr,
>  		     sync->shift_half_line << VSYNC_HALF_LINE_SHIFT,
>  		     VSYNC_HALF_LINE_MASK);
> +	mtk_dpi_mask(dpi, width_addr,
> +		     sync->sync_width << VSYNC_WIDTH_SHIFT,
> +		     dpi->conf->dimension_mask << VSYNC_WIDTH_SHIFT);
>  	mtk_dpi_mask(dpi, porch_addr,
>  		     sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
> -		     VSYNC_BACK_PORCH_MASK);
> +		     dpi->conf->dimension_mask <<
> VSYNC_BACK_PORCH_SHIFT);
>  	mtk_dpi_mask(dpi, porch_addr,
>  		     sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
> -		     VSYNC_FRONT_PORCH_MASK);
> +		     dpi->conf->dimension_mask <<
> VSYNC_FRONT_PORCH_SHIFT);
>  }
>  
>  static void mtk_dpi_config_vsync_lodd(struct mtk_dpi *dpi,
> @@ -813,6 +815,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -825,6 +828,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -836,6 +840,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -847,6 +852,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
>  	.swap_input_support = true,
> +	.dimension_mask = HPW_MASK,
>  	.limit = &mtk_dpi_limit,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
