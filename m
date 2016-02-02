From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Tue, 2 Feb 2016 19:38:39 +0000
Message-ID: <20160202193839.GX4455@sirena.org.uk>
References: <1453896059-44589-1-git-send-email-blogic@openwrt.org>
 <1453896059-44589-2-git-send-email-blogic@openwrt.org>
 <20160127144105.GQ6042@sirena.org.uk>
 <56AA5A5C.9080402@openwrt.org>
 <20160128231306.GD4130@sirena.org.uk>
 <1454061134.10861.14.camel@mtksdaap41>
 <20160129112717.GP4130@sirena.org.uk>
 <1454069479.10861.30.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AFjAQ8ujNJnIGHaX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454069479.10861.30.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: menghui lin <menghui.lin@mediatek.com>
Cc: John Crispin <blogic@openwrt.org>, Liam Girdwood <lgirdwood@gmail.com>, HenryC Chen =?utf-8?B?KOmZs+W7uuixqik=?= <HenryC.Chen@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--AFjAQ8ujNJnIGHaX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 29, 2016 at 08:11:19PM +0800, menghui lin wrote:
> On Fri, 2016-01-29 at 12:27 +0100, Mark Brown wrote:

> > None of this is answering my question - I know what the current API is,
> > describing it doesn't tell me about actual users or how they are able to
> > sensibly use the interface.  Bear in mind that the definitions of the
> > various modes are all relative and what one device thinks is high usage
> > may be low usage for another device.

> Assuming valid_modes_mask and initial_mode are specified, a possible
> way to modify regulator_set_mode() is to allow mode change only if the
> regulator is controlled exclusively by a certain consumer or the
> requested mode provides stronger power capability than current mode.
> Here I assume that power capability fast > normal > idle > standby.

How does the driver know if it needs to change the mode (ie, how can it
tell if the current mode is inadequate) and surely if we can only change
in one direction this isn't terribly useful?

--AFjAQ8ujNJnIGHaX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWsQW+AAoJECTWi3JdVIfQS9QH/0y/TL4CoNcTtm5kdsN4+irO
9fszW5OaCkavgfERM2I71wE5uNv2q+UXG6jfRFeO9DIJY7Xueux5eRERcl6/S11b
iqV5VbRQ43XmrKYqSX96TZgFIYQ1i8uwSWFxnrKTwKt9fyt6gYR91+4/USwq8KN2
Ke1uvsUNP+jAIxusi4l0CNX2IR+PrBFdCgj+qieHJ9TpSuf4+VQ1ccRBI5GUPy5y
O5sjSfcFJiIndCZyy2dPTkt2LRQJvmQOyUfpieHRwHGaYTH87Onyv2i4JjP4E/ak
czUDG1Wuve3WYoZZODZ8esvY7Wt5ovjAeg45r0EGfzciwR7Hc8HE1uJvj8/W4z0=
=YPTr
-----END PGP SIGNATURE-----

--AFjAQ8ujNJnIGHaX--
