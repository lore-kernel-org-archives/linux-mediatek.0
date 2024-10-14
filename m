Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF06CF259D
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 03:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3lLQfUo/s0gGdA9DmoonFF1hWOI8uf/oAseIjpYmyc=; b=EeW0hsFU+kzDzCdUsuFnVh/MkS
	BhtoR1Io0/ZPu3uZ9EW9o6rKolShmMigXMIuFYzsh48WP/RXwuV5cyMeTvLRCQycePnunoIIttCn1
	FypCIfUoHtheZJqbazWgxrGlIxUV0aw21L5zO3QJuWLfZPLDoLPydrHMUpSE8DicDx+Fp4Zsov1qE
	7pyBE/PBo0LH27Dhr1lSQdoEvaOzlp9pwufyls2CNbZnUxIqXX1LW4zaoQc4LOmzAfHimCCr8ry8u
	ZAS2yq3PqzV59+9I63LqBy0JGsHSCBS3JmGC6CngdLcBjHggu48SyOiTULtxRJcw3gfb5LfbZtRFp
	9gAUbuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0CAr-00000003ePp-36Kq;
	Mon, 14 Oct 2024 03:55:13 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0C9i-00000003eGw-1KQL
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 03:54:04 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539f8490856so307660e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 20:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728878039; x=1729482839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3lLQfUo/s0gGdA9DmoonFF1hWOI8uf/oAseIjpYmyc=;
        b=Z1u7KhEiESWVctq4zqvfU06wVVd3Kfj2bbkR8dDL+1OL4qBuJqKisIUs8Yf/kxhjq2
         lYLkKq218BRD1IP+ftfX9vpxJyacceVaG9Z6fObn9BKNmq1TREQ0zgs59uPY7cNeVJt0
         ANr5ve0khcY56uURsy5yhk+jhT64as/8rShjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728878039; x=1729482839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3lLQfUo/s0gGdA9DmoonFF1hWOI8uf/oAseIjpYmyc=;
        b=EQBUUWnHjr6uaJ1LJhopQMqE0IQqmFtOVBitGdAw0MiL4Zaql1aofeib8vb9rrxXPT
         rTlw60q9rw7xK3MzIXB7FScwJAUK4zBcSncPi2QGD5Ox0uKVn1cSkPeU7WHXV6374/yo
         FBV5y8+jRGXtrKgN3kqheVs0ZY7W30CyqsBvHQJdYkLekzbwJJ9O5NfF489mKVsLKI8G
         mE0+Dp3kb31SNzt/RFW0QAZDKh+EXsprdDjRZJ3sAIhUBEEmOUmA2B5rfNK5bGZKiQp3
         JaJtz3GnsqsNBU5RMgbRVNDa3NJ3LJxkZf5IaWYxpL466zIXz3TWlWHFuKuTE/bH+ZkC
         l9GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEZoZwPSpdXTnlkqCe9IW3j7V9zoIG9ST1iuPHSlrVfqwbvObq1tLC4b+g3mio+dTpoHMbKUHMjYr20cpaTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMAFvV+uj2zmHK4jPe/B40wZ5833kGq9wx4cOOgKcHjKJSYYgW
	e+pJqQ9PDTX4lJ0EkMReRFsciceZ6gxZMrEO7s4bhc/AOemqscJ3YkZX2qsT+PhrRt5v3op7ug4
	xDLwvV56pL3Te0nIwpfgFbb0CO2Dca7Dypy6K
X-Google-Smtp-Source: AGHT+IEzxwWlDLTghtVV9WGeXOw9CFAW2YJnxa1CC/fbZlqyGTRNtILA9Q+qUXeSLMHOqXVX0fu1XTuMTWycvKaDLXI=
X-Received: by 2002:a05:6512:2255:b0:539:9f52:9e4 with SMTP id
 2adb3069b0e04-539da583dbbmr3799259e87.48.1728878038726; Sun, 13 Oct 2024
 20:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
 <ZwfvuA2WhD_0P3gL@smile.fi.intel.com>
In-Reply-To: <ZwfvuA2WhD_0P3gL@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 11:53:47 +0800
Message-ID: <CAGXv+5Hm62hFsF27B-cEWTJ_AKrhcfCPaqR7BxmpwnjABzwHTQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_205402_492137_08449693 
X-CRM114-Status: GOOD (  50.13  )
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

On Thu, Oct 10, 2024 at 11:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 08, 2024 at 03:34:23PM +0800, Chen-Yu Tsai wrote:
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
> > this change introduces a simple I2C component probe function. For a
> > given class of devices on the same I2C bus, it will go through all of
> > them, doing a simple I2C read transfer and see which one of them respon=
ds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree. The
> > status for all the device nodes for the component options must be set
> > to "fail-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> Fresh reading of the commit message make me think why the firmware or
> bootloader on such a device can't form a dynamic OF (overlay?) to fulfill
> the need?

