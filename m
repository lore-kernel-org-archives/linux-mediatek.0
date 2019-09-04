From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 310 boots: 11 failed, 292 passed with 6
 offline, 1 untried/unknown (next-20190904)
Date: Wed, 4 Sep 2019 20:27:26 +0100
Message-ID: <20190904192725.GI4348@sirena.co.uk>
References: <5d700b15.1c69fb81.2abcd.479b@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3322658247250989540=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5d700b15.1c69fb81.2abcd.479b@mx.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-build-reports@lists.linaro.org
List-Id: linux-mediatek@lists.infradead.org


--===============3322658247250989540==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9s922KAXlWjPfK/Q"
Content-Disposition: inline


--9s922KAXlWjPfK/Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2019 at 12:05:57PM -0700, kernelci.org bot wrote:

Since 30th August -next fails to boot with no kernel output on
mt7622-rfb1:

> arm64:
>     defconfig:
>         gcc-8:
>             mt7622-rfb1: 1 failed lab
>=20
>     defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
>         gcc-8:
>             mt7622-rfb1: 1 failed lab

There's logging from ATF so it looks like we try to boot the kernel:

Starting kernel ...

[ATF][    36.199793]save kernel info
[ATF][    36.202824]Kernel_EL2
[ATF][    36.205580]Kernel is 64Bit
[ATF][    36.208768]pc=3D0x40080000, r0=3D0x5cf48000, r1=3D0x0
INFO:    BL3-1: Preparing for EL3 exit to normal world, Kernel
INFO:    BL3-1: Next image address =3D 0x40080000
INFO:    BL3-1: Next image spsr =3D 0x3c9
[ATF][    36.227037]el3_exit

but no output.  More details including full logs at:

	https://kernelci.org/boot/id/5d6fe70059b514164ef1224d/
	https://kernelci.org/boot/id/5d6fe6e259b514164ef12243/

--9s922KAXlWjPfK/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1wEB0ACgkQJNaLcl1U
h9A/4Af9GyL4+48PsNu8OiRt5GxGu5j54SLyM+A6ZS8iZg4ZfTl875Dr4lp6qW67
gieIx4Zkgx8KzsSECl+W5mTUfW3LCOg79/AHTQCtsSs8CaD+fUSFe8DdrpdzyGeg
hLUsr4T56uaUUYO4KXCFaqzme5tL24bCiVTboGCmlVzLTlMDpBlQkIlDrATOUya2
liE9XHl2lpE3vCqExcRvTrhkfPRa8Gdhan34Sp/5HkJ0Yu+YyH90ERr+QyaMay2j
3/Rl+PT77tEzw1QWFY6a/1a4eoJBtVqron40suPFIEJgQBdRasFJHQjPlUyVSlAm
xIq7HDgZqAWzPgxgTm3nHuAtJluwbg==
=tqM1
-----END PGP SIGNATURE-----

--9s922KAXlWjPfK/Q--


--===============3322658247250989540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3322658247250989540==--
