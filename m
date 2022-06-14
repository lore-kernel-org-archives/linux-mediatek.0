Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E769C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 05:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1+SPGkr40iZdPnpLM7vo/0i4Bigf+EnNqtCjz2Wrys=; b=yfbRZ0HN0m5XPI
	0HG1B677HwXUpThf+NafEIm8IN1jse4+Pkv9w+Zijyull5ANq5UNaAcyFdmLdrE4lWoMlDQy6w9qf
	eZOHlt2e1MttZ0dWJDeNvFhclfLsCfuzvYFQNYnHk210zFjBDN3tn+LVOj7NWUI1DlH8qLGkMP2o8
	zxYijLIGjhIKZM6rUQwFZVtJr9rESwflZJg6DvF8U1p6AVVG24BM842lvgQzqlG8tJWNilkfCxoqI
	QTiShasjVHseCn+J0yjXVHyUu7Bbb80ml+OfZ0FK1y6XJd9R96hQ77ak5VtHfZ7oc1PnBlWe4CDGQ
	1f1LyOsLtLq3alSCrqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0zFQ-0077Gf-FJ; Tue, 14 Jun 2022 05:37:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0zFM-0077F8-Tm; Tue, 14 Jun 2022 05:37:51 +0000
X-UUID: fa5b3f581a6b437e9e13f751949c8488-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:068c34d3-0449-4bbe-ba51-6afa21f1acf6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:a7a08207-b57a-4a25-a071-bc7b4972bc68,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fa5b3f581a6b437e9e13f751949c8488-20220613
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1366366796; Mon, 13 Jun 2022 22:37:40 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 22:27:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 14 Jun 2022 13:27:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 14 Jun 2022 13:27:36 +0800
Message-ID: <e431cca23add678bb39dbc75d783d239914d256a.camel@mediatek.com>
Subject: Re: [PATCH v11 04/12] drm/mediatek: dpi: implement a swap_input
 toggle in SoC config
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
Date: Tue, 14 Jun 2022 13:27:36 +0800
In-Reply-To: <20220613064841.10481-5-rex-bc.chen@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
	 <20220613064841.10481-5-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_223748_993409_6CFE77D7 
X-CRM114-Status: GOOD (  18.24  )
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
> The hardware design of dp_intf does not support input swap, so we add
> a bit of flexibility to support SoCs without swap_input support.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Add modification reason in commit message.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 15218c1e8c11..c1438c744120 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -126,6 +126,7 @@ struct mtk_dpi_conf {
>  	const u32 *output_fmts;
>  	u32 num_output_fmts;
>  	bool is_ck_de_pol;
> +	bool swap_input_support;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -378,18 +379,21 @@ static void mtk_dpi_config_color_format(struct
> mtk_dpi *dpi,
>  	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
>  		mtk_dpi_config_yuv422_enable(dpi, false);
>  		mtk_dpi_config_csc_enable(dpi, true);
> -		mtk_dpi_config_swap_input(dpi, false);
> +		if (dpi->conf->swap_input_support)
> +			mtk_dpi_config_swap_input(dpi, false);
>  		mtk_dpi_config_channel_swap(dpi,
> MTK_DPI_OUT_CHANNEL_SWAP_BGR);
>  	} else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
>  		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
>  		mtk_dpi_config_yuv422_enable(dpi, true);
>  		mtk_dpi_config_csc_enable(dpi, true);
> -		mtk_dpi_config_swap_input(dpi, true);
> +		if (dpi->conf->swap_input_support)
> +			mtk_dpi_config_swap_input(dpi, true);

In this case, we need swap input, but hardware does not support, so
just skip config hardware and everything works fine? Should print any
error message?

Regards,
CK

>  		mtk_dpi_config_channel_swap(dpi,
> MTK_DPI_OUT_CHANNEL_SWAP_RGB);
>  	} else {
>  		mtk_dpi_config_yuv422_enable(dpi, false);
>  		mtk_dpi_config_csc_enable(dpi, false);
> -		mtk_dpi_config_swap_input(dpi, false);
> +		if (dpi->conf->swap_input_support)
> +			mtk_dpi_config_swap_input(dpi, false);
>  		mtk_dpi_config_channel_swap(dpi,
> MTK_DPI_OUT_CHANNEL_SWAP_RGB);
>  	}
>  }
> @@ -808,6 +812,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.output_fmts = mt8173_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
> +	.swap_input_support = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -819,6 +824,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.output_fmts = mt8173_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
>  	.is_ck_de_pol = true,
> +	.swap_input_support = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -829,6 +835,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.output_fmts = mt8183_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  	.is_ck_de_pol = true,
> +	.swap_input_support = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -839,6 +846,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.output_fmts = mt8183_output_fmts,
>  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  	.is_ck_de_pol = true,
> +	.swap_input_support = true,
>  	.limit = &mtk_dpi_limit,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
