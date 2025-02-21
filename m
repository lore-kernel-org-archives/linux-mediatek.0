Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01962C021B3
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Feb 2025 11:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRmDUg88sJqiPwLbbhmS638djtZJpa1TX+xwhTJhivE=; b=giCfXWIs9CgS7EzUSrOsk1mUtj
	KHiIkpOcQmL8m0LHvzoOtf+0EoF1FrG9PHSJ57FInvQRHTrToCXlj9wU+NnvTPd3j8e3xD2raU8zp
	XfCuHcOAu88MFD7KTZnig+VfE2byO/2DsNIxRcWx15UNi+I2R8B+wblhrThx4XCGRgcNvoQDG1hcE
	rygUINnHEzPNTe60HpN2f6Yqntzbbo/+cW01apDkKxdDuEAen0CtWFjPcay7VLb2GI9UY+VcafZ1/
	2ucJNn4SEZ+ncP08MCWnWOuscY8Dv1vIYpFHczDeBAKcxbv/wVhQ87PLgAHdTqWu5dFbruMprC7f6
	xUghZxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQwJ-00000005I6N-06ET;
	Fri, 21 Feb 2025 11:11:27 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPn3-000000052jb-2p6h;
	Fri, 21 Feb 2025 09:57:50 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4be5033a2cbso864413137.1;
        Fri, 21 Feb 2025 01:57:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740131866; x=1740736666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRmDUg88sJqiPwLbbhmS638djtZJpa1TX+xwhTJhivE=;
        b=utjiu9HdUWt/f74YvghaetCPcel7DZkI3oXSVnvTRKrp0Mulsol+fWfiI1VAn34bpP
         7zAIj4r3HA5ragywH+7gKaXo0V61R2kxpinHvzv5pxaltKW7VelQvcijNGnpxY0KFaVC
         g2L2a89c+etbTEytC5Xi+gCYtT+ph9POfrPlg1R+V/jDBjb3L5p4OK+D5rfgtN8nmZQs
         1Yw+chpGysh5jxTLzvDwAaCaxmHLTBkAUHfcUFb45VQ/cIMB0NqobsCEWZrUT5LD4ilG
         j1a4vIAGE/Emt0tz/+oxdsaFXFxa176Wx/23IPgoqWrwnPC166fOdmS8oqdOZRFY11vz
         V8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU22QpExskcOqYn0bbiv7fD/rhCqdZuxxbdmGeuAeTkCT3qrNE2nP5rBoLqIyyCj9gTpSRzAcfhq/JPvDsJeA==@lists.infradead.org, AJvYcCWuvg0ZzsNcSGIn0w6LnCWTG/RtMVhyv9xIEtE32BisiU/5Oa9oK8X5vCT69j3XJ/MxH5lmVNL1dJnLGXiwDPo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNatNPviZrM2fApor97lu2cYgqaPLN1Ek5SlSBX2ezbOxvO3NO
	XjHwwGbS3YNXtXgnyrI8bzaFTR0IEYyBD20O180jYJBuUqIz2Tbn0unB3SdZ
X-Gm-Gg: ASbGncunLWeEZkVjJMgpDXxlKsZMf/RYAPDHQZjMjMlCbnfSlByZ8iMFMMz281gzZ0D
	yxv3hSPI4WWWR/APf2CgSI0S87FY6KyeDN3Y6J2SVKVVl78oNC1PPtrg6Hz/6RY0HSEPChft930
	G8xBcInMXDhwpiNsW6gwrWnYsaKND7DHxTY7ZP+xRErPRKqGHNED5Wm/QkgbkIGnvtbhyP4VRrc
	RqKCdNDdPbsi4oVtMgdOzZpzAoCO8W9xpk6aJRAQJmQg82Xx/g1GwexGeLzZA72UlbP118tcT5m
	w9gVBhieL7rX1i3lIMYZEEWY9rWSUF2zf4Om+volvVAtUh+DMmHgUmRRk1/JSYVk
