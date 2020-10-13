Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29D5C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 12:38:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C26822456
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 12:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nh8DeVuS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="avFt+8xS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C26822456
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7TJdAkYZp5VP/XiBIx1IEV13330nC/+w9XW5Fw0pFKU=; b=Nh8DeVuSSPE8o/B7CgvzccIKC
	/WNX4Sjdsiz/0zaMjjQ0Cl49YR5zpn/V3qfAkZB///FqJwjAkioW1B9849B7eTbVJoBgHirJVQL6X
	b2qXWuu0Rr96PLtbEDYYrGdCoE1zSBOtJVjJ+QITG91FFLeSaSjoByCbEoiwWjtOc4ZwOc7AvbM4o
	XutDIXXBPK0ZBbSEH4L4LGpvKe0FchC7HZAXaBOsG1wDrvkwV5F7QPMSYZf6W2PLfB6zbSpFbKv4m
	zsvxyocgVSsQksxc+GwuR+3IdV83zBRJ4rSsY5odEv6JZsEkuOkqC8nBXpBxv2tiQ+blW8JesNz7q
	PhhlV7bnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSJZe-0006S1-0J; Tue, 13 Oct 2020 12:38:38 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSJZb-0006Pa-Rq
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 12:38:36 +0000
Received: by mail-ot1-x343.google.com with SMTP id m22so7460725ots.4
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s185zwWcpFWZXmjk0XfZLH1jYMkQ8pmY2UrGI8e/2Cc=;
 b=avFt+8xSpNxHIE0rLlsKdL0S1oWqx3zu2gP3OWYeLlh+27eOdUVYGKDS/5m/ZtoJ0h
 Yrza2wsd6Kc/6uuAnM5lP4SJR0cxrT3nkG2P+oV0Srmum8t7PbEoBlnYA/7EVYRzRAav
 54HJpiHwCSgTBskUW+uV0TWXyaVAZyuM7MF24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s185zwWcpFWZXmjk0XfZLH1jYMkQ8pmY2UrGI8e/2Cc=;
 b=gdkZ8X4aZDGUw8ylvkYC4/GPTY29Z0Ljs6FWVAPFQ+/eqYiwf9VKkqY4ZgVYdRWP4t
 5RRKQLehEZVCIw5jrDBQkGHjZluwHNkEXEVCgt8MO0eECZ2lsExqn4SuzopDGDjBZi/V
 Ea0UD0KQWyDSpoJXLNY7tHJR6Vy2UyLK62o3t8CZbXGdMLjndTreqX3+eb3C9x/Wrb71
 Js4qUYSTp2k8aBEGgyeozUa0sTe862acWAltaBKCKZB7MGCNmQuuw2M8GVoMyK5StPqb
 JKkX/lk8SmZ8DEuupBxHG/VV+z4lNq46BvmcB8v5CL2zoZSbC1CC1/WLfbbsgT/bm9jQ
 0hIA==
X-Gm-Message-State: AOAM531SOhEOLV9VfsF+f94VE4bS0ETgRatSah/FHgyK+m6NGAlQkvm2
 iItCmw+gttsDKo5cVoczO41nCyVUdmdikA==
X-Google-Smtp-Source: ABdhPJzbpk4msFLhaK5yq3pVekVU+mXEOXmYOnK5yzKG6R8kjxOf/2Z3gRuKx5vcRhzF23VwthCbSg==
X-Received: by 2002:a9d:6b0b:: with SMTP id g11mr20378938otp.349.1602592708294; 
 Tue, 13 Oct 2020 05:38:28 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com.
 [209.85.210.43])
 by smtp.gmail.com with ESMTPSA id a2sm11554662ooo.26.2020.10.13.05.38.26
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 05:38:27 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id e20so18429463otj.11
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 05:38:26 -0700 (PDT)
X-Received: by 2002:a9d:242:: with SMTP id 60mr9713952otb.141.1602592706203;
 Tue, 13 Oct 2020 05:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201012053557.4102148-1-acourbot@chromium.org>
 <20201012053557.4102148-3-acourbot@chromium.org>
 <20201012094307.1f32155b@coco.lan>
