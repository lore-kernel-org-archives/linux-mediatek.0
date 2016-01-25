From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Mon, 25 Jan 2016 12:35:38 +0000
Message-ID: <20160125123538.GO6588@sirena.org.uk>
References: <1453718405-40815-1-git-send-email-blogic@openwrt.org>
 <1453718405-40815-2-git-send-email-blogic@openwrt.org>
 <CABxcv=kWnUwpCo=JJbnPAARRM226YfBJw_6yF7MiE8-7iqBD+Q@mail.gmail.com>
 <56A612E2.1010509@openwrt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Auu5xDuhtuIUeAQs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56A612E2.1010509@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Steven Liu <steven.liu@mediatek.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Henry Chen <henryc.chen@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org


--Auu5xDuhtuIUeAQs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 25, 2016 at 01:19:46PM +0100, John Crispin wrote:
> On 25/01/2016 13:11, Javier Martinez Canillas wrote:

> > You don't have a .of_match table but according the DT bindings, the
> > compatible string "mediatek,mt6323-regulator" should be used so there
> > should be a OF match table or the vendor prefix of the compatible
> > string won't be used for matching (i.e: fallbacks to the driver .name
> > for match).

> the driver is probed via drivers/mfd/mt6397-core.c and does not require
> the OF match table. It loads fine just like the mt6397 driver.

That's fine but you shouldn't have the compatible string in your binding
document since it's not actually used or needed.

--Auu5xDuhtuIUeAQs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWphaZAAoJECTWi3JdVIfQuXoH/RT0cUoLm0mCg22K3pE/ipB9
L/TgkSJDvTSL1DyeC8BaPmUbcM7OWfFj5V3f8SXCjt2V53PWP2IpZ6RqzM3E3fn0
MVKJeDYAhkupRwff1nk27MiN/T3nmPuvMDteWxjWDC3p2XUpT5k8vUuC/PGp1uLc
ghkqH4t+7rkdlfNRogN8eKx+3gJ4YAZIoG9wWSZfMhkXBUyUauxDNTZeqYKpU+wS
Kt1ccOWyp4PpxrNv+aOPgAEBJU8nl5dnDWkEwT6fIMGhQw6Ro/VkOFzaDW+SRpfQ
a+P6frizDdasaZslctk7p2uAzX83QbiWGyc2PrF6dRr/7lYqTd3hf1U8hPcTQew=
=52H9
-----END PGP SIGNATURE-----

--Auu5xDuhtuIUeAQs--
