Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0475EC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 10:34:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C05AE20874
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 10:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BNhSdSQX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lx3CXAeD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C05AE20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JN817M3jLjeIcGjziwAg5s3Pw2flsDHkdf7RdBho2Ao=; b=BNhSdSQXQKuruEVwH2p1RzKyb
	9PKBCFClt3IbDksZApprhSwy52UR8tRm68rVihpF62PziHNF+GochVjtB12Z01sh4kAATMOKm7iCS
	iXVwWcPgqepTqgcSCncniw+PwFNeAEIkecoAEKTbDgK+tl8sB4NtR6/EZOyiNmBmZ3mgZ0+sDJDQQ
	6uMxm1cocXJe2OT4iIYXttmt7AedDEbIdUzFYuqqQ9Lrh+uWlUgHZ9hNX4fYBb/qLVeMUSODQ2TH4
	Mt2Y1WOBdiWpEeM+E27tfTCZ0X/hqfJmiqV0Apzyj4WeP08KqlmjA4sAJN1Fb6k+pcDL94xp0/ZZC
	AJPae9k1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpr7I-0008KD-3L; Mon, 29 Jun 2020 10:34:24 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpr7F-0008Jt-S6
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 10:34:22 +0000
Received: by mail-ej1-x642.google.com with SMTP id ga4so15998093ejb.11
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dyroAN44J2OM/AhTWy0pxzrNp1szrmJqs4ojQ9k1drM=;
 b=Lx3CXAeD23+wZge0roPuQ06+3bFnks98aupHyP/952olcUbmZ2dGTSHxJzw5EIsGUz
 uvmG4nB45dVQbnkuBckzCSHvrW6zVQknmXJgYHoxX9RTQxR9W989Dk2c+DFBEIzUtvdl
 dZiHdHK9D7RHwsK8Co1GH/0nYKIPbjqHYwn5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dyroAN44J2OM/AhTWy0pxzrNp1szrmJqs4ojQ9k1drM=;
 b=U5t6b9wYso0XwnLcwaWcWKkMoRP5nwsrGf7C2DhKdmOL9/avMFA9wDlz3nuA2FD9k+
 H1+UeZYhtOhSwhZQoTaCDBzr6xuYZp+/fWUy0Ia3E4iXtBHuAbYx2F0RZ13idBmsLe5O
 p02UBKwip0VhAECQBcYgzj78BHsij4qiDT6+836HfyrytSO04t6ZApK2AruyYiSX3lRi
 L14fqrB1Sz+3Ce5+AYt7MKCtSHO17mLtBIpHEYuGZ/nZk+PttUH4ntLWLkYh0CZK1c1O
 HQ3lAaOxggBCK8W0EZNwTjY733XTtsxXweO7oeCcEAQoUIKd0OJnUkKFFHxbFgipZTFX
 F55Q==
X-Gm-Message-State: AOAM532pjTg96QrMDT6mbQb2HMd//ZcM9wweWKQt0jW9AQ9zWPvLdzJS
 V7nOF3vHPBiyBXG4Ewif9RliukIQ8GALVg==
X-Google-Smtp-Source: ABdhPJz+i6Gb2jo/3Sk/m066OdKrAHRX4Tgu7p9cybw115qPvPVucYV0R3SQbW7jp5lELXsT8Thp6A==
X-Received: by 2002:a17:906:4c42:: with SMTP id
 d2mr12610192ejw.345.1593426860689; 
 Mon, 29 Jun 2020 03:34:20 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46])
 by smtp.gmail.com with ESMTPSA id v11sm13989348eja.113.2020.06.29.03.34.20
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 03:34:20 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id q15so14874402wmj.2
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 03:34:20 -0700 (PDT)
X-Received: by 2002:a1c:4303:: with SMTP id q3mr16649103wma.134.1593426459341; 
 Mon, 29 Jun 2020 03:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-3-dongchun.zhu@mediatek.com>
 <20200618191026.GA73379@chromium.org>
 <1593417224.17166.10.camel@mhfsdcap03>
In-Reply-To: <1593417224.17166.10.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 29 Jun 2020 12:27:28 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DAbGDp=e-b2K89ydyK_bft5D2grpFfGDtX6hC__n-L-g@mail.gmail.com>
Message-ID: <CAAFQd5DAbGDp=e-b2K89ydyK_bft5D2grpFfGDtX6hC__n-L-g@mail.gmail.com>
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

