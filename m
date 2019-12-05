Return-Path: <SRS0=lqdO=Z3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D7BC43603
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 02:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 740F321835
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 02:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmVLeJ31";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KZVHaol6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 740F321835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aupjcihLy6V8KlfjenOlUtaoePDIeEbrruHRxDmjTs=; b=pmVLeJ31NLgjrc
	FrVNMfD1GegFa2jkjg6Pm3jskqH28iHIssCiJHpI4cFlK5QX/6rssqttUqSlEFvwgs1OPcC+Il4UY
	JK5tqgD00UExhQsPDegmK0Ao8hOeGZJ7SlmtXSe8bo8KZsXBAPLTU2FrGfjafsLt/HWewV8EaAKa/
	nfhDsYBkV3gwdagHDxSoH2LB5rG6pzhj0NVpMzkeZmpgFbd1n2/fPY/3vBrxLj7PeG89Ui5p1oiez
	EkzSwaGC1QiLT7dGs1Q4Fr+Hm80nfIULwMdltFfacpRa3J40Vd515jwo9Z86ZcDE7xaVqK5hx8ljR
	mV3nUf5QDIjmCyRipgPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icgeW-0005mo-Mf; Thu, 05 Dec 2019 02:14:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icgeM-0005fb-LM; Thu, 05 Dec 2019 02:13:53 +0000
X-UUID: f1c3a9df76eb4f98b342abcad244f141-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BSLlyAQI/9rakotWHh5TPNBRZCYTmRUC1SW/9OQt5ko=; 
 b=KZVHaol6lQXh5ealAmDim3v8PMGCwsRdo6+P9EoNK5OgUh6lS1RIPLCaoOcqR6slLtUZNBwNkMtq0p4GMSO34o3wMIBRA1qUcRFK8IXecAFqJeB0XaR1kl3QcVj7HZ76XzSj/rzzK8YiOZUhFXIUO+WD7j36JXWEMPwIj8Rsrl4=;
X-UUID: f1c3a9df76eb4f98b342abcad244f141-20191204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 828524561; Wed, 04 Dec 2019 18:13:44 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 18:13:55 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 10:13:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Dec 2019 10:12:43 +0800
Message-ID: <1575512021.24783.6.camel@mtksdaap41>
Subject: Re: [PATCH v3 3/6] drm/mediatek: update cursors by using async
 atomic update
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Thu, 5 Dec 2019 10:13:41 +0800
In-Reply-To: <20191204094441.5116-4-bibby.hsieh@mediatek.com>
References: <20191204094441.5116-1-bibby.hsieh@mediatek.com>
 <20191204094441.5116-4-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_181350_979359_68F81F73 
