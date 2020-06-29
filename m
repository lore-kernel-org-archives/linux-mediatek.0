Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23083C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 10:30:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E304A20672
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 10:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aH+k1iTb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GryIZOgw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E304A20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ckQnnEGZK2TmjXtyFhkAYK7e5M4szS7YP+LeS6bR5AQ=; b=aH+k1iTbtY1uqwfKAnNvAFqBZ
	h3IWbaY+Mz2cu/jgE84BiZd8GHJlY1KVDNoAMaiY+QpnIPBqLzKUDuG458VwdHuxRs8CXUgF4WWfF
	xzQ6C/ftj8sjVyFlCqoi9TP/Ap4JjzsEj8xLoOzZsiGjdnWgAeCMEeHkQv+C4OrYDUTskikcp6rVq
	1XiuAtKIb35IWOEDoel4dAyg5ao4kfpfVnEhHQvn5rV4WxuRN93tPaUhQyxbo8OZRezLuTC2SvKAg
	Jl8oM2MUZJ7uDUpwiO3W3CMZIN8f3sv4WJtZJp52R1aYS/TFqda/UtI+MdtqO4mcJ4rwXaSJMYhl9
	Dp/U2RQGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpr36-0007kP-Ox; Mon, 29 Jun 2020 10:30:04 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpr34-0007jB-AM
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 10:30:03 +0000
Received: by mail-ej1-x641.google.com with SMTP id w6so16038885ejq.6
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 03:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PhguteWn+BNL2rOz+hmBG6LMc95B72qiCMa6M5a1mog=;
 b=GryIZOgwWXWQdlINYt+x/02V6RsfowLZwhA3TrXCr0kgs/XolUBKkiYBVjZIeZVq6U
 B0A+U5FpFXsT10NBtK+1s80jnmBYvKFrjgCI6zXkQLKW1c9oDO0LQ4FLIsfYd0rfHVAx
 jfAXF26rS6rgbwq+ioEFJHVIJaG2W8rmmHqW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PhguteWn+BNL2rOz+hmBG6LMc95B72qiCMa6M5a1mog=;
 b=qqEM3d1+4brVtCKuTOrr6JZlWE6+2xUxBL2nybff+Mpa1mBeKVoUE+/kv1nDrB3J5c
 RCCovgzvJl2aoPZg5qD861xXqhr0tUv75R1pHje4yuXmCXcgqioYBR/WnRabp936TQXD
 cH5ndUQKDe7Zyu/6cNNhI+fLTNZDkmGufxco9HnQYgu+trqJED8m/64/vmiBD9Qi7OV2
 O1Tq+niwCvlifwDMeR2cMiDU1vQROkP+SeS4NRTfV96yKQiBvaee75AigUDhkh69MTqs
 73NrLT+M03rmDMHcl+FvK7iZNb60YDGrA0zhpz+PJRTMx3zpsdOPJeMHtKA0IvbURcYL
 QMKw==
X-Gm-Message-State: AOAM533gYMwmtlCPnSkdFqj/TQ5S+PTkCBuyydJS6CVtepTbpAYy9zVr
 TF67EMz7YCdfEuCehloks8XVrP53EKSMYQ==
X-Google-Smtp-Source: ABdhPJzQDEjkV1ZKDv4KviJUCB4D/e01GBzKs5+q/cQ/lxXSI7e83OQ8ArS7y2F278fWpctOOzXYjw==
X-Received: by 2002:a17:906:f49:: with SMTP id
 h9mr13995060ejj.155.1593426600944; 
 Mon, 29 Jun 2020 03:30:00 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52])
 by smtp.gmail.com with ESMTPSA id o14sm13985292eja.121.2020.06.29.03.30.00
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 03:30:00 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id w16so16040142ejj.5
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 03:30:00 -0700 (PDT)
X-Received: by 2002:adf:80e6:: with SMTP id 93mr15866385wrl.17.1593426145911; 
 Mon, 29 Jun 2020 03:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-3-dongchun.zhu@mediatek.com>
 <20200618191026.GA73379@chromium.org>
 <1592639284.8804.712.camel@mhfsdcap03> <20200622152350.GB260716@chromium.org>
 <1593412218.17166.3.camel@mhfsdcap03>
In-Reply-To: <1593412218.17166.3.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 29 Jun 2020 12:22:14 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Bi+Dh85Wz5q4RMGQvKw3aHFWWgypKsNukg_MwF4_ceCw@mail.gmail.com>
Message-ID: <CAAFQd5Bi+Dh85Wz5q4RMGQvKw3aHFWWgypKsNukg_MwF4_ceCw@mail.gmail.com>
Subject: Re: [PATCH V10 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
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

On Mon, Jun 29, 2020 at 8:30 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> Thanks for the review.
>
> On Mon, 2020-06-22 at 15:23 +0000, Tomasz Figa wrote:
> > On Sat, Jun 20, 2020 at 03:48:04PM +0800, Dongchun Zhu wrote:
> > > Hi Tomasz,
> > >
> > > Thanks for the review.
> > >
> > > On Thu, 2020-06-18 at 19:10 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Mon, Jun 15, 2020 at 08:29:37PM +0800, Dongchun Zhu wrote:
> > > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  MAINTAINERS                 |    1 +
> > > > >  drivers/media/i2c/Kconfig   |   13 +
> > > > >  drivers/media/i2c/Makefile  |    1 +
> > > > >  drivers/media/i2c/ov02a10.c | 1042 +++++++++++++++++++++++++++++++++++++++++++
> > > > >  4 files changed, 1057 insertions(+)
> > > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > > >
> > > >
> > > > Thank you for the patch. Please see my comments inline.
> > > >
> > > > [snip]
> > > > > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > > > > +                          struct v4l2_subdev_pad_config *cfg,
> > > > > +                          struct v4l2_subdev_format *fmt)
> > > > > +{
> > > > > +       struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > > +       struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > > > +
> > > > > +       mutex_lock(&ov02a10->mutex);
> > > > > +
> > > > > +       if (ov02a10->streaming) {
> > > > > +               mutex_unlock(&ov02a10->mutex);
> > > > > +               return -EBUSY;
> > > > > +       }
> > > > > +
> > > > > +       /* Only one sensor mode supported */
> > > > > +       mbus_fmt->code = ov02a10->fmt.code;
> > > > > +       ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > > > +       ov02a10->fmt = fmt->format;
> > > > > +
> > > > > +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > > > > +               *v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> > > >
> > > > If fmt->which is V4L2_SUBDEV_FORMAT_TRY, the internal driver state must not
> > > > be affected. It also should not depend on whether the sensor is streaming
> > > > or not. Basically it should be considered a special "candidate" format,
> > > > which isn't programmed to the hardware, but just stored aside.
> > > >
> > >
> > > Hmm. Maybe we shall use FORMAT_TRY like this:
> > > struct v4l2_mbus_framefmt *frame_fmt;
> > > ...
> > > if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > >     frame_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
> > > else
> > >     frame_fmt = &ov02a10->fmt;
> > >
> > > *frame_fmt = *mbus_fmt;
> > >
> > > (Remove 'ov02a10->fmt = fmt->format;' above)
> > >
> >
> > Yes, I guess that should work. Also the ov02a10->streaming condition
> > shouldn't be checked if fmt->which is V4L2_SUBDEV_FORMAT_TRY).
> >
>
> Maybe we shall use more strict condition to check streaming state:
> 'if (ov02a10->streaming)' --> 'if (ov02a10->streaming && fmt->which ==
> V4L2_SUBDEV_FORMAT_ACTIVE)'

Yes, that should work.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
