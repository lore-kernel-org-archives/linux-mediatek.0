Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52433E7719D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGtJ9CriS+ashHM5ezN8GwKe3wTrnVd2+hdY+vVFtuM=; b=senyDduqdgTNiqyieiiAV2OpxP
	eDWlWJiqbp6PgzoG4AONRYOHRLU6ClTRplVB2XAwCc+tRpbWVsbyGm+B4ZCI9S4MPzopRL8UG01cO
	v9Z4nByY4Ob19T9AtFRNs+OmpScwmapdajYpscI1kX532/kPxUcE4hOpNbGPtJwQ9fSBpegbAiRcu
	6lGcyytM8WDSj1S7apCcqjjNY2SPEQcDksZOt0VucIQiJMwHB30m9nhLoPF0rFCcZ96Ahyh+u3WvQ
	+l/2X8xvYY5iHyV3+dR8b4R6GpVz514UmAEQ+p2SoDNMco/Z0t+wxH5d48PrSZLHeB/Lw/2NRypG7
	Y+4Ca7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv30-0000000CbLj-1JZm;
	Thu, 09 Jan 2025 16:06:14 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv2y-0000000CbKU-1dQl;
	Thu, 09 Jan 2025 16:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736438772; x=1767974772;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p4XkuorIpNoSEU2HBpQ1O27DvwV5LvulfkLyMZfyAfg=;
  b=kc6YdHA+f+SZjxp8KzB62WRPem4bWEcS8YiNIy7PHCFhyaofuvB7NV2f
   IME/SDVAnup+dTqH7ZbtMCq9fv9J0SuKqWwJXS7kJ4vCMYyQd6QJ+rAGJ
   HtU12PcqSeg9VB8k6y6wHHl1R6cTpk8jd36TA0E7vtNxn3Q7qAe6ASH+K
   Cy2TYu9HinHmKPKVsP9IBl9saTzUeXYmvyHiUAo2uiGZhkupQ80VV3PO8
   y5YyooVO2/vCmT5qwGtIJeirTxnlRnELWKQp69/r9hKG2BnTrOXsJApF3
   tA95IbVgsudvFVzQa72Wt0VX64Ain9vpUzJCnQ/LwOaQ763e6zidg1JzE
   g==;
X-CSE-ConnectionGUID: 5J85ZrgxR/GzSngWDu1I4Q==
X-CSE-MsgGUID: oDq0zriSQjijNQ2WzDXSrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="62086134"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="62086134"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:05:55 -0800
X-CSE-ConnectionGUID: gYM7jUeoQau2+oJbNyjiWQ==
X-CSE-MsgGUID: 8PkbOk3sQpqIzHIL0w463A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103967271"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.241]) ([10.245.245.241])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:05:50 -0800
Message-ID: <91c904f8-ba47-4595-be65-6fb57dcc9c64@intel.com>
Date: Thu, 9 Jan 2025 16:05:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/25] drm/xe: Compute dumb-buffer sizes with
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-24-tzimmermann@suse.de>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250109150310.219442-24-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_080612_470877_B4D04B93 
X-CRM114-Status: GOOD (  14.50  )
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

On 09/01/2025 14:57, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Align the pitch to a multiple of 8. Align the
> buffer size according to hardware requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e6c896ad5602..d75e3c39ab14 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -8,6 +8,7 @@
>   #include <linux/dma-buf.h>
>   
>   #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/ttm/ttm_device.h>
> @@ -2535,14 +2536,13 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>   	struct xe_device *xe = to_xe_device(dev);
>   	struct xe_bo *bo;
>   	uint32_t handle;
> -	int cpp = DIV_ROUND_UP(args->bpp, 8);
>   	int err;
>   	u32 page_size = max_t(u32, PAGE_SIZE,
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
>   
> -	args->pitch = ALIGN(args->width * cpp, 64);
> -	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
> -			   page_size);
> +	err = drm_mode_size_dumb(dev, args, SZ_64, page_size);

AFAICT this looks to change the behaviour, where u64 size was 
technically possible and was allowed given that args->size is u64, but 
this helper is limiting the size to u32. Is that intentional? If so, we 
should probably make that clear in the commit message.

> +	if (err)
> +		return err;
>   
>   	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>   			       DRM_XE_GEM_CPU_CACHING_WC,


