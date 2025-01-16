Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE04C02183
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEBC4YtYCJgyImQmIlExzdfeh9O+mJTPH+y0EtpZi1E=; b=Ua7O3JDehyW26yqqVzVDA9IOTC
	oYHElMvSJNqZK1pZIsvI4FJJb/P1PMnHO/GRAVQAgTh9s2VViHNn2pg9JXgyO5XX7iDNtmiKKlK4S
	GP19sFjBQgF3+OzgKtho0ujrXFN1hc0Xtc01Do23pZj220ZVyIWnDp7RG+MNCgOWC11Ke+ojmoYDw
	xg5GcFwfkWOS4eLFxQMr+T5J63HicpJ2BUWRViJRoVqFwL+BWJi3JCV7pUEZkNiDyDgTh4qJA6sye
	fQfVCX9+XRdf47iI/cS3SBvb+xZH1DkdNvi2e3CvMaxETG7jQIv/2+gwp0VZje2fG3Gdaj0Z1LENQ
	XXxx+Ngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYN3Q-0000000EUIN-09Bp;
	Thu, 16 Jan 2025 10:24:48 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYN3N-0000000EUHV-49al;
	Thu, 16 Jan 2025 10:24:47 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21644aca3a0so15228585ad.3;
        Thu, 16 Jan 2025 02:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737023085; x=1737627885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEBC4YtYCJgyImQmIlExzdfeh9O+mJTPH+y0EtpZi1E=;
        b=ZxtXIIh3V+JhC1TkmQEMbF+fCqnnDviQ91Jull1dZggNZU+4oCWyYrmRCRPi1YTMIR
         1yav4Ih4D5kWlqwuGmZVgF+4YKC055oa+2KgGiOIuuYoDhGPJFpAqq6gckJTYdadHA0z
         5DFI982JLQbyAUhV8J2hBwkvOHkZ6+2DEVHYrp1gdcIXcE9rxfN/M5IIsdTOEwZ6DPLp
         vT3QvBLSOJKOdWuUrisOFtUjhW6j+4Vi8B3fxFVd4QMn6Zc5gYlKntfoA9A3b4t6q+1E
         SjeRF+EBJGjpa7USIyRhVZ7LzjRLyiL+GfYVHaW2nr9h76Clkt2UQGhlHhveZ4uR6a0D
         SBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyNvEXv+q+zouGlIJ6IKzL17isPJFbKWuHYW6qiq1lbd+cL4jeE30H+2413nEQKNjzr639K/y8Z95p56tFrzs=@lists.infradead.org, AJvYcCV8D4PjazBWI5aA4M2Hi+lqRJvGOvdLgmcvHBPRhKUaAVjNgoU95AKoRMaCzkyY1Wvb/Cixnw+z2T4X8rCOYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB47uvwgBAKspnuudSbbyCcJIOuLGKe6vkqQrTRrVuFcYhQNhK
	6GU+5kyvFBgTr++6/NHKycoRV1va5EbaqcmCdD+TZeqqzFwSX1ELRXEORVDbQk0=
X-Gm-Gg: ASbGnctA49gf/zhnmB+lW18n5Sq76MN7No5zqV7u3yDl4vIk14djlFhK1SeBP5vYvsW
	/tQ0jLPx2eEVf/dRKgLibIZVtj110OKfxikUdrdzuljKFGb2MI4gXkPLKdtzfj99E9UDgbGZ1k0
	IrovIIPHZcPnBUGNdLjf5ECHOgOqzETgm/yEtnJMGx0t5ghD4fo7x6GGSZZ6bUOEDXpap7KjT4C
	q2Ma3sw0HGc87hKva+RASD3rE9kURZnT+zkLiXq4dSOOfoFoZ3M73oIhKslwgU1BZYuzS/FBnzA
	oEVfTADdi1DahdYYmAZQY3Q=
