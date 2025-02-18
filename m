Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49ABC021AA
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2025 21:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yb7jRjd6uguB9cG41rTvHpSN+ZVtgW/KmSvyau5JmeE=; b=nWyDlLZ1auWyuVr8VvhfgGVk9T
	IJ9GF2LvE2lmdAQBG2kye0grcthvT9OZP1gbJwePYz1LItR6YsgKkiwuKBJ/fXu1AmTh/acZLbyOj
	84Bt8wwBzwR9/DVYk4OmZ+SIXX5nxWNNjebdqhOvqmv+W3M6ACdk3nhiYw4jEYgpUO6DpAx1iTlRy
	VNofs4Sgl64TTdbpBgitowbrBVl39h/9XgSx5QVstUObEwQQ44f/doNHruhX3bfSUoAqlFHRSvz11
	Na0OEsaF8FFgD+ZqJNhX1pojffl4YHfR1vShOmH11LwBwikDpMd63rFj4xWvhThMP9rBC+8CqTzBm
	Njn+vElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkV6V-00000009yws-2XK1;
	Tue, 18 Feb 2025 21:26:07 +0000
Received: from mail-vs1-f49.google.com ([209.85.217.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTKm-00000009aou-3at0;
	Tue, 18 Feb 2025 19:32:46 +0000
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4be633cacbbso688063137.3;
        Tue, 18 Feb 2025 11:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907162; x=1740511962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yb7jRjd6uguB9cG41rTvHpSN+ZVtgW/KmSvyau5JmeE=;
        b=mRMGdvt4a/VeQ14CeX/iu1CdQpYx5R9YR3Z/9e+JkN1I0qZdOFjJUc5Vp18d+K+LuT
         6EwQGFNNK8d8c7KvRZuQu3YTNMotCT9PFiDfD+hV+ohLbvzubh6p2LHjxDs0wIDOUj06
         j3Yc8fVamyE+mEGzCz4C6+nZVF0K7p3AjMTfPV+pHe6sYEqwO+7zZn3ngqBToM6WuN35
         uMVZoUSWc/qhBJi16gVFKl52FApqm66TFOOGdyuHBnLVbvaDKakxDraHUGiq5VV3qWDl
         Rdsfi0mqTq0x07CK5qFtodTVBTOY1skL1PZ52ge+ODiN9nzCE+9OGQrOotAsprpfov2q
         SVEw==
X-Forwarded-Encrypted: i=1; AJvYcCUybayXHDusPx1QYMXh3A0c2aKC3vsRXS3cEyx4JGACU/dK5bxKUi21oB3ueuIXehE2IQbYeGkDjIxBeK9ihQ==@lists.infradead.org, AJvYcCWEsFoYpiEMvSzzA/H+0A1blCMP1ddtFcqFDVmp+8ZUr6TEU/8WvyLZf+alzRECvEXyQm96JgK6+tDjUgCY8lI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIQOWWPyoW6ibOEnGD+wda/C81vyTbbKc5L39OjORqLKMUyLJh
	+O8hFlbnPE30Vic4LTWiudcQ0xJRInpO/LeauMrYxGwNmw4iSLHKgvrXBtN6
X-Gm-Gg: ASbGncvtbFa2VyBXMR4uHpM7eLDiiKaRzueJhON76yOAqd8raSu636gf/buEGkboONg
	oemUOYQhDkya1ukHvd8yn5v5uGFmyVz1O0EcVxAa/lsTTx+CBrRCAzyefJzhISACdFwO+XIXEMo
	rQox3g6sMw5KLbHtaW+3XJh3PDADrP1ybS8SoawEfJadwgWS7wHKT+PEGuS6/jxQBz8b81eRxmO
	hx+5BdGB2+l+Sgs1s0uI9PltidTocEPCKEFVECDKXqVV8V6/BaRyFAltus/3EgCbDe8YMGopkIO
	avRE22AvDDoumkxeFVFHBCdVHHGsHnR2Y0WbC91iInx0JL+byCPNxw==
X-Google-Smtp-Source: AGHT+IFQ1FJ3KaVegSTR4mFqE4j8GdbYJAy+rnxS32vHW7iq0hFZleFwEI6AfG/olCU9ISuUabJeWQ==
X-Received: by 2002:a05:6102:14aa:b0:4bb:e6bc:e16d with SMTP id ada2fe7eead31-4be85cb8dffmr636821137.20.1739907161967;
        Tue, 18 Feb 2025 11:32:41 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520a6bded22sm1729839e0c.16.2025.02.18.11.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 11:32:41 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4bd3763900aso1105046137.2;
        Tue, 18 Feb 2025 11:32:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpIk59ZYn5GUsttPw6FnhVWXWZAfA8hCJAy4EjeyTKyTcx1rq1t67q0dvBL/wgZDn6PNnohZfrrZEdfLvHpw==@lists.infradead.org, AJvYcCV9KNvjtxfP2rhDdabxK/CrEcYyXcQ5Aj1lzogX1JuhrU9TAffKnve5wjQbvJwpVDF47oVc0yczEEsXKgqQNXU=@lists.infradead.org
X-Received: by 2002:a05:6102:b10:b0:4bb:d394:46c5 with SMTP id
 ada2fe7eead31-4be85bb8970mr656557137.9.1739907160582; Tue, 18 Feb 2025
 11:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20250218142542.438557-1-tzimmermann@suse.de> <20250218142542.438557-3-tzimmermann@suse.de>
In-Reply-To: <20250218142542.438557-3-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2025 20:32:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV939ibJTRSaO-oW2Jz4zbkXGRpUYrmA7e=yQfF7W-k_g@mail.gmail.com>
X-Gm-Features: AWEUYZnARFSxvjPUxC-uDBDfMGz-IvL-HNvEMBPwKo8soOA7GylWEHj75pA7v34
Message-ID: <CAMuHMdV939ibJTRSaO-oW2Jz4zbkXGRpUYrmA7e=yQfF7W-k_g@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113244_898870_B9FB715B 
X-CRM114-Status: GOOD (  53.73  )
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

Hi Thomas,

On Tue, 18 Feb 2025 at 15:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
> scanline pitch and allocation size. Implementations of struct
> drm_driver.dumb_create can call the new helper for their size
> computations.
>
> There is currently quite a bit of code duplication among DRM's
> memory managers. Each calculates scanline pitch and buffer size
> from the given arguments, but the implementations are inconsistent
> in how they treat alignment and format support. Later patches will
> unify this code on top of drm_mode_size_dumb() as much as possible.
>
> drm_mode_size_dumb() uses existing 4CC format helpers to interpret
> the given color mode. This makes the dumb-buffer interface behave
> similar the kernel's video= parameter. Current per-driver implementations
> again likely have subtle differences or bugs in how they support color
> modes.
>
> The dumb-buffer UAPI is only specified for known color modes. These
> values describe linear, single-plane RGB color formats or legacy index
> formats. Other values should not be specified. But some user space
> still does. So for unknown color modes, there are a number of known
> exceptions for which drm_mode_size_dumb() calculates the pitch from
> the bpp value, as before. All other values work the same but print
> an error.
>
> v3:
> - document the UAPI semantics
> - compute scanline pitch from for unknown color modes (Andy, Tomi)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> +/**
> + * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
> + * @dev: DRM device
> + * @args: Parameters for the dumb buffer
> + * @pitch_align: Scanline alignment in bytes
> + * @size_align: Buffer-size alignment in bytes
> + *
> + * The helper drm_mode_size_dumb() calculates the size of the buffer
> + * allocation and the scanline size for a dumb buffer. Callers have to
> + * set the buffers width, height and color mode in the argument @arg.
> + * The helper validates the correctness of the input and tests for
> + * possible overflows. If successful, it returns the dumb buffer's
> + * required scanline pitch and size in &args.
> + *
> + * The parameter @pitch_align allows the driver to specifies an
> + * alignment for the scanline pitch, if the hardware requires any. The
> + * calculated pitch will be a multiple of the alignment. The parameter
> + * @size_align allows to specify an alignment for buffer sizes. The
> + * returned size is always a multiple of PAGE_SIZE.
> + *
> + * Returns:
> + * Zero on success, or a negative error code otherwise.
> + */
> +int drm_mode_size_dumb(struct drm_device *dev,
> +                      struct drm_mode_create_dumb *args,
> +                      unsigned long pitch_align,
> +                      unsigned long size_align)
> +{
> +       u64 pitch = 0;
> +       u32 fourcc;
> +
> +       /*
> +        * The scanline pitch depends on the buffer width and the color
> +        * format. The latter is specified as a color-mode constant for
> +        * which we first have to find the corresponding color format.
> +        *
> +        * Different color formats can have the same color-mode constant.
> +        * For example XRGB8888 and BGRX8888 both have a color mode of 32.
> +        * It is possible to use different formats for dumb-buffer allocation
> +        * and rendering as long as all involved formats share the same
> +        * color-mode constant.
> +        */
> +       fourcc = drm_driver_color_mode_format(dev, args->bpp);
> +       if (fourcc != DRM_FORMAT_INVALID) {
> +               const struct drm_format_info *info = drm_format_info(fourcc);
> +
> +               if (!info)
> +                       return -EINVAL;
> +               pitch = drm_format_info_min_pitch(info, 0, args->width);
> +       } else if (args->bpp) {
> +               /*
> +                * Some userspace throws in arbitrary values for bpp and
> +                * relies on the kernel to figure it out. In this case we
> +                * fall back to the old method of using bpp directly. The
> +                * over-commitment of memory from the rounding is acceptable
> +                * for compatibility with legacy userspace. We have a number
> +                * of deprecated legacy values that are explicitly supported.
> +                */
> +               switch (args->bpp) {
> +               default:
> +                       drm_warn(dev, "Unknown color mode %d; guessing buffer size.\n",

%u

> +                                args->bpp);
> +                       fallthrough;
> +               case 12:
> +               case 15:
> +               case 30: /* see drm_gem_afbc_get_bpp() */
> +               case 10:

Perhaps keep them sorted numerically?

> +               case 64: /* used by Mesa */
> +                       pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
> +                       break;
> +               }
> +       }
> +
> +       if (!pitch || pitch > U32_MAX)
> +               return -EINVAL;
> +
> +       args->pitch = pitch;
> +
> +       return drm_mode_align_dumb(args, pitch_align, size_align);
> +}
> +EXPORT_SYMBOL(drm_mode_size_dumb);
> +
>  int drm_mode_create_dumb(struct drm_device *dev,
>                          struct drm_mode_create_dumb *args,
>                          struct drm_file *file_priv)
> diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
> new file mode 100644
> index 000000000000..6fe36004b19d
> --- /dev/null
> +++ b/include/drm/drm_dumb_buffers.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __DRM_DUMB_BUFFERS_H__
> +#define __DRM_DUMB_BUFFERS_H__
> +
> +struct drm_device;
> +struct drm_mode_create_dumb;
> +
> +int drm_mode_size_dumb(struct drm_device *dev,
> +                      struct drm_mode_create_dumb *args,
> +                      unsigned long pitch_align,
> +                      unsigned long size_align);
> +
> +#endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..eea09103b1a6 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
>   * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
>   * @height: buffer height in pixels
>   * @width: buffer width in pixels
> - * @bpp: bits per pixel
> + * @bpp: color mode
>   * @flags: must be zero
>   * @handle: buffer object handle
>   * @pitch: number of bytes between two consecutive lines
> @@ -1066,6 +1066,50 @@ struct drm_mode_crtc_page_flip_target {
>   *
>   * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
>   * the kernel fills @handle, @pitch and @size.
> + *
> + * The value of @bpp is a color-mode number describing a specific format
> + * or a variant thereof. The value often corresponds to the number of bits
> + * per pixel for most modes, although there are exceptions. Each color mode
> + * maps to a DRM format plus a number of modes with similar pixel layout.
> + * Framebuffer layout is always linear.
> + *
> + * Support for all modes and formats is optional. Even if dumb-buffer
> + * creation with a certain color mode succeeds, it is not guaranteed that
> + * the DRM driver supports any of the related formats. Most drivers support
> + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
> + * plane.
> + *
> + * +------------+------------------------+------------------------+
> + * | Color mode | Framebuffer format     | Compatibles            |
> + * +============+========================+========================+
> + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_XBGR8888 |
> + * |            |                        |  * DRM_FORMAT_RGBX8888 |
> + * |            |                        |  * DRM_FORMAT_BGRX8888 |
> + * +------------+------------------------+------------------------+
> + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
> + * +------------+------------------------+------------------------+
> + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
> + * +------------+------------------------+------------------------+
> + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_XBGR1555 |
> + * |            |                        |  * DRM_FORMAT_RGBX1555 |
> + * |            |                        |  * DRM_FORMAT_BGRX1555 |
> + * +------------+------------------------+------------------------+
> + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_R8       |

+ DRM_FORMAT_D8? (and 4/2/1 below)

And DRM_FORMAT_Y8, if/when Tomi's series introducing that is accepted...

> + * +------------+------------------------+------------------------+
> + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_R4       |
> + * +------------+------------------------+------------------------+
> + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_R2       |
> + * +------------+------------------------+------------------------+
> + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_R1       |
> + * +------------+------------------------+------------------------+
> + *
> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
> + * legacy user space. Please don't use them in new code. Other modes
> + * are not support.
> + *
> + * Do not attempt to allocate anything but linear framebuffer memory
> + * with single-plane RGB data. Allocation of other framebuffer
> + * layouts requires dedicated ioctls in the respective DRM driver.
>   */
>  struct drm_mode_create_dumb {
>         __u32 height;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

