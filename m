Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9B2CFC299
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pkU2eRjeKvSY6f0pSdTbycrkRgeCmqTec03rjYKyF8=; b=bQlZPTKGysQCw0eacqyR5lvMxH
	o+qYGZDSMjDb3ZRG25pWS+OuwToGDQSny4Kc4jeVjkEo7RpLyIhH6imuCwjE+gkDIzut+xRK8vKzr
	wj/0urRZ2NMWqvap9O4mvUU8LowS0wzUVOI1WiYByccysf+JWDesAm6/yYaND2B27JpbiN3Dd8wj9
	r1B1AcINMtE2Y5FSzHd6gPUtzDz0jYW+o9cVlX+AKgOoGvxDHpW3IeXn6CIGcW/q0xNPBqHVWAafV
	43qHBswKzoWI5klKJaWrXC3Esucni8I0aMan23D+aPvB8WPDfnL696pdWw+bt1iWCSEgZX27vabYf
	iiZhqTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gM3-000000086vU-1NcU;
	Tue, 15 Oct 2024 12:08:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gJD-000000086WE-3ERi
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 12:06:04 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so6622524e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728993950; x=1729598750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pkU2eRjeKvSY6f0pSdTbycrkRgeCmqTec03rjYKyF8=;
        b=mwMUH6E2qdNIGAG5ksj7scDNae2NfuoBmtJyKVEoE7GdyRhnQoDU6NkIy6/FK6ZWnB
         V1c0dByqnNXr20q+vVLNUiwjxs/x4Ggx3fZei8oH3fBHVgMjpBIe7YdR6/Zus6odaHMw
         nmfIlR1Bl2NH8h8Rv6gT5OkoIUjeGytdpxoOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728993950; x=1729598750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pkU2eRjeKvSY6f0pSdTbycrkRgeCmqTec03rjYKyF8=;
        b=Zxuc2yuGg4kODzNxa+7q1xyiUT3tYzSnJGCUwXI5+BEYz9GlPuYDhAqNybiBoRjULf
         YY7/Eut/3CzOmGbMzrxJ803HV/RRGgUPbVcyw6jMgdllSGMoCBsbXn+MPJWVsajodHAs
         tbA+OSYf84RYbT9t47a1PxFH6bKzVqs/EmsKruu0AdSnznL8MnlheD0vUuoa7jgKRdWc
         rv9Tiytm5G9LCouSaXRf29Kp9M/jcssrtc97csosmyTjqAvFYwbEyXgmzXmL7hKOy7pk
         JRMkSxtMehdv3gyiIYRaedyevST9j4XwCJXtX4lRNy/LMUuKukfq9UJ4ruAW09cJC86L
         RHhw==
X-Forwarded-Encrypted: i=1; AJvYcCXWSmCqptIbZwieOO53mw3By+LcZc7+HVaobeON6/GPLMbG3NAAtEbYr/apejRxZJtR9ieIvX9roHhSxfODLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9H1ZIA8kFNocmoAM7Go7JbUcvU4jS4ntd8etxKOL0QZQvVpdq
	CJJav1T9qki4OfNvHHul9ap8IKVNw33Y6B6NN9wpbUYCay8Gkv4rBvYPFGzVoqNUgQAU50xiRu0
	jpnhypyi2bubxQwfWikk58pTswXGlYHS1082r
X-Google-Smtp-Source: AGHT+IEQXdmQdNm+HUimDjCPdKjEChhYuf8aN9wLvl2NObC3Ky9RVqgYEBecyoCudKfI+sGJ8TfqR02sf0yymk/NXVk=
X-Received: by 2002:a05:6512:3da6:b0:536:a275:9d61 with SMTP id
 2adb3069b0e04-539e551624bmr5918785e87.21.1728993949587; Tue, 15 Oct 2024
 05:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com> <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
 <Zwz-benEP4PHbRb2@smile.fi.intel.com> <CAGXv+5EwSZFoE-Uzb5x1QfknkVfd64Z_uzR0YcvZ_pR9ktGUBA@mail.gmail.com>
 <Zw5PxMOrF8Ape3if@smile.fi.intel.com>
