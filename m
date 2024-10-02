Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DADECF31B8
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 13:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jtQ4FXFUCWol1Gkt0yViKyzB2pgtdbXcRu7N5DjSOU=; b=ssx10qV2i+3Zkpb1C9ViYPSP+1
	HdkXFdR97FJfR8RA1Qd1qQo/L+ZBUiklijk6gcg/OdvvZIMqv593KJM8k0k+tx3hes2/T9BQf839j
	gmqWQZFt1F+OL4g+66YF4PB8sgqqnf/3Y8lT0s5YXphMs8KwnXcspYRy4mv6mUmXb9nY5xlGXYplK
	yAgWjQh2ds7oAizruMgTwz0iOoF2ptT+J3UnoXc1NzRm0xaj4J+uR/mnUYqiZVpwmogf9dsKdNHAb
	toWbWjcNHd4c+KEiffd0LVJPmGNY2u3enqW1+UE2/FgzqO4JG651I58XI+w/IZjc+sxgT4yRxqv6k
	GVOIQ4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svyyY-000000061Ru-0Xle;
	Wed, 02 Oct 2024 13:01:06 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svyw4-000000060gx-21Dg
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 12:58:34 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fad784e304so26148311fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727873909; x=1728478709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jtQ4FXFUCWol1Gkt0yViKyzB2pgtdbXcRu7N5DjSOU=;
        b=wdIxxJ0mmeJw6E/c6ywP/n2377COItJ23UfqtDBwsoUoqKQiCi6RlDcR3LyZ7OGlUl
         u42ltNBV5N4Lr9wC2dmO69TkR1j7O4IjFA2GVDIJmBumwYZcVscR/BmdRiTsaRaZM6UX
         8B6S18hjyZWQ4RD/76MZRIZSwmVk0N9xtPv6TXaT6P0rY5uFtID3nwCfrMNlBdLsrGxd
         Z0MVOW7U2v1M1Mvct0FaWRYHVCHOdms1/+Djx+uxT4uH8S5PDRuEzjAuhqO+XUdFE4+A
         BjqvfsNabHkt2tGgVDSC8Lw+pCRuqFrO8sGfzMywALxvXERxlkF0fxImPCpTAvW3Z1ZI
         he4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727873909; x=1728478709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jtQ4FXFUCWol1Gkt0yViKyzB2pgtdbXcRu7N5DjSOU=;
        b=r/mo0QbR2QynlCMYKiRo6hLKPUjYAtMG3o8pset3JHVku6H2nqsX/r83sEZldtGhWy
         hYqDXPa9+jAq+yUTV37mfhTNjRSocsPdmuOLZMt2k9hcbNatk8WkbrC6oRbRLVOsYLQ4
         3L1vkScwar6JZitswfBrN/skVCTgGpbqYaXXM4SJWDFWXyiGVx8DAkdhgVHhMQYL/lEW
         bhuuUvGhN9eRDLkU7VCYpRJyp1rsPr6Mmlu5pUL1ADIzMP0YDqQ+W/IVNdT7vJUMbKE1
         w/G9//qmvChJOviERni4QNmV3Yz8knqCCntjunKfwfQ6Jh54frXkTYvIsYiUFd8240pg
         x7bg==
X-Forwarded-Encrypted: i=1; AJvYcCXNoSaBr1zFJsDk56xaL6N5B6r4dh71W2hHMoajPfaievW0qY3Rzvd4xm4IPPq/Yd+WePQuC7DmIgZUrrn1Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDEA+iE4H1xpJIrg2KZwyXz3mMfa+Lrs5P3448FTq8VIwJax9x
	WHIVHYrcz9MDYPEg/Cj28Iy4uDSR2RVTnm+7FMb1Z476D/X+FNfonNj0gmWMZOfY6QV/aAADo1I
	b+xptdRkjNv07j+d4TtiDNmTH5wO8e8FWBCHPU5gYflrHiLJvvO4=
