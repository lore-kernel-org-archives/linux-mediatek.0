Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D5BCFC267
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 05:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6I9X4HeUOqY4U0CtpRUmEBHzfHV0sdEz17jGz7AVasM=; b=c2ZT56oTgqvIMCEJVdoBKoDbgV
	2Prgdih246Gi7zV9kBG/m4x29XU1LecfTXsPALMQEuM/JaDkfTZgWCibKQSQAdSG8TiN/g600qDTe
	Te4EX+sz2shzCzWvYohfcmClB+3w6Pksgm2LT+hJx69eHS7vRsfwGD+bmoMfofegfude5HMSnvlyY
	OiFANd16CXVwwTxGrhvDn/EJq6tlBwcTF67+O7NFZBJY8+zr2F/Yy50L9FQq3oedfAw9YNduQkJfV
	3t23fp7QLlNHWYWbTaSXoNjniD621X86+nAemCsGehzvqqNSCKQRVLl79lQvtuuGb2pOLG/+egMDQ
	kMJxuedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0aBO-000000076wQ-2bu4;
	Tue, 15 Oct 2024 05:33:22 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0a9x-000000076nj-2zHD
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 05:31:56 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539e6c754bdso2099558e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 22:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728970312; x=1729575112; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I9X4HeUOqY4U0CtpRUmEBHzfHV0sdEz17jGz7AVasM=;
        b=C5ftR86NF/WBeyFwgara2wsiRJUKdJ/kNKQ+M9yBd9gQQWfP/hdBMrHA89cxlcFuMS
         BsmwjrjE+9GUZuDlwGWw2aVV7PPBVsqgF0KzggPN8/Y6hauBLZvc09jSGWhhyCVEO+1n
         lTsL5Xq81TRz2ViQEfVZ4v4gNWesuvD6LBqLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728970312; x=1729575112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6I9X4HeUOqY4U0CtpRUmEBHzfHV0sdEz17jGz7AVasM=;
        b=Scx2x6PaTJE1PiPE2sjmAhULhLarONQMNpGpFfPeZfft5Zsu7CQmO8V9Cv1Guamo9B
         3zuI6oZhq2ZAOBmg8IDCRA2lcfZrhKpwORpY9u0hsFe8ETD+eLfQRppd6n1u6OF5Nju5
         U1pIayfq3jU3zaAJLLeucfG70y/s+/iTOBKsQJBBlhW/ekog+56NO46+VT/gdvyZ4KKp
         JjexJQzaDy0DxuYDm1Jc+nI/ia0GGrqrJOeNNg26hX92jsAuy3gT3b+TFmkJrr9BRTHY
         mLEJfNwv3vwUlrvH333kbMWjetzB0pViMdCVzxHD5WlBwsXFct9Ttdh/c4/PRqhqzELO
         wkeg==
X-Forwarded-Encrypted: i=1; AJvYcCXIYrS2AmSgA1hAE1h7F/p3jQLqMpVAV5xZk11L7FuXIWhBB4CVqz6FYGb2ta1m3E/wyCdFUp9VLsql7VFEYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZreWA4uoFAzvmbQPrn3b9EazcQAhrJpXFY9L+eFr7IGnSG9cx
	CMRusGzNR2Sl8JNeSXPuVEh7+v9UCqAOBCGLuJ0M8N6wRuKPVwxb+uqZ6p1+B3ZFohA7rJ2DfSV
	+SBkf6k4hQy/oCQBgD8D9ttfvRhPQUt47p9TU
X-Google-Smtp-Source: AGHT+IFnv6XcJ0IaPSidwG2NAv6IbIwCRYACAiR+zoSqxUioN+OKGyLgyzBfN8IaMOcvrXfdKkawj5iYaHp4/g0qQYA=
X-Received: by 2002:a05:6512:2811:b0:539:f4ab:5638 with SMTP id
 2adb3069b0e04-539f4ab57c9mr2610100e87.60.1728970311498; Mon, 14 Oct 2024
 22:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com> <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
 <Zwz-benEP4PHbRb2@smile.fi.intel.com>
In-Reply-To: <Zwz-benEP4PHbRb2@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 13:31:40 +0800
Message-ID: <CAGXv+5EwSZFoE-Uzb5x1QfknkVfd64Z_uzR0YcvZ_pR9ktGUBA@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
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
X-CRM114-CacheID: sfid-20241014_223153_802699_767B87FE 
X-CRM114-Status: GOOD (  37.98  )
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

