Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A7EC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Nov 2023 08:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILq+pBwJhinz0+b5/WAiBVX8WQImwlNlm+ztZO2q0tE=; b=O5VQf3xGIF8kcGn+x32R4L83oS
	FKPMhDkqM91pWXud95XidE0qpEHeooei23fqrZyukPnFjdHXw8U+zole2AkuxjC3Zgw8QzbOwkdUm
	9iDpyTFd0DaK9xhymSG5ef48b+wftyUoxeemsmaZ6g1gfiHfEqDS+/Oc0xh5ww49G8iXq7ciiboRN
	s5quGBYmqXlAvVzTiIbdhL8cmi8eOiiybpzGvNScM79BTVeC4UQ9qdvI7cEVrkbNg/oWOz3oB9/E+
	QyjYJEVJgPu4ZQdUIuoLyVNhXkZDLAYou4DvucW3lKur24axEDx98h8jY/UTvFqsDBSv7pKufNv8J
	pdYAEd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ol3-00FNxe-1q;
	Tue, 14 Nov 2023 08:26:53 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ol0-00FNwF-2H
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Nov 2023 08:26:52 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507b9408c61so7299385e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Nov 2023 00:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699950405; x=1700555205; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILq+pBwJhinz0+b5/WAiBVX8WQImwlNlm+ztZO2q0tE=;
        b=LZwMt+2ZLr2KwGWZJxfqZlpIJ7Na6QLKNu8hGvmFUp4M2BzV91FC8mxlV42cNFdkjt
         PUYp+fj8Gy6+beF5JKvMZV+gitzOYl6q/qKaTk0grwN6cUVXExLZBpD9uTDUDXzTNxxE
         CLLulIz1mVHp8JV5LgmMQaPJq3J+wn7eUb24E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699950405; x=1700555205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILq+pBwJhinz0+b5/WAiBVX8WQImwlNlm+ztZO2q0tE=;
        b=aqlQzsdzIOMP1c9KUEpgQs3U4luxrZ3SZFnC3/rmnLIEbMMwg9aCb5JnHPv40wPlSJ
         rpMweK9ZyGKyeL7NyaUJrX0cdlkfNKvVLpAWfIcjspT5JA7HEyHszCrmawurU5wzA6dt
         J0IsqOMQLH2h1teBI2TQo0eWUKJgiKVefGFFFsQwa+KDu2zWXhRLHlOLICYIE2ASfuu2
         2YFQl16oP0CNJ+sNv14IznA8IqG6jR6jZfbfaLC/7oMpqxVSJBj5fZSgwfE8Ayc/EIaQ
         /xKynfrtNLli6RvZP4vlrrXIgn8QIY1JysuG3svG4beB1xmj3nl3thVQF+CldBU81J8+
         THJA==
X-Gm-Message-State: AOJu0Yw5pJigpIHpeg828ngvGESzWfSYUhcpFrovJMHQ9fcNCnzbGPuJ
	wMnNrrf+N7tJg4p9OZmqpG8TvDEcaYThSxYfcPYQ3g==
X-Google-Smtp-Source: AGHT+IFHLJT6u/3uDCL4wRLuNxtmKORPhOhSsZa/aUIdnn6bzKIIUglORso7+jCQUT8ooc/QswCAlXzJ69DqRPKrwIw=
X-Received: by 2002:a05:6512:128b:b0:509:48ad:930d with SMTP id
 u11-20020a056512128b00b0050948ad930dmr7593209lfs.25.1699950405527; Tue, 14
 Nov 2023 00:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <20231109100606.1245545-3-wenst@chromium.org>
 <ZU0c2fuRSoqrpffA@smile.fi.intel.com>
In-Reply-To: <ZU0c2fuRSoqrpffA@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Nov 2023 16:26:34 +0800
Message-ID: <CAGXv+5GRHHWjAqsqT+T10vZmc1otJ9ZGJiKroqDs9F40NM5FeQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/7] of: Introduce hardware prober driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, 
	james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_002650_814899_7239C784 
X-CRM114-Status: GOOD (  44.84  )
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