X-Google-Smtp-Source: AGHT+IEdJHp80+VW/Nk9goKvWlIOxWSeakS0tzyODFxjFDmO//aNcVC6D8zy+tYJfw8u4/velgzVig==
X-Received: by 2002:a17:902:ce88:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-21a83f46a1dmr527410625ad.5.1737023084717;
        Thu, 16 Jan 2025 02:24:44 -0800 (PST)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22dcf5sm95167695ad.181.2025.01.16.02.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 02:24:44 -0800 (PST)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21636268e43so15700675ad.2;
        Thu, 16 Jan 2025 02:24:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrp9F58SHJ7IA6LSrPtBpuBTLossOKHLb1a5BIrEYxMLSJei+8PzelcnIoGDIgSIiUKnR/9UYmin/WnOuDtQ==@lists.infradead.org, AJvYcCXfoDH0zZJirEfe7uocqnRZQ0EzJYeVmmBmIH0s5znOfue7kBrRbbRT6RA49oJK+E8Ko8rTvo72AC1mSwnXD4s=@lists.infradead.org
X-Received: by 2002:a05:6102:3a14:b0:4b2:5c2a:cc9d with SMTP id
 ada2fe7eead31-4b3d0dc0215mr29032050137.16.1737022681773; Thu, 16 Jan 2025
 02:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20250109150310.219442-1-tzimmermann@suse.de> <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com> <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com> <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com> <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com> <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com> <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
In-Reply-To: <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Jan 2025 11:17:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
X-Gm-Features: AbW1kvbCtGVmgNJ1oRyFqRTMVO1bCUCk0WwRoRvrPqq521tQuGLKMDrWmAM4CG4
Message-ID: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>, 
	Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_022446_022668_5487BBEB 
X-CRM114-Status: GOOD (  39.20  )
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

On Thu, Jan 16, 2025 at 11:03=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 16/01/2025 10:09, Thomas Zimmermann wrote:
> > Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
> > [...]
> >>
> >> My point is that we have the current UAPI, and we have userspace using
> >> it, but we don't have clear rules what the ioctl does with specific
> >> parameters, and we don't document how it has to be used.
> >>
> >> Perhaps the situation is bad, and all we can really say is that
> >> CREATE_DUMB only works for use with simple RGB formats, and the
> >> behavior for all other formats is platform specific. But I think even
> >> that would be valuable in the UAPI docs.
> >
> > To be honest, I would not want to specify behavior for anything but the
> > linear RGB formats. If anything, I'd take Daniel's reply mail for
> > documentation as-is. Anyone stretching the UAPI beyond RGB is on their =
own.
> >
> >> Thinking about this, I wonder if this change is good for omapdrm or
> >> xilinx (probably other platforms too that support non-simple non-RGB
> >> formats via dumb buffers): without this patch, in both drivers, the
> >> pitch calculations just take the bpp as bit-per-pixels, align it up,
> >> and that's it.
> >>
> >> With this patch we end up using drm_driver_color_mode_format(), and
> >> aligning buffers according to RGB formats figured out via heuristics.
> >> It does happen to work, for the formats I tested, but it sounds like
> >> something that might easily not work, as it's doing adjustments based
> >> on wrong format.
> >>
> >> Should we have another version of drm_mode_size_dumb() which just
> >> calculates using the bpp, without the drm_driver_color_mode_format()
> >> path? Or does the drm_driver_color_mode_format() path provide some
> >> value for the drivers that do not currently do anything similar?
> >
> > With the RGB-only rule, using drm_driver_color_mode_format() makes
> > sense. It aligns dumb buffers and video=3D, provides error checking, an=
d
> > overall harmonizes code. The fallback is only required because of the
> > existing odd cases that already bend the UAPI's rules.
>
> I have to disagree here.
>
> On the platforms I have been using (omap, tidss, xilinx, rcar) the dumb
> buffers are the only buffers you can get from the DRM driver. The dumb
> buffers have been used to allocate linear and multiplanar YUV buffers
> for a very long time on those platforms.
>
> I tried to look around, but I did not find any mentions that CREATE_DUMB
> should only be used for RGB buffers. Is anyone outside the core
> developers even aware of it?
>
> If we don't use dumb buffers there, where do we get the buffers? Maybe
> from a v4l2 device or from a gpu device, but often you don't have those.
> DMA_HEAP is there, of course.

Why can't there be a variant that takes a proper fourcc format instead of
an imprecise bpp value?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

