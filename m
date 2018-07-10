From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 173 boots: 4 failed, 136 passed with 32
 offline, 1 untried/unknown (next-20180710)
Date: Tue, 10 Jul 2018 15:02:13 +0100
Message-ID: <20180710140213.GB8104@sirena.org.uk>
References: <5b44b87b.1c69fb81.97804.0122@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5875692418262172749=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5b44b87b.1c69fb81.97804.0122@mx.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-next@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, "kernelci.org bot" <bot@kernelci.org>, kernel-build-reports@lists.linaro.org
List-Id: linux-mediatek@lists.infradead.org


--===============5875692418262172749==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 10, 2018 at 06:45:31AM -0700, kernelci.org bot wrote:

Today's linux-next fails to boot on mt7622-rfb1 with defconfig and
defconfig+RANDOMIZE_BASE:

> arm64:

>     defconfig:
>         mt7622-rfb1:
>             lab-baylibre-seattle: new failure (last pass: next-20180709)

>     defconfig+CONFIG_RANDOMIZE_BASE=y:
>         mt7622-rfb1:
>             lab-baylibre-seattle: new failure (last pass: next-20180709)

I'm not 100% sure if this is a lab failure or an early boot failure:

| Starting kernel ...

| [ATF][    34.233534]save kernel info
| [ATF][    34.236565]Kernel_EL2
| [ATF][    34.239322]Kernel is 64Bit
| [ATF][    34.242509]pc=0x40080000, r0=0x5cf48000, r1=0x0
| INFO:    BL3-1: Preparing for EL3 exit to normal world, Kernel
| INFO:    BL3-1: Next image address = 0x40080000
| INFO:    BL3-1: Next image spsr = 0x3c9
| [ATF][    34.260778]el3_exit
| ~$off
| # PYBOOT: Exception: kernel: ERROR: did not start booting.

It only seems to affect this platform, other arm64 platforms seem fine.
More details at:

   https://kernelci.org/boot/id/5b44981a59b5141e5996baa1/

for the defconfig case, symptoms seem similar with RANDOMIZE_BASE.

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltEvGUACgkQJNaLcl1U
h9ATugf/dpCkqeVefVDcj1ZLT6nMzbk9vzlIO6211HCrAXpZUvgSsYvUpC3VbhKA
0D0m6SsVgF5lXKnmLVPv8QHuoFIZ6J6v/EUQcn2tl17MHVSs03vA3DBikgueFAum
WyO8R/98878kamnvkQPKglfiC4utMXffp0euuTsgENY0xzwV63AeN7lfViqvqsBX
SNqfzFDFZH4grPObeNUmjMjtiNdYKVusEfS0hwIk4BHCtn8aYmRNEc7lZTC8vwC5
VurtFM+qm+dQOJxwDQdYMDMFL2pt6sR7ZWonRhdQdeMs3OxyWiQuEHO85bGEZjsD
LbOgEJPjunREz+K37HK8OtJ8gZqWEw==
=6Smt
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--


--===============5875692418262172749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5875692418262172749==--
