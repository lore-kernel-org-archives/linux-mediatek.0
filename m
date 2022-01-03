Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FEAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7d7J4icwj9oWuQWcq8f5xdqggWi6XuC3rDDxk2aLNw=; b=mMkpojUbypSJDH
	4kBUx3R4O2Mgnzegngh+Do0msAYZgYBoG+gmUoRiqI1lM8F2BVUFueZG1U+hMkxKcnKX5wjwVhrNh
	3PNgqZDaHplMeMYnsyLYf5PQ/p4nKGXGCNciVTFZaZHtz0dD+UYVYxFKvebqJwdMejOEI9hizpmJg
	ZWH5Fk6Cc0GtlnKVxcZ6RIONhD0840FKPhjbC824MLipOOpExZa4FgkY+Lm3mvtM4WK84vCtpnaDK
	NDyXF/ZcoRvjJ4v7NQJERz/ovOC89Uc4sVK85V5GsyJ6UTClzLySp85Cp6ctMKSG8oqJfuxu5ahmK
	r+yGgGL2pNL9CKfehaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4JGB-008d6e-ES; Mon, 03 Jan 2022 09:04:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4JG6-008d5U-QQ; Mon, 03 Jan 2022 09:04:05 +0000
X-UUID: 22fae6425f6f4999accdea8bed3d72fe-20220103
X-UUID: 22fae6425f6f4999accdea8bed3d72fe-20220103
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 824673371; Mon, 03 Jan 2022 02:04:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Jan 2022 01:03:58 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 3 Jan 2022 17:03:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Jan 2022 17:03:57 +0800
Message-ID: <9ea6439ba4e7cc73c2bba7899eacee37173683bc.camel@mediatek.com>
Subject: Re: [PATCH v10 19/22] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Mon, 3 Jan 2022 17:03:57 +0800
In-Reply-To: <20211208024426.15595-20-nancy.lin@mediatek.com>
References: <20211208024426.15595-1-nancy.lin@mediatek.com>
 <20211208024426.15595-20-nancy.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_010402_904182_3AC2E8CE 
X-CRM114-Status: GOOD (  25.81  )
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

Hi, Nancy:

On Wed, 2021-12-08 at 10:44 +0800, Nancy.Lin wrote:
> MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> only one drm driver register as the drm device.
> Each drm driver binds its own component. The last bind drm driver
> allocates and registers the drm device to drm core.
> Each crtc path is created with the corresponding drm driver data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  24 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h |   3 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 300 ++++++++++++++++++--
> ----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  10 +-
>  4 files changed, 246 insertions(+), 91 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d661edf7e0fe..fe2871aca859 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -847,21 +847,28 @@ static int mtk_drm_crtc_init_comp_planes(struct
> drm_device *drm_dev,
>  }
>  
>  int mtk_drm_crtc_create(struct drm_device *drm_dev,
> -			const enum mtk_ddp_comp_id *path, unsigned int
> path_len)
> +			const enum mtk_ddp_comp_id *path, unsigned int
> path_len,
> +			int priv_data_index)
>  {
>  	struct mtk_drm_private *priv = drm_dev->dev_private;
>  	struct device *dev = drm_dev->dev;
>  	struct mtk_drm_crtc *mtk_crtc;
>  	unsigned int num_comp_planes = 0;
> -	int pipe = priv->num_pipes;
>  	int ret;
>  	int i;
>  	bool has_ctm = false;
>  	uint gamma_lut_size = 0;
> +	struct drm_crtc *tmp;
> +	int crtc_i = 0;
>  
>  	if (!path)
>  		return 0;
>  
> +	priv = priv->all_drm_private[priv_data_index];
> +
> +	drm_for_each_crtc(tmp, drm_dev)
> +		crtc_i++;
> +
>  	for (i = 0; i < path_len; i++) {
>  		enum mtk_ddp_comp_id comp_id = path[i];
>  		struct device_node *node;
> @@ -873,7 +880,7 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  		if (!node) {
>  			dev_info(dev,
>  				 "Not creating crtc %d because
> component %d is disabled or missing\n",
> -				 pipe, comp_id);
> +				 crtc_i, comp_id);
>  			return 0;
>  		}
>  
> @@ -926,29 +933,28 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  		ret = mtk_drm_crtc_init_comp_planes(drm_dev, mtk_crtc,
> i,
> -						    pipe);
> +						    crtc_i);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> +	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, crtc_i);
>  	if (ret < 0)
>  		return ret;
>  
>  	if (gamma_lut_size)
>  		drm_mode_crtc_set_gamma_size(&mtk_crtc->base,
> gamma_lut_size);
>  	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm,
> gamma_lut_size);
> -	priv->num_pipes++;
>  	mutex_init(&mtk_crtc->hw_lock);
>  
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	i = (priv->data->mbox_index) ? priv->data-
> >mbox_index[drm_crtc_index(&mtk_crtc->base)] : 0;
>  	mtk_crtc->cmdq_client.client.dev = mtk_crtc->mmsys_dev;
>  	mtk_crtc->cmdq_client.client.tx_block = false;
>  	mtk_crtc->cmdq_client.client.knows_txdone = true;
>  	mtk_crtc->cmdq_client.client.rx_callback = ddp_cmdq_cb;
>  	mtk_crtc->cmdq_client.chan =
> -			mbox_request_channel(&mtk_crtc-
> >cmdq_client.client,
> -					     drm_crtc_index(&mtk_crtc-
> >base));
> +			mbox_request_channel(&mtk_crtc-
> >cmdq_client.client, i);

I really do not understand how does i work. Could you give an example
of the i value for mt8173 crtc0, mt8173 crtc1, and all mt8195 crtcs.

>  	if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
>  		dev_dbg(dev, "mtk_crtc %d failed to create mailbox
> client, writing register by CPU now\n",
>  			drm_crtc_index(&mtk_crtc->base));
> @@ -958,7 +964,7 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  	if (mtk_crtc->cmdq_client.chan) {
>  		ret = of_property_read_u32_index(priv->mutex_node,
>  						 "mediatek,gce-events",
> -						 drm_crtc_index(&mtk_cr
> tc->base),
> +						 i,
>  						 &mtk_crtc-
> >cmdq_event);
>  		if (ret) {
>  			dev_dbg(dev, "mtk_crtc %d failed to get
> mediatek,gce-events property\n",
> 

[snip]

>  
>  static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data
> = {
>  	.main_path = mt8195_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
> +	.mmsys_dev_num = 2,

After this patch, vdosys0 would not work. So set this to 1 in this
patch, and set this to 2 in the mt8195 vdosys1 patch.

Regards,
CK

>  };
>  
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
