Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96BFC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 10:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1B7N8E+0eGTaL6NsLTtboiYzmwYQ5sl6TDnoFgodKU=; b=aL2kyeNsPXcMgBzfcipTjuEQ+w
	GGfjNO1cysN+/+vYxdmoKmAZMSvJQc++eJ7JHdKfDXUEhlsEm+8AkRjgBPtgNkIm9kRjaQWcaUmaY
	ozi0UVKMTl+N7N0tjTBTFBugX53BnIQFw3OggEbCqMSHCIabt80cNIhtCb/VoSIv5joaKfIFbbi/A
	1DZo26ZLPITSeTwTg5vqj8qt+55kB/Hxs/3n3Go1JfRGDj1Uk4LkhRsKY3ataRV1bihqC1AvthZEk
	3seRA3JxpE7jnS4CzdxLb5dss2qcWsqP5bh/lewAUroFZmCI1A5K1fbpg1W5NNYe2c5ZLP/13GA6H
	/nUUYsfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1mmv-001ssM-AI; Thu, 16 Jun 2022 10:31:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1mms-001srB-4b; Thu, 16 Jun 2022 10:31:43 +0000
X-UUID: 2d4a7f43f048423fa4c49b36ef4f83aa-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:6da974fc-3389-4047-8914-0a2bf87c0819,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:2521bf48-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 2d4a7f43f048423fa4c49b36ef4f83aa-20220616
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 731086252; Thu, 16 Jun 2022 03:31:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 03:31:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 16 Jun 2022 18:31:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 16 Jun 2022 18:31:34 +0800
Message-ID: <941ba5399e3cc9b25474d76d15d2bb5bafaa14b1.camel@mediatek.com>
Subject: Re: [PATCH v11 02/12] drm/mediatek: dpi: move dpi limits to SoC
 config
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
Date: Thu, 16 Jun 2022 18:31:34 +0800
In-Reply-To: <5de2752a1d496290ea5c2c2d7840ba984b2e7e4d.camel@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
	 <20220613064841.10481-3-rex-bc.chen@mediatek.com>
	 <5de2752a1d496290ea5c2c2d7840ba984b2e7e4d.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_033142_232667_1FC9E9A2 
X-CRM114-Status: GOOD (  23.26  )
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

On Tue, 2022-06-14 at 11:21 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-13 at 14:48 +0800, Bo-Chen Chen wrote:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > Add flexibility by moving the dpi limits to the SoC specific
> > config.
> 
> What does this 'limit' mean? Why it's different in DPI vs DP_INTF?
> 
> The hardware design is so weird. If the limit is fixed for DPI and
> DP_INTF, why the hardware export register for software to assign any
> value which may be wrong.
> 
> Regards,
> CK
> 

Hello CK,

For RGB colorimetry, CTA-861 support both limited and full range data
when receiving video with RGB color space.

I will use drm_default_rgb_quant_range() to determine this and drop
const struct mtk_dpi_yc_limit *limit;

BRs,
Bo-Chen
> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index e61cd67b978f..ce8c5eefe5f1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -125,6 +125,7 @@ struct mtk_dpi_conf {
> >  	bool edge_sel_en;
> >  	const u32 *output_fmts;
> >  	u32 num_output_fmts;
> > +	const struct mtk_dpi_yc_limit *limit;
> >  };
> >  
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> > u32 mask)
> > @@ -235,9 +236,10 @@ static void mtk_dpi_config_fb_size(struct
> > mtk_dpi *dpi, u32 width, u32 height)
> >  	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
> >  }
> >  
> > -static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi,
> > -					 struct mtk_dpi_yc_limit
> > *limit)
> > +static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
> >  {
> > +	const struct mtk_dpi_yc_limit *limit = dpi->conf->limit;
> > +
> >  	mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_bottom << Y_LIMINT_BOT,
> >  		     Y_LIMINT_BOT_MASK);
> >  	mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_top << Y_LIMINT_TOP,
> > @@ -449,7 +451,6 @@ static int mtk_dpi_power_on(struct mtk_dpi
> > *dpi)
> >  static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >  				    struct drm_display_mode *mode)
> >  {
> > -	struct mtk_dpi_yc_limit limit;
> >  	struct mtk_dpi_polarities dpi_pol;
> >  	struct mtk_dpi_sync_param hsync;
> >  	struct mtk_dpi_sync_param vsync_lodd = { 0 };
> > @@ -484,11 +485,6 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >  	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
> >  		pll_rate, vm.pixelclock);
> >  
> > -	limit.c_bottom = 0x0010;
> > -	limit.c_top = 0x0FE0;
> > -	limit.y_bottom = 0x0010;
> > -	limit.y_top = 0x0FE0;
> > -
> >  	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
> >  	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
> >  	dpi_pol.hsync_pol = vm.flags & DISPLAY_FLAGS_HSYNC_HIGH ?
> > @@ -536,7 +532,7 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >  	else
> >  		mtk_dpi_config_fb_size(dpi, vm.hactive, vm.vactive);
> >  
> > -	mtk_dpi_config_channel_limit(dpi, &limit);
> > +	mtk_dpi_config_channel_limit(dpi);
> >  	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
> >  	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
> >  	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> > @@ -790,12 +786,20 @@ static const u32 mt8183_output_fmts[] = {
> >  	MEDIA_BUS_FMT_RGB888_2X12_BE,
> >  };
> >  
> > +static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
> > +	.c_bottom = 0x0010,
> > +	.c_top = 0x0FE0,
> > +	.y_bottom = 0x0010,
> > +	.y_top = 0x0FE0,
> > +};
> > +
> >  static const struct mtk_dpi_conf mt8173_conf = {
> >  	.cal_factor = mt8173_calculate_factor,
> >  	.reg_h_fre_con = 0xe0,
> >  	.max_clock_khz = 300000,
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +	.limit = &mtk_dpi_limit,
> >  };
> >  
> >  static const struct mtk_dpi_conf mt2701_conf = {
> > @@ -805,6 +809,7 @@ static const struct mtk_dpi_conf mt2701_conf =
> > {
> >  	.max_clock_khz = 150000,
> >  	.output_fmts = mt8173_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +	.limit = &mtk_dpi_limit,
> >  };
> >  
> >  static const struct mtk_dpi_conf mt8183_conf = {
> > @@ -813,6 +818,7 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.max_clock_khz = 100000,
> >  	.output_fmts = mt8183_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> > +	.limit = &mtk_dpi_limit,
> >  };
> >  
> >  static const struct mtk_dpi_conf mt8192_conf = {
> > @@ -821,6 +827,7 @@ static const struct mtk_dpi_conf mt8192_conf =
> > {
> >  	.max_clock_khz = 150000,
> >  	.output_fmts = mt8183_output_fmts,
> >  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> > +	.limit = &mtk_dpi_limit,
> >  };
> >  
> >  static int mtk_dpi_probe(struct platform_device *pdev)
> 
> 


