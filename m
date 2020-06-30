Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B969CC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 14:22:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8755920672
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 14:22:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FuhBNWTr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QTId9nlU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8755920672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nga9HkM62NLMl/x/PHWQGHMxHmUfxq22B+bmxCqXOBk=; b=FuhBNWTrEUe6Ubfv8iZeN5a15
	BbohxgjeVZ037Gqxl3Kk07Fp4lPM7bg4UNcRZKwsKVJDKA5xQgzAyqSHG478sSpzV/SMko/kRgRpE
	mi3e7JK38sTSFu86VhaBDfDlIxdgvXe1BOXsjpEhDMRzdYl5C9dGA8cjBmLS6/HHiasTSFBEtsFvv
	LW5HGBm9laqD0ZtXFMtCe+esMvPyKQeNnsxMux33bpDJdvr6sTjglR3Uwc3PYEYDsgtwqdJI6VUYd
	rIim5z5rV2jR/qH7kwiK9ItFefNkB/vofTbMQrweMn+siVYQj/qwsP3ztEadotdO6dOYX/2pzRvSr
	G9iyL5Kqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqH96-0002XS-9u; Tue, 30 Jun 2020 14:22:00 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqH91-0002Tw-A3
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 14:21:56 +0000
Received: by mail-ej1-x641.google.com with SMTP id dp18so20840861ejc.8
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2020 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+T79FWShEgqDoWQukYRvbRwI/5OamJjXMslVeXNvho4=;
 b=QTId9nlUZpTlkVeCnLOUUePHL6SB1+TN7LSQn/ukx86gPS640sWt3RIdy3jLEPubbE
 u3wJFycz/XY04Kn0jdOAzisTFoRDXiLaNgGABqcFrGAZIY24B0uKLjbNBT+HEc4sVYjf
 0FUNkOGtEBpKJm7JeCvDjZM+HNTq5JOrKGtFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+T79FWShEgqDoWQukYRvbRwI/5OamJjXMslVeXNvho4=;
 b=n/WGzE7ojGBvGrw6j3ak3XWGRVMvd+TYdMVNhM3J4JrabJrxwEY9MVlTJuazjZqvkk
 t5dX+UMkDd7RJHm+Hy/WZ8Kh7U9qX9DDc41+RqsFELptDjD7nr21xgaoI3krHOjFjaJ7
 3cjLemQQpSR6lZ9ALEgLF0D92+S9nb889gwbwE5uNOF9UJ/tZxqj53e1YKiEq8gTGwHF
 w0JeIOv6vyjZQMRQOzzSxuKaFvzyLvOKKWLPvStf+Rvtq2QvatrQ1A3EJYqSTmqeFAx9
 bzoo3XwN795dgPomIScDP04JwvTWHYFOCCHwywR7FJD5QcyiayYcADs49CrlU/GE4U8T
 tj4w==
X-Gm-Message-State: AOAM533gCY6DZFtXQVpiLAiQw0NnD8Goij0zas39JyKKEGA+4VOMfDc9
 Fh2Jt3QzW9EbeW9ttPMJ8KwnmzJAJGL9kg==
X-Google-Smtp-Source: ABdhPJzWyvFYKEo92vMRx1pGfl2VRyNIIFMxilfwEILsGLc3pxxVbAuqRFhCfo4MLZuj7J2gu3LXDw==
X-Received: by 2002:a17:906:5595:: with SMTP id
 y21mr18905625ejp.61.1593526903942; 
 Tue, 30 Jun 2020 07:21:43 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id be2sm2903368edb.92.2020.06.30.07.21.42
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 07:21:43 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id k6so20412337wrn.3
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2020 07:21:42 -0700 (PDT)
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr22043827wrn.295.1593526901957; 
 Tue, 30 Jun 2020 07:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
 <20200630095430.GF16711@paasikivi.fi.intel.com>
 <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
In-Reply-To: <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 30 Jun 2020 16:21:31 +0200
X-Gmail-Original-Message-ID: <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
Message-ID: <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
 Dongchun Zhu <dongchun.zhu@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 4:19 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Tue, Jun 30, 2020 at 11:54 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dongchun,
> >
> > Thanks for the update.
> >
> > On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   13 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1067 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 378c961..a6a2f8b 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12566,6 +12566,7 @@ L:    linux-media@vger.kernel.org
> > >  S:   Maintained
> > >  T:   git git://linuxtv.org/media_tree.git
> > >  F:   Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > +F:   drivers/media/i2c/ov02a10.c
> > >
> > >  OMNIVISION OV13858 SENSOR DRIVER
> > >  M:   Sakari Ailus <sakari.ailus@linux.intel.com>
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index da11036..65519cf 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -812,6 +812,19 @@ config VIDEO_IMX355
> > >         To compile this driver as a module, choose M here: the
> > >         module will be called imx355.
> > >
> > > +config VIDEO_OV02A10
> > > +     tristate "OmniVision OV02A10 sensor support"
> > > +     depends on I2C && VIDEO_V4L2
> > > +     select MEDIA_CONTROLLER
> > > +     select VIDEO_V4L2_SUBDEV_API
> > > +     select V4L2_FWNODE
> > > +     help
> > > +       This is a Video4Linux2 sensor driver for the OmniVision
> > > +       OV02A10 camera.
> > > +
> > > +       To compile this driver as a module, choose M here: the
> > > +       module will be called ov02a10.
> > > +
> > >  config VIDEO_OV2640
> > >       tristate "OmniVision OV2640 sensor support"
> > >       depends on VIDEO_V4L2 && I2C
> > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > index 993acab..384e676 100644
> > > --- a/drivers/media/i2c/Makefile
> > > +++ b/drivers/media/i2c/Makefile
> > > @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
> > >  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
> > >  obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
> > >  obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
> > > +obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
> > >  obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
> > >  obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
> > >  obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
> > > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > > new file mode 100644
> > > index 0000000..f7fd329
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/ov02a10.c
> >
> > ...
> >
> > > +     ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >
> >
> > Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
> > the sensor off the first time. Alternatively make reset signal high in
> > runtime suspend callback.
>
> We might want to keep the signals low when the regulators are powered
> down, to reduce the leakage.

Ah, I actually recall that the reset pin was physically active low, so
we would indeed better keep it at HIGH. Sorry for the noise.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
