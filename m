Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66478C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 11:35:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC55622208
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 11:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RC+3aJzv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="VZm53vKz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC55622208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GgeKEmyBnq39p5gZlGPXkD2J/Ga6f9hVdZSF6sJ6nyI=; b=RC+3aJzvbXcaIhYbfJW92B6ZI
	ue3yYObWJRdYub4yzPqF8SW0fwG9ak62Z4zghhfr069bv8Dlyq2AG6cMbcwB9a8ci7crXpQgK1nJP
	w1o0SuD3mshyNSJIbiwEHUsk0eSNW2akxsW89SNKC3OyQhn9cFqu50xZhzuIgSeC+ad0acHtFct87
	h4ESYbPA+/7aXs738W2UxLjkPUMdyXxC1tGZjX///Tc2je6yO6N1M1OQ00SAgYkNQ6WGjRDSCVd5z
	Yy7RmEvKBt6BYEX58TEqe7s+v22p1uJ02ERpui6tkGjgT4h4xjTeJgY+FrEl8zVq1E56D9E7hiFeT
	dDSJpiiBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIVie-0006iX-29; Wed, 16 Sep 2020 11:35:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIViZ-0006hB-Va
 for linux-mediatek@lists.infradead.org; Wed, 16 Sep 2020 11:35:21 +0000
Received: by mail-wm1-x343.google.com with SMTP id s13so2421984wmh.4
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2020 04:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DdTA+P9lRhC68qI4dpVtWpzlyCIniGzxdHE1O+Q7zUU=;
 b=VZm53vKzP2cW6qF7XV0KSRt5PPELHpk07zG//Mxa2CBTIBDdZdST/S+s0rdEQKVsZW
 gTZ1OWjoGqV/1N91UgOzFqec1vf3PElY/ngrFrKXGmjuOOcYrYiRpj5tf2Kdv9HG27Xk
 tCQbqYKzbNGq1n8DixVR/dUuMsm1DSxiACKH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DdTA+P9lRhC68qI4dpVtWpzlyCIniGzxdHE1O+Q7zUU=;
 b=gzuilZjYkqq6hrinGw5HluEWYrZGCHD5GxgrklGvarXjvfTo3g7FBTRFqXXsHcvxHH
 /URZWry8aFey6c92SInJaMye8Z6oHgVlbY9EGjZnFfIstCXeKjru+92ro+tIdpw55Ozb
 X/d71JMvLZTWfRyq0fhXAjP5Jh9nKSgBfA6hehBNaGm7OX+q4dFCEvTMnrSRqJrxHfxg
 uvAoY0LWEstPMcnUEyCIt0OaXEmrJDRgYl+qEqFser6rSUbjjgXpeigZQP6/E4HJ/hG8
 zCFVlxLQ30UMuLQRU9OOT2h++kB1kIJOeNkXB3DrvkuPktX0oZyBcuRuKCdXAsGYCbsB
 9GiQ==
X-Gm-Message-State: AOAM532b0YCXnwxQOjR9cdV+XB2f5+/X7/2NHPuiyi3aid+35kUD32oI
 F/68PRDLOZv5tG2bad9RHhNPsQ==
X-Google-Smtp-Source: ABdhPJylkcOBbGgEGGZKZhaBAwyH9kqk9RFSGhRv17hk61GEhNulx96NJ9Vhx8cdjXcbwhCg7LMEDQ==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr3990398wml.147.1600256118887; 
 Wed, 16 Sep 2020 04:35:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g14sm4163583wrv.25.2020.09.16.04.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 04:35:18 -0700 (PDT)
Date: Wed, 16 Sep 2020 13:35:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 07/21] drm/mediatek: Introduce GEM object functions
Message-ID: <20200916113514.GK438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-8-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_073520_067723_D704A144 
X-CRM114-Status: GOOD (  19.31  )
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

On Tue, Sep 15, 2020 at 04:59:44PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in mediatek. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  5 -----
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 11 +++++++++++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 040a8f393fe2..2f8d0043fca7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -301,18 +301,13 @@ struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
>  static struct drm_driver mtk_drm_driver = {
>  	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  
> -	.gem_free_object_unlocked = mtk_drm_gem_free_object,
> -	.gem_vm_ops = &drm_gem_cma_vm_ops,
>  	.dumb_create = mtk_drm_gem_dumb_create,
>  
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>  	.gem_prime_import = mtk_drm_gem_prime_import,
> -	.gem_prime_get_sg_table = mtk_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
>  	.gem_prime_mmap = mtk_drm_gem_mmap_buf,
> -	.gem_prime_vmap = mtk_drm_gem_prime_vmap,
> -	.gem_prime_vunmap = mtk_drm_gem_prime_vunmap,
>  	.fops = &mtk_drm_fops,
>  
>  	.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 6190cc3b7b0d..591b90410e4a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -8,11 +8,20 @@
>  #include <drm/drm.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_prime.h>
>  
>  #include "mtk_drm_drv.h"
>  #include "mtk_drm_gem.h"
>  
> +static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
> +	.free = mtk_drm_gem_free_object,
> +	.get_sg_table = mtk_gem_prime_get_sg_table,
> +	.vmap = mtk_drm_gem_prime_vmap,
> +	.vunmap = mtk_drm_gem_prime_vunmap,
> +	.vm_ops = &drm_gem_cma_vm_ops,
> +};
> +
>  static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
>  						unsigned long size)
>  {
> @@ -25,6 +34,8 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
>  	if (!mtk_gem_obj)
>  		return ERR_PTR(-ENOMEM);
>  
> +	mtk_gem_obj->base.funcs = &mtk_drm_gem_object_funcs;
> +
>  	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
>  	if (ret < 0) {
>  		DRM_ERROR("failed to initialize gem object\n");
> -- 
> 2.28.0

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
