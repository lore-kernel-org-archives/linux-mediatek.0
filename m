From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH] regmap: Fix the null function of format_val on
 regmap_bulk_read.
Date: Thu, 27 Aug 2015 07:49:25 +0200
Message-ID: <20150827054925.GK706@pengutronix.de>
References: <1440589396-696-1-git-send-email-henryc.chen@mediatek.com>
 <20150826123556.GB2977@sirena.org.uk>
 <20150826132246.GR706@pengutronix.de>
 <20150826173812.GA28760@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CRjAHycgiaTQGSqU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150826173812.GA28760@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Henry Chen <henryc.chen@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--CRjAHycgiaTQGSqU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 06:38:12PM +0100, Mark Brown wrote:
> On Wed, Aug 26, 2015 at 03:22:46PM +0200, Markus Pargmann wrote:
> > On Wed, Aug 26, 2015 at 01:35:56PM +0100, Mark Brown wrote:
> > > On Wed, Aug 26, 2015 at 07:43:16PM +0800, Henry Chen wrote:
>=20
> > > Why are these format functions sensible?  Converting a null pointer
> > > dereference into data corruption wouldn't be ideal.  The commit messa=
ge
> > > should really cover this.
>=20
> > The regmap_bulk_read() function worked before the following patch:
> > 	15b8d2c41fe5 (regmap: Fix regmap_bulk_read in BE mode)
>=20
> Define "worked" here.

"worked" means here that it did not run into a null pointer and returned
something that the user expected. I am not sure if someone actually
complained about the previous use of memcpy? I also don't know how the
behavior of regmap_bulk_read with reg_read() is defined.

Best Regards,

Markus

>=20
> > As far as I can see this patch fixes this issue by using simple format
> > functions. Before the above mentioned patch, the code used memcpy. Now
> > regmap_format_*_native is used which should result in the same behaviour
> > but fixes the null pointer.
>=20
> Again, this sort of analysis needs to be in the commit message (and
> really ought to explain why the resulting API makes sense).
>=20
> > I am not sure if there are other locations in the code where format_val
> > is used in this setup so I don't know if this would change behavior in a
> > different codepath.
>=20
> Which is another part of the concern, being able to format values is a
> more general concept.



--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--CRjAHycgiaTQGSqU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV3qTlAAoJEEpcgKtcEGQQzxAP/i95jPQHbq2iDk0TvCuEKYhM
BpJmxdnJ+djq9QAzHCUoJzWo7lxvgWWxVmK8Wq6AzZZhrGlxA2mrHGeXrHWqzGs9
V17Dk+KY0kgnnAgjpnPAYA1Q2RHrcryh4ifXv4TRFRLID4SoTt0O/HeBFKlq9TT+
qRvc5drQkKhzDnMRifv2w7tHYh+3ipFNZVJeo5cD30dxqNjg3aZCQxDIKBXAno+H
Op3AODIqoVez4KGeOb2PkOCB0N4HTmoqfboV9PP6wLHiXouwR/6jlat52+kLwGIv
nAJzWWQe8gfiynoKIX3s1aip4wGzuq0vQl3U3cOCE6U+GT4X2kpjW8PLeNBLFEgX
FA74/nsuB+nx5ekmywMAY/E7a2pXDiahVTLESTR6Y2lFdoyceiRbNoDTYNLtON/s
O7sU/LWCAPar6D3zaTPILhJNQtOGVFwW90ZuEH1wzIrukQ+PpK/7dRLD7ZFdZL+D
1FyYm8bm1tr8385bxciLMH7kqQScMi+CSvMPACs6a7AA3NynGK1gfWgklHRYubTY
rSsfWOjV0qWxuoffABNzBnYQE5ZmBDZ2yBniNePQpPcL6wIUvKrvXM2QjchUYZPb
qOnzx7mMET1p05jMmnyQCve1AzjTvd1g02Ob+OelKyx8lYW+lYCRnwUGXBiUPVMe
dmAZ8sPszSiL2WQrXLtY
=MEEn
-----END PGP SIGNATURE-----

--CRjAHycgiaTQGSqU--
