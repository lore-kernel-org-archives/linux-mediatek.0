Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAAFC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:09:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AEF2074D
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NkzJbHrV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86AEF2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UhyyHXKQShTSyQYGEJDj2cLmStLFPnwnR3ClxDzczO4=; b=NkzJbHrVpAy4hWOyCM7FBhI+z
	Vs2FJap129Jore4YRLWiHMfxCHg6f74wkdHG0tVLRoPDGdAHzL6YJ/9L67d9vLgcrIU8tij02l7iL
	7Y8798MesviEYugyhJBVlXVNhduYkq/5+pwVaFojFGMoRTG2lm921K6dF6V/mndIeeryDAyGU3G/M
	uLC8ziHBUGTKo0h8WybWj1139IdzbE0iuOcNx0JN2RAcNiOHaVjmbNR1BrZidHIDg6p3M5SDpF1gn
	H8UYCPW1+varL8Lw2Y05LFm2sBcsUVWcB2q3lnIOHUDb+YM6DewPAhMRgSuFsq1NW8kZA9nC2zX0D
	pTpN57HJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k69EH-0007UA-Ce; Thu, 13 Aug 2020 09:08:57 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69EB-0007Rv-UW; Thu, 13 Aug 2020 09:08:55 +0000
IronPort-SDR: LW5HD3aVrQhWASlo47h/C+KSIDdv2JKHDnCtTON+pAAFMtKrceXjmruqVtkaNP9VVtWwcaiWo8
 BarHL/2hh2Tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="215715365"
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; d="scan'208";a="215715365"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 02:08:48 -0700
IronPort-SDR: MzLdBg29y17Qw947zHTwHA+CSmHBs2Zvn+6Bs6sqi/aBfHd1F5a0YahIdS8U60Hdv6sgpLlMWW
 /z+PVkWCy4qA==
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; d="scan'208";a="470144306"
Received: from jgronski-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.170])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 02:08:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run,
 bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net,
 hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com,
 jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com, oleksandr_andrushchenko@epam.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, sumit.semwal@linaro.org, evan.quan@amd.com,
 Hawking.Zhang@amd.com, tianci.yin@amd.com, marek.olsak@amd.com,
 hdegoede@redhat.com, andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 abdiel.janulgue@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
Subject: Re: [PATCH 06/20] drm/i915: Introduce GEM object functions
In-Reply-To: <20200813083644.31711-7-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-7-tzimmermann@suse.de>
Date: Thu, 13 Aug 2020 12:08:12 +0300
Message-ID: <877du2j4lf.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_050852_131153_2942CE34 
X-CRM114-Status: GOOD (  19.45  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 13 Aug 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in i915.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c       |  9 ++++++++-
>  drivers/gpu/drm/i915/i915_drv.c                  | 10 ++++++----
>  drivers/gpu/drm/i915/i915_drv.h                  |  1 +
>  drivers/gpu/drm/i915/selftests/mock_gem_device.c |  3 ---
>  4 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index c8421fd9d2dc..bc15ee4f2bd5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -41,7 +41,14 @@ static struct i915_global_object {
>  
>  struct drm_i915_gem_object *i915_gem_object_alloc(void)
>  {
> -	return kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
> +	struct drm_i915_gem_object *obj;
> +
> +	obj = kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
> +	if (!obj)
> +		return NULL;
> +	obj->base.funcs = &i915_gem_object_funcs;
> +
> +	return obj;
>  }
>  
>  void i915_gem_object_free(struct drm_i915_gem_object *obj)
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 068447f565a9..b09eee11c540 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1840,6 +1840,12 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_RENDER_ALLOW),
>  };
>  
> +const struct drm_gem_object_funcs i915_gem_object_funcs = {
> +	.free = i915_gem_free_object,
> +	.close = i915_gem_close_object,
> +	.export = i915_gem_prime_export,
> +};
> +

Any reason not to make this static in i915_gem_object.c next to its only
user?

BR,
Jani.


>  static struct drm_driver driver = {
>  	/* Don't use MTRRs here; the Xserver or userspace app should
>  	 * deal with them for Intel hardware.
> @@ -1853,12 +1859,8 @@ static struct drm_driver driver = {
>  	.lastclose = i915_driver_lastclose,
>  	.postclose = i915_driver_postclose,
>  
> -	.gem_close_object = i915_gem_close_object,
> -	.gem_free_object_unlocked = i915_gem_free_object,
> -
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = i915_gem_prime_export,
>  	.gem_prime_import = i915_gem_prime_import,
>  
>  	.dumb_create = i915_gem_dumb_create,
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index bacb4c762f5b..666db65fe69e 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1736,6 +1736,7 @@ intel_ggtt_update_needs_vtd_wa(struct drm_i915_private *dev_priv)
>  
>  /* i915_drv.c */
>  extern const struct dev_pm_ops i915_pm_ops;
> +extern const struct drm_gem_object_funcs i915_gem_object_funcs;
>  
>  int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>  void i915_driver_remove(struct drm_i915_private *i915);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index ce4d4303229c..4725dad63e0a 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -86,9 +86,6 @@ static struct drm_driver mock_driver = {
>  	.name = "mock",
>  	.driver_features = DRIVER_GEM,
>  	.release = mock_device_release,
> -
> -	.gem_close_object = i915_gem_close_object,
> -	.gem_free_object_unlocked = i915_gem_free_object,
>  };
>  
>  static void release_dev(struct device *dev)

-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
