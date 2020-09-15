Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAE5C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:08:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D1F02067C
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 15:08:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NqDlBxTW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="DY/uEfsi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D1F02067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bzCyqg0UC1S03V//azj1zw9U2kdXdH6v8z4IjsQxU34=; b=NqDlBxTWffr5IM8Go0Q/UajtA
	/qpEJq3oZ0nRfJL43nE/Oo53TnCVKM9Hu8ZYR6bReyc2hvZiYcXaBdRBQ9miTmX+qs29O/b0V5zaM
	yPd63e8DBUBFbhs9eackM1dSo2pOaiz2oICg6OYy25W9j0oq3ig4FNtI+5PCDNPxPLt7H2WgxmMVt
	RMt3cLqK/i7yB6c9nFu/yYDgJKFvlgB0kBB4x6haHmyVj+BVoNup4cSc/uc4xC5SA/CUAIg/pN9hQ
	aSs65vWSTuwWUe50VM4hKyRb2p8GKE04URa9dkSKKm6iAQ0VFGMUHEY2AEMIowjU/MEentntYUYBb
	50DW9V4pA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICZP-0005nj-UG; Tue, 15 Sep 2020 15:08:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICZN-0005nA-0j; Tue, 15 Sep 2020 15:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n0AeAcI3zA0iCIxRdvDpWIpeomoM/Ow+oqCMUrZ8unY=; b=DY/uEfsiICorhg8iHeARjWh0Q
 cS0EKw/YCxVo9c/DRgV77Gc/fMhw80uqdFD1X3NvNbG8E9/gDU7FOr8XhdiWA4oeGiVT2qR18cF2G
 rbumEdeKR7VfQDXUwezoo+hIbAR+lkT20j5iUe9RiL8DC97jOljbnlxm0stBllgiNwutxUvFMmjf2
 nZaK5hytHWAtFXkuU5EYx2JOLZTIRELbYZ15UAAlaZBs+E+zoYjszb6y0j79bc+LUZ0g2Qxuu6Zcq
 d7bL2K6UkYMroIM/nP+yxcofUcKz/TRZ/3IX2smVFTWH7UaXEb6h6XVwsj25JE3FRBD4+grwHrZEJ
 9t8rye/uQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34006)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kICYn-00035d-N0; Tue, 15 Sep 2020 16:07:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kICYY-0003lk-6C; Tue, 15 Sep 2020 16:07:42 +0100
Date: Tue, 15 Sep 2020 16:07:42 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 02/21] drm/armada: Introduce GEM object functions
Message-ID: <20200915150742.GO1551@shell.armlinux.org.uk>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-3-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_110833_075941_50C2A17A 
X-CRM114-Status: GOOD (  19.84  )
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
 krzk@kernel.org, sam@ravnborg.org, sumit.semwal@linaro.org,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, oleksandr_andrushchenko@epam.com,
 tomi.valkeinen@ti.com, linux-tegra@vger.kernel.org, robdclark@gmail.com,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, miaoqinglang@huawei.com,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com, p.zabel@pengutronix.de,
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
 daniel@ffwll.ch, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 04:59:39PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in armada.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

Thanks.

> ---
>  drivers/gpu/drm/armada/armada_drv.c |  3 ---
>  drivers/gpu/drm/armada/armada_gem.c | 12 +++++++++++-
>  drivers/gpu/drm/armada/armada_gem.h |  2 --
>  3 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 980d3f1f8f16..22247cfce80b 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -37,13 +37,10 @@ DEFINE_DRM_GEM_FOPS(armada_drm_fops);
>  
>  static struct drm_driver armada_drm_driver = {
>  	.lastclose		= drm_fb_helper_lastclose,
> -	.gem_free_object_unlocked = armada_gem_free_object,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_export	= armada_gem_prime_export,
>  	.gem_prime_import	= armada_gem_prime_import,
>  	.dumb_create		= armada_gem_dumb_create,
> -	.gem_vm_ops		= &armada_gem_vm_ops,
>  	.major			= 1,
>  	.minor			= 0,
>  	.name			= "armada-drm",
> diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
> index ecf8a55e93d9..c343fbefe47c 100644
> --- a/drivers/gpu/drm/armada/armada_gem.c
> +++ b/drivers/gpu/drm/armada/armada_gem.c
> @@ -25,7 +25,7 @@ static vm_fault_t armada_gem_vm_fault(struct vm_fault *vmf)
>  	return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
>  }
>  
> -const struct vm_operations_struct armada_gem_vm_ops = {
> +static const struct vm_operations_struct armada_gem_vm_ops = {
>  	.fault	= armada_gem_vm_fault,
>  	.open	= drm_gem_vm_open,
>  	.close	= drm_gem_vm_close,
> @@ -184,6 +184,12 @@ armada_gem_map_object(struct drm_device *dev, struct armada_gem_object *dobj)
>  	return dobj->addr;
>  }
>  
> +static const struct drm_gem_object_funcs armada_gem_object_funcs = {
> +	.free = armada_gem_free_object,
> +	.export = armada_gem_prime_export,
> +	.vm_ops = &armada_gem_vm_ops,
> +};
> +
>  struct armada_gem_object *
>  armada_gem_alloc_private_object(struct drm_device *dev, size_t size)
>  {
> @@ -195,6 +201,8 @@ armada_gem_alloc_private_object(struct drm_device *dev, size_t size)
>  	if (!obj)
>  		return NULL;
>  
> +	obj->obj.funcs = &armada_gem_object_funcs;
> +
>  	drm_gem_private_object_init(dev, &obj->obj, size);
>  
>  	DRM_DEBUG_DRIVER("alloc private obj %p size %zu\n", obj, size);
> @@ -214,6 +222,8 @@ static struct armada_gem_object *armada_gem_alloc_object(struct drm_device *dev,
>  	if (!obj)
>  		return NULL;
>  
> +	obj->obj.funcs = &armada_gem_object_funcs;
> +
>  	if (drm_gem_object_init(dev, &obj->obj, size)) {
>  		kfree(obj);
>  		return NULL;
> diff --git a/drivers/gpu/drm/armada/armada_gem.h b/drivers/gpu/drm/armada/armada_gem.h
> index de04cc2c8f0e..ffcc7e8dd351 100644
> --- a/drivers/gpu/drm/armada/armada_gem.h
> +++ b/drivers/gpu/drm/armada/armada_gem.h
> @@ -21,8 +21,6 @@ struct armada_gem_object {
>  	void			*update_data;
>  };
>  
> -extern const struct vm_operations_struct armada_gem_vm_ops;
> -
>  #define drm_to_armada_gem(o) container_of(o, struct armada_gem_object, obj)
>  
>  void armada_gem_free_object(struct drm_gem_object *);
> -- 
> 2.28.0
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
