Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE11C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 01:38:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54AA0206E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 01:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o5MAdtCC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j51GpkAS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54AA0206E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31fF8c/D9oMIi51BUdd6ToK2aCeSsdQN6yTxd7J/XVY=; b=o5MAdtCC5XZPBd
	tQWsYkTSkUNMjI4AcvwNK9muymYUTpaAVzzG9qGMWXxAfi49G4QBWI2vbtpdke1OCVbFfTZHf9d8h
	0y2PI3AnzTmz82z9sVmBC2f/bnKFKuL+udbBOIhRnqYg4rEoPdxCIKfRKJkH7P/3qV4FfNQWs5E0K
	hk22WHzjejPfj9E/4sa9UTI7M0+UrNuJKKZ1X5635RKKSM0rYxxdmPyQVN4VVR08IMSneVvuzgTyM
	8pbc2q30uteRw0U0S4akUww+e2uUKsCDfYAW5DSgOgPfmspKmKif7/ufipMYJK4CHiC+w2bgoYfdl
	cQ6YUr8sM3ubgZJG+D7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibx9O-0005tF-R3; Tue, 03 Dec 2019 01:38:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibx9G-0005lb-Bg; Tue, 03 Dec 2019 01:38:44 +0000
X-UUID: 0b6a9646575d4ea9a30f1f2f0f9a112b-20191202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sRwMLRyS13CHATbRSBNDwYj8Xi6G067HZgFuCYy6r9Q=; 
 b=j51GpkASqoKybtF0UEFO5GYzvYBVHTZAb0ja5+kX1aCTTMcI8k3yfEYB6avjzwA7Fnp7fMi9JgRoJ0HY1S0n3xJBZa9CksS1dbRyIoi9WY8Mvkkp6EJWqZ7VNqCYD1UHjvDxS16fa5ZjdZhfHY6Gu7d64/Q7Eq/hs3nTC3X2XVw=;
X-UUID: 0b6a9646575d4ea9a30f1f2f0f9a112b-20191202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1075197562; Mon, 02 Dec 2019 17:38:37 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 17:38:47 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 09:38:19 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Dec 2019 09:38:14 +0800
Message-ID: <1575337114.1155.4.camel@mtksdaap41>
Subject: Re: [PATCH v1 6/6] drm/mediatek: apply CMDQ control flow
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Tue, 3 Dec 2019 09:38:34 +0800
In-Reply-To: <20191128024238.9399-7-bibby.hsieh@mediatek.com>
References: <20191128024238.9399-1-bibby.hsieh@mediatek.com>
 <20191128024238.9399-7-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_173842_413419_F9D554DF 
X-CRM114-Status: GOOD (  20.42  )
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
Cc: drinkcat@chromium.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Thu, 2019-11-28 at 10:42 +0800, Bibby Hsieh wrote:
> Unlike other SoCs, MT8183 does not have "shadow"
> registers for performaing an atomic video mode
> set or page flip at vblank/vsync.
> 
> The CMDQ (Commend Queue) in MT8183 is used to help
> update all relevant display controller registers
> with critical time limation.
> 
> Signed-off-by: YT Shen <yt.shen@mediatek.com>
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 86 ++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 31 ++++++++
>  2 files changed, 113 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index fcf4e755e0bd..1b4e537ac3c1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -12,6 +12,8 @@
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> +#include <linux/of_address.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
>  
>  #include "mtk_drm_drv.h"
>  #include "mtk_drm_crtc.h"
> @@ -42,6 +44,9 @@ struct mtk_drm_crtc {
>  	unsigned int			layer_nr;
>  	bool				pending_planes;
>  
> +	struct cmdq_client		*cmdq_client;
> +	u32				cmdq_event;
> +
>  	void __iomem			*config_regs;
>  	const struct mtk_mmsys_reg_data *mmsys_reg_data;
>  	struct mtk_disp_mutex		*mutex;
> @@ -56,6 +61,11 @@ struct mtk_crtc_state {
>  	unsigned int			pending_width;
>  	unsigned int			pending_height;
>  	unsigned int			pending_vrefresh;
> +	struct cmdq_pkt			*cmdq_handle;
> +};
> +
> +struct mtk_cmdq_cb_data {
> +	struct cmdq_pkt			*cmdq_handle;
>  };
>  
>  static inline struct mtk_drm_crtc *to_mtk_crtc(struct drm_crtc *c)
> @@ -229,6 +239,46 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
>  	return NULL;
>  }
>  
> +#ifdef CONFIG_MTK_CMDQ
> +static void ddp_cmdq_cb(struct cmdq_cb_data data)
> +{
> +	struct mtk_cmdq_cb_data *cb_data = data.data;
> +
> +	cmdq_pkt_destroy(cb_data->cmdq_handle);
> +	kfree(cb_data);
> +}
> +
> +static void mtk_cmdq_acquire(struct drm_crtc *crtc)
> +{
> +	struct mtk_crtc_state *mtk_crtc_state =
> +			to_mtk_crtc_state(crtc->state);
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +
> +	mtk_crtc_state->cmdq_handle =
> +			cmdq_pkt_create(mtk_crtc->cmdq_client,
> +					PAGE_SIZE);

I would like to remove atomic feature in cmdq driver and drm driver
could reuse the pkt. Please refer to [1] for detail.

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2019-January/016866.html

> +	cmdq_pkt_clear_event(mtk_crtc_state->cmdq_handle,
> +			     mtk_crtc->cmdq_event);
> +	cmdq_pkt_wfe(mtk_crtc_state->cmdq_handle, mtk_crtc->cmdq_event);
> +}
> +
> +static void mtk_cmdq_release(struct drm_crtc *crtc)
> +{
> +	struct mtk_crtc_state *mtk_crtc_state =
> +			to_mtk_crtc_state(crtc->state);
> +	struct mtk_cmdq_cb_data *cb_data;
> +
> +	cb_data = kmalloc(sizeof(*cb_data), GFP_KERNEL);
> +	if (!cb_data) {
> +		DRM_DEV_ERROR(crtc->dev->dev, "Failed to alloc cb_data\n");
> +		return;
> +	}
> +
> +	cb_data->cmdq_handle = mtk_crtc_state->cmdq_handle;
> +	cmdq_pkt_flush_async(mtk_crtc_state->cmdq_handle,
> +			     ddp_cmdq_cb, cb_data);
> +}
> +#endif
>  static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  {
>  	struct drm_crtc *crtc = &mtk_crtc->base;
> @@ -383,7 +433,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
>  	if (state->pending_config) {
>  		mtk_ddp_comp_config(comp, state->pending_width,
>  				    state->pending_height,
> -				    state->pending_vrefresh, 0, NULL);
> +				    state->pending_vrefresh, 0,
> +				    state->cmdq_handle);
>  
>  		state->pending_config = false;
>  	}
> @@ -403,7 +454,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
>  
>  			if (comp)
>  				mtk_ddp_comp_layer_config(comp, local_layer,
> -							  plane_state, NULL);
> +							  plane_state,
> +							  state->cmdq_handle);
>  			plane_state->pending.config = false;
>  		}
>  		mtk_crtc->pending_planes = false;
> @@ -454,6 +506,13 @@ void mtk_drm_crtc_cursor_update(struct drm_crtc *crtc, struct drm_plane *plane,
>  		mtk_crtc_ddp_config(crtc);
>  		mtk_disp_mutex_release(mtk_crtc->mutex);
>  	}
> +#ifdef CONFIG_MTK_CMDQ
> +	if (mtk_crtc->cmdq_client) {
> +		mtk_cmdq_acquire(crtc);
> +		mtk_crtc_ddp_config(crtc);
> +		mtk_cmdq_release(crtc);
> +	}
> +#endif
>  	mutex_unlock(&priv->hw_lock);
>  }
>  
> @@ -570,6 +629,13 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  		mtk_crtc_ddp_config(crtc);
>  		mtk_disp_mutex_release(mtk_crtc->mutex);
>  	}
> +#ifdef CONFIG_MTK_CMDQ
> +	if (mtk_crtc->cmdq_client) {
> +		mtk_cmdq_acquire(crtc);
> +		mtk_crtc_ddp_config(crtc);
> +		mtk_cmdq_release(crtc);
> +	}
> +#endif

