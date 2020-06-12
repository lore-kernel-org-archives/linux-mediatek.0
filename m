Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C659AC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 18:49:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F16F206DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 18:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sc/WJ/5B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m2KD82iv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F16F206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrolAGKRGrN9BsQzjibT7naUWN0G+RH4LEKKk0J0sOs=; b=sc/WJ/5Bw5Atgp
	WaCNraq8BrSBnKLgd2UKno1qYCep7LBkiKx+uPaQoqSYqVx6JPQ67artwJxGSnE7Nb9hHLYrYqmRI
	69AUvHMUo1GTqMI35zcbeRDoALBK8Ue2Ylbv3+KDWM+GNHTcQRKKmpD4By73RAR54REZIrkWmcSYo
	FX/CMpfJbToxrghSTx7CYxzg+/8S05+9uN02jnq3vLxWRphz7U0c9LfcgFumUpksNeommuWJmQB2Y
	TgT91rC+KNuTBS7DNA+3KV6tZRGduv/vOigd0mW3zDiRwuDZsMvYQrSVSNN3Lsq8mq9G04+PD3rPO
	KWct+NPJWbfa3N+iNSFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjok2-0003gF-MU; Fri, 12 Jun 2020 18:49:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjojt-0003Xf-CN
 for linux-mediatek@lists.infradead.org; Fri, 12 Jun 2020 18:49:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id w16so10538412ejj.5
 for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2020 11:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRDVrwu4nmGYq+4H/l+Rfcgr3AzgWNw91u+JyocBvfM=;
 b=m2KD82ivlXUUePVUWot71c6WcaxeJlCXcnih6WkWsEDIJ2gD3qUd/7EVIU4njM4fLA
 MTs+s5Qv/pTww8Rd4mWtfwyDe9R3f17Zg1HzZGaeKrK/Nmx6HPYjlQAKmNhms7lmkWiJ
 raCqRd6ECYIDOUN6A2CwJIAex+onNYl/jvZXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRDVrwu4nmGYq+4H/l+Rfcgr3AzgWNw91u+JyocBvfM=;
 b=bfGMdT3Vmz5CN/6iZEdj+uK6QtFw2MIwxtRS4hlbfsKdosswdYKaq5w63T+XUldcHe
 6vWpM+IdZWMeCzm01AcoMubO+gLh7OQb4t5/j3MOaq8aCb2tXNT8bbie2h4PiCKAM7bf
 mgpef1r2CTK9QqKIfaiYrkLkBY1MUtirRZwYyqE+V473FAz26W1n+owCyoZ3loBqqmO8
 XJKoyFBcQ9Py7OWa0guP1UhoYKno7JdJPeckcrIFQ/UNI+rC8FhWu1jXWUWA4gyV2M5j
 WtZDgcA15ouEEt3KmNTDsyRIAo/9UN6ASuLUP4P1XzwKE/2TLNo8yozfIdBhWspbLmbo
 Lw3Q==
X-Gm-Message-State: AOAM5320+gYVQMRppySSHG0e0lrollUMHVKQZTL9x3U8aA5Scr9NXbkp
 lImKo6JxsZbpQB9pcMVYWlKTsw1Lm+WRDw==
X-Google-Smtp-Source: ABdhPJwIrEca1rERnICbYQpiyL1VQPQWBwfS4TiBxyE4Bc9BG6ILKLIVT791Ry0SmHoqDaG26B5etA==
X-Received: by 2002:a17:906:fcae:: with SMTP id
 qw14mr15205656ejb.166.1591987755431; 
 Fri, 12 Jun 2020 11:49:15 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id b16sm3549452edu.89.2020.06.12.11.49.14
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2020 11:49:14 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id x6so10694527wrm.13
 for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2020 11:49:14 -0700 (PDT)
X-Received: by 2002:adf:9c12:: with SMTP id f18mr17605374wrc.105.1591987753743; 
 Fri, 12 Jun 2020 11:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-3-dongchun.zhu@mediatek.com>
 <20200521193204.GA14214@chromium.org>
 <1590209415.8804.431.camel@mhfsdcap03> <20200610183600.GI201868@chromium.org>
 <1591954266.8804.646.camel@mhfsdcap03>
