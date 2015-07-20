From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regmap: Add function check before called format_val
Date: Mon, 20 Jul 2015 16:02:54 +0100
Message-ID: <20150720150254.GC11162@sirena.org.uk>
References: <1437396110-5192-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0/F9k67mP4yWSR/A"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437396110-5192-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org


--0/F9k67mP4yWSR/A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 08:41:50PM +0800, Henry Chen wrote:
> The regmap_format will not be initialize since regmap_bus is not assgined=
=20
> on regmap_init(). It should has a function check before using=20
> format_val() to avoid null function called on regmap_bulk_read().

> -			map->format.format_val(val + (i * val_bytes), ival, 0);
> +			if (map->format.format_val)
> +				map->format.format_val(val + (i * val_bytes), ival, 0);
> +			else
> +				memcpy(val + (i * val_bytes), &ival, val_bytes);

Your changelog doesn't explan why we are in this code path in the first
place without a format_val() and why a memcpy() is an appropriate
replacement.  It should, it's not clear to me that this is a good fix
but I don't feel I fully understand the problem.

--0/F9k67mP4yWSR/A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVrQ2eAAoJECTWi3JdVIfQVjcH/RGqQYxD6WlraewRRDOxDDGe
VV9NyVvDwHHYFhlBf82yu/3w/eWjWfVcyHFZ48Hulli6p38fZ2gsnb/g/hlOE/Ki
Qy2yokw1AEcLh8ltFJFks6H0BxAXNFIQSUVipiOh2ybA8OqSA0cMlwmiA3mxsvIV
dj/flmnXwN0ywEtaUaTx3t5M6/ilMXHkDzzzTG/8a3RQ72XERrF4I29T3FvznyV8
jX5RT5Cc2x+jU/GpLEWkDsPD/rQ6vcrST4LoOi1xvi8UowGU5EL1DLq/oBOXvhTZ
JuMz/U7e+KjrHTycw5zO2OzMygfDWGEUTmbuoBQurxW9G41fKnUXPR5+bnj9Zus=
=K91+
-----END PGP SIGNATURE-----

--0/F9k67mP4yWSR/A--
