Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6CAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvbkbt+fhqkRsBoxgV69ROpkzKXvdAygtuP+rEDKRhA=; b=ee0YyL51WBOqsP
	JY+WNd5WtudUNaGq4RHJthL8QTbQvsmszD+aug4OC0W8ZUQOfBA+I4zRuETWDlb8Z8xvCoT74Utdu
	91QDBZspToTYJNH8al+ibcg5BnUVnADGnZXEIJeVdV54vQbgdmz6uMutebLHT7cChTbDYsNKvKl7n
	B3OYRIWx4YM2zLCLw/2SrWuW/hhb5TGDUjUAooLA9D5tbbN++8kzvu1Eh1ix1BrRYqtKb/3RPOH3i
	9x76++A7zHtA690qGgb94dLlNxT6Xkn6COyUbKG7wCQ/hWkdBQ0r0v6q16b5gDU5Ivb8bW9Nkr3i7
	EfRNdWqY7/0C9itGz94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nva4s-005jiM-Ti; Mon, 30 May 2022 07:44:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nva4g-005jbl-TD; Mon, 30 May 2022 07:44:28 +0000
X-UUID: 6a4a789b91074a979020a9d4c1a83f08-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:6ea237ef-c79d-447e-b93b-4889bfa9bb4b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:dbd0bfb8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 6a4a789b91074a979020a9d4c1a83f08-20220530
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 226907898; Mon, 30 May 2022 00:44:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 00:44:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 30 May 2022 15:44:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 May 2022 15:44:18 +0800
Message-ID: <356624f3283f9203007ab21bedf15744d86e16f8.camel@mediatek.com>
Subject: Re: [PATCH v10 07/21] drm/mediatek: dpi: implement a CK/DE pol
 toggle in SoC config
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
Date: Mon, 30 May 2022 15:44:19 +0800
In-Reply-To: <20220523104758.29531-8-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-8-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_004427_038272_EF893370 
X-CRM114-Status: GOOD (  17.40  )
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
> Adds a bit of flexibility to support SoCs without CK/DE pol support

It seems that DP_INTF has no CK/DE pol function. If so, could you
explain why DP_INTF has this difference with DPI?

Regards,
CK

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 4746eb342567..545a1337cc89 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -125,6 +125,7 @@ struct mtk_dpi_conf {
>  	bool edge_sel_en;
>  	const u32 *output_fmts;
>  	u32 num_output_fmts;
> +	bool is_ck_de_pol;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -211,13 +212,20 @@ static void mtk_dpi_config_pol(struct mtk_dpi
> *dpi,
>  			       struct mtk_dpi_polarities *dpi_pol)
>  {
>  	unsigned int pol;
> +	unsigned int mask;
>  
> -	pol = (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ? 0 : CK_POL)
> |
> -	      (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ? 0 : DE_POL)
> |
> -	      (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> HSYNC_POL) |
> +	mask = HSYNC_POL | VSYNC_POL;
> +	pol = (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> HSYNC_POL) |
>  	      (dpi_pol->vsync_pol == MTK_DPI_POLARITY_RISING ? 0 :
> VSYNC_POL);
> -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol,
> -		     CK_POL | DE_POL | HSYNC_POL | VSYNC_POL);
> +	if (dpi->conf->is_ck_de_pol) {
> +		mask |= CK_POL | DE_POL;
> +		pol |= (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ?
> +			0 : CK_POL) |
> +		       (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ?
> +			0 : DE_POL);
> +	}
> +
> +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol, mask);
>  }
>  
>  static void mtk_dpi_config_3d(struct mtk_dpi *dpi, bool en_3d)
> @@ -799,6 +807,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.max_clock_khz = 300000,
>  	.output_fmts = mt8173_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> +	.is_ck_de_pol = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -809,6 +818,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.max_clock_khz = 150000,
>  	.output_fmts = mt8173_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> +	.is_ck_de_pol = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -818,6 +828,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.max_clock_khz = 100000,
>  	.output_fmts = mt8183_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> +	.is_ck_de_pol = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -827,6 +838,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.max_clock_khz = 150000,
>  	.output_fmts = mt8173_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> +	.is_ck_de_pol = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
