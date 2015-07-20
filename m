From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add document for MT6311 regulator
Date: Mon, 20 Jul 2015 18:28:28 +0100
Message-ID: <20150720172828.GG11162@sirena.org.uk>
References: <1437377793-31558-1-git-send-email-henryc.chen@mediatek.com>
 <1437377793-31558-2-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bZoop4wcDAgjdd6S"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437377793-31558-2-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org


--bZoop4wcDAgjdd6S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 20, 2015 at 03:36:32PM +0800, Henry Chen wrote:

> +Required properties:
> +- compatible: "mediatek,mt6311-regulator"
> +- mt6311regulator: List of regulators provided by this controller. It is named
> +  to VDVFS and VBIASN.

Why this weird property name?  It looks like it might just be a typo and
should just be "regulator"?

Please use subject lines reflecting the style for the subsystem, it
helps people find patches that are relevant to them.

--bZoop4wcDAgjdd6S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVrS+7AAoJECTWi3JdVIfQpYUH/0V+vQnBl78mOAq+W+tr4KUH
vLhI96uPHvtpDsleQ4zIQQdnfMqX9Nf13iD0V7jqANqvfCDc6c+13zE5G0QF8bZw
qgBN2ErAsyfcXxeUKoJ74fyqjz7DsiLDONchMMn/gh+j4s5FVArQ3qk/EmiCsGle
zDace7/5h8cbZRmE8DolhonA6RUQZWFs2AuY5qSMSHpMSSkCBcAotD99OYL1QqDs
P7he3kmCSGSA32XJMPk/XGrZ8BPjWkyhTmV50IDF+dFmJ0cCbvesQ9Vn6y49L9MH
ggh/975FZhe/TZLCa/HJ1wtf/xkR19TcYD2ZkkCPR3TrZn54T0yNgWm2O8p90Lc=
=v6ns
-----END PGP SIGNATURE-----

--bZoop4wcDAgjdd6S--
