Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10341C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 09:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+HmVsDuBIhTnQ3h74DZlY56wXteNP9nmlC6Nh/oirA=; b=5DpeHU8fbB8Qxo5Pr2EyalHE7R
	xpoVXd7vs++EwVMxfI0iM8R9Q6qGaZXvaUTyG649JEGBFDu88C/1yHY7mGPuAJsZHYZWxGcCdSY36
	4+b1427eqC52o9Mu5Qaw1MMNaw/i3iDzholIvehdu1aFmR729w6iy2JmXFKRwY3BBfyWLQJeFke9X
	X85eOUE463dGyJRcpmqwiX8uP8NSQpS+GwybCSfv9ty+C4708AwLnBFUHhiGAQSHwu28GLkpPthFK
	e+fYiOjOpRrQ7ou4OEMRA6PCK6MZyUZNh7rKihsm0toKLDqUYRtFMBw1sVtmQqF4HgMVX6fv4fKug
	ox18OiHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWLf-00FHun-J3; Thu, 02 Feb 2023 09:57:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWLc-00FHsQ-98
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 09:57:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pNWLZ-0003iF-0v; Thu, 02 Feb 2023 10:57:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pNWLV-0028n0-Kn; Thu, 02 Feb 2023 10:57:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pNWLW-000FIW-35; Thu, 02 Feb 2023 10:57:34 +0100
Date: Thu, 2 Feb 2023 10:57:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] dt-bindings: pwm: mediatek: add mediatek,mt7986
 compatible
Message-ID: <20230202095733.kxh6jd5hbshhif44@pengutronix.de>
References: <70fe0b606d988958b87f89828b8728e2f68eaace.1675278958.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3poqg5miyhldfntw"
Content-Disposition: inline
In-Reply-To: <70fe0b606d988958b87f89828b8728e2f68eaace.1675278958.git.daniel@makrotopia.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_015740_341863_53B58981 
X-CRM114-Status: GOOD (  18.35  )
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


--3poqg5miyhldfntw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 01, 2023 at 07:25:57PM +0000, Daniel Golle wrote:
> Since commit 241eab76657f ("pwm: mediatek: Add support for MT7986")
> support for the 2 PWM channels implemented in MediaTek MT7986 SoCs has
> been added. Also add the compatible string to dt-bindings now that
> they have been converted to YAML.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> This patch has previously been submitted, but we decided to deferr it unt=
il
> after the conversion to YAML which has now been done via commit
> 3e98855ca0cf ("dt-bindings: pwm: mediatek: Convert pwm-mediatek to DT sch=
ema")
> See
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/Y39PjU1BqB=
B8tZ98@makrotopia.org/

This commit is currently in next via the pwm tree. The easy options are
to take this commit via pwm, too, or wait till after tne next merge
window. I'm fine with the former.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3poqg5miyhldfntw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPbiQsACgkQwfwUeK3K
7AlZ/gf/XACbTC/ZQ+pLRP3fBdP2VMUoE1IWhrk00585yb1RqQMiq8Kp8jfUmkFc
8l5dcZiy2aEjptXOwByAO4T5KM9C7H9ZP5NbnYw/3mHVfVqOr3U3MhuJJmvrLCjP
bSctRudAHd10YGnkRA+55M9NSn5m8+6+444BteN9X/uXCmHI9hEjexHkMdN3Kq1n
FaGvY8/j8mNSsgnWjbFL+eXnKO19LRd1ELyWkQRpDmip34dMrwgnqiPezT3Q/LMl
yVZYYn+kkEXWqN/ygUj4qappZlcDj8B7WN3Ra15PgVBa2Rw9yfm+EObxCz0Fv78F
ykzP/+WqqBkq8Vg8uIMdOk2Jw6EC4w==
=O5cl
-----END PGP SIGNATURE-----

--3poqg5miyhldfntw--