X-CRM114-Status: GOOD (  18.40  )
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Wed, 2019-12-04 at 17:44 +0800, Bibby Hsieh wrote:
> Support to async updates of cursors by using the new atomic
> interface for that.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 75 +++++++++++++++++-------
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h  |  2 +
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 50 ++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 +
>  4 files changed, 108 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 4bc52346093d..92b3b397c6c4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -47,6 +47,9 @@ struct mtk_drm_crtc {
>  	struct mtk_disp_mutex		*mutex;
>  	unsigned int			ddp_comp_nr;
>  	struct mtk_ddp_comp		**ddp_comp;
> +
> +	/* lock for display hardware access */
> +	struct mutex			hw_lock;
>  };
>  
>  struct mtk_crtc_state {
> @@ -417,6 +420,41 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
>  	}
>  }
>  
> +static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> +{
> +	struct drm_crtc *crtc = &mtk_crtc->base;
> +	struct mtk_drm_private *priv = crtc->dev->dev_private;
> +	unsigned int pending_planes = 0;
> +	int i;
> +
> +	mutex_lock(&mtk_crtc->hw_lock);
> +	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +		struct drm_plane *plane = &mtk_crtc->planes[i];
> +		struct mtk_plane_state *plane_state;
> +
> +		plane_state = to_mtk_plane_state(plane->state);
> +		if (plane_state->pending.dirty) {
> +			plane_state->pending.config = true;
> +			plane_state->pending.dirty = false;
> +			pending_planes |= BIT(i);
> +		} else if (plane_state->pending.async_dirty) {
> +			plane_state->pending.config = true;
> +			plane_state->pending.async_update = false;
> +			plane_state->pending.async_dirty = false;
> +			pending_planes |= BIT(i);
> +		}

I think the async plane break the atomic planes. For example, plane 0,
plane 1, plane 2 are atomic planes and plane 3 is async plane. When
plane 0, plane 1 , plane 2 would be dirty in sequence, and plane 0 get
dirty first, but async plane update before plane 1 get dirty, these code
would apply plane 0 and plane 3, so this would break the atomic.

> +	}
> +	if (pending_planes)
> +		mtk_crtc->pending_planes = true;
> +
> +	if (priv->data->shadow_register) {
> +		mtk_disp_mutex_acquire(mtk_crtc->mutex);
> +		mtk_crtc_ddp_config(crtc);
> +		mtk_disp_mutex_release(mtk_crtc->mutex);
> +	}
> +	mutex_unlock(&mtk_crtc->hw_lock);
> +}
> +
>  int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>  			     struct mtk_plane_state *state)
>  {
> @@ -429,6 +467,20 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>  	return 0;
>  }
>  
> +void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
> +			       struct drm_plane_state *new_state)
> +{
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	const struct drm_plane_helper_funcs *plane_helper_funcs =
> +			plane->helper_private;
> +
> +	if (!mtk_crtc->enabled)
> +		return;
> +
> +	plane_helper_funcs->atomic_update(plane, new_state);
> +	mtk_drm_crtc_hw_config(mtk_crtc);
> +}
> +
>  static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>  				       struct drm_crtc_state *old_state)
>  {
> @@ -510,34 +562,14 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  				      struct drm_crtc_state *old_crtc_state)
>  {
>  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> -	struct mtk_drm_private *priv = crtc->dev->dev_private;
> -	unsigned int pending_planes = 0;
>  	int i;
>  
>  	if (mtk_crtc->event)
>  		mtk_crtc->pending_needs_vblank = true;
> -	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> -		struct drm_plane *plane = &mtk_crtc->planes[i];
> -		struct mtk_plane_state *plane_state;
> -
> -		plane_state = to_mtk_plane_state(plane->state);
> -		if (plane_state->pending.dirty) {
> -			plane_state->pending.config = true;
> -			plane_state->pending.dirty = false;
> -			pending_planes |= BIT(i);
> -		}
> -	}
> -	if (pending_planes)
> -		mtk_crtc->pending_planes = true;
>  	if (crtc->state->color_mgmt_changed)
>  		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
>  			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
> -
> -	if (priv->data->shadow_register) {
> -		mtk_disp_mutex_acquire(mtk_crtc->mutex);
> -		mtk_crtc_ddp_config(crtc);
> -		mtk_disp_mutex_release(mtk_crtc->mutex);
> -	}
> +	mtk_drm_crtc_hw_config(mtk_crtc);
>  }
>  
>  static const struct drm_crtc_funcs mtk_crtc_funcs = {
> @@ -729,6 +761,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
>  	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
>  	priv->num_pipes++;
> +	mutex_init(&mtk_crtc->hw_lock);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> index 6afe1c19557a..a2b4677a451c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -21,5 +21,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  			unsigned int path_len);
>  int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>  			     struct mtk_plane_state *state);
> +void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
> +			       struct drm_plane_state *plane_state);
>  
>  #endif /* MTK_DRM_CRTC_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index cd7c97eb7ee6..6bdb42f068fb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  
> @@ -70,6 +71,50 @@ static void mtk_drm_plane_destroy_state(struct drm_plane *plane,
>  	kfree(to_mtk_plane_state(state));
>  }
>  
> +static int mtk_plane_atomic_async_check(struct drm_plane *plane,
> +					struct drm_plane_state *state)
> +{
> +	struct drm_crtc_state *crtc_state;
> +
> +	if (plane != state->crtc->cursor)
> +		return -EINVAL;
> +
> +	if (!plane->state)
> +		return -EINVAL;
> +
> +	if (!plane->state->fb)
> +		return -EINVAL;
> +
> +	if (state->state)
> +		crtc_state = drm_atomic_get_existing_crtc_state(state->state,
> +								state->crtc);
> +	else /* Special case for asynchronous cursor updates. */
> +		crtc_state = state->crtc->state;
> +
> +	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   true, true);
> +}
> +
> +static void mtk_plane_atomic_async_update(struct drm_plane *plane,
> +					  struct drm_plane_state *new_state)
> +{
> +	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
> +
> +	plane->state->crtc_x = new_state->crtc_x;
> +	plane->state->crtc_y = new_state->crtc_y;
> +	plane->state->crtc_h = new_state->crtc_h;
> +	plane->state->crtc_w = new_state->crtc_w;
> +	plane->state->src_x = new_state->src_x;
> +	plane->state->src_y = new_state->src_y;
> +	plane->state->src_h = new_state->src_h;
> +	plane->state->src_w = new_state->src_w;
> +	state->pending.async_update = true;
> +
> +	mtk_drm_crtc_async_update(new_state->crtc, plane, new_state);
> +}
> +
>  static const struct drm_plane_funcs mtk_plane_funcs = {
>  	.update_plane = drm_atomic_helper_update_plane,
>  	.disable_plane = drm_atomic_helper_disable_plane,
> @@ -141,6 +186,9 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
>  	state->pending.rotation = plane->state->rotation;
>  	wmb(); /* Make sure the above parameters are set before update */
>  	state->pending.dirty = true;
> +
> +	if (state->pending.async_update)
> +		state->pending.async_dirty = true;

Why do you use two variable to state just one thing?

Regards,
CK

>  }
>  
>  static void mtk_plane_atomic_disable(struct drm_plane *plane,
> @@ -158,6 +206,8 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
>  	.atomic_check = mtk_plane_atomic_check,
>  	.atomic_update = mtk_plane_atomic_update,
>  	.atomic_disable = mtk_plane_atomic_disable,
> +	.atomic_async_update = mtk_plane_atomic_async_update,
> +	.atomic_async_check = mtk_plane_atomic_async_check,
>  };
>  
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> index 760885e35b27..41882465dd67 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -22,6 +22,8 @@ struct mtk_plane_pending_state {
>  	unsigned int			height;
>  	unsigned int			rotation;
>  	bool				dirty;
> +	bool				async_dirty;
> +	bool				async_update;
>  };
>  
>  struct mtk_plane_state {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
