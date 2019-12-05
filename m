Return-Path: <SRS0=lqdO=Z3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB15C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 05:45:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A45562245C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 05:45:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V7aBK3jl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A2/T+2gQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A45562245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iECyZ9tQ8bujiYwbU4iAvyQDDt9aB/tuTnbS2z16xiE=; b=V7aBK3jl/LTZcc
	j9Drs5RlKILpe6ba7mEpvwLu0AnPF/xoNX6/NpV68S3jRiffGcrqWJpeelv3CN24P49wYZFx6Y13z
	fb+xzskKm0dKc00ISGftfEyZW0QSptpLT0jjqm7XFFmSD8Q0QhM/Cy8Dm3eII7LutQI6DXruITEx2
	dNxfPrepjpLmvc17/OJ4/XeKyz1XpGhXIrMoe+qSeJBUS9DJ6CjI/5t/bRqX+rWRTuYBMgF8O5qZe
	Ek3pHQaimD9ZGMQzJ5nADvTeYQTv1zxtAmCOFc/oXOdJVWBe2ykQ96Uyb9wBiwmwwphQPJ8utNXvh
	3UIKUk2LHnlqqNpsg0ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icjwz-0004QE-Vr; Thu, 05 Dec 2019 05:45:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icjwq-0003Wn-Tg; Thu, 05 Dec 2019 05:45:11 +0000
X-UUID: 6bf56341d73343febdb41a236cdfc115-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DMukBWFVgZU4DzzXUc2ShgiywIROlscb4YOByu87/p4=; 
 b=A2/T+2gQ9t2mkR4JREyWfUNk7Pba/h+gDoz5DgGGID9QWt7BZ9fMSi+kPhsZr2WyYzU1shFYhFrMrQ9HTbSA8SWfAoyeeaaO54B5HBxmcoZ4syiADXyDM54X0p85gKj05ZZEbUdeSrVn+Mcyth/L15qF9QCQlvBa9oR9g4Zq4/Q=;
X-UUID: 6bf56341d73343febdb41a236cdfc115-20191204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 596374458; Wed, 04 Dec 2019 21:45:01 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 21:45:51 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 13:44:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Dec 2019 13:44:27 +0800
Message-ID: <1575524697.24783.20.camel@mtksdaap41>
Subject: Re: [PATCH v3 6/6] drm/mediatek: apply CMDQ control flow
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Thu, 5 Dec 2019 13:44:57 +0800
In-Reply-To: <20191204094441.5116-7-bibby.hsieh@mediatek.com>
References: <20191204094441.5116-1-bibby.hsieh@mediatek.com>
 <20191204094441.5116-7-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_214508_977529_CE19DFC7 
X-CRM114-Status: GOOD (  20.24  )
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

On Wed, 2019-12-04 at 17:44 +0800, Bibby Hsieh wrote:
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
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 80 ++++++++++++++++++++++++-
>  1 file changed, 77 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 9f1ff2f3f104..9340346e2727 100644
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
> @@ -59,6 +64,11 @@ struct mtk_crtc_state {
>  	unsigned int			pending_width;
>  	unsigned int			pending_height;
>  	unsigned int			pending_vrefresh;
> +	struct cmdq_pkt			*cmdq_handle;

The handle is just used in mtk_drm_crtc_hw_config(), so I think you need
not to store it in mtk_crtc_state. Make it a local variable in
mtk_drm_crtc_hw_config() is enough.

> +};
> +
> +struct mtk_cmdq_cb_data {
> +	struct cmdq_pkt			*cmdq_handle;
>  };
>  
>  static inline struct mtk_drm_crtc *to_mtk_crtc(struct drm_crtc *c)
> @@ -233,6 +243,47 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
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

Why do you create mtk_cmdq_cb_data{}? You could directly put handle in
cb_date parameter.

> +}
> +#endif
> +
>  static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  {
>  	struct drm_crtc *crtc = &mtk_crtc->base;
> @@ -393,7 +444,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
>  	if (state->pending_config) {
>  		mtk_ddp_comp_config(comp, state->pending_width,
>  				    state->pending_height,
> -				    state->pending_vrefresh, 0, NULL);
> +				    state->pending_vrefresh, 0,
> +				    state->cmdq_handle);
>  
>  		state->pending_config = false;
>  	}
> @@ -413,7 +465,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
>  
>  			if (comp)
>  				mtk_ddp_comp_layer_config(comp, local_layer,
> -							  plane_state, NULL);
> +							  plane_state,
> +							  state->cmdq_handle);
>  			plane_state->pending.config = false;
>  		}
>  		mtk_crtc->pending_planes = false;
> @@ -452,6 +505,13 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
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
>  	mutex_unlock(&mtk_crtc->hw_lock);
>  }
>  
> @@ -528,6 +588,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>  	mtk_crtc->pending_planes = true;
>  
>  	/* Wait for planes to be disabled */
> +	mtk_drm_crtc_hw_config(mtk_crtc);

I think shadow register has the same problem, so I would like to move
this part to an independent patch which fix shadow register problem. And
I think this statement should be moved before the comment because this
statement does not doing wait.

>  	drm_crtc_wait_one_vblank(crtc);
>  
>  	drm_crtc_vblank_off(crtc);
> @@ -619,7 +680,7 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
>  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>  	struct mtk_drm_private *priv = crtc->dev->dev_private;
>  
> -	if (!priv->data->shadow_register)
> +	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
>  		mtk_crtc_ddp_config(crtc);
>  
>  	mtk_drm_finish_page_flip(mtk_crtc);
> @@ -763,5 +824,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	priv->num_pipes++;
>  	mutex_init(&mtk_crtc->hw_lock);
>  
> +#ifdef CONFIG_MTK_CMDQ
> +	mtk_crtc->cmdq_client =
> +			cmdq_mbox_create(dev, drm_crtc_index(&mtk_crtc->base),
> +					 2000);
> +	of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
> +				   drm_crtc_index(&mtk_crtc->base),
> +				   &mtk_crtc->cmdq_event);

Check the return value.

Regards,
CK

> +	if (IS_ERR(mtk_crtc->cmdq_client)) {
> +		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
> +			drm_crtc_index(&mtk_crtc->base));
> +		mtk_crtc->cmdq_client = NULL;
> +	}
> +#endif
>  	return 0;
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
