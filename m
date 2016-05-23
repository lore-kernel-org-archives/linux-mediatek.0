From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: mt6397: Constify struct regulator_ops
Date: Mon, 23 May 2016 12:32:22 +0100
Message-ID: <20160523113222.GT8206@sirena.org.uk>
References: <1463988616-18803-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RlgFhasKO3bfRJ5j"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463988616-18803-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org


--RlgFhasKO3bfRJ5j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 23, 2016 at 03:30:16PM +0800, Henry Chen wrote:
> Consitify the structure of regulator operations.

Oh, actually the mode setting patch does apply but it depends on this
one (which was sent after...).  It would have been better to send a
patch series for the driver and separately a patch series for the core,
the driver changes are orthogonal to the core ones here.

--RlgFhasKO3bfRJ5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXQupGAAoJECTWi3JdVIfQJEwH/1+Or2O49A/lNVHmMznerZDt
Oa6ZnLL5hIiHnSHcP87+7WbIV8z8iZcxDNfxI/k8d5qPaOL6ZmrMgbPyegAmLPZL
s1kXAio4FxfQfOdWrWGnp/mLeKMkVi0aYPVEPy5FH1lYTvd0axihEwbnCEJBes8z
GFBU1mZB8VyN0YfItCO4JS/re/6e8DrFayfN8n1L+tuvZAsEJwfpntvGXcLMFn42
9A8S4waagyDYipoV+yiHtXLXBXcv/srbQprV5fiPkyZAegHA4tVm0i0YS1NiFJ2i
tjh7FBqqhMIy9j5yeFBJu2BNUv3R9z6sTV1mlGIUNW4CQFSGkmwsl3b5syQnipE=
=PwmK
-----END PGP SIGNATURE-----

--RlgFhasKO3bfRJ5j--
