Return-Path: <SRS0=zMKO=7Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E02C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 09:58:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FDCE20656
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 09:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Na3YuK2v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ljWu6Ln7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FDCE20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7utVqacI5elutnZkJTyWXAJqEY7PRq7mIMh0w/cjEo=; b=Na3YuK2vN5R+3o
	2Wuf6b2DIUKjxs+PEDh9IRBBwsUWLmD9HXk55Q94rgFZqOOmg97+c+b1J7FrS8CVxp8a2UhywEJKe
	QdsgyloIyvJfkkuovgK8b05R+thX5FWUhj9DLdKIyLPa7CzzGpliwkkru8zq/nd1PQlO4t34jbyh6
	JLQuj0NyKmGXB7RGdxAFDeHH6/eAYk7xee78cfI4P0LQ47/jNmTTxrKiqzaeEbHCHmca2OpHXUWKo
	40KvIQe19RPNWqGNjs1RGhnZhNk2XbhFRAyBki203t3PzofvRZTVc2rwGQCyGxS3R3UGdiL70K6yM
	vlmxBmUJykuTLQPrV8jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjJyE-0005Pp-Jc; Thu, 11 Jun 2020 09:58:02 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjJyB-0005PO-Ou
 for linux-mediatek@lists.infradead.org; Thu, 11 Jun 2020 09:58:01 +0000
Received: by mail-ed1-x541.google.com with SMTP id t21so3480606edr.12
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2020 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sEeSSXzDo0aNfT8RCtgk710cFUXelBPKlbjMwXGCKwA=;
 b=ljWu6Ln7hmjbcBaRzZlHWsT0AjYarwzwjH9o3tH1WN6ZGm20b3T8IO8qH00SIhGaSU
 2FAGvqeoH1s9Mkt3AjDMPdJEdCN+ef7x2NyJi4pptkj2GqINEjaofwFp3hdrggRXxemL
 kK+WFn4bsOTCeP3MWFAGQgep+fdXOtmjey0EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sEeSSXzDo0aNfT8RCtgk710cFUXelBPKlbjMwXGCKwA=;
 b=GVn+X7aQ+VXfcr705TFjL1SJxICBi3U8DEWW3SQ0O5H95tDJBeRuisvNbK1Uor5esJ
 B37Di3N6WlnyMByX1bd8IcJ5kBwlCe4RLFuTM3cNt5eXGDI82dvMi6KAVY51eNiBO4G6
 Kn/TJGoNbGAaN0IOLewFFj5A1ynaSV6WUeT4utjuT19qnQxh/Rs3PXUqHLtFHNtXZG5m
 FOsI9/OLeBKVQy5QKDPBoxWi/UF4nU9VRR6v2gcyggbxfPV3gP06FsniEOdHMdAUPMtc
 eNUTmSNqg8JBJQdsR5g/jqMlyM4RO1WUbBieI1qIDJZcxNyJuDWTVeiO9swq4B2Ws3mV
 BWOg==
X-Gm-Message-State: AOAM5328NwQUDyp3s/JoaFc1OKbFRTVpm2HIeeHYpneW/LEawFLtmwgE
 QLjRde69DUMnfS6B38Jx9vELsHN0ncRPRA==
X-Google-Smtp-Source: ABdhPJxXeuYWO0dFGeKMeQkgJvAT44uKrCRrD4BcUTJZjau8L6SE8yAroWfAJ1HMv5A1HXB7sH3pjg==
X-Received: by 2002:a50:f28e:: with SMTP id f14mr6532829edm.100.1591869476788; 
 Thu, 11 Jun 2020 02:57:56 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id fi13sm1605896ejb.34.2020.06.11.02.57.55
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 02:57:55 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id x6so5448707wrm.13
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2020 02:57:55 -0700 (PDT)
X-Received: by 2002:adf:e2ce:: with SMTP id d14mr8780636wrj.415.1591869474948; 
 Thu, 11 Jun 2020 02:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com>
 <20200610194455.GK201868@chromium.org>
 <20200611095333.GK16711@paasikivi.fi.intel.com>
