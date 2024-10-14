Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86045CFC503
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 07:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ynM5W4VrPGHZiCTug5hrtZgV83Yif26KnCypK7Mhz8=; b=isGzkRZCCi5Z7KAMj2sFrrv2ac
	QIN0STwy+FIYtc+3lPLJB5uhOStfyhIdbdUiJGto5tRqiDHCycR6JSmkKyGFIvD7BhaqRBfTMN2fi
	MTVDF4TbMNszfJ4+DuD53yXfRwnRX3fS1YH2QobcRCLOwj21dfx+/cx9EC5aBI23e2ayWEkaBJfrl
	xRDApqNhy0YNje9eTucAtKIEVMr9pEWFpwDaBQ+2O0LX4fAmBv/CQZnRcnnR8sdPBLF0ipdxZ1PjG
	jDNoGKdUjSyBN4/tEmqX1zyyIvgXliGVbiBp2z8CDW4YdyHeu0Ru7UbpXROuzgpU6gL5vM86URXZw
	Ia5ygwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FC6-00000003zvr-1QHC;
	Mon, 14 Oct 2024 07:08:42 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0F8U-00000003zKO-0lwB
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 07:05:00 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fac9eaeafcso37320591fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 00:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728889496; x=1729494296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ynM5W4VrPGHZiCTug5hrtZgV83Yif26KnCypK7Mhz8=;
        b=I36rk0zF5sphh1aGLH3m8Nzo4d+lylSWps11uy5PbFfc0lZ1DLSiYsTn/dm+SeMv7B
         n47/QftSFg5ALPypElCUrP2quaYsYXFjwW2mUEEtccJD1i4UHh1QXyhXp96VPi/20Alg
         oggo2cxt/uswwulf3ga5BhVNeGOYrrouBPCe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728889496; x=1729494296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ynM5W4VrPGHZiCTug5hrtZgV83Yif26KnCypK7Mhz8=;
        b=c0pB/c5N/9KvRFufmzuYe/1Q1o94IF0LlqfKMKBZ4UhsYXtgVwd3OX0myOqX5Ep/jV
         2Xt7IxVUbgXO1sGxkG0P1cxWwCfBVWRXqmffuqrXcBHsuxdoo1j0fyntIX40goU+StZx
         0sgMD/wDsh1Bhry52tC1B4+W+u/fz1R4Us4h4aEk3+sJZnfosgSLv7xaOmpnCeStgQW2
         Wcdzrq7Oq4u89U+byxfCdYot60ge6XQ5aNN1r1F0OePaXGj0qGtjReMYtvgjjDpOU3kK
         OEg3Jz2QgbznDHR2vC/RjP76zKVPh62tuPzapbQlu359pg/P21StbbEr/P1pT6CcaZTS
         uSsw==
X-Forwarded-Encrypted: i=1; AJvYcCWRJgEC68uCbNynsjSe25BvFjIdnxKVoYWM3NYYWdqEyiKzGobnC22nZ4edG8f0EQS17mT6Ea7wdJWThofnow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeFGjKIQdw4xfUFj48cUp6ieSTdLnYkfUu5PxrEwOjDYdcWRqU
	MHZ/Wn0ECf5Z5yMR6APtiOBvVYh5akdMEMSjYe7HqNkbbATojK4uR0nbGzIirbsobO+ni4SSgIw
	wuaq9U3mPJgHidfCmXfRRWzt1b0Jvr4taBxD6
X-Google-Smtp-Source: AGHT+IFT7HlAXavEjKzdhXvzBtEDuZfwe6IvILZ8dpouGERPtoOe8fs5ejCzMZSurR6nnvkNUPToEI3YRpIVnaoznhU=
X-Received: by 2002:a05:6512:b11:b0:539:8d9b:b624 with SMTP id
 2adb3069b0e04-539e5742bdamr2688773e87.55.1728889495769; Mon, 14 Oct 2024
 00:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
In-Reply-To: <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 15:04:44 +0800
Message-ID: <CAGXv+5FAhZQR+Tah_6Qxp4O7=x2RawfWuMh29_FT4mGQGQF84w@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware prober
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
X-CRM114-CacheID: sfid-20241014_000458_283231_90631B3E 
X-CRM114-Status: GOOD (  42.84  )
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

On Thu, Oct 10, 2024 at 11:29=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
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
> > set to "fail-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > +#include <linux/array_size.h>
> > +#include <linux/errno.h>
> > +#include <linux/i2c-of-prober.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
>
> > +static int chromeos_i2c_component_prober(struct device *dev, const voi=
d *_data)
> > +{
> > +     const struct chromeos_i2c_probe_data *data =3D _data;
> > +     struct i2c_of_probe_simple_ctx ctx =3D {
> > +             .opts =3D data->opts
>
> Leave trailing comma in such cases (when it's not a terminator and
> not on the same line with the variable definition).

Ack.

> > +     };
> > +
> > +     return i2c_of_probe_component(dev, data->cfg, &ctx);
> > +}
> > +
> > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_to=
uchscreen =3D {
> > +     .cfg =3D &(const struct i2c_of_probe_cfg) {
>
> Perhaps you can introduce something like
>
> #define DEFINE_I2C_OF_PROBE_CFG(_type_, _ops_)          \
>         (struct ...) {                                  \
>                 .ops =3D _ops_,                           \
>                 .type =3D #_type_,                        \
>         }
>
> and use it here as
>
>         .cfg =3D DEFINE_I2C_OF_PROBE_CFG(touchscreen, NULL),

Overall reply about the compound literals is in my other email.

> > +             .type =3D "touchscreen"
>
> Ditto.

Ack.

>
> > +     }
>
> Ditto.
>
> > +};
> > +
> > +static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpa=
d_cfg =3D {
> > +     .ops =3D &i2c_of_probe_simple_ops,
> > +     .type =3D "trackpad"
>
> Leave a comma.

Ack.

> > +};
>
> ...
>
> > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_tr=
ackpad =3D {
> > +     .cfg =3D &chromeos_i2c_probe_simple_trackpad_cfg,
>
>         .cfg =3D DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_op=
s),
>
> Or even
>
> #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                  \
>         DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
>
> > +     .opts =3D &(const struct i2c_of_probe_simple_opts) {
>
> Perhaps also DEFINE_xxx for this compound literal?

I think it's better to leave this one as is. Not every entry will
use the same combination of parameters. And having the entry spelled
out like this makes it easier to read which value is for what
parameter, instead of having to go up to the macro definition.

For comparison, this entry uses just two of the parameters, while for
another platform I'm working on the full set of parameters is needed.

> > +             .res_node_compatible =3D "elan,ekth3000",
> > +             .supply_name =3D "vcc",
> > +             /*
> > +              * ELAN trackpad needs 2 ms for H/W init and 100 ms for F=
/W init.
> > +              * Synaptics trackpad needs 100 ms.
> > +              * However, the regulator is set to "always-on", presumab=
ly to
> > +              * avoid this delay. The ELAN driver is also missing dela=
ys.
> > +              */
> > +             .post_power_on_delay_ms =3D 0,
> > +     }
> > +};
> > +
> > +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> > +     { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compone=
nt_prober, .data =3D &chromeos_i2c_probe_dumb_touchscreen },
> > +     { .compatible =3D "google,hana", .prober =3D chromeos_i2c_compone=
nt_prober, .data =3D &chromeos_i2c_probe_hana_trackpad },
>
> These strings are a bit long, perhaps wrap on one member per line?

Sure.


ChenYu


> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

