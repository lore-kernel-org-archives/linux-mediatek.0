Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1786C02187
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 10:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gprmJm/Cl6p6869D60XQ3XjbtrOWLJEOxZITgqe2J5o=; b=OaYJqkGTmQ8sN8bpW0Zqm2stXr
	Olh01gF4rXQWUmmOVeFwMGJQfQFrRhC6Bhh3awRHofj0r3/GHLAcp393kb3A9045n5HxZam6WEWno
	VYSNTFRheUyOyA2LmswjhcJ4Op0Nf971NYMQYKb6jexubErrS5qBy/IHyX7QUvpKSYUiRw1J1NkYQ
	7vA8c+ZRIzD/869IpigV+ljSECHH3lnGVbeKvdScw9nx9OirLUxjZjsUWjWedt04KDm9jqJ31eT9U
	9NxgPjAhwkW+q73/VGl//Yc6xYAt3snVYVh8F3XZSenomMgy6FYaDEbLVWY+bfvOXp2BIp9CF9I/0
	7LPjfzWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNDy-0000000EXJf-3ihQ;
	Thu, 16 Jan 2025 10:35:42 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNDx-0000000EXI4-0htD
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 10:35:42 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so793761e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jan 2025 02:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737023739; x=1737628539; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gprmJm/Cl6p6869D60XQ3XjbtrOWLJEOxZITgqe2J5o=;
        b=SnNy5V7qS7pBJjr0itblcoh5/hhnqHcGK8BZSTNLkNh/s3+bb0fl0OiYn0JUv6MJJD
         4wfcjlp0ePjuAq2MCJy15ODaB+EuW8Ozj8Q9iagckh30znX/zs5J4KFTwaVHY2fEvnzN
         dWyvtfJj3zd0PnbgWcsf/5RZjZfxaS8L1mAguVjtxUuFP2i4pSRmML59I+dKJtqGeaoF
         i5qpU0aaep/JcFQJwC8ow0q2TACsRFXtwHbmBywmHnIa1AQqiVxTgQWkzBcSz26VeDsp
         O8+oI8SyXdITWi0mMrbGOZIsBwsa5+lMpopTK/yitKalGmCX7ipy9cNRyChDDgeV2apG
         aeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737023739; x=1737628539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gprmJm/Cl6p6869D60XQ3XjbtrOWLJEOxZITgqe2J5o=;
        b=Lu0tR9VQxy1+nCXoYudSg/gohMVIaGE5Qmow4v+rsYF/uMsewwrss9bnsvBPM6dqVB
         O38pwPnVFsVtcKPODBXyjhxafTa8qU2bBcVoLEaBOH/m+p/pxnyeakUTPeonFlhIqq4P
         tdEug20oFf1ctt/jIzuBsLqUcDzpdN3KHTgjZscMd3uhMbeFOh2LUttvTlNsaZLohUHo
         PqhsqKHzxNw3hzhEav1fhQy1mmsLSmlBFzrLlS5NdCr1omMgJFN0O3Oqvt5y/1Pe2S7w
         eoaYHnK5L5lS4bhRMe5wnKHO7RysQGG47GiXqFP7nRjBOZ/xraOJHxLFcpesxH2nTeRD
         S/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXVeMj2L8sEfwapjn6Ed8aPLJaY7RJUTEdBssl5F/A5Z3lLVWc8DuKLEjaVPXcvdC5q4u+G3rQQmjTDjxsquw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRt9q9WRRQeRUd6UY8O2wcyQuuXUv9zC0ydQWSDik/Tk7AI84H
	iyYnZWb2+96kU5cKHCrXWRIH0imC45aR8BH6y3kn0MBHNmeMHbIeHnPxt5SeupU=
X-Gm-Gg: ASbGncvNcCXVjWACGx65awV0dwSrPPoBMQ0vfwW+e2I/Jy4MW8wwqMyKHdt3RD1T7ST
	DgnfBLPT5Cx+W2ZxwNLFMUpTBY74Du7m0AHyk3oucu0Tyl54shca/z+uLEYwHPaDypRywXMht84
	hU4GNt4L6Cfs3/IVKtxAwFAuBJvUDvH7XteBpQtVR+PKimJowRS4yNJVLLEvArishvvlMbT7xUV
	vuXhryYaJ2R8JjhpB+eW2vlgXv6WweYKi58lc/ZxL6IOWAiV6sb242uB+KStiwI5XPQTlx9O8ew
	MX/xIGbCvLOzTVhj4yQ6zMMO12XScSjSSRpt
