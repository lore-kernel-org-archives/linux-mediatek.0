Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB7AC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPp5U+s5Tdz5eWFkME/CNSkXLDoNmn1zZcdEoDx29Mc=; b=ZAYhng4oA0l+iN0cCZW8ge3LNd
	NAn74hdKkfoyB+zOhfYXl4O2Es0scwxqwME85q2o+CQ0M9Yd7nvSF8Yi3jUP+zM7qfAYTEIW/k476
	uidWhJ4EIApnHY8iWDlnckt74Ag2vdTVgRwNr0aYk2q4Bj5BAB8nw40Lp2XeFzmyIxNoIzN1w0Y0I
	NSueqQnmoQvGBKH92s6tW+qrNehxRmzNIAafz307+7eIv8OR6SHjelSs+rBfW6cgTOwt5DCqZeznD
	ydGruaDiSBPk23sFcm3nT518DsNT1bf/54L537NuD5/YxVMvTmbQTZ+kDF3ZvwFeElFz3KWwg+IvU
	jiMiWgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ejs-00Gcvd-RQ; Tue, 05 Jul 2022 09:21:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8eja-00GclA-Fa; Tue, 05 Jul 2022 09:20:45 +0000
X-UUID: ab0fcbda9cdc45b3956aabca4cd5982d-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:3e1918c4-b476-423c-b9e0-b1f565d2f414,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:651e7463-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ab0fcbda9cdc45b3956aabca4cd5982d-20220705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 819218778; Tue, 05 Jul 2022 02:20:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 5 Jul 2022 16:39:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jul 2022 16:39:57 +0800
Message-ID: <807fa1a3e896eaaa02aec6166f5fb833d7917da7.camel@mediatek.com>
Subject: Re: [PATCH v15 13/16] drm/mediatek: dpi: Add YUV422 output support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<xinlei.lee@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 5 Jul 2022 16:39:56 +0800
In-Reply-To: <f834d5612bef6fa216602b3dcbed629f1b4c903b.camel@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
	 <20220701035845.16458-14-rex-bc.chen@mediatek.com>
	 <f834d5612bef6fa216602b3dcbed629f1b4c903b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_022042_578880_1FA4A05C 
X-CRM114-Status: GOOD (  34.35  )
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

On Tue, 2022-07-05 at 13:21 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Fri, 2022-07-01 at 11:58 +0800, Bo-Chen Chen wrote:
> > Dp_intf supports YUV422 as output format. In MT8195 Chrome project,
> > YUV422 output format is used for 4K resolution.
> > 
> > To support this, it is also needed to support color format
> > transfer.
> > Color format transfer is a new feature for both dpi and dpintf of
> > MT8195.
> > 
> > The input format could be RGB888 and output format for dp_intf
> > should
> > be
> > YUV422. Therefore, we add a mtk_dpi_matrix_sel() helper to update
> > the
> > DPI_MATRIX_SET register depending on the color format.
> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c      | 61 +++++++++++++++++++++
> > ----
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  6 +++
> >  2 files changed, 59 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 3085033becbd..0a604bf68b1b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -54,7 +54,8 @@ enum mtk_dpi_out_channel_swap {
> >  };
> >  
> >  enum mtk_dpi_out_color_format {
> > -	MTK_DPI_COLOR_FORMAT_RGB
> > +	MTK_DPI_COLOR_FORMAT_RGB,
> > +	MTK_DPI_COLOR_FORMAT_YCBCR_422
> >  };
> >  
> >  struct mtk_dpi {
> > @@ -122,6 +123,7 @@ struct mtk_dpi_yc_limit {
> >   * @num_output_fmts: Quantity of supported output formats.
> >   * @is_ck_de_pol: Support CK/DE polarity.
> >   * @swap_input_support: Support input swap function.
> > + * @color_fmt_trans_support: Enable color format transfer.
> >   * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and
> > VSYNC_PORCH
> >   *		    (no shift).
> >   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
> > @@ -138,6 +140,7 @@ struct mtk_dpi_conf {
> >  	u32 num_output_fmts;
> >  	bool is_ck_de_pol;
> >  	bool swap_input_support;
> > +	bool color_fmt_trans_support;
> >  	u32 dimension_mask;
> >  	u32 hvsize_mask;
> >  	u32 channel_swap_shift;
> > @@ -406,15 +409,54 @@ static void
> > mtk_dpi_config_disable_edge(struct
> > mtk_dpi *dpi)
> >  		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0,
> > EDGE_SEL_EN);
> >  }
> >  
> > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi,
> > +			       enum mtk_dpi_out_color_format format)
> 
> The format would only be MTK_DPI_COLOR_FORMAT_YCBCR_422, so drop the
> parameter format.
> 
> > +{
> > +	u32 matrix_sel;
> > +
> > +	if (!dpi->conf->color_fmt_trans_support) {
> 
> Only YUV format would call this function, and I think YUV support
> would
> imply that color_fmt_trans_support is true. So drop
> color_fmt_trans_support.
> 
> > +		dev_info(dpi->dev, "matrix_sel is not supported.\n");
> > +		return;
> > +	}
> > +
> > +	switch (format) {
> > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > +		/*
> > +		 * If height is smaller than 720, we need to use
> > RGB_TO_BT601
> > +		 * to transfer to yuv422. Otherwise, we use
> > RGB_TO_JPEG.
> > +		 */
> > +		if (dpi->mode.hdisplay <= 720)
> > +			matrix_sel = MATRIX_SEL_RGB_TO_BT601;
> > +		else
> > +			matrix_sel = MATRIX_SEL_RGB_TO_JPEG;
> > +		break;
> > +	default:
> > +		matrix_sel = MATRIX_SEL_RGB_TO_JPEG;
> > +		break;
> > +	}
> > +	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel,
> > INT_MATRIX_SEL_MASK);
> 
> it seems that we could drop this function and write register as:
> 
> mtk_dpi_mask(dpi, DPI_MATRIX_SET, dpi->mode.hdisplay <= 720
> ? MATRIX_SEL_RGB_TO_BT601 : MATRIX_SEL_RGB_TO_JPEG,
> INT_MATRIX_SEL_MASK);
> 

