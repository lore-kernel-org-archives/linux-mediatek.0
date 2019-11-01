Return-Path: <SRS0=vEIf=YZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84909CA9ECB
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 01:42:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E2A2086D
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2019 01:42:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ifKgJ6tO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53E2A2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/RzBegAmKloI0Jfz4qra5lu/3lgEQpmKs/V/iWM/IU=; b=ifKgJ6tOKibgLK
	zZBJo5hh4Ac9SZxabXzAC27aX+DlP7de+qwzGWobee9K6JOE/PyKhvOYj0jrmTnxY2BgtFE/YNK5V
	j4KHNl0FrNxp84/8rb/Iduj4UNVM9C0cUS+vYuaAG/bde4e4r+giD+t2eEo5/7om6lmuCaUL7cwAE
	JcDxmJa43lNC/tu8Ci8kJjobxhHV+bonrbGrrpOB970OyHtfkFLlqG9II9dttfq8Iy2blkGo1crai
	dR559zXhfW9PJzwncGJlmpGXx35E59xvI0SzaKFR1P1WobrNTIkCKYBptCPXqy76EhUoqx+zFQuW9
	m1cWgT3goTzfrOGlMJ5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQLxU-00015W-PI; Fri, 01 Nov 2019 01:42:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQLxI-0000wn-HC; Fri, 01 Nov 2019 01:42:26 +0000
X-UUID: 7032ce091e7f4d6f9c9657c3b3a84692-20191031
X-UUID: 7032ce091e7f4d6f9c9657c3b3a84692-20191031
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1337969759; Thu, 31 Oct 2019 17:41:48 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 31 Oct 2019 18:42:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 1 Nov 2019 09:42:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 1 Nov 2019 09:42:13 +0800
Message-ID: <1572572537.10339.12.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: covert to helper nonblocking atomic commit
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Fri, 1 Nov 2019 09:42:17 +0800
In-Reply-To: <20191025053843.16808-1-bibby.hsieh@mediatek.com>
References: <20191025053843.16808-1-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_184224_576449_FA6E4624 
X-CRM114-Status: GOOD (  22.38  )
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

On Fri, 2019-10-25 at 13:38 +0800, Bibby Hsieh wrote:
> In order to commit state asynchronously, we change
> .atomic_commit to drm_atomic_helper_commit().
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 11 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 86 ++-----------------------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  7 --
>  3 files changed, 16 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index b97eb5f58483..b07dc9b59ca3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -317,6 +317,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>  {
>  	struct drm_device *drm = mtk_crtc->base.dev;
> +	struct drm_crtc *crtc = &mtk_crtc->base;
>  	int i;
>  
>  	DRM_DEBUG_DRIVER("%s\n", __func__);
> @@ -340,6 +341,13 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>  	mtk_disp_mutex_unprepare(mtk_crtc->mutex);
>  
>  	pm_runtime_put(drm->dev);
> +
> +	if (crtc->state->event && !crtc->state->active) {
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event = NULL;
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +	}

This part looks like a bug fix. When the power is off, the latest event
may not process yet. So just send it here. But in
mtk_drm_crtc_atomic_disable(), it already wait for a vblank, why the
latest event has not processed yet?

>  }
>  
>  static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
> @@ -456,12 +464,15 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
>  	if (mtk_crtc->event && state->base.event)
>  		DRM_ERROR("new event while there is still a pending event\n");
>  
> +	spin_lock_irq(&crtc->dev->event_lock);
>  	if (state->base.event) {
>  		state->base.event->pipe = drm_crtc_index(crtc);
>  		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> +		WARN_ON(mtk_crtc->event);
>  		mtk_crtc->event = state->base.event;
>  		state->base.event = NULL;
>  	}
> +	spin_unlock_irq(&crtc->dev->event_lock);

This part is a bug fix. The 'event' variable would be access by thread
context in mtk_drm_crtc_atomic_begin() or by interrupt context in
mtk_drm_crtc_finish_page_flip(), so each part should be a critical
section. Move this to an independent patch.

