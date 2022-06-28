Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 05:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFc9WcolGCeImNeWHT7XRABT7k0G2fAk8MMLMAlBwrU=; b=hQ5xg8aXMy9+eoPowPtIvJ8s7O
	vGGFBkR07hKi9EshupJ5HJG0A1fxV/Umhy0bENX1qm2hMtQTcywMPLnOTuwh8U4Z1MNhwcOkHyyL2
	GuAyIpkGZp+bsDqR9lktXjDouD6UHYkeEH0X6nPTFMLXDzD7mFUgkRLCOICaUPguxVDWu3M5/B7fJ
	P46lIfVHdGuywaZgxCPi3mBfXfcCOOInMbLRzUOW0cIKxY5Vxlk71cF3RCQqtCbV1IjEKfJvbcC/S
	f3Mr09pwJW8SQIl2KmsrrXtHxemKdp8nEpFDyhgkdLj9fXtjO4p5jFmoZOyDhwUFxOxw1QP/DkWF2
	t0gH52Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o647t-004STt-Uj; Tue, 28 Jun 2022 05:51:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o646c-004S2o-4U; Tue, 28 Jun 2022 05:49:48 +0000
X-UUID: 53691585e15e46e58f736582d756b417-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:e2c1d045-1143-474c-87ae-63f1458c8dec,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:1aebf485-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 53691585e15e46e58f736582d756b417-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 808020349; Mon, 27 Jun 2022 22:49:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 28 Jun 2022 11:27:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 28 Jun 2022 11:27:50 +0800
Message-ID: <b67519058c36e2331da6e1995f6f7a66c3eef081.camel@mediatek.com>
Subject: Re: [PATCH v14 12/15] drm/mediatek: dpi: Add YUV422 output support
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
Date: Tue, 28 Jun 2022 11:27:49 +0800
In-Reply-To: <7713b73db7d0f2763661a7e328f4313bd72d497d.camel@mediatek.com>
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
	 <20220624030946.14961-13-rex-bc.chen@mediatek.com>
	 <a59a61a81e45fd361774a28a66ffd3d673cb3148.camel@mediatek.com>
	 <5b0613b9cc983e24a997c122b2892b35cf8346d3.camel@mediatek.com>
	 <c3a2feae4295f3300f723a9bfd8cdf0b1c938c81.camel@mediatek.com>
	 <4bc40d79d6f6d3b2bf470a7c09375859a31b5e40.camel@mediatek.com>
	 <7713b73db7d0f2763661a7e328f4313bd72d497d.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_224946_237247_8C8AB399 
X-CRM114-Status: GOOD (  53.40  )
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