X-Google-Smtp-Source: AGHT+IGxH1iGmvLQBtbV6fLBU9gA6nXc/4fRJCH9i0Zy1Ejju98yeWz86+GKpHG/IyTdnBUPKimuXg==
X-Received: by 2002:a05:6102:2acb:b0:4bb:d062:43e with SMTP id ada2fe7eead31-4bfbfdc459emr1766236137.0.1740131866452;
        Fri, 21 Feb 2025 01:57:46 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bc18de1d31sm3433419137.1.2025.02.21.01.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 01:57:45 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so467764241.1;
        Fri, 21 Feb 2025 01:57:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV98qZsJiLUNXKsf53ApVSsPDcSeS1+B3eyoxSsrXeioZvnBPeAXOBfMhlpNgJbYKchNRhZEdKLCUN/ItwPVQ==@lists.infradead.org, AJvYcCVNwkmWzXAmGVMZwTRRnLgIqX/bq3EuKNX7++sF47wXEC/1I4bVdjM0Nxje57Q61+DjxVPrF6THEpZFtfll+OI=@lists.infradead.org
X-Received: by 2002:a05:6102:441c:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4bfc0277734mr1360564137.22.1740131865660; Fri, 21 Feb 2025
 01:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20250218142542.438557-1-tzimmermann@suse.de> <20250218142542.438557-3-tzimmermann@suse.de>
 <dcd59a75-7945-4a2e-99f9-3abbb3e9de14@ideasonboard.com> <355ed315-61fa-4a9d-b72b-8d5bc7b5a16c@suse.de>
 <596b960e-71f8-4c2c-9abe-058206df1dfb@ideasonboard.com> <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
In-Reply-To: <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2025 10:57:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnZTj-8bqsbbZdhp0H7Bwib8GkEuXPcKNZjdo_jRRXgg@mail.gmail.com>
X-Gm-Features: AWEUYZnV-ULUCYHgs2rYqHTa6wPlfKvTAAqMyxRQ0em_d1IVN8Mw0n8NQD9eWqI
Message-ID: <CAMuHMdVnZTj-8bqsbbZdhp0H7Bwib8GkEuXPcKNZjdo_jRRXgg@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_015749_710358_7CEB716F 
X-CRM114-Status: GOOD (  32.57  )
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

On Fri, 21 Feb 2025 at 10:19, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 20.02.25 um 11:53 schrieb Tomi Valkeinen:
> > This change also first calls the drm_driver_color_mode_format(), which
> > could change the behavior even more, but afaics at the moment does not.
>
> Because currently each driver does its own thing, it can be hard to
> write user space that reliably allocates on all drivers. That's why it's
> important that parameters are not just raw numbers, but have
> well-defined semantics. The raw bpp is meaningless; it's also important
> to know which formats are associated with each value. Otherwise, you
> might get a dumb buffer with a bpp of 15, but it will be displayed
> incorrectly. This patch series finally implements this and clearly
> documents the assumptions behind the interfaces. The assumptions
> themselves have always existed.
>
> The color modes in drm_driver_color_mode_format() are set in stone and
> will not change incompatibly. It's already a user interface. I've taken
> care that the results do not change incompatibly compared to what the
> dumb-buffer ioctl currently assumes. (C1-C4 are special, see below.)
>
> > Although, maybe some platform does width * DIV_ROUND_UP(bpp, 8) even
> > for bpp < 8, and then this series changes it for 1, 2 and 4 bpps (but
> > not for 3, 5, 6, 7, if I'm not mistaken).
>
> True. 1, 2 and 4 would currently over-allocate significantly on some
> drivers and the series will reduce this to actual requirements. Yet our
> most common memory managers, gem-dma and gem-shmem, compute the sizes
> correctly.
>
> But there are currently no drivers that support C4, C2 or C1 formats;
> hence there's likely no user space either. I know that Geert is
> interested in making a driver that uses these formats on very low-end
> hardware (something Atari or Amiga IIRC). Over-allocating on such
> hardware is likely not an option.

Note that the gud and ssd130x drivers do support R1, and I believe
work is underway to add grayscale formats to ssd130x.

> The other values (3, 5, 6, 7) have no meaning I know of. 6 could be
> XRGB2222, but I not aware of anything using that. We don't even have a
> format constant for this.

Yeah, e.g. Amiga supports 3, 5, 6, and 7 bpp, but that is using
bitplanes.  There is already some sort of consensus to not expose
bitplanes to userspace in DRM, so limiting to 1, 2, 4, and 8 bpp
(which can be converted from C[1248]) is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

