Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ABFC19F32
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Mar 2025 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmXXr/GHvAGv2swMlIkbl+Www19HcX8d7ze1AMoIM9w=; b=LMOaqi2uWyH6Au7R67hm4awWRt
	A/ClhgVgEwwIQp14PTKxRIHRq0yRkUPhqxeMN7E92Ekq0W9nkmW+kUHDoARkp28RZ0s2aLOkPn8zB
	9s5uX9fZ3GWSBpM8mBOMpjsQNX+bpPi55j6SRLkvGUqC/Ie2KT5k2e9LYJW2BMXKSbnwTD56MMdzH
	LrlUOIewLXiKY4vZVM3zxuo338jaHlfBXif8m+HsNUwHykrfAt++DlhkeOArm/9G0vFuI51YQdDn7
	uxMG+SMTXQfY14vFKayO5HUrFhFZ9AaZ220ONsIGG6OTuWhbBg9KqhJ4hs8KJyoOSrkVrWEQiwksd
	R5jP+/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXcY-0000000EJJC-0RDb;
	Fri, 07 Mar 2025 13:20:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXbh-0000000EJ5X-3DT0
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Mar 2025 13:19:20 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso3107693a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Mar 2025 05:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1741353556; x=1741958356; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GmXXr/GHvAGv2swMlIkbl+Www19HcX8d7ze1AMoIM9w=;
        b=YAFkGiJJtWrGota1z6DMLGsrvlJi70N9MHfod0aow26l0SVtTzjPna6mkcnt2wY3s8
         g5nRiVTN+yGaOqHvwgQWTY6oy1O4h/lMoaoG+tyUOPYSgPLACCPKcywEISsoc7m2AQWC
         2uajG9BAgMuDk1kl7Els/omUfIvVyBE09fOHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741353556; x=1741958356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmXXr/GHvAGv2swMlIkbl+Www19HcX8d7ze1AMoIM9w=;
        b=f95z9OrXPlzvVFe6P1VdwlyZliks+S3W0Y/5edvUGaydJRzVynDPW3gkcLbiSS+pxz
         x0jcfdFqubsU1NbHRSDUVCDTtBAHgaAz7815WRE1qrMq0E8BpO5VOT2jFIcuKNLvEJsp
         gEjWXAQk9ofvh/kUUDO+XQvGWDdveV4zxtP1kDcUmvFBRKAbSLQY3UYFSdRZH5VWbSEL
         4tJW1dfRsrhLkzKGisXLwBw991VmXh9jJA+zYqIO/Ns08CEVP8jaqTxwseHTrYIOJaUC
         UzGJRYHq/NnETRRMKCWED95lFb7uCQklXkkQkdUSCZn+kTb/yuKXjUqBVs+a+4Golmst
         uzRA==
X-Forwarded-Encrypted: i=1; AJvYcCXz34xppSXl66bf+vd19j8LdZvkGtP6q/fPlOMIrPXUZpWrBCvYHMlqOf5Sq05Fk1REZPrR8wLO9lDB7f1fbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLjNrKzEkb+CMk6DiWiVOj9qTKmq1T8cJmpRsyzTXAhbwhWMY7
	6CuLrWKbi9Q8ouIFdCYUfWcy4p0eBKxi1tfrtg9VqmHZXP+9+X4YNbVlmcK1rLfBW0TbFOokpaI
	q
X-Gm-Gg: ASbGncvFGV57w10KhvPt2Q3gh5FDeg0BqutEV9qUCXBCAx33s/9xQw1hoPbNwqiFT0d
	/ReoQ6yuULGNG8yUVvQjpDQZ+lO8aSV158LYmoa6Aq2H/S/Y2pQS4WvOcf4w8IQPislukOI62vP
	Abmjd34DCLnPir3IyK1SAb97n7erCmM1jZ/a7L25sBFQSlE+P7dbEyXzjZyleJ290TdUt1AvWM7
	UqXwZXGi5sPoWXOagI1YvdGM8ybhyj9/JkDP0OECvd4KrKcRTFmZkIzG8VWoy7hHP9WxxI4v0ye
	+P5/zUwOtmAYLUvFrO+06Q1MMpWMAogC4WSeexG/5mYEBmoCdeDdHMfr
