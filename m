From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Fri, 29 Jan 2016 00:13:06 +0100
Message-ID: <20160128231306.GD4130@sirena.org.uk>
References: <1453896059-44589-1-git-send-email-blogic@openwrt.org>
 <1453896059-44589-2-git-send-email-blogic@openwrt.org>
 <20160127144105.GQ6042@sirena.org.uk>
 <56AA5A5C.9080402@openwrt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56AA5A5C.9080402@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, HenryC Chen =?utf-8?B?KOmZs+W7uuixqik=?= <HenryC.Chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 28, 2016 at 07:13:48PM +0100, John Crispin wrote:

> would the following two bindings be ok ? I would create patches to add them.

> * regulator-allow-mode; or regulator-allow-change-mode;

This seems redundant, if we have a list of valid modes presumably they
can be used - same idea as with voltage setting.

> * regulator-modes = <REGULATOR_MODE_NORMAL REGULATOR_MODE_STANDBY>;

I'm not convinced this binding makes sense, how would a user of the API
(currently there are none in tree) know what the modes mean?  It's a bit
different when the user is supplying configuration for a specific
regulator but this needs to be something that can be used by consumers.

What are you actually trying to do with this?

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWqqCBAAoJECTWi3JdVIfQMygH/Avl7NgcybqAMKGmvX2F2RJI
WWCIYMnclibZD+dqnbazVdOCX1PtzlfRyC+oninbi5Lbo+bpTxI2wJsCUvYayOJs
6q9dIUH3QK4kMou+ryJMNcXj34rriiq5hfcqxbM46VoIkyoRTl+Fn6EQMYtmZr3n
4vFGpKOg+Jb0WlUR+VoyEFTQVhgcGEfwnZK0BPj13tj/kuOGywlZkE8Qq9QV25E+
TZosBE02lVE8jnVn8dugz05t1TsBO/LjXe2D7cHWR+rVQULILRYL/bAbko3VGDhg
cnrnnz3mdMNmzFkv1yBjao5qUzuvRTOegcc3zM0KNaFQNM2EplkxzBC9mbItO0o=
=K1eG
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
