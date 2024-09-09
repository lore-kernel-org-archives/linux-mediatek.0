Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB181CD4F4C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 03:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65RZ8SOYLOiyWGNxpNqE+fBvr6QpbSIs+5UxPrLsRJE=; b=y/QOmS7jHqA26jHKuVYGzLBEvC
	x7fX6gE0CaSknYOf4gZ+u8byRpmeuvE13jmPtEA63g3eNiDGR3QciFTCGMqFGhrckK+BR6Bk143RG
	c5r1OonHUjR8h3I0XjCQ81HQrDKHiZcYFPYy9ON+6u66xVUr2K1jbrPbN67lQlB1/q6ep93q/+/aO
	yV4QbCPH4yGCYE7x5zi+cgb1xuT78i1OJdOX71tzK79lr2khMQAhoyfpxeqGTWVnX23CDBU+SFn+a
	sFx8gbDhgMOngVVepHkODOJNMCMfENrVO1z5MP9oL6DH0xiXqphSRa0MZUANGI/CVixtRNgh0Ysye
	hxbXYpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUgW-00000000KpD-1TCT;
	Mon, 09 Sep 2024 03:03:24 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUfT-00000000KgW-2YFI
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 03:02:21 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-535be093a43so5001461e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 20:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725850938; x=1726455738; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65RZ8SOYLOiyWGNxpNqE+fBvr6QpbSIs+5UxPrLsRJE=;
        b=liPazXGlTHSWnhm72bBZUqMToj99kSmCPRNK/QTeC1zUFB8Adz1Qm7ZJRgjQY/jAg4
         TXjWj5buxylZ0ekad8u+H6qOlBv+HG6t61G0iBg4DC10l38o+1DLcAY85ZIttq2PP3BK
         Q6+Ga6MIDIGVW1jXAR0hdbW8d9bRUAgzML0ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725850938; x=1726455738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65RZ8SOYLOiyWGNxpNqE+fBvr6QpbSIs+5UxPrLsRJE=;
        b=YECg5knkepsNxKPPPjvN+ZgKamaOIi/L7+sdjTFxNG4hNJfoNm93rYJVdZxwheQn/b
         /itBPb8Yv/YQtroT4bBZYd/SAxhFPFg+lzqChpcLk22A7EuSudb4u+xjreHIoCztk1pj
         OHVYUdXB+sh+jfOAjGT+VZmsgUuu025eexd4beYpjFr1/xNiu6ud+O34ZpB0xvaRwXnq
         GLlfZMrKSd35lmOeDJ4LI5wnax2hbvfJ3h7ptvTnHu/ISNzTqGbjYjDom/yRoxSZrow8
         Z+CzyrCjyoO/Pb4Fa1bsIWvBPvMZgMsVuMSa4ACcttKlgwn3f1tiHcEFkfGBrEfMGhBT
         Xtqw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ6U7k+c1iLpUUipnwTNx1e5HKpLW5xvgT4DWkWUYe3qTPIfALLKM2RSj7F4bPd5+QKzfV/3l/c1twJFy2Uw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkTWk+CcXGXrXwl+XsV2VuX9dKtlHln9WDIenoWIhJFX6oKoMO
	ZMm4nZDkTd/hfDHqefSudTqeMyDnRBc7LkT8eH0/csKHbBedSIWS1qCq3sdXKIuhhU8Hh5UxP6w
	t2R2YEkYcPqOzpbfH3L7O1Ca4CUITpARJhI28
X-Google-Smtp-Source: AGHT+IHKFMbyArHB2AN56DTTWYLOl+lRWjVmB3hnmcGrV4D1bnYTbTUiJguUasaq/X4rrUATX9/ZP6f/vksIVDxn9RQ=
X-Received: by 2002:a05:6512:3d1b:b0:536:5530:af46 with SMTP id
 2adb3069b0e04-53658813100mr6869471e87.52.1725850937567; Sun, 08 Sep 2024
 20:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-9-wenst@chromium.org>
 <Zthk25W0zXcHWRdt@smile.fi.intel.com>
