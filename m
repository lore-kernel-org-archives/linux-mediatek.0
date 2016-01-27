From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Wed, 27 Jan 2016 14:41:05 +0000
Message-ID: <20160127144105.GQ6042@sirena.org.uk>
References: <1453896059-44589-1-git-send-email-blogic@openwrt.org>
 <1453896059-44589-2-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oDto3OTLsk6uOlQH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453896059-44589-2-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--oDto3OTLsk6uOlQH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2016 at 01:00:59PM +0100, John Crispin wrote:

> +		/* Constrain board-specific capabilities according to what
> +		 * this driver and the chip itself can actually do.
> +		 */
> +		c =3D rdev->constraints;
> +		c->valid_modes_mask |=3D REGULATOR_MODE_NORMAL |
> +				       REGULATOR_MODE_STANDBY;
> +		c->valid_ops_mask |=3D REGULATOR_CHANGE_MODE;

No, drivers should *never* enable things that weren't explictly enabled
by the machine constraints.  This misses the whole point of having
constraints.  They are there so that the system integrator can enable
the functionality that is safe on a given board. =20

The comment is also inaccurate, it claims it's imposing constraints but
in fact it's adding additional permissions.

--oDto3OTLsk6uOlQH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWqNcAAAoJECTWi3JdVIfQRMQH/jQtT0eQKuCw/Whu0z9TlKYb
fVPSsWnDxZnACBT2Pl3Ii8Z5c/AP+JJovpqa33HPGGUA23rdtQWaN4r32fUJFElV
akysJGDrq8Mb93XLsjCwRKDWq307j+xH8fX1wbSyHogjvfx0/q61mtWQ+jXdqsCT
l66uLPtHPS+sVu4K18jjxQmoh+yv1hDNu2sWO6+Ar5X8IhZ58Dt8qzdFj0yaKhxw
kSB0YmsbXnI9TiXFylPafVNTPMAicSZL1+qTVzB+NIAxtRhcLHu6WchGLd2GIjNF
QH41GvQMPEEi6WXzXJepV8xizdnbf4jtM2wAYE+Qz9CStsU32eDpArV1rOnZ4mU=
=CCQI
-----END PGP SIGNATURE-----

--oDto3OTLsk6uOlQH--
