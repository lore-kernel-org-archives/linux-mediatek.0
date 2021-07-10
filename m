Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54A2C07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:00:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 973AD613DA
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 973AD613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuBQSKFsxc44CI165BZajNuAMA51UdbsCOM2mupkpoA=; b=XAnjtsop2U3lp1
	3/9T0bQU5NO9yI/ibDanhf4VRHYfQ5Yavs+zaS0BTaSoW/IocuLtszmEgpeFKTJeBw/V/tpOwX50J
	YjNzGkf/SCoRwEGnn89uR0nAvXl+vIdpgxfN+Je/9Gn4bs5jl342EhsgUWQXPgTc98kE724QC+4KS
	vno/3+EPaqlpXWPxbfUXn0mW42aVRTmkoyPC5CE+9RfIxauPB470asqT9niqrwLhfCgE6Vg6wnA4o
	0yQKTN5HyZ/Vnhk8WNsZoVvw80fPp2RwHIgUE1BZJ+dUCqJwgaxDq9ZKEJf53yzjYhEbt2SoKIdy/
	2DAxD7CxfXpE64f/uSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m26y9-003AUs-6j; Sat, 10 Jul 2021 07:00:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m26y7-003AUL-1x; Sat, 10 Jul 2021 07:00:08 +0000
X-UUID: 70409097559b47cc9d2ec7c5f6b6d2df-20210709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5AIx17dgaf9J9sK4Zh/t7h7NIr3pG6feU3yAreOp5as=; 
 b=YIa+4DpuAHAhBNZaj0cRYIowXlbxVys8fS2YLoLJ5OULX6fWsKw7dSd9RyyMMTPKxcrYoXrAIZFd4nsWVTgd73a0uzvIIAVq2xL4CFmVADwzqbEo2dk7WqrBbAqCZKXhqkpJjB3C11rRx1hvanKWD5CSnviChMSxZii5cjtUKJw=;
X-UUID: 70409097559b47cc9d2ec7c5f6b6d2df-20210709
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1013388964; Fri, 09 Jul 2021 23:59:56 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Jul 2021 23:59:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 14:59:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 14:59:46 +0800
Message-ID: <ec19c5e28d0ba70cd8b53fdc082506c4eeab672f.camel@mediatek.com>
Subject: Re: [PATCH v1 05/17] drm/mediatek: add mediatek-drm of vdosys0
 support for MT8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sat, 10 Jul 2021 14:59:46 +0800
In-Reply-To: <1625633339.7824.6.camel@mtksdaap41>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-6-jason-jh.lin@mediatek.com>
 <1625633339.7824.6.camel@mtksdaap41>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_000007_149967_1FC2375E 
X-CRM114-Status: GOOD (  17.27  )
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

On Wed, 2021-07-07 at 12:48 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> > Add mediatek-drm of vdosys0 support for MT8195.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 24
> > ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index b46bdb8985da..9074ce32912c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -147,6 +147,23 @@ static const enum mtk_ddp_comp_id
> > mt8183_mtk_ddp_ext[] = {
> >  	DDP_COMPONENT_DPI0,
> >  };
> >  
> > +static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
> > +	DDP_COMPONENT_OVL0,
> > +	DDP_COMPONENT_RDMA0,
> > +	DDP_COMPONENT_COLOR0,
> > +	DDP_COMPONENT_CCORR,
> > +	DDP_COMPONENT_AAL0,
> > +	DDP_COMPONENT_GAMMA,
> > +	DDP_COMPONENT_DITHER,
> > +#ifdef CONFIG_MTK_DPTX_SUPPORT
> > +	DDP_COMPONENT_DSC0,
> > +	DDP_COMPONENT_MERGE0,
> > +	DDP_COMPONENT_DP_INTF0,
> > +#else
> 
> CONFIG_MTK_DPTX_SUPPORT is not defined, so remove this part.
> 
> Regards,
> CK
> 

Hi CK,

OK, I'll remove this part at the next version.

Regard,
Jason-JH.Lin

> > +	DDP_COMPONENT_DSI0,
> > +#endif
> > +};
> > +
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data
> > = {
> >  	.main_path = mt2701_mtk_ddp_main,
> >  	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> > @@ -186,6 +203,11 @@ static const struct mtk_mmsys_driver_data
> > mt8183_mmsys_driver_data = {
> >  	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
> >  };
> >  
> > +static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data = {
> > +	.main_path = mt8195_mtk_ddp_main,
> > +	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
> > +};
> > +
> >  static int mtk_drm_kms_init(struct drm_device *drm)
> >  {
> >  	struct mtk_drm_private *private = drm->dev_private;
> > @@ -468,6 +490,8 @@ static const struct of_device_id
> > mtk_drm_of_ids[] = {
> >  	  .data = &mt8173_mmsys_driver_data},
> >  	{ .compatible = "mediatek,mt8183-mmsys",
> >  	  .data = &mt8183_mmsys_driver_data},
> > +	{.compatible = "mediatek,mt8195-vdosys0",
> > +	  .data = &mt8195_vdosys0_driver_data},
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
