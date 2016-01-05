From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: mt6397: convert to arch_initcall
Date: Tue, 5 Jan 2016 13:44:52 +0000
Message-ID: <20160105134452.GE16023@sirena.org.uk>
References: <1450865768-10317-1-git-send-email-henryc.chen@mediatek.com>
 <20151223120019.GU16023@sirena.org.uk>
 <1450944643.30352.9.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YFIkGcPEGW9vkGks"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450944643.30352.9.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Samuel Ortiz <sameo@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-mediatek@lists.infradead.org


--YFIkGcPEGW9vkGks
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2015 at 04:10:43PM +0800, Yingjoe Chen wrote:

> These changes are related to pinctrl init order patch. The related
> discussion is here:
> http://lists.infradead.org/pipermail/linux-mediatek/2015-December/003298.=
html

So this is just to cut down on probe deferrals?  Sorry but as you'll see
=66rom the discussion in that thread I'm really not enthusiastic about
taking such patches.  Trying to use initcall ordering is a hack we're
moving towards removing, isn't very robust and makes it harder to
convince people that it's worth doing anything to really improve things.

> I think Henry use arch_initcall because that's what pinctrl patch was
> using. In this case, we should use subsys_initcall for all these.

But why?  This sort of random unexplained level picking is part of the
problem...

--YFIkGcPEGW9vkGks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWi8jTAAoJECTWi3JdVIfQ5BUH/2trwM/5ztUKcXKpMYBPz7oY
z2QOe+hJ8skGeveWQrdSKGccfN1tN9fKcdvPCppe8H1RsR3A0SWVjBHchlp3f+Kl
yhNwPEKI4raLp7HFo+SibEBYHxEnzlcXYKLyMUBLbVd+dJdEe1kAJg2bzqwJXqlA
4lk4cZ+jq6+bfW1QmtDxL/CNzfx7gPlykf/XruSQc3znnxseXzXy2JOqnUUDyw5p
oZ9GGVm8lkiwYG1yVk3ytQrqpNKeCnH7lZC1mmoHmtB7qyjRozuvG4PJGXskEfEx
rdf+Y3jHiobRpVzW6cXif0fpJufG5qLywfuufcYhnfDt6To8WkoPMRgwbGjg5EU=
=++n3
-----END PGP SIGNATURE-----

--YFIkGcPEGW9vkGks--
