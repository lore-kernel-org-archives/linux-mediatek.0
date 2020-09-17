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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF45FC2BBD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 11:31:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6D9D21655
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 11:31:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FAwZ3r3M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WT+tCnqs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6D9D21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3TQx58e2Yb2e0sTUknWtI63uyb8Jxv78mXvKZc7OfJI=; b=FAwZ3r3M37oXz4ar6BZHoNQo9
	YEO9GCBSIKeZhG/VfYSAW2Vi6OGIuwjJ0x0A7GmrmpgXDB4Po79c7U64BTHeW9Fjj8EOMO1Cp9Mta
	nm13voRAoUgEQEjcnv8mrHkRGs1If8ZhNn50XcPWoB1qYO+hg74D9UMf0qlIbWKFPLhy51cCXnYfu
	a8E7CYT1wx4Ot1YK8d5sx2fKUSHW9qddlca/X3tdCrniUKY4vWfDpUTpLC/49l77AQBjRMWpFFkfZ
	TR+9DUuQjODgyz7ghlPsXqy2tK87JcNN4CfezZGA/o2x0xuaoBYrK4duqjmXqt158lUHu7qNweMAC
	KSrZRzDzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIs8X-0004lo-MP; Thu, 17 Sep 2020 11:31:37 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIs8S-0004kt-U9; Thu, 17 Sep 2020 11:31:34 +0000
Received: by mail-wm1-x342.google.com with SMTP id q9so1623301wmj.2;
 Thu, 17 Sep 2020 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QoGoJWGY9uvsPbK1VFldPakdj/95886EaH4XmF5Nmig=;
 b=WT+tCnqscdjnhBzx4pey4qfrs3TpF1Xktu7jt8T8cQSP0yZJdX3KoYHPdWspzIugsq
 6HSKY9VJKgsdLw89cCYxqdbs7Vt7/k4/jK9LtTE+4i9XvfXW1Lr/Fm+fEnngxxWPD5dx
 hAgvu8wEl2ImGMZ/Vxi1axcUTWC/C1hcCZmRCP+VMlQrWSEcu/Hqzj+fuVKA2INfBjX3
 /zcARTJCVi7gGPGSYovxguWtsuZzPwF6TsPs2IH9t/Kp5k3R+t/9fCDbL8cqbYXRyKxo
 iHGdqfCt+o61f/ixQfUMrk5tyRoSS69zCZaqGiTmJsGllEHi/xlz25EYavgN+6zZY8AL
 WM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QoGoJWGY9uvsPbK1VFldPakdj/95886EaH4XmF5Nmig=;
 b=ShNisSa3lGsRSDlhvFwhKvATv3nE+XbOJO8S+WLWkEeFGnas24c7iArcxItcqqmyC4
 Pmc5RE+M+u51mzJTEjojzfjRDvXmgjEphX+J+8JJonDIA0P3pZOXhWdrXreBSBLj3/fh
 oqOkjAfM4UAVo/oJZNkTVYpA5bNRZLboA0/R74/Wo3KjDMVzyBsTaPra4WnPpuqWTxXm
 shDObt1oKm+14bV6GL4qJbLc+pj6FQmaaY9OAZyXDyjgqL53TCeEHuSgkKQxl059KVFO
 gKDOxYrqEpdW5lsN+l91HA9VNpCcQc91oEt1F0/RNNmZhoEmzOZnfqeyBDu+z6giXQOe
 5K1w==
X-Gm-Message-State: AOAM531Z3SA7bOaf2h3/0bSMc1FidLaCeB2cCmCJqWe2dqPUOjw4Ugxw
 +E86mU4VPKRFqfrZN7kVMmE=
X-Google-Smtp-Source: ABdhPJyuZcp+AqRLPz3yJIfvdwNUATarIMvgIK7I09VrN4WEXhLqSMqZyvaS1A1ZqiWgJrdIoQA/Hg==
X-Received: by 2002:a1c:96:: with SMTP id 144mr9601334wma.84.1600342290200;
 Thu, 17 Sep 2020 04:31:30 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id 11sm10489240wmi.14.2020.09.17.04.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 04:31:29 -0700 (PDT)
Date: Thu, 17 Sep 2020 08:31:20 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 18/21] drm/vkms: Introduce GEM object functions
Message-ID: <20200917113120.dtz7yxvdg7xdgbx5@smtp.gmail.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-19-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_073132_998646_5CFAFA6F 
X-CRM114-Status: GOOD (  18.82  )
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
> per-instance callbacks in vkms.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks! Looks fine.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_drv.c |  8 --------
>  drivers/gpu/drm/vkms/vkms_gem.c | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index cb0b6230c22c..726801ab44d4 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -51,12 +51,6 @@ static const struct file_operations vkms_driver_fops = {
>  	.release	= drm_release,
>  };
>  
> -static const struct vm_operations_struct vkms_gem_vm_ops = {
> -	.fault = vkms_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static void vkms_release(struct drm_device *dev)
>  {
>  	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
> @@ -98,8 +92,6 @@ static struct drm_driver vkms_driver = {
>  	.release		= vkms_release,
>  	.fops			= &vkms_driver_fops,
>  	.dumb_create		= vkms_dumb_create,
> -	.gem_vm_ops		= &vkms_gem_vm_ops,
> -	.gem_free_object_unlocked = vkms_gem_free_object,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>  	.gem_prime_import_sg_table = vkms_prime_import_sg_table,
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
> index a017fc59905e..19a0e260a4df 100644
> --- a/drivers/gpu/drm/vkms/vkms_gem.c
> +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> @@ -7,6 +7,17 @@
>  
>  #include "vkms_drv.h"
>  
> +static const struct vm_operations_struct vkms_gem_vm_ops = {
> +	.fault = vkms_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs vkms_gem_object_funcs = {
> +	.free = vkms_gem_free_object,
> +	.vm_ops = &vkms_gem_vm_ops,
> +};
> +
>  static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
>  						 u64 size)
>  {
> @@ -17,6 +28,8 @@ static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
>  	if (!obj)
>  		return ERR_PTR(-ENOMEM);
>  
> +	obj->gem.funcs = &vkms_gem_object_funcs;
> +
>  	size = roundup(size, PAGE_SIZE);
>  	ret = drm_gem_object_init(dev, &obj->gem, size);
>  	if (ret) {
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