On Mon, Oct 14, 2024 at 7:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 14, 2024 at 12:06:16PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Oct 10, 2024 at 11:20=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:
> > > > Add GPIO support to the simple helpers for the I2C OF component pro=
ber.
> > > > Components that the prober intends to probe likely require their
> > > > regulator supplies be enabled, and GPIOs be toggled to enable them =
or
> > > > bring them out of reset before they will respond to probe attempts.
> > > > Regulator supplies were handled in the previous patch.
> > > >
> > > > The assumption is that the same class of components to be probed ar=
e
> > > > always connected in the same fashion with the same regulator supply
> > > > and GPIO. The names may vary due to binding differences, but the
> > > > physical layout does not change.
> > > >
> > > > This supports at most one GPIO pin. The user must specify the GPIO =
name,
> > > > the polarity, and the amount of time to wait after the GPIO is togg=
led.
> > > > Devices with more than one GPIO pin likely require specific power
> > > > sequencing beyond what generic code can easily support.
>
> ...
>
> > > > +     /* An empty string signals an unnamed GPIO */
> > > > +     if (!ctx->opts->gpio_name[0])
> > > > +             con_id =3D NULL;
> > > > +     else
> > > > +             con_id =3D ctx->opts->gpio_name;
> > >
> > > Can it use positive conditional?
> > >
> > >         if (ctx->opts->gpio_name[0])
> > >                 con_id =3D ctx->opts->gpio_name;
> > >         else
> > >                 con_id =3D NULL;
> >
> > You suggested writing it this way in your reply to v7. Please pick one.
>
> Oh, whatever you will finish with then, sorry for the noise.

Thank you.

> ...
>
> > > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, s=
truct i2c_of_probe_simple_ctx *ctx)
> > > > +{
> > > > +     if (!ctx->gpiod)
> > > > +             return;
> > >
> > > Do you need this check for the future patches?
> >
> > Not sure I follow. The check is needed because this function is called
> > in i2c_of_probe_simple_cleanup(), but the GPIO could have been released
> > earlier in i2c_of_probe_simple_cleanup_early(), and that makes this
> > function a no-op.
>
> Do you have a known race condition then? This is bad. You shouldn't rely =
on
> the sequence of events here, or the serialisation has to be added.

No there isn't. Explanation below.

> > The helpers for the release side are quite short, but the ones on the
> > request side wrap some conditional and error handling. I think it's
> > better to keep it symmetric?
>
> Yes, but why do you need the above check, I didn't still get...
> I.o.w. you think that there is a gap in time that (if no check) the GPIO
> descriptor might be changed? But then how does it affect anyway the possi=
bility
> that it becomes not NULL even with the current code.

There are two codes paths, either

    a) successfully finding a device and enabling it, or
    b) exhausting all options and not finding a device, because it was
       optional or it is malfunctioning.

After either code path, this cleanup function is called.

In path (a), the GPIO descriptor is released prior to enabling the device,
because the descriptor is an exclusive resource, and as soon as the device
is enabled, its corresponding driver may probe and request the same GPIO,
and would fail if it was not released.

In path (b), nothing was enabled, and the GPIO descriptor was not released
early.

The cleanup function here accounts for both cases, hence the check.

A step-by-step description might be clearer:

1. i2c_of_probe_simple_enable()
   ...
   1a. i2c_of_probe_simple_get_supply()
   1b. i2c_of_probe_simple_get_gpiod()
   1c. i2c_of_probe_simple_enable_regulator()
   1d. i2c_of_probe_simple_set_gpio()

2. Loop through potential component options and probe; if one is found:
   2a. i2c_of_probe_simple_cleanup_early()
       2a-i. i2c_of_probe_simple_put_gpiod
   2b. Enable device and driver's probe() gets called

3. i2c_of_probe_simple_cleanup()
   3a. i2c_of_probe_simple_disable_gpio()
   3b. i2c_of_probe_simple_put_gpiod()
   3c. i2c_of_probe_simple_disable_regulator()
   3d. i2c_of_probe_simple_put_supply()


ChenYu

> > > > +     /* Ignore error if GPIO is not in output direction */
> > > > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable=
);
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

