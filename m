Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF43C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 12:53:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253F32076A
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 12:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k8grn3CB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FiCQlYLT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 253F32076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPiCptJsOib6/jtX+HhqZrrbBNWTOdoho5lvAVh14fA=; b=k8grn3CBqQaBBl
	PdxT+hKeDvpCzg5N4ekHTz++nmL4fvVmAciuDnp44Sv9TyR33+mI9G/OY5O/frG1lw3WNMcn0W/ha
	hZ9GAjTfojjAibtevZ70ItXcKFnQ1429oMrtu4B1DzaqB/rgof1kmAWzA3ntesLJ1JvuvRPAsCGQz
	bOxAkrG2XH70pf7AEDJ5dCc18LpXyWfClTvKubaUVRLDtYQA7LebB5/HsosKkSP/H8/QVFm/k+ZP1
	bgmYlsE0HNCb8sqV7bqjoI+ewjpOBjLqivOihbjPv5WorGFUkxg70A3PrkMujnf5iI259ZLqJAQZ4
	42ZX/eVPou9eWaiTE2NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkobz-0000Yg-3T; Mon, 15 Jun 2020 12:53:15 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkobv-0000XM-Td
 for linux-mediatek@lists.infradead.org; Mon, 15 Jun 2020 12:53:13 +0000
Received: by mail-ej1-x644.google.com with SMTP id l27so17342932ejc.1
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2020 05:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EAByj1ACF3eG5h2YQoy4Zv57kLAIJMEzK1yr/nWTV5c=;
 b=FiCQlYLTKWwhipqP9kqvJWv/A/Z+VNCbpv6u711mWSu7hINN75IBeaYV8OZikqRIEQ
 qS8wSh4Lo0ISen5u8EMoDK0Eplz1KkC3+tJaNOJKXYp2Xr39qDBp85rBkvC5EhiiCv72
 ZNgtiPOQgUSXebknUjgkXJbDKSR9U86BnGZkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EAByj1ACF3eG5h2YQoy4Zv57kLAIJMEzK1yr/nWTV5c=;
 b=FYV11GX/W7ZL8hBMMl9K/mmyUlzTXIlD3mPNXwPV8HL9UVtKX3n5brf5yr2hBajvfO
 XPtY+HRaevth+gyNJ81ooNvsGavGWXpEFfNm8C0POVMbiuwetDchdx3Zf+CNe4SuLBDR
 1PWp7b2K6xR5mRfkMB1dVergvJSqT1O3b3R78IRvbkHctPH0gh7CpOQw/YZhZ37uhZnD
 Nd25gVxV5orVWuqntOI8+AfHZNvue53QpMlrFNBID1xot9qBDBLJnga3JiTkNKxplPPY
 NtFVtdHqSgN/Cd0Wwts4bR5cnnmC7zbR57N9ONoDgEyVZqixilHnSRItVPmEPGNGFmzi
 bXFg==
X-Gm-Message-State: AOAM532I2lAZTG0WXMqT6PNuzogL8q3wez3YuCN+M5d8EiP+Vn18XHKJ
 B8+jp4AsSkZWOJ8ir8XFtNMs7golgz0Umw==
X-Google-Smtp-Source: ABdhPJyqOxt9OLP8TjQpPr+aNKijyhEGKBQWWWAq9APWU4L6ARWDY+UyjMmkm/3ZHfN92s/PjZabTw==
X-Received: by 2002:a17:906:4c81:: with SMTP id
 q1mr25856767eju.273.1592225588989; 
 Mon, 15 Jun 2020 05:53:08 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46])
 by smtp.gmail.com with ESMTPSA id z20sm8965669ejb.68.2020.06.15.05.53.08
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 05:53:08 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id f185so14710665wmf.3
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2020 05:53:08 -0700 (PDT)
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr13160873wmk.11.1592225097322; 
 Mon, 15 Jun 2020 05:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com>
 <20200610194455.GK201868@chromium.org>
 <1591958798.8804.660.camel@mhfsdcap03>
 <CAAFQd5Bcb4A+HAivA-jrczK+OMxwZk3w0GYoh-DU=6gmTZBWnQ@mail.gmail.com>
 <1592200471.8804.681.camel@mhfsdcap03>
In-Reply-To: <1592200471.8804.681.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 15 Jun 2020 14:44:46 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DvPcH-1jeeXaQ=qfxVHr82F8FBberF=QzLW4p49PZ2PA@mail.gmail.com>
Message-ID: <CAAFQd5DvPcH-1jeeXaQ=qfxVHr82F8FBberF=QzLW4p49PZ2PA@mail.gmail.com>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To: Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_055311_974132_926923F4 
X-CRM114-Status: GOOD (  26.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Cao Bing Bu <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dongchun,

On Mon, Jun 15, 2020 at 7:57 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2020-06-12 at 20:39 +0200, Tomasz Figa wrote:
> > On Fri, Jun 12, 2020 at 12:49 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Wed, 2020-06-10 at 19:44 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Sat, May 23, 2020 at 04:41:03PM +0800, Dongchun Zhu wrote:
> > > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  MAINTAINERS                 |    1 +
> > > > >  drivers/media/i2c/Kconfig   |   13 +
> > > > >  drivers/media/i2c/Makefile  |    1 +
> > > > >  drivers/media/i2c/ov02a10.c | 1025 +++++++++++++++++++++++++++++++++++++++++++
> > > > >  4 files changed, 1040 insertions(+)
> > > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > > >
> > > >
> > > > Thank you for the patch. Please see my comments inline.
> > > >
> > > > [snip]
> > > > > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > > > > new file mode 100644
> > > > > index 0000000..160a0b5
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/i2c/ov02a10.c
> > > > [snip]
> > > > > +static const char * const ov02a10_test_pattern_menu[] = {
> > > > > +   "Disabled",
> > > > > +   "Color Bar",
> > > >
> > > > nit: We should normalize this to one of the standard names. What is the
> > > > pattern on this sensor? Is it perhaps "Eight Vertical Colour Bars"?
> > > >
> > >
> > > Yes. It is one kind of 'Eight Vertical Colour Bars'.
> > > This pattern is called as 'MIPI color bar' per the datasheet.
> > > Can we here use 'Vertical Color Bar' or 'MIPI Color Bar'?
> > >
> >
> > We should try to stick to the names as exposed by existing drivers.
> > There was an attempt to unify the naming of some Sony sensors some
> > time ago [1]. Perhaps one of the names there matches the pattern of
> > this sensor?
> >
> > [1] https://patchwork.kernel.org/patch/10711777/
> >
>
> Sounds great.
> It is one good idea to summarize test patterns from various sensors.
> But one question plaguing me is that it seems even for the same "Eight
> Vertical Colour Bars", different sensors may have different RGB color
> map.
>
> Moreover, definition standards of color bar style may differ among
> different sensor chip vendors.
> For instance, Sony often uses "Solid Color", "Color Bars With Fade to
> Grey", "PN9" to abstract test pattern output type; while OmniVision
> adopts color bar type 1, 2, 3, 4 or "MIPI Color Bar", "ISP Color Bar"
> instead.

The test patterns are commonly very similar, just different vendors
call them with different names. There is actually a specification
called MIPI CCS [1], which standardizes many aspects of sensor
programming, including test patterns. Most of the sensors don't really
follow the entire specification yet, but often some aspects happen to
match.

In the copy of the specification that I have, the test patterns are
described in section 10 (Test modes), page 203, with pictures on
following pages. Perhaps we could standardize the names based on that,
when the pattern matches?

Sakari, what do you think?

[1] http://resources.mipi.org/camera-command-set-v1-1-download

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
