From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: Re: [PATCH v3 4/5] phy: mvebu-cp110-comphy: convert to use eth phy
 mode and submode
Date: Wed, 21 Nov 2018 08:52:20 +0100
Message-ID: <20181121075220.z6smcpk3y7vab7ix@qschulz>
References: <20181120012424.11802-1-grygorii.strashko@ti.com>
 <20181120012424.11802-5-grygorii.strashko@ti.com>
 <d80901b2-a38a-7abf-23b2-c2b0c84ff321@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2ee7o6gc4xs4vs53"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d80901b2-a38a-7abf-23b2-c2b0c84ff321@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, "David S. Miller" <davem@davemloft.net>, Antoine Tenart <antoine.tenart@free-electrons.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Carlo Caione <carlo@caione.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Manu Gautam <mg>
List-Id: linux-mediatek@lists.infradead.org


--2ee7o6gc4xs4vs53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kishon,

On Wed, Nov 21, 2018 at 01:08:42PM +0530, Kishon Vijay Abraham I wrote:
> Antoine,
>=20
> On 20/11/18 6:54 AM, Grygorii Strashko wrote:
> > Convert mvebu-cp110-comphy PHY driver to use recently introduced
> > PHY_MODE_ETHERNET and phy_set_mode_ext().
>=20
> Care to give ACK for this patch?
>=20

Acked-by Antoine and Tested-by Maxime given in v2:
https://patchwork.kernel.org/patch/10676749/

Quentin

--2ee7o6gc4xs4vs53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlv1DrQACgkQhLiadT7g
8aMsxw/8DZIY08G7GiQ6Hhpu4eFYrQOVzgAbVHkOswZR6czVJiUlqnP64QR+k8j9
3znL+KA7X45/BEMPoai1QtnA1fHoDAjrKtgyqtcJyRBaxk96AEWZNnpdBFAhTw9w
QRVl0b0OQ+ckNMOze4BIhrtUB2+JnCDaf339WOIN4Eup0N+4Y7OsTS4N3Ngy7rTQ
Rs3kmA7wwSePQ2ylbgG5yRoo7bVVItrOogK9x6acSiP02waEse4n1gfoWrQv005e
qoEeZZYjX3ILe8b3v2yQKIV5VYA7D2HOPv0uIv9KzWGqST9c/B8aEW8Duqq1soCr
8x79jqpGvDTYwlVmPR1sLpy48l3ejKEVE0y8RTm7g6gshuNhG0c7MVI99vzj0Jwi
8bPxO2CTu0scVYVh233VYJSWvg6oOBmZsYjmoJiABIO+Ol9uZlYBGEwIQDz1P+t0
cHKWFd0IYARVasAAtwwyLUeYXTC2TU2LkZmsg1bjjFIOoHPKFckGyEspp1OfJs/A
oA02GQK+n2SxCSYq14BXvYDb1ckD+bgQPtD6CV4Uxw7K8U83EkF6qFefNkRhZU7K
+NVagxaCscHEkt+WmH/4YW2Hu1Eti6SrQ1ImQi5E0tDJpPly2trU1Qqty0gQsUix
BPXJXOoGY6cmam6jmoBXpVzkARPjFpNgkgCjtOIKBIIhsUTzoTk=
=hpTL
-----END PGP SIGNATURE-----

--2ee7o6gc4xs4vs53--
