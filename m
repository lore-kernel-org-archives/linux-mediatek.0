Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rUUd6zVGwS3ja11ZILL53JFsGJOl8IN9xa+WR6G6HE=; b=R2CSjEZ48pAKGf
	jqauADWHdB4afCxbq7sweifmQImO9eoePfY190MdDSZwuI+JDEE1UDDW0D4tV8kMsjPPz6rfj2l8I
	jlRoujj/NrND+n9K7lmuyAOiiLawKhGsbGSTqEIdPh+KEXCNP8/qJkIUQ49RxgN38qKYnJC7t6m+n
	FVik6oR6Nhgb2QROuWQ3NGMnmb8PT+SsuHbD4pcCZNarC/oHyiKeaWxPt+zakcLr29jUny9i+8svJ
	8DzwaonZ+/TSwVnUVMRsiI+XZII3wySgpSkgS1Vp9fhmVEnvupWRomqvfq3ga6leaWqQWmVmGgZSb
	B22A/uV/s41B8Pza1xGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMPSO-008IXr-Ga; Tue, 22 Feb 2022 07:19:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMPSL-008IWP-1a; Tue, 22 Feb 2022 07:19:31 +0000
X-UUID: a173a710bb04464fb5c5bc43a08539de-20220222
X-UUID: a173a710bb04464fb5c5bc43a08539de-20220222
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 891107178; Tue, 22 Feb 2022 00:19:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 23:19:21 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 22 Feb 2022 15:19:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Feb 2022 15:19:20 +0800
Message-ID: <3eed2464d42ed62d43bd4597252e2e88350e9c67.camel@mediatek.com>
Subject: Re: [PATCH v11 20/22] drm/mediatek: add drm ovl_adaptor sub driver
 for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Tue, 22 Feb 2022 15:19:20 +0800
In-Reply-To: <fd111ceb9cb5afa1a5d2c0b4b978bcea46cd109f.camel@mediatek.com>
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-21-nancy.lin@mediatek.com>
 <fd111ceb9cb5afa1a5d2c0b4b978bcea46cd109f.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_231929_104506_145C5CD7 
X-CRM114-Status: GOOD (  33.97  )
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

Hi, Chun-Kuang,

Thanks for the review.