Hello CK,

ok, I will drop this function and config.

> > +}
> > +
> >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> >  					enum mtk_dpi_out_color_format
> > format)
> >  {
> > -	/* only support RGB888 */
> > -	mtk_dpi_config_yuv422_enable(dpi, false);
> > -	mtk_dpi_config_csc_enable(dpi, false);
> > -	if (dpi->conf->swap_input_support)
> > -		mtk_dpi_config_swap_input(dpi, false);
> > -	mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> > +	if (format == MTK_DPI_COLOR_FORMAT_YCBCR_422) {
> > +		mtk_dpi_config_yuv422_enable(dpi, true);
> > +		mtk_dpi_config_csc_enable(dpi, true);
> > +		mtk_dpi_matrix_sel(dpi, format);
> > +		if (dpi->conf->swap_input_support)
> 
> This would never be true because only MT8195 support
> MTK_DPI_COLOR_FORMAT_YCBCR_422 and swap_input_support of MT8195 is
> false.
> 

I think for mt8195, it should be support output format yuv422 and
rgb888.

please refer to [16/16]

+static const u32 mt8195_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+};

BRs,
Bo-Chen
> Regards,
> CK
> 
> > +			mtk_dpi_config_swap_input(dpi, true);
> > +		else
> > +			dev_warn(dpi->dev,
> > +				 "Failed to swap input, hw is not
> > supported.\n");
> > +		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> > +	} else {
> > +		mtk_dpi_config_yuv422_enable(dpi, false);
> > +		mtk_dpi_config_csc_enable(dpi, false);
> > +		if (dpi->conf->swap_input_support)
> > +			mtk_dpi_config_swap_input(dpi, false);
> > +		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> > +	}
> >  }
> >  
> >  static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
> > @@ -649,7 +691,10 @@ static int mtk_dpi_bridge_atomic_check(struct
> > drm_bridge *bridge,
> >  	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> >  	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> >  	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > +	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> > +		dpi->color_format = MTK_DPI_COLOR_FORMAT_YCBCR_422;
> > +	else
> > +		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > index 3a02fabe1662..9ce300313f3e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > @@ -217,4 +217,10 @@
> >  
> >  #define EDGE_SEL_EN			BIT(5)
> >  #define H_FRE_2N			BIT(25)
> > +
> > +#define DPI_MATRIX_SET		0xB4
> > +#define INT_MATRIX_SEL_MASK		GENMASK(4, 0)
> > +#define MATRIX_SEL_RGB_TO_JPEG		0
> > +#define MATRIX_SEL_RGB_TO_BT601		2
> > +
> >  #endif /* __MTK_DPI_REGS_H */
> 
> 


