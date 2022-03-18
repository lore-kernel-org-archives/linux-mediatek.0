Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD0AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqCk/vVDCiQV7zJ8mH4whDU13TAO2fm98llQzm3Qn9A=; b=ZZCkuYlBT+B6CO
	IGuJVWdaOl8t+CH/N/k6IkjxVUeP05zcUDhJLvYGPyaaoF1WsTIQQfTyr5nK88rwmq+1x/+XaW3sR
	Iex46K87BW+w9yz4ZvqKIaHQsIY3ilnK+zV9+Hyrkvg9ntX+N/ndiSPU5kcB26eZsiI7Sf7Ue1kF9
	WB7MCceg/86TleOILNHdNt55gAB9lU8e65r8DmizviJMh2EjpXYBQMlahUQOsIEH1WpDS9q67ixx/
	HCNWaDJF0/u2y7SQM/gdCaApl0eujcHlqvwrYajWOiiehzDcI/NBYes92RJ/0iXhiCXDpdPnxKHtI
	3wZRgy5K8U0TKnIgQXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVCIR-001gKD-Az; Fri, 18 Mar 2022 13:05:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVCIN-001gJH-S3; Fri, 18 Mar 2022 13:05:33 +0000
X-UUID: f27a615781644ed6930e95ab6cd57ce8-20220318
X-UUID: f27a615781644ed6930e95ab6cd57ce8-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 309644217; Fri, 18 Mar 2022 06:05:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 06:05:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 18 Mar 2022 21:05:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 21:05:21 +0800
Message-ID: <8a55684347c4ed4ce67e5c3cea680b15e19e2f0f.camel@mediatek.com>
Subject: Re: [PATCH v15 20/22] drm/mediatek: add drm ovl_adaptor sub driver
 for MT8195
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
Date: Fri, 18 Mar 2022 21:05:21 +0800
In-Reply-To: <9ef2d9d33430c146c010d017678b37c5960e1316.camel@mediatek.com>
References: <20220311015506.11232-1-nancy.lin@mediatek.com>
 <20220311015506.11232-21-nancy.lin@mediatek.com>
 <9ef2d9d33430c146c010d017678b37c5960e1316.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_060531_925155_23C4E61E 
X-CRM114-Status: GOOD (  34.86  )
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

On Tue, 2022-03-15 at 13:08 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Fri, 2022-03-11 at 09:55 +0800, Nancy.Lin wrote:
> > Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> > the component exists in the path.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 18 ++++------
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 31 +++++++++++++---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 40 ++++++++++++-----
> > --
> > --
> >  4 files changed, 58 insertions(+), 32 deletions(-)
> > 
> > 
> 
> [snip]
> 
> > +
> >  static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX]
> > =
> > {
> >  	[MTK_DISP_AAL] = "aal",
> >  	[MTK_DISP_BLS] = "bls",
> > @@ -398,6 +411,7 @@ static const char * const
> > mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
> >  	[MTK_DISP_OD] = "od",
> >  	[MTK_DISP_OVL] = "ovl",
> >  	[MTK_DISP_OVL_2L] = "ovl-2l",
> > +	[MTK_DISP_OVL_ADAPTOR] = "ovl_adaptor",
> >  	[MTK_DISP_POSTMASK] = "postmask",
> >  	[MTK_DISP_PWM] = "pwm",
> >  	[MTK_DISP_RDMA] = "rdma",
> > @@ -443,6 +457,7 @@ static const struct mtk_ddp_comp_match
> > mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> >  	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0,
> > &ddp_ovl },
> >  	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1,
> > &ddp_ovl },
> >  	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2,
> > &ddp_ovl },
> > +	[DDP_COMPONENT_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	
> > 0, &ddp_ovl_adaptor },
> 
> I'm not sure this indent is align to other line or not. If aligned or
> not aligned and modify other line to be aligned,
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

OK, I will fix it.

