Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 01:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hcw4eL6uTid6w2B7dY5SdvArfIDuCSOBxkJKvSYWs1g=; b=PckMaUh9QNtbpz
	+jiiKXn0i9YcS8VRKtoLOLPduR07knYUMbYrDPf5+AZrwWQoPhO27yUR2b09Qhffm/pr3KWkfithj
	P/xhYYoGcXCWEmgZNLAxEy5NvZEHht4tGUYdiqwTS05NVC1Kb8lxvLiQmZllq+zkbrBGcKmMxI+j3
	I9FDNCtmjBorUma9Gv7EL/FJbBwkk9J5PAoOwX56SVbUHzhl7imvhYztUzFdV0UdCy/GMzkJO9rmo
	DcKFIUOdI03HFQtWynMM39VLL2vy95BbyCQ4C5c27Jt3lmwhmjQ2J+iTdEMQVkU5UqeYCZyEwJXm2
	uKCabD5DmAOzpUPaXvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncHD1-008jv2-0j; Thu, 07 Apr 2022 01:45:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncGoI-008Ybk-Vn; Thu, 07 Apr 2022 01:19:45 +0000
X-UUID: 7de73a795b32403482047266d2615aa0-20220406
X-UUID: 7de73a795b32403482047266d2615aa0-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 135157543; Wed, 06 Apr 2022 18:19:33 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 18:09:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 09:09:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 09:09:29 +0800
Message-ID: <fc73b7f102ba6451e16ab55af091748405bcc5de.camel@mediatek.com>
Subject: Re: [PATCH V2] drm/mediatek: Add vblank register/unregister
 callback functions
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>
CC: <airlied@linux.ie>, <jason-jh.lin@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <nancy.lin@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <yongqiang.niu@mediatek.com>, <hsinyi@google.com>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 7 Apr 2022 09:09:29 +0800
In-Reply-To: <20220321072320.15019-1-rex-bc.chen@mediatek.com>
References: <20220321072320.15019-1-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_181943_071727_4CD67B83 
X-CRM114-Status: GOOD (  24.72  )
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

Hi, Rex:

On Mon, 2022-03-21 at 15:23 +0800, Rex-BC Chen wrote:
> We encountered a kernel panic issue that callback data will be NULL
> when
> it's using in ovl irq handler. There is a timing issue between
> mtk_disp_ovl_irq_handler() and mtk_ovl_disable_vblank().
> 
> To resolve this issue, we use the flow to register/unregister vblank
> cb:
> - Register callback function and callback data when crtc creates.
> - Unregister callback function and callback data when crtc destroies.
> 
> With this solution, we can assure callback data will not be NULL when
> vblank is disable.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Fixes: 9b0704988b15 ("drm/mediatek: Register vblank callback
> function")
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> 
> ----
> V2:
> 1. Change title to "Add vblank register/unregister callback
> functions".
> ----
> 
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 16 +++++++-----
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 22 ++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 20 +++++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 14 +++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 29 ++++++++++++++++---
> --
>  6 files changed, 80 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 86c3068894b1..974462831133 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -76,9 +76,11 @@ void mtk_ovl_layer_off(struct device *dev,
> unsigned int idx,
>  void mtk_ovl_start(struct device *dev);
>  void mtk_ovl_stop(struct device *dev);
>  unsigned int mtk_ovl_supported_rotations(struct device *dev);
> -void mtk_ovl_enable_vblank(struct device *dev,
> -			   void (*vblank_cb)(void *),
> -			   void *vblank_cb_data);
> +void mtk_ovl_register_vblank_cb(struct device *dev,
> +				void (*vblank_cb)(void *),
> +				void *vblank_cb_data);
> +void mtk_ovl_unregister_vblank_cb(struct device *dev);
> +void mtk_ovl_enable_vblank(struct device *dev);
>  void mtk_ovl_disable_vblank(struct device *dev);
>  
>  void mtk_rdma_bypass_shadow(struct device *dev);
> @@ -93,9 +95,11 @@ void mtk_rdma_layer_config(struct device *dev,
> unsigned int idx,
>  			   struct cmdq_pkt *cmdq_pkt);
>  void mtk_rdma_start(struct device *dev);
>  void mtk_rdma_stop(struct device *dev);
> -void mtk_rdma_enable_vblank(struct device *dev,
> -			    void (*vblank_cb)(void *),
> -			    void *vblank_cb_data);
> +void mtk_rdma_register_vblank_cb(struct device *dev,
> +				 void (*vblank_cb)(void *),
> +				 void *vblank_cb_data);
> +void mtk_rdma_unregister_vblank_cb(struct device *dev);
> +void mtk_rdma_enable_vblank(struct device *dev);
>  void mtk_rdma_disable_vblank(struct device *dev);
>  
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 2146299e5f52..1fa1bbac9f9c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -96,14 +96,28 @@ static irqreturn_t mtk_disp_ovl_irq_handler(int
> irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -void mtk_ovl_enable_vblank(struct device *dev,
> -			   void (*vblank_cb)(void *),
> -			   void *vblank_cb_data)
> +void mtk_ovl_register_vblank_cb(struct device *dev,
> +				void (*vblank_cb)(void *),
> +				void *vblank_cb_data)
>  {
>  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>  
>  	ovl->vblank_cb = vblank_cb;
>  	ovl->vblank_cb_data = vblank_cb_data;
> +}
> +
> +void mtk_ovl_unregister_vblank_cb(struct device *dev)
> +{
> +	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
> +
> +	ovl->vblank_cb = NULL;
> +	ovl->vblank_cb_data = NULL;
> +}
> +
> +void mtk_ovl_enable_vblank(struct device *dev)
> +{
> +	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
> +
>  	writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
>  	writel_relaxed(OVL_FME_CPL_INT, ovl->regs +
> DISP_REG_OVL_INTEN);
>  }
> @@ -112,8 +126,6 @@ void mtk_ovl_disable_vblank(struct device *dev)
>  {
>  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>  
> -	ovl->vblank_cb = NULL;
> -	ovl->vblank_cb_data = NULL;
>  	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
>  }
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index d41a3970b944..943780fc7bf6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -94,24 +94,32 @@ static void rdma_update_bits(struct device *dev,
> unsigned int reg,
>  	writel(tmp, rdma->regs + reg);
>  }
>  
> -void mtk_rdma_enable_vblank(struct device *dev,
> -			    void (*vblank_cb)(void *),
> -			    void *vblank_cb_data)
> +void mtk_rdma_register_vblank_cb(struct device *dev,
> +				 void (*vblank_cb)(void *),
> +				 void *vblank_cb_data)
>  {
>  	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
>  
>  	rdma->vblank_cb = vblank_cb;
>  	rdma->vblank_cb_data = vblank_cb_data;
> -	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE,
> RDMA_FRAME_END_INT,
> -			 RDMA_FRAME_END_INT);
>  }
>  
> -void mtk_rdma_disable_vblank(struct device *dev)
> +void mtk_rdma_unregister_vblank_cb(struct device *dev)
>  {
>  	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
>  
>  	rdma->vblank_cb = NULL;
>  	rdma->vblank_cb_data = NULL;
> +}
> +
> +void mtk_rdma_enable_vblank(struct device *dev)
> +{
> +	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE,
> RDMA_FRAME_END_INT,
> +			 RDMA_FRAME_END_INT);
> +}
> +
> +void mtk_rdma_disable_vblank(struct device *dev)
> +{
>  	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE,
> RDMA_FRAME_END_INT, 0);
>  }
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d661edf7e0fe..e42a9bfa0ecb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -152,6 +152,7 @@ static void mtk_drm_cmdq_pkt_destroy(struct
> cmdq_pkt *pkt)
>  static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
>  {
>  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	int i;
>  
>  	mtk_mutex_put(mtk_crtc->mutex);
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> @@ -162,6 +163,14 @@ static void mtk_drm_crtc_destroy(struct drm_crtc
> *crtc)
>  		mtk_crtc->cmdq_client.chan = NULL;
>  	}
>  #endif
> +
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +		struct mtk_ddp_comp *comp;
> +
> +		comp = mtk_crtc->ddp_comp[i];
> +		mtk_ddp_comp_unregister_vblank_cb(comp);
> +	}
> +
>  	drm_crtc_cleanup(crtc);
>  }
>  
> @@ -616,7 +625,7 @@ static int mtk_drm_crtc_enable_vblank(struct
> drm_crtc *crtc)
>  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>  	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
>  
> -	mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc-
> >base);
> +	mtk_ddp_comp_enable_vblank(comp);
>  
>  	return 0;
>  }
> @@ -916,6 +925,9 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  			if (comp->funcs->ctm_set)
>  				has_ctm = true;
>  		}
> +
> +		mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
> +						&mtk_crtc->base);
>  	}
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index b4b682bc1991..028cf76b9531 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -297,6 +297,8 @@ static const struct mtk_ddp_comp_funcs ddp_ovl =
> {
>  	.config = mtk_ovl_config,
>  	.start = mtk_ovl_start,
>  	.stop = mtk_ovl_stop,
> +	.register_vblank_cb = mtk_ovl_register_vblank_cb,
> +	.unregister_vblank_cb = mtk_ovl_unregister_vblank_cb,
>  	.enable_vblank = mtk_ovl_enable_vblank,
>  	.disable_vblank = mtk_ovl_disable_vblank,
>  	.supported_rotations = mtk_ovl_supported_rotations,
> @@ -321,6 +323,8 @@ static const struct mtk_ddp_comp_funcs ddp_rdma =
> {
>  	.config = mtk_rdma_config,
>  	.start = mtk_rdma_start,
>  	.stop = mtk_rdma_stop,
> +	.register_vblank_cb = mtk_rdma_register_vblank_cb,
> +	.unregister_vblank_cb = mtk_rdma_unregister_vblank_cb,
>  	.enable_vblank = mtk_rdma_enable_vblank,
>  	.disable_vblank = mtk_rdma_disable_vblank,
>  	.layer_nr = mtk_rdma_layer_nr,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 4c6a98662305..b83f24cb045f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -48,9 +48,11 @@ struct mtk_ddp_comp_funcs {
>  		       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>  	void (*start)(struct device *dev);
>  	void (*stop)(struct device *dev);
> -	void (*enable_vblank)(struct device *dev,
> -			      void (*vblank_cb)(void *),
> -			      void *vblank_cb_data);
> +	void (*register_vblank_cb)(struct device *dev,
> +				   void (*vblank_cb)(void *),
> +				   void *vblank_cb_data);
> +	void (*unregister_vblank_cb)(struct device *dev);
> +	void (*enable_vblank)(struct device *dev);
>  	void (*disable_vblank)(struct device *dev);
>  	unsigned int (*supported_rotations)(struct device *dev);
>  	unsigned int (*layer_nr)(struct device *dev);
> @@ -111,12 +113,25 @@ static inline void mtk_ddp_comp_stop(struct
> mtk_ddp_comp *comp)
>  		comp->funcs->stop(comp->dev);
>  }
>  
> -static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp
> *comp,
> -					      void (*vblank_cb)(void
> *),
> -					      void *vblank_cb_data)
> +static inline void mtk_ddp_comp_register_vblank_cb(struct
> mtk_ddp_comp *comp,
> +						   void
> (*vblank_cb)(void *),
> +						   void
> *vblank_cb_data)
> +{
> +	if (comp->funcs && comp->funcs->register_vblank_cb)
> +		comp->funcs->register_vblank_cb(comp->dev, vblank_cb,
> +						vblank_cb_data);
> +}
> +
> +static inline void mtk_ddp_comp_unregister_vblank_cb(struct
> mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->unregister_vblank_cb)
> +		comp->funcs->unregister_vblank_cb(comp->dev);
> +}
> +
> +static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp
> *comp)
>  {
>  	if (comp->funcs && comp->funcs->enable_vblank)
> -		comp->funcs->enable_vblank(comp->dev, vblank_cb,
> vblank_cb_data);
> +		comp->funcs->enable_vblank(comp->dev);
>  }
>  
>  static inline void mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp
> *comp)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
