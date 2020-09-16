Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C909CC43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 12:04:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FFA62220F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 12:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="azycel1e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FINC2Lpm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FFA62220F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fpLH/C/8ys3w+2jv4c+jVmlqPeMO63OZwWDu1A9OcCk=; b=azycel1eSJwzhilfB5rutp1PC
	JRlQZxhHjl8v//8DgE+4BCFfO5HzWHCzoPeFlV/ReEbt2aprue4K6idN4FP/ixs8GlTmAed3OomeP
	WJo6RjTtbPvk99Vkm8bnZC334IuknZvS0U81DeMngI51WvdA8a1rhzA8dLNqjf6Uck1MlG0XCXqkW
	MXRT35lywzqnTZvdRSQ3OdwM8skisy1iqalROB0S9WoyyVL8EMNpw/olfZoqsi4MAKTjdEddiSxSG
	efFgAVD/Zguh3gmd2kl0NMP9+yjcJcdE/DNwZd6S+eMyT2kxnIEOSMXnO2o77O+dUTEwONMBRRnpr
	SBIvWFiKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIWAs-0001KJ-Rf; Wed, 16 Sep 2020 12:04:34 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIWAq-0001Id-94
 for linux-mediatek@lists.infradead.org; Wed, 16 Sep 2020 12:04:33 +0000
Received: by mail-wr1-x444.google.com with SMTP id t10so6677051wrv.1
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2020 05:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=96pn97vudIqUOy40qtVSGKAMicUxOYMMyH8l1R/+468=;
 b=FINC2LpmrXDkMJm5Mgra7waQhpVoOUvOK/XivYRsgqJPi1t7MwreTsEe5qPaJMSnnc
 bGLtUyOPhYe9Fwl6sFIaVos0Od9CqjRDqHzdWl2Mik+v6ih5KJgBn7LXGOWKxnCdsRrY
 i97BOGnSpY1lJ1zlegmw5oCEcpE/Q74wyRPDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=96pn97vudIqUOy40qtVSGKAMicUxOYMMyH8l1R/+468=;
 b=ldsU8IM6hhcbXG1RwsI4UeFK9YEb1cvDvTKS8oYUg3EDURr5PN8GoN+gqtQGdFmyqa
 NKDiJWCHHfWA/v0RO1OkEls5YJHBUqDn6yBVNA6jnTpyLJRhaskS2QsBknyW+MT75sSZ
 wcG6q5gTN3ZTd/4zTjRr1GAq8d4+OaDOWrXGguwM7z0cJ8g5d6yjJrPFkFMzR6f5i6TL
 5OpKg1UqXQqLnTfwG2xJudSsM6vYljdr/yeXPxOHKad0RcYP2LfV0of6dN2lfDFknFj1
 HfvAfw7rth0w83ffP3/XCzGwnVMd4T7+S9wR4y39mECb7M+VjoZk2oj1WF/WzZh+h6Vj
 N7yQ==
X-Gm-Message-State: AOAM531dxV1zK9LzXON5LhJNzeUCHZ6NjnIpB6LVpwXhLOHEPxhedhg2
 Kxx66lIRZ9XKjbjUOWJIQwGuow==
X-Google-Smtp-Source: ABdhPJzFyWPidEyBuJrzSJ1sZ5B58ttVLzyD39jTNflICGMYf35qmzZyXrhAzHarWd23ksw0UuQHDw==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr3019661wrp.390.1600257868941; 
 Wed, 16 Sep 2020 05:04:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z11sm33234891wru.88.2020.09.16.05.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 05:04:27 -0700 (PDT)
