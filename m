Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C0FC02187
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBwF2KOXlFDp1MGeRltem3iAJtpX3AYE0x8w+f0gonM=; b=3pkJSHayYCPMCOwKVb7tluVVH9
	fm4XROK3JzLUcYazsXZrO5YSo7p1hUk2btSrneZ/QhNH3BYRUEkLbA/ZUVZKhlIzfKIkO+JgUYLat
	BT3qpN34U2hfnbFiMSijmbA8tpJmjhXp3FdI6w8WePnnpTYwYsATfuvBYn+J8poNDuzI+grUkmsPf
	gAj9lg/EJE/bw0aswYMT5Zm9uyTJFFhI9ezT+r2qUp+9qiPGaAxozEzAk/t89lW0rfY2c9gV0GQEH
	EG3Kh3fCHCPIlmFyTl7QtN4bNKdKDJjHwPvd+zfco+4NRrRfBYqPTq0Eio7YeOGTSD0QnKvF0LOfl
	E5gyOfbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOvm-0000000EsQU-1qat;
	Thu, 16 Jan 2025 12:25:02 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOvk-0000000EsPL-02et
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 12:25:01 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6d92e457230so8661056d6.1
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jan 2025 04:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1737030299; x=1737635099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBwF2KOXlFDp1MGeRltem3iAJtpX3AYE0x8w+f0gonM=;
        b=TH3qu3jbDnJ5uQVatWCb1Fr53DJvD9frVswtQzA13bCLFIJoyCe3f/xks6w+TBNszr
         NvDxoBUM3mmljYcSf5AEP8AlHNMYB/lMVWu8HoN64CpoEKJTZNWq36qtJVvmiUjyprLg
         xG7+b5sbL3qPkBqszLBcWMw32tgSw08J5vEPrv33eQ2rM2lcZnHnzAbRHeVPVP16lBWE
         EmBUfc7jzbhg8sRQBtaynykER4efUUFan/K7DblZJiYiGrzswIOrLB3hGqkAtPAQynBF
         RAUvgaSqgD92EE8/7iN9fARpJVnMIy6NQSMUNZrVNldwZE4KWrt47i5kzDMPuV+gGSGf
         ONxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737030299; x=1737635099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBwF2KOXlFDp1MGeRltem3iAJtpX3AYE0x8w+f0gonM=;
        b=mUhuBCTjngfqjb4ZigjEJggmYwr3+PfeneBIW17rKSDy0e8VMYW7bH4wHoZzHgi/5E
         pRzvfHcw2f15CmA9qaBYWNSnzmBbgsui36XMylsZV1rINv25BeSbEuFQfcPzFPM+Oo8w
         7UQE0Zt7Px5dGWL1crtk/40f+nTG3JPL6Yuz25SwiKMXHkn66g8qtLXQMbhZGm3xjOPi
         9sYTHhy/W+1XAg4qq9PVUa/ZYhvMT+YLjcbjPMnWji12p51NN+JSGKpFNJKdmDlx1x+G
         vmEVVJ/LA8MhW7k271fNSacXTgARyWDhUNTRBoAdsinUeKqmiR26tCHpEzG9/lLezpSM
         gWkw==
X-Forwarded-Encrypted: i=1; AJvYcCWZOXD9/vklqexAUr+ovDA7H9dO96OP7W0511zuTyGRT5ltZ+cIUdAy8i1auHLDyfozMHhNYQoSvvjSkMSOXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YySTOC+ndLtZlc42dqzwgQtGdVEgR/QLdW56gyanhbi3zIKIFBG
	qyGROAkJUJVjTcENPGHnt3Fx5O5kScq2RTEsvX3ymLAI9i7HcCleQhIZG32vrFrKhmu+mT1Adn7
	Z7WwLyKUCnEyn0TSkV3iccN0bfmNk/pVO868EMw==
X-Gm-Gg: ASbGncsCHc0HYb4f0zKvjDWTjS4hWw8oG6vrzlA/8BRyfqGPEIAuntkoxA4DISrcLG1
	HYnHe3WQuz2ABtjGeFKdjRC9AaujqhadqBtQ=
X-Google-Smtp-Source: AGHT+IHYPoThOqCGG0mIrocl9o1givl0D/RoYwWOKY0kUiZ64KPF9cSvP+6N1Rd6ke2PYtdS9xOibflODkJbaGvT990=
X-Received: by 2002:a05:6214:528e:b0:6d9:3016:d0e7 with SMTP id
 6a1803df08f44-6df9b2b1a21mr442378366d6.29.1737030298608; Thu, 16 Jan 2025
 04:24:58 -0800 (PST)
MIME-Version: 1.0
References: <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de> <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de> <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de> <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de> <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
 <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com> <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
In-Reply-To: <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 16 Jan 2025 12:24:47 +0000
X-Gm-Features: AbW1kvarRJv1VyJjUo1t8ScK0brJ2o4-Qq6ABYK10edUo6rgOW2PAccCb4uQWlM
Message-ID: <CAPj87rNS7quwfqDmxyrW8_vQ6tnrcfWUn=81aTduDXtmdVkkAg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_042500_153657_33841E74 
X-CRM114-Status: GOOD (  22.53  )
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

On Thu, 16 Jan 2025 at 10:35, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Thu, Jan 16, 2025 at 11:17:50AM +0100, Geert Uytterhoeven wrote:
> > On Thu, Jan 16, 2025 at 11:03=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> > > On the platforms I have been using (omap, tidss, xilinx, rcar) the du=
mb
> > > buffers are the only buffers you can get from the DRM driver. The dum=
b
> > > buffers have been used to allocate linear and multiplanar YUV buffers
> > > for a very long time on those platforms.
> > >
> > > I tried to look around, but I did not find any mentions that CREATE_D=
UMB
> > > should only be used for RGB buffers. Is anyone outside the core
> > > developers even aware of it?
> > >
> > > If we don't use dumb buffers there, where do we get the buffers? Mayb=
e
> > > from a v4l2 device or from a gpu device, but often you don't have tho=
se.
> > > DMA_HEAP is there, of course.
> >
> > Why can't there be a variant that takes a proper fourcc format instead =
of
> > an imprecise bpp value?
>
> Backwards compatibility. We can add an IOCTL for YUV / etc. But
> userspace must be able to continue allocating YUV buffers through
> CREATE_DUMB.

Right. If allocating YUYV dumb buffers works on AM68 today, then we
need to keep that working. But it doesn't mean we should go out of our
way to make CREATE_DUMB work for every YUV format on every device.

Currently, drivers are free to implement their own ioctls for anything
specific they have. But like Laurent said, standardising on heaps and
how to communicate requirements to userspace wrt heap selection / size
/ alignment / etc is imo a better path forward for something generic.

Cheers,
Daniel

