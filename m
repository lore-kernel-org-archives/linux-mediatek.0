Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E095C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 08:37:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8DB60FE3
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 08:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D8DB60FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RI/8Ulj614cq7MMa1QwD99WiBI5Ez+7bNJXgF5GkOzw=; b=dAKi/dl6dyrQwbnhEy4PklV9M
	7fnGp4qvNTrJZaq1Ed9YUXql2Kc1lMhEiog7zSRkQRrhyVBPdLvAVpRxXevMOt03vEaXBII36kXr8
	RPIR59++zq0EZaJhOhzO/MLrWd4yzDGN2L/6lyGXSzlPIttzdFmbYtG3kQ4xKDLoIwTOdCNHg9UuU
	9rZftcnuqiIU8pBiG7hCPSgktLIZ17ibSI9/gRd4j15hkpRELDMJVSJ18mf382Ei+NtrEmzUbZ2bi
	YndAHjWTzakgv3wDxl5sUMyPzGS6UY6eK+83CG9tpfBqZFD+X5z+7BkJkT8iRP/JLjloCaX7vspFu
	eJMZKZdQg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYlsG-00BbEf-P5; Tue, 20 Apr 2021 08:36:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYlsD-00BbD3-Rw; Tue, 20 Apr 2021 08:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=bEi19MMWdiYxkcCE7//Lg6WJ3XtDQ/8uQ8YN722hzQA=; b=AOGH9vntv+Ucf6uGQua3N5iznR
 twZ+C7tZoeHVNPFmHWxG8BVneAK5tuvA0tyxbpavMpxFaDBkQHDu1gmhC3POyVXb2iWh9kOKSfKwh
 DJRzh3UrUYeL+808M6lvliH6gLGhoRf09o2mJXzijeiCVa1TMMEPBGFJ6uvr+dP8UpWsODs2R1o/Y
 G7FzT1+Ey3Zod+cT3Jw0z/MFETdr+UCCVJ/UIXOQMNsccX4cSb9I3H2jXp3i72uuDRHl7/eJjYfll
 0GY9ncQvYnHZ2yfOlQ1TDc04eHJJ74TuHr9wBZ5oOCEFAR4kRQeJXAixRRFRSOLLWJipe9h6PJWHp
 jBFCsDUQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYls8-00Bve7-IZ; Tue, 20 Apr 2021 08:36:44 +0000
X-UUID: 4f0ef86dcddc480eb4fd09a4d05c32dd-20210420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bEi19MMWdiYxkcCE7//Lg6WJ3XtDQ/8uQ8YN722hzQA=; 
 b=QaozOP3/DYysLOyDvpiNswGue7yA4razgWVGfHTXpHw22xBixbxJs9r8V2a6Wjbbs5zLAQTXdo2nLcf5EGp8muat39iAFagmUA8dW8qrJcChM9W0CkL3OtTCuxfgWqj2zRurVW7lN5a6dKCPX7mHZ7Cfzo81wItFie7SszUovB4=;
X-UUID: 4f0ef86dcddc480eb4fd09a4d05c32dd-20210420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 803854235; Tue, 20 Apr 2021 01:36:34 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Apr 2021 01:31:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Apr 2021 16:31:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Apr 2021 16:31:11 +0800
Message-ID: <1618907471.11505.2.camel@mtksdaap41>
Subject: Re: [SPAM]Re: [SPAM][v2,PATCH 3/3] drm/mediatek: dpi: add bus
 format negotiation
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Date: Tue, 20 Apr 2021 16:31:11 +0800
In-Reply-To: <1618467298.4349.3.camel@mtksdccf07>
References: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
 <1618407316-10042-4-git-send-email-rex-bc.chen@mediatek.com>
 <1618448968.29238.1.camel@mtksdaap41> <1618467298.4349.3.camel@mtksdccf07>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_013640_643624_9972FF66 
X-CRM114-Status: GOOD (  24.83  )
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

Hi, Rex:

