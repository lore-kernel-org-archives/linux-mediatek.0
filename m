Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88682C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giON8Q4LjGFF8ELEjzDZqXiqE5K5VOG4OBV3cUf5KM0=; b=RO4DV2688PPxQC+q+4rIK0n7+c
	M5D4bsXIV6jtdQAkiSvSRHAU6U1qkQPkCLSSTChNhYGD4LwtRbY/uFuq8Vp6v1Fw2fJYTj+v9EIQt
	1BHiLD1akFs6BuJVArbqswqZPi6z7Wz60rNPfdbzYza5oHXOFSIUlw7uOQXznBInAVCBfS/mR2kv4
	cEJsaZA3+1/bUhVw+79NVxguLgMwkqaFzNtXtRcsOiK0Su2GEytloJMveY3bYdIWNsSNnhN0adAiH
	zJ8MIiBFP0jGoe3Ml2E0zcao7HuTRuInA/lmJc1x4g3y4L+gxwpRyMyMCSr8/Y5ycLpyj84S6fmDZ
	LUnsK/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shPvt-0000000Fwfo-0EAZ;
	Fri, 23 Aug 2024 08:46:09 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shPqj-0000000FvIY-0tqn
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 08:40:51 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-533461323cdso2006749e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Aug 2024 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724402447; x=1725007247; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giON8Q4LjGFF8ELEjzDZqXiqE5K5VOG4OBV3cUf5KM0=;
        b=ZwUo6BeXAJqs4cSwTJzgN4qSt1c0/b902ZKseYnoF/ppwhlNFSuccOHDPAnF3klKR8
         n6rHVJX5yY5YylXtCcW4CAf9w7R0iWwIBbws8IWXeHyOftDi5Zqw3mvPqX2XDNqki4do
         3BZYqdUTv3d8lDmGaJe0EDizEfRVGEykw27Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724402447; x=1725007247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giON8Q4LjGFF8ELEjzDZqXiqE5K5VOG4OBV3cUf5KM0=;
        b=s+MC6rHBpVmPrTPF52Q8ni3hhOh4WB4kDfBODCQWRX/GbM3uWNzM1rZMGlr8CLG5aZ
         vU1miXubnhRaNJjPJlhiTRAPZsMc2Pg9ihTwWQqjKK4N5p6mr9u3etSUg0iJkrqWAUcw
         ZECkFJlO2F4TycvozHP2/M7ECANn3y9HkFw1NhdZUj34SNFuUEwFNGGVSDI0i+faDcN0
         4ELC0+MnlcSnCkZsW/R73yUy8M6yr16Px/8wYQKNYDOoFdizBs5SFkW0r5ocM8tt71ws
         G22Dn29M+rs5Xb59+wdL+WWlwG65eCChXFrC0pHyNMBn53W9YMoH6SOlrTiSwbB3j1Cp
         R2eA==
X-Forwarded-Encrypted: i=1; AJvYcCUW0rrRjNo9ltv8QZfGoIFCgfrQot7EiN1IXahQj0OdGlY8LaTUfcjgq58OCuWB/jymzxmFm03Yo+eZ9OlQPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDIDAj/x4A8a28nayx6G8ZCqNhqLfJ9li8Auvbla8GWR7+TJbk
	4/mlKgSv4W5m7+IkVcH3wdxhXUP8uzUd6j6AXjKeRer1tW1ClrY75Hy1V7Ohk3NpgGs86f6Wr9D
	0lGPvhb7ouo69jj3xwxpBswqURwU+l4dFuwol
X-Google-Smtp-Source: AGHT+IFnhIjmtVb9vM0UayOlpRV8Kz6kcZZB1TNIceqcnBHabmU8gzY4wCKbVc+Nrlh5/jdYTbjbi55KO9/vc0BqWDo=
X-Received: by 2002:a05:6512:b01:b0:52e:9fd3:f0ca with SMTP id
 2adb3069b0e04-5343883a3a8mr1006281e87.33.1724402447359; Fri, 23 Aug 2024
 01:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-7-wenst@chromium.org>
 <ZsdE0PxKnGRjzChl@smile.fi.intel.com>
In-Reply-To: <ZsdE0PxKnGRjzChl@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 16:40:36 +0800
Message-ID: <CAGXv+5HtjWi60OnMrjR3fnO3T=7uyMazr1aKBFjuPmWuE9NK6g@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] i2c: Introduce OF component probe function
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
X-CRM114-CacheID: sfid-20240823_014049_416285_BE67B224 
X-CRM114-Status: GOOD (  37.92  )
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

On Thu, Aug 22, 2024 at 10:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:19:59PM +0800, Chen-Yu Tsai wrote:
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
> > --- a/drivers/i2c/Makefile
> > +++ b/drivers/i2c/Makefile
> > @@ -9,6 +9,7 @@ i2c-core-objs                         :=3D i2c-core-bas=
e.o i2c-core-smbus.o
> >  i2c-core-$(CONFIG_ACPI)              +=3D i2c-core-acpi.o
> >  i2c-core-$(CONFIG_I2C_SLAVE)         +=3D i2c-core-slave.o
> >  i2c-core-$(CONFIG_OF)                +=3D i2c-core-of.o
> > +i2c-core-$(CONFIG_OF_DYNAMIC)        +=3D i2c-core-of-prober.o
>
> Seems like all the above (except ACPI) have the same issue, i.e. TABs/spa=
ces
> mixture.

I was lazy and just copied the previous line. I'll fix the new line for now=
.

> ...
>
> > +     ret =3D of_changeset_apply(ocs);
> > +     if (!ret) {
>
> Why not positive conditional?

No real reason. I suppose having the error condition come first is more
common. Not sure if it makes any difference in this case though?


Thanks
ChenYu


> > +             /*
> > +              * ocs is intentionally kept around as it needs to
> > +              * exist as long as the change is applied.
> > +              */
> > +             void *ptr __always_unused =3D no_free_ptr(ocs);
> > +     } else {
> > +             /* ocs needs to be explicitly cleaned up before being fre=
ed. */
> > +             of_changeset_destroy(ocs);
> > +     }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