This part is almost the same as the one in mtk_drm_crtc_cursor_update(),
try to merge them.

>  }
>  
>  static const struct drm_crtc_funcs mtk_crtc_funcs = {
> @@ -619,7 +685,7 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
>  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>  	struct mtk_drm_private *priv = crtc->dev->dev_private;
>  
> -	if (!priv->data->shadow_register)
> +	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
>  		mtk_crtc_ddp_config(crtc);
>  
>  	mtk_drm_finish_page_flip(mtk_crtc);
> @@ -761,6 +827,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
>  	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
>  	priv->num_pipes++;
> -
> +#ifdef CONFIG_MTK_CMDQ
> +	mtk_crtc->cmdq_client =
> +			cmdq_mbox_create(dev, drm_crtc_index(&mtk_crtc->base),
> +					 2000);
> +	of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
> +				   drm_crtc_index(&mtk_crtc->base),
> +				   &mtk_crtc->cmdq_event);
> +	if (IS_ERR(mtk_crtc->cmdq_client)) {
> +		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
> +			drm_crtc_index(&mtk_crtc->base));
> +		mtk_crtc->cmdq_client = NULL;
> +	}
> +#endif
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 6d0f349ddf82..9cc12af2bc06 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -370,6 +370,9 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
>  		      const struct mtk_ddp_comp_funcs *funcs)
>  {
>  	struct platform_device *comp_pdev;
> +	struct resource res;
> +	struct cmdq_client_reg *cmdq_reg;
> +	int ret = 0;
>  
>  	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
>  		return -EINVAL;
> @@ -404,6 +407,34 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
>  	}
>  	comp->dev = &comp_pdev->dev;
>  
> +#ifdef CONFIG_MTK_CMDQ
> +	if (of_address_to_resource(node, 0, &res) != 0) {
> +		dev_err(dev, "Missing reg in %s node\n",
> +			node->full_name);
> +		return -EINVAL;
> +	}
> +	comp->regs_pa = res.start;
> +
> +	comp_pdev = of_find_device_by_node(node);
> +	if (!comp_pdev) {
> +		dev_warn(dev, "Waiting for component device %s\n",
> +			 node->full_name);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	cmdq_reg = kzalloc(sizeof(*cmdq_reg), GFP_KERNEL);
> +	if (!cmdq_reg)
> +		return -EINVAL;
> +
> +	ret = cmdq_dev_get_client_reg(&comp_pdev->dev, cmdq_reg, 0);
> +	if (ret != 0)
> +		dev_dbg(&comp_pdev->dev,
> +			"get mediatek,gce-client-reg fail!\n");
> +	else
> +		comp->subsys = cmdq_reg->subsys;
> +
> +	kfree(cmdq_reg);
> +#endif

I would like to move this part to the patch "drm/mediatek: support CMDQ
interface in ddp component".

Regards,
CK

>  	return 0;
>  }
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
