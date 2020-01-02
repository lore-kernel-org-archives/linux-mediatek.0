Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBC2C2D0DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 07:32:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D471215A4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 07:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ALdJA4RJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F4p5VDWD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D471215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BF57jmIYaBhGBrDkKswfORGBemeksmi6IaAb1+NodXU=; b=ALdJA4RJ605X1A
	mOL7+yE7srq7GFmGrd0CqdaFN9vnkSaPHNxmLdWrFpoVQH7nL6odlv5SDyUZET3OQb5hPIhgVB6xH
	G3t5fpx4CMzb37M3Am8IJrbTqmdPbbPpliLXe68l7HjipzDCGI2BDcjZvqPn0NhkZfjruLRzYoMfO
	btMgMVSnoRXvrR5wuJVxyUV7uTYAx7aAi0wyHEaLH07iFGU9nXjZ8wr0P+UyY7eEd/6tm4ArQ9c3B
	PEYCV9esofzFevAypy12PSuacqEvyOIIoX2f4wGCuXSH9z4ff2I+4O4IFuCIIZa8mmpxM2cCbH+n7
	C3QMtTKN6Z962Es3nIPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imuxt-0003JL-A0; Thu, 02 Jan 2020 07:32:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imuxk-0003B4-CF; Thu, 02 Jan 2020 07:32:10 +0000
X-UUID: 7780ebcb488641e18a4c5b6a5268cade-20200101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PCH3d6ww20Xcb8eTPquPc5VeMWFXLY/lz4kI3WEDJSA=; 
 b=F4p5VDWDAvSr2Kr0ZjPc44TxNq7hQWr7t77SmaPA0W2fkNq17Qxm20FLZZQMLkkZJ9uHhqs7bQvR0pwqh9tS5q4e8+01j5J9AeiA44NWtSCfZ89aN5zjq8lRGDmgQ2aEIFlcwn85pzTM8UEN++yrvMNGzSAoKQOP2MhT/uAn2Ms=;
X-UUID: 7780ebcb488641e18a4c5b6a5268cade-20200101
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1769587779; Wed, 01 Jan 2020 23:32:03 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Jan 2020 23:32:23 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 15:30:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 15:32:24 +0800
Message-ID: <1577950317.12633.3.camel@mtksdaap41>
Subject: Re: [PATCH v6, 13/14] drm/mediatek: add fifo_size into rdma private
 data
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Thu, 2 Jan 2020 15:31:57 +0800
In-Reply-To: <1577943764.15116.3.camel@mhfsdcap03>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
 <1577937624-14313-14-git-send-email-yongqiang.niu@mediatek.com>
 <1577942440.24650.5.camel@mtksdaap41> <1577943764.15116.3.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 235C97CA29A4272D17AFBE5A53C10D0B4DF8A318DC6B8E23D5887A814BBD57882000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_233208_427914_004EED85 
X-CRM114-Status: GOOD (  18.61  )
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

Hi, Yongqiang:

On Thu, 2020-01-02 at 13:42 +0800, Yongqiang Niu wrote:
> On Thu, 2020-01-02 at 13:20 +0800, CK Hu wrote:
> > Hi, Yongqiang:
> > 
> > On Thu, 2020-01-02 at 12:00 +0800, Yongqiang Niu wrote:
> > > the fifo size of rdma in mt8183 is different.
> > > rdma0 fifo size is 5k
> > > rdma1 fifo size is 2k
> > > 
> > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 21 ++++++++++++++++++++-
> > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > > index 405afef..691480b 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > > @@ -62,6 +62,7 @@ struct mtk_disp_rdma {
> > >  	struct mtk_ddp_comp		ddp_comp;
> > >  	struct drm_crtc			*crtc;
> > >  	const struct mtk_disp_rdma_data	*data;
> > > +	u32				fifo_size;
> > >  };
> > >  
> > >  static inline struct mtk_disp_rdma *comp_to_rdma(struct mtk_ddp_comp *comp)
> > > @@ -130,10 +131,16 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
> > >  	unsigned int threshold;
> > >  	unsigned int reg;
> > >  	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
> > > +	u32 rdma_fifo_size;
> > >  
> > >  	rdma_update_bits(comp, DISP_REG_RDMA_SIZE_CON_0, 0xfff, width);
> > >  	rdma_update_bits(comp, DISP_REG_RDMA_SIZE_CON_1, 0xfffff, height);
> > >  
> > > +	if (rdma->fifo_size)
> > > +		rdma_fifo_size = rdma->fifo_size;
> > > +	else
> > > +		rdma_fifo_size = RDMA_FIFO_SIZE(rdma);
> > > +
> > >  	/*
> > >  	 * Enable FIFO underflow since DSI and DPI can't be blocked.
> > >  	 * Keep the FIFO pseudo size reset default of 8 KiB. Set the
> > > @@ -142,7 +149,7 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
> > >  	 */
> > >  	threshold = width * height * vrefresh * 4 * 7 / 1000000;
> > >  	reg = RDMA_FIFO_UNDERFLOW_EN |
> > > -	      RDMA_FIFO_PSEUDO_SIZE(RDMA_FIFO_SIZE(rdma)) |
> > > +	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
> > >  	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
> > >  	writel(reg, comp->regs + DISP_REG_RDMA_FIFO_CON);
> > >  }
> > > @@ -284,6 +291,18 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
> > >  		return comp_id;
> > >  	}
> > >  
> > > +	if (of_find_property(dev->of_node, "mediatek,rdma_fifo_size", &ret)) {
> > 
> > "mediatek,rdma_fifo_size" does not exists in binding document.
> > 
> > > +		ret = of_property_read_u32(dev->of_node,
> > > +					   "mediatek,rdma_fifo_size",
> > > +					   &priv->fifo_size);
> > > +		if (ret) {
> > > +			dev_err(dev, "Failed to get rdma fifo size\n");
> > > +			return ret;
> > > +		}
> > > +
> > > +		priv->fifo_size *= SZ_1K;
> > 
> > Why not define fifo_size in 'bytes' ?
> > 
> > Regards,
> > CK
> 
> this is align the definition of fifo_size in mtk_disp_rdma_data, it is
> SZ_1K, 
> and the macro RDMA_FIFO_PSEUDO_SIZE calculated with SZ_1K

I mean why not set the fifo size in bytes in device tree. So you need
not to do '*= SZ_1K' here. I think unit of fifo size in kernel is byte.

Regards,
CK

> > 
> > > +	}
> > > +
> > >  	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
> > >  				&mtk_disp_rdma_funcs);
> > >  	if (ret) {
> > 
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
