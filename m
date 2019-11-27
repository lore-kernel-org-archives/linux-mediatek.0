Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC85C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 09:57:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E232070A
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 09:57:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n/MyPWEs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="R31Z7VoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43E232070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5XTV2DioIHxaZdosJJs1FaDeriOxXKTVUm7tCdcJhM=; b=n/MyPWEsX/8H/G
	Ia+lWSOOUHuHkJ8qHRrzHIWW61tf6PAIfMk7XQnyxFv5PJZLubVwH/zRcbFpERRrKnCVpaIHWmyax
	7626xxmWjj7rhgwVwsX+ZUmbBym8DhH7pGaestPL7oEzN42MmDgNIm5BpX+s+soqihYykoG6fqOCN
	/RgecSCb/42ZZ/BT9fsszh1o5neaUlGVhAi91G75TXSBNa2Td7W20Zaq5IEmmDPLiZ5ziRA6qcHuL
	FfayLuZ0Gt3WdwNtOXuCwIG9ctSr/QEdUC7i0GPXbB5k0eKUalQqnYV8/BxrMHWx9lVMycisJFsCP
	LCS7vid0fmEeCVunphTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZu4N-0001V6-M2; Wed, 27 Nov 2019 09:57:11 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZu4B-0001I0-J3
 for linux-mediatek@lists.infradead.org; Wed, 27 Nov 2019 09:57:02 +0000
Received: by mail-wm1-x343.google.com with SMTP id l1so6364668wme.2
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Nov 2019 01:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4nxqM2ljOyvMminYRatpYDJ6G2Cnc/jXl/ctoZJW83M=;
 b=R31Z7VoPUUJY6KT2xAjALKnYyIBrSVGoK4lXJrfZzGxM5XA/hZOGXro0Of9plFQSeN
 WAnkm8YrwCywO7U+fBLgFEwAhQlj2e25gtjrqSEBGbdTfLVotmmOVVm5jXv27LwBv3oN
 ArxE4LOsaKPaNQRRUSlm/gvS1jOuzp8FxmOzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=4nxqM2ljOyvMminYRatpYDJ6G2Cnc/jXl/ctoZJW83M=;
 b=mt8SOth4K+0OMYU59vwbe1TNXXH0h3w7L9tsKJKu1RzZ1G1JEFJTCrd6EI2muMtRFB
 Lwl5ZcqbZzSpHHCE2B18OuMGtqnpeYmQO5pvEor8Ufrz/DgQK9jloatX0ECrj7Vg+Run
 0bYUX5V9mJINBNZNR9WGtTby2BE8eNrgHgFFm//QUM8S5P2lI/rSjVyeGidO4LowfNNN
 1qoI1SnuqZfV9Bimmqipbu+LDqusOToQ7caul4qaAHcmt4r5WBQTZP/bd4+8tsdo8T3q
 5IYlO52IIiGd8UUbZizaDhPA5c5Nw9fzvDpSu5i4gdWYfVxtxCj3wx3/9AAuvuj6afT7
 5bjg==
X-Gm-Message-State: APjAAAWGVrY381I5xbd1oe0x7nveJMaViTbpzh0DIbxdkiPMgy619HqI
 CGMXAWOHXqNssubC+bkD6Xz0hg==
X-Google-Smtp-Source: APXvYqybChoKvzBJe0qZmOguygfwtRjhAkDRwH2KLyFJgBjBSdPYOnvgrE4Flw1lqlNZpOfU4z3F/g==
X-Received: by 2002:a1c:610b:: with SMTP id v11mr3401069wmb.156.1574848617309; 
 Wed, 27 Nov 2019 01:56:57 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f6sm18766987wrr.15.2019.11.27.01.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 01:56:56 -0800 (PST)
Date: Wed, 27 Nov 2019 10:56:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: Re: [PATCH 1/7] drm/mediatek: fix atomic_state reference counting
Message-ID: <20191127095654.GD29965@phenom.ffwll.local>
Mail-Followup-To: Bibby Hsieh <bibby.hsieh@mediatek.com>,
 David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 YT Shen <yt.shen@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 tfiga@chromium.org, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
References: <20191126062932.19773-1-bibby.hsieh@mediatek.com>
 <20191126062932.19773-2-bibby.hsieh@mediatek.com>
 <20191126084951.GQ29965@phenom.ffwll.local>
 <1574818912.27852.2.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574818912.27852.2.camel@mtksdaap41>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_015659_687968_43560418 