On Fri, 2022-01-14 at 13:47 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Mon, 2022-01-10 at 16:46 +0800, Nancy.Lin wrote:
> > Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> > the component exists in the path.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 16 ++++----
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 30 ++++++++++++---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 41 +++++++++++++++--
> > ----
> >  4 files changed, 62 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index fe2871aca859..62529a954b62 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -877,15 +877,13 @@ int mtk_drm_crtc_create(struct drm_device
> > *drm_dev,
> >  		node = priv->comp_node[comp_id];
> >  		comp = &priv->ddp_comp[comp_id];
> >  
> > -		if (!node) {
> 
> if (!node && comp_id != MTK_DISP_OVL_ADAPTOR)
> 
OK
> > -			dev_info(dev,
> > -				 "Not creating crtc %d because
> > component %d is disabled or missing\n",
> > -				 crtc_i, comp_id);
> > -			return 0;
> > -		}
> > -
> > -		if (!comp->dev) {
> > -			dev_err(dev, "Component %pOF not
> > initialized\n", node);
> > +		/* Not all drm components have a DTS device node, such
> > as ovl_adaptor,
> > +		 * which is the drm bring up sub driver
> > +		 */
> > +		if (!node && !comp->dev) {
> > +			dev_err(dev,
> > +				"Not creating crtc %d because component
> > %d is disabled, missing or not initialized\n",
> > +				crtc_i, comp_id);
> >  			return -ENODEV;
> >  		}
> >  	}
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 26d197da41c0..ce40bab9c56b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -385,6 +385,18 @@ static const struct mtk_ddp_comp_funcs
> > ddp_ufoe
> > = {
> >  	.start = mtk_ufoe_start,
> >  };
> >  
> > +static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
> > +	.clk_enable = mtk_ovl_adaptor_clk_enable,
> > +	.clk_disable = mtk_ovl_adaptor_clk_disable,
> > +	.config = mtk_ovl_adaptor_config,
> > +	.start = mtk_ovl_adaptor_start,
> > +	.stop = mtk_ovl_adaptor_stop,
> > +	.layer_nr = mtk_ovl_adaptor_layer_nr,
> > +	.layer_config = mtk_ovl_adaptor_layer_config,
> > +	.enable_vblank = mtk_ovl_adaptor_enable_vblank,
> > +	.disable_vblank = mtk_ovl_adaptor_disable_vblank,
> > +};
> > +
> >  static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX]
> > =
> > {
> >  	[MTK_DISP_AAL] = "aal",
> >  	[MTK_DISP_BLS] = "bls",
> > @@ -398,6 +410,7 @@ static const char * const
> > mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
> >  	[MTK_DISP_OD] = "od",
> >  	[MTK_DISP_OVL] = "ovl",
> >  	[MTK_DISP_OVL_2L] = "ovl-2l",
> > +	[MTK_DISP_OVL_ADAPTOR] = "ovl_adaptor",
> >  	[MTK_DISP_POSTMASK] = "postmask",
> >  	[MTK_DISP_PWM] = "pwm",
> >  	[MTK_DISP_RDMA] = "rdma",
> > @@ -443,6 +456,7 @@ static const struct mtk_ddp_comp_match
> > mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> >  	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0,
> > &ddp_ovl },
> >  	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1,
> > &ddp_ovl },
> >  	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2,
> > &ddp_ovl },
> > +	[DDP_COMPONENT_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	
> > 0, &ddp_ovl_adaptor },
> >  	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0,
> > &ddp_postmask },
> >  	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0,
> > NULL },
> >  	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1,
> > NULL },
> > @@ -548,12 +562,17 @@ int mtk_ddp_comp_init(struct device_node
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
> > @@ -573,6 +592,7 @@ int mtk_ddp_comp_init(struct device_node *node,
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
> > index 221e2e3a3c8d..5e1404dc20c4 100644
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
> > index a05703843af2..36430f956b4f 100644
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
> > @@ -400,8 +398,8 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >  				if (ret)
> >  					goto err_component_unbind;
> >  
> > -				if (!np)
> > -					np = priv_n->comp_node[priv_n-
> > > data->main_path[0]];
> > 
> > +				if (!dma_dev)
> > +					dma_dev = priv_n-
> > > ddp_comp[priv_n->data->main_path[0]].dev;
> > 
> >  
> >  				continue;
> >  			} else if (i == 1 && priv_n->data->ext_len) {
> > @@ -410,8 +408,8 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >  				if (ret)
> >  					goto err_component_unbind;
> >  
> > -				if (!np)
> > -					np = priv_n->comp_node[priv_n-
> > > data->ext_path[0]];
> > 
> > +				if (!dma_dev)
> > +					dma_dev = priv_n-
> > > ddp_comp[priv_n->data->ext_path[0]].dev;
> > 
> >  
> >  				continue;
> >  			} else if (i == 2 && priv_n->data->third_len) {
> > @@ -420,22 +418,20 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >  				if (ret)
> >  					goto err_component_unbind;
> >  
> > -				if (!np)
> > -					np = priv_n->comp_node[priv_n-
> > > data->third_path[0]];
> > 
> > +				if (!dma_dev)
> > +					dma_dev = priv_n-
> > > ddp_comp[priv_n->data->third_path[0]].dev;
> > 
> >  
> >  				continue;
> >  			}
> >  		}
> >  	}
> >  
> > -	pdev = of_find_device_by_node(np);
> > -	if (!pdev) {
> > +	if (!dma_dev) {
> 
> I don't know how ovl_adaptor could provide the dma function. As I
> know,
> dma device has a device node, and there is iommu property in that
> node.

I will add new function for getting ovl_adaptor sub driver's dma dev.
> 
> >  		ret = -ENODEV;
> >  		dev_err(drm->dev, "Need at least one OVL device\n");
> >  		goto err_component_unbind;
> >  	}
> >  
> > -	dma_dev = &pdev->dev;
> >  	for (i = 0; i < private->data->mmsys_dev_num; i++)
> >  		private->all_drm_private[i]->dma_dev = dma_dev;
> >  
> > @@ -514,6 +510,11 @@ static int compare_of(struct device *dev, void
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
> > @@ -702,6 +703,7 @@ static int mtk_drm_probe(struct platform_device
> > *pdev)
> >  	struct mtk_drm_private *private;
> >  	struct device_node *node;
> >  	struct component_match *match = NULL;
> > +	struct platform_device *ovl_adaptor;
> >  	int ret;
> >  	int i;
> >  
> > @@ -727,6 +729,19 @@ static int mtk_drm_probe(struct
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
> > +		private->comp_node[DDP_COMPONENT_OVL_ADAPTOR] =
> > ovl_adaptor->dev.of_node;
> 
> private->comp_node[DDP_COMPONENT_OVL_ADAPTOR] = NULL;
> 
> Regards,
> CK
> 
OK
Regards,
Nancy

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
> > @@ -780,6 +795,7 @@ static int mtk_drm_probe(struct platform_device
> > *pdev)
> >  		    comp_type == MTK_DISP_MERGE ||
> >  		    comp_type == MTK_DISP_OVL ||
> >  		    comp_type == MTK_DISP_OVL_2L ||
> > +		    comp_type == MTK_DISP_OVL_ADAPTOR ||
> >  		    comp_type == MTK_DISP_RDMA ||
> >  		    comp_type == MTK_DPI ||
> >  		    comp_type == MTK_DSI) {
> > @@ -882,6 +898,7 @@ static struct platform_driver * const
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