In-Reply-To: <20200611095333.GK16711@paasikivi.fi.intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 11 Jun 2020 11:57:43 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BBxBEs=gCohOzOGzkTDNkL1yyu7dtEY26K52=CmFAWnA@mail.gmail.com>
Message-ID: <CAAFQd5BBxBEs=gCohOzOGzkTDNkL1yyu7dtEY26K52=CmFAWnA@mail.gmail.com>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_025759_812036_1FB05202 
X-CRM114-Status: GOOD (  26.93  )
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

On Thu, Jun 11, 2020 at 11:53 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz,
>
> On Wed, Jun 10, 2020 at 07:44:55PM +0000, Tomasz Figa wrote:
> > Hi Dongchun,
> >
> > On Sat, May 23, 2020 at 04:41:03PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   13 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/ov02a10.c | 1025 +++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1040 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > >
> >
> > Thank you for the patch. Please see my comments inline.
> >
> > [snip]
> > > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > > new file mode 100644
> > > index 0000000..160a0b5
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/ov02a10.c
> > [snip]
> > > +static const char * const ov02a10_test_pattern_menu[] = {
> > > +   "Disabled",
> > > +   "Color Bar",
> >
> > nit: We should normalize this to one of the standard names. What is the
> > pattern on this sensor? Is it perhaps "Eight Vertical Colour Bars"?
> >
> > > +};
> > [snip]
> > > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > > +                      struct v4l2_subdev_pad_config *cfg,
> > > +                      struct v4l2_subdev_format *fmt)
> > > +{
> > > +   struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +   struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > +
> > > +   mutex_lock(&ov02a10->mutex);
> > > +
> >
> >
> > Don't we need to handle the case when fmt->which is V4L2_SUBDEV_FORMAT_TRY,
> > which is used for trying the format, but not applying it to the hardware?
>
> Yes.
>
> >
> > > +   if (ov02a10->streaming) {
> > > +           mutex_unlock(&ov02a10->mutex);
> > > +           return -EBUSY;
> > > +   }
> > > +
> > > +   /* Only one sensor mode supported */
> > > +   mbus_fmt->code = ov02a10->fmt.code;
> > > +   ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > +   ov02a10->fmt = fmt->format;
> > > +
> > > +   mutex_unlock(&ov02a10->mutex);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int ov02a10_get_fmt(struct v4l2_subdev *sd,
> > > +                      struct v4l2_subdev_pad_config *cfg,
> > > +                      struct v4l2_subdev_format *fmt)
> > > +{
> > > +   struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +   struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > +
> > > +   mutex_lock(&ov02a10->mutex);
> > > +
> > > +   fmt->format = ov02a10->fmt;
> >
> > Ditto.
> >
> > > +   mbus_fmt->code = ov02a10->fmt.code;
> > > +   ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > +
> > > +   mutex_unlock(&ov02a10->mutex);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
> > > +                             struct v4l2_subdev_pad_config *cfg,
> > > +                             struct v4l2_subdev_mbus_code_enum *code)
> > > +{
> > > +   struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +
> > > +   if (code->index >= ARRAY_SIZE(supported_modes))
> > > +           return -EINVAL;
> >
> > Hmm, supported_modes[] doesn't seem to hold the information about mbus
> > codes. Should this just perhaps be "!= 0"?
> >
> > > +
> > > +   code->code = ov02a10->fmt.code;
> > > +
> > > +   return 0;
> > > +}
> > [snip]
> > > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > > +                              struct v4l2_subdev_pad_config *cfg)
> > > +{
> > > +   struct v4l2_subdev_format fmt = {
> > > +           .which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,
> > > +           .format = {
> > > +                   .width = 1600,
> > > +                   .height = 1200,
> > > +           }
> > > +   };
> > > +
> > > +   ov02a10_set_fmt(sd, cfg, &fmt);
> > > +
> > > +   return 0;
> > > +}
> > > +
> >
> > I'm not familiar with this init_cfg operation and the documentation is very
> > sparse about it. Sakari, is this a correct implementation?
>
> The purpose is to initialise a pad configuration (format and selection
> rectangles) to the device defaults. As there seem to be no selection
> rectangles, this seems fine to me.

Thanks. I traced the code and could only see one place where the
callback is being called and that was with cfg != NULL. Still, the
code above uses "cfg ?" as a check to determine whether TRY or ACTIVE
should be passed to which. Is that also correct?

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
