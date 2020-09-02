Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33928C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 12:38:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6E4720767
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 12:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y9NVwpHs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OG9uscYY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6E4720767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SCCdJrCMVtupqAahNUXvtXfM5veMYpVaQb21kibSxec=; b=y9NVwpHsDPkB9dkA1dsaKjqVM
	vg2NZUIbUwjWTS/ifkAtPpNEV6wV6a7eLMZ0zwXuVY8yoK5kp8fXFSCFocvGI20TkxZzEsf1OjegA
	/NPmwRPBMKZVRlUHNXZFrUaz7EGOhVoc2eNkvFJHSJO6njIGN72BzgtqXiIEcNEDEV+eb6eMxU9g0
	vk4Lzs7s7OP1CLgfHINH4Ab0p55ZGj2mfldHrk4U0qT6KkzGupB9eKbQbdCduh9T3HgBYQRfE56rk
	DLRcMOuSn2CCSxfYMyGCazBSOdT0rwgU6QzUAqjzX//bVu54jkQ4IsGxdk6Mu2tXVeEgfNgYgDXab
	1BKqraIwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDS26-0002u3-Lb; Wed, 02 Sep 2020 12:38:34 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDS23-0002tG-Hm
 for linux-mediatek@lists.infradead.org; Wed, 02 Sep 2020 12:38:32 +0000
Received: by mail-ej1-x641.google.com with SMTP id i22so6406017eja.5
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t3qYc2zJNg0FAofaOlnrSHg3j0Es/PFZqbZlp5eYzeo=;
 b=OG9uscYYRkC/LHCVfNlrRKTpe4pHFmvEfgYIH2AtEftlQB2si8LY1cgMyXPxQs9HuY
 7yJV4TNLo4AyWcd7o88djryRDb/quiVyupDYFPvk74Q1546/hqQVdQ+DNgK6oK+aJ6fF
 LVIGrOw+hftqCThrUSRhBnfAGbDp46SqJ0J9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t3qYc2zJNg0FAofaOlnrSHg3j0Es/PFZqbZlp5eYzeo=;
 b=VuavLe0tuT22cDGhJojpiQQ1N7RVkBvJ86kY1r26zVgvFKzVz87WxBnipgC8/EFeD+
 jcEfo+JYiHBLD6KYHgicEicp/bSBegjsJYDlPNbXAsxLHDEPEVe+cCWZ97y+CRmQ9p9o
 p/e+Z/LDPyU6w0sCVvwQn4NsfrXYnGBEht6dOMWwZ+CjnEJlizA419gydUL4Ecdegwsd
 iV725c/M4RfpaEA/T+/jbqUNWoJ5SfY7bMEIb8ikiLibhPXiAdVOxSPK2zpkA9+iDF7Y
 stRumNvbkJv4uozT1wiVjZXo2nF6WtitI25p+Vwj151z1y6VrupoFhzxr1ehfYQfePoj
 pHnw==
X-Gm-Message-State: AOAM532Ah5rbB6VU0ICOgh/T9KMgA6XNpc7n9oNDAmIzMdOiWRlSqdpC
 Ls5QkjIFEmK5fNYW77WAJNuie2lipNS4Jg==
X-Google-Smtp-Source: ABdhPJyaBSiE1dQuIc5CRCfetEFIKQq+34DSRedcYu591URyitF7MCzyFo9Jj3W5wLTHv8hz7Spg3w==
X-Received: by 2002:a17:906:68d2:: with SMTP id
 y18mr1624057ejr.197.1599050309390; 
 Wed, 02 Sep 2020 05:38:29 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id eb11sm4179901edb.76.2020.09.02.05.38.28
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 05:38:28 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id a9so4375646wmm.2
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 05:38:28 -0700 (PDT)
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr456259wme.127.1599050307551; 
 Wed, 02 Sep 2020 05:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200703080404.29770-1-dongchun.zhu@mediatek.com>
 <20200703080404.29770-3-dongchun.zhu@mediatek.com>
 <20200902053535.GC2264887@google.com>
In-Reply-To: <20200902053535.GC2264887@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 2 Sep 2020 14:38:04 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AyBb7XT3fz1e6_fAer=QT=L_h-QPhp+ngQb0pHCkY49Q@mail.gmail.com>
Message-ID: <CAAFQd5AyBb7XT3fz1e6_fAer=QT=L_h-QPhp+ngQb0pHCkY49Q@mail.gmail.com>
Subject: Re: [PATCH V10 2/2] media: i2c: dw9768: Add DW9768 VCM driver
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_083831_632557_7B80DB19 
X-CRM114-Status: GOOD (  19.04  )
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
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
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

On Wed, Sep 2, 2020 at 7:35 AM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> On (20/07/03 16:04), Dongchun Zhu wrote:
> [..]
> > +static int dw9768_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev = &client->dev;
> > +     struct dw9768 *dw9768;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     dw9768 = devm_kzalloc(dev, sizeof(*dw9768), GFP_KERNEL);
> > +     if (!dw9768)
> > +             return -ENOMEM;
> > +
> > +     /* Initialize subdev */
> > +     v4l2_i2c_subdev_init(&dw9768->sd, client, &dw9768_ops);
> > +
> [..]
> > +     dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> > +
> > +     pm_runtime_enable(dev);
> > +     if (!pm_runtime_enabled(dev)) {
> > +             ret = dw9768_runtime_resume(dev);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to power on: %d\n", ret);
> > +                     goto err_clean_entity;
> > +             }
> > +     }
> > +
> > +     ret = v4l2_async_register_subdev(&dw9768->sd);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > +             goto err_power_off;
> > +     }
>
> I would expect to see a slightly different order here: first set
> everything up, then expose the device to PM subsystem.
>

Thanks for chiming in. However, the code above is correct. Runtime PM
callbacks don't usually rely on the availability of any
userspace-facing components, while the opposite is true - when the
device is registered to the userspace, it must have all the
initialization aspects completed and that includes initialization of
runtime PM.

> [..]
> > +static int dw9768_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +     struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > +
> > +     v4l2_async_unregister_subdev(&dw9768->sd);
> > +     v4l2_ctrl_handler_free(&dw9768->ctrls);
> > +     media_entity_cleanup(&dw9768->sd.entity);
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             dw9768_runtime_suspend(&client->dev);
> > +     pm_runtime_set_suspended(&client->dev);
>
> Ditto. Shall we first disable PM (so that we won't get any unexpected
> PM callbacks) and then destroy the device?

Ditto. +/- the opposite order

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
