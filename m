From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V5 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Tue, 9 Feb 2016 12:36:49 +0000
Message-ID: <20160209123649.GD13270@sirena.org.uk>
References: <1454874037-38905-1-git-send-email-blogic@openwrt.org>
 <1454874037-38905-2-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sgneBHv3152wZ8jf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454874037-38905-2-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, chen.zhong@mediatek.com, HenryC.Chen@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--sgneBHv3152wZ8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 07, 2016 at 08:40:37PM +0100, John Crispin wrote:

> * remove the code allows mode changes

That was excessive, there's no problem having set_mode() operations and
we can currently use them for static configurations.

--sgneBHv3152wZ8jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWud1gAAoJECTWi3JdVIfQjj8H/Rswb1vyckQEerGRS62dLpNu
PGvy3RDMFTkLhM+vERCIvWvFARh8PcKZ0QlnNhyCsspZV3pJzFwR6kFsSqExXz5T
aL5rTpLQuJEY47yOyrGI8v2ELQvprNzfdH0YKIPqknj1jBNa0lBDEi96S4DzMzeq
os8BAN7IhwflZ/3+QoLhC0PxdXlSAWvpM9MTHStyb1nKghwoUeCv+0nRmqtgmp2p
ON1jKAEnYyx0tutcavznNgVGLJVPXtnPgh4ntp7kvAp66sc+tePrpyf1JPppXlxV
N5UW1UgNLU7dO/sO5wSnvbvwNrMNUKD5esZgZYJqwKO8moP78chB7pjQDWGAX+A=
=hP3Y
-----END PGP SIGNATURE-----

--sgneBHv3152wZ8jf--
