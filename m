Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AD2CFC268
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 05:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HWrH+K7cTgTjTPYZ+dL7fGmCBNocSiDK/Hn2JY2vEs=; b=kU2lnRG/exEoC90Sn8Xt4nbhZ5
	jssTxwEaxdZe1PorTMEnRNgY9lm6YP8p7arRo9USgqn1NPgC4IeaxIm8iEXbCv/98QZ8SpobyvHC+
	iff1jidOGUrLXPEjc8/+KFNeLtmPUE09Ky2mbDpxKnEWTUIheiraog6DEwNnzZCr+rc9n6x42Z6DH
	4adeNxN9xsrePlewPmsBNSn7FMIlPsTzRuNUmpGYis86+TvVJD2pttyXAPbclplIr9RvP88I76heP
	y02z7l29OSWKQadsnTOt5X+uWHzGfDG/MyqfxdHHCiEUX4oRc7rQ9AYyMsGCrxIBz16x5IVKt96AN
	ZzWTLaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0aEU-000000077Ll-1MtZ;
	Tue, 15 Oct 2024 05:36:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0aD3-0000000779Z-1llC
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 05:35:06 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539e690479cso2599186e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728970503; x=1729575303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HWrH+K7cTgTjTPYZ+dL7fGmCBNocSiDK/Hn2JY2vEs=;
        b=n4N9GT+oiFJIu+6hEFkVLyPUiRiTGuR2qvoC/K4T93/cn9UTwRcfS9/QU7stab1EiN
         Rha4HE2Mzk4IOxgxRrTdbQigrqyGOKiK8Hd2lOMH7y1qxGr1JZhf+lfXVVp697AA0rGW
         6OvAT/Xk0kzvXg5pgngMMY73OGY2f6BB/biLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728970503; x=1729575303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HWrH+K7cTgTjTPYZ+dL7fGmCBNocSiDK/Hn2JY2vEs=;
        b=trMxj+2IzpgqU0p2yNNt/JDyXk12jJW5U0LdtxLPayIJtzWyb+6pTTlYiR2Zj8q/6V
         /Xfk6KYzq7BiPNtYv0PGKIuGqGLMVJm/igY33h3XLDbCY1Zp1PlKCJ8peSnaMFhZUcd4
         0v2JwILL6qjd72wle1Bd2xNb6lOyrZ4hoS9d58MgJ+5fHrrXyU/5in4Nf0zdnxDYtYT3
         b1t0JdG46+KzaCBTQPizuylGf8xnxj7/FKPRrQCEVmTgRP5OVWWopELiqFmjooB3VuZ4
         ieyiooXMbeTXnwgtMWs56mUiKUOyNvTOLW5xLL+j5vAX+FBwLzmw3ayplpVY5rA2Ujs3
         rycQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIV+4PNmV8w3+ogrykGlL+bmO68JNz8wGwjiaqvsOPCNyFRWNfi5YiRDwqL/k+zLRTgmrkquomatIM13O8ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfc1gkhmpB0+ZP8sbSs1nE+meJMA7hw1aB54378xPxP1/X+ntJ
	d0fjPVFVvXiei4k+W5+e1Dx4t0ZfHshaQP5UY2LM+O25Xl2qVM/UEWbwr7it4BjMJIny//CCl8S
	pyJ00+BhlQj4gLgkRZ4rr69lqhevlJxamqC9l
X-Google-Smtp-Source: AGHT+IE/CwxLRzqmXVYjkMDrcTm2+DQg9NcGd7Zyw9exDfJ8teYEZF+svaLAA8rUa5571DxzVoiZK6455ROycmYsGCQ=
X-Received: by 2002:a05:6512:1598:b0:539:9155:e8d4 with SMTP id
 2adb3069b0e04-539e54d77ecmr4621333e87.8.1728970503111; Mon, 14 Oct 2024
 22:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com> <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
 <Zwz-benEP4PHbRb2@smile.fi.intel.com>
In-Reply-To: <Zwz-benEP4PHbRb2@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 13:34:52 +0800
Message-ID: <CAGXv+5HtDqf9MbGc53axP276fFA6riM85+Sa7nXHPvZcCb5-Pg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241014_223505_479723_F48D6D35 
X-CRM114-Status: GOOD (  37.58  )
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
>
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
>
> > The helpers for the release side are quite short, but the ones on the
> > request side wrap some conditional and error handling. I think it's
> > better to keep it symmetric?
>
> Yes, but why do you need the above check, I didn't still get...
> I.o.w. you think that there is a gap in time that (if no check) the GPIO
> descriptor might be changed? But then how does it affect anyway the possi=
bility
> that it becomes not NULL even with the current code.

The opposite actually. Either it is always NULL, or it was initially valid,
but the early cleanup function released it and thus it became NULL by the
time this function gets called.

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