>  }
>  
>  static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 6588dc6dd5e3..16e5771d182e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -36,89 +36,14 @@
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>  
> -static void mtk_atomic_schedule(struct mtk_drm_private *private,
> -				struct drm_atomic_state *state)
> -{
> -	private->commit.state = state;
> -	schedule_work(&private->commit.work);
> -}
> -
> -static void mtk_atomic_complete(struct mtk_drm_private *private,
> -				struct drm_atomic_state *state)
> -{
> -	struct drm_device *drm = private->drm;
> -
> -	drm_atomic_helper_wait_for_fences(drm, state, false);
> -
> -	/*
> -	 * Mediatek drm supports runtime PM, so plane registers cannot be
> -	 * written when their crtc is disabled.
> -	 *
> -	 * The comment for drm_atomic_helper_commit states:
> -	 *     For drivers supporting runtime PM the recommended sequence is
> -	 *
> -	 *     drm_atomic_helper_commit_modeset_disables(dev, state);
> -	 *     drm_atomic_helper_commit_modeset_enables(dev, state);
> -	 *     drm_atomic_helper_commit_planes(dev, state,
> -	 *                                     DRM_PLANE_COMMIT_ACTIVE_ONLY);
> -	 *
> -	 * See the kerneldoc entries for these three functions for more details.
> -	 */
> -	drm_atomic_helper_commit_modeset_disables(drm, state);
> -	drm_atomic_helper_commit_modeset_enables(drm, state);
> -	drm_atomic_helper_commit_planes(drm, state,
> -					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> -
> -	drm_atomic_helper_wait_for_vblanks(drm, state);
> -
> -	drm_atomic_helper_cleanup_planes(drm, state);
> -	drm_atomic_state_put(state);
> -}
> -
> -static void mtk_atomic_work(struct work_struct *work)
> -{
> -	struct mtk_drm_private *private = container_of(work,
> -			struct mtk_drm_private, commit.work);
> -
> -	mtk_atomic_complete(private, private->commit.state);
> -}
> -
> -static int mtk_atomic_commit(struct drm_device *drm,
> -			     struct drm_atomic_state *state,
> -			     bool async)
> -{
> -	struct mtk_drm_private *private = drm->dev_private;
> -	int ret;
> -
> -	ret = drm_atomic_helper_prepare_planes(drm, state);
> -	if (ret)
> -		return ret;
> -
> -	mutex_lock(&private->commit.lock);
> -	flush_work(&private->commit.work);
> -
> -	ret = drm_atomic_helper_swap_state(state, true);
> -	if (ret) {
> -		mutex_unlock(&private->commit.lock);
> -		drm_atomic_helper_cleanup_planes(drm, state);
> -		return ret;
> -	}
> -
> -	drm_atomic_state_get(state);
> -	if (async)
> -		mtk_atomic_schedule(private, state);
> -	else
> -		mtk_atomic_complete(private, state);
> -
> -	mutex_unlock(&private->commit.lock);
> -
> -	return 0;
> -}
> +static const struct drm_mode_config_helper_funcs mtk_drm_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
>  
>  static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
>  	.fb_create = mtk_drm_mode_fb_create,
>  	.atomic_check = drm_atomic_helper_check,
> -	.atomic_commit = mtk_atomic_commit,
> +	.atomic_commit = drm_atomic_helper_commit,

This does not like what the title describe. You just change
atomic_commit implementation from mtk version to helper version. Even
though we don't implement nonblocking atomic commit, this modification
is also necessary because this would reduce the duplicated code in
mediatek drm driver.

Regards,
CK

>  };
>  
>  static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
> @@ -265,6 +190,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>  	drm->mode_config.max_width = 4096;
>  	drm->mode_config.max_height = 4096;
>  	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
> +	drm->mode_config.helper_private = &mtk_drm_mode_config_helpers;
>  
>  	ret = component_bind_all(drm->dev, drm);
>  	if (ret)
> @@ -540,8 +466,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  	if (!private)
>  		return -ENOMEM;
>  
> -	mutex_init(&private->commit.lock);
> -	INIT_WORK(&private->commit.work, mtk_atomic_work);
>  	private->data = of_device_get_match_data(dev);
>  
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index b6a82728d563..9f4ce60174f6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -46,13 +46,6 @@ struct mtk_drm_private {
>  	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
>  	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
>  	const struct mtk_mmsys_driver_data *data;
> -
> -	struct {
> -		struct drm_atomic_state *state;
> -		struct work_struct work;
> -		struct mutex lock;
> -	} commit;
> -
>  	struct drm_atomic_state *suspend_state;
>  
>  	bool dma_parms_allocated;



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
