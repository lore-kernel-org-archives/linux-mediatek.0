From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regmap: Fix the null function of format_val on
 regmap_bulk_read.
Date: Thu, 27 Aug 2015 11:06:41 +0100
Message-ID: <20150827100641.GA5313@sirena.org.uk>
References: <1440589396-696-1-git-send-email-henryc.chen@mediatek.com>
 <20150826123556.GB2977@sirena.org.uk>
 <20150826132246.GR706@pengutronix.de>
 <20150826173812.GA28760@sirena.org.uk>
 <20150827054925.GK706@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150827054925.GK706@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Henry Chen <henryc.chen@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2015 at 07:49:25AM +0200, Markus Pargmann wrote:
> On Wed, Aug 26, 2015 at 06:38:12PM +0100, Mark Brown wrote:
> > On Wed, Aug 26, 2015 at 03:22:46PM +0200, Markus Pargmann wrote:

> > > The regmap_bulk_read() function worked before the following patch:
> > > 	15b8d2c41fe5 (regmap: Fix regmap_bulk_read in BE mode)

> > Define "worked" here.

> "worked" means here that it did not run into a null pointer and returned
> something that the user expected. I am not sure if someone actually
> complained about the previous use of memcpy? I also don't know how the
> behavior of regmap_bulk_read with reg_read() is defined.

Which basically boils down to hacked something that happened to work
with the current implementation but wasn't obviously coherent - this is=20
part of the problem, the interface just happened so hasn't been thought
through.  It's not clear that defining the bit sizes at all without any
formatting makes sense, if anything I would have been expecting arrays
of unsigned integers to be being passed around since that's how we store
unformatted values in regmap.

Using memcpy() worries me because we are using memcpy() to move a value
that isn't an unsigned long out of an unsigned long and I can't convince
myself that this will be safe on big endian systems.  If we are going to
keep using the val_bits word size then we're going to need to rewrite
the values.

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV3uEwAAoJECTWi3JdVIfQX4IH/ixJFOmc9pbqAsI9O/vP16t+
GtfwjrgNZ2MNqVvewlyg209fb6D2UpkUVVrg6MNF12axI4/71wy/o3zdfESHJcPd
BB7slmJ2HStxLUKKVhjjkREylZyHGta892H1uCPmn51ntMgHz7InL7JDKaiAakrY
g97zgThgXOVJdnS6HHKS1f6mTR8wzF50Xu9SLcJXGc1yWK3ElQ5A8gleigmPOfsc
hBVPhOkHNMfPyxEE8eoi5Z7ldyNqTLMP0ASHMrnXrIPaz/OvqmiyFPZCNS1XkRy4
domKOhhvfFUWMY1Z/KDadyBqBrB3imExnXhroxeSW82EXDhiFff10XDtty52hLA=
=l4P0
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
