Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417BFC2D0DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 05:44:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D87206E6
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 05:44:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZGxYmM+V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BwOVawKJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11D87206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgislhgX5FaVllbVOjcCNPtv+Z+f1abYlF58i7+wnvA=; b=ZGxYmM+Vll4DsQ
	KVh8SE9dC2GgwfNO9gYS9vYOXZxQ3ApMEubE8qm/Q8y7+JlMTdKO6PZ2bTFlEkuepvOEUammRw9o6
	auQKINcehls+kTavZblA5bwpepnyGDLz7X7gmwQqS+4/iUWYbUPkTCcbPsVMWUn6SUn+lVOiSZxDS
	eKit+hOpwouySmZylEzWyUS1D80iyVu5VyVQrY6l7tud2pm8D5wubq5En3Sd8wqPHL5epse1Gwt+N
	PzE6WIsspFi2u/uNkFIAyMHLpIRG/LlIs7/sXIKLwB1adYO60z+u3F1UwjfbJrl6rb8LQ/HhYab9E
	PbVRveBrro+VA1eqXdvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imtHc-0007jS-VW; Thu, 02 Jan 2020 05:44:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imtHS-0007a5-Sr; Thu, 02 Jan 2020 05:44:24 +0000
X-UUID: cc5db3a269df453db28b256d03004054-20200101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=vyS7IWI4BRwbY7rXWub/fMYSKrH1gB0wk72YU/M9xPs=; 
 b=BwOVawKJjLDFPQgtOkgL/FOx+/WcyOn05f6M9bRIG9sdJ+CJLapfPiCbcvWMg8G+xgeSBHX0gszHgNsKZ3mGsR0oKKTHYk+AWP3DzXRvBsjd4QXnMd35Nw2XrJW9a3AETxJuYJsr1mvMtMG+h7N6o/r+fiR8b1fWEfcfSeKQ8SI=;
X-UUID: cc5db3a269df453db28b256d03004054-20200101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 382314809; Wed, 01 Jan 2020 21:44:19 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Jan 2020 21:44:38 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 2 Jan 2020 13:43:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 13:44:40 +0800
Message-ID: <1577943764.15116.3.camel@mhfsdcap03>
Subject: Re: [PATCH v6, 13/14] drm/mediatek: add fifo_size into rdma private
 data
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 2 Jan 2020 13:42:44 +0800
In-Reply-To: <1577942440.24650.5.camel@mtksdaap41>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
 <1577937624-14313-14-git-send-email-yongqiang.niu@mediatek.com>
 <1577942440.24650.5.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_214422_940233_85F990E5 
X-CRM114-Status: GOOD (  18.23  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-01-02 at 13:20 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Thu, 2020-01-02 at 12:00 +0800, Yongqiang Niu wrote:
> > the fifo size of rdma in mt8183 is different.
> > rdma0 fifo size is 5k
> > rdma1 fifo size is 2k
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > index 405afef..691480b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > @@ -62,6 +62,7 @@ struct mtk_disp_rdma {
> >  	struct mtk_ddp_comp		ddp_comp;
> >  	struct drm_crtc			*crtc;
> >  	const struct mtk_disp_rdma_data	*data;
> > +	u32				fifo_size;
> >  };
> >  
> >  static inline struct mtk_disp_rdma *comp_to_rdma(struct mtk_ddp_comp *comp)
> > @@ -130,10 +131,16 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
> >  	unsigned int threshold;
> >  	unsigned int reg;
> >  	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
> > +	u32 rdma_fifo_size;
> >  
> >  	rdma_update_bits(comp, DISP_REG_RDMA_SIZE_CON_0, 0xfff, width);
> >  	rdma_update_bits(comp, DISP_REG_RDMA_SIZE_CON_1, 0xfffff, height);
> >  
> > +	if (rdma->fifo_size)
> > +		rdma_fifo_size = rdma->fifo_size;
> > +	else
> > +		rdma_fifo_size = RDMA_FIFO_SIZE(rdma);
> > +
> >  	/*
> >  	 * Enable FIFO underflow since DSI and DPI can't be blocked.
> >  	 * Keep the FIFO pseudo size reset default of 8 KiB. Set the
> > @@ -142,7 +149,7 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
> >  	 */
> >  	threshold = width * height * vrefresh * 4 * 7 / 1000000;
> >  	reg = RDMA_FIFO_UNDERFLOW_EN |
> > -	      RDMA_FIFO_PSEUDO_SIZE(RDMA_FIFO_SIZE(rdma)) |
> > +	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
> >  	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
> >  	writel(reg, comp->regs + DISP_REG_RDMA_FIFO_CON);
> >  }
> > @@ -284,6 +291,18 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
> >  		return comp_id;
> >  	}
> >  
> > +	if (of_find_property(dev->of_node, "mediatek,rdma_fifo_size", &ret)) {
> 
> "mediatek,rdma_fifo_size" does not exists in binding document.
> 
> > +		ret = of_property_read_u32(dev->of_node,
> > +					   "mediatek,rdma_fifo_size",
> > +					   &priv->fifo_size);
> > +		if (ret) {
> > +			dev_err(dev, "Failed to get rdma fifo size\n");
> > +			return ret;
> > +		}
> > +
> > +		priv->fifo_size *= SZ_1K;
> 
> Why not define fifo_size in 'bytes' ?
> 
> Regards,
> CK

this is align the definition of fifo_size in mtk_disp_rdma_data, it is
SZ_1K, 
and the macro RDMA_FIFO_PSEUDO_SIZE calculated with SZ_1K
> 
> > +	}
> > +
> >  	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
> >  				&mtk_disp_rdma_funcs);
> >  	if (ret) {
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