Regards,
Nancy
> 
> >  	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0,
> > &ddp_postmask },
> >  	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0,
> > NULL },
> >  	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1,
> > NULL },
> > @@ -548,12 +563,17 @@ int mtk_ddp_comp_init(struct device_node
> > *node,
> > struct mtk_ddp_comp *comp,
> >  
> >  	comp->id = comp_id;
> >  	comp->funcs = mtk_ddp_matches[comp_id].funcs;
> > -	comp_pdev = of_find_device_by_node(node);
> > -	if (!comp_pdev) {
> > -		DRM_INFO("Waiting for device %s\n", node->full_name);
> > -		return -EPROBE_DEFER;
> > +	/* Not all drm components have a DTS device node, such as
> > ovl_adaptor,
> > +	 * which is the drm bring up sub driver
> > +	 */
> > +	if (node) {
> > +		comp_pdev = of_find_device_by_node(node);
> > +		if (!comp_pdev) {
> > +			DRM_INFO("Waiting for device %s\n", node-
> > > full_name);
> > 
> > +			return -EPROBE_DEFER;
> > +		}
> > +		comp->dev = &comp_pdev->dev;
> >  	}
> > -	comp->dev = &comp_pdev->dev;
> >  
> >  	/* Only DMA capable components need the LARB property */
> >  	if (type == MTK_DISP_OVL ||
> > @@ -573,6 +593,7 @@ int mtk_ddp_comp_init(struct device_node *node,
> > struct mtk_ddp_comp *comp,
> >  	    type == MTK_DISP_MERGE ||
> >  	    type == MTK_DISP_OVL ||
> >  	    type == MTK_DISP_OVL_2L ||
> > +	    type == MTK_DISP_OVL_ADAPTOR ||
> >  	    type == MTK_DISP_PWM ||
> >  	    type == MTK_DISP_RDMA ||
> >  	    type == MTK_DPI ||
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index 4f7fae41c916..1862eba41c45 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
> >  	MTK_DISP_OD,
> >  	MTK_DISP_OVL,
> >  	MTK_DISP_OVL_2L,
> > +	MTK_DISP_OVL_ADAPTOR,
> >  	MTK_DISP_POSTMASK,
> >  	MTK_DISP_PWM,
> >  	MTK_DISP_RDMA,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index a05703843af2..99f37f8f6639 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -351,9 +351,7 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >  {
> >  	struct mtk_drm_private *private = drm->dev_private;
> >  	struct mtk_drm_private *priv_n;
> > -	struct platform_device *pdev;
> > -	struct device_node *np = NULL;
> > -	struct device *dma_dev;
> > +	struct device *dma_dev = NULL;
> >  	int ret, i, j;
> >  
> >  	ret = drmm_mode_config_init(drm);
> > @@ -388,7 +386,6 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >  	 *    different drm private data structures. Loop through crtc
> > index to
> >  	 *    create crtc from the main path and then ext_path and
> > finally the
> >  	 *    third path.
> > -	 * 3. Use OVL device for all DMA memory allocations
> >  	 */
> >  	for (i = 0; i < MAX_CRTC; i++) {
> >  		for (j = 0; j < private->data->mmsys_dev_num; j++) {
> > @@ -400,9 +397,6 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >  				if (ret)
> >  					goto err_component_unbind;
> >  
> > -				if (!np)
> > -					np = priv_n->comp_node[priv_n-
> > > data->main_path[0]];
> > 
> > -
> >  				continue;
> >  			} else if (i == 1 && priv_n->data->ext_len) {
> >  				ret = mtk_drm_crtc_create(drm, priv_n-
> > > data->ext_path,
> > 
> > @@ -410,9 +404,6 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >  				if (ret)
> >  					goto err_component_unbind;
> >  
> > -				if (!np)
> > -					np = priv_n->comp_node[priv_n-
> > > data->ext_path[0]];
> > 
> > -
> >  				continue;
> >  			} else if (i == 2 && priv_n->data->third_len) {
> >  				ret = mtk_drm_crtc_create(drm, priv_n-
> > > data->third_path,
> > 
> > @@ -420,22 +411,19 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >  				if (ret)
> >  					goto err_component_unbind;
> >  
> > -				if (!np)
> > -					np = priv_n->comp_node[priv_n-
> > > data->third_path[0]];
> > 
> > -
> >  				continue;
> >  			}
> >  		}
> >  	}
> >  
> > -	pdev = of_find_device_by_node(np);
> > -	if (!pdev) {
> > +	/* Use OVL device for all DMA memory allocations */
> > +	dma_dev = mtk_drm_crtc_dma_dev_get(drm_crtc_from_index(drm,
> > 0));
> > +	if (!dma_dev) {
> >  		ret = -ENODEV;
> >  		dev_err(drm->dev, "Need at least one OVL device\n");
> >  		goto err_component_unbind;
> >  	}
> >  
> > -	dma_dev = &pdev->dev;
> >  	for (i = 0; i < private->data->mmsys_dev_num; i++)
> >  		private->all_drm_private[i]->dma_dev = dma_dev;
> >  
> > @@ -514,6 +502,11 @@ static int compare_of(struct device *dev, void
> > *data)
> >  	return dev->of_node == data;
> >  }
> >  
> > +static int compare_dev(struct device *dev, void *data)
> > +{
> > +	return dev == (struct device *)data;
> > +}
> > +
> >  static int mtk_drm_bind(struct device *dev)
> >  {
> >  	struct mtk_drm_private *private = dev_get_drvdata(dev);
> > @@ -702,6 +695,7 @@ static int mtk_drm_probe(struct platform_device
> > *pdev)
> >  	struct mtk_drm_private *private;
> >  	struct device_node *node;
> >  	struct component_match *match = NULL;
> > +	struct platform_device *ovl_adaptor;
> >  	int ret;
> >  	int i;
> >  
> > @@ -727,6 +721,18 @@ static int mtk_drm_probe(struct
> > platform_device
> > *pdev)
> >  		return -ENODEV;
> >  	}
> >  
> > +	/* Bringup ovl_adaptor */
> > +	if (mtk_drm_find_mmsys_comp(private,
> > DDP_COMPONENT_OVL_ADAPTOR)) {
> > +		ovl_adaptor = platform_device_register_data(dev,
> > "mediatek-disp-ovl-adaptor",
> > +							    PLATFORM_DE
> > VID_AUTO,
> > +							    (void
> > *)private->mmsys_dev,
> > +							    sizeof(*pri
> > vate->mmsys_dev));
> > +		private->ddp_comp[DDP_COMPONENT_OVL_ADAPTOR].dev =
> > &ovl_adaptor->dev;
> > +		mtk_ddp_comp_init(NULL, &private-
> > > ddp_comp[DDP_COMPONENT_OVL_ADAPTOR],
> > 
> > +				  DDP_COMPONENT_OVL_ADAPTOR);
> > +		component_match_add(dev, &match, compare_dev,
> > &ovl_adaptor->dev);
> > +	}
> > +
> >  	/* Iterate over sibling DISP function blocks */
> >  	for_each_child_of_node(phandle->parent, node) {
> >  		const struct of_device_id *of_id;
> > @@ -780,6 +786,7 @@ static int mtk_drm_probe(struct platform_device
> > *pdev)
> >  		    comp_type == MTK_DISP_MERGE ||
> >  		    comp_type == MTK_DISP_OVL ||
> >  		    comp_type == MTK_DISP_OVL_2L ||
> > +		    comp_type == MTK_DISP_OVL_ADAPTOR ||
> >  		    comp_type == MTK_DISP_RDMA ||
> >  		    comp_type == MTK_DPI ||
> >  		    comp_type == MTK_DSI) {
> > @@ -882,6 +889,7 @@ static struct platform_driver * const
> > mtk_drm_drivers[] = {
> >  	&mtk_disp_color_driver,
> >  	&mtk_disp_gamma_driver,
> >  	&mtk_disp_merge_driver,
> > +	&mtk_disp_ovl_adaptor_driver,
> >  	&mtk_disp_ovl_driver,
> >  	&mtk_disp_rdma_driver,
> >  	&mtk_dpi_driver,
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
