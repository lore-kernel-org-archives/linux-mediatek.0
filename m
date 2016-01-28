From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Thu, 28 Jan 2016 11:38:40 +0000
Message-ID: <20160128113840.GA6078@sirena.org.uk>
References: <1453896059-44589-1-git-send-email-blogic@openwrt.org>
 <1453896059-44589-2-git-send-email-blogic@openwrt.org>
 <20160127144105.GQ6042@sirena.org.uk>
 <1453965401.19407.18.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453965401.19407.18.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: John Crispin <blogic@openwrt.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2016 at 03:16:41PM +0800, Henry Chen wrote:
> On Wed, 2016-01-27 at 14:41 +0000, Mark Brown wrote:

> > No, drivers should *never* enable things that weren't explictly enabled
> > by the machine constraints.  This misses the whole point of having
> > constraints.  They are there so that the system integrator can enable
> > the functionality that is safe on a given board. =20

> Okay..the constrains should be define on device tree.
> But which optional properties was suitable to fill on device tree if cons=
umers want to call
> regulator_set_mode directly ?
> I have check the of_regulator.c and not found the suitable property name =
which can set valid_modes_mask & valid_ops_mask.

If you need to change the mode at runtime you will need to develop a
binding for that, there isn't one at present.

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWqf26AAoJECTWi3JdVIfQE/gH/04puRWHiekNaA3j9V8AHaT+
zVmzu9a9A3uFxrqEBcLiFbxwZ1C8gelB7PaQFR/L/Tusmmp4xlQYEfSfzabppDXc
GJw7eGQAsxjlt223EjkCi62DNJXenXzkVqqf8u1jGh1PXHN+S7C5sr99n9LbI9jp
NEp049vpKWVymJy0iw8T7YOHWQRRtYmy7QswsII//4u3gxDJ8tLCLmHZN4ymGHW0
puvnSQYYeLdGRgFMOTnuKU+6uvQ4EHCC5CrcQKLWxUbrkPLkyPnzjmI9nbWmeVUu
LUkFxf3O6FB2anDCHR96rgKGsPfJW+ZlVgreKyxJj8xvqNixomGGZ1ZRbQS5fGs=
=/asa
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
