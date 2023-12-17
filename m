Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71645C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Dec 2023 14:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7up0xNh2ORIiEUbqH50P1CWetD6TUmJxMwpCW1gSaUg=; b=Pko9ldtxxqrnbMXQtxWSfdVK7K
	ZcLKGTDMa+dUJ/tex82/rr3JmHIgdZAKtZ1JI1hASz8zW24PLUTU8/809bWBvWWQFrAxYcweHHqa/
	+e9HnYFXJLnBghDsbiWPoSJ9+FESfRc67hZrngSM8rXIyWIqY3q4UqL76vD7aCwaCD3n77/fgNHED
	9dtezThoNGZPq5Gp+XJiamxtqnEag0ijAO1OsMaSec64L+kKT3pNZgUDb6AUgrx3WXzxE4kg0obft
	g7PDuPgexkstQcz2BpDX0jZrx9W2TFjLzYdIHgTRHOwohFVV50AbH6BZmu2utVXPp2z3zAV1RpYi+
	zpeImPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEsMk-007yxw-05;
	Sun, 17 Dec 2023 14:43:38 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEsMg-007yuI-0n;
	Sun, 17 Dec 2023 14:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1702824208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7up0xNh2ORIiEUbqH50P1CWetD6TUmJxMwpCW1gSaUg=;
	b=QFc0hG3cmXDMi3vrAYkSLc6BdDem19p8J1FM6D82oDIWr/84AKpWtkks6/DQwUZKr4KSci
	OuW+zMEoP0YFfK03Yl0nGn5VmsaxudxMw8KsIhRvTHtNlOlF1RXb71RG5cmjwuj+cqS6H/
	uh9RrmXCiT55qFgDCBcB3GP3RfoYN1s=
Message-ID: <9cbaf60cd6cf1a581e7587088f71ca7cf6b6ff37.camel@crapouillou.net>
Subject: Re: [PATCH v5 03/13] pinctrl: ingenic: Use C99 initializers in
 PINCTRL_PIN_GROUP()
From: Paul Cercueil <paul@crapouillou.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>,  Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Jianlong Huang
 <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng
 <aisheng.dong@nxp.com>,  Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,  Pengutronix Kernel
 Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, NXP
 Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, Lakshmi
 Sowjanya D <lakshmi.sowjanya.d@intel.com>, Emil Renner Berthing
 <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>
Date: Sun, 17 Dec 2023 15:43:24 +0100
In-Reply-To: <ZXmv81bJRMqB1GLY@smile.fi.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
	 <20231211190321.307330-4-andriy.shevchenko@linux.intel.com>
	 <fb29c3bca8d245e3f7496539b7293aa4fc4bccd0.camel@crapouillou.net>
	 <ZXmv81bJRMqB1GLY@smile.fi.intel.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
	YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_064334_468864_F35577DB 
X-CRM114-Status: GOOD (  13.93  )
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

Hi Andy,

Le mercredi 13 d=C3=A9cembre 2023 =C3=A0 15:21 +0200, Andy Shevchenko a =C3=
=A9crit=C2=A0:
> On Wed, Dec 13, 2023 at 10:55:46AM +0100, Paul Cercueil wrote:
> > Le lundi 11 d=C3=A9cembre 2023 =C3=A0 20:57 +0200, Andy Shevchenko a =
=C3=A9crit=C2=A0:
>=20
> ...
>=20
> > > -#define INGENIC_PIN_GROUP(name, id, func)		\
> > > -	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
> > > +#define INGENIC_PIN_GROUP(_name_, id,
> > > func)						\
> > > +	{						=09
> > > 			\
> > > +		.name =3D
> > > _name_,								\
> > > +		.pins =3D
> > > id##_pins,							\
> > > +		.num_pins =3D
> > > ARRAY_SIZE(id##_pins),					\
> > > +		.data =3D (void
> > > *)func,							\
> > > +	}
> >=20
> > This INGENIC_PIN_GROUP() macro doesn't need to be modified, does
> > it?
>=20
> We can go either way. I prefer to go this way as it reduces level of
> indirections in the macros. It makes code easier to read and
> understand.
> But if you insist, I can drop that change in next version.
>=20

I like the patches to be minimal. But I understand your point of view
as well.

If you have to issue a v6, maybe state the reason why you also modify
INGENIC_PIN_GROUP() then. But I don't care enough to request a v6 just
for that.

So:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

