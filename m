Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D169FC48BEF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 17:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEHPwaplp8G6/fW/o46MO3gqf7C4ETuOBUJk7lt+s7A=; b=uQrp5a7lC6QNK0Ybe2KZ14tWsO
	q2oH6Mg8hjh2aUZwAM86ufx4cB/aHfzSqem5s3uG1w079nYnoyVqf2z+dibeBpJxQojAEqf/KfRO1
	KHe1rvHGG3KCbBWjODSgWkaWh0HwxjPdZl2zvX2QHDPU0fyF7sokuG2S0qK5fXqCvWUI4wcqlhUIS
	vjwI1puYw1chB7UMZdXu4MFi5+9qjyg20BbM+H2T1v9zAqfahrxLUhO8k7xlx/kfq4Ab8RpCsIRZ0
	XW4jGCr5TAGpyMkxOvXcFWuSc78M1qPgOozAbsjrw5Qqykd7Bb0rnoD32YD/XzMiPU0jBuVxHKSaT
	y9SmdiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1qP-00000003AUS-0TT6;
	Fri, 16 Feb 2024 17:17:49 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1qM-00000003ATJ-1BD5
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Feb 2024 17:17:47 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d0438dfd67so5005171fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Feb 2024 09:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1708103864; x=1708708664; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pEHPwaplp8G6/fW/o46MO3gqf7C4ETuOBUJk7lt+s7A=;
        b=Lzn8cbVpoFar9EC50vGy/eR8Qef8M9k49QZno+oZixm1amyqzpywml9UNm9m3kIluX
         fZxIDs/rCM19ICUgkvoDvmXEz5Bh7cv4GH24ePWQul6vcRdqNCVLRS0bQFcZJE/5x3i0
         Np+May62BQzNo/JL5qIV7mKzPs1ggQ8edYtH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708103864; x=1708708664;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pEHPwaplp8G6/fW/o46MO3gqf7C4ETuOBUJk7lt+s7A=;
        b=VpRtZ2qnWEtVHhsRdTGHcxp1hCpUJ9mibfcmKLJK5XjNIyUvhAZDo/+13ls3DH2ISy
         I4eOUuwqL+qvPQMlCGj+HUlPemG7pAQ0Je9Mk6D/NC0W9CRki2FR12j1z2BXFnUy/jz9
         wpm+TJzId9KT9nC7Se1wu8Ly4jauy798QfjnGd3c7oe/rIg+f8hXo1iVZGbJ+L4Mxgxc
         dtteQd8NBCqwKhCLYKd+Vki6Df2c5GX1RAinjIF/+7HS1qvxOBLR8FpBsZ3yVdGz/58q
         DPP7jYhsGY0/q6JUZk3Ut8eAKZ6ivmsyafLZqzgy0b/nGyx5vqSYqcizHm5Cz/lTLFvl
         DcCA==
X-Forwarded-Encrypted: i=1; AJvYcCWXacmhvbzk1/2tKZpyuc4DUJ8dUAfjLS6FP+mmkW+OqZZLA0s8q+WHDVjXEKRvJO103lgZMX50KZrLdpKnntEBU/LyU8KrEhaAf8yfXkxXRYDS
X-Gm-Message-State: AOJu0Yze4fKDWOzjVdtVU/SRF9febISUSxtClu+FTGuX/RUFdY9Cdozj
	dGQKioJD7Zg/LdA57GwMxL6cINriIWWvngB70aIKOFIOTzCSG7KUs1c8wxhC28w=
X-Google-Smtp-Source: AGHT+IFznvhQCxxAftwgU9D5dcOt2DRPrEsHW908XedBIdH2dcfyoQOn8FRjHipVLWMp7Cv8q9RCVw==
X-Received: by 2002:a2e:878a:0:b0:2d0:eb9e:eee3 with SMTP id n10-20020a2e878a000000b002d0eb9eeee3mr3760218lji.3.1708103864245;
        Fri, 16 Feb 2024 09:17:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c4f0500b0041253692606sm1081953wmq.17.2024.02.16.09.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 09:17:43 -0800 (PST)
Date: Fri, 16 Feb 2024 18:17:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Sean Paul <seanpaul@chromium.org>, Fei Shao <fshao@chromium.org>,
	Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/13] drm/mediatek: Support CRC in display driver
