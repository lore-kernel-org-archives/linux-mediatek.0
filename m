Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1451EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fLjjFC7EepThPrHZnNRFSDgpN+IJuo36IXzBSdEU8I=; b=v0LuRkSFO5FoFv
	mGTTuDuP97XpVFDId3tpTn2tlbeu+OjbjnB/ARx9SUzE9yUCIqfOV/06OJV+7v4ZTk5CueRak00G+
	MV/jgjjGnm4U6noBZkM33YjPCS/6pb2LQX31NDhI8pLlEi9LP+KZwT17n29Km2wuMFU5n7FCnEjyP
	+JJpN1k+BafShbp0RWSTylfaeRqRcMBf21tSlaINs/TJl9ALCqpLd074ziBxcL4jFkUBHWRRa/e9j
	2ASa2RlK7jhmGMQ5BKPfrXkNeITZxWpAhXcyeFMU4TYqu90tcPGgIwnwm/zLppPgt2sXUSvcvl/BP
	w9aFTBlcbuILVV3VGTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVCJL-001gYD-3o; Fri, 18 Mar 2022 13:06:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVCJI-001gWc-8b; Fri, 18 Mar 2022 13:06:29 +0000
X-UUID: 20189424c32e40b2b0f5372ad6409c5e-20220318
X-UUID: 20189424c32e40b2b0f5372ad6409c5e-20220318
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1584502577; Fri, 18 Mar 2022 06:06:20 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 06:06:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 18 Mar 2022 21:06:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 21:06:16 +0800
Message-ID: <1ae841a059f8de6bb9366b2f776cf48721aded41.camel@mediatek.com>
Subject: Re: [PATCH v15 21/22] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <srv_heupstream@mediatek.com>, David Airlie
 <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <llvm@lists.linux.dev>, Nick Desaulniers
 <ndesaulniers@google.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 18 Mar 2022 21:06:16 +0800
In-Reply-To: <9832dacd50a744afebe9db7fcfda2b4ced572936.camel@mediatek.com>
References: <20220311015506.11232-1-nancy.lin@mediatek.com>
 <20220311015506.11232-22-nancy.lin@mediatek.com>
 <9832dacd50a744afebe9db7fcfda2b4ced572936.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_060628_335684_AA37AC0A 
X-CRM114-Status: GOOD (  17.39  )
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

Hi CK,

Thanks for the review.

On Tue, 2022-03-15 at 13:10 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Fri, 2022-03-11 at 09:55 +0800, Nancy.Lin wrote:
> > Add driver data of mt8195 vdosys1 to mediatek-drm.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 99f37f8f6639..2a32e5d24f19 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -190,6 +190,12 @@ static const enum mtk_ddp_comp_id
> > mt8195_mtk_ddp_main[] = {
> >  	DDP_COMPONENT_DP_INTF0,
> >  };
> >  
> > +static const enum mtk_ddp_comp_id mt8195_mtk_ddp_ext[] = {
> > +	DDP_COMPONENT_OVL_ADAPTOR,
> > +	DDP_COMPONENT_MERGE5,
> > +	DDP_COMPONENT_DP_INTF1,
> > +};
> > +
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data
> > =
> > {
> >  	.main_path = mt2701_mtk_ddp_main,
> >  	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> > @@ -254,6 +260,13 @@ static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data = {
> >  	.mmsys_dev_num = 2,
> 
> With this modification,
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> 
OK

Regards,
Nancy

> >  };
> >  
> > +static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data
> > = {
> > +	.ext_path = mt8195_mtk_ddp_ext,
> > +	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
> > +	.mmsys_id = 1,
> > +	.mmsys_dev_num = 2,
> > +};
> > +
> >  static const struct of_device_id mtk_drm_of_ids[] = {
> >  	{ .compatible = "mediatek,mt2701-mmsys",
> >  	  .data = &mt2701_mmsys_driver_data},
> > @@ -271,6 +284,8 @@ static const struct of_device_id
> > mtk_drm_of_ids[]
> > = {
> >  	  .data = &mt8192_mmsys_driver_data},
> >  	{ .compatible = "mediatek,mt8195-vdosys0",
> >  	  .data = &mt8195_vdosys0_driver_data},
> > +	{ .compatible = "mediatek,mt8195-vdosys1",
> > +	  .data = &mt8195_vdosys1_driver_data},
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
