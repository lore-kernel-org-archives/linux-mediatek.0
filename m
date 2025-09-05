Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C04CA1015
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7VEF8fsQ16/5eguTcUya9i8sN0CVWScInMAqvxe2C0=; b=2Hmk4VLi4rKvsIBr8j4h8vM2zB
	FYav5vs64QC4FaByEvyXiJ3guF53FBx33i49tHqwMx4wS9ZLZDeTl5CZFMhgYEseVL3j0wG/QYxbu
	9FOZSElkv1qaHkesXz2npaGHGHAvOYIbsWNnxjTwK1qlyrcoQ/bGox1I1F3vIPEguYEFYAVOe3fL4
	h73v8F5Nbzi8dBr8aTFBsRSm935pGo0yuUPoG/Yn3nRIYSYpcMq/3UatVEuXEN/IkH9ku2VVhhDkn
	GUMnZO8V9uCqYInclPeh7W/RKAHLIhTYyljA2H53JAzDgFS+tYL7AEv6z5GanaPbjn44qPvcItmpJ
	H8dM636g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNbN-0000000GaKy-2ixh;
	Fri, 05 Sep 2025 03:59:05 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMo9-0000000GLxi-1eei
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Sep 2025 03:08:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so1870026e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Sep 2025 20:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757041691; x=1757646491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7VEF8fsQ16/5eguTcUya9i8sN0CVWScInMAqvxe2C0=;
        b=oSuueN3Kl/0r92iVpQaojBArPREvzMAjKpj/VvM43cT7MiK9q7ATzeN+u6UxOLttff
         Heh7UvipxyInhc28TJ/4ghWrjyPiJKQOCLyFi0w/JC7pp82580nwCBQmwaBxKqHX+pBF
         pYUqCBK2QFJDm3iBfbTNFajSY06tUCSK2dU5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041691; x=1757646491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7VEF8fsQ16/5eguTcUya9i8sN0CVWScInMAqvxe2C0=;
        b=hJVxeHkXjyEmVmi0DSh2X8LWMXj0ot5xgXVrcl/fy/L2i92niYDGZdgXVTa5ectzLF
         tweRZwQgVgJGqw8bRhlrO4amgpw0eErqi9lCfqGGn+axtk/gAiot5pY0LMBuInYb9Uhh
         PmFqy/6OmU9iqwvINN5aTiGaWZDO9OvaLdENSmf46mHvZ+pRN3933/d4LHbuouf7JoU8
         5n75JTMzxVTfV9L9UYpAmxDwf0rU/AYYQo+/rRWeY5y24PWIm/1rJvxJy5zZCenWFIOL
         v08qgEmICcPNnuqqh9PdxSXutRm6oO1fVROZiatKigYlN70H+lP+wJrtCMeK4EciU/nk
         cbAw==
X-Forwarded-Encrypted: i=1; AJvYcCVMtUqezYiS+qeBsQmX9wTyhVVB6i6J1wrz9lg4s1k8dbvAAc5cIlPuxnFEBp8+hCUExVJ7Yxt03Mp27TihsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwSIRfPIDHMvgY4ziCfK6iPB7gxn7XEpCeSZyWVgem1psEFHBT
	wNVRsvhksy3nqOfVi92jy2b3lD2/c84fMo3JTYL9sjAP95lnS5F0MSxOIXdzrdDQErbMvNA0ENe
	x2BHefn4klK3g/drrcC22tHE1c/f15UwDyZ0y57hl
X-Gm-Gg: ASbGncsc2xAjA6JCtd+Mtu5ufke/pa7N3VAu8sPn6iGMkCGSPv1m7Q/qWbrEvQ16Z79
	OoobWrrvK9kjEnjV8L9VpHsySpgbKG+wtAroGk2Q4rct9NN3tBzElo3Aj/604qcR2adKrvfspDW
	pY7zQEetCFUwqZFJbdf9sI02k31OXrbu6CrH6ou2Rz7lFHnKv3Ga9WI+I7buayFJzG0w2llZHlB
	s3cyQE/36UkOrr2z0epES1eFoT75xW0Yhd9Ab4hyyy1XVdS
X-Google-Smtp-Source: AGHT+IGldyHuDYkPWivf90sba85mlu8jLhfEVWhM+CRAtZ5kcPdD6IcKM+CLluf3aDGmO4+qEneV9QzpuYa7Bir4LF8=
X-Received: by 2002:a05:651c:1107:10b0:338:5ec:1dda with SMTP id
 38308e7fff4ca-33805ec1e2cmr23475841fa.9.1757041691297; Thu, 04 Sep 2025
 20:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com> <5820885.GXAFRqVoOG@workhorse>
