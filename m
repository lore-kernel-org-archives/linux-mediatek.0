Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE98C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 02:30:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0E66143B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 02:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E0E66143B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gNNSqMy9k7qcLuhdY464sgWRH4ibUUysEDK8kiTTm8U=; b=BQ6+W/WCeafNNajRsDMClbZmS
	UeaVfBlisRt0IgVDl4A1MZQC4R7F18h1m+lY50ba1kJNuPqn1PLETda3WRbx6OKfKkJuvun34edpo
	4qgYfUOwmdTEHLLGorJLKw1ZOV0hQ0fot+6cpPbFWf5wbvWYXO/ZTOPkwxKyoE3Ut0uRCeFnEhbZn
	q+v7Grg1lA5PNmOfUD81LXyx/LgUN5qvG9x72WoCJLHQ8WlMBqMJRDOM58wtM5zPmDsKTY4mzWwFv
	jfa4PiEuGKakh+2IFqvihJVBhnM16/Y7FmZMGLoDzhAHRTWe+UilbG1A1LjcG0A1KAef1VphMoz22
	g6ZIgHKnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbwRt-004he4-Em; Thu, 29 Apr 2021 02:30:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbwRm-004hdf-K2; Thu, 29 Apr 2021 02:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=IFKU/kY+Iz71dYHWbp+IKuai8Hjys0hPeC1ISbmm4Wc=; b=P1W+JHtjFKCt7UhCnrVQNz09dT
 2yYq7cOuCGeYPWUna9vv2BeAxh+Y5CP2KmVZhXiFvgA22RlDb4o8lhgIllOAYFus2EBBgC26pnE4b
 zcDWeSqYz/aipEbhmI9AUUBTvGr4Bmg/wJLn2SNXnI0Sj2EKQwHSKqG4Ew/DZcPZE8HekkihdOxv1
 x/35tL9vPyOEb+tAkDbevYR6DzEJY85uiGk144sL327YfVjmarUhxbxvHMir9zDBtZigSUtdWsK3c
 oZteip8EqFbRP2FZzqpyf0OVIFFaRyV561RQUs1O14zTA41AFertN+lMhq20VB0Q+PjQjQdJBvp/A
 l+8g+6hA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbwRh-000KCM-O5; Thu, 29 Apr 2021 02:30:31 +0000
X-UUID: a9dfca5224014d8bbad9ec82b848fb21-20210428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IFKU/kY+Iz71dYHWbp+IKuai8Hjys0hPeC1ISbmm4Wc=; 
 b=Yd9BYcWc6Rdl9Kgxxa5eTKYHUAZV8Pov4YAp8NnZ08Cwg1dgyK5LC3ma2awKNe30xq1KK90L/g8z6SMKWCxCLq7IlUAMtYb2I5aMZcWaTTpHAIxj7Ww2pjv9ctvKqoqVyRUWBCr5BR+6MGKduG8nIRIEYq8UqzQ4wx8YdvcIbb4=;
X-UUID: a9dfca5224014d8bbad9ec82b848fb21-20210428
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1598892080; Wed, 28 Apr 2021 19:28:02 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 19:28:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Apr 2021 10:27:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Apr 2021 10:27:58 +0800
Message-ID: <737326fb9699de6dcff3e655e8a1127a137f4750.camel@mediatek.com>
Subject: Re: [SPAM]Re: [SPAM][v2,PATCH 3/3] drm/mediatek: dpi: add bus
 format negotiation
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Date: Thu, 29 Apr 2021 10:27:58 +0800
In-Reply-To: <1618907471.11505.2.camel@mtksdaap41>
References: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
 <1618407316-10042-4-git-send-email-rex-bc.chen@mediatek.com>
 <1618448968.29238.1.camel@mtksdaap41> <1618467298.4349.3.camel@mtksdccf07>
 <1618907471.11505.2.camel@mtksdaap41>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_193029_813096_DF0590B8 
X-CRM114-Status: GOOD (  28.40  )
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