On Tue, 2022-06-28 at 11:23 +0800, CK Hu wrote:
> On Tue, 2022-06-28 at 11:01 +0800, Rex-BC Chen wrote:
> > On Tue, 2022-06-28 at 10:38 +0800, CK Hu wrote:
> > > On Tue, 2022-06-28 at 10:28 +0800, Rex-BC Chen wrote:
> > > > On Tue, 2022-06-28 at 10:15 +0800, CK Hu wrote:
> > > > > Hi, Bo-Chen:
> > > > > 
> > > > > On Fri, 2022-06-24 at 11:09 +0800, Bo-Chen Chen wrote:
> > > > > > Dp_intf supports YUV422 as output format. In MT8195 Chrome
> > > > > > project,
> > > > > > YUV422 output format is used for 4K resolution.
> > > > > > 
> > > > > > To support this, it is also needed to support color format
> > > > > > transfer.
> > > > > > Color format transfer is a new feature for both dpi and
> > > > > > dpintf
> > > > > > of
> > > > > > MT8195.
> > > > > > 
> > > > > > The input format could be RGB888 and output format for
> > > > > > dp_intf
> > > > > > should
> > > > > > be
> > > > > > YUV422. Therefore, we add a mtk_dpi_matrix_sel() helper to
> > > > > > update
> > > > > > the
> > > > > > DPI_MATRIX_SET register depending on the color format.
> > > > > > 
> > > > > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > > > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > > > > Reviewed-by: AngeloGioacchino Del Regno <
> > > > > > angelogioacchino.delregno@collabora.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/mediatek/mtk_dpi.c      | 34
> > > > > > ++++++++++++++++++++++++-
> > > > > >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  3 +++
> > > > > >  2 files changed, 36 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > index 9e4250356342..438bf3bc5e4a 100644
> > > > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > @@ -128,6 +128,7 @@ struct mtk_dpi_yc_limit {
> > > > > >   * @num_output_fmts: Quantity of supported output formats.
> > > > > >   * @is_ck_de_pol: Support CK/DE polarity.
> > > > > >   * @swap_input_support: Support input swap function.
> > > > > > + * @color_fmt_trans_support: Enable color format transfer.
> > > > > >   * @dimension_mask: Mask used for HWIDTH, HPORCH,
> > > > > > VSYNC_WIDTH
> > > > > > and
> > > > > > VSYNC_PORCH
> > > > > >   *		    (no shift).
> > > > > >   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
> > > > > > @@ -144,6 +145,7 @@ struct mtk_dpi_conf {
> > > > > >  	u32 num_output_fmts;
> > > > > >  	bool is_ck_de_pol;
> > > > > >  	bool swap_input_support;
> > > > > > +	bool color_fmt_trans_support;
> > > > > >  	u32 dimension_mask;
> > > > > >  	u32 hvsize_mask;
> > > > > >  	u32 channel_swap_shift;
> > > > > > @@ -412,6 +414,31 @@ static void
> > > > > > mtk_dpi_config_disable_edge(struct
> > > > > > mtk_dpi *dpi)
> > > > > >  		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0,
> > > > > > EDGE_SEL_EN);
> > > > > >  }
> > > > > >  
> > > > > > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi,
> > > > > > +			       enum mtk_dpi_out_color_format
> > > > > > format)
> > > > > > +{
> > > > > > +	u32 matrix_sel = 0;
> > > > > > +
> > > > > > +	if (!dpi->conf->color_fmt_trans_support) {
> > > > > > +		dev_info(dpi->dev, "matrix_sel is not
> > > > > > supported.\n");
> > > > > > +		return;
> > > > > > +	}
> > > > > > +
> > > > > > +	switch (format) {
> > > > > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > > > > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> > > > > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> > > > > > +	case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> > > > > 
> > > > > I think the transform formula are different for full range
> > > > > and
> > > > > non-
> > > > > full 
> > > > > range. Please make sure '0x2' is for full range or non-full
> > > > > range.
> > > > > If
> > > > > you are not sure, you could provide the transform matrix of
> > > > > '0x2'
> > > > > so
> > > > > we
> > > > > could find out it's full or non-full.
> > > > > 
> > > > > > +	case MTK_DPI_COLOR_FORMAT_XV_YCC:
> > > > > > +		if (dpi->mode.hdisplay <= 720)
> > > > > > +			matrix_sel = 0x2;
> > > > > 
> > > > > Symbolize '0x2'.
> > > > > 
> > > > > > +		break;
> > > > > > +	default:
> > > > > > +		break;
> > > > > > +	}
> > > > > > +	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel,
> > > > > > INT_MATRIX_SEL_MASK);
> > > > > > +}
> > > > > > +
> > > > > >  static void mtk_dpi_config_color_format(struct mtk_dpi
> > > > > > *dpi,
> > > > > >  					enum
> > > > > > mtk_dpi_out_color_format
> > > > > > format)
> > > > > >  {
> > > > > > @@ -419,6 +446,7 @@ static void
> > > > > > mtk_dpi_config_color_format(struct
> > > > > > mtk_dpi *dpi,
> > > > > >  	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> > > > > >  		mtk_dpi_config_yuv422_enable(dpi, false);
> > > > > >  		mtk_dpi_config_csc_enable(dpi, true);
> > > > > > +		mtk_dpi_matrix_sel(dpi, format);
> > > > > 
> > > > > Why mt8173 support MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL but it
> > > > > does
> > > > > not
> > > > > call mtk_dpi_matrix_sel()? It seems that mt8173 also need to
> > > > > call
> > > > > mtk_dpi_matrix_sel() but lost and this patch looks like a bug
> > > > > fix
> > > > > for
> > > > > all SoC DPI driver.
> > > > > 
> > > > > Regards,
> > > > > CK
> > > > > 
> > > > 
> > > > Hello CK,
> > > > 
> > > > MT8173 does not support MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL as
> > > > output
> > > > format, the output format is:
> > > > 
> > > > static const u32 mt8173_output_fmts[] = {
> > > > 	MEDIA_BUS_FMT_RGB888_1X24,
> > > > };
> > > > 
> > > > or do I misunderstand?
> > > 
> > > In the first patch [1], it define
> > > 
> > > +enum mtk_dpi_out_color_format {
> > > +	MTK_DPI_COLOR_FORMAT_RGB,
> > > +	MTK_DPI_COLOR_FORMAT_RGB_FULL,
> > > +	MTK_DPI_COLOR_FORMAT_YCBCR_444,
> > > +	MTK_DPI_COLOR_FORMAT_YCBCR_422,
> > > +	MTK_DPI_COLOR_FORMAT_XV_YCC,
> > > +	MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL,
> > > +	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> > > +};
> > > 
> > > and this function also process MTK_DPI_COLOR_FORMAT_YCBCR_444,
> > > MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL,
> > > MTK_DPI_COLOR_FORMAT_YCBCR_422,
> > > and MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL. So I think it want to
> > > process
> > > output YUV but the caller of mtk_dpi_config_color_format() just
> > > pass
> > > RGB into this function. If mt8173 does not support YUV output, I
> > > think
> > > you should remove YUV processing in this function first, and then
> > > add
> > > back YUV processing in this function.
> > > 
> > > [1] 
> > > 
> > 
> > 
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/mediatek/mtk_dpi.c?h=v5.19-rc4&id=9e629c17aa8d7a75b8c1d99ed42892cd8ba7cdc4
> > > 
> > > Regards,
> > > CK
> > > 
> > 
> > Hello CK,
> > 
> > I don't think it should be remove. After all, it is accepted and
> > from
> > [1], we can see it assgin output format always as RGB.
> > +	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > 
> > After that, it also added patch of supporting changing output
> > format[2].
> > 
> > We have support output as YUV422 now. I think it's ok to just add
> > this.
> > If we remove them and add them back, I think it is a little bit
> > redundant. And I also can add a commit message like "output format
> > YUV422 is not support for previous MediaTek SoCs. MT8195 supports
> > output format as YUV422.."
> > 
> > What do you think?
> 
> If we have no information about mt8173 support YUV or not, we could
> just treat it as not support YUV. I like to make things clean before
> apply new feature. If you do not want to remove it, I would send a
> patch to remove it.
> 
> Regards,
> CK
> 

Hello CK,

ok, I will confirm whether 8173 support yuv422 as output. If no
answerd, I will also remove them in next version of this series.

Thanks.

BRs,
Bo-Chen

> > 
> > [2]: 
> > 
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/mediatek/mtk_dpi.c?h=v5.19-rc4&id=be63f6e8601ff21139da93623754717e92cbd8db
> > 
> > BRs,
> > Bo-Chen
> > > > 
> > > > BRs,
> > > > Bo-Chen
> > > > 
> > > > > >  		if (dpi->conf->swap_input_support)
> > > > > >  			mtk_dpi_config_swap_input(dpi, false);
> > > > > >  		mtk_dpi_config_channel_swap(dpi,
> > > > > > MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> > > > > > @@ -426,6 +454,7 @@ static void
> > > > > > mtk_dpi_config_color_format(struct
> > > > > > mtk_dpi *dpi,
> > > > > >  		   (format ==
> > > > > > MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> > > > > >  		mtk_dpi_config_yuv422_enable(dpi, true);
> > > > > >  		mtk_dpi_config_csc_enable(dpi, true);
> > > > > > +		mtk_dpi_matrix_sel(dpi, format);
> > > > > >  		if (dpi->conf->swap_input_support)
> > > > > >  			mtk_dpi_config_swap_input(dpi, true);
> > > > > >  		else
> > > > > > @@ -673,7 +702,10 @@ static int
> > > > > > mtk_dpi_bridge_atomic_check(struct
> > > > > > drm_bridge *bridge,
> > > > > >  	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> > > > > >  	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> > > > > >  	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > > > > > -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > > > > +	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> > > > > > +		dpi->color_format =
> > > > > > MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
> > > > > > +	else
> > > > > > +		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > > > >  
> > > > > >  	return 0;
> > > > > >  }
> > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > > > > b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > > > > index 3a02fabe1662..cca0dccb84a2 100644
> > > > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > > > > > @@ -217,4 +217,7 @@
> > > > > >  
> > > > > >  #define EDGE_SEL_EN			BIT(5)
> > > > > >  #define H_FRE_2N			BIT(25)
> > > > > > +
> > > > > > +#define DPI_MATRIX_SET		0xB4
> > > > > > +#define INT_MATRIX_SEL_MASK		GENMASK(4, 0)
> > > > > >  #endif /* __MTK_DPI_REGS_H */
> > > > > 
> > > > > 
> > > > 
> > > > 
> > > 
> > > 
> > 
> > 
> 
> 