Date: Wed, 16 Sep 2020 14:04:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 09/21] drm/nouveau: Introduce GEM object functions
Message-ID: <20200916120424.GM438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-10-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_080432_380746_5C79410B 
X-CRM114-Status: GOOD (  18.16  )
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
Cc: hamohammed.sa@gmail.com, heiko@sntech.de, andrey.grodzovsky@amd.com,
 airlied@linux.ie, nouveau@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, eric@anholt.net, thierry.reding@gmail.com,
 robdclark@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 sumit.semwal@linaro.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 oleksandr_andrushchenko@epam.com, tomi.valkeinen@ti.com,
 linux-tegra@vger.kernel.org, linux@armlinux.org.uk,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, miaoqinglang@huawei.com,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, marek.olsak@amd.com, tianci.yin@amd.com,
 maarten.lankhorst@linux.intel.com, etnaviv@lists.freedesktop.org,
 jani.nikula@linux.intel.com, inki.dae@samsung.com, hdegoede@redhat.com,
 christian.gmeiner@gmail.com, linux-mediatek@lists.infradead.org,
 mripard@kernel.org, rodrigo.vivi@intel.com, matthias.bgg@gmail.com,
 evan.quan@amd.com, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 tvrtko.ursulin@linux.intel.com, amd-gfx@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, hyun.kwon@xilinx.com,
 rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 chris@chris-wilson.co.uk, kyungmin.park@samsung.com, nirmoy.das@amd.com,
 p.zabel@pengutronix.de, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 04:59:46PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in nouveau.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Hm ttm and gem mmap world still quite disjoint ... Anyway that's an
entirely different thing.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  9 ---------
>  drivers/gpu/drm/nouveau/nouveau_gem.c   | 13 +++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_gem.h   |  2 ++
>  drivers/gpu/drm/nouveau/nouveau_prime.c |  2 ++
>  4 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 42fc5c813a9b..72640bca1617 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1207,16 +1207,7 @@ driver_stub = {
>  
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_pin = nouveau_gem_prime_pin,
> -	.gem_prime_unpin = nouveau_gem_prime_unpin,
> -	.gem_prime_get_sg_table = nouveau_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
> -	.gem_prime_vmap = nouveau_gem_prime_vmap,
> -	.gem_prime_vunmap = nouveau_gem_prime_vunmap,
> -
> -	.gem_free_object_unlocked = nouveau_gem_object_del,
> -	.gem_open_object = nouveau_gem_object_open,
> -	.gem_close_object = nouveau_gem_object_close,
>  
>  	.dumb_create = nouveau_display_dumb_create,
>  	.dumb_map_offset = nouveau_display_dumb_map_offset,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 89adadf4706b..28e0cbb00876 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -169,6 +169,17 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
>  	ttm_bo_unreserve(&nvbo->bo);
>  }
>  
> +const struct drm_gem_object_funcs nouveau_gem_object_funcs = {
> +	.free = nouveau_gem_object_del,
> +	.open = nouveau_gem_object_open,
> +	.close = nouveau_gem_object_close,
> +	.pin = nouveau_gem_prime_pin,
> +	.unpin = nouveau_gem_prime_unpin,
> +	.get_sg_table = nouveau_gem_prime_get_sg_table,
> +	.vmap = nouveau_gem_prime_vmap,
> +	.vunmap = nouveau_gem_prime_vunmap,
> +};
> +
>  int
>  nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
>  		uint32_t tile_mode, uint32_t tile_flags,
> @@ -186,6 +197,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
>  	if (IS_ERR(nvbo))
>  		return PTR_ERR(nvbo);
>  
> +	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
> +
>  	/* Initialize the embedded gem-object. We return a single gem-reference
>  	 * to the caller, instead of a normal nouveau_bo ttm reference. */
>  	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
> index 978e07591990..b35c180322e2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
> @@ -5,6 +5,8 @@
>  #include "nouveau_drv.h"
>  #include "nouveau_bo.h"
>  
> +extern const struct drm_gem_object_funcs nouveau_gem_object_funcs;
> +
>  static inline struct nouveau_bo *
>  nouveau_gem_object(struct drm_gem_object *gem)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index b2ecb91f8ddc..a8264aebf3d4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -77,6 +77,8 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
>  
>  	nvbo->valid_domains = NOUVEAU_GEM_DOMAIN_GART;
>  
> +	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
> +
>  	/* Initialize the embedded gem-object. We return a single gem-reference
>  	 * to the caller, instead of a normal nouveau_bo ttm reference. */
>  	ret = drm_gem_object_init(dev, &nvbo->bo.base, size);
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
