Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB94C021B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5cICI1srA6AL9a1+pOUSOCIV5EtvwUaabHRqHMrz9I=; b=ThJ6oBHdHfb8LICEWmBO30BfQ4
	ywRQ85P8EbkWbL4jicmGXyXC41kSAV6VPw9+yMAPp8qQsvQlBz763D3wAso4UaYIMc7nTrbowWsUF
	EccR2qCC+Otup++6fBPdsSiIGMLQnnl5DjciOSdqNiSmqFpf8c+Oxm77hcPYiZMqr4LPGxoDDiDoV
	hxTmRPsVbEzxU84n/WEkPGW/UyuVwMYmj00FChPIlm7P/ZdMmT1LYHMYE7K0M+UU4Jg/5h+Z7cndT
	Jfi7born458YFCLq9j+CLKzAH5HgRMDAsiPTr4qEyDxOVgoCHASRk6Y5NYs4yktLGyn+LDKB1OLxE
	50Oz94Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3U5-00000000DVP-2RGb;
	Thu, 20 Feb 2025 10:08:45 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3U3-00000000DTT-28tE;
	Thu, 20 Feb 2025 10:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740046124; x=1771582124;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qEEkaGFEKdByIXhxlRz4s/blmxr0i3FKT7WWs7RYcVE=;
  b=JjH7fQ3zl2KHGFYf9gNOL5hrsis6bu1Hyb3zZDBnLrflpHGo0Y2+kltV
   TzXXZxJLLH+a52oq2ubTf89YbCa2uzY4EJFicxf35+Df9qtysFUIwS4Yw
   slBRGT0Uo4UHah7HubrnW2pU5DnOpc/L2oh3bdmshNmMdhnr9d4jsgwG0
   MAzG1lKT8Pddo708yhziBYm34yiFX1qf4bL+hqDO/07MWUGu3IfM9mRnk
   ZSp9RTUf0U047IgdQHDTafNMbfdrYrOCBx2rExoxVq1umdN65DjODKvhw
   al5BUKcgEscuL+Q5nN3aB10KTVQrzuCPO25NusmCp6IkC4R6p2b1GAbyP
   A==;
X-CSE-ConnectionGUID: WfjmW+mWRBeUJ8zhDUs4iw==
X-CSE-MsgGUID: nlSxkwuoRC+uC0pjHDW+wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44734928"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="44734928"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 02:08:40 -0800
X-CSE-ConnectionGUID: UUemawqKTUWXKRiDeorKDQ==
X-CSE-MsgGUID: hc9L0Du1SByRgSK2VuJbDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120221268"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.244.161]) ([10.245.244.161])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 02:08:36 -0800
Message-ID: <92c1b182-5a0b-4d13-9b16-172ac970b62e@intel.com>
Date: Thu, 20 Feb 2025 10:08:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/25] drm/xe: Compute dumb-buffer sizes with
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
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-24-tzimmermann@suse.de>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250218142542.438557-24-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_020843_552235_1472B798 
X-CRM114-Status: GOOD (  14.24  )
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

On 18/02/2025 14:23, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Align the pitch to a multiple of 8. Align the
> buffer size according to hardware requirements.
> 
> Xe's internal calculation allowed for 64-bit wide buffer sizes, but
> the ioctl's internal checks always verified against 32-bit wide limits.
> Hance, it is safe to limit the driver code to 32-bit calculations as
> well.
> 
> v3:
> - mention 32-bit calculation in commit description (Matthew)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 78d09c5ed26d..b34f446ad57d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -9,6 +9,7 @@
>   #include <linux/nospec.h>
>   
>   #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/ttm/ttm_device.h>
> @@ -2672,14 +2673,13 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
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
> +	if (err)
> +		return err;
>   
>   	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>   			       DRM_XE_GEM_CPU_CACHING_WC,


