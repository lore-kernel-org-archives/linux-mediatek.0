Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C61C64EC4
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Mar 2023 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxanJpe3mY17ns7RAH8qLuV8oIzCxvB+fwHL7pxBp9Q=; b=zX+7xURB+ZJMBuDT6jOhshTHAe
	k5/P4YYcnWaYATwdNhNdozzSCRhpivQuAFcxLMMun+kBO0WxpkXAQV31tnERguANmTx6jxmlXkD2z
	G3mEzfAuhwWXov3MWeJUftxbdnNkz1iU6Ax8dzAyB4VDVCa0f0nwV6zalT1048QL0y9bEIvEKJY0Z
	vYK/UZVHQwHgeSF+AKx/YSF9W8VPxQtViJuRWt90tdrI7rZ9DX9XlkwgclARBieViiEy0NyszOHdh
	v6rVwBtA954RX43I/4RrQEqE+WyBjkJYgjZUwAPTmwz6XrFu0BF2WlWyTF08dn+SIQ/CyZaymA6TP
	SOXkxKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYOyV-008lBS-Ua; Sat, 04 Mar 2023 10:18:47 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYOyR-008lAg-9L
	for linux-mediatek@lists.infradead.org; Sat, 04 Mar 2023 10:18:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYOyB-0006Z6-CZ; Sat, 04 Mar 2023 11:18:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYOy9-001lQT-BQ; Sat, 04 Mar 2023 11:18:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYOy8-0025Pj-IL; Sat, 04 Mar 2023 11:18:24 +0100
Date: Sat, 4 Mar 2023 11:18:24 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lorenz Brun <lorenz@brun.one>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pwm: mediatek: support inverted polarity
Message-ID: <20230304101824.ja7otxatkrrv2xxq@pengutronix.de>
References: <20230303205821.2285418-1-lorenz@brun.one>
 <20230303211725.7wtxdxjqpxlrp77b@pengutronix.de>
 <J6UYQR.PWF59DFFYYO71@brun.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gtzva4fuv4iy5elv"
Content-Disposition: inline
In-Reply-To: <J6UYQR.PWF59DFFYYO71@brun.one>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_021843_349769_0B4F5C3C 
X-CRM114-Status: GOOD (  27.43  )
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


--gtzva4fuv4iy5elv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lorenz,

On Fri, Mar 03, 2023 at 11:23:07PM +0100, Lorenz Brun wrote:
> On Fri, Mar 3 2023 at 22:17:25 +01:00:00, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Fri, Mar 03, 2023 at 09:58:21PM +0100, Lorenz Brun wrote:
> > >  According to the MT7986 Reference Manual the Mediatek  PWM
> > > controller
> > >  doesn't appear to have support for inverted polarity.
> > >=20
> > >  This implements the same solution as in pwm-meson and just inverts
> > > the
> > >  duty cycle instead, which results in the same outcome.
> >=20
> > This idea is broken. This was recently discussed on the linux-pwm list
> > and I hope will be fixed soon. See
> > https://lore.kernel.org/linux-pwm/20230228093911.bh2sbp4tyfir2z5g@pengu=
tronix.de/T/#meda75ffbd4ef2048991ea2cd091c0c14b1bb09c2
> >=20
> Is the issue here emulating PWM_POLARITY_INVERSED by inverting the period=
 or
> the overflow issues?
> This driver currently rejects PWM_POLARITY_INVERSED, but the problem is t=
hat
> I have a board which inverts the output of the PWM peripheral (low-side
> MOSFET for higher-voltage open-drain output), thus I need to set the PWM
> node to output an inverted signal so that the final open-drain output
> behaves correctly as the signal has been inverted twice now.
>=20
> In my specific case this logic could also be added to pwm-fan, but this
> would lead to more complexity there as this type of circuit is generally
> handled by the PWM driver.

The issue is clear, and I'm sure the motivation was similar for meson.

However just inverting duty_cycle might hurt consumers who rely on
actually inversed polarity.

There is an approach available: You could implement support for
=2Eusage_power. However I don't like that concept because its semantic is
unclear (but in the past there is no agreement about that betweeen
Thierry and me).

My favourite would be to add a u64 duty_offset to struct pwm_state that
would allow to request something like:

       ________          ________          ________
   ___/        \________/        \________/        \______
   ^                 ^                 ^                 ^
   <->                duty_offset
      <------->       duty_cycle
   <----------------> period

Then todays requests would be equivalent to .duty_offset =3D 0, and
drivers would be advised to implement the biggest duty_offset not bigger
than requested (i.e. similar to how period and duty_cycle work).

This could even replace .polarity by setting .duty_offset =3D .period -
=2Eduty_cycle. And a consumer who doesn't care about polarity but only
about percentage of the active time during a period could signal that by
=2Eduty_offset =3D .period (or .period - 1?).

Of course that would be a bigger effort.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gtzva4fuv4iy5elv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQDGu0ACgkQwfwUeK3K
7AmsnAf/fWQuuTY0c+1r1b43FElwpoyXMnsuq1QzKB5KQRU60v/Z2fTek2f8fy0A
f+0KbZCb+OGdv6V0Ct83X41A4tIYWGDVs1dJYX6ZxbGFbaCWZ6dRIU/P9qpni2BO
3ezvTFrtY75hX6mrXNlEAmOG7oliIyw4vcSA+J4uR3z+lg8xNuj8/EVaWv1UVo8l
n8uUfImwADeST1FTJqTZnWTXywWoITc4Cql5ITWn+ZAmCTfTGBOkc3v1hvta7rOs
vBoIajVUbbL9QU9m/uuKaBk/YRLiuIIBxVdrNgV+RzY0mG3w/EpfSdXVVDPmz7vd
1pZRniBxLaHUN7aoSwm50Uczd6/UvA==
=Q76Z
-----END PGP SIGNATURE-----

--gtzva4fuv4iy5elv--