On Tue, 2021-04-20 at 16:31 +0800, CK Hu wrote:
> Hi, Rex:
> 
> On Thu, 2021-04-15 at 14:14 +0800, Rex-BC Chen wrote:
> > On Thu, 2021-04-15 at 09:09 +0800, CK Hu wrote:
> > Hello CK,
> > > Hi, Rex:
> > > 
> > > On Wed, 2021-04-14 at 21:35 +0800, Rex-BC Chen wrote:
> > > > Add the atomic_get_output_bus_fmts, atomic_get_input_bus_fmts
> > > > to negotiate
> > > > the possible output and input formats for the current mode and
> > > > monitor,
> > > > and use the negotiated formats in a basic atomic_check
> > > > callback.
> > > > 
> > > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > > > ---
> > > >  drivers/gpu/drm/mediatek/mtk_dpi.c | 89
> > > > ++++++++++++++++++++++++++++--
> > > >  1 file changed, 84 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > index 76431fe849b8..b4e9c6c8d706 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > @@ -536,6 +536,87 @@ static int mtk_dpi_set_display_mode(struct
> > > > mtk_dpi *dpi,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +#define MAX_OUTPUT_SEL_FORMATS	2
> > > > +
> > > > +static u32 *mtk_dpi_bridge_atomic_get_output_bus_fmts(struct
> > > > drm_bridge *bridge,
> > > > +					struct drm_bridge_state
> > > > *bridge_state,
> > > > +					struct drm_crtc_state
> > > > *crtc_state,
> > > > +					struct
> > > > drm_connector_state *conn_state,
> > > > +					unsigned int
> > > > *num_output_fmts)
> > > > +{
> > > > +	struct drm_display_mode *mode = &crtc_state->mode;
> > > > +	u32 *output_fmts;
> > > > +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
> > > > +
> > > > +	*num_output_fmts = 0;
> > > > +
> > > > +	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS,
> > > > sizeof(*output_fmts),
> > > > +			      GFP_KERNEL);
> > > > +	if (!output_fmts)
> > > > +		return NULL;
> > > > +
> > > > +	/* Default 8bit RGB fallback */
> > > > +	if (dpi->conf->dual_edge) {
> > > > +		output_fmts[0] =  MEDIA_BUS_FMT_RGB888_2X12_LE;
> > > > +		output_fmts[1] =  MEDIA_BUS_FMT_RGB888_2X12_BE;
> > > 
> > > MT8183 does not support MEDIA_BUS_FMT_RGB888_1X24?
> > > 
> > > Regards,
> > > CK
> > > 
> > 
> > Yes, MT8183 only support MEDIA_BUS_FMT_RGB888_1X24
> 
> I'm confused with this answer. dpi->conf->dual_edge is true only in
> mt8183, but you say 'MT8183 only support MEDIA_BUS_FMT_RGB888_1X24',
> your answer looks conflict with these code.
> 
> Regards,
> CK
> 
Hello CK,

Sorry for my typo.

Input format for DPI in MT8183 only supports MEDIA_BUS_FMT_RGB888_1X24.
Output format for DPI in MT8183 only supports
MEDIA_BUS_FMT_RGB888_2x12.

dpi->conf->dual_edge means output format.
So MT8183 only support
MEDIA_BUS_FMT_RGB888_2x12.

BRs,
Rex-BC
> > 
> > BRs,
> > Rex-BC
> > > > +		*num_output_fmts = 2;
> > > > +	} else {
> > > > +		output_fmts[0] =  MEDIA_BUS_FMT_RGB888_1X24;
> > > > +		*num_output_fmts = 1;
> > > > +	}
> > > > +
> > > > +	return output_fmts;
> > > > +}
> > > > +
> > > > +#define MAX_INPUT_SEL_FORMATS	1
> > > > +
> > > > +static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct
> > > > drm_bridge *bridge,
> > > > +					struct drm_bridge_state
> > > > *bridge_state,
> > > > +					struct drm_crtc_state
> > > > *crtc_state,
> > > > +					struct
> > > > drm_connector_state *conn_state,
> > > > +					u32 output_fmt,
> > > > +					unsigned int
> > > > *num_input_fmts)
> > > > +{
> > > > +	u32 *input_fmts;
> > > > +
> > > > +	*num_input_fmts = 0;
> > > > +
> > > > +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS,
> > > > sizeof(*input_fmts),
> > > > +			     GFP_KERNEL);
> > > > +	if (!input_fmts)
> > > > +		return NULL;
> > > > +
> > > > +	*num_input_fmts = 1;
> > > > +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > > > +
> > > > +	return input_fmts;
> > > > +}
> > > > +
> > > > +static int mtk_dpi_bridge_atomic_check(struct drm_bridge
> > > > *bridge,
> > > > +				       struct drm_bridge_state
> > > > *bridge_state,
> > > > +				       struct drm_crtc_state
> > > > *crtc_state,
> > > > +				       struct
> > > > drm_connector_state *conn_state)
> > > > +{
> > > > +	struct mtk_dpi *dpi = bridge->driver_private;
> > > > +	unsigned int out_bus_format;
> > > > +
> > > > +	out_bus_format = bridge_state->output_bus_cfg.format;
> > > > +
> > > > +	dev_dbg(dpi->dev, "input format 0x%04x, output format
> > > > 0x%04x\n",
> > > > +		bridge_state->input_bus_cfg.format,
> > > > +		bridge_state->output_bus_cfg.format);
> > > > +
> > > > +	dpi->ddr_edge_sel = (out_bus_format ==
> > > > MEDIA_BUS_FMT_RGB888_2X12_LE) ?
> > > > +		 		true : false;
> > > > +
> > > > +	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> > > > +	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> > > > +	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > > > +	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
> > > >  				 enum drm_bridge_attach_flags
> > > > flags)
> > > >  {
> > > > @@ -574,6 +655,9 @@ static const struct drm_bridge_funcs
> > > > mtk_dpi_bridge_funcs = {
> > > >  	.mode_set = mtk_dpi_bridge_mode_set,
> > > >  	.disable = mtk_dpi_bridge_disable,
> > > >  	.enable = mtk_dpi_bridge_enable,
> > > > +	.atomic_check = mtk_dpi_bridge_atomic_check,
> > > > +	.atomic_get_output_bus_fmts =
> > > > mtk_dpi_bridge_atomic_get_output_bus_fmts,
> > > > +	.atomic_get_input_bus_fmts =
> > > > mtk_dpi_bridge_atomic_get_input_bus_fmts,
> > > >  };
> > > >  
> > > >  void mtk_dpi_start(struct device *dev)
> > > > @@ -620,11 +704,6 @@ static int mtk_dpi_bind(struct device
> > > > *dev, struct device *master, void *data)
> > > >  	}
> > > >  	drm_connector_attach_encoder(dpi->connector, &dpi-
> > > > >encoder);
> > > >  
> > > > -	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> > > > -	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> > > > -	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > > > -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > > -
> > > >  	return 0;
> > > >  
> > > >  err_cleanup:
> > > 
> > > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!wSbSRrRV87zBpi29W3qMJC0hPE5QwMj2oVUgPcq4538Poo-n0KFyM14woxJZbA$
> >  
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