In-Reply-To: <Zw5PxMOrF8Ape3if@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 20:05:38 +0800
Message-ID: <CAGXv+5GXVdLg8+gHTAY2ur1u35HLFqq33DLfef_P3geDr3XrMQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241015_050551_876346_99507723 
X-CRM114-Status: GOOD (  35.02  )
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

On Tue, Oct 15, 2024 at 7:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 15, 2024 at 01:31:40PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Oct 14, 2024 at 7:20=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Oct 14, 2024 at 12:06:16PM +0800, Chen-Yu Tsai wrote:
> > > > On Thu, Oct 10, 2024 at 11:20=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > > > +static void i2c_of_probe_simple_disable_gpio(struct device *de=
v, struct i2c_of_probe_simple_ctx *ctx)
> > > > > > +{
> > > > > > +     if (!ctx->gpiod)
> > > > > > +             return;
> > > > >
> > > > > Do you need this check for the future patches?
> > > >
> > > > Not sure I follow. The check is needed because this function is cal=
led
> > > > in i2c_of_probe_simple_cleanup(), but the GPIO could have been rele=
ased
> > > > earlier in i2c_of_probe_simple_cleanup_early(), and that makes this
> > > > function a no-op.
> > >
> > > Do you have a known race condition then? This is bad. You shouldn't r=
ely on
> > > the sequence of events here, or the serialisation has to be added.
> >
> > No there isn't. Explanation below.
> >
> > > > The helpers for the release side are quite short, but the ones on t=
he
> > > > request side wrap some conditional and error handling. I think it's
> > > > better to keep it symmetric?
> > >
> > > Yes, but why do you need the above check, I didn't still get...
> > > I.o.w. you think that there is a gap in time that (if no check) the G=
PIO
> > > descriptor might be changed? But then how does it affect anyway the p=
ossibility
> > > that it becomes not NULL even with the current code.
> >
> > There are two codes paths, either
> >
> >     a) successfully finding a device and enabling it, or
> >     b) exhausting all options and not finding a device, because it was
> >        optional or it is malfunctioning.
> >
> > After either code path, this cleanup function is called.
> >
> > In path (a), the GPIO descriptor is released prior to enabling the devi=
ce,
> > because the descriptor is an exclusive resource, and as soon as the dev=
ice
> > is enabled, its corresponding driver may probe and request the same GPI=
O,
> > and would fail if it was not released.
> >
> > In path (b), nothing was enabled, and the GPIO descriptor was not relea=
sed
> > early.
> >
> > The cleanup function here accounts for both cases, hence the check.
>
> Yes, but the very same check is inside gpiod_set_value(). I'm still puzzl=
ed
> about the duplication. Maybe I'm missing something...

My bad. I did not check if the GPIO descriptor API had these checks.
In that case I will drop the check in this patch.


Thanks
ChenYu

> > A step-by-step description might be clearer:
> >
> > 1. i2c_of_probe_simple_enable()
> >    ...
> >    1a. i2c_of_probe_simple_get_supply()
> >    1b. i2c_of_probe_simple_get_gpiod()
> >    1c. i2c_of_probe_simple_enable_regulator()
> >    1d. i2c_of_probe_simple_set_gpio()
> >
> > 2. Loop through potential component options and probe; if one is found:
> >    2a. i2c_of_probe_simple_cleanup_early()
> >        2a-i. i2c_of_probe_simple_put_gpiod
> >    2b. Enable device and driver's probe() gets called
> >
> > 3. i2c_of_probe_simple_cleanup()
> >    3a. i2c_of_probe_simple_disable_gpio()
> >    3b. i2c_of_probe_simple_put_gpiod()
> >    3c. i2c_of_probe_simple_disable_regulator()
> >    3d. i2c_of_probe_simple_put_supply()
> >
> > > > > > +     /* Ignore error if GPIO is not in output direction */
> > > > > > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_en=
able);
> > > > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

