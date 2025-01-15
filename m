Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2958BC02183
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2025 03:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVhN80lSe9/RJE7xTb/gBfGOBNDnLQWNn0HdoXTdJX4=; b=Dgh5UVSEK525QPLe7DU85ComQq
	JLMlRHOYSybLEOj2oqT9575nGPeFbO6WgSxlKXe4lzJ5OMQe6EmYWRN2C4v+9U4fO3/Wd1yEK4e15
	fGF8/3TGfI74a8qmYFalpMLiCXURHOHBzyIaQriUMdFbHds01dPkluywTGyWPIvyFdi0mhp1521PG
	4q46s8Zx5rjaTsAl3WGbKaOJVNEoDJ4JAiwCBCOgRRfNGbt4WDuZku61yyKiFMZKbv6HBKN3fc4lz
	GgIiMTL/Tz/Fo8RrNJ1/cYL224+FF4a5Pg12+jTJva7nEEMbZ7CbwJBSLzQpIfgHkryZKf8J5iv5u
	AmcVV0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuQh-0000000AYeO-2ba7;
	Wed, 15 Jan 2025 03:50:55 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuQd-0000000AYcX-3FDE
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jan 2025 03:50:54 +0000
Message-ID: <078ddd52-1d04-4aad-935a-67c12ebf569a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736913034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVhN80lSe9/RJE7xTb/gBfGOBNDnLQWNn0HdoXTdJX4=;
	b=teidT1Fw63fY1UplJo7A5bi9iE7QpymiDozRtg4zga+cfodcNKCHBs5xeOi588P6Xgf2QP
	CYp1SqpJZNtGd/fHLlyHIgbHFs46Z3aoqpduhurkaP+sGXJgpt1fvAeSbcUUllSz8kx3vA
	np+KZYyxC2PBSgowDFD5qMH7M7wgWl8=
Date: Wed, 15 Jan 2025 11:50:20 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 11/25] drm/loongson: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Sui Jingfeng <suijingfeng@loongson.cn>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-12-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20250109150310.219442-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_195051_952764_B0A29631 
X-CRM114-Status: GOOD (  14.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 2025/1/9 22:57, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> ---
>   drivers/gpu/drm/loongson/lsdc_gem.c | 29 ++++++++---------------------
>   1 file changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
> index a720d8f53209..9f982b85301f 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> @@ -6,6 +6,7 @@
>   #include <linux/dma-buf.h>
>   
>   #include <drm/drm_debugfs.h>
> +#include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_gem.h>
>   #include <drm/drm_prime.h>
> @@ -204,45 +205,31 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
>   	const struct lsdc_desc *descp = ldev->descp;
>   	u32 domain = LSDC_GEM_DOMAIN_VRAM;
>   	struct drm_gem_object *gobj;
> -	size_t size;
> -	u32 pitch;
> -	u32 handle;
>   	int ret;
>   
> -	if (!args->width || !args->height)
> -		return -EINVAL;
> -
> -	if (args->bpp != 32 && args->bpp != 16)
> -		return -EINVAL;
> -
> -	pitch = args->width * args->bpp / 8;
> -	pitch = ALIGN(pitch, descp->pitch_align);
> -	size = pitch * args->height;
> -	size = ALIGN(size, PAGE_SIZE);
> +	ret = drm_mode_size_dumb(ddev, args, descp->pitch_align, 0);
> +	if (ret)
> +		return ret;
>   
>   	/* Maximum single bo size allowed is the half vram size available */
> -	if (size > ldev->vram_size / 2) {
> -		drm_err(ddev, "Requesting(%zuMiB) failed\n", size >> 20);
> +	if (args->size > ldev->vram_size / 2) {
> +		drm_err(ddev, "Requesting(%zuMiB) failed\n", (size_t)(args->size >> PAGE_SHIFT));
>   		return -ENOMEM;
>   	}
>   
> -	gobj = lsdc_gem_object_create(ddev, domain, size, false, NULL, NULL);
> +	gobj = lsdc_gem_object_create(ddev, domain, args->size, false, NULL, NULL);
>   	if (IS_ERR(gobj)) {
>   		drm_err(ddev, "Failed to create gem object\n");
>   		return PTR_ERR(gobj);
>   	}
>   
> -	ret = drm_gem_handle_create(file, gobj, &handle);
> +	ret = drm_gem_handle_create(file, gobj, &args->handle);
>   
>   	/* drop reference from allocate, handle holds it now */
>   	drm_gem_object_put(gobj);
>   	if (ret)
>   		return ret;
>   
> -	args->pitch = pitch;
> -	args->size = size;
> -	args->handle = handle;
> -
>   	return 0;
>   }
>   

-- 
Best regards,
Sui


