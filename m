Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203A6C48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 08:07:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97F57613C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 08:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97F57613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zhbWkqIF8AI5Uu0lkMX5F5EdllRIOY1MvCeVABVUGsM=; b=YeJhtK6tf7Y7se
	OWx4k5d+ovcGmdtTjLAf/OKkgrzOLl12svh6Pq8m7k88zVDR1kLdQppnl2uX2nrMpstcw10RxFexJ
	8k7hM/00GUl0CCkXdhHZteoQmqPp4j8F8msfo+CGsrzEFE3vuSDm8hzg+0Jdu+tSbHHvm8BagUSxu
	koxbDi8zfbQRdsQIu6WScfkV6WQ/HWUDhMGWZV4XrHhYLmghlp8s6LQ6W3Ni+c3JsYAL+IbvMLEne
	BJK9Do/BwB0FvcQ/CbGJ+zZQvCHUbHQ4u0zpJteGwW2+XZYSYX5xUcMfu/P+NZFYArRXT1IHnwQNA
	8k4LHC/wIa8tilmsriGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwKO9-00DLu8-8p; Thu, 24 Jun 2021 08:07:05 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwKO6-00DLsb-Lj; Thu, 24 Jun 2021 08:07:04 +0000
IronPort-SDR: h8g3OQ5KJM2gFtx2Me8oLP4uFAbOqxXqtxnyZZ3Tl3bZAz120/mzN2HKiUnvp4pTYdAVAhD6Mc
 y0tDUuBHcRAw==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="204416285"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="204416285"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 01:06:48 -0700
IronPort-SDR: 8/eo5APk4zdMXu0FN+wLrM/zTggRpAhTnkAmYTRZ+IPR7FPPJCkD/zsI3oSWpDppu7y95aJRLY
 6S2bQnOSmTDA==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="453335479"
Received: from schulke-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 01:06:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, james.qian.wang@arm.com, liviu.dudau@arm.com,
 mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
In-Reply-To: <20210624072916.27703-5-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de>
Date: Thu, 24 Jun 2021 11:06:19 +0300
Message-ID: <87im23u1ok.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_010702_780659_E97371D6 
X-CRM114-Status: GOOD (  27.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> For KMS drivers, replace the IRQ check in VBLANK ioctls with a check for
> vblank support. IRQs might be enabled wthout vblanking being supported.
>
> This change also removes the DRM framework's only dependency on IRQ state
> for non-legacy drivers. For legacy drivers with userspace modesetting,
> the original test remains in drm_wait_vblank_ioctl().
>
> v3:
> 	* optimize test in drm_wait_vblank_ioctl() for KMS case (Liviu)
> 	* update docs for drm_irq_uninstall()
> v2:
> 	* keep the old test for legacy drivers in
> 	  drm_wait_vblank_ioctl() (Daniel)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_irq.c    | 13 ++++---------
>  drivers/gpu/drm/drm_vblank.c | 16 ++++++++++++----
>  2 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index c3bd664ea733..945dd82e2ea3 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -74,10 +74,8 @@
>   * only supports devices with a single interrupt on the main device stored in
>   * &drm_device.dev and set as the device paramter in drm_dev_alloc().
>   *
> - * These IRQ helpers are strictly optional. Drivers which roll their own only
> - * need to set &drm_device.irq_enabled to signal the DRM core that vblank
> - * interrupts are working. Since these helpers don't automatically clean up the
> - * requested interrupt like e.g. devm_request_irq() they're not really
> + * These IRQ helpers are strictly optional. Since these helpers don't automatically
> + * clean up the requested interrupt like e.g. devm_request_irq() they're not really
>   * recommended.
>   */
>  
> @@ -91,9 +89,7 @@
>   * and after the installation.
>   *
>   * This is the simplified helper interface provided for drivers with no special
> - * needs. Drivers which need to install interrupt handlers for multiple
> - * interrupts must instead set &drm_device.irq_enabled to signal the DRM core
> - * that vblank interrupts are available.
> + * needs.
>   *
>   * @irq must match the interrupt number that would be passed to request_irq(),
>   * if called directly instead of using this helper function.
> @@ -156,8 +152,7 @@ EXPORT_SYMBOL(drm_irq_install);
>   *
>   * Calls the driver's &drm_driver.irq_uninstall function and unregisters the IRQ
>   * handler.  This should only be called by drivers which used drm_irq_install()
> - * to set up their interrupt handler. Other drivers must only reset
> - * &drm_device.irq_enabled to false.
> + * to set up their interrupt handler.
>   *
>   * Note that for kernel modesetting drivers it is a bug if this function fails.
>   * The sanity checks are only to catch buggy user modesetting drivers which call
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 3417e1ac7918..10fe16bafcb6 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  	unsigned int pipe_index;
>  	unsigned int flags, pipe, high_pipe;
>  
> -	if (!dev->irq_enabled)
> -		return -EOPNOTSUPP;
> +#if defined(CONFIG_DRM_LEGACY)
> +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
> +		if (!dev->irq_enabled)
> +			return -EOPNOTSUPP;
> +	} else /* if DRIVER_MODESET */
> +#endif
> +	{
> +		if (!drm_dev_has_vblank(dev))
> +			return -EOPNOTSUPP;
> +	}

Sheesh I hate this kind of inline #ifdefs.

Two alternate suggestions that I believe should be as just efficient:

1) The more verbose:

#if defined(CONFIG_DRM_LEGACY)
static bool drm_wait_vblank_supported(struct drm_device *dev)
{
	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
		return dev->irq_enabled;
	else
		return drm_dev_has_vblank(dev);
}
#else
static bool drm_wait_vblank_supported(struct drm_device *dev)
{
	return drm_dev_has_vblank(dev);
}
#endif

2) The more compact:

static bool drm_wait_vblank_supported(struct drm_device *dev)
{
	if  (IS_ENABLED(CONFIG_DRM_LEGACY) && unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
		return dev->irq_enabled;
	else
		return drm_dev_has_vblank(dev);
}

Then, in drm_wait_vblank_ioctl().

	if (!drm_wait_vblank_supported(dev))
		return -EOPNOTSUPP;

The compiler should do the right thing without any explicit inline
keywords etc.

BR,
Jani.

>  
>  	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>  		return -EINVAL;
> @@ -2023,7 +2031,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	if (!dev->irq_enabled)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EOPNOTSUPP;
>  
>  	crtc = drm_crtc_find(dev, file_priv, get_seq->crtc_id);
> @@ -2082,7 +2090,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	if (!dev->irq_enabled)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EOPNOTSUPP;
>  
>  	crtc = drm_crtc_find(dev, file_priv, queue_seq->crtc_id);

-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