Message-ID: <Zc-YtaJV1-EMiJoC@phenom.ffwll.local>
Mail-Followup-To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Sean Paul <seanpaul@chromium.org>, Fei Shao <fshao@chromium.org>,
	Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
 <20240215101119.12629-11-shawn.sung@mediatek.com>
 <Zc-Vq2MeG9X37JJe@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zc-Vq2MeG9X37JJe@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.6.11-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_091746_375378_C41F1F85 
X-CRM114-Status: GOOD (  48.08  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 16, 2024 at 06:04:43PM +0100, Daniel Vetter wrote:
> On Thu, Feb 15, 2024 at 06:11:16PM +0800, Hsiao Chien Sung wrote:
> > Register CRC related function pointers to support
> > CRC retrieval.
> > 
> > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 239 ++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  39 ++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   3 +
> >  3 files changed, 281 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 14cf75fa217f9..6cb1ed419dee7 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -68,6 +68,9 @@ struct mtk_drm_crtc {
> >  	/* lock for display hardware access */
> >  	struct mutex			hw_lock;
> >  	bool				config_updating;
> > +
> > +	struct mtk_ddp_comp		*crc_provider;
> > +	unsigned int			frames;
> >  };
> >  
> >  struct mtk_crtc_state {
> > @@ -635,6 +638,14 @@ static void mtk_crtc_ddp_irq(void *data)
> >  	struct drm_crtc *crtc = data;
> >  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> >  	struct mtk_drm_private *priv = crtc->dev->dev_private;
> > +	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
> > +
> > +	/*
> > +	 * crc providers should make sure the crc is always correct
> > +	 * by resetting it in .crc_read()
> > +	 */
> > +	if (crtc->crc.opened)
> > +		comp->funcs->crc_read(comp->dev);
> >  
> >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> >  	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
> > @@ -646,6 +657,24 @@ static void mtk_crtc_ddp_irq(void *data)
> >  	if (!priv->data->shadow_register)
> >  		mtk_crtc_ddp_config(crtc, NULL);
> >  #endif
> > +
> > +	/*
> > +	 * drm_crtc_add_crc_entry() could take more than 50ms to finish
> > +	 * put it at the end of the isr
> > +	 */
> 
> Uh this looks really scary, especially since you put this before the call
> to drm_crtc_handle_vblank in the function below, which really shouldn't be
> unecessarily delayed (because that's the one that takes the vblank
> timestamp).
> 
> This sounds like the perfect application for a vblank worker though, so
> you please look into drm_vblank_work.h. And if that is not useable due to
> hardware constraint, then please explain in a comment here and in the
> commit message why you cannot use that and have to roll your own. vblank
> work really should be your first choice here, because:
> - it's designed for expensive vblank work
> - it gives you all the flush/cancel_sync functions you need for disabling
>   crc again, and in a race-free implementation. Much better to use common
>   code than to reinvent synchronization wheels in drivers :-)
> 
> > +	if (crtc->crc.opened) {
> 
> Because this is probably not race-free, so we need something solid here.

Since it's maybe a bit tricky to see how to use drm_vblank_work:

- in your crtc initialization you also need to setup the crc work with
  drm_vblank_work_init().
- Your mtk_drm_crtc_set_sourc needs to actually enable the crc by calling
  drm_vblank_work_schedule for current vblank + 1, so that it immediately
  starts
- your vblank worker itself needs to again re-arm itself with
  drm_vblank_work_schedule, again for the very next vblank
- then your set_source also needs to handle the case where you disable the
  crc again (source == NULL) by calling drm_vblank_work_cancel_sync
- also you probably need to call drm_vblank_work_flush when shutting down
  the crtc, or you might have use-after-free issues on driver unload.
  Could probably also just put that in your crtc release function.

No changes to your interrupt handler needed, and also definitely no
digging around in drm_crtc->crc data structure without locking - that's
entirely internal to the common crc code and drivers must never look
into it.

Cheers, Sima

> 
> 
> > +		/*
> > +		 * skip the first crc because the first frame is configured by
> > +		 * mtk_crtc_ddp_hw_init() when atomic enable
> > +		 */
> > +		if (++mtk_crtc->frames > 1) {
> > +			drm_crtc_add_crc_entry(crtc, true,
> > +					       drm_crtc_vblank_count(crtc),
> > +					       comp->funcs->crc_entry(comp->dev));
> > +		}
> > +	} else {
> > +		mtk_crtc->frames = 0;
> > +	}
> >  	mtk_drm_finish_page_flip(mtk_crtc);
> >  }
> >  
> > @@ -704,6 +733,40 @@ static void mtk_drm_crtc_update_output(struct drm_crtc *crtc,
> >  	}
> >  }
> >  
> > +static int mtk_drm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src)
> > +{
> > +	if (src && strcmp(src, "auto") != 0) {
> > +		DRM_ERROR("%s(crtc-%d): unknown source '%s'\n",
> > +			  __func__, drm_crtc_index(crtc), src);
> > +		return -EINVAL;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int mtk_drm_crtc_verify_crc_source(struct drm_crtc *crtc,
> > +					  const char *src,
> > +					  size_t *cnt)
> > +{
> > +	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> > +	struct mtk_ddp_comp *comp = mtk_crtc->crc_provider;
> > +
> > +	if (!comp) {
> > +		DRM_ERROR("%s(crtc-%d): no crc provider\n",
> > +			  __func__, drm_crtc_index(crtc));
> > +		return -ENOENT;
> > +	}
> > +
> > +	if (src && strcmp(src, "auto") != 0) {
> > +		DRM_ERROR("%s(crtc-%d): unknown source '%s'\n",
> > +			  __func__, drm_crtc_index(crtc), src);
> > +		return -EINVAL;
> > +	}
> > +
> > +	*cnt = comp->funcs->crc_cnt(comp->dev);
> > +
> > +	return 0;
> > +}
> > +
> >  int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
> >  			     struct mtk_plane_state *state)
> >  {
> > @@ -841,6 +904,8 @@ static const struct drm_crtc_funcs mtk_crtc_funcs = {
> >  	.atomic_destroy_state	= mtk_drm_crtc_destroy_state,
> >  	.enable_vblank		= mtk_drm_crtc_enable_vblank,
> >  	.disable_vblank		= mtk_drm_crtc_disable_vblank,
> > +	.set_crc_source		= mtk_drm_crtc_set_crc_source,
> > +	.verify_crc_source	= mtk_drm_crtc_verify_crc_source,
> >  };
> >  
> >  static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
> > @@ -1033,6 +1098,11 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >  
> >  			if (comp->funcs->ctm_set)
> >  				has_ctm = true;
> > +
> > +			if (comp->funcs->crc_cnt &&
> > +			    comp->funcs->crc_entry &&
> > +			    comp->funcs->crc_read)
> > +				mtk_crtc->crc_provider = comp;
> >  		}
> >  
> >  		mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
> > @@ -1137,3 +1207,172 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >  
> >  	return 0;
> >  }
> > +
> > +void mtk_drm_crc_init(struct mtk_drm_crc *crc,
> > +		      const u32 *crc_offset_table, size_t crc_count,
> > +		      u32 reset_offset, u32 reset_mask)
> > +{
> > +	crc->ofs = crc_offset_table;
> > +	crc->cnt = crc_count;
> > +	crc->rst_ofs = reset_offset;
> > +	crc->rst_msk = reset_mask;
> > +	crc->va = kcalloc(crc->cnt, sizeof(*crc->va), GFP_KERNEL);
> > +	if (!crc->va) {
> > +		DRM_ERROR("failed to allocate memory for crc\n");
> > +		crc->cnt = 0;
> > +	}
> > +}
> > +
> > +void mtk_drm_crc_read(struct mtk_drm_crc *crc, void __iomem *reg)
> > +{
> > +	if (!crc->cnt || !crc->ofs || !crc->va)
> > +		return;
> > +
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	/* sync to see the most up-to-date copy of the DMA buffer */
> > +	dma_sync_single_for_cpu(crc->cmdq_client.chan->mbox->dev,
> > +				crc->pa, crc->cnt * sizeof(*crc->va),
> > +				DMA_FROM_DEVICE);
> > +#else
> > +	/* read crc with cpu for the platforms without cmdq */
> > +	{
> > +		u32 n;
> > +
> > +		for (n = 0; n < crc->cnt; n++)
> > +			crc->va[n] = readl(reg + crc->ofs[n]);
> > +
> > +		n = readl(reg + crc->rst_ofs);
> > +
> > +		/* pull reset bit */
> > +		n |= crc->rst_msk;
> > +		writel(n, reg + crc->rst_ofs);
> > +
> > +		/* release reset bit */
> > +		n &= ~crc->rst_msk;
> > +		writel(n, reg + crc->rst_ofs);
> > +	}
> > +#endif
> > +}
> > +
> > +void mtk_drm_crc_destroy(struct mtk_drm_crc *crc)
> > +{
> > +	if (!crc->cnt)
> > +		return;
> > +
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	if (crc->pa) {
> > +		dma_unmap_single(crc->cmdq_client.chan->mbox->dev,
> > +				 crc->pa, crc->cnt * sizeof(*crc->va),
> > +				 DMA_TO_DEVICE);
> > +		crc->pa = 0;
> > +	}
> > +	if (crc->cmdq_client.chan) {
> > +		mtk_drm_cmdq_pkt_destroy(&crc->cmdq_handle);
> > +		mbox_free_channel(crc->cmdq_client.chan);
> > +		crc->cmdq_client.chan = NULL;
> > +	}
> > +#endif
> > +	kfree(crc->va);
> > +	crc->va = NULL;
> > +	crc->cnt = 0;
> > +}
> > +
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +void mtk_drm_crc_cmdq_create(struct device *dev, struct mtk_drm_crc *crc)
> > +{
> > +	int i;
> > +
> > +	if (!crc->cnt) {
> > +		dev_warn(dev, "%s: not support\n", __func__);
> > +		goto cleanup;
> > +	}
> > +
> > +	if (!crc->ofs) {
> > +		dev_warn(dev, "%s: not defined\n", __func__);
> > +		goto cleanup;
> > +	}
> > +
> > +	crc->cmdq_client.client.dev = dev;
> > +	crc->cmdq_client.client.tx_block = false;
> > +	crc->cmdq_client.client.knows_txdone = true;
> > +	crc->cmdq_client.client.rx_callback = NULL;
> > +	crc->cmdq_client.chan = mbox_request_channel(&crc->cmdq_client.client, 0);
> > +	if (IS_ERR(crc->cmdq_client.chan)) {
> > +		dev_warn(dev, "%s: failed to create mailbox client\n", __func__);
> > +		crc->cmdq_client.chan = NULL;
> > +		goto cleanup;
> > +	}
> > +
> > +	if (mtk_drm_cmdq_pkt_create(&crc->cmdq_client, &crc->cmdq_handle, PAGE_SIZE)) {
> > +		dev_warn(dev, "%s: failed to create cmdq packet\n", __func__);
> > +		goto cleanup;
> > +	}
> > +
> > +	if (!crc->va) {
> > +		dev_warn(dev, "%s: no memory\n", __func__);
> > +		goto cleanup;
> > +	}
> > +
> > +	/* map the entry to get a dma address for cmdq to store the crc */
> > +	crc->pa = dma_map_single(crc->cmdq_client.chan->mbox->dev,
> > +				 crc->va, crc->cnt * sizeof(*crc->va),
> > +				 DMA_FROM_DEVICE);
> > +
> > +	if (dma_mapping_error(crc->cmdq_client.chan->mbox->dev, crc->pa)) {
> > +		dev_err(dev, "%s: failed to map dma\n", __func__);
> > +		goto cleanup;
> > +	}
> > +
> > +	if (crc->cmdq_event)
> > +		cmdq_pkt_wfe(&crc->cmdq_handle, crc->cmdq_event, true);
> > +
> > +	for (i = 0; i < crc->cnt; i++) {
> > +		/* put crc to spr1 register */
> > +		cmdq_pkt_read_s(&crc->cmdq_handle, crc->cmdq_reg->subsys,
> > +				crc->cmdq_reg->offset + crc->ofs[i],
> > +				CMDQ_THR_SPR_IDX1);
> > +
> > +		/* copy spr1 register to physical address of the crc */
> > +		cmdq_pkt_assign(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
> > +				CMDQ_ADDR_HIGH(crc->pa + i * sizeof(*crc->va)));
> > +		cmdq_pkt_write_s(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
> > +				 CMDQ_ADDR_LOW(crc->pa + i * sizeof(*crc->va)),
> > +				 CMDQ_THR_SPR_IDX1);
> > +	}
> > +	/* reset crc */
> > +	mtk_ddp_write_mask(&crc->cmdq_handle, ~0, crc->cmdq_reg, 0,
> > +			   crc->rst_ofs, crc->rst_msk);
> > +
> > +	/* clear reset bit */
> > +	mtk_ddp_write_mask(&crc->cmdq_handle, 0, crc->cmdq_reg, 0,
> > +			   crc->rst_ofs, crc->rst_msk);
> > +
> > +	/* jump to head of the cmdq packet */
> > +	cmdq_pkt_jump(&crc->cmdq_handle, crc->cmdq_handle.pa_base);
> > +
> > +	return;
> > +cleanup:
> > +	mtk_drm_crc_destroy(crc);
> > +}
> > +
> > +void mtk_drm_crc_cmdq_start(struct mtk_drm_crc *crc)
> > +{
> > +	if (!crc->cmdq_client.chan)
> > +		return;
> > +
> > +	dma_sync_single_for_device(crc->cmdq_client.chan->mbox->dev,
> > +				   crc->cmdq_handle.pa_base,
> > +				   crc->cmdq_handle.cmd_buf_size,
> > +				   DMA_TO_DEVICE);
> > +	mbox_send_message(crc->cmdq_client.chan, &crc->cmdq_handle);
> > +	mbox_client_txdone(crc->cmdq_client.chan, 0);
> > +}
> > +
> > +void mtk_drm_crc_cmdq_stop(struct mtk_drm_crc *crc)
> > +{
> > +	if (!crc->cmdq_client.chan)
> > +		return;
> > +
> > +	mbox_flush(crc->cmdq_client.chan, 2000);
> > +}
> > +#endif
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > index 3c224595fa714..0683ec4bc26f6 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> > @@ -15,6 +15,45 @@
> >  #define MTK_MAX_BPC	10
> >  #define MTK_MIN_BPC	3
> >  
> > +/**
> > + * struct mtk_drm_crc - crc related information
> > + * @ofs: register offset of crc
> > + * @rst_ofs: register offset of crc reset
> > + * @rst_msk: register mask of crc reset
> > + * @cnt: count of crc
> > + * @va: pointer to the start of crc array
> > + * @pa: physical address of the crc for gce to access
> > + * @cmdq_event: the event to trigger the cmdq
> > + * @cmdq_reg: address of the register that cmdq is going to access
> > + * @cmdq_client: handler to control cmdq (mbox channel, thread ...etc.)
> > + * @cmdq_handle: cmdq packet to store the commands
> > + */
> > +struct mtk_drm_crc {
> > +	const u32 *ofs;
> > +	u32 rst_ofs;
> > +	u32 rst_msk;
> > +	size_t cnt;
> > +	u32 *va;
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	dma_addr_t pa;
> > +	u32 cmdq_event;
> > +	struct cmdq_client_reg *cmdq_reg;
> > +	struct cmdq_client cmdq_client;
> > +	struct cmdq_pkt cmdq_handle;
> > +#endif
> > +};
> > +
> > +void mtk_drm_crc_init(struct mtk_drm_crc *crc,
> > +		      const u32 *crc_offset_table, size_t crc_count,
> > +		      u32 reset_offset, u32 reset_mask);
> > +void mtk_drm_crc_read(struct mtk_drm_crc *crc, void __iomem *reg);
> > +void mtk_drm_crc_destroy(struct mtk_drm_crc *crc);
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +void mtk_drm_crc_cmdq_create(struct device *dev, struct mtk_drm_crc *crc);
> > +void mtk_drm_crc_cmdq_start(struct mtk_drm_crc *crc);
> > +void mtk_drm_crc_cmdq_stop(struct mtk_drm_crc *crc);
> > +#endif
> > +
> >  void mtk_drm_crtc_commit(struct drm_crtc *crtc);
> >  int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >  			const unsigned int *path,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index 215b7234ff13c..231017470607e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -87,6 +87,9 @@ struct mtk_ddp_comp_funcs {
> >  	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
> >  	unsigned int (*encoder_index)(struct device *dev);
> >  	enum drm_mode_status (*mode_valid)(struct device *dev, const struct drm_display_mode *mode);
> > +	size_t (*crc_cnt)(struct device *dev);
> > +	u32 *(*crc_entry)(struct device *dev);
> > +	void (*crc_read)(struct device *dev);
> >  };
> >  
> >  struct mtk_ddp_comp {
> > -- 
> > 2.18.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

