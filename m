Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB1DC43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 16:15:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FDB621D41
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 16:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vibf2crn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FDB621D41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aOaVoQE6kAOkz1zVKV3FlGuN0PYvYmoImxVb7Yi5Bx0=; b=Vibf2crnOJjQ+OhJ40c5RYZEE
	n6W1iksXrA/aI+EySCIigxqGv95g4+ezoz4zC48QQDPtivXwgHfagjeR2GKRzboI+cQKdSLGlaVjl
	munthtvRwOWMyu8BpWDasaVJkd+JFqt5tmKE58ItYPVah1JG4tMVDTTfyr6p2DOQLg3lzWyKXx7u7
	LB6l/s/DBFpbP0+9hP7Mwx8EgDYBXTKgMth/XYRnKmiTM+U0STjoFUXlABPEuIy+IYpnHu5TL/1l+
	jNuqey8ScZJrzp0aJDmt74fZKdFe3O9cwe3o6z9jBZAzzlvu06C47H6WBSc5k/dCHmEAss5lSvDPO
	FKpihZ1kQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIDbk-0006wO-0V; Tue, 15 Sep 2020 16:15:04 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDbg-0006tN-A8; Tue, 15 Sep 2020 16:15:01 +0000
IronPort-SDR: CJMhdRI9hrIaNAJoXFoMAmOeYs0NGWwzjpdLwMFq+SB1JQEZZV3Kl3RsXfmu91RZqB91Jasw0B
 jDEL0GJUa/fg==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="223480716"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="223480716"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 09:14:54 -0700
IronPort-SDR: 1NweJQ/LUpVMZGR2CNL7idgXNRkgQYlVvGnbjzV+v3epVrjgQ3OHB8LQ+g+ZsKRvdD4MQ7Rl1b
 B/J1ZOWPLOog==
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="451484915"
Received: from oshaham-mobl.ger.corp.intel.com (HELO [10.214.241.3])
 ([10.214.241.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 09:14:31 -0700
Subject: Re: [PATCH v2 06/21] drm/i915: Introduce GEM object functions
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, andi.shyti@intel.com, sam@ravnborg.org,
 miaoqinglang@huawei.com, emil.velikov@collabora.com
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-7-tzimmermann@suse.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <76e5eb2f-e324-8f56-866a-15b022abba8d@linux.intel.com>
Date: Tue, 15 Sep 2020 17:14:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915145958.19993-7-tzimmermann@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_121500_582822_204F48FD 
X-CRM114-Status: GOOD (  23.01  )
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
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 15/09/2020 15:59, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in i915.
> 
> v2:
> 	* move object-function instance to i915_gem_object.c (Jani)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 21 ++++++++++++++++---
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 ---
>   drivers/gpu/drm/i915/i915_drv.c               |  4 ----
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 ---
>   4 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index c8421fd9d2dc..3389ac972d16 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -39,9 +39,18 @@ static struct i915_global_object {
>   	struct kmem_cache *slab_objects;
>   } global;
>   
> +static const struct drm_gem_object_funcs i915_gem_object_funcs;
> +
>   struct drm_i915_gem_object *i915_gem_object_alloc(void)
>   {
> -	return kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
> +	struct drm_i915_gem_object *obj;
> +
> +	obj = kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
> +	if (!obj)
> +		return NULL;
> +	obj->base.funcs = &i915_gem_object_funcs;
> +
> +	return obj;
>   }
>   
>   void i915_gem_object_free(struct drm_i915_gem_object *obj)
> @@ -101,7 +110,7 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
>   		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE);
>   }
>   
> -void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
> +static void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
>   {
>   	struct drm_i915_gem_object *obj = to_intel_bo(gem);
>   	struct drm_i915_file_private *fpriv = file->driver_priv;
> @@ -264,7 +273,7 @@ static void __i915_gem_free_work(struct work_struct *work)
>   	i915_gem_flush_free_objects(i915);
>   }
>   
> -void i915_gem_free_object(struct drm_gem_object *gem_obj)
> +static void i915_gem_free_object(struct drm_gem_object *gem_obj)
>   {
>   	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> @@ -403,6 +412,12 @@ int __init i915_global_objects_init(void)
>   	return 0;
>   }
>   
> +static const struct drm_gem_object_funcs i915_gem_object_funcs = {
> +	.free = i915_gem_free_object,
> +	.close = i915_gem_close_object,
> +	.export = i915_gem_prime_export,
> +};
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftests/huge_gem_object.c"
>   #include "selftests/huge_pages.c"
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index d46db8d8f38e..eaf3d4147be0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -38,9 +38,6 @@ void __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
>   
>   int i915_gem_object_attach_phys(struct drm_i915_gem_object *obj, int align);
>   
> -void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file);
> -void i915_gem_free_object(struct drm_gem_object *obj);
> -
>   void i915_gem_flush_free_objects(struct drm_i915_private *i915);
>   
>   struct sg_table *
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 94e00e450683..011a3fb41ece 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1750,12 +1750,8 @@ static struct drm_driver driver = {
>   	.lastclose = i915_driver_lastclose,
>   	.postclose = i915_driver_postclose,
>   
> -	.gem_close_object = i915_gem_close_object,
> -	.gem_free_object_unlocked = i915_gem_free_object,
> -
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = i915_gem_prime_export,
>   	.gem_prime_import = i915_gem_prime_import,
>   
>   	.dumb_create = i915_gem_dumb_create,
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index f127e633f7ca..9244b5d6fb01 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -87,9 +87,6 @@ static struct drm_driver mock_driver = {
>   	.name = "mock",
>   	.driver_features = DRIVER_GEM,
>   	.release = mock_device_release,
> -
> -	.gem_close_object = i915_gem_close_object,
> -	.gem_free_object_unlocked = i915_gem_free_object,
>   };
>   
>   static void release_dev(struct device *dev)
> 

Looks obviously fine.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
