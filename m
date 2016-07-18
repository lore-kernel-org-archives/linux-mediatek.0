From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V9 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Mon, 18 Jul 2016 13:16:38 +0100
Message-ID: <20160718121638.GT30372@sirena.org.uk>
References: <1468843741-59637-1-git-send-email-john@phrozen.org>
 <1468843741-59637-2-git-send-email-john@phrozen.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="flpRHSNNLnUanxKW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468843741-59637-2-git-send-email-john@phrozen.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <john@phrozen.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Chen Zhong <chen.zhong@mediatek.com>, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org


--flpRHSNNLnUanxKW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 18, 2016 at 02:09:01PM +0200, John Crispin wrote:

> Changes in V9
> * drop compatible string from devicetree

Are you sure?

> +static const struct of_device_id mt6323_of_match[] = {
> +	{ .compatible = "mediatek,mt6323-regulator", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mt6323_of_match);
> +
> +static struct platform_driver mt6323_regulator_driver = {
> +	.driver = {
> +		.name = "mt6323-regulator",
> +		.of_match_table = of_match_ptr(mt6323_of_match),

--flpRHSNNLnUanxKW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXjMijAAoJECTWi3JdVIfQg+cH/2+yOhY8WFydJ5xagLvIxcvJ
QicUMr9ANnXzbqmlQzP6cmfedyOX4JqWW4/U6CTPNq28gwvqk0JszytVl0dJ3Ub5
DF9uVHlX5Hy0WMq8IuO9gWgUADGc8II63DJ43S5tKIgErsTY7O9xVkwP36Hmqprk
Cg4ZQ3UunJVqeTShDF54Bk3v01p4Omdf5uOrYDayofY7vLlTSS2QDHj7qX3dOjYd
HiOj7cBoKHExBnIVvQv02na1xFb4PdSVWGtIk4IS4ZpfKuh1Qbsn4lVs2WmHvc1f
gL7z25HAWv7tWdyMEih+mfnYB/O5bYGVnYcLdoGLeIctICnL6FGZ/Q7CHdHPxCM=
=izDP
-----END PGP SIGNATURE-----

--flpRHSNNLnUanxKW--