X-CRM114-Status: GOOD (  31.80  )
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
Cc: drinkcat@chromium.org, Philipp Zabel <p.zabel@pengutronix.de>,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 27, 2019 at 09:41:52AM +0800, Bibby Hsieh wrote:
> On Tue, 2019-11-26 at 09:49 +0100, Daniel Vetter wrote:
> > On Tue, Nov 26, 2019 at 02:29:26PM +0800, Bibby Hsieh wrote:
> > > The DRM core takes care of all atomic state refcounting.
> > > However, mediatek drm defers some work that accesses planes
> > > and plane_states in drm_atomic_state, and must therefore
> > > keep its own atomic state references until this work complete.
> > > 
> > > We take the atomic_state reference in atomic_fulsh() and ensure all the
> > > information in atomic_state already was updated in hardware for
> > > showing on screen and then schedules unreference_work to drop references
> > > on atomic_state.
> > > 
> > > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> > > 
> > > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > 
> > This looks strange. For one you implement your own reference counting - if
> > drivers have a need for drm_atomic_state_put_irq then I
> > think we should implement this in the core code.
> > 
> > The other bit is that atomic commits are meant to simply wait for
> > everything to finish - commit_tail doesn't hold locks, it's only ordered
> > through drm_crtc_commit events (at least with the async implementation in
> > the helpers), so you can just block there until your interrupt handler is
> > done processing the commit. Depending how you want to do this you might
> > want to wait before or after drm_atomic_helper_commit_hw_done().
> 
> OK, I will try to add a simple wait/completion before
> drm_atomic_helper_commit_hw_done() until the commit was processed.

Note that waiting before hw_done stalls the next commit. You only want to
do that for e.g. irq handler that programs registers at vblank. If you
have some cleanup work that runs after the new frame is already showing,
you should wait for that _after_ hw_done, to avoid stalling the next flip.

