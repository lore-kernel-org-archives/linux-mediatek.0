Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4930FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+A9xYZuHWSpkAijJ6U6yO9XuxDbIIopmU8x6/eTJ7s=; b=ts4F6+NH4A70go
	g67hke3eEMpA1sK8mO8ReAqEQd43s0zqZhDomd15wBOdOn1j0Bj36TRAF1Ew51uGsJcWb9EP+kpck
	DgOhmgRH+7fcSYieAdDoQg9HNWk+gP4+7Z3ITmVwLYXsZTNtmEOVR+b9AoijY7/sLcXG0IKKjrmqj
	lymvAIbZ48ngrWK0Ytc/AL000u/aSjdV58IRAEg1oPlhcGN8NZUhx9wiCor5hFdi8puEssu1n3H5L
	hXSm32lB8XSOyLGBvSwDfAw9Rl9buVn5eeAXbJHGo0i0m86jTaoP08848DW9J5IlrsMRxKml+EhP4
	KA38cui1hCARoUJ3Gh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Jib-008gnU-6a; Fri, 14 Jan 2022 10:22:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8JiG-008ghl-8v; Fri, 14 Jan 2022 10:21:41 +0000
X-UUID: 72ca01a2257b46498546721bafbdcfc1-20220114
X-UUID: 72ca01a2257b46498546721bafbdcfc1-20220114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1246246445; Fri, 14 Jan 2022 03:21:38 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 02:20:14 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 18:20:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 18:20:12 +0800
Message-ID: <f858dd4aaa35fa3eb969baf887f038c3593232e5.camel@mediatek.com>
Subject: Re: [v9,2/3] drm/mediatek: implement the DSI hs packets aligned
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <narmstrong@baylibre.com>, <robert.foss@linaro.org>,
 <andrzej.hajda@intel.com>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <p.zabel@pengutronix.de>
CC: <xji@analogixsemi.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Date: Fri, 14 Jan 2022 18:20:12 +0800
In-Reply-To: <4076cb55-4546-6bbd-1a1f-19395dcd9ccd@collabora.com>
References: <20220114092110.12137-1-rex-bc.chen@mediatek.com>
 <20220114092110.12137-3-rex-bc.chen@mediatek.com>
 <4076cb55-4546-6bbd-1a1f-19395dcd9ccd@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_022140_371231_0B421F22 
X-CRM114-Status: GOOD (  22.48  )
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

Hello AngeloGioacchino,

Thanks for your review.
I will modify this in next version.

BRs,
Rex-BC Chen

On Fri, 2022-01-14 at 10:36 +0100, AngeloGioacchino Del Regno wrote:
> Il 14/01/22 10:21, Rex-BC Chen ha scritto:
> > Some DSI RX devices require the packets on all lanes aligned at the
> > end.
> > Otherwise, there will be some issues of shift or scroll for screen.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Hello,
> thanks for the patch! However, there's something to improve...
> 
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 5d90d2eb0019..ccdda15f5a66 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -195,6 +195,8 @@ struct mtk_dsi {
> >   	struct clk *hs_clk;
> >   
> >   	u32 data_rate;
> > +	/* force dsi line end without dsi_null data */
> > +	bool hs_packet_end_aligned;
> 
> There's no need to introduce a new variable here...
> >   
> >   	unsigned long mode_flags;
> >   	enum mipi_dsi_pixel_format format;
> > @@ -500,6 +502,13 @@ static void mtk_dsi_config_vdo_timing(struct
> > mtk_dsi *dsi)
> >   		DRM_WARN("HFP + HBP less than d-phy, FPS will under
> > 60Hz\n");
> >   	}
> >   
> > +	if (dsi->hs_packet_end_aligned) {
> 
> You can simply check mode_flags here:
> 	if (dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) {
> 
> > +		horizontal_sync_active_byte =
> > roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
> > +		horizontal_frontporch_byte =
> > roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
> > +		horizontal_backporch_byte =
> > roundup(horizontal_backporch_byte, dsi->lanes) - 2;
> > +		horizontal_backporch_byte -= (vm->hactive *
> > dsi_tmp_buf_bpp + 2) % dsi->lanes;
> > +	}
> > +
> >   	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
> >   	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
> >   	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
> > @@ -794,6 +803,9 @@ static int mtk_dsi_host_attach(struct
> > mipi_dsi_host *host,
> >   	dsi->lanes = device->lanes;
> >   	dsi->format = device->format;
> >   	dsi->mode_flags = device->mode_flags;
> > +	dsi->hs_packet_end_aligned = (dsi->mode_flags &
> > +				      MIPI_DSI_HS_PKT_END_ALIGNED)
> > +				     ? true : false;
> 
> ...so there's no need for this one, either.
> 
> >   
> >   	return 0;
> >   }
> > 
> 
> Regards,
> - Angelo
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
