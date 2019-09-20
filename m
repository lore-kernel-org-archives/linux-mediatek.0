From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: Re: [PATCH] mt7601u: phy: simplify zero check on val
Date: Fri, 20 Sep 2019 15:58:17 +0200
Message-ID: <20190920135817.GC6456@localhost.localdomain>
References: <20190920125414.15507-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190920125414.15507-1-colin.king@canonical.com>
Sender: netdev-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the zero check on val to break out of a loop
> is a little obscure.  Replace the val is zero and break check
> with a loop while value is non-zero.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/wireless/mediatek/mt7601u/phy.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt7601u/phy.c b/drivers/net/wi=
reless/mediatek/mt7601u/phy.c
> index 06f5702ab4bd..4e0e473caae1 100644
> --- a/drivers/net/wireless/mediatek/mt7601u/phy.c
> +++ b/drivers/net/wireless/mediatek/mt7601u/phy.c
> @@ -213,9 +213,7 @@ int mt7601u_wait_bbp_ready(struct mt7601u_dev *dev)
> =20
>  	do {
>  		val =3D mt7601u_bbp_rr(dev, MT_BBP_REG_VERSION);
> -		if (val && ~val)
> -			break;

I think this is not correct since (not considering the cast) we should break
=66rom the loop if val !=3D 0 and val !=3D 0xff, so the right approach I gu=
ess is:

diff --git a/drivers/net/wireless/mediatek/mt7601u/phy.c b/drivers/net/wire=
less/mediatek/mt7601u/phy.c
index 06f5702ab4bd..d863ab4a66c9 100644
--- a/drivers/net/wireless/mediatek/mt7601u/phy.c
+++ b/drivers/net/wireless/mediatek/mt7601u/phy.c
@@ -213,7 +213,7 @@ int mt7601u_wait_bbp_ready(struct mt7601u_dev *dev)
=20
 	do {
 		val =3D mt7601u_bbp_rr(dev, MT_BBP_REG_VERSION);
-		if (val && ~val)
+		if (val && val !=3D 0xff)
 			break;
 	} while (--i);

> -	} while (--i);
> +	} while (val && --i);
> =20
>  	if (!i) {
>  		dev_err(dev->dev, "Error: BBP is not ready\n");
> --=20
> 2.20.1
>=20

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXYTa9wAKCRA6cBh0uS2t
rETyAP42WJmgG0YWFN4dtvNtHUZL2FS46W+Tt/OXQTdrQfEfYQEA6DLVOjMTQzuG
hmE5irsv5UEh9sDb73OcIUNJYu7aPAg=
=LFi7
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
