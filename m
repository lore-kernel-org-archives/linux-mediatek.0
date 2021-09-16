Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7820FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 02:51:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D65460F4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 02:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D65460F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/cJlJroGI+n/cicsK7b0nc5oZCZYAIhgzTb+mzvNMg=; b=tMWiqVtQndlJP9
	Fb8RiM4+GgUq3meTrZHprI2CKA87O7O23hfbyb0WJxhXFkmMMQIJoMvZF059lApozKMJAqYvjqS3y
	dS1jrSWrtQttm3KtN61XvqoVPv1xEXX5aBR5Z7UHWHvxP2J7FYTYgc0hfOKGpEtSudPtwHFAQ131v
	CHPW0OcIdUwXVqzQEuV1g7akNoZfE3Rs8GSqzs2QKz2fAu2IW/rbadI0kGyTNA/ZqZLRBAdronCch
	LZ+8B7V89dLK32jBBAQrxLHOBKp/yetw6Si+RmTR8MmHk9cd3spwX6aqaW/Z8qi45R4/dt7jM01Qt
	gqpzhX5p4AoaIoAndGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQhUd-00AD4s-4T; Thu, 16 Sep 2021 02:51:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQhUZ-00AD4P-LP; Thu, 16 Sep 2021 02:51:17 +0000
X-UUID: 6c298bb0894b4ddea23d01800b8f7acc-20210915
X-UUID: 6c298bb0894b4ddea23d01800b8f7acc-20210915
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1706669417; Wed, 15 Sep 2021 19:51:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Sep 2021 19:51:09 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 10:51:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Sep 2021 10:51:07 +0800
Message-ID: <dc2b882b49078251c8a90708a6231ec38c4aaa94.camel@mediatek.com>
Subject: Re: [PATCH v5 09/16] soc: mediatek: mmsys: modify reset controller
 for MT8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Thu, 16 Sep 2021 10:51:08 +0800
In-Reply-To: <d93c6866fb8a6e9bebf3b3ed6959e2c3abaf647d.camel@pengutronix.de>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-10-nancy.lin@mediatek.com>
 <d93c6866fb8a6e9bebf3b3ed6959e2c3abaf647d.camel@pengutronix.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_195115_760028_9090D712 
X-CRM114-Status: GOOD (  24.44  )
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

Dear Philipp,

Thanks for the review.

On Mon, 2021-09-06 at 09:29 +0200, Philipp Zabel wrote:
> Hi Nancy,
> 
> On Mon, 2021-09-06 at 15:15 +0800, Nancy.Lin wrote:
> > MT8195 vdosys1 has more than 32 reset bits and a different reset
> > base
> > than other chips. Modify mmsys for support 64 bit and different
> > reset
> > base.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mt8195-mmsys.h |  1 +
> >  drivers/soc/mediatek/mtk-mmsys.c    | 15 ++++++++++++---
> >  drivers/soc/mediatek/mtk-mmsys.h    |  1 +
> >  3 files changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index 648baaec112b..f67801c42fd9 100644
> > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -123,6 +123,7 @@
> >  #define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> > 0xf68
> >  #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		(0 <<
> > 0)
> >  
> > +#define MT8195_VDO1_SW0_RST_B           0x1d0
> >  #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
> >  #define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
> >  #define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 060065501b8a..97cb26339ef6 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -18,6 +18,8 @@
> >  #include "mt8365-mmsys.h"
> >  #include "mt8195-mmsys.h"
> >  
> > +#define MMSYS_SW_RESET_PER_REG 32
> > +
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data
> > = {
> >  	.clk_driver = "clk-mt2701-mm",
> >  	.routes = mmsys_default_routing_table,
> > @@ -48,12 +50,14 @@ static const struct mtk_mmsys_driver_data
> > mt8173_mmsys_driver_data = {
> >  	.clk_driver = "clk-mt8173-mm",
> >  	.routes = mmsys_default_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> > +	.sw_reset_start = MMSYS_SW0_RST_B,
> >  };
> >  
> >  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data
> > = {
> >  	.clk_driver = "clk-mt8183-mm",
> >  	.routes = mmsys_mt8183_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> > +	.sw_reset_start = MMSYS_SW0_RST_B,
> >  };
> >  
> >  static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data
> > = {
> > @@ -74,6 +78,7 @@ static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data = {
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> >  	.config = mmsys_mt8195_config_table,
> >  	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
> > +	.sw_reset_start = MT8195_VDO1_SW0_RST_B,
> >  };
> >  
> >  struct mtk_mmsys {
> > @@ -126,19 +131,23 @@ static int mtk_mmsys_reset_update(struct
> > reset_controller_dev *rcdev, unsigned l
> >  {
> >  	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> > rcdev);
> >  	unsigned long flags;
> > +	u32 offset;
> >  	u32 reg;
> >  	int i;
> >  
> > +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> > +	id = id % MMSYS_SW_RESET_PER_REG;
> > +
> >  	spin_lock_irqsave(&mmsys->lock, flags);
> >  
> > -	reg = readl_relaxed(mmsys->regs + MMSYS_SW0_RST_B);
> > +	reg = readl_relaxed(mmsys->regs + mmsys->data->sw_reset_start +
> > offset);
> >  
> >  	if (assert)
> >  		reg &= ~BIT(id);
> >  	else
> >  		reg |= BIT(id);
> >  
> > -	writel_relaxed(reg, mmsys->regs + MMSYS_SW0_RST_B);
> > +	writel_relaxed(reg, mmsys->regs + mmsys->data->sw_reset_start +
> > offset);
> >  
> >  	spin_unlock_irqrestore(&mmsys->lock, flags);
> >  
> > @@ -237,7 +246,7 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >  	spin_lock_init(&mmsys->lock);
> >  
> >  	mmsys->rcdev.owner = THIS_MODULE;
> > -	mmsys->rcdev.nr_resets = 32;
> > +	mmsys->rcdev.nr_resets = 64;
> 
> If only MT8195 vdosys1 has more than 32 reset bits, this should be
> kept
> at 32 for the others.
> 
> regards

OK, I will modify it in the next revision.
> Philipp


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
