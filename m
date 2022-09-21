Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479B7C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azqYiyJdwlDH3D7K1YoWpIx1lUAy1nX7mdHhTOkqnG4=; b=m+3zXUIfbZ3Vby5gK/y3I9ddlJ
	Z26LOXAF1Vfg94DsLYU5oGUjoUMYs+2tFujK2Fksax0eYEnuWlKILGiuX53dv7dMIqvhHE/yItZUM
	OvexEJqlkzJReW1ZJFiG+/80HHNOrrFhgQr2YWigMVjwtZ7FVD9S7LSycgC9BD0/wm//43Qj7oMnj
	RJr6nmfXPgzM7ax1fM/aliZzUzLCpi+QW6n80nCwfC7cX9nLhhRAMxD8k5npQfWW5xZqcHT2XY1De
	CWqG8xmC/oj8Z2MolN0gMTWB9CbGLM3qozR+8VpGe3Fa+35tjgUnpSTQkBOTTpSUsHpBHZMiDeJ37
	nssHnmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob0Lu-00BVnc-9y; Wed, 21 Sep 2022 14:05:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob0Lj-00BVk2-9F; Wed, 21 Sep 2022 14:05:16 +0000
X-UUID: 210e285db75342e9be069f23232162e9-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=azqYiyJdwlDH3D7K1YoWpIx1lUAy1nX7mdHhTOkqnG4=;
	b=MAMf5j9sFs4oejhy9kdOej/87i9vA8kDAEvP8uDo4pIw0UuFkZHfOYbDGxkQpH8mya1bz/9RlWVOytrM0teFfU6GH9HLp8qahzQ8Y3izZpms26oLpo4vRN96rGIz0jRDdWbZ1BkOrTa8+2aqYqLOzQnEtvOEP6TK1ykCKvm3HKE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b5c018a5-9e15-4c75-ab1e-0b728847822d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:25488af6-0338-44e1-8779-cf7b43f86df2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 210e285db75342e9be069f23232162e9-20220921
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1890609513; Wed, 21 Sep 2022 07:05:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 21:44:25 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 21:44:24 +0800
Message-ID: <0607e6fd736e61f14fbb3326dbb09243afc1d671.camel@mediatek.com>
Subject: Re: [PATCH v6,3/3] drm: mediatek: Add mt8186 dpi compatible to
 mtk_dpi.c
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <matthias.bgg@gmail.com>,
	<jason-jh.lin@mediatek.com>, <rex-bc.chen@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <p.zabel@pengutronix.de>,
	<airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jitao.shi@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 21 Sep 2022 21:44:25 +0800
In-Reply-To: <9f27f3c589c538319f9383cf284226b52209524d.camel@mediatek.com>
References: <1663161662-1598-1-git-send-email-xinlei.lee@mediatek.com>
	 <1663161662-1598-4-git-send-email-xinlei.lee@mediatek.com>
	 <9f27f3c589c538319f9383cf284226b52209524d.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_070515_343581_439ED9CC 
X-CRM114-Status: GOOD (  20.29  )
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

On Wed, 2022-09-21 at 09:42 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Wed, 2022-09-14 at 21:21 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add the compatible because use edge_cfg_in_mmsys in mt8186.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c     | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
> >  2 files changed, 23 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 6e02f02f163c..52bcc4114afd 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -942,6 +942,24 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.csc_enable_bit = CSC_ENABLE,
> >  };
> >  
> > +static const struct mtk_dpi_conf mt8186_conf = {
> > +	.cal_factor = mt8183_calculate_factor,
> > +	.reg_h_fre_con = 0xe0,
> > +	.max_clock_khz = 150000,
> > +	.output_fmts = mt8183_output_fmts,
> > +	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> > +	.edge_cfg_in_mmsys = true,
> 
> According to the previous review, edge_cfg_in_mmsys is not necessary,
> so mt8186_conf is identical to mt8192_conf.
> 
> Regards,
> CK
> 
> > +	.pixels_per_iter = 1,
> > +	.is_ck_de_pol = true,
> > +	.swap_input_support = true,
> > +	.support_direct_pin = true,
> > +	.dimension_mask = HPW_MASK,
> > +	.hvsize_mask = HSIZE_MASK,
> > +	.channel_swap_shift = CH_SWAP,
> > +	.yuv422_en_bit = YUV422_EN,
> > +	.csc_enable_bit = CSC_ENABLE,
> > +};
> > +
> >  static const struct mtk_dpi_conf mt8192_conf = {
> >  	.cal_factor = mt8183_calculate_factor,
> >  	.reg_h_fre_con = 0xe0,
> > @@ -1092,6 +1110,9 @@ static const struct of_device_id
> > mtk_dpi_of_ids[] = {
> >  	{ .compatible = "mediatek,mt8183-dpi",
> >  	  .data = &mt8183_conf,
> >  	},
> > +	{ .compatible = "mediatek,mt8186-dpi",
> > +	  .data = &mt8186_conf,
> > +	},
> >  	{ .compatible = "mediatek,mt8192-dpi",
> >  	  .data = &mt8192_conf,
> >  	},
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 546b79412815..3d32fbc66ac1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -646,6 +646,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >  	  .data = (void *)MTK_DPI },
> >  	{ .compatible = "mediatek,mt8183-dpi",
> >  	  .data = (void *)MTK_DPI },
> > +	{ .compatible = "mediatek,mt8186-dpi",
> > +	  .data = (void *)MTK_DPI },
> >  	{ .compatible = "mediatek,mt8192-dpi",
> >  	  .data = (void *)MTK_DPI },
> >  	{ .compatible = "mediatek,mt8195-dp-intf",
> 
> 

Hi CK:

Thanks for your review.

Because the difference between MT8186 and other ICs is that modifying
the output format requires modifying the mmsys register to take effect.

I think this mt8186_conf needs to be reserved so that we can
distinguish it from the settings of other ICs when setting
dpi_dual_edge.
(the edge_cfg_in mmsys flag inside can prevent other ICs from setting
the mmsys register)

Best Regards!
Xinlei