Also if you stall after hw_done, you need to make either make sure you
handle concurrency between multiple commits for that part yourself (since
anything after hw_done isn't ordered anymore by the default helper stuff).
-Daniel

> 
> Thanks.
> 
> Bibby
> > -Daniel
> > 
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 11 +++-
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 79 +++++++++++++++++++++++++
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  9 +++
> > >  3 files changed, 97 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > index 29d0582e90e9..68b92adc96bb 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -7,7 +7,7 @@
> > >  #include <linux/pm_runtime.h>
> > >  
> > >  #include <asm/barrier.h>
> > > -
> > > +#include <drm/drm_atomic.h>
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_plane_helper.h>
> > >  #include <drm/drm_probe_helper.h>
> > > @@ -47,6 +47,7 @@ struct mtk_drm_crtc {
> > >  	struct mtk_disp_mutex		*mutex;
> > >  	unsigned int			ddp_comp_nr;
> > >  	struct mtk_ddp_comp		**ddp_comp;
> > > +	struct drm_crtc_state		*old_crtc_state;
> > >  };
> > >  
> > >  struct mtk_crtc_state {
> > > @@ -362,6 +363,7 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
> > >  static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
> > >  {
> > >  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> > > +	struct drm_atomic_state *atomic_state = mtk_crtc->old_crtc_state->state;
> > >  	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
> > >  	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
> > >  	unsigned int i;
> > > @@ -399,6 +401,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
> > >  			plane_state->pending.config = false;
> > >  		}
> > >  		mtk_crtc->pending_planes = false;
> > > +		mtk_atomic_state_put_queue(atomic_state);
> > >  	}
> > >  }
> > >  
> > > @@ -494,6 +497,7 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
> > >  static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > >  				      struct drm_crtc_state *old_crtc_state)
> > >  {
> > > +	struct drm_atomic_state *old_atomic_state = old_crtc_state->state;
> > >  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> > >  	struct mtk_drm_private *priv = crtc->dev->dev_private;
> > >  	unsigned int pending_planes = 0;
> > > @@ -512,8 +516,11 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > >  			pending_planes |= BIT(i);
> > >  		}
> > >  	}
> > > -	if (pending_planes)
> > > +	if (pending_planes) {
> > >  		mtk_crtc->pending_planes = true;
> > > +		drm_atomic_state_get(old_atomic_state);
> > > +		mtk_crtc->old_crtc_state = old_crtc_state;
> > > +	}
> > >  	if (crtc->state->color_mgmt_changed)
> > >  		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> > >  			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > index 6588dc6dd5e3..6c68283b6124 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > @@ -115,10 +115,85 @@ static int mtk_atomic_commit(struct drm_device *drm,
> > >  	return 0;
> > >  }
> > >  
> > > +struct mtk_atomic_state {
> > > +	struct drm_atomic_state base;
> > > +	struct list_head list;
> > > +};
> > > +
> > > +static inline struct mtk_atomic_state *to_mtk_state(struct drm_atomic_state *s)
> > > +{
> > > +	return container_of(s, struct mtk_atomic_state, base);
> > > +}
> > > +
> > > +void mtk_atomic_state_put_queue(struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_device *drm = state->dev;
> > > +	struct mtk_drm_private *mtk_drm = drm->dev_private;
> > > +	struct mtk_atomic_state *mtk_state = to_mtk_state(state);
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&mtk_drm->unreference.lock, flags);
> > > +	list_add_tail(&mtk_state->list, &mtk_drm->unreference.list);
> > > +	spin_unlock_irqrestore(&mtk_drm->unreference.lock, flags);
> > > +
> > > +	schedule_work(&mtk_drm->unreference.work);
> > > +}
> > > +
> > > +static void mtk_unreference_work(struct work_struct *work)
> > > +{
> > > +	struct mtk_drm_private *mtk_drm = container_of(work,
> > > +			struct mtk_drm_private, unreference.work);
> > > +	unsigned long flags;
> > > +	struct mtk_atomic_state *state, *tmp;
> > > +
> > > +	/*
> > > +	 * framebuffers cannot be unreferenced in atomic context.
> > > +	 * Therefore, only hold the spinlock when iterating unreference_list,
> > > +	 * and drop it when doing the unreference.
> > > +	 */
> > > +	spin_lock_irqsave(&mtk_drm->unreference.lock, flags);
> > > +	list_for_each_entry_safe(state, tmp, &mtk_drm->unreference.list, list) {
> > > +		list_del(&state->list);
> > > +		spin_unlock_irqrestore(&mtk_drm->unreference.lock, flags);
> > > +		drm_atomic_state_put(&state->base);
> > > +		spin_lock_irqsave(&mtk_drm->unreference.lock, flags);
> > > +	}
> > > +	spin_unlock_irqrestore(&mtk_drm->unreference.lock, flags);
> > > +}
> > > +
> > > +static struct drm_atomic_state *
> > > +		mtk_drm_atomic_state_alloc(struct drm_device *dev)
> > > +{
> > > +	struct mtk_atomic_state *mtk_state;
> > > +
> > > +	mtk_state = kzalloc(sizeof(*mtk_state), GFP_KERNEL);
> > > +	if (!mtk_state)
> > > +		return NULL;
> > > +
> > > +	if (drm_atomic_state_init(dev, &mtk_state->base) < 0) {
> > > +		kfree(mtk_state);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	INIT_LIST_HEAD(&mtk_state->list);
> > > +
> > > +	return &mtk_state->base;
> > > +}
> > > +
> > > +static void mtk_drm_atomic_state_free(struct drm_atomic_state *state)
> > > +{
> > > +	struct mtk_atomic_state *mtk_state = to_mtk_state(state);
> > > +
> > > +	drm_atomic_state_default_release(state);
> > > +	kfree(mtk_state);
> > > +}
> > > +
> > >  static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
> > >  	.fb_create = mtk_drm_mode_fb_create,
> > >  	.atomic_check = drm_atomic_helper_check,
> > >  	.atomic_commit = mtk_atomic_commit,
> > > +	.atomic_state_alloc = mtk_drm_atomic_state_alloc,
> > > +	.atomic_state_free = mtk_drm_atomic_state_free
> > >  };
> > >  
> > >  static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
> > > @@ -337,6 +412,10 @@ static int mtk_drm_kms_init(struct drm_device *drm)
> > >  	drm_kms_helper_poll_init(drm);
> > >  	drm_mode_config_reset(drm);
> > >  
> > > +	INIT_WORK(&private->unreference.work, mtk_unreference_work);
> > > +	INIT_LIST_HEAD(&private->unreference.list);
> > > +	spin_lock_init(&private->unreference.lock);
> > > +
> > >  	return 0;
> > >  
> > >  err_unset_dma_parms:
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > > index b6a82728d563..c37d835cf949 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > > @@ -55,6 +55,13 @@ struct mtk_drm_private {
> > >  
> > >  	struct drm_atomic_state *suspend_state;
> > >  
> > > +	struct {
> > > +		struct work_struct	work;
> > > +		struct list_head	list;
> > > +		/* lock for unreference list */
> > > +		spinlock_t		lock;
> > > +	} unreference;
> > > +
> > >  	bool dma_parms_allocated;
> > >  };
> > >  
> > > @@ -66,4 +73,6 @@ extern struct platform_driver mtk_dpi_driver;
> > >  extern struct platform_driver mtk_dsi_driver;
> > >  extern struct platform_driver mtk_mipi_tx_driver;
> > >  
> > > +void mtk_atomic_state_put_queue(struct drm_atomic_state *state);
> > > +
> > >  #endif /* MTK_DRM_DRV_H */
> > > -- 
> > > 2.18.0
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
