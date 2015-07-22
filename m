From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regmap: Add function check before called format_val
Date: Wed, 22 Jul 2015 18:00:23 +0100
Message-ID: <20150722170023.GZ11162@sirena.org.uk>
References: <1437396110-5192-1-git-send-email-henryc.chen@mediatek.com>
 <20150720150254.GC11162@sirena.org.uk>
 <1437458845.30329.51.camel@mtksdaap41>
 <20150721172550.GY11162@sirena.org.uk>
 <1437575494.30329.80.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lxO5ObTDWtTXup1c"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437575494.30329.80.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <HenryC.Chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org


--lxO5ObTDWtTXup1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2015 at 10:31:34PM +0800, Henry Chen wrote:
> On Tue, 2015-07-21 at 18:25 +0100, Mark Brown wrote:

> > OK, so the issue here is that when we fall back to regmap_read() we may
> > do so because we have reg_read() and reg_write() functions which in turn
> > imply no formatting.  The expectation here is that val must be an array
> > of int.  The code doesn't completely take that into account though and
> > the user you're pointing at is assuming it's an array of 16 bit values
> > which isn't totally unreasonable if it did specify val_bits (we don't
> > check for that).

> So, could I call regmap_bulk_read() on rtc-mt6307.c, should I need to
> change it ?

It should be fine but you may need to change to pass an array of
unsigned int instead of an array of u16 in.

> > > Maybe it was not the good fix for this, but should be a problem need to
> > > be reported, or should I need to give the regmap_bus on mtk_pmic_wrap.c?

> > That file isn't in mainline...

> oh...it's mtk-pmic-wrap.c, sorry about that.

Found it - thanks.

> > memcpy() is definitely not a safe way to move from an unsigned int to a
> > u16 which is what your specific use case is trying to do.  I'll need to
> > do an audit of existing users (or someone else will!) to figure out what
> > people are doing with .val_bits in drivers using reg_read() and
> > reg_write() but I think what we should be doing here is probably
> > providing appropriate conversion functions based on val_bits on init.

> Ok, got it, memcpy() should not be used here anymore.

Right.  We just need to do a survey of existing users and figure out
what the least disruptive format function to provide is.  That way we
don't have to special case other code that uses formatting.

--lxO5ObTDWtTXup1c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVr8wmAAoJECTWi3JdVIfQJoQH/j83QCjShnEpMc0TrqcJljQX
bAoTmvntMPCQiL+jSQ31zIvI8IfjgaV576CD/NS/xp7YRvXpw3rXHNc8FT0owKkX
/jZMtu3VadzR8WRkL/N/zNIpF6cPNeqoryeja751L/Uu1EnQiC48LBmOdddi1sFt
RFHZyq7dfztF01NOsFXPa55PPo5l2gA/fOELmEl314zTQMN4idp/TlEu7+wr2Gpg
7qH1FgcHZ5KZuK8ydynnETrLSWs3MDAO3/oAaIwX91BOsdv5JtzCMxmw80KfKm6j
c0wZ+J5hK3C/yPt219oaE5/BMW5SXeWmB4lDm9dCd6T5tvS9jE8eq9lF/TyWzPA=
=+5e2
-----END PGP SIGNATURE-----

--lxO5ObTDWtTXup1c--