On Thu, 2021-04-15 at 14:14 +0800, Rex-BC Chen wrote:
> On Thu, 2021-04-15 at 09:09 +0800, CK Hu wrote:
> Hello CK,
> > Hi, Rex:
> > 
> > On Wed, 2021-04-14 at 21:35 +0800, Rex-BC Chen wrote:
> > > Add the atomic_get_output_bus_fmts, atomic_get_input_bus_fmts to negotiate
> > > the possible output and input formats for the current mode and monitor,
> > > and use the negotiated formats in a basic atomic_check callback.
> > > 
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_dpi.c | 89 ++++++++++++++++++++++++++++--
> > >  1 file changed, 84 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > index 76431fe849b8..b4e9c6c8d706 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > @@ -536,6 +536,87 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> > >  	return 0;
> > >  }
> > >  
> > > +#define MAX_OUTPUT_SEL_FORMATS	2
> > > +
> > > +static u32 *mtk_dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> > > +					struct drm_bridge_state *bridge_state,
> > > +					struct drm_crtc_state *crtc_state,
> > > +					struct drm_connector_state *conn_state,
> > > +					unsigned int *num_output_fmts)
> > > +{
> > > +	struct drm_display_mode *mode = &crtc_state->mode;
> > > +	u32 *output_fmts;
> > > +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
> > > +
> > > +	*num_output_fmts = 0;
> > > +
> > > +	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
> > > +			      GFP_KERNEL);
> > > +	if (!output_fmts)
> > > +		return NULL;
> > > +
> > > +	/* Default 8bit RGB fallback */
> > > +	if (dpi->conf->dual_edge) {
> > > +		output_fmts[0] =  MEDIA_BUS_FMT_RGB888_2X12_LE;
> > > +		output_fmts[1] =  MEDIA_BUS_FMT_RGB888_2X12_BE;
> > 
> > MT8183 does not support MEDIA_BUS_FMT_RGB888_1X24?
> > 
> > Regards,
> > CK
> > 
> Yes, MT8183 only support MEDIA_BUS_FMT_RGB888_1X24

I'm confused with this answer. dpi->conf->dual_edge is true only in
mt8183, but you say 'MT8183 only support MEDIA_BUS_FMT_RGB888_1X24',
your answer looks conflict with these code.

Regards,
CK

> 
> BRs,
> Rex-BC
> > > +		*num_output_fmts = 2;
> > > +	} else {
> > > +		output_fmts[0] =  MEDIA_BUS_FMT_RGB888_1X24;
> > > +		*num_output_fmts = 1;
> > > +	}
> > > +
> > > +	return output_fmts;
> > > +}
> > > +
> > > +#define MAX_INPUT_SEL_FORMATS	1
> > > +
> > > +static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > > +					struct drm_bridge_state *bridge_state,
> > > +					struct drm_crtc_state *crtc_state,
> > > +					struct drm_connector_state *conn_state,
> > > +					u32 output_fmt,
> > > +					unsigned int *num_input_fmts)
> > > +{
> > > +	u32 *input_fmts;
> > > +
> > > +	*num_input_fmts = 0;
> > > +
> > > +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> > > +			     GFP_KERNEL);
> > > +	if (!input_fmts)
> > > +		return NULL;
> > > +
> > > +	*num_input_fmts = 1;
> > > +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > > +
> > > +	return input_fmts;
> > > +}
> > > +
> > > +static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
> > > +				       struct drm_bridge_state *bridge_state,
> > > +				       struct drm_crtc_state *crtc_state,
> > > +				       struct drm_connector_state *conn_state)
> > > +{
> > > +	struct mtk_dpi *dpi = bridge->driver_private;
> > > +	unsigned int out_bus_format;
> > > +
> > > +	out_bus_format = bridge_state->output_bus_cfg.format;
> > > +
> > > +	dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> > > +		bridge_state->input_bus_cfg.format,
> > > +		bridge_state->output_bus_cfg.format);
> > > +
> > > +	dpi->ddr_edge_sel = (out_bus_format == MEDIA_BUS_FMT_RGB888_2X12_LE) ?
> > > +		 		true : false;
> > > +
> > > +	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> > > +	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> > > +	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > > +	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
> > >  				 enum drm_bridge_attach_flags flags)
> > >  {
> > > @@ -574,6 +655,9 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
> > >  	.mode_set = mtk_dpi_bridge_mode_set,
> > >  	.disable = mtk_dpi_bridge_disable,
> > >  	.enable = mtk_dpi_bridge_enable,
> > > +	.atomic_check = mtk_dpi_bridge_atomic_check,
> > > +	.atomic_get_output_bus_fmts = mtk_dpi_bridge_atomic_get_output_bus_fmts,
> > > +	.atomic_get_input_bus_fmts = mtk_dpi_bridge_atomic_get_input_bus_fmts,
> > >  };
> > >  
> > >  void mtk_dpi_start(struct device *dev)
> > > @@ -620,11 +704,6 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
> > >  	}
> > >  	drm_connector_attach_encoder(dpi->connector, &dpi->encoder);
> > >  
> > > -	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> > > -	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> > > -	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > > -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > -
> > >  	return 0;
> > >  
> > >  err_cleanup:
> > 
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!wSbSRrRV87zBpi29W3qMJC0hPE5QwMj2oVUgPcq4538Poo-n0KFyM14woxJZbA$ 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
