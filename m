Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA817C47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 18:21:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B354820752
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 18:21:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e9FElvaV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hIfm5XW0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B354820752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEHJ0ZVw6PNUvYmqYJh3Q8o8fQP4warozOLX5C67vFk=; b=e9FElvaVkizMoX
	OaRh03VQC3sf59OpzAbrrw7yQWAqUWR6BFVU7iOyljKf4D1g4z5RzOpLc5wJb2yQuFrqqZ3mGHa0D
	Xscfu8ZxWHiXKD2U9fs6C/jHHWK3BNnA7lVLvdmCqPUX6JjI4L48krzNUeRmDBiv17XBm8YSJWsQK
	F4Fw3DxsmxisJGJY13jg9zuYtqrRxu6VEZXw0bO1Ee5Ys86AWcg3MUxFk+DUT59ebT01OQHuSylZa
	BOk/+COTlS6+JNrPoEWMl4gDIqmqDT8UpWdiMllPVLrRuWhyHf+FFgzJ+fFGZFn819QHElcH7x/vh
	y/yUyLbYv8+qH5jLnBKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYD3J-0003Nr-Om; Mon, 11 May 2020 18:21:21 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYD3G-0003N3-0w
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 18:21:19 +0000
Received: by mail-ed1-x542.google.com with SMTP id s10so8823140edy.9
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 11:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OlqMdCMv0t/jRFbvfx2oiVLxVGugmb8g6QsmrVI+x40=;
 b=hIfm5XW0NJEV60vNfF8m9alVsS2fZRz6bIMQxJc9+l0ft7pd3yuzq7Ggag4EvcoDjF
 uivi1BEPMuakJuVa1qTd6SM7jnMbr/A1mNEALhgep3z68K+eiXFsIbgL+g1SubhgV8LU
 jm7+kTa2GUdeE/H112fn0XfelirZ8uoNHW36A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OlqMdCMv0t/jRFbvfx2oiVLxVGugmb8g6QsmrVI+x40=;
 b=q1cJVNCGvKWYnRuNn1zrZk5xvZQ6e4uWZLC/1xXSyr3GKysmdhXNN+Gmku98xPKPQ5
 1WWBG9Pf4sjsADwy+2bBBfBR1p8rdcxy0JePiHMP1kXctVoMSskl+jEFnawsijDv5cq6
 rt5nydG82HCrl/8ArS+Hb/FVdaD7OgUAy9/Qw+ONfCqcSPHMB+p0l1MkILebK4qcAcOh
 US/8MdccEbXgm0jCzn59mZKXkstZQZzyeN3rVe8ZOT03MN/OyToq4Xu28y4A+07mVZlz
 xg6xcEKLjG2Z0aXdnVRhYRl2XdXKVc0KP6P5GlHRcXrdIarT+1cP8oOdWh+KYADFT6QQ
 iXaw==
X-Gm-Message-State: AGi0PuakLdAAA2FzbuBxKjGXM1F3donOX7V+dllskkwPDOKUwz9+rW86
 vdLvPIAU2WFTci0LzKJYXMbwXacsYl6oIw==
X-Google-Smtp-Source: APiQypLHD0FQkG4SGQ6+xQlZC00m1/Ve7BqL7ZFyABQWk2Baev4ConY2ICJxf64SuG41mc2Z5grHew==
X-Received: by 2002:aa7:d2d0:: with SMTP id k16mr15136762edr.354.1589221274742; 
 Mon, 11 May 2020 11:21:14 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id cf6sm1311781edb.18.2020.05.11.11.21.13
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 11:21:13 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id l18so12182370wrn.6
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 11:21:13 -0700 (PDT)
X-Received: by 2002:adf:e543:: with SMTP id z3mr18352165wrm.385.1589221272587; 
 Mon, 11 May 2020 11:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
 <20200502161727.30463-3-dongchun.zhu@mediatek.com>
 <20200506151352.GZ9190@paasikivi.fi.intel.com>
 <1588855524.8804.168.camel@mhfsdcap03>
 <20200507131220.GC9190@paasikivi.fi.intel.com>
 <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
 <1588907288.8804.188.camel@mhfsdcap03>
 <20200508211319.GJ9190@paasikivi.fi.intel.com>
 <1588991026.8804.235.camel@mhfsdcap03>
In-Reply-To: <1588991026.8804.235.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 11 May 2020 20:20:59 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DZBEUJUq65WT7i_QjAtgxjhxmfdsjQoyG2UZy8zBih+A@mail.gmail.com>
Message-ID: <CAAFQd5DZBEUJUq65WT7i_QjAtgxjhxmfdsjQoyG2UZy8zBih+A@mail.gmail.com>
Subject: Re: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_112118_089534_F853CA7C 
X-CRM114-Status: GOOD (  34.17  )
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
 Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dongchun,

