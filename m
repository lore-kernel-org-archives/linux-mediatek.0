From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: mt6397: convert to arch_initcall
Date: Wed, 23 Dec 2015 12:00:19 +0000
Message-ID: <20151223120019.GU16023@sirena.org.uk>
References: <1450865768-10317-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XSEVMyPRvc8xgDhM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450865768-10317-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org


--XSEVMyPRvc8xgDhM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 23, 2015 at 06:16:08PM +0800, Henry Chen wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> Due to some device may need reulator operation in earlier boot time like gpu module which
> power domain need regulator power on first. Move regulator of mt6397
> initialization earlier in boot so that real devices can use regulator
> without probe deferring.

Several problems here.  One is that we usually use subsys_initcall() for
working around the known broken subsystems here, why have you decided to
go for arch_initcall() instead.  Another is that you're saying this is
for GPUs but I'm not aware of any reason why GPUs are broken and we
should not be introducing new problems here - what's going on?

--XSEVMyPRvc8xgDhM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWeozSAAoJECTWi3JdVIfQAtYH/30r69nH1m4kYrP4Noovawwc
8+WXP3TjxDUFck+vIFgNqcZ3mlbrRTCwe4UGAsN9Ogv8H8asiRVMPdrUCxS6CpQm
jF23rljOUxEiqxlRQ7r+UKXBHxqDEgBn+H4HO6tLmkgVM3QVSZmB18GAJNiFT/Ga
VodV+OkAIzR6gC3kl/gNKSsTwcowMYDKZ++FM9aS11Q/rxk9573gP51fSVo9IEKn
LJ7T1Xh6qgm3NT6AB88oge7Wcsm0LSmnRiP2e93mjUBfDd9j4V3KNYgTum/AapAp
NJcxYH5qs4vZ/t26mqX0NmGYisyUBZrodegbAZzWbho+hI+7peNncvMYoSmfDVA=
=omNx
-----END PGP SIGNATURE-----

--XSEVMyPRvc8xgDhM--
