From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] regulator: MT6311: Add support for MT6311 regulator
Date: Mon, 20 Jul 2015 18:31:53 +0100
Message-ID: <20150720173153.GH11162@sirena.org.uk>
References: <1437377793-31558-1-git-send-email-henryc.chen@mediatek.com>
 <1437377793-31558-3-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4CWDppHhC4Mjf/wW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437377793-31558-3-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org


--4CWDppHhC4Mjf/wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 03:36:33PM +0800, Henry Chen wrote:

> @@ -460,6 +460,15 @@ config REGULATOR_MT6397
>  	  This driver supports the control of different power rails of device
>  	  through regulator interface.
> =20
> +config REGULATOR_MT6311
> +	tristate "MediaTek MT6311 PMIC"

Please keep these files sorted, MT6311 should be before MT6397.

> +static struct mt6311_pdata *mt6311_parse_regulators_dt(
> +		struct device *dev)
> +{
> +	struct mt6311_pdata *pdata;
> +	struct device_node *node;
> +	int i, num, n;
> +
> +	node =3D of_get_child_by_name(dev->of_node, "regulators");
> +	if (!node) {
> +		dev_err(dev, "regulators node not found\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	num =3D of_regulator_match(dev, node, mt6311_matches,
> +				 ARRAY_SIZE(mt6311_matches));

Please convert this to use the modern method of specifying the regulator
DT bindings by providing of_match and regulators_node in the
regulator_desc so the core does the mapping for yand regulators_node in
the regulator_desc so the core does the mapping for yand regulators_node
in the regulator_desc so the core does the mapping for yand
regulators_node in the regulator_desc so the core does the mapping for
you and you can delete the DT handling code.

Otherwise this driver looks good.

--4CWDppHhC4Mjf/wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVrTCIAAoJECTWi3JdVIfQwQcH/jNzF+W90E3EW2zhhAL/zuf3
tB3Ja2hWt6duARJmVOX9CKum0/wcEcNg7Lodz8w79f58APLSHDb6AVJiIMmYDF1V
nCUnJlkVCNjbKJNY0SJlMIjj6rcv4b1xfH6KcoSltCJd2PL+sKDs7LaPKaMasXhQ
14dYEWAyntUFnQsGvCO0fvZa69gTxvMsDZ9DKOvYYdPdRsGtuGyKaHqv1hixo6aZ
dMzh2cKuXCagTzjycpc97beZLMmGZemawgLfyNG/LEWpsNrfSS2XE/N5NGcKLbpM
16c77j8Uaip/hjDjbBPiH7hNlMC3ZDDA2u3YyQGIxxFAUwR0zYKIPF412GfIf/M=
=qP36
-----END PGP SIGNATURE-----

--4CWDppHhC4Mjf/wW--
