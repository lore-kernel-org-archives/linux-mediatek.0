Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8089BC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 18:12:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55859206C3
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 18:12:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YPgZE1Ve";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gHkkvF2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55859206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgvakuctji570nNv3H6GUHsAwSI1G13O6cQdNJBOgmE=; b=YPgZE1VeiUGk0k
	HnjDG5h0TQEvIzfKYz00noHCGwpILURgxr+gLSYg2Xo5GtBT46Wix6RJlN3sQiM6qFKddtQ4+ekjJ
	uooWYQ8PUZ0brDSl6ktJ42mkICxKOjkT59XI52zWdWFK6biUQd9tCcC7RzybDzkt77OcK8XvlwnB9
	TPKxIR60brchq7uCQw2k8qGVZjfY/Fze467B3ZMeWYNU9Fh0Pjt77aUhCO2C+Ycj3nHXd5pY6gL3X
	P+vV5RDH3K+OOWa4bQEk1kplYgXemreOzMHyTJ2v0s/3hKquvM43E3Ac4WsPFCgUAIRru3N9QrxQU
	3Z2LfUWICU0LNxpCgFyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jguLb-0006Eg-9Y; Thu, 04 Jun 2020 18:12:11 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jguLX-0006EG-LO
 for linux-mediatek@lists.infradead.org; Thu, 04 Jun 2020 18:12:09 +0000
Received: by mail-ej1-x643.google.com with SMTP id a25so7118070ejg.5
 for <linux-mediatek@lists.infradead.org>; Thu, 04 Jun 2020 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FVt4H2yJ2NEAvsqMMNhI8/4Z4reOLSjdXLr6zFeQjOo=;
 b=gHkkvF2Ls2Ykk1yTr71P6IFnOK5wzAA+kSKFqFb4R4lfvDH7KitjNRVjKqk672AWqM
 7ifsRpTktuzU+6E+T9pfzJmBw7thRo6AU4oT0uRBM+nZ2bte47hX06IbNqM39Lt7KOXs
 5Sfn4IipqWB89UzZQmrYBZi58fry+Anr516Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FVt4H2yJ2NEAvsqMMNhI8/4Z4reOLSjdXLr6zFeQjOo=;
 b=MXtBrji2PufcYRcBCPljtd6kb5LR5sYN2OirJLIqc4y/v/Y2mqVGxd6vdsqt9l7UCg
 v3pT1uUVGqgO3q4Im+N6lWZJ54qbNswcXvY6fvsFhbB0XwLlENPjAravRt47JU9yMHr2
 YAMtVSZaMj6+f5yokoJizCR7ufCa/as1oPyr7fX+En/hD9Pt0k0sr9zhpj/zao5Ph20Y
 lCQuT2ExG7EhzOsq0FnP23wz+me6GzsIsgCid4RDQN9mX4oohqcTe9e5sA8aOIjeFqj6
 yGZNBvWiZEIoRZpitdKjGdsKRt8tBXMOacEi5gO9CUyZ9veta7ycWYcLdnziDVcaBJSx
 hJBw==
X-Gm-Message-State: AOAM530IP6LaQNlJdvVkKTrzFE1spwVS2ZhrvjJ6WorA0gdUxKLlY3wl
 3OVCtv9OpMhv01ErVqvF+cXXUYuS3C5Frw==
X-Google-Smtp-Source: ABdhPJxp8ZTk9UxBxS9QXlyDUvRGB28KcP4NpmMj5X+K1JG55u/iCur8ycxLvO0fy2m2OV0QnD/yLg==
X-Received: by 2002:a17:906:4ec1:: with SMTP id
 i1mr2605592ejv.152.1591294325701; 
 Thu, 04 Jun 2020 11:12:05 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51])
 by smtp.gmail.com with ESMTPSA id w3sm2691908ejn.87.2020.06.04.11.12.05
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 11:12:05 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id g1so5505196edv.6
 for <linux-mediatek@lists.infradead.org>; Thu, 04 Jun 2020 11:12:05 -0700 (PDT)
X-Received: by 2002:a5d:6750:: with SMTP id l16mr5541154wrw.295.1591293925420; 
 Thu, 04 Jun 2020 11:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com>
 <1591236845.8804.547.camel@mhfsdcap03>
 <20200604092616.GJ16711@paasikivi.fi.intel.com>