On Fri, Nov 10, 2023 at 1:54=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 09, 2023 at 06:05:59PM +0800, Chen-Yu Tsai wrote:
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
> > this change introduces a simple I2C component prober. For any given
> > class of devices on the same I2C bus, it will go through all of them,
> > doing a simple I2C read transfer and see which one of them responds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree.
> > The status for all the device nodes for the component options must be
> > set to "failed-needs-probe-xxx". This makes it clear that some mechanis=
m
> > is needed to enable one of them, and also prevents the prober and devic=
e
> > drivers running at the same time.
>
> ...
>
> > +config HW_PROBER
>
> config OF_HW_PROBER // or anything with explicit OF
>
> Don't give a false impression that this is something that may works witho=
ut
> OF support.

Ack.

> ...
>
> > +     bool "Hardware Prober driver"
>
> Ditto.

Ack.

> ...
>
> > +/*
> > + * hw_prober.c - Hardware prober driver
>
> Do not include filename into the file itself.

Ack.

> > + *
> > + * Copyright (c) 2023 Google LLC
> > + */
>
> ...
>
> > +     node =3D of_find_node_by_name(NULL, node_name);
> > +     if (!node)
> > +             return dev_err_probe(&pdev->dev, -ENODEV, "Could not find=
 %s device node\n",
> > +                                  node_name);
>
> With
>
>         struct device *dev =3D &pdev->dev;
>
> this and other lines can be made neater.

Ack.

> ...
>
>
> For better maintenance it's good to have ret assignment be placed here
>
>         ret =3D 0;

Ack.

> > +     for_each_child_of_node(i2c_node, node) {
> > +             struct property *prop;
> > +             union i2c_smbus_data data;
> > +             u32 addr;
> > +
> > +             if (!of_node_name_prefix(node, node_name))
> > +                     continue;
> > +             if (of_property_read_u32(node, "reg", &addr))
> > +                     continue;
> > +             if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_S=
MBUS_BYTE, &data) < 0)
> > +                     continue;
> > +
> > +             dev_info(&pdev->dev, "Enabling %pOF\n", node);
> > +
> > +             prop =3D kzalloc(sizeof(*prop), GFP_KERNEL);
> > +             if (!prop) {
> > +                     ret =3D -ENOMEM;
> > +                     of_node_put(node);
> > +                     break;
> > +             }
> > +
> > +             prop->name      =3D "status";
> > +             prop->length    =3D 5;
> > +             prop->value     =3D "okay";
> > +
> > +             /* Found a device that is responding */
> > +             ret =3D of_update_property(node, prop);
> > +             if (ret)
> > +                     kfree(prop);
> > +
> > +             of_node_put(node);
> > +             break;
> > +     }
>
> ...
>
> > +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> > +     { .compatible =3D "google,hana", .prober =3D i2c_component_prober=
, .data =3D "touchscreen" },
> > +     { .compatible =3D "google,hana", .prober =3D i2c_component_prober=
, .data =3D "trackpad" },
> > +};
>
> Why can't OF ID table be used for this?

My intent was to have this accept a probe function, which may take an extra
data argument. So either a new structure like the one here, or use OF ID ta=
ble,
and then another layer with a struct holding the prober and extra data poin=
ter.

I'm guessing this will change since Rob thinks the next patch that adds a
different prober doesn't belong here.

> ...
>
> > +     for (int i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
>
> unsigned?

Ack.

> > +             if (of_machine_is_compatible(hw_prober_platforms[i].compa=
tible)) {
> > +                     int ret;
> > +
> > +                     ret =3D hw_prober_platforms[i].prober(pdev, hw_pr=
ober_platforms[i].data);
> > +                     if (ret)
> > +                             return ret;
> > +             }
>
> ...
>
> > +     pdev =3D platform_device_register_simple(DRV_NAME, -1, NULL, 0);
>
> -1 is defined in the header, use that definition.

Ack.

> > +     if (!IS_ERR(pdev))
> > +             return 0;
> > +
> > +     platform_driver_unregister(&hw_prober_driver);
> > +
> > +     return PTR_ERR(pdev);
>
> Can you use standard pattern, i.e. checking for the _error_ condition?

Ack.


Thanks
ChenYu