On Sat, May 9, 2020 at 4:25 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Sakari,
>
> On Sat, 2020-05-09 at 00:13 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> >
> > On Fri, May 08, 2020 at 11:08:08AM +0800, Dongchun Zhu wrote:
> > > Hi Sakari, Tomasz,
> > >
> > > Thanks for the review.
> > >
> > > On Thu, 2020-05-07 at 15:46 +0200, Tomasz Figa wrote:
> > > > Hi Sakari, Dongchun,
> > > >
> > > > On Thu, May 7, 2020 at 3:12 PM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > HI Dongchun,
> > > > >
> > > > > On Thu, May 07, 2020 at 08:45:24PM +0800, Dongchun Zhu wrote:
> > > > > > Hi Sakari,
> > > > > >
> > > > > > Thanks for the review.
> > > > > >
> > > > > > On Wed, 2020-05-06 at 18:13 +0300, Sakari Ailus wrote:
> > > > > > > Hi Dongchun,
> > > > > > >
> > > > > > > On Sun, May 03, 2020 at 12:17:27AM +0800, Dongchun Zhu wrote:
> > > > > > > > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > > > > > > > control to set the desired focus via IIC serial interface.
> > > > > > > >
> > > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > ---
> > > > > > > >  MAINTAINERS                |   1 +
> > > > > > > >  drivers/media/i2c/Kconfig  |  11 ++
> > > > > > > >  drivers/media/i2c/Makefile |   1 +
> > > > > > > >  drivers/media/i2c/dw9768.c | 440 +++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > >  4 files changed, 453 insertions(+)
> > > > > > > >  create mode 100644 drivers/media/i2c/dw9768.c
> > > > > > > >
> > > > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > > > index 8d72c41..c92dc99 100644
> > > > > > > > --- a/MAINTAINERS
> > > > > > > > +++ b/MAINTAINERS
> > > > > > > > @@ -5157,6 +5157,7 @@ L:  linux-media@vger.kernel.org
> > > > > > > >  S:       Maintained
> > > > > > > >  T:       git git://linuxtv.org/media_tree.git
> > > > > > > >  F:       Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > > > > > > +F:       drivers/media/i2c/dw9768.c
> > > > > > > >
> > > > > > > >  DONGWOON DW9807 LENS VOICE COIL DRIVER
> > > > > > > >  M:       Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > > > index 125d596..6a3f9da 100644
> > > > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > > > @@ -1040,6 +1040,17 @@ config VIDEO_DW9714
> > > > > > > >     capability. This is designed for linear control of
> > > > > > > >     voice coil motors, controlled via I2C serial interface.
> > > > > > > >
> > > > > > > > +config VIDEO_DW9768
> > > > > > > > + tristate "DW9768 lens voice coil support"
> > > > > > > > + depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > > > > + depends on VIDEO_V4L2_SUBDEV_API
> > > > > > >
> > > > > > > Please check how this works in the media tree master branch now --- it's
> > > > > > > largely select based.
> > > > > > >
> > > > > >
> > > > > > The actuator driver uses some structures that require the
> > > > > > VIDEO_V4L2_SUBDEV_API code, so here we add VIDEO_V4L2_SUBDEV_API
> > > > > > dependency to avoid possible build error when it's not enabled.
> > > > >
> > > > > Please make sure this works with current media tree master. Right now it
> > > > > does not.
> > > > >
> > > >
> > > > Dongchun, as Sakari said, please make sure to base the patches on the
> > > > master branch of the media tree.
> > > > (https://git.linuxtv.org/media_tree.git/). The approach for Kconfig
> > > > dependency selection there seems to have changed recently.
> > > >
> > >
> > > I searched the patches on the media tree master branch.
> > > It seems that we need to remove the VIDEO_V4L2_SUBDEV_API dependency in
> > > Kconfig, and add #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API to include
> > > v4l2-subdev code.
> > > The change mainly is to make build pass, and don't return ENOTTY if
> > > SUBDEV_API is not set.
> > > Am I right?
> >
> > Please see Kconfig entries for other similar drivers from Dongwoon.
> >
>
> Sorry for the mistake :-)
> Just found the current media tree master branch code...
> I would update Kconfig entries in next release by referring to:
> https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/Kconfig

Sorry for last minute comments again. We had a short discussion
offline with Sakari and we think there are some changes needed to this
driver, namely:

1) The hardware being driven in our case is a gt9769, which could be
compatible with dw9768, but it's still a different implementation and
could have slightly different characteristics. Thus we think the
driver name and compatible strings should be renamed from
dongwoon,dw9768 to giantec,gt9769. In the future, if there is a device
with exactly a dw9768 chip, the same driver could be reused by adding
a dongwoon,dw9768 compatible string.

2) The chip has some default configuration, which is lost because the
driver overrides it with its own values. For use cases where one would
want to keep the default values, we should make it possible to prevent
the driver from overriding them. We could achieve this by adding
optional DT properties for the custom parameters and if they are not
present, defaults would be used.

Do you think that is doable? Thanks!

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