X-Google-Smtp-Source: AGHT+IH3G1Mnr8k23AF5/dIs7iAuJyOHJCwOMDmvWc4umnN+swRWG+FLBCp9QsFSdvm1xDWFrQeEdg==
X-Received: by 2002:a05:6512:3d27:b0:540:20a9:9ab5 with SMTP id 2adb3069b0e04-54284824476mr9777793e87.50.1737023738809;
        Thu, 16 Jan 2025 02:35:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49d6esm2261466e87.50.2025.01.16.02.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 02:35:37 -0800 (PST)
Date: Thu, 16 Jan 2025 12:35:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>, Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
References: <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
 <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_023541_204439_1F4F2100 
X-CRM114-Status: GOOD (  44.10  )
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

On Thu, Jan 16, 2025 at 11:17:50AM +0100, Geert Uytterhoeven wrote:
> On Thu, Jan 16, 2025 at 11:03 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
> > On 16/01/2025 10:09, Thomas Zimmermann wrote:
> > > Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
> > > [...]
> > >>
> > >> My point is that we have the current UAPI, and we have userspace using
> > >> it, but we don't have clear rules what the ioctl does with specific
> > >> parameters, and we don't document how it has to be used.
> > >>
> > >> Perhaps the situation is bad, and all we can really say is that
> > >> CREATE_DUMB only works for use with simple RGB formats, and the
> > >> behavior for all other formats is platform specific. But I think even
> > >> that would be valuable in the UAPI docs.
> > >
> > > To be honest, I would not want to specify behavior for anything but the
> > > linear RGB formats. If anything, I'd take Daniel's reply mail for
> > > documentation as-is. Anyone stretching the UAPI beyond RGB is on their own.
> > >
> > >> Thinking about this, I wonder if this change is good for omapdrm or
> > >> xilinx (probably other platforms too that support non-simple non-RGB
> > >> formats via dumb buffers): without this patch, in both drivers, the
> > >> pitch calculations just take the bpp as bit-per-pixels, align it up,
> > >> and that's it.
> > >>
> > >> With this patch we end up using drm_driver_color_mode_format(), and
> > >> aligning buffers according to RGB formats figured out via heuristics.
> > >> It does happen to work, for the formats I tested, but it sounds like
> > >> something that might easily not work, as it's doing adjustments based
> > >> on wrong format.
> > >>
> > >> Should we have another version of drm_mode_size_dumb() which just
> > >> calculates using the bpp, without the drm_driver_color_mode_format()
> > >> path? Or does the drm_driver_color_mode_format() path provide some
> > >> value for the drivers that do not currently do anything similar?
> > >
> > > With the RGB-only rule, using drm_driver_color_mode_format() makes
> > > sense. It aligns dumb buffers and video=, provides error checking, and
> > > overall harmonizes code. The fallback is only required because of the
> > > existing odd cases that already bend the UAPI's rules.
> >
> > I have to disagree here.
> >
> > On the platforms I have been using (omap, tidss, xilinx, rcar) the dumb
> > buffers are the only buffers you can get from the DRM driver. The dumb
> > buffers have been used to allocate linear and multiplanar YUV buffers
> > for a very long time on those platforms.
> >
> > I tried to look around, but I did not find any mentions that CREATE_DUMB
> > should only be used for RGB buffers. Is anyone outside the core
> > developers even aware of it?
> >
> > If we don't use dumb buffers there, where do we get the buffers? Maybe
> > from a v4l2 device or from a gpu device, but often you don't have those.
> > DMA_HEAP is there, of course.
> 
> Why can't there be a variant that takes a proper fourcc format instead of
> an imprecise bpp value?

Backwards compatibility. We can add an IOCTL for YUV / etc. But
userspace must be able to continue allocating YUV buffers through
CREATE_DUMB.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
With best wishes
Dmitry

