From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Fri, 29 Jan 2016 12:27:17 +0100
Message-ID: <20160129112717.GP4130@sirena.org.uk>
References: <1453896059-44589-1-git-send-email-blogic@openwrt.org>
 <1453896059-44589-2-git-send-email-blogic@openwrt.org>
 <20160127144105.GQ6042@sirena.org.uk>
 <56AA5A5C.9080402@openwrt.org>
 <20160128231306.GD4130@sirena.org.uk>
 <1454061134.10861.14.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AFQGHouA0VN8Ovbt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454061134.10861.14.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: menghui lin <menghui.lin@mediatek.com>
Cc: John Crispin <blogic@openwrt.org>, Liam Girdwood <lgirdwood@gmail.com>, HenryC Chen =?utf-8?B?KOmZs+W7uuixqik=?= <HenryC.Chen@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--AFQGHouA0VN8Ovbt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 29, 2016 at 05:52:14PM +0800, menghui lin wrote:
> On Fri, 2016-01-29 at 00:13 +0100, Mark Brown wrote:

> > I'm not convinced this binding makes sense, how would a user of the API
> > (currently there are none in tree) know what the modes mean?  It's a bit
> > different when the user is supplying configuration for a specific
> > regulator but this needs to be something that can be used by consumers.

> > What are you actually trying to do with this?

> In this patch, we want to support both normal/standby modes for mt6323
> regulators due to mt6323 regulators support low power mode which
> provides better power efficiency for standby case.

> We expect user of mt6323 regulators could dynamically change power mode
> by regulator_set_mode(). -EINVAL is returned if the given mode is not
> supported.

> The regulator_set_mode() API looks very straightforward and possible
> modes are already defined in consumer.h. It looks like we don't have to
> list possible modes for mt6323 additionally in binding document.

None of this is answering my question - I know what the current API is,
describing it doesn't tell me about actual users or how they are able to
sensibly use the interface.  Bear in mind that the definitions of the
various modes are all relative and what one device thinks is high usage
may be low usage for another device.

--AFQGHouA0VN8Ovbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWq0yUAAoJECTWi3JdVIfQIqEH/2mcQfLvsTB97bG5BoAsIAvs
j67jBUUwnBYQ5Ep2ZCXECV7y2Cb3zaT3P3U4H3RvboTjNhiTOy+vJrltBe0uR+hf
IOFXgh98jpndoRl6bVHCDeNf7BwZ9ffjATtD2BBycprTNwBPwNz1iqOkFbvEFN98
QdpAF6IJtAI++s1slzsTt/Pe+nHCQ0eLiSacTdrcYH4jY39l3YHiUp8RUp0paIll
ME5jnr1G+relbfJV4If4n6LdGXoTigmzkwbAjH58cLKqPI3SGhhczstzQaWL4eH3
Til33CpHSxUE5j0mGa7ef+oa8vpbExVOOChVPB6U5UYDlLEk6QJVGe5F3RIbhzc=
=CoPr
-----END PGP SIGNATURE-----

--AFQGHouA0VN8Ovbt--