In-Reply-To: <Zthk25W0zXcHWRdt@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Sep 2024 11:02:06 +0800
Message-ID: <CAGXv+5FyEJBO8=eb3i7hdytfS-iuAx=o=2SL46GDPVkfiz-Dyg@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] i2c: Introduce OF component probe function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_200219_696727_D47D2B61 
X-CRM114-Status: GOOD (  41.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 4, 2024 at 9:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 04, 2024 at 05:00:10PM +0800, Chen-Yu Tsai wrote:
> > Some devices are designed and manufactured with some components having
> > multiple drop-in replacement options. These components are often
> > connected to the mainboard via ribbon cables, having the same signals
> > and pin assignments across all options. These may include the display
> > panel and touchscreen on laptops and tablets, and the trackpad on
> > laptops. Sometimes which component option is used in a particular devic=
e
> > can be detected by some firmware provided identifier, other times that
> > information is not available, and the kernel has to try to probe each
> > device.
> >
> > This change attempts to make the "probe each device" case cleaner. The
> > current approach is to have all options added and enabled in the device
> > tree. The kernel would then bind each device and run each driver's prob=
e
> > function. This works, but has been broken before due to the introductio=
n
> > of asynchronous probing, causing multiple instances requesting "shared"
> > resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> > time, with only one instance succeeding. Work arounds for these include
> > moving the pinmux to the parent I2C controller, using GPIO hogs or
> > pinmux settings to keep the GPIO pins in some fixed configuration, and
> > requesting the interrupt line very late. Such configurations can be see=
n
> > on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> > Lenovo Thinkpad 13S.
> >
> > Instead of this delicate dance between drivers and device tree quirks,
> > this change introduces a simple I2C component probe. function For a
> > given class of devices on the same I2C bus, it will go through all of
> > them, doing a simple I2C read transfer and see which one of them respon=
ds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree. The
> > status for all the device nodes for the component options must be set
> > to "failed-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > +int i2c_of_probe_component(struct device *dev, const char *type)
> > +{
> > +     struct i2c_adapter *i2c;
> > +     int ret;
> > +
> > +     struct device_node *i2c_node __free(device_node) =3D i2c_of_probe=
_get_i2c_node(dev, type);
> > +     if (IS_ERR(i2c_node))
> > +             return PTR_ERR(i2c_node);
>
> > +     for_each_child_of_node_scoped(i2c_node, node) {
>
> Hmm, but can it be for_each_child_of_node_with_prefix_scoped() now?

Looks like at least one of the fixups got squashed into the wrong patch.
I fixed both of them to use for_each_child_of_node_with_prefix().

That isn't compatible with Rob's comment though, and I'm not sure we
want a for_each_available_child_of_node_with_prefix() helper just for
one instance?

> > +             if (!of_node_name_prefix(node, type))
> > +                     continue;
> > +             if (!of_device_is_available(node))
> > +                     continue;
> > +
> > +             /*
> > +              * Device tree has component already enabled. Either the
> > +              * device tree isn't supported or we already probed once.
> > +              */
> > +             return 0;
> > +     }
> > +
> > +     i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > +     if (!i2c)
> > +             return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2=
C adapter\n");
> > +
> > +     ret =3D 0;
> > +     for_each_child_of_node_scoped(i2c_node, node) {
>
> Ditto.
>
> > +             union i2c_smbus_data data;
> > +             u32 addr;
> > +
> > +             if (!of_node_name_prefix(node, type))
> > +                     continue;
> > +             if (of_property_read_u32(node, "reg", &addr))
> > +                     continue;
> > +             if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_S=
MBUS_BYTE, &data) < 0)
> > +                     continue;
> > +
> > +             /* Found a device that is responding */
> > +             ret =3D i2c_of_probe_enable_node(dev, node);
> > +             break;
> > +     }
> > +
> > +     i2c_put_adapter(i2c);
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +EXPORT_SYMBOL_GPL(i2c_of_probe_component);
>
> Wonder if we may already use namespaced export from day 1.

I think that would be a good idea, especially given Doug's request for
exposing more helpers.

Thanks
ChenYu