In-Reply-To: <5820885.GXAFRqVoOG@workhorse>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 11:08:00 +0800
X-Gm-Features: Ac12FXw182raft1JJYOZIoO33KVRrFPcguj33C1FCebFdDsYEFHlJ4j0UxQM7o4
Message-ID: <CAGXv+5EbEDG3sZjo9BDv_8-HhLNNTH4DLZ3ibvdcsULXgkzjYg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] drm/panthor: initial mt8196 support
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Chia-I Wu <olvaffe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_200813_433289_C139F9D4 
X-CRM114-Status: GOOD (  38.91  )
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

On Thu, Sep 4, 2025 at 7:20=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Hi,
>
> On Thursday, 4 September 2025 00:55:02 Central European Summer Time Chia-=
I Wu wrote:
> > MediaTek MT8196 has Mali-G925-Immortalis, for which panthor gained
> > support recently. But the soc also requires custom ASN hash to be
> > enabled. This series introduces panthor_soc_data for per-soc data and
> > uses it to enable custom ASN hash on MT8196.
> >
> > The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
> > be cleaned up and upstreamed separately.
>
> I'm currently working on this, I'm at a functional 800 LoC driver vs the
> more than 30k LoC of the downstream... thing. I intend to send it in as
> an RFC once the clock stuff lands, and I get some responses wrt to
> figuring out what's still missing from linux-next aside from the DT to
> get basic boot working so that I don't send in something that I
> accidentally shredded during a rebase without noticing.
>
> Cleaning up the downstream driver is a fool's errand, it's like 6?
> separate drivers, with lots of global state (and no locking), without
> using the common clock framework, and relying on abusing -supply DT
> properties to force a certain probe order to make all the race
> conditions it would otherwise have turn out fine. A lot of it is
> code that seems dead, or wrappers wrapping wrappers that have nothing
> to do with how the hardware actually works.
>
> My solution adds a small mailbox driver for the GPUEB, and also adds
> a new module that lives in the panthor tree and registers itself with
> panthor's devfreq stuff to be a "devfreq provider". The motivation
> for making it devfreq instead of a clock+regulator provider is that
> the GPUEB seems to have several quite devfreq-like parts to it that
> I am not yet using, namely setting a job completion target time and
> several methods of limiting performance.
>
> As it stands it can set the OPP, but boosting above 1.43 GHz does
> not seem to stick. The boosting stuff may be done by the four or
> five other ways it has to set some frequency target.
>
> I'm hoping I can send this in maybe next week or the week after. If
> things remain blocked by then it'll be compile-tested in its current
> form only and lack some clock stuff.

I suggest posting them when you think they are ready, and not wait for
the clk patches to land. The review is going a bit slower than I expected
and Stephen usually just picks up the patches towards the end of the
cycles anyway.

ChenYu

> Kind regards,
> Nicolas Frattaroli
>
> >
> > This initial support also lacks support for some hw configs. On some
> > configs, panthor is expected to query a mask from efuse to mask out
> > unavailable shader cores from ptdev->gpu_info.shader_present. This
> > requires extending panthor_soc_data with a callback to read the mask.
> >
> > This is an RFC because the dependent drivers are not ready yet. But I
> > would like to gather opinions on having panthor_soc_data for
> > soc-specific data and having CONFIG_DRM_PANTHOR_SOC_MT8196 for
> > soc-specific code.
> >
> > [1] https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc9=
0bde54b32872c59cf5c77779
> >
> > Chia-I Wu (2):
> >   dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
> >   drm/panthor: add initial mt8196 support
> >
> >  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  1 +
> >  drivers/gpu/drm/panthor/Kconfig               |  6 +++++
> >  drivers/gpu/drm/panthor/Makefile              |  2 ++
> >  drivers/gpu/drm/panthor/panthor_device.c      |  2 ++
> >  drivers/gpu/drm/panthor/panthor_device.h      |  4 +++
> >  drivers/gpu/drm/panthor/panthor_drv.c         |  4 +++
> >  drivers/gpu/drm/panthor/panthor_gpu.c         | 26 ++++++++++++++++++-
> >  drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
> >  drivers/gpu/drm/panthor/panthor_soc.h         | 26 +++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_soc_mt8196.c  |  9 +++++++
> >  10 files changed, 83 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_soc.h
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_soc_mt8196.c
> >
> >
>
>
>
>

