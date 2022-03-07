Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78774C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 06:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jV3dS81yvf0+FfV0YD9TnjNnBHWS8e2jfEP2j6jY5hs=; b=cRkPgymoE/KdLS
	v9hb3+23Iwbe+wrHB/iZvWPlFXroUbEoT8IqVMy0FEtWPlL73PnkiiGHnZR4d4TRLPaTK00Stmm3R
	jyTVrgJb6p9EOY/LTYuSSuw/s0NEJ5YzIJuOrG4ZTeCHtqz4nt79xUZXiniNB2j1ksdCepGg835Ov
	SpSfJ9MHkz5FimQ5G6nVj0XcsXqjDhKmS75ZtHPCmFdnDzx0k9qjrS47kMUZyJOXVWV7kpDVSPWQ9
	mf1h4JLsTpT8ljI9+OGDExCecFfmgC8zz8lCL25YPQSbjKasfByTSt6atiVwRgmczlHmchvMNgjAr
	ebEPP4Ri9b1ci7N20mIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR6jM-00G0dX-9F; Mon, 07 Mar 2022 06:20:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR6jJ-00G0c8-Gi; Mon, 07 Mar 2022 06:20:26 +0000
X-UUID: 07c04be8598d4affa2c5b2622471b70e-20220306
X-UUID: 07c04be8598d4affa2c5b2622471b70e-20220306
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 821022495; Sun, 06 Mar 2022 23:20:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Mar 2022 22:20:13 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Mar 2022 14:20:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Mar 2022 14:20:11 +0800
Message-ID: <0f62b5ad6bca65ea79fb25014651e0ad40e79957.camel@mediatek.com>
Subject: Re: [PATCH v12 19/23] drm/mediatek: add dma dev get function
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
Date: Mon, 7 Mar 2022 14:20:12 +0800
In-Reply-To: <20220222100741.30138-20-nancy.lin@mediatek.com>
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
 <20220222100741.30138-20-nancy.lin@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_222025_571965_30249ED0 
X-CRM114-Status: GOOD (  23.72  )
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

On Tue, 2022-02-22 at 18:07 +0800, Nancy.Lin wrote:
> This is a preparation for adding support for the ovl_adaptor sub
> driver
> Ovl_adaptor is a DRM sub driver, which doesn't have dma dev. Add
> dma_dev_get function for getting representative dma dev in
> ovl_adaptor.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 15 +++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 ++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d661edf7e0fe..77af71ad65f8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -59,6 +59,7 @@ struct mtk_drm_crtc {
>  #endif
>  
>  	struct device			*mmsys_dev;
> +	struct device			*dma_dev;
>  	struct mtk_mutex		*mutex;
>  	unsigned int			ddp_comp_nr;
>  	struct mtk_ddp_comp		**ddp_comp;
> @@ -846,6 +847,13 @@ static int mtk_drm_crtc_init_comp_planes(struct
> drm_device *drm_dev,
>  	return 0;
>  }
>  
> +struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +
> +	return mtk_crtc->dma_dev;
> +}
> +
>  int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  			const enum mtk_ddp_comp_id *path, unsigned int
> path_len)
>  {
> @@ -931,6 +939,13 @@ int mtk_drm_crtc_create(struct drm_device
> *drm_dev,
>  			return ret;
>  	}
>  
> +	/*
> +	 * Default to use the first component as the dma dev.
> +	 * In the case of ovl_adaptor sub driver, it needs to use the
> +	 * dma_dev_get function to get representative dma dev.
> +	 */
> +	mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(&priv-
> >ddp_comp[path[0]]);
> +
>  	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
>  	if (ret < 0)
>  		return ret;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> index cb9a36c48d4f..f5a6e80c5265 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -22,5 +22,6 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc,
> struct drm_plane *plane,
>  			     struct mtk_plane_state *state);
>  void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct
> drm_plane *plane,
>  			       struct drm_atomic_state *plane_state);
> +struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc);
>  
>  #endif /* MTK_DRM_CRTC_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 221e2e3a3c8d..4f7fae41c916 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -68,6 +68,7 @@ struct mtk_ddp_comp_funcs {
>  	void (*bgclr_in_off)(struct device *dev);
>  	void (*ctm_set)(struct device *dev,
>  			struct drm_crtc_state *state);
> +	struct device * (*dma_dev_get)(struct device *dev);
>  };
>  
>  struct mtk_ddp_comp {
> @@ -188,6 +189,13 @@ static inline void mtk_ddp_ctm_set(struct
> mtk_ddp_comp *comp,
>  		comp->funcs->ctm_set(comp->dev, state);
>  }
>  
> +static inline struct device *mtk_ddp_comp_dma_dev_get(struct
> mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->dma_dev_get)
> +		return comp->funcs->dma_dev_get(comp->dev);
> +	return comp->dev;
> +}
> +
>  int mtk_ddp_comp_get_id(struct device_node *node,
>  			enum mtk_ddp_comp_type comp_type);
>  unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device
> *drm,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
