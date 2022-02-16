Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43995C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 01:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyi1WwCiVWlM1BP35coeFen6kjGXZvFH5b43kb4a5ts=; b=t+t4JJWubu+mdo
	ZKGLPrZMT7UTKF0RSa+sVNIgyMfA0ySw/dkhvilucQ5X3BnhRWonQ+wYC5qjd5pIMk+u3LzJe3URz
	VOMfx27UzaCgcKJVFCq6G2cINNEUtaf2m7CtCDcQYxOzP7tjWCDXTn3oB/vG7Mc06xgdFU+wbF/xH
	VHFXKABZakEDUvGGuHNQcsO+aC/LsvlJ9HrWdXZ0/K9huFYaHnGlDPcnXQpZUyIcUHf9AGg9OKYBw
	kmYmxut/jUINtW9EuHfAy+YtmTM0z5ur0QDWff61D8a5h/OCycX8S2wsWetrSqkYw5FI6hJF75Gm1
	ym+fQaV+vGLMSliBDsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK9I5-005AqN-G9; Wed, 16 Feb 2022 01:39:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK9Hu-005Amu-4M; Wed, 16 Feb 2022 01:39:23 +0000
X-UUID: eddaaacf817a4465b5345f1039859a93-20220215
X-UUID: eddaaacf817a4465b5345f1039859a93-20220215
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 413585181; Tue, 15 Feb 2022 18:39:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 17:39:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Feb 2022 09:39:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Feb 2022 09:39:05 +0800
Message-ID: <d480bb5f699182694eaac0379908e10ca88ef41f.camel@mediatek.com>
Subject: Re: [1/2] soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver
 data
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <matthias.bgg@gmail.com>
CC: <chunkuang.hu@kernel.org>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 16 Feb 2022 09:39:05 +0800
In-Reply-To: <da4b7285-1f2d-01a0-9a1d-1381b4772512@collabora.com>
References: <20220215131952.27861-1-rex-bc.chen@mediatek.com>
 <20220215131952.27861-2-rex-bc.chen@mediatek.com>
 <da4b7285-1f2d-01a0-9a1d-1381b4772512@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_173922_199324_E6911C89 
X-CRM114-Status: GOOD (  22.14  )
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

Hello Angelo,

Thanks for yor review.
I add reply comment below:

On Tue, 2022-02-15 at 14:54 +0100, AngeloGioacchino Del Regno wrote:
> Il 15/02/22 14:19, Rex-BC Chen ha scritto:
> > There are different software reset registers for difference MTK
> > SoCs.
> > Therefore, we add a new variable "sw0_rst_offset" to control it.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mt8183-mmsys.h | 2 ++
> >   drivers/soc/mediatek/mtk-mmsys.c    | 6 ++++--
> >   drivers/soc/mediatek/mtk-mmsys.h    | 3 +--
> >   3 files changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mt8183-mmsys.h
> > b/drivers/soc/mediatek/mt8183-mmsys.h
> > index 9dee485807c9..0c021f4b76d2 100644
> > --- a/drivers/soc/mediatek/mt8183-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8183-mmsys.h
> > @@ -25,6 +25,8 @@
> >   #define MT8183_RDMA0_SOUT_COLOR0		0x1
> >   #define MT8183_RDMA1_SOUT_DSI0			0x1
> >   
> > +#define MT8183_MMSYS_SW0_RST_B			0x140
> > +
> >   static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[]
> > = {
> >   	{
> >   		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 0da25069ffb3..cab62c3eac05 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -49,12 +49,14 @@ static const struct mtk_mmsys_driver_data
> > mt8173_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt8173-mm",
> >   	.routes = mmsys_default_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> > +	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> >   };
> >   
> >   static const struct mtk_mmsys_driver_data
> > mt8183_mmsys_driver_data = {
> >   	.clk_driver = "clk-mt8183-mm",
> >   	.routes = mmsys_mt8183_routing_table,
> >   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> > +	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> >   };
> >   
> >   static const struct mtk_mmsys_driver_data
> > mt8186_mmsys_driver_data = {
> > @@ -128,14 +130,14 @@ static int mtk_mmsys_reset_update(struct
> > reset_controller_dev *rcdev, unsigned l
> >   
> >   	spin_lock_irqsave(&mmsys->lock, flags);
> >   
> > -	reg = readl_relaxed(mmsys->regs + MMSYS_SW0_RST_B);
> > +	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> >   
> >   	if (assert)
> >   		reg &= ~BIT(id);
> >   	else
> >   		reg |= BIT(id);
> >   
> > -	writel_relaxed(reg, mmsys->regs + MMSYS_SW0_RST_B);
> > +	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> >   
> >   	spin_unlock_irqrestore(&mmsys->lock, flags);
> >   
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> > b/drivers/soc/mediatek/mtk-mmsys.h
> > index 8b0ed05117ea..83320019b4cf 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.h
> > +++ b/drivers/soc/mediatek/mtk-mmsys.h
> > @@ -78,8 +78,6 @@
> >   #define DSI_SEL_IN_RDMA				0x1
> >   #define DSI_SEL_IN_MASK				0x1
> >   
> > -#define MMSYS_SW0_RST_B				0x140
> > -
> >   struct mtk_mmsys_routes {
> >   	u32 from_comp;
> >   	u32 to_comp;
> > @@ -92,6 +90,7 @@ struct mtk_mmsys_driver_data {
> >   	const char *clk_driver;
> >   	const struct mtk_mmsys_routes *routes;
> >   	const unsigned int num_routes;
> > +	const unsigned int sw0_rst_offset;
> 
> I don't think that this offset will ever be larger than 0xffff.
> Can we use u16 here instead?
> 
Yes, the value of offset is enough using u16.
I will modify this in next version.

BRs,
Rex
> >   };
> >   
> >   /*
> 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
