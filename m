Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3480C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 13:39:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5CF2078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 13:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WINWNb7r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fGcxd9nB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E5CF2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MgqxharjhytfL9zL5m0BmfnWAnvzKcsdM42aEIKTMcU=; b=WINWNb7r+Jk1zZMifSL7IAwRx
	18uZRbnmHirF0GpYfQnTNhWkDUf+T1QBSkCUIOsk52SzA6swiaht3V1xngZxEmb/cJ9vlRN2Q8x+N
	vyBM6gOahHh+FrXlGh2JmbARxOmIqcJtEpu9FpsTVU226kPYqA9eEaYvGW+S3eNdyUchWGnqr5Ofn
	jVhXCBVdW4cB4pFMPcGlAQMhA8egXlud/SsTiMxHu7N6gt9NPtM+5J0pqdVx1aZQLhtQV6haf1qI9
	BbiBExdg9lFHO2KQYpUdRwvgk+NkCj6SvLNh7QoqnU+/2vHEj5nkIgaMBx2roHYIZP0H4Ye8ztXrX
	04/enLs5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6DRo-0003PA-9l; Thu, 13 Aug 2020 13:39:12 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6DRk-0003OL-Tp; Thu, 13 Aug 2020 13:39:09 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5A85DC4;
 Thu, 13 Aug 2020 15:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597325947;
 bh=u7wHRaVyO7DrbsX2nqetdVnvRuNOMGWV+k6ki9aYG+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fGcxd9nBc+UvEuHeqangKI78ZhZFqN7chbSr5l/BS8YYWVbtOrnLTbcqBss75NxSr
 Sy/AjGzT5m1nGI0nUiBQAUZ+SJwtOcikeUfTJtoqGHVo6GY58v5i5tdk5nWLelSZsu
 5Dkl+JflxlwXT455dCEmZVr0RCRVzEXLte98LlM8=
Date: Thu, 13 Aug 2020 16:38:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/20] drm/omapdrm: Introduce GEM object functions
Message-ID: <20200813133853.GK6057@pendragon.ideasonboard.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813083644.31711-11-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_093909_103071_1B7EFD7C 
X-CRM114-Status: GOOD (  19.54  )
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
 abdiel.janulgue@linux.intel.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, oleksandr_andrushchenko@epam.com,
 tomi.valkeinen@ti.com, linux-tegra@vger.kernel.org, linux@armlinux.org.uk,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, chunkuang.hu@kernel.org, andi.shyti@intel.com,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, marek.olsak@amd.com,
 tianci.yin@amd.com, maarten.lankhorst@linux.intel.com,
 etnaviv@lists.freedesktop.org, jani.nikula@linux.intel.com,
 inki.dae@samsung.com, hdegoede@redhat.com, christian.gmeiner@gmail.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org, rodrigo.vivi@intel.com,
 matthias.bgg@gmail.com, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk, hyun.kwon@xilinx.com,
 rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 miaoqinglang@huawei.com, kyungmin.park@samsung.com, nirmoy.das@amd.com,
 p.zabel@pengutronix.de, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Thomas,

Thank you for the patch.

On Thu, Aug 13, 2020 at 10:36:34AM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in omapdrm.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.c |  9 ---------
>  drivers/gpu/drm/omapdrm/omap_gem.c | 16 +++++++++++++++-
>  drivers/gpu/drm/omapdrm/omap_gem.h |  1 -
>  3 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index 53d5e184ee77..2e598b8b72af 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -521,12 +521,6 @@ static int dev_open(struct drm_device *dev, struct drm_file *file)
>  	return 0;
>  }
>  
> -static const struct vm_operations_struct omap_gem_vm_ops = {
> -	.fault = omap_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static const struct file_operations omapdriver_fops = {
>  	.owner = THIS_MODULE,
>  	.open = drm_open,
> @@ -549,10 +543,7 @@ static struct drm_driver omap_drm_driver = {
>  #endif
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = omap_gem_prime_export,
>  	.gem_prime_import = omap_gem_prime_import,
> -	.gem_free_object_unlocked = omap_gem_free_object,
> -	.gem_vm_ops = &omap_gem_vm_ops,
>  	.dumb_create = omap_gem_dumb_create,
>  	.dumb_map_offset = omap_gem_dumb_map_offset,
>  	.ioctls = ioctls,
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index d0d12d5dd76c..d68dc63dea0a 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -487,7 +487,7 @@ static vm_fault_t omap_gem_fault_2d(struct drm_gem_object *obj,
>   * vma->vm_private_data points to the GEM object that is backing this
>   * mapping.
>   */
> -vm_fault_t omap_gem_fault(struct vm_fault *vmf)
> +static vm_fault_t omap_gem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
> @@ -1169,6 +1169,18 @@ static bool omap_gem_validate_flags(struct drm_device *dev, u32 flags)
>  	return true;
>  }
>  
> +static const struct vm_operations_struct omap_gem_vm_ops = {
> +	.fault = omap_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs omap_gem_object_funcs = {
> +	.free = omap_gem_free_object,
> +	.export = omap_gem_prime_export,
> +	.vm_ops = &omap_gem_vm_ops,
> +};
> +
>  /* GEM buffer object constructor */
>  struct drm_gem_object *omap_gem_new(struct drm_device *dev,
>  		union omap_gem_size gsize, u32 flags)
> @@ -1236,6 +1248,8 @@ struct drm_gem_object *omap_gem_new(struct drm_device *dev,
>  		size = PAGE_ALIGN(gsize.bytes);
>  	}
>  
> +	obj->funcs = &omap_gem_object_funcs;
> +
>  	/* Initialize the GEM object. */
>  	if (!(flags & OMAP_BO_MEM_SHMEM)) {
>  		drm_gem_private_object_init(dev, obj, size);
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h b/drivers/gpu/drm/omapdrm/omap_gem.h
> index 729b7812a815..9e6b5c8195d9 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.h
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.h
> @@ -69,7 +69,6 @@ struct dma_buf *omap_gem_prime_export(struct drm_gem_object *obj, int flags);
>  struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
>  		struct dma_buf *buffer);
>  
> -vm_fault_t omap_gem_fault(struct vm_fault *vmf);

I like how this function now becomes internal to omap_gem.c.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  int omap_gem_roll(struct drm_gem_object *obj, u32 roll);
>  void omap_gem_cpu_sync_page(struct drm_gem_object *obj, int pgoff);
>  void omap_gem_dma_sync_buffer(struct drm_gem_object *obj,

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