X-Google-Smtp-Source: AGHT+IFymKX6xkCaDUcGspB/q99qwrePGX9n7ttzq0hdMpKbNdFfvpYD++sfznNvBnR4emleP82gL6p2kJe45ABDpf4=
X-Received: by 2002:a2e:be2b:0:b0:2f7:4f46:8344 with SMTP id
 38308e7fff4ca-2fae1029a1bmr17813371fa.21.1727873909295; Wed, 02 Oct 2024
 05:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
 <20240911-en7581-pinctrl-v4-4-60ac93d760bb@kernel.org> <CACRpkdZbyQ5bk8oR+Q4UmQCdM5h1mF1ztBc26YzqNsze_B=ehA@mail.gmail.com>
 <ZvKQe73ZKIFy4fny@lore-desk>
In-Reply-To: <ZvKQe73ZKIFy4fny@lore-desk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 14:58:17 +0200
Message-ID: <CACRpkdbXWMU+wq6DvviCQPQ0EzKUm9oOnyFh34Bm=Y8K-HmT0Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] pinctrl: airoha: Add support for EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_055832_552581_3573541C 
X-CRM114-Status: GOOD (  29.87  )
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

Hi Lorenzo,

so these comments:

On Tue, Sep 24, 2024 at 12:12=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.o=
rg> wrote:

> > > +#include <linux/pinctrl/consumer.h>
> >
> > Why do you need the consumer header?
>
> we need it for pinctrl_gpio_direction_output() and
> pinctrl_gpio_direction_input() for direction_input and direction_output
> callbacks.

I looked it over again and it looks good, I was just confused.

> > > +               arg =3D airoha_pinctrl_gpio_get_direction(pinctrl, gp=
io);
> >
> > I don't see why a pin would have to exist in a GPIO range in order to
> > be set as output or input?
> >
> > Can't you just set up the pin as requested and not care whether
> > it has a corresponding GPIO range?
> >
> > Is it over-reuse of the GPIO code? I'd say just set up the pin instead.
>
> Do you mean to get rid of PIN_CONFIG_OUTPUT_ENABLE, PIN_CONFIG_INPUT_ENAB=
LE
> (and even PIN_CONFIG_OUTPUT in airoha_pinconf_set()) here?
> E.g. we need PIN_CONFIG_OUTPUT_ENABLE to enable pwm for pwm-leds:

I was mainly thinking that the
airoha_pinctrl_gpio_get_direction() is limited to pins that are
used for GPIO.

The callback should be usable on any pins, no matter if they
can be muxed to GPIO or not?

> &mfd {
>         ...
>         pio: pinctrl {
>                 ...
>                 pwm_gpio18_idx10_pins: pwm-gpio18-idx10-pins {
>                         function =3D "pwm";
>                         pins =3D "gpio18";
>                         output-enable;
>                 };
>         };
> };

Like this one.

Which I think works.

It's the name of the function which confuses me:
airoha_pinctrl_gpio_get_direction() and anything else that
is used directly from the airoha_pinconf_set() function
doesn't really care if the pin is used as GPIO or not does
it?

Can you rename the functions just e.g. airoha_pinctrl_get_direction()
because it has nothing to do with GPIO. It's jus pin control.

Also some defines are confusing this way:

+       /* set output enable */
+       mask =3D BIT(gpio % AIROHA_GPIO_BANK_SIZE);
+       index =3D gpio / AIROHA_GPIO_BANK_SIZE;
+       airoha_pinctrl_rmw(pinctrl, pinctrl->gpiochip.out[index],
+                          mask, !input ? mask : 0);

Variables named "gpio" and AIROHA_GPIO_BANK_SIZE despite
it is used for pins that are not (in the Linux sense) GPIO all the time.
This is a big confusion for the mind.

Can you rename the variable from "gpio" to "pin" or so
and the AIROHA_GPIO_BANK_SIZE to AIROHA_PIN_BANK_SIZE
etc so it is clear what is going on?

I understand that the datasheet might be talking about
"GPIO this and GPIO that" but what hardware engineers mean
with GPIO is something else than what Linux mean: for them
it means "it can be muxed so it is kinda-general-purpose-kinda"
but in Linux this has a strict meaning: it can be used by the
gpiolib to control individual lines.

I think this would make it easier for me (and possibly others)
ton understand the driver.

Yours,
Linus Walleij

