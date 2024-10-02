Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D06CF6D38
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkX61cC3QpXIRyRJREd1yW2LST86RDBhSSr1EMAYgow=; b=x1/Gifn8oEy7OPN17KKRtwzaaY
	b3j4RPx+aIYunqN8suG78MBxjIBX9cthdbfw5JYcLv6UimdJ638kly66KhdagrbH9OqgzvWLWT0mZ
	MwDc4cqB8ILp0rAIYk3L1fSmhhiLg3V/UrylmwaivwQng3clmzWF4I+do8gTtL/KMkyYir5tXH3vI
	RQg1GqDD3gW8tT4bBkmWLdvO3/P3pid0/uqXBbvO45ib/+Bl53NPBDGe3K2DOpxAg8RK5JiTHVOrq
	fdRlbaCllx1Tu8+UT6GRe4I+G4hwJflqfoWrvhx9VDoDtqJGqQ21sidfVkq4Tfw33hTwbiFHeBCJJ
	lJB1cn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1R7-00000006iAa-2GPp;
	Wed, 02 Oct 2024 15:38:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1P7-00000006haE-3BXC;
	Wed, 02 Oct 2024 15:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04CC85C3E58;
	Wed,  2 Oct 2024 15:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D213C4CEC2;
	Wed,  2 Oct 2024 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727883400;
	bh=lctykuC46Ge7cuFFtl6NptKvP7roRa2TVOdlVGRKfOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hT+ODeYzFnlF1CUJBWx1Do8y0KPikbSGpiRD2R0pveI9OLpJe7FQrQ3tH3z3liut8
	 Rughfacwz7VjJNYXlaJgGWABfehCH8SHe3MFgXXN8V7BZmXBgMMY8WhQ8/Wv0o79Tg
	 +pS3gKsghJftIkEU7pRQDy9EluO8SFACY7UNFYjPJ3jKfGJ9BtNv5GX3r2Or+BIpkQ
	 HpYM+wUM9tjKRIl92wEIku/IhiF/77jJ+K4/rRkqgVn5m6cEaO6Xpy7aiDttwN0Oy2
	 yg/Du//UebEzY6udF7tNlyVemf67kiuQ4vzckwQ1ZMdttPtQVJEWyN6lp0hrJoeLyR
	 GOSw30bTmXi2g==
Date: Wed, 2 Oct 2024 17:36:38 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 4/5] pinctrl: airoha: Add support for EN7581 SoC
Message-ID: <Zv1ohibsTelBBMc9@lore-desk>
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
 <20240911-en7581-pinctrl-v4-4-60ac93d760bb@kernel.org>
 <CACRpkdZbyQ5bk8oR+Q4UmQCdM5h1mF1ztBc26YzqNsze_B=ehA@mail.gmail.com>
 <ZvKQe73ZKIFy4fny@lore-desk>
 <CACRpkdbXWMU+wq6DvviCQPQ0EzKUm9oOnyFh34Bm=Y8K-HmT0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Llyx+/6l0oTvjiz"
Content-Disposition: inline
In-Reply-To: <CACRpkdbXWMU+wq6DvviCQPQ0EzKUm9oOnyFh34Bm=Y8K-HmT0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_083641_913061_20819C86 
X-CRM114-Status: GOOD (  40.30  )
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


--8Llyx+/6l0oTvjiz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> so these comments:
>=20
> On Tue, Sep 24, 2024 at 12:12=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel=
=2Eorg> wrote:
>=20
> > > > +#include <linux/pinctrl/consumer.h>
> > >
> > > Why do you need the consumer header?
> >
> > we need it for pinctrl_gpio_direction_output() and
> > pinctrl_gpio_direction_input() for direction_input and direction_output
> > callbacks.
>=20
> I looked it over again and it looks good, I was just confused.

ack, no worries.

>=20
> > > > +               arg =3D airoha_pinctrl_gpio_get_direction(pinctrl, =
gpio);
> > >
> > > I don't see why a pin would have to exist in a GPIO range in order to
> > > be set as output or input?
> > >
> > > Can't you just set up the pin as requested and not care whether
> > > it has a corresponding GPIO range?
> > >
> > > Is it over-reuse of the GPIO code? I'd say just set up the pin instea=
d.
> >
> > Do you mean to get rid of PIN_CONFIG_OUTPUT_ENABLE, PIN_CONFIG_INPUT_EN=
ABLE
> > (and even PIN_CONFIG_OUTPUT in airoha_pinconf_set()) here?
> > E.g. we need PIN_CONFIG_OUTPUT_ENABLE to enable pwm for pwm-leds:
>=20
> I was mainly thinking that the
> airoha_pinctrl_gpio_get_direction() is limited to pins that are
> used for GPIO.
>=20
> The callback should be usable on any pins, no matter if they
> can be muxed to GPIO or not?
>=20
> > &mfd {
> >         ...
> >         pio: pinctrl {
> >                 ...
> >                 pwm_gpio18_idx10_pins: pwm-gpio18-idx10-pins {
> >                         function =3D "pwm";
> >                         pins =3D "gpio18";
> >                         output-enable;
> >                 };
> >         };
> > };
>=20
> Like this one.
>=20
> Which I think works.
>=20
> It's the name of the function which confuses me:
> airoha_pinctrl_gpio_get_direction() and anything else that
> is used directly from the airoha_pinconf_set() function
> doesn't really care if the pin is used as GPIO or not does
> it?
>=20
> Can you rename the functions just e.g. airoha_pinctrl_get_direction()
> because it has nothing to do with GPIO. It's jus pin control.

ack, I will do in v6

>=20
> Also some defines are confusing this way:
>=20
> +       /* set output enable */
> +       mask =3D BIT(gpio % AIROHA_GPIO_BANK_SIZE);
> +       index =3D gpio / AIROHA_GPIO_BANK_SIZE;
> +       airoha_pinctrl_rmw(pinctrl, pinctrl->gpiochip.out[index],
> +                          mask, !input ? mask : 0);
>=20
> Variables named "gpio" and AIROHA_GPIO_BANK_SIZE despite
> it is used for pins that are not (in the Linux sense) GPIO all the time.
> This is a big confusion for the mind.
>=20
> Can you rename the variable from "gpio" to "pin" or so
> and the AIROHA_GPIO_BANK_SIZE to AIROHA_PIN_BANK_SIZE
> etc so it is clear what is going on?

ack, I will do in v6

>=20
> I understand that the datasheet might be talking about
> "GPIO this and GPIO that" but what hardware engineers mean
> with GPIO is something else than what Linux mean: for them
> it means "it can be muxed so it is kinda-general-purpose-kinda"
> but in Linux this has a strict meaning: it can be used by the
> gpiolib to control individual lines.
>=20
> I think this would make it easier for me (and possibly others)
> ton understand the driver.

ack.

Regards,
Lorenzo

>=20
> Yours,
> Linus Walleij

--8Llyx+/6l0oTvjiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZv1ohgAKCRA6cBh0uS2t
rH+tAQDVCYAU8i0rHVxzYHBy1Ru8GILe3Gh2kkzSc5/XbFIkzQD/d6b4CDLvoUdk
uGizF04DYikQfU5iZjLOTvNb53Wy3w4=
=cKW5
-----END PGP SIGNATURE-----

--8Llyx+/6l0oTvjiz--

