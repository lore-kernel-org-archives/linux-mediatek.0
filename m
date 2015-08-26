From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regmap: Fix the null function of format_val on
 regmap_bulk_read.
Date: Wed, 26 Aug 2015 18:38:12 +0100
Message-ID: <20150826173812.GA28760@sirena.org.uk>
References: <1440589396-696-1-git-send-email-henryc.chen@mediatek.com>
 <20150826123556.GB2977@sirena.org.uk>
 <20150826132246.GR706@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150826132246.GR706@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Henry Chen <henryc.chen@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2015 at 03:22:46PM +0200, Markus Pargmann wrote:
> On Wed, Aug 26, 2015 at 01:35:56PM +0100, Mark Brown wrote:
> > On Wed, Aug 26, 2015 at 07:43:16PM +0800, Henry Chen wrote:

> > Why are these format functions sensible?  Converting a null pointer
> > dereference into data corruption wouldn't be ideal.  The commit message
> > should really cover this.

> The regmap_bulk_read() function worked before the following patch:
> 	15b8d2c41fe5 (regmap: Fix regmap_bulk_read in BE mode)

Define "worked" here.

> As far as I can see this patch fixes this issue by using simple format
> functions. Before the above mentioned patch, the code used memcpy. Now
> regmap_format_*_native is used which should result in the same behaviour
> but fixes the null pointer.

Again, this sort of analysis needs to be in the commit message (and
really ought to explain why the resulting API makes sense).

> I am not sure if there are other locations in the code where format_val
> is used in this setup so I don't know if this would change behavior in a
> different codepath.

Which is another part of the concern, being able to format values is a
more general concept.

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV3fmDAAoJECTWi3JdVIfQJ+MH/jaYpMAae+JCFkX3zpFwfKC7
8CgCZxubehdEaW1KINDCAZiT6jc4vya91GCU+6AMkHhFmtALzEXY2kmO4R4sryH9
LKtjyFNGiOFyGd+0CeEara2g4IwEpYBwjtuzDSX+TYk2J0SfoNM1adfQzM8rL/zd
XMF7ggt71lxT2MmCmQHYNmKDLzdBkB6fMevs/npDkyDk4879WE8sWj3uTrYyUdCa
o9VIATtymn1tbP8JsXd9q7BIj7M4Ygy9J7/Y15EpGG74FH5jGx3cc0CNRqWeH0iR
ffJfZPSNI9Rih/eIOnKNdP0MDZOLO42ieMWMTtJBlUmsBFvaEeJwrqdlJOAR6Ek=
=swpF
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
