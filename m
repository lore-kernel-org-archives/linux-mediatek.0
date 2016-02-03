From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Wed, 3 Feb 2016 12:29:52 +0000
Message-ID: <20160203122952.GF4455@sirena.org.uk>
References: <1453896059-44589-1-git-send-email-blogic@openwrt.org>
 <1453896059-44589-2-git-send-email-blogic@openwrt.org>
 <20160127144105.GQ6042@sirena.org.uk>
 <56AA5A5C.9080402@openwrt.org>
 <20160128231306.GD4130@sirena.org.uk>
 <1454061134.10861.14.camel@mtksdaap41>
 <20160129112717.GP4130@sirena.org.uk>
 <1454069479.10861.30.camel@mtksdaap41>
 <20160202193839.GX4455@sirena.org.uk>
 <1454477942.31375.32.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XLR3b0NScy54cC0V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454477942.31375.32.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: menghui lin <menghui.lin@mediatek.com>
Cc: linux-kernel@vger.kernel.org, HenryC Chen =?utf-8?B?KOmZs+W7uuixqik=?= <HenryC.Chen@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, linux-arm-kernel@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org


--XLR3b0NScy54cC0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 03, 2016 at 01:39:02PM +0800, menghui lin wrote:
> On Tue, 2016-02-02 at 19:38 +0000, Mark Brown wrote:

> > How does the driver know if it needs to change the mode (ie, how can it
> > tell if the current mode is inadequate) and surely if we can only change
> > in one direction this isn't terribly useful?

> I think the datasheet of buck/ldo could provide information about power
> capability of each mode. The driver should adjust regulator mode per its
> device's power requirement.

That's of no help for a consumer driver which doesn't know what
regulator is supplying it.

> case 1:

> We have a USB typeC micro-controller, which has two modes - standby and
> normal. It requires 1.8V and 3.3V to operate (both powers are always
> on). The device stays in standby mode when there is no cable in. When
> cable in, we got an interrupt and change device into normal mode.

> The standby mode power consumption is quite small, so we would like the
> change mode of regulator into STANDBY to save more power. And we change
> into NORMAL when we receive cable-in interrupt.

This seems like something that we ought to be doing via runtime PM
anyway which should be going through the suspend mode bindings, though
that would need some plumbing in.

> case 2:

> About buck regulator for CPU, it usually provides PWM mode, PWM/PFM Auto
> mode, PFM mode. I think it could map to FAST, NORMAL, IDLE mode
> respectively. Most of time we would use just normal mode. However, we
> would change regulator into PWM mode time to time to test buck output
> performance on the tested board.

That's a test use that doesn't seem a good fit for upstream at all.

--XLR3b0NScy54cC0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWsfK/AAoJECTWi3JdVIfQjYYH/jJt/lPXTkCzdoZFulfkCC0q
ICcaYssyAN1nkOgZJ5AnurBU02rQWTEMCYzssanI4c1H+QccDO5uieeUYjwWrqdd
fRIHrglkxWS473ZPlI9ZFdaMN2o6Mxhy+xGMaVjmDBwIR66X7E0CMR+96X2Jzajh
HGZKbkL2PjlWhwNuUxdwR8ndHHkvpFhb9rn88mnkUUg+JL9gAwDM8/4vqFlnG8pZ
qjdKawW6S/TgNcb5NIokFv+puIf+Ijn0O003OnoQiWo9a1ObeVPGLNSEe3eew3Ot
yFrNnAfd0xG0xaB6t0O6vNnMEqVepuVt2NHWAVzOIwNnescUCcsjrHm5pNrmCSY=
=R5+I
-----END PGP SIGNATURE-----

--XLR3b0NScy54cC0V--