On Mon, Jun 29, 2020 at 9:54 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Thu, 2020-06-18 at 19:10 +0000, Tomasz Figa wrote:
> > Hi Dongchun,
> >
> > On Mon, Jun 15, 2020 at 08:29:37PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   13 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/ov02a10.c | 1042 +++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1057 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > >
> >
> > Thank you for the patch. Please see my comments inline.
> >
>
> [snip]
>
> > > +static int ov02a10_probe(struct i2c_client *client)
> > > +{
> > > +   struct device *dev = &client->dev;
> > > +   struct ov02a10 *ov02a10;
> > > +   unsigned int rotation;
> > > +   unsigned int clock_lane_tx_speed;
> > > +   unsigned int i;
> > > +   int ret;
> > > +
> > > +   ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
> > > +   if (!ov02a10)
> > > +           return -ENOMEM;
> > > +
> > > +   ret = ov02a10_check_hwcfg(dev, ov02a10);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to check HW configuration: %d", ret);
> > > +           return ret;
> > > +   }
> > > +
> > > +   v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
> > > +   ov02a10->mipi_clock_tx_speed = OV02A10_MIPI_TX_SPEED_DEFAULT;
> > > +   ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > > +
> > > +   /* Optional indication of physical rotation of sensor */
> > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> > > +   if (!ret && rotation == 180) {
> > > +           ov02a10->upside_down = true;
> > > +           ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > > +   }
> > > +
> > > +   /* Optional indication of mipi TX speed */
> > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "ovti,mipi-tx-speed",
> > > +                                  &clock_lane_tx_speed);
> > > +
> > > +   if (!ret)
> > > +           ov02a10->mipi_clock_tx_speed = clock_lane_tx_speed;
> > > +
> > > +   /* Get system clock (eclk) */
> > > +   ov02a10->eclk = devm_clk_get(dev, "eclk");
> > > +   if (IS_ERR(ov02a10->eclk)) {
> > > +           ret = PTR_ERR(ov02a10->eclk);
> > > +           dev_err(dev, "failed to get eclk %d\n", ret);
> > > +           return ret;
> > > +   }
> > > +
> > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> > > +                                  &ov02a10->eclk_freq);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to get eclk frequency\n");
> > > +           return ret;
> > > +   }
> > > +
> > > +   ret = clk_set_rate(ov02a10->eclk, ov02a10->eclk_freq);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to set eclk frequency (24MHz)\n");
> > > +           return ret;
> > > +   }
> > > +
> > > +   if (clk_get_rate(ov02a10->eclk) != OV02A10_ECLK_FREQ) {
> > > +           dev_warn(dev, "wrong eclk frequency %d Hz, expected: %d Hz\n",
> > > +                    ov02a10->eclk_freq, OV02A10_ECLK_FREQ);
> > > +           return -EINVAL;
> > > +   }
> > > +
> > > +   ov02a10->pd_gpio = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> > > +   if (IS_ERR(ov02a10->pd_gpio)) {
> > > +           ret = PTR_ERR(ov02a10->pd_gpio);
> > > +           dev_err(dev, "failed to get powerdown-gpios %d\n", ret);
> > > +           return ret;
> > > +   }
> > > +
> > > +   ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > +   if (IS_ERR(ov02a10->rst_gpio)) {
> > > +           ret = PTR_ERR(ov02a10->rst_gpio);
> > > +           dev_err(dev, "failed to get reset-gpios %d\n", ret);
> > > +           return ret;
> > > +   }
> > > +
> > > +   for (i = 0; i < ARRAY_SIZE(ov02a10_supply_names); i++)
> > > +           ov02a10->supplies[i].supply = ov02a10_supply_names[i];
> > > +
> > > +   ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02a10_supply_names),
> > > +                                 ov02a10->supplies);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to get regulators\n");
> > > +           return ret;
> > > +   }
> > > +
> > > +   mutex_init(&ov02a10->mutex);
> > > +   ov02a10->cur_mode = &supported_modes[0];
> > > +   ret = ov02a10_initialize_controls(ov02a10);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to initialize controls\n");
> > > +           goto err_destroy_mutex;
> > > +   }
> > > +
> > > +   ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > +   ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
> > > +   ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > +   ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > +   ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
> > > +   if (ret < 0) {
> > > +           dev_err(dev, "failed to init entity pads: %d", ret);
> > > +           goto err_free_handler;
> > > +   }
> > > +
> > > +   pm_runtime_enable(dev);
> > > +   if (!pm_runtime_enabled(dev)) {
> > > +           ret = ov02a10_power_on(dev);
> > > +           if (ret < 0) {
> > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > +                   goto err_clean_entity;
> > > +           }
> > > +   }
> > > +
> > > +   ret = v4l2_async_register_subdev(&ov02a10->subdev);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > > +           goto err_power_off;
> > > +   }
> > > +
> > > +   return 0;
> > > +
> > > +err_power_off:
> > > +   pm_runtime_disable(dev);
> > > +   if (!pm_runtime_enabled(dev))
> >
> > This would be always true, resulting in unbalanced power off. Moving
> > pm_runtime_disable() after this if should work better.
> >
>
> Pardon, do you mean that we shall use like this:
> err_power_off:
>         if (!pm_runtime_enabled(dev)) {
>                 pm_runtime_disable(dev);
>                 if (!pm_runtime_status_suspended(dev)
>                         ov02a10_power_off(dev);
>         }

Hmm, that wouldn't really work, because there is no reason to disable
runtime PM if it's disabled already. I also noticed that we don't need
to check pm_runtime_status_suspended() in the error path in probe,
because we only ever attempt to power it on when runtime PM is
disabled in kernel config. This would make the end result as:

         if (pm_runtime_enabled(dev))
                 pm_runtime_disable(dev);
         else
                 ov02a10_power_off(dev);

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
