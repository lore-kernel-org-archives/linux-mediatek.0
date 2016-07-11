From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V8 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Mon, 11 Jul 2016 22:12:35 +0100
Message-ID: <20160711211235.GB9976@sirena.org.uk>
References: <1468240179-7558-1-git-send-email-john@phrozen.org>
 <1468240179-7558-2-git-send-email-john@phrozen.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468240179-7558-2-git-send-email-john@phrozen.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <john@phrozen.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Chen Zhong <chen.zhong@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 11, 2016 at 02:29:39PM +0200, John Crispin wrote:

> +static const struct of_device_id mt6323_of_match[] = {
> +	{ .compatible = "mediatek,mt6323-regulator", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mt6323_of_match);

This may have been answered last time but I don't remember - why is
there a compatible string for this device in the DT?  Surely we already
know that the regulators for the mt6323 are present by virtue of the
fact that we know that the core mt6323 is present in the system?
Indeed, looking at the now merged MFD code it appears that this is
in fact the case so we could just not have a compatible and perhaps this
was just an oversight.  This is good because it means we're not encoding
the specific way Linux instantiates devices into the DT.

Otherwise this does look good.

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXhAvCAAoJECTWi3JdVIfQuokH/RuZOTGynp7Z4mnBvT8SpybP
ZSS2so9V40HJ/K1q5w17d6wuZiIAYQwOV26bgcGSfAbC223W9BhBwABF9bq9nQZf
k6aJfRCs3KvWxJ8vQ6o4YcpAc4MhWUPbbxmmm6/B7EOzu+l5rPCDmxxc+10d61OF
bySzJRuy1NYJan1AN6Up5XFQJYY7fBewauF+lZTGfpCaGXEikwnNwrmzdMbZF3I8
G53jj4Qtsi2jg5NCVm0bWaTh8dpoKmowqiIl6jlRMj81fbx6KorCh18U6z5UxcXR
wj8A9sKydkjHs6dSk+Qw7y7KNfeVH7YnugRgJkAi9ysWO8sG3jebDFduqU7Qoao=
=SdQg
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