In-Reply-To: <20201012094307.1f32155b@coco.lan>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 13 Oct 2020 21:38:14 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWTnCbKAWPYGBt-xS71Evj1kP14bfv8jThtsc0yzA+obw@mail.gmail.com>
Message-ID: <CAPBb6MWTnCbKAWPYGBt-xS71Evj1kP14bfv8jThtsc0yzA+obw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: mtk-vcodec: fix build breakage when one of
 VPU or SCP is enabled
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_083835_931101_3049B820 
X-CRM114-Status: GOOD (  34.00  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Alexandre Courbot <gnurou@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mauro,

On Mon, Oct 12, 2020 at 4:43 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Mon, 12 Oct 2020 14:35:57 +0900
> Alexandre Courbot <acourbot@chromium.org> escreveu:
>
> > The addition of MT8183 support added a dependency on the SCP remoteproc
> > module. However the initial patch used the "select" Kconfig directive,
> > which may result in the SCP module to not be compiled if remoteproc was
> > disabled. In such a case, mtk-vcodec would try to link against
> > non-existent SCP symbols. "select" was clearly misused here as explained
> > in kconfig-language.txt.
> >
> > Replace this by a "depends" directive on at least one of the VPU and
> > SCP modules, to allow the driver to be compiled as long as one of these
> > is enabled, and adapt the code to support this new scenario.
> >
> > Also adapt the Kconfig text to explain the extra requirements for MT8173
> > and MT8183.
> >
> > Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/platform/Kconfig                | 22 +++++++++++++++----
> >  drivers/media/platform/mtk-vcodec/Makefile    | 10 +++++++--
> >  .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  | 18 +++++++++++++++
> >  3 files changed, 44 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index a3cb104956d5..457b6c39ddc0 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -253,18 +253,32 @@ config VIDEO_MEDIATEK_VCODEC
> >       depends on MTK_IOMMU || COMPILE_TEST
> >       depends on VIDEO_DEV && VIDEO_V4L2
> >       depends on ARCH_MEDIATEK || COMPILE_TEST
> > +     depends on VIDEO_MEDIATEK_VPU || MTK_SCP
> > +     # The two following lines ensure we have the same state ("m" or "y") as
> > +     # our dependencies, to avoid missing symbols during link.
> > +     depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
> > +     depends on MTK_SCP || !MTK_SCP
> >       select VIDEOBUF2_DMA_CONTIG
> >       select V4L2_MEM2MEM_DEV
> > -     select VIDEO_MEDIATEK_VPU
> > -     select MTK_SCP
> > +     select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> > +     select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
> >       help
> >           Mediatek video codec driver provides HW capability to
> > -         encode and decode in a range of video formats
> > -         This driver rely on VPU driver to communicate with VPU.
> > +         encode and decode in a range of video formats on MT8173
> > +         and MT8183.
> > +
> > +         Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
> > +         also be selected. Support for MT8183 depends on MTK_SCP.
> >
> >           To compile this driver as modules, choose M here: the
> >           modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
>
> Just my 2 cents here, and to complement my last e-mail, the helper message
> here IMO is a lot more confusing than if you do this, instead:
>
>         config VIDEO_MEDIATEK_CODEC
>                  depends on VIDEO_MEDIATEK_VPU_SCP || VIDEO_MEDIATEK_VPU
>                  default y
>
>         config VIDEO_MEDIATEK_VPU
>             depends on VIDEO_DEV && VIDEO_V4L2
>             depends on ARCH_MEDIATEK || COMPILE_TEST
>             tristate "Enable Mediatek Video Processor Unit for MT8173"
>             help
>                 Select this option to enable Mediatek VPU on MT8173.
>
>         config VIDEO_MEDIATEK_VPU_SCP
>             depends on VIDEO_DEV && VIDEO_V4L2
>             depends on ARCH_MEDIATEK || COMPILE_TEST
>             tristate "Enable Mediatek Video Processor Unit for MT8183"
>             help
>                 Select this option to enable Mediatek VPU on MT8183.
>
> To be clear, from my side, I can live with either one of the alternatives,
> but, IMHO, the above is a lot clearer for anyone wanting to use
> VPU, as, if MTK_SCP is disabled, the MT8183 Kconfig prompt will
> disappear.

So I have experimented a bit and it turns out that even after adding
these new entries and using the "default" option that you suggested,
one still needs to perform the

    depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
    depends on MTK_SCP || !MTK_SCP

magic to prevent the VCODEC module from being built-in while having
the SCP and/or VPU support as modules (which would trigger the same
link error as before).

Also from experiment, the additional menu entries for SCP and VPU
won't bring any improvement in visibility since e.g. we cannot make
VIDEO_MEDIATEK_VPU_SCP visible unless MTK_SCP (the remoteproc option)
is also enabled. And this would leave us with the possibility of
having MTK_SCP enabled while leaving VIDEO_MEDIATEK_VPU_SCP
unselected, which is not a configuration one would want in practice.

Maybe I am missing something again, but I cannot find a benefit over
the current way - I'm completely open to revisit this in the future,
maybe by restructuring the driver some more, but for now I suggest we
fix the build breakage quickly. :)

I will send a v4 with some minor fixes.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
