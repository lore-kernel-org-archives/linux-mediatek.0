Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3190BC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 12:07:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A29522209
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 12:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gr0X7wqL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="D8Cn+Lnz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A29522209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gxA/2J4dcAYNON4kxqf9Sdkv0ZCX1QxvR+6W35Wifd4=; b=gr0X7wqLn93WcD7ZDi1IuIIfU
	1TabQgECFcvXd328MxOzsqT4rs6W74yc3yR4vp4xjn1iG5uwME+//zN2XcnlwTosek6Nz6Two8zKS
	ygEUpCZFe2jiL5TuHdRg/G8zLdD63oY1bYaRA3HpXtXb4sBzihChqoBbEVhRMUZ2c1dNTl4IMAAYB
	i7o7/Rid8xuFrOmwG9e3+Qe640cFvLa4Yz6TbKI72I9t3sb/gKoMSnnaVvpKa429E5INwxjx5A9hp
	2Wg3shaXO3mw8XvIPY503s6f4WwZJdT8QLgUG9UWdiAeSzRcJRrN3ppE5Ws79ZYYGvvF5bgSy1BhS
	H0odGvv1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIWDv-0001Xe-9E; Wed, 16 Sep 2020 12:07:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIWDr-0001WU-7Z
 for linux-mediatek@lists.infradead.org; Wed, 16 Sep 2020 12:07:41 +0000
Received: by mail-wr1-x442.google.com with SMTP id w5so6635691wrp.8
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2020 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MGCPV3gxMGzqEc3cNJPEYSeaflc+Izh53Gg+hbi1Nhw=;
 b=D8Cn+LnzRzcwcAFRiK+P1SGw66Mhbu0VayIxxEwp3/Ke3uFcgTtEyg2O2TchfbyaU1
 /t1Jed/k7t8UhbtyHLBWwi9QGEEtHwtsdBVK0+CssfY95ypMsX9PNDgpg6PAhXIZmBww
 EM4H0+Gc3gntNd2KUdiNeLGf+3Tz2z1yDgJeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MGCPV3gxMGzqEc3cNJPEYSeaflc+Izh53Gg+hbi1Nhw=;
 b=I4F28doOIW94LK8TdVjwhJU+attsi7xdeuBXu2/1EwJPvgPfvltW4GcdbNd0Q7Iwi5
 /bablFv4zmhnlRcYdeAHwXEFqCJ2mq7NVmur4Em+C3Ln88BuQP4k5UNw3OzKHMeGfPaQ
 j9PvqpK6wC1p3tPsJlNlABhIym/SzYkdPHDQR9GzFD4W1jc4YXYyO2SQ4y7nw/G9Z6VO
 nAjQkR/TAtFEgYQnyz/tIq39Vf/xXONs+rqNwT/wkwm1QeQC1dZOdUF5kOkZRSaq6Iy8
 TuR0C70CGWHwlwGyXQMfx6f+G8c2UfAlnKODNHDCEt3zoGA8e82JL5OmCsLOYlg+jHrj
 +MBA==
X-Gm-Message-State: AOAM530pqx01sAWbptKnr79l2EVlQWXO25mq7lc0pWMqDYexEmFRBPP9
 qOWp6ieLrbLErk0WtX+LCXu/vQ==
X-Google-Smtp-Source: ABdhPJwrWIpLSYf41av9bZsrjEfrlf4lf8//RpX+N0WUgXGOZN7ZDB+gPcHHEGIp6RA3wivQd9OHbQ==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr26158129wrx.173.1600258057971; 
 Wed, 16 Sep 2020 05:07:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm4834552wmg.23.2020.09.16.05.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 05:07:36 -0700 (PDT)
Date: Wed, 16 Sep 2020 14:07:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 13/21] drm/rockchip: Convert to drm_gem_object_funcs
Message-ID: <20200916120733.GN438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-14-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_080739_336261_0C5306A2 
X-CRM114-Status: GOOD (  19.20  )
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

On Tue, Sep 15, 2020 at 04:59:50PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in rockchip. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  5 -----
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 10 ++++++++++
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 0f3eb392fe39..b7654f5e4225 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -212,15 +212,10 @@ static const struct file_operations rockchip_drm_driver_fops = {
>  static struct drm_driver rockchip_drm_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.lastclose		= drm_fb_helper_lastclose,
> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> -	.gem_free_object_unlocked = rockchip_gem_free_object,
>  	.dumb_create		= rockchip_gem_dumb_create,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_get_sg_table	= rockchip_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table	= rockchip_gem_prime_import_sg_table,
> -	.gem_prime_vmap		= rockchip_gem_prime_vmap,
> -	.gem_prime_vunmap	= rockchip_gem_prime_vunmap,
>  	.gem_prime_mmap		= rockchip_gem_mmap_buf,
>  	.fops			= &rockchip_drm_driver_fops,
>  	.name	= DRIVER_NAME,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 0055d86576f7..bddc7d99efe3 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -296,6 +296,14 @@ static void rockchip_gem_release_object(struct rockchip_gem_object *rk_obj)
>  	kfree(rk_obj);
>  }
>  
> +static const struct drm_gem_object_funcs rockchip_gem_object_funcs = {
> +	.free = rockchip_gem_free_object,
> +	.get_sg_table = rockchip_gem_prime_get_sg_table,
> +	.vmap = rockchip_gem_prime_vmap,
> +	.vunmap	= rockchip_gem_prime_vunmap,
> +	.vm_ops = &drm_gem_cma_vm_ops,
> +};
> +
>  static struct rockchip_gem_object *
>  	rockchip_gem_alloc_object(struct drm_device *drm, unsigned int size)
>  {
> @@ -310,6 +318,8 @@ static struct rockchip_gem_object *
>  
>  	obj = &rk_obj->base;
>  
> +	obj->funcs = &rockchip_gem_object_funcs;
> +
>  	drm_gem_object_init(drm, obj, size);
>  
>  	return rk_obj;
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
