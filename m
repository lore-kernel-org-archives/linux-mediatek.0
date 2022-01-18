Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5071C43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 02:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vye9V3aYnbaCQ6ZtyFJHotn+y1UvC2obdrHn/zmnDzk=; b=KpKe1aQyoN5eOM
	N92Ygw9tTRr3uPmc99Z+KCwY9qUuor/fayKpZre96H9+MD8dqsz9lkHnNjYlik6WorYmHJ/MkjIuD
	xqf1KDW79ic4vqvp9Gqd7Wxc5AzwonZzLnWKiVv3Yds0ubfzNz680GPRhwTmy447mOzX/Ew6jvvrN
	Ml68MnDAZSxLL+DSgrv06LZ3ZaVcR3VZS/JPyXetRV48iQ1v9JYAWxyoaCw7It1SE0GnedjC12XGE
	YFcQIlSnq6Iu+hE8NaLbBkjuYBx/GgnDP7WYjn9LLb29Kv5YhrRqG8LPX7fNkZhLWls52GTdqjGi2
	n2mMuDTUM1+SC+XBtM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9eSM-00H4RH-F4; Tue, 18 Jan 2022 02:42:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eFQ-00GxL8-T3; Tue, 18 Jan 2022 02:29:28 +0000
X-UUID: 90564539207a48758dc1cd33d7f1d520-20220117
X-UUID: 90564539207a48758dc1cd33d7f1d520-20220117
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1909828086; Mon, 17 Jan 2022 19:29:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 18:29:17 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 18 Jan 2022 10:29:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Jan 2022 10:29:15 +0800
Message-ID: <1bd816c2f26cd8e42debf066a57e24eb5e2f580d.camel@mediatek.com>
Subject: Re: [v9,2/3] drm/mediatek: implement the DSI hs packets aligned
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <narmstrong@baylibre.com>,
 <robert.foss@linaro.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <p.zabel@pengutronix.de>
CC: <xji@analogixsemi.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Date: Tue, 18 Jan 2022 10:29:15 +0800
In-Reply-To: <86b76e9f-96b0-7d54-bd38-449745e30aa2@intel.com>
References: <20220114092110.12137-1-rex-bc.chen@mediatek.com>
 <20220114092110.12137-3-rex-bc.chen@mediatek.com>
 <4076cb55-4546-6bbd-1a1f-19395dcd9ccd@collabora.com>
 <f858dd4aaa35fa3eb969baf887f038c3593232e5.camel@mediatek.com>
 <86b76e9f-96b0-7d54-bd38-449745e30aa2@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_182925_060270_2707B3DC 
X-CRM114-Status: GOOD (  30.36  )
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

Hello Andrzej,

Thanks for your review.
I will give the explanation for this in next version.

BRs,
Rex-BC hen

On Fri, 2022-01-14 at 12:11 +0100, Andrzej Hajda wrote:
> On 14.01.2022 11:20, Rex-BC Chen wrote:
> > Hello AngeloGioacchino,
> > 
> > Thanks for your review.
> > I will modify this in next version.
> > 
> > BRs,
> > Rex-BC Chen
> > 
> > On Fri, 2022-01-14 at 10:36 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 14/01/22 10:21, Rex-BC Chen ha scritto:
> > > > Some DSI RX devices require the packets on all lanes aligned at
> > > > the
> > > > end.
> > > > Otherwise, there will be some issues of shift or scroll for
> > > > screen.
> > > > 
> > > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > > 
> > > Hello,
> > > thanks for the patch! However, there's something to improve...
> > > 
> > > > ---
> > > >    drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++++
> > > >    1 file changed, 12 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > index 5d90d2eb0019..ccdda15f5a66 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > @@ -195,6 +195,8 @@ struct mtk_dsi {
> > > >    	struct clk *hs_clk;
> > > >    
> > > >    	u32 data_rate;
> > > > +	/* force dsi line end without dsi_null data */
> > > > +	bool hs_packet_end_aligned;
> > > 
> > > There's no need to introduce a new variable here...
> > > >    
> > > >    	unsigned long mode_flags;
> > > >    	enum mipi_dsi_pixel_format format;
> > > > @@ -500,6 +502,13 @@ static void
> > > > mtk_dsi_config_vdo_timing(struct
> > > > mtk_dsi *dsi)
> > > >    		DRM_WARN("HFP + HBP less than d-phy, FPS will
> > > > under
> > > > 60Hz\n");
> > > >    	}
> > > >    
> > > > +	if (dsi->hs_packet_end_aligned) {
> > > 
> > > You can simply check mode_flags here:
> > > 	if (dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) {
> > > 
> > > > +		horizontal_sync_active_byte =
> > > > roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
> > > > +		horizontal_frontporch_byte =
> > > > roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
> > > > +		horizontal_backporch_byte =
> > > > roundup(horizontal_backporch_byte, dsi->lanes) - 2;
> > > > +		horizontal_backporch_byte -= (vm->hactive *
> > > > dsi_tmp_buf_bpp + 2) % dsi->lanes;
> > > > +	}
> > > > +
> 
> 
> And if you could add comment explaining the magic here it would be
> nice.
> 
> 
> Regards
> 
> Andrzej
> 
> 
> > > >    	writel(horizontal_sync_active_byte, dsi->regs +
> > > > DSI_HSA_WC);
> > > >    	writel(horizontal_backporch_byte, dsi->regs +
> > > > DSI_HBP_WC);
> > > >    	writel(horizontal_frontporch_byte, dsi->regs +
> > > > DSI_HFP_WC);
> > > > @@ -794,6 +803,9 @@ static int mtk_dsi_host_attach(struct
> > > > mipi_dsi_host *host,
> > > >    	dsi->lanes = device->lanes;
> > > >    	dsi->format = device->format;
> > > >    	dsi->mode_flags = device->mode_flags;
> > > > +	dsi->hs_packet_end_aligned = (dsi->mode_flags &
> > > > +				      MIPI_DSI_HS_PKT_END_ALIGN
> > > > ED)
> > > > +				     ? true : false;
> > > 
> > > ...so there's no need for this one, either.
> > > 
> > > >    
> > > >    	return 0;
> > > >    }
> > > > 
> > > 
> > > Regards,
> > > - Angelo
> > > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
