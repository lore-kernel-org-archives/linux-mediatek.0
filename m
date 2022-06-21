Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AC7C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXOIUpbS/okCVKin1XXkv1KvkeIaHBePNDr16sDLd1U=; b=yq6xq0DFMvrMIo0toImuz4QmR+
	IubNl3udoKXNOpLK8B2MOMmGHXd5nYt2UNglwGNSuZefw/07NUuNPylVG9SK03ADgxbWRGnSyiGTE
	Sr7gshakgZgaWc0MdFD4ogbRVpbbp2o7BxcEFiATuJKo4be3SmmntfYekozfbtHqBZziTZg4ZmLNj
	evou1svZdiSBwpxQ6qeqW7cy94jqkgrWmZxHbHlKIuH3YRJshZktm93XfogMcIovc4NZfwoGT8tz/
	XyqiiEwJpoG6r8XEOApibMrv+IjenKdFSLXyr1DM4PQ6gyUhENf+iMnvmAPvJmpjeV5AEzgkzTZMy
	prqgtOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ZYh-004PNG-Lw; Tue, 21 Jun 2022 08:48:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ZYS-004PIG-BH; Tue, 21 Jun 2022 08:48:16 +0000
X-UUID: 6c6340a28aa14c399a5b311f28d4ddae-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:c1177111-c6d2-46d3-afdd-2f1b3ff5dc51,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:2
X-CID-META: VersionHash:b14ad71,CLOUDID:f0eaa12d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6c6340a28aa14c399a5b311f28d4ddae-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 632093150; Tue, 21 Jun 2022 01:48:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 01:41:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 21 Jun 2022 16:41:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 16:41:52 +0800
Message-ID: <5907e3fc6a690bb79c2ad9b20f6e353b2ba8c774.camel@mediatek.com>
Subject: Re: [PATCH v12 14/14] drm/mediatek: dpi: Add matrix_sel helper
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 21 Jun 2022 16:41:52 +0800
In-Reply-To: <76d86558adba1e043e50ab0e18403038450b8099.camel@mediatek.com>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
	 <20220620121028.29234-15-rex-bc.chen@mediatek.com>
	 <76d86558adba1e043e50ab0e18403038450b8099.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_014812_416919_75F49339 
X-CRM114-Status: GOOD (  29.10  )
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

On Tue, 2022-06-21 at 11:33 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-20 at 20:10 +0800, Bo-Chen Chen wrote:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > Matrix selection is a new feature for both dpi and dpintf of
> > MT8195.
> > Add a mtk_dpi_matrix_sel() helper to update the DPI_MATRIX_SET
> > register depending on the color format.
> 
> Describe more about what this do.
> 

this feature is color format transfer.
For mt8195, the input format is RGB888 andd output format could be
YUV422. do you think I should squash this patch into [v12,12/14]
drm/mediatek: dpi: Add YUV422 output support?

> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c      | 29
> > +++++++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  3 +++
> >  2 files changed, 32 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 220e9b18e2cd..8a9151cb1622 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -135,6 +135,7 @@ struct mtk_dpi_conf {
> >  	u32 channel_swap_shift;
> >  	u32 yuv422_en_bit;
> >  	u32 csc_enable_bit;
> > +	bool matrx_sel_support;
> >  };
> >  
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> > u32 mask)
> > @@ -398,6 +399,31 @@ static void mtk_dpi_config_disable_edge(struct
> > mtk_dpi *dpi)
> >  		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0,
> > EDGE_SEL_EN);
> >  }
> >  
> > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi,
> > +			       enum mtk_dpi_out_color_format format)
> > +{
> > +	u32 matrix_sel = 0;
> > +
> > +	if (!dpi->conf->matrx_sel_support) {
> > +		dev_info(dpi->dev, "matrix_sel is not supported.\n");
> 
> So for this SoC, there would be something wrong? I still does not
> understand what this feature is.
> 
> static const struct of_device_id mtk_dpi_of_ids[] = {
> 	{ .compatible = "mediatek,mt2701-dpi",
> 	  .data = &mt2701_conf,
> 	},
> 	{ .compatible = "mediatek,mt8173-dpi",
> 	  .data = &mt8173_conf,
> 	},
> 	{ .compatible = "mediatek,mt8183-dpi",
> 	  .data = &mt8183_conf,
> 	},
> 	{ .compatible = "mediatek,mt8192-dpi",
> 	  .data = &mt8192_conf,
> 	},
> 	{ },
> };
> 
> > +		return;
> > +	}
> > +
> > +	switch (format) {
> > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> > +	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> > +	case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> > +	case MTK_DPI_COLOR_FORMAT_XV_YCC:
> > +		if (dpi->mode.hdisplay <= 720)
> > +			matrix_sel = 0x2;
> 
> Symbolize 0x2.
> 
> > +		break;
> > +	default:
> 
> If format is MTK_DPI_COLOR_FORMAT_YCBCR_422 first, then format change
> to MTK_DPI_COLOR_FORMAT_RGB and matrix_sel would still be 0x2. Is
> this
> correct?
> 
> Regards,
> CK
> 
> > +		break;
> > +	}
> > +	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel,
> > INT_MATRIX_SEL_MASK);
> > +}
> > +
> >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> >  					enum mtk_dpi_out_color_format
> > format)
> >  {
> > @@ -405,6 +431,7 @@ static void mtk_dpi_config_color_format(struct
> > mtk_dpi *dpi,
> >  	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> >  		mtk_dpi_config_yuv422_enable(dpi, false);
> >  		mtk_dpi_config_csc_enable(dpi, true);
> > +		mtk_dpi_matrix_sel(dpi, format);
> >  		if (dpi->conf->swap_input_support)
> >  			mtk_dpi_config_swap_input(dpi, false);
> >  		mtk_dpi_config_channel_swap(dpi,
> > MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> > @@ -412,6 +439,7 @@ static void mtk_dpi_config_color_format(struct
> > mtk_dpi *dpi,
> >  		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> >  		mtk_dpi_config_yuv422_enable(dpi, true);
> >  		mtk_dpi_config_csc_enable(dpi, true);
> > +		mtk_dpi_matrix_sel(dpi, format);
> >  		if (dpi->conf->swap_input_support)
> >  			mtk_dpi_config_swap_input(dpi, true);
> >  		else
> > @@ -951,6 +979,7 @@ static const struct mtk_dpi_conf
> > mt8195_dpintf_conf = {
> >  	.channel_swap_shift = DPINTF_CH_SWAP,
> >  	.yuv422_en_bit = DPINTF_YUV422_EN,
> >  	.csc_enable_bit = DPINTF_CSC_ENABLE,
> > +	.matrx_sel_support = true,
> >  };
> >  
> >  static int mtk_dpi_probe(struct platform_device *pdev)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > index f7f0272dbd6a..96c117202d0d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > @@ -230,4 +230,7 @@
> >  #define EDGE_SEL_EN			BIT(5)
> >  #define H_FRE_2N			BIT(25)
> >  
> > +#define DPI_MATRIX_SET		0xB4
> > +#define INT_MATRIX_SEL_MASK	(0x1F << 0)
> > +
> >  #endif /* __MTK_DPI_REGS_H */
> 
> 


