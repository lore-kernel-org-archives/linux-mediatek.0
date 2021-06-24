Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8504CC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 08:52:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4773B613DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 08:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4773B613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCaBFI+iAxgw5FFQ42Dd+mICxfFJjOx7Mr3THiekZAw=; b=P7PK793BrqwkTk
	W8eJ3ZKV9sUNjSF8d8Bls6A/klYpYfcYgn8JjW+krjMUOpM7yZQnXp5+P9UldPDAunaq/S4CtJZQU
	ZnBzewf6DeAtK6eoIEVMhIHeV+W1PRGd84DLescIriUf0l/BaII/pmZ3ACOZUkxsrWbGjL4vV5kcY
	yEoJQ4wVxOPxq9T1nNJYa76RdypAi3c2SLT3uzeQDTdt41Y0sWs+0ZV11zpy3U6E1+v42NoTr55y+
	TVVW/8MOowiR7zAczayO5f/pDyS/Agcw5XisRBngiyFAPnb7foKCwlHdivNkCZLFbrjkx2cQpxeza
	hidalGvpKHFhK/XXs1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwL5m-00DX9Q-TZ; Thu, 24 Jun 2021 08:52:10 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwL5k-00DX8U-20; Thu, 24 Jun 2021 08:52:09 +0000
IronPort-SDR: nFEcMs7bEzjM+IsWyGHjwj6uXA32BTTRq0XFjnJ61Wz/ulHIs2MJgWKzywuP3I+TbMEwAegncU
 qky0bB1MW9Qg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="268563026"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="268563026"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 01:52:06 -0700
IronPort-SDR: b2WPW20xI/GJO29ic6WIfxIMz72rLAtb0USOd7lNI7J+Sgm2+3/EG1ErQrLUO2vnU20Qh+TbCW
 rzKM1urai8Fg==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="487681787"
Received: from schulke-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.242])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 01:51:41 -0700
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
In-Reply-To: <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com>
 <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de>
Date: Thu, 24 Jun 2021 11:51:37 +0300
Message-ID: <877dijtzl2.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_015208_186477_2240E1CB 
X-CRM114-Status: GOOD (  14.66  )
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
> Hi
>
> Am 24.06.21 um 10:06 schrieb Jani Nikula:
>> On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>>> index 3417e1ac7918..10fe16bafcb6 100644
>>> --- a/drivers/gpu/drm/drm_vblank.c
>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>> @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>>>   	unsigned int pipe_index;
>>>   	unsigned int flags, pipe, high_pipe;
>>>   
>>> -	if (!dev->irq_enabled)
>>> -		return -EOPNOTSUPP;
>>> +#if defined(CONFIG_DRM_LEGACY)
>>> +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
>>> +		if (!dev->irq_enabled)
>>> +			return -EOPNOTSUPP;
>>> +	} else /* if DRIVER_MODESET */
>>> +#endif
>>> +	{
>>> +		if (!drm_dev_has_vblank(dev))
>>> +			return -EOPNOTSUPP;
>>> +	}
>> 
>> Sheesh I hate this kind of inline #ifdefs.
>> 
>> Two alternate suggestions that I believe should be as just efficient:
>
> Or how about:
>
> static bool drm_wait_vblank_supported(struct drm_device *dev)
>
> {
>
> if defined(CONFIG_DRM_LEGACY)
> 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>
> 		return dev->irq_enabled;
>
> #endif
> 	return drm_dev_has_vblank(dev);
>
> }
>
>
> ?
>
> It's inline, but still readable.

It's definitely better than the original, but it's unclear to me why
you'd prefer this over option 2) below. I guess the only reason I can
think of is emphasizing the conditional compilation. However,
IS_ENABLED() is widely used in this manner specifically to avoid inline
#if, and the compiler optimizes it away.

BR,
Jani.


>
> Best regards
> Thomas
>
>> 
>> 1) The more verbose:
>> 
>> #if defined(CONFIG_DRM_LEGACY)
>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>> {
>> 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>> 		return dev->irq_enabled;
>> 	else
>> 		return drm_dev_has_vblank(dev);
>> }
>> #else
>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>> {
>> 	return drm_dev_has_vblank(dev);
>> }
>> #endif
>> 
>> 2) The more compact:
>> 
>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>> {
>> 	if  (IS_ENABLED(CONFIG_DRM_LEGACY) && unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>> 		return dev->irq_enabled;
>> 	else
>> 		return drm_dev_has_vblank(dev);
>> }
>> 
>> Then, in drm_wait_vblank_ioctl().
>> 
>> 	if (!drm_wait_vblank_supported(dev))
>> 		return -EOPNOTSUPP;
>> 
>> The compiler should do the right thing without any explicit inline
>> keywords etc.
>> 
>> BR,
>> Jani.
>> 
>>>   
>>>   	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>>>   		return -EINVAL;
>>> @@ -2023,7 +2031,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>   		return -EOPNOTSUPP;
>>>   
>>> -	if (!dev->irq_enabled)
>>> +	if (!drm_dev_has_vblank(dev))
>>>   		return -EOPNOTSUPP;
>>>   
>>>   	crtc = drm_crtc_find(dev, file_priv, get_seq->crtc_id);
>>> @@ -2082,7 +2090,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>   		return -EOPNOTSUPP;
>>>   
>>> -	if (!dev->irq_enabled)
>>> +	if (!drm_dev_has_vblank(dev))
>>>   		return -EOPNOTSUPP;
>>>   
>>>   	crtc = drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