The firmware / bootloader on existing devices are practically not upgradabl=
e.
On the other hand, the kernel is very easy to upgrade or swap out.

For said shipped devices, there is also nothing to key the detection
off of besides actually powering things up and doing I2C transfers,
which takes time that the firmware has little to spare. We (ChromeOS)
require that the bootloader jump into the kernel within 1 second of
power on. That includes DRAM calibration, whatever essential hardware
initialization, and loading and uncompressing the kernel. Anything
non-essential that can be done in the kernel is going to get deferred
to the kernel.

Also, due to project timelines oftentimes the devices are shipped with a
downstream kernel with downstream device trees. We don't want to tie the
firmware too tightly to the device tree in case the downstream stuff gets
reworked when upstreamed.

> Another question is that we have the autoprobing mechanism for I2C for ag=
es,
> why that one can't be (re-)used / extended to cover these cases?

I haven't looked into it very much, but a quick read of
Documentation/i2c/instantiating-devices.rst suggests that it's solving
a different problem?

In our case, we know that it is just one of a handful of possible
devices that we already described in the device tree. We don't need
to probe the full address range nor the full range of drivers. We
already have a hacky workaround in place, but that mangles the
device tree in a way that doesn't really match the hardware.

The components that we are handling don't seem to have any hardware
ID register, nor do their drivers implement the .detect() callback.
There's also power sequencing (regulator and GPIO lines) and interrupt
lines from the device tree that need to be handled, something that is
missing in the autoprobe path.

Based on the above I don't think the existing autoprobe is a good fit.
Trying to shoehorn it in is likely going to be a mess.

Doug's original cover letter describes the problem in more detail,
including why we think this should be done in the kernel, not the
firmware:
https://lore.kernel.org/all/20230921102420.RFC.1.I9dddd99ccdca175e3ceb1b9fa=
1827df0928c5101@changeid/

> ...
>
> > +#ifndef _LINUX_I2C_OF_PROBER_H
> > +#define _LINUX_I2C_OF_PROBER_H
>
> Missing kconfig.h.

Ack.


Thanks
ChenYu

> > +struct device;
> > +struct device_node;
> > +
> > +/**
> > + * struct i2c_of_probe_ops - I2C OF component prober callbacks
> > + *
> > + * A set of callbacks to be used by i2c_of_probe_component().
> > + *
> > + * All callbacks are optional. Callbacks are called only once per run,=
 and are
> > + * used in the order they are defined in this structure.
> > + *
> > + * All callbacks that have return values shall return %0 on success,
> > + * or a negative error number on failure.
> > + *
> > + * The @dev parameter passed to the callbacks is the same as @dev pass=
ed to
> > + * i2c_of_probe_component(). It should only be used for dev_printk() c=
alls
> > + * and nothing else, especially not managed device resource (devres) A=
PIs.
> > + */
> > +struct i2c_of_probe_ops {
> > +     /**
> > +      * @enable: Retrieve and enable resources so that the components =
respond to probes.
> > +      *
> > +      * Resources should be reverted to their initial state before ret=
urning if this fails.
> > +      */
> > +     int (*enable)(struct device *dev, struct device_node *bus_node, v=
oid *data);
> > +
> > +     /**
> > +      * @cleanup_early: Release exclusive resources prior to enabling =
component.
> > +      *
> > +      * Only called if a matching component is actually found. If none=
 are found,
> > +      * resources that would have been released in this callback shoul=
d be released in
> > +      * @free_resourcs_late instead.
> > +      */
> > +     void (*cleanup_early)(struct device *dev, void *data);
> > +
> > +     /**
> > +      * @cleanup: Opposite of @enable to balance refcounts and free re=
sources after probing.
> > +      *
> > +      * Should check if resources were already freed by @cleanup_early=
.
> > +      */
> > +     void (*cleanup)(struct device *dev, void *data);
> > +};
> > +
> > +/**
> > + * struct i2c_of_probe_cfg - I2C OF component prober configuration
> > + * @ops: Callbacks for the prober to use.
> > + * @type: A string to match the device node name prefix to probe for.
> > + */
> > +struct i2c_of_probe_cfg {
> > +     const struct i2c_of_probe_ops *ops;
> > +     const char *type;
> > +};
> > +
> > +#if IS_ENABLED(CONFIG_OF_DYNAMIC)
> > +
> > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_pro=
be_cfg *cfg, void *ctx);
> > +
> > +#endif /* IS_ENABLED(CONFIG_OF_DYNAMIC) */
> > +
> > +#endif /* _LINUX_I2C_OF_PROBER_H */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