In-Reply-To: <1591954266.8804.646.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 12 Jun 2020 20:49:01 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CboZ9aFhUyKPES_2oO_AKAOh3Pg8D+9YpfmzJ8v-yFHw@mail.gmail.com>
Message-ID: <CAAFQd5CboZ9aFhUyKPES_2oO_AKAOh3Pg8D+9YpfmzJ8v-yFHw@mail.gmail.com>
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_114917_421030_033867C1 
X-CRM114-Status: GOOD (  23.50  )
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

On Fri, Jun 12, 2020 at 11:33 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Wed, 2020-06-10 at 18:36 +0000, Tomasz Figa wrote:
> > On Sat, May 23, 2020 at 12:50:15PM +0800, Dongchun Zhu wrote:
> > > Hi Tomasz,
> > >
> > > Thanks for the review. My replies are as below.
> > >
> > > On Thu, 2020-05-21 at 19:32 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Sat, May 09, 2020 at 04:06:27PM +0800, Dongchun Zhu wrote:
> > [snip]
> > > > > +{
> > > > > +       struct i2c_client *client = to_i2c_client(dev);
> > > > > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > +       struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > > +       int ret;
> > > > > +
> > > > > +       gpiod_set_value_cansleep(ov02a10->n_rst_gpio, 0);
> > > > > +       gpiod_set_value_cansleep(ov02a10->pd_gpio, 0);
> > > > > +
> > > > > +       ret = clk_prepare_enable(ov02a10->eclk);
> > > > > +       if (ret < 0) {
> > > > > +               dev_err(dev, "failed to enable eclk\n");
> > > > > +               return ret;
> > > > > +       }
> > > > > +
> > > > > +       ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > > +       if (ret < 0) {
> > > > > +               dev_err(dev, "failed to enable regulators\n");
> > > > > +               goto disable_clk;
> > > > > +       }
> > > > > +       usleep_range(5000, 6000);
> > > > > +
> > > > > +       gpiod_set_value_cansleep(ov02a10->pd_gpio, 1);
> > > >
> > > > This is a "powerdown" GPIO. It must be set to 0 if the sensor is to be
> > > > powered on.
> > > >
> > >
> > > The value set by gpiod_set_value_cansleep() API actually depends upon
> > > GPIO polarity defined in DT.
> > > Since I set GPIO_ACTIVE_LOW to powerdown,
> > > gpiod_set_value_cansleep(gpio_desc, value) would set !value to
> > > gpio_desc.
> > > Thus here powerdown would be low-state when sensor is powered on.
> > > For GPIO polarity, I also post a comment to the binding patch.
> > >
> >
> > That's true. However, this makes the driver really confusing. If someone
> > reads this code and compares with the datasheet, it looks incorrect,
> > because in the datasheet the powerdown GPIO needs to be configured low
> > for the sensor to operate.
> >
> > I'd recommend defining the binding in a way that makes it clear in the driver code
> > that it implementes the power sequencing as per the datasheet.
> >
>
> Uh-huh...
> But it all depends on how we look at the powerdown GPIO.
> Or where should we define the active low or active high, the driver or
> DT?
>
> My initial idea is using DT GPIO polarity to describe sensor active
> polarity according to the datasheet.
> As an active low shutdown signal is equivalent to an active high enable
> signal.
>

Okay, I discussed this offline with Laurent and Sakari and we also
found the guidelines of the Linux GPIO subsystem on this [1].

The conclusion is that the pin names in the driver or DT must not
contain any negation prefixes and the driver needs to care only about
the logical function of the pin, such as "powerdown" or "reset". In
case of this driver, we should call the pins "rst" and "pd" and
setting them to 1 would trigger the reset and power down respectively.
The physical signal polarity must be configured in DT using the
polarity flags.

[1] https://www.kernel.org/doc/html/latest/driver-api/gpio/consumer.html#the-active-low-and-open-drain-semantics

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
