From: Mark Brown <broonie@kernel.org>
Subject: Re: BUG: devm_regulator_get returns EPROBE_DEFER
 (5.3-rc5..next-20190822) for bpi-r2/mt7623/mt7530
Date: Thu, 22 Aug 2019 20:30:15 +0100
Message-ID: <20190822193015.GK23391@sirena.co.uk>
References: <trinity-584a4b1c-18c9-43ae-8c1a-5057933ad905-1566501837738@3c-app-gmx-bs43>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="reI/iBAAp9kzkmX4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <trinity-584a4b1c-18c9-43ae-8c1a-5057933ad905-1566501837738@3c-app-gmx-bs43>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?iso-8859-1?Q?=22Ren=E9_van_Dorst=22?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org


--reI/iBAAp9kzkmX4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2019 at 09:23:57PM +0200, Frank Wunderlich wrote:

> seems of_find_regulator_by_node(node); is failing here, but i see the dts-node (mt6323_vpa_reg: buck_vpa) in /sys/firmware/devicetree/...

It's not looking for the node in the device tree, it's looking
for that regulator to instantiate at runtime.  Is that happening?

--reI/iBAAp9kzkmX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1e7UYACgkQJNaLcl1U
h9DIXAf/SwrWcS3GuI3wq6WJK9mC5ILC9tOznC/HRhk/xcYaCYjZJgBRt6jJf9k9
HXrnvUX3Gr7b4jpE4PbpJM2KTFIzE5qTkQrb55slWJ6CAG6do+Pu2ZcO9tWRNou8
XuyvN0kjtW1s3eEGuYeDBTdJT2EueBbZ13qDt00uRJExurcbxWOuQbJNQT2Jcdj5
mYPyrrpIUJ1/3oZPV9WdrofTWx3YRpFrwiJ22kKnUA2NV90OIInFtfi3K6IXezWv
Ko6w3yRH+Koz1nDvCvAYd6rkPzJATa9n5sLToX5yxNWfYY4C7lpCov3NM3IEbjEY
7dtsFgvTH5X7V8Z4O2kcfDDmfaY71Q==
=zy6Z
-----END PGP SIGNATURE-----

--reI/iBAAp9kzkmX4--
