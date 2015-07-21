From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regmap: Add function check before called format_val
Date: Tue, 21 Jul 2015 18:25:50 +0100
Message-ID: <20150721172550.GY11162@sirena.org.uk>
References: <1437396110-5192-1-git-send-email-henryc.chen@mediatek.com>
 <20150720150254.GC11162@sirena.org.uk>
 <1437458845.30329.51.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PY/rPkhrd1AhCo36"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437458845.30329.51.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <HenryC.Chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org


--PY/rPkhrd1AhCo36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2015 at 02:07:25PM +0800, Henry Chen wrote:

> Then in driver rtc-mt6397.c, it used regmap_bulk_read() to get the time
> of PMIC, and hit the null function of format_val(), because the
> regmap_bus was null.

> It skipped the initialization of format_val() because bus == null, but
> called the format_val() at regmap_bulk_read() if bus == null.

OK, so the issue here is that when we fall back to regmap_read() we may
do so because we have reg_read() and reg_write() functions which in turn
imply no formatting.  The expectation here is that val must be an array
of int.  The code doesn't completely take that into account though and
the user you're pointing at is assuming it's an array of 16 bit values
which isn't totally unreasonable if it did specify val_bits (we don't
check for that).

> Maybe it was not the good fix for this, but should be a problem need to
> be reported, or should I need to give the regmap_bus on mtk_pmic_wrap.c?

That file isn't in mainline...

memcpy() is definitely not a safe way to move from an unsigned int to a
u16 which is what your specific use case is trying to do.  I'll need to
do an audit of existing users (or someone else will!) to figure out what
people are doing with .val_bits in drivers using reg_read() and
reg_write() but I think what we should be doing here is probably
providing appropriate conversion functions based on val_bits on init.

--PY/rPkhrd1AhCo36
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVroCdAAoJECTWi3JdVIfQHKkH/jM1rCvNDRkTQiyESaGth9Vo
8UCZm8sroSdWi1mjKWHuyNQwKnSy6OGYgqqlch6H2WPSIBLc7V3bJ01PwxqPkjzE
x0sRSesPXVqXtzDLYXvqOtW+YkVXzstXr6SF37Dsa8w3/xls21/fDthOA1ROOjEl
Ok7bVJHbaswNMhFNS/rlsTtzBtH3yNd5aFyET+SjrSXeqfhApU4NgIvZwF7I+TTk
FcTqm9ehZhE/qJYbtNeTh2gqPp9+zhM63Cegwip8h59cqL8tHaxW/zugRdBJOItj
Xe1dStN7kt+NdpLLLOlS2bhP2B7pkNGUCdMA/E9QY1+dDqSUDGjdk4rcdyS5pik=
=7K9i
-----END PGP SIGNATURE-----

--PY/rPkhrd1AhCo36--
