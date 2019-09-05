From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 310 boots: 11 failed, 292 passed with 6
 offline, 1 untried/unknown (next-20190904)
Date: Thu, 5 Sep 2019 16:43:55 +0100
Message-ID: <20190905154355.GC4053@sirena.co.uk>
References: <5d700b15.1c69fb81.2abcd.479b@mx.google.com>
 <20190904192725.GI4348@sirena.co.uk> <7hzhjjsime.fsf@baylibre.com>
 <20190905153938.GB4053@sirena.co.uk>
 <20190905154053.GA21701@lst.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4650970803896974752=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190905154053.GA21701@lst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christoph Hellwig <hch@lst.de>
Cc: Steven Liu <steven.liu@mediatek.com>, kernel-build-reports@lists.linaro.org, Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--===============4650970803896974752==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Content-Disposition: inline


--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2019 at 05:40:53PM +0200, Christoph Hellwig wrote:
> On Thu, Sep 05, 2019 at 04:39:38PM +0100, Mark Brown wrote:
> > On Wed, Sep 04, 2019 at 05:15:53PM -0700, Kevin Hilman wrote:
> > > [ + Steven Liu who donated this board to my kernelCI lab ]

> > Also adding Christoph since this was bisected to his commit and Catalin
> > and Will since this was an architecture change.

> Given Will in CC the problem is on arm64?

Yes, this is an arm64 system.  It seems to be the only one in KernelCI
that's been affected so it's not like the entire architecture exploded
or anything.

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1xLToACgkQJNaLcl1U
h9D7SAf/cAPz4+44Y6e4wlNKbRh8FmNy7ULkMF3BNZLNpO7Dk+GWEXgci1psJ75t
WGJZFns1s6RzSawVIyyPnr3WkfnB22fd+s5SN+Mlnmfoy8R0ezvVlC58NyIGsf1Z
KYDMAuOYB9NvFvoKf6oLgSrPL20W/MlrISU1ns+MouE5TUX2u2+39YrIlmV+fUvY
A8RwuOfbG8n0GDSGzBum6duCLGAglGevu40CJyo9/Es5GzeiJwql0mAmpptFyCyP
Rj4Z3DUZad1BANPhrj4QcXpOb47vRMxARnyWidfIDnaqijxhMUs/VSWWAy2HSk1L
vX8T+bDnQJqP21u3ECeP1JvekVzUTw==
=Jsn9
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--


--===============4650970803896974752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4650970803896974752==--
