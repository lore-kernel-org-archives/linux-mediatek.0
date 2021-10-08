Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24E8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 02:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72AA061261
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 02:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72AA061261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McmdpuZVahflNCEzSMzWPwF92WRfPcPy9ArWcm3J7Wc=; b=NqXdjr/ZGHwnF3
	uf7nB80qPfx3vtOVkhax+k+lZCrwXGQ9h92V1/ZhaoxANeRZDn2q9E0FggKE4bxYhtsfzp5AZPYGg
	Q7xoHXKHkJTjsOx/Z7ScoKgkLKpokbpgIieO9y7Xz3y6ArBjI0ezYlHuDPaHJ1aEwPsiCC/+wj24s
	5w+ez1l5aRNpWktEdQMmq99997EjGJkyQZ6Fw482sTLi+D09iKLQ4mFw78AfcToZFy/bKs63WdsmW
	OWCVFgXulF9Ol1Vi4VS2U3V11mLcT7tXPNfA1Ws0lYf/xn10yuD+PmXGIDvh/w0nh8MNaZxQZAxoc
	nZ3dl/WOHMNkTV0+dypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYfKp-001HVj-QV; Fri, 08 Oct 2021 02:10:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYfKQ-001HM1-Uw; Fri, 08 Oct 2021 02:09:45 +0000
X-UUID: 3f786aabe5fc40c68cee1b19981cb04d-20211007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a+/QJ5TtnBHsIxZpu3XSq6R2eEEwXhVGTnIy0IfISHE=; 
 b=vH6IYo1UOZ2yn3Jg5ZYxTYb43wDpc7b6t3Wj1XdWA4BNHKsqYmqotmKbcdyMMJQUjx6jRWHn4wvFDzPoKOY12vkwoOw4698k0tx58gxUYsaV421pjBrbwsocyaSDFYCidv5vCfIYSNcmR3onunQEOVd7ZCQ/v4a884kP8/tqT5M=;
X-UUID: 3f786aabe5fc40c68cee1b19981cb04d-20211007
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 808545590; Thu, 07 Oct 2021 19:09:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Oct 2021 19:09:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 8 Oct 2021 10:09:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Oct 2021 10:09:38 +0800
Message-ID: <3eff2cfb15677f03d6dcd724fd977ab48fe101aa.camel@mediatek.com>
Subject: Re: [PATCH v10, 2/5] drm/mediatek: add component POSTMASK
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>
Date: Fri, 8 Oct 2021 10:09:41 +0800
In-Reply-To: <fffdc65c-9c74-3183-f8cf-293134144042@collabora.com>
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-3-yongqiang.niu@mediatek.com>
 <fffdc65c-9c74-3183-f8cf-293134144042@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_190943_058830_709236DF 
X-CRM114-Status: GOOD (  21.25  )
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