X-Google-Smtp-Source: AGHT+IGWJEXpT4oFObUhXEX1baZSA5ka+RDW0BObeZF31pqEHYIrQhNdRsTwmr/EHhhCwd6ldgP0tQ==
X-Received: by 2002:a17:907:7ea9:b0:abf:6b30:7a94 with SMTP id a640c23a62f3a-ac252f4c9eamr387695566b.45.1741353555414;
        Fri, 07 Mar 2025 05:19:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d2dd8sm272788966b.166.2025.03.07.05.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:19:14 -0800 (PST)
Date: Fri, 7 Mar 2025 14:19:12 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
Message-ID: <Z8ryUGgxqVTEw9pe@phenom.ffwll.local>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
 <Z8qxcTIcD4W5OGwL@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8qxcTIcD4W5OGwL@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.11-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_051917_833854_13B1E2C5 
X-CRM114-Status: GOOD (  59.76  )
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

On Fri, Mar 07, 2025 at 09:42:25AM +0100, Simona Vetter wrote:
> On Tue, Feb 18, 2025 at 03:23:25PM +0100, Thomas Zimmermann wrote:
> > Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
> > scanline pitch and allocation size. Implementations of struct
> > drm_driver.dumb_create can call the new helper for their size
> > computations.
> > 
> > There is currently quite a bit of code duplication among DRM's
> > memory managers. Each calculates scanline pitch and buffer size
> > from the given arguments, but the implementations are inconsistent
> > in how they treat alignment and format support. Later patches will
> > unify this code on top of drm_mode_size_dumb() as much as possible.
> > 
> > drm_mode_size_dumb() uses existing 4CC format helpers to interpret
> > the given color mode. This makes the dumb-buffer interface behave
> > similar the kernel's video= parameter. Current per-driver implementations
> > again likely have subtle differences or bugs in how they support color
> > modes.
> > 
> > The dumb-buffer UAPI is only specified for known color modes. These
> > values describe linear, single-plane RGB color formats or legacy index
> > formats. Other values should not be specified. But some user space
> > still does. So for unknown color modes, there are a number of known
> > exceptions for which drm_mode_size_dumb() calculates the pitch from
> > the bpp value, as before. All other values work the same but print
> > an error.
> > 
> > v3:
> > - document the UAPI semantics
> > - compute scanline pitch from for unknown color modes (Andy, Tomi)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/drm_dumb_buffers.c | 116 +++++++++++++++++++++++++++++
> >  include/drm/drm_dumb_buffers.h     |  14 ++++
> >  include/uapi/drm/drm_mode.h        |  46 +++++++++++-
> >  3 files changed, 175 insertions(+), 1 deletion(-)
> >  create mode 100644 include/drm/drm_dumb_buffers.h
> > 
> > diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> > index 9916aaf5b3f2..600ab281712b 100644
> > --- a/drivers/gpu/drm/drm_dumb_buffers.c
> > +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> > @@ -25,6 +25,8 @@
> >  
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_drv.h>
> > +#include <drm/drm_dumb_buffers.h>
> > +#include <drm/drm_fourcc.h>
> >  #include <drm/drm_gem.h>
> >  #include <drm/drm_mode.h>
> >  
> > @@ -57,6 +59,120 @@
> >   * a hardware-specific ioctl to allocate suitable buffer objects.
> >   */
> >  
> > +static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
> > +			       unsigned long pitch_align,
> > +			       unsigned long size_align)
> > +{
> > +	u32 pitch = args->pitch;
> > +	u32 size;
> > +
> > +	if (!pitch)
> > +		return -EINVAL;
> > +
> > +	if (pitch_align)
> > +		pitch = roundup(pitch, pitch_align);
> > +
> > +	/* overflow checks for 32bit size calculations */
> > +	if (args->height > U32_MAX / pitch)
> > +		return -EINVAL;
> > +
> > +	if (!size_align)
> > +		size_align = PAGE_SIZE;
> > +	else if (!IS_ALIGNED(size_align, PAGE_SIZE))
> > +		return -EINVAL;
> > +
> > +	size = ALIGN(args->height * pitch, size_align);
> > +	if (!size)
> > +		return -EINVAL;
> > +
> > +	args->pitch = pitch;
> > +	args->size = size;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
> > + * @dev: DRM device
> > + * @args: Parameters for the dumb buffer
> > + * @pitch_align: Scanline alignment in bytes
> > + * @size_align: Buffer-size alignment in bytes
> > + *
> > + * The helper drm_mode_size_dumb() calculates the size of the buffer
> > + * allocation and the scanline size for a dumb buffer. Callers have to
> > + * set the buffers width, height and color mode in the argument @arg.
> > + * The helper validates the correctness of the input and tests for
> > + * possible overflows. If successful, it returns the dumb buffer's
> > + * required scanline pitch and size in &args.
> > + *
> > + * The parameter @pitch_align allows the driver to specifies an
> > + * alignment for the scanline pitch, if the hardware requires any. The
> > + * calculated pitch will be a multiple of the alignment. The parameter
> > + * @size_align allows to specify an alignment for buffer sizes. The
> > + * returned size is always a multiple of PAGE_SIZE.
> > + *
> > + * Returns:
> > + * Zero on success, or a negative error code otherwise.
> > + */
> > +int drm_mode_size_dumb(struct drm_device *dev,
> > +		       struct drm_mode_create_dumb *args,
> > +		       unsigned long pitch_align,
> > +		       unsigned long size_align)
> > +{
> > +	u64 pitch = 0;
> > +	u32 fourcc;
> > +
> > +	/*
> > +	 * The scanline pitch depends on the buffer width and the color
> > +	 * format. The latter is specified as a color-mode constant for
> > +	 * which we first have to find the corresponding color format.
> > +	 *
> > +	 * Different color formats can have the same color-mode constant.
> > +	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
> > +	 * It is possible to use different formats for dumb-buffer allocation
> > +	 * and rendering as long as all involved formats share the same
> > +	 * color-mode constant.
> > +	 */
> > +	fourcc = drm_driver_color_mode_format(dev, args->bpp);
> > +	if (fourcc != DRM_FORMAT_INVALID) {
> > +		const struct drm_format_info *info = drm_format_info(fourcc);
> > +
> > +		if (!info)
> > +			return -EINVAL;
> > +		pitch = drm_format_info_min_pitch(info, 0, args->width);
> > +	} else if (args->bpp) {
> > +		/*
> > +		 * Some userspace throws in arbitrary values for bpp and
> > +		 * relies on the kernel to figure it out. In this case we
> > +		 * fall back to the old method of using bpp directly. The
> > +		 * over-commitment of memory from the rounding is acceptable
> > +		 * for compatibility with legacy userspace. We have a number
> > +		 * of deprecated legacy values that are explicitly supported.
> > +		 */
> > +		switch (args->bpp) {
> > +		default:
> > +			drm_warn(dev, "Unknown color mode %d; guessing buffer size.\n",
> > +				 args->bpp);
> > +			fallthrough;
> 
> We cannot let userspace trigger dmesg warnings (or anything else really
> that spams logs). Also I think for future proofing it would be good if we
> just reject anything we don't currently know about instead of silently
> letting this mess become worse. Hence my vote is to reject unknown bpp
> hack values.
> 
> > +		case 12:
> > +		case 15:
> > +		case 30: /* see drm_gem_afbc_get_bpp() */
> 
> This is a bit too cryptic to me, I think if you want to do comments I'd
> just put a long-form one above each value that explains where we've found
> it and why it happens. I'm also assuming these all have depth = 0, which I
> guess is something we should check just to keep this as strict as
> possible? Or do they have matching depth?

Correction from irc: Thomas pointed out that there's no depth in the
create_dumb ioctl, I was mixing this up with addfb and failed to check. So
please disregard this part, I was fabricating stuff out of some very thin
air (and probably not enough coffee in the brain too).
-Sima

> 
> Cheers, Sima
> 
> > +		case 10:
> > +		case 64: /* used by Mesa */
> > +			pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!pitch || pitch > U32_MAX)
> > +		return -EINVAL;
> > +
> > +	args->pitch = pitch;
> > +
> > +	return drm_mode_align_dumb(args, pitch_align, size_align);
> > +}
> > +EXPORT_SYMBOL(drm_mode_size_dumb);
> > +
> >  int drm_mode_create_dumb(struct drm_device *dev,
> >  			 struct drm_mode_create_dumb *args,
> >  			 struct drm_file *file_priv)
> > diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
> > new file mode 100644
> > index 000000000000..6fe36004b19d
> > --- /dev/null
> > +++ b/include/drm/drm_dumb_buffers.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: MIT */
> > +
> > +#ifndef __DRM_DUMB_BUFFERS_H__
> > +#define __DRM_DUMB_BUFFERS_H__
> > +
> > +struct drm_device;
> > +struct drm_mode_create_dumb;
> > +
> > +int drm_mode_size_dumb(struct drm_device *dev,
> > +		       struct drm_mode_create_dumb *args,
> > +		       unsigned long pitch_align,
> > +		       unsigned long size_align);
> > +
> > +#endif
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index c082810c08a8..eea09103b1a6 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
> >   * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
> >   * @height: buffer height in pixels
> >   * @width: buffer width in pixels
> > - * @bpp: bits per pixel
> > + * @bpp: color mode
> >   * @flags: must be zero
> >   * @handle: buffer object handle
> >   * @pitch: number of bytes between two consecutive lines
> > @@ -1066,6 +1066,50 @@ struct drm_mode_crtc_page_flip_target {
> >   *
> >   * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
> >   * the kernel fills @handle, @pitch and @size.
> > + *
> > + * The value of @bpp is a color-mode number describing a specific format
> > + * or a variant thereof. The value often corresponds to the number of bits
> > + * per pixel for most modes, although there are exceptions. Each color mode
> > + * maps to a DRM format plus a number of modes with similar pixel layout.
> > + * Framebuffer layout is always linear.
> > + *
> > + * Support for all modes and formats is optional. Even if dumb-buffer
> > + * creation with a certain color mode succeeds, it is not guaranteed that
> > + * the DRM driver supports any of the related formats. Most drivers support
> > + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
> > + * plane.
> > + *
> > + * +------------+------------------------+------------------------+
> > + * | Color mode | Framebuffer format     | Compatibles            |
> > + * +============+========================+========================+
> > + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_XBGR8888 |
> > + * |            |                        |  * DRM_FORMAT_RGBX8888 |
> > + * |            |                        |  * DRM_FORMAT_BGRX8888 |
> > + * +------------+------------------------+------------------------+
> > + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
> > + * +------------+------------------------+------------------------+
> > + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
> > + * +------------+------------------------+------------------------+
> > + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_XBGR1555 |
> > + * |            |                        |  * DRM_FORMAT_RGBX1555 |
> > + * |            |                        |  * DRM_FORMAT_BGRX1555 |
> > + * +------------+------------------------+------------------------+
> > + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_R8       |
> > + * +------------+------------------------+------------------------+
> > + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_R4       |
> > + * +------------+------------------------+------------------------+
> > + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_R2       |
> > + * +------------+------------------------+------------------------+
> > + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_R1       |
> > + * +------------+------------------------+------------------------+
> > + *
> > + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
> > + * legacy user space. Please don't use them in new code. Other modes
> > + * are not support.
> > + *
> > + * Do not attempt to allocate anything but linear framebuffer memory
> > + * with single-plane RGB data. Allocation of other framebuffer
> > + * layouts requires dedicated ioctls in the respective DRM driver.
> >   */
> >  struct drm_mode_create_dumb {
> >  	__u32 height;
> > -- 
> > 2.48.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

