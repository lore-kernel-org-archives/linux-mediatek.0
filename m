From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH] regmap: Fix the null function of format_val on
 regmap_bulk_read.
Date: Wed, 26 Aug 2015 15:22:46 +0200
Message-ID: <20150826132246.GR706@pengutronix.de>
References: <1440589396-696-1-git-send-email-henryc.chen@mediatek.com>
 <20150826123556.GB2977@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6eUvXotnMb6+obQB"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150826123556.GB2977@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Henry Chen <henryc.chen@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--6eUvXotnMb6+obQB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 01:35:56PM +0100, Mark Brown wrote:
> On Wed, Aug 26, 2015 at 07:43:16PM +0800, Henry Chen wrote:
> > The regmap_format will not be initialize if device driver not declare t=
he regmap_bus
> > when registering the regmap. To avoid the null function of format_val w=
hen
> > called regmap_bulk_read(). It need to give a format function when regma=
p init.
>=20
> > Call trace:
> > [<          (null)>]           (null)
> > [<ffffffc0004cbdd0>] mtk_rtc_read_time+0x9c/0x134
> > [<ffffffc0004c9618>] __rtc_read_time.isra.3+0x40/0x7c
> > [<ffffffc0004c9688>] rtc_read_time+0x34/0x58
>=20
> Please don't paste entire backtraces in, they're enormous and tend to
> obscure the actual content while adding little value.  If needed then
> edited highlights work better.  I'm fairly sure I've mentioned this
> before...
>=20
> > @@ -783,8 +783,22 @@ struct regmap *regmap_init(struct device *dev,
> >  		map->defer_caching =3D true;
> >  		map->reg_write =3D _regmap_bus_raw_write;
> >  	}
> > +/*
> > + * For bulk read, need to hook the format function.
> > + */
> > +simple_format_initialization:
>=20
> The indentation is all messed up here, we're misssing a blank line and
> the comment is not indented.
>=20
> > -skip_format_initialization:
> > +	switch (config->val_bits) {
> > +		case 8:
> > +			map->format.format_val =3D regmap_format_8;
> > +			break;
> > +		case 16:
> > +			map->format.format_val =3D regmap_format_16_native;
> > +			break;
> > +		case 32:
> > +			map->format.format_val =3D regmap_format_32_native;
> > +			break;
> > +	}
>=20
> Why are these format functions sensible?  Converting a null pointer
> dereference into data corruption wouldn't be ideal.  The commit message
> should really cover this.

The regmap_bulk_read() function worked before the following patch:
	15b8d2c41fe5 (regmap: Fix regmap_bulk_read in BE mode)

As far as I can see this patch fixes this issue by using simple format
functions. Before the above mentioned patch, the code used memcpy. Now
regmap_format_*_native is used which should result in the same behaviour
but fixes the null pointer.

I am not sure if there are other locations in the code where format_val
is used in this setup so I don't know if this would change behavior in a
different codepath.

Best regards,

Markus

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--6eUvXotnMb6+obQB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV3b2mAAoJEEpcgKtcEGQQ83UQALyspSqpZAAiI550NPMdaUYB
XZRKuAbrmPPr4EYvYjeQY61+IEsRDc4y+f0c1yNeGWmbosRcjOTDUbHgWM3rSiYK
tjHwEU/o8m7OVsFEn07souRKRnsFceZQYyecgvIbz259SMcdirnO7gLr1Hbex0w2
rRRF/aOK9/2GlntNhuHFWPE/UtMdImiDEN3xrDKvHebgHxJXHAf6OAHrUE8Dw+8O
jjDf+iterX4mMHPKAhPsM9XORJnzYUQ5Jf40XBq62ssHmfqhDpf5bdRn4i9Av6si
9lDI5IJB0labwJnWxmEHVmy/FdybSYAO9qO+eQ1MKKAvi98kVFjISNoXYqa4WvJ9
aaqPImwFzmUXM3LSbXMPEgikS0YPw/hREmLrSEVW50vsCJXTJS9zxrGejw+MMTfu
Xi2QRiET6WGXe20sln+rA9Fp1ZmBBAVfZx+moa14jHBkOBMCBH5PUQIQZj0hfdLv
fsUnvkrwuovygeVmrpGMJxkyx+d04psYxomZy+rc7pqg6vhDqg86/EJBZ5Vi9JMc
qPDPA9XFU6JXnDRgT1jAoWz28msBg8le7aAq1Sk16aAWEg/BahjpNtzj+jnId9FF
1M+U3llatvyP17BGPNeJhiPs0uufJ8gnjA6RDo2FFOeMq30skLGL7mSKLdoTt2f4
wHMLY1J/qA+jwbvxFKlq
=FX9t
-----END PGP SIGNATURE-----

--6eUvXotnMb6+obQB--
