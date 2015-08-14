From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regmap: Add function check before called format_val
Date: Fri, 14 Aug 2015 18:56:16 +0100
Message-ID: <20150814175616.GA10748@sirena.org.uk>
References: <1437396110-5192-1-git-send-email-henryc.chen@mediatek.com>
 <20150720150254.GC11162@sirena.org.uk>
 <1437458845.30329.51.camel@mtksdaap41>
 <CAGS+omDa+FhKD2u_VwBG3cWvN+ZiHneqFVz=mtdYuPsiQu4JEQ@mail.gmail.com>
 <1439479505.32674.43.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fIj/D6Y6BN1okdX1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439479505.32674.43.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <HenryC.Chen@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, Eddie Huang =?utf-8?B?KOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, Kevin Hilman <khilman@kernel.org>
List-Id: linux-mediatek@lists.infradead.org


--fIj/D6Y6BN1okdX1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2015 at 11:25:05PM +0800, Henry Chen wrote:
> On Wed, 2015-08-12 at 22:20 +0800, Daniel Kurtz wrote:

> > Making mtk_pmic-wrap into a regmap_bus makes a bit of sense
> > architecturally, too, since it is essentially just a bus for accessing
> > the registers of an off-chip PMIC.  The CPU sees a platform bus, but
> > the registers of the remote PMIC are accessed over a dedicated SPI
> > bus.

> Sorry, I'm afraid that I cannot do this right on init as you said last
> time. What do you think about regmap_bus, can you accept that way?

I don't have enough context from the above to understand what's going
on, sorry.  Implementing a bus for something that isn't actually a Linux
bus doesn't seem like the best idea though and in general what I'm
seeing of the discussion sounds like you're hacking around in driver
code to bodge around problems that are being seen rather than really
addressing things, the code I can see certainly looks like it just wants
to be implementing read and write operations for a single MFD.

--fIj/D6Y6BN1okdX1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVziu8AAoJECTWi3JdVIfQnhkH/2Aab0NcG77t8omUTKUSJTH9
SE3be/2VL5nSmYgQPm0uj3M/LZ6S/qLdIicMHKvD9ofOPIQMpKuWsjSwo98IAqF2
rX5lVwFL3XXR/JCFvK9awrbh0xpz0nf83jpHTw+zgrC9vLJH0WDbFeIPN/WI8Pta
ocBLwVk7aUkR4sg0ttyMMyNh7hhcaU2ay9lVOSTmDdaaI2nWfX6a4UUK8m6c+j9b
u112llNvi1IU/FXkMz+kywnbrt35+pFSNih2/ZKCI5mqsADR9BvAS1x9eeV3M7p3
XhMuuV+AUa7/t7WHk96kLqBmOLsErkO/58Whz5d5GJDkV0ckaSmNFbNfQTZsGLk=
=bbjf
-----END PGP SIGNATURE-----

--fIj/D6Y6BN1okdX1--
