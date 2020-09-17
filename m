Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E34EC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 14:02:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5B992220F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 14:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcKPgvdx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNZiBZAK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5B992220F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ehDj5rbpiCgaHJMPjuR0LgAwYH5MSU69lbSYwAPg+W4=; b=rcKPgvdxGsF5Qg6nQWk1nbkWd
	andv7XZIyA4vwBuYSaXjTGiMbn83KMOVOobbNVvi93Xtum43oixSSr3jzNw02fcRRUkjPCluE/qN/
	NN1fEfeRgoFk90hyqw04pG1v5XtEvbrqrizH9uNzLgVqCAbhihXN0Vjcpa/CG9pzrPFcIteaL4uzi
	xOMWvtxi6bN8B4x+At1OOaXa5inZg7Y55CRqCmIWsvzLHemGj8zVnPcV3I3fAIxdVfwwv5RHMQbRv
	pJ+FvDjMkSxxMkIAq2e/y0Q5RgrMEwOePigqp9VGlwBTr9Zkp0ran+Ja7mWTeXHKJ8TUEH7/p210V
	DnvVJJVeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIuU6-0007l8-BJ; Thu, 17 Sep 2020 14:02:02 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIuU3-0007jy-HO; Thu, 17 Sep 2020 14:02:00 +0000
Received: by mail-wm1-x342.google.com with SMTP id s13so2079501wmh.4;
 Thu, 17 Sep 2020 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lBUrIOfg3+mq8ad85tbb7EImBFZIDC/tVRBXQ4hE1ik=;
 b=DNZiBZAKqypMSqQJoyD2IPrVpqiI3ikdcnRtqSUtglPbT/8APSdwaP78S9dCceWhaB
 CUFzh+i3SYFxQjgJQYQXA+eAyv74bC7KPueFL/Gfi5sPNtWoyu6oeH0LQkpIWYJSX21y
 rV7VkyxfFYten7MOhzm3Bz7i04GYai5m0PJD8/+pat7mIsmnFKD4UKKCCUMZ01zZFTbO
 PKJYwiwHEuO6KO353OHy/LaLG0eDM48NEvTlWgc4GQY7VXvipXO0S4rEEhbCyvprEr3R
 BIuNCJjy1NTGULEvR1fAoX12DfpViAnvzecyOpIl9S6AtbE1NSwC4GsSGoUx0L019NSL
 oeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lBUrIOfg3+mq8ad85tbb7EImBFZIDC/tVRBXQ4hE1ik=;
 b=O2UyiAuXxHVbTWIC0bEw4iGT5ugee0OhpRLZ3Qc5p1m81svewCdujsKk8Rp4SvsRBH
 RhV7aV1R6+rcUjeypMlAcgh2MgPI1jHLtvsGJVQtbrPUsco0HHi/nNhCrQkScWzsz2qm
 y4JYRue/S0X+BXT7szzLUvMRvC8C53mPN7PFyVqgAUymRWp01rREE++zGOFBq51YWg0G
 shnnuBL2wm3jINL+M2iFD8GoDrKJ4Vyx18Q8Nio3pPXQJPCXT1HX+sez4e+z3BE3OQ16
 MOLKkl9GAEYK7BAvJ/q5N51yqxF5m6KoavW24Xi7HtFmiMKBrVYeRs/Xem4k/j4iZWSG
 GI6w==
X-Gm-Message-State: AOAM532NnQyOlPD6PHpikRiE+OsObJQmkRgD9tvFrsbeCGKhwXeR9L+L
 28LjUPdtrl+r2UiuyZu0A4c=
X-Google-Smtp-Source: ABdhPJwVFsi9VyC5N2zDyjQYYSf7iQdzkgcW/plJduCk7Y3eMkitDq4/6m+bqkSKVjF1esIZWne4iA==
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr10119624wmf.20.1600351318328; 
 Thu, 17 Sep 2020 07:01:58 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id z14sm37316830wrh.14.2020.09.17.07.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 07:01:57 -0700 (PDT)
Date: Thu, 17 Sep 2020 11:01:48 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 16/21] drm/vgem: Introduce GEM object functions
Message-ID: <20200917140148.orpdihcctrr5upxg@smtp.gmail.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-17-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-17-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_100159_606292_080D8742 
X-CRM114-Status: GOOD (  20.58  )
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

Hi Thomas,

On 09/15, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in vgem. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks here again.

This drv file is little tumultuous to me.
I mean, I took a while to sort functions in my head.

However, finally, I got it, and the change looks good.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index cb884c890065..fa54a6d1403d 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -50,6 +50,8 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> +static const struct drm_gem_object_funcs vgem_gem_object_funcs;
> +
>  static struct vgem_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> @@ -167,6 +169,8 @@ static struct drm_vgem_gem_object *__vgem_gem_create(struct drm_device *dev,
>  	if (!obj)
>  		return ERR_PTR(-ENOMEM);
>  
> +	obj->base.funcs = &vgem_gem_object_funcs;
> +
>  	ret = drm_gem_object_init(dev, &obj->base, roundup(size, PAGE_SIZE));
>  	if (ret) {
>  		kfree(obj);
> @@ -401,12 +405,20 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
>  	return 0;
>  }
>  
> +static const struct drm_gem_object_funcs vgem_gem_object_funcs = {
> +	.free = vgem_gem_free_object,
> +	.pin = vgem_prime_pin,
> +	.unpin = vgem_prime_unpin,
> +	.get_sg_table = vgem_prime_get_sg_table,
> +	.vmap = vgem_prime_vmap,
> +	.vunmap = vgem_prime_vunmap,
> +	.vm_ops = &vgem_gem_vm_ops,
> +};
> +
>  static struct drm_driver vgem_driver = {
>  	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
>  	.open				= vgem_open,
>  	.postclose			= vgem_postclose,
> -	.gem_free_object_unlocked	= vgem_gem_free_object,
> -	.gem_vm_ops			= &vgem_gem_vm_ops,
>  	.ioctls				= vgem_ioctls,
>  	.num_ioctls 			= ARRAY_SIZE(vgem_ioctls),
>  	.fops				= &vgem_driver_fops,
> @@ -415,13 +427,8 @@ static struct drm_driver vgem_driver = {
>  
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_pin = vgem_prime_pin,
> -	.gem_prime_unpin = vgem_prime_unpin,
>  	.gem_prime_import = vgem_prime_import,
>  	.gem_prime_import_sg_table = vgem_prime_import_sg_table,
> -	.gem_prime_get_sg_table = vgem_prime_get_sg_table,
> -	.gem_prime_vmap = vgem_prime_vmap,
> -	.gem_prime_vunmap = vgem_prime_vunmap,
>  	.gem_prime_mmap = vgem_prime_mmap,
>  
>  	.name	= DRIVER_NAME,
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
