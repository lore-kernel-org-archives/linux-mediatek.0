Return-Path: <SRS0=B6WE=Z2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6520C2D0C7
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 06:46:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8102B24676
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 06:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lumNpTJf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UEjladCi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8102B24676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AsxxFPTPwckvVpJYemQH2LuXqwYs98t2Ib9o92vaYXI=; b=lumNpTJfeD3IR2
	fFLAdH6PyEVZS7o1HfuH9+FK3nvyKER426MQYW1wWceUpSqUOduwu+gOurOW2JrUj1XRFVCFZKTkI
	eJHZQ3AxlvVwEMFHyI02hviCBFSFD97MEiqBAOUSYISlZWnqY+IYzMNzu8LZ473keQks2mK4WljkP
	W2mifg3zV7mlV9aMWshSE+md7NaYK9+LETjt9YRIoYygMzbaPnMPYqsqm1Fu7a5XPnj3iNUZkt2L6
	BtSCzEgYYqtinVtibF0IbsGMwdjpSLZD15g5MIl/NmTjcEJ0K9xyGCu00ARhWDNVULW1s7PO53cht
	CPA2PikMrmpGONsUBm5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icO7I-0004iR-NM; Wed, 04 Dec 2019 06:26:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icO79-0004X6-Dc; Wed, 04 Dec 2019 06:26:20 +0000
X-UUID: f999ebd864594a8e87b23c38fe02163b-20191203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dZh9f2aKbDwDYA2AsbYkUX+7UYvyYAk1oinw0XAVMlc=; 
 b=UEjladCi+Jzo23dxdz2Tkjt3LSdfcnKnjtDVkNz0g5mASWvTR/xUYsKNqSkK8/Yx5n2mg69dFweB/H/DenKL80ItvLqS2wvo7dnhERFs6W1+lL4fwq9t3oyVe3nltOuReWtmMmtbM2c41/ph1ZWoyK7jsfeh4ORvG2K3p1Rex44=;
X-UUID: f999ebd864594a8e87b23c38fe02163b-20191203
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1997585786; Tue, 03 Dec 2019 22:26:14 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 22:27:02 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 14:25:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Dec 2019 14:25:17 +0800
Message-ID: <1575440771.29074.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 3/6] drm/mediatek: update cursors by using async
 atomic update
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Wed, 4 Dec 2019 14:26:11 +0800
In-Reply-To: <20191203071036.14158-4-bibby.hsieh@mediatek.com>
References: <20191203071036.14158-1-bibby.hsieh@mediatek.com>
 <20191203071036.14158-4-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_222619_468475_0622FB21 
X-CRM114-Status: GOOD (  17.26  )
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

You move the mutex protection to [PATCH v2 6/6] drm/mediatek: apply CMDQ
control flow, but the race condition exist in this patch. So you should
move that back in this patch.

Regards,
CK

On Tue, 2019-12-03 at 15:10 +0800, Bibby Hsieh wrote:
> Support to async updates of cursors by using the new atomic
> interface for that.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 33 ++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h  |  2 +
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 50 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 +
>  4 files changed, 87 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 4c25ad2182b0..b23fe74b8b0a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -422,6 +422,39 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>  	return 0;
>  }
>  
> +void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
> +			       struct drm_plane_state *new_state)
> +{
> +	struct mtk_drm_private *priv = crtc->dev->dev_private;
> +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> +	const struct drm_plane_helper_funcs *plane_helper_funcs =
> +			plane->helper_private;
> +	int i;
> +
> +	if (!mtk_crtc->enabled)
> +		return;
> +
> +	plane_helper_funcs->atomic_update(plane, new_state);
> +
> +	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +		struct drm_plane *plane = &mtk_crtc->planes[i];
> +		struct mtk_plane_state *plane_state;
> +
> +		plane_state = to_mtk_plane_state(plane->state);
> +		if (plane_state->pending.async_dirty) {
> +			plane_state->pending.config = true;
> +			plane_state->pending.async_update = false;
> +			plane_state->pending.async_dirty = false;
> +		}
> +	}
> +	mtk_crtc->pending_planes = true;
> +	if (priv->data->shadow_register) {
> +		mtk_disp_mutex_acquire(mtk_crtc->mutex);
> +		mtk_crtc_ddp_config(crtc);
> +		mtk_disp_mutex_release(mtk_crtc->mutex);
> +	}
> +}
> +
>  static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>  				       struct drm_crtc_state *old_state)
>  {
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