On Fri, 2021-10-01 at 13:00 +0200, Dafna Hirschfeld wrote:
> 
> On 30.09.21 17:52, Yongqiang Niu wrote:
> > This patch add component POSTMASK.
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 102 ++++++++++++++-
> > -----
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
> >   2 files changed, 73 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 4a2abcf3e5f9..89170ad825fd 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -62,6 +62,12 @@
> >   #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) <<
> > 4)
> >   #define DITHER_ADD_RSHIFT_G(x)			(((x) & 0x7) <<
> > 0)
> >   
> > +#define DISP_POSTMASK_EN			0x0000
> > +#define POSTMASK_EN					BIT(0)
> > +#define DISP_POSTMASK_CFG			0x0020
> > +#define POSTMASK_RELAY_MODE				BIT(0)
> > +#define DISP_POSTMASK_SIZE			0x0030
> > +
> >   struct mtk_ddp_comp_dev {
> >   	struct clk *clk;
> >   	void __iomem *regs;
> > @@ -214,6 +220,32 @@ static void mtk_dither_stop(struct device
> > *dev)
> >   	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
> >   }
> >   
> > +static void mtk_postmask_config(struct device *dev, unsigned int
> > w,
> > +				unsigned int h, unsigned int vrefresh,
> > +				unsigned int bpc, struct cmdq_pkt
> > *cmdq_pkt)
> > +{
> > +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > +
> > +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv-
> > >regs,
> > +		      DISP_POSTMASK_SIZE);
> > +	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
> > +		      priv->regs, DISP_POSTMASK_CFG);
> > +}
> > +
> > +static void mtk_postmask_start(struct device *dev)
> > +{
> > +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > +
> > +	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
> > +}
> > +
> > +static void mtk_postmask_stop(struct device *dev)
> > +{
> > +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > +
> > +	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
> > +}
> > +
> >   static const struct mtk_ddp_comp_funcs ddp_aal = {
> >   	.clk_enable = mtk_aal_clk_enable,
> >   	.clk_disable = mtk_aal_clk_disable,
> > @@ -289,6 +321,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl
> > = {
> >   	.bgclr_in_off = mtk_ovl_bgclr_in_off,
> >   };
> >   
> > +static const struct mtk_ddp_comp_funcs ddp_postmask = {
> > +	.clk_enable = mtk_ddp_clk_enable,
> > +	.clk_disable = mtk_ddp_clk_disable,
> > +	.config = mtk_postmask_config,
> > +	.start = mtk_postmask_start,
> > +	.stop = mtk_postmask_stop,
> > +};
> > +
> >   static const struct mtk_ddp_comp_funcs ddp_rdma = {
> >   	.clk_enable = mtk_rdma_clk_enable,
> >   	.clk_disable = mtk_rdma_clk_disable,
> > @@ -324,6 +364,7 @@ static const char * const
> > mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
> >   	[MTK_DISP_MUTEX] = "mutex",
> >   	[MTK_DISP_OD] = "od",
> >   	[MTK_DISP_BLS] = "bls",
> > +	[MTK_DISP_POSTMASK] = "postmask",
> >   };
> >   
> >   struct mtk_ddp_comp_match {
> > @@ -333,36 +374,37 @@ struct mtk_ddp_comp_match {
> >   };
> >   
> >   static const struct mtk_ddp_comp_match
> > mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> > -	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal
> > },
> > -	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal
> > },
> > -	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
> > -	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0,
> > &ddp_ccorr },
> > -	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0,
> > &ddp_color },
> > -	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1,
> > &ddp_color },
> > -	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0,
> > &ddp_dither },
> > -	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi
> > },
> > -	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi
> > },
> > -	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi
> > },
> > -	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi
> > },
> > -	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi
> > },
> > -	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi
> > },
> > -	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0,
> > &ddp_gamma },
> > -	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
> > -	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
> > -	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl
> > },
> > -	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl
> > },
> > -	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl
> > },
> > -	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl
> > },
> > -	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> > -	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
> > -	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
> > -	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
> > -	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0,
> > &ddp_rdma },
> > -	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1,
> > &ddp_rdma },
> > -	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2,
> > &ddp_rdma },
> > -	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0,
> > &ddp_ufoe },
> > -	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
> > -	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
> > +	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,	0,
> > &ddp_aal },
> > +	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,	1,
> > &ddp_aal },
> > +	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,	0, NULL },
> > +	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0,
> > &ddp_ccorr },
> > +	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0,
> > &ddp_color },
> > +	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1,
> > &ddp_color },
> > +	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0,
> > &ddp_dither },
> > +	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0,
> > &ddp_dpi },
> > +	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1,
> > &ddp_dpi },
> > +	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0,
> > &ddp_dsi },
> > +	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1,
> > &ddp_dsi },
> > +	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2,
> > &ddp_dsi },
> > +	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3,
> > &ddp_dsi },
> > +	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0,
> > &ddp_gamma },
> > +	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od
> > },
> > +	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od
> > },
> > +	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0,
> > &ddp_ovl },
> > +	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,	1,
> > &ddp_ovl },
> > +	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0,
> > &ddp_ovl },
> > +	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1,
> > &ddp_ovl },
> > +	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2,
> > &ddp_ovl },
> > +	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0,
> > &ddp_postmask },
> 
> Hi, I can't see where is DDP_COMPONENT_POSTMASK0 defined.
> 
> Thanks,
> Dafna

it is defined in mtk_mmsys.h


https://patchwork.kernel.org/project/linux-mediatek/patch/20210930155222.5861-3-yongqiang.niu@mediatek.com/

> 
> > +	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0,
> > NULL },
> > +	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1,
> > NULL },
> > +	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,	2,
> > NULL },
> > +	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0,
> > &ddp_rdma },
> > +	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1,
> > &ddp_rdma },
> > +	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2,
> > &ddp_rdma },
> > +	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0,
> > &ddp_ufoe },
> > +	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0,
> > NULL },
> > +	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1,
> > NULL },
> >   };
> >   
> >   static bool mtk_drm_find_comp_in_ddp(struct device *dev,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index bb914d976cf5..cd1dec6b4cdf 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
> >   	MTK_DISP_UFOE,
> >   	MTK_DSI,
> >   	MTK_DPI,
> > +	MTK_DISP_POSTMASK,
> >   	MTK_DISP_PWM,
> >   	MTK_DISP_MUTEX,
> >   	MTK_DISP_OD,
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