In-Reply-To: <20200604092616.GJ16711@paasikivi.fi.intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 4 Jun 2020 20:05:12 +0200
X-Gmail-Original-Message-ID: <CAAFQd5C9fh4Gth+pji0Yp6zh2sVjZukeY6yi+Qb-oCqU465hWg@mail.gmail.com>
Message-ID: <CAAFQd5C9fh4Gth+pji0Yp6zh2sVjZukeY6yi+Qb-oCqU465hWg@mail.gmail.com>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_111207_720110_5D903A2E 
X-CRM114-Status: GOOD (  23.98  )
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

On Thu, Jun 4, 2020 at 11:26 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dongchun,
>
> On Thu, Jun 04, 2020 at 10:14:05AM +0800, Dongchun Zhu wrote:
> > Hi Tomasz, Sakari, and sirs,
> >
> > Could anyone help to review this patch?
> >
> > On Sat, 2020-05-23 at 16:41 +0800, Dongchun Zhu wrote:
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
> > [snip]
> >
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
> > > +   ov02a10->n_rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > +   if (IS_ERR(ov02a10->n_rst_gpio)) {
> > > +           ret = PTR_ERR(ov02a10->n_rst_gpio);
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
> > > +                   goto err_free_handler;
> > > +           }
> > > +   }
> > > +
> > > +   ret = v4l2_async_register_subdev(&ov02a10->subdev);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > > +           if (!pm_runtime_enabled(dev))
> > > +                   ov02a10_power_off(dev);
>
> This should be moved to error handling section below.
>
> > > +           goto err_clean_entity;
> > > +   }
> >
> > Tomasz, Sakari, is this ok?
> > or coding like this:
> >
> > ret = v4l2_async_register_subdev(&ov02a10->subdev);
> > if (!pm_runtime_enabled(dev))
> >       ov02a10_power_off(dev);
> > if (ret) {
> >       dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> >       goto err_clean_entity;
> > }
> >
> > What's your opinions about the change?
>
> This turns power off if runtime PM is disabled. I'd keep it as-is, as it'd
> require re-implementing what runtime PM is used for now --- and that's not
> a sensor driver's job.

That and in general I believe the expectations are:

- runtime PM enabled - powered on only when it has something to do
- runtime PM disabled - powered on when the driver is bound (probe
succeeded), powered off when the driver unbinds (remove or probe
error)

Best regards,
Tomasz

>
> >
> > > +
> > > +   return 0;
> > > +
> > > +err_clean_entity:
> > > +   media_entity_cleanup(&ov02a10->subdev.entity);
> > > +err_free_handler:
> > > +   v4l2_ctrl_handler_free(ov02a10->subdev.ctrl_handler);
> > > +err_destroy_mutex:
> > > +   mutex_destroy(&ov02a10->mutex);
> > > +
> > > +   return ret;
> > > +}
> > > +
> > > +static int ov02a10_remove(struct i2c_client *client)
> > > +{
> > > +   struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +   struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +
> > > +   v4l2_async_unregister_subdev(sd);
> > > +   media_entity_cleanup(&sd->entity);
> > > +   v4l2_ctrl_handler_free(sd->ctrl_handler);
> > > +   pm_runtime_disable(&client->dev);
> > > +   if (!pm_runtime_status_suspended(&client->dev))
> > > +           ov02a10_power_off(&client->dev);
> > > +   pm_runtime_set_suspended(&client->dev);
> > > +   mutex_destroy(&ov02a10->mutex);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static const struct of_device_id ov02a10_of_match[] = {
> > > +   { .compatible = "ovti,ov02a10" },
> > > +   {}
> > > +};
> > > +MODULE_DEVICE_TABLE(of, ov02a10_of_match);
> > > +
> > > +static struct i2c_driver ov02a10_i2c_driver = {
> > > +   .driver = {
> > > +           .name = "ov02a10",
> > > +           .pm = &ov02a10_pm_ops,
> > > +           .of_match_table = ov02a10_of_match,
> > > +   },
> > > +   .probe_new      = &ov02a10_probe,
> > > +   .remove         = &ov02a10_remove,
> > > +};
> > > +
> > > +module_i2c_driver(ov02a10_i2c_driver);
> > > +
> > > +MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
> > > +MODULE_DESCRIPTION("OmniVision OV02A10 sensor driver");
> > > +MODULE_LICENSE("GPL v2");
> > > +
> >
>
> --
> Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
