From: NeilBrown <neil@brown.name>
Subject: Re: [PATCH v2] staging: mt7621-eth: Fix sparse warning in ethtool.c
Date: Mon, 02 Apr 2018 09:34:58 +1000
Message-ID: <87vada1owt.fsf@notabene.neil.brown.name>
References: <20180329095637.GA16778@kroah.com> <20180329124745.24694-1-cmc@babblebit.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180329124745.24694-1-cmc@babblebit.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Chris Coffey <cmc@babblebit.net>
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29 2018, Chris Coffey wrote:

> This fixes the following sparse warning:
>
> drivers/staging/mt7621-eth/ethtool.c:213:6: warning: symbol
> 'mtk_set_ethtool_ops' was not declared. Should it be static?
>
> Signed-off-by: Chris Coffey <cmc@babblebit.net>

Reviewed-by: NeilBrown <neil@brown.name>

Thanks,
NeilBrown


> ---
> Changes in v2:
>  - Per GregKH's feedback (thanks!), don't add unnecessary new .h file
>  dependencies. This patch version reverts those changes and fixes the
>  problem directly in ethtool.c (which is that it didn't include
>  ethtool.h anywhere -- mtk_set_ethtool_ops is not static).
>
>  drivers/staging/mt7621-eth/ethtool.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/mt7621-eth/ethtool.c b/drivers/staging/mt762=
1-eth/ethtool.c
> index 38ba0c040a..5268c5ca09 100644
> --- a/drivers/staging/mt7621-eth/ethtool.c
> +++ b/drivers/staging/mt7621-eth/ethtool.c
> @@ -13,6 +13,7 @@
>   */
>=20=20
>  #include "mtk_eth_soc.h"
> +#include "ethtool.h"
>=20=20
>  static const char mtk_gdma_str[][ETH_GSTRING_LEN] =3D {
>  #define _FE(x...)	# x,
> --=20
> 2.11.0

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlrBbKMACgkQOeye3VZi
gbmWphAAw5pBrEWrvsgAMo5LGy+Vpt4tkXJ0R8OzjHtg26YX6XQmPDTYdlooVTG0
CG/Q4zfsXFi+TK0mmRbIh5uRdAwEvyX1VlK7V/FKszHZ5mU8qS5P2UYRI64PbrME
xCrpA+QVtuQHtzMZJVLDj0c0VpgFQCh73SN9OYwW2f5RWKJYr1rhLFfXjc2BMkBL
2cvzo7vCLbzpq7OukMJ9zPYwonFXk3LwxJX28seQkxAHd2be59r96uV7qevACTTK
CISYJc5o0/mXjwy7PDZqF75Ma9cLqNNtjVedTjrfoyxkMejEW8vhUB8WuSxkDHc/
pPdqNUdFItQDRNjb6lAYAqxCYQQHId3UbTIdrkGOxzQWdB6pGTINwkDj/gS03NFs
s35A9QwzWqWQfFV2u1qvwMzbnVdVwqjNgwGTrQvVwdh3rAGgXW0MmNr8My+TR1vc
HSQI4eNmtcRONaBm0yNyOvs73Gm3yJZmzvVw62frnvVV4e8jv8umIH76dBufXGJd
K9RNnbw7iEBtq3v5OVhTymReSVQ4tZOPGwxs8jOtZjmlRTzsHmHGvHTtoqUZ4+nH
f8mwsTa5j7RYo6Epa/bpDp6bvhCL4UamZ8BC4EVIzdn921t1vNd2W8rMJ29kgwOX
p75oSRRW+rHNDs9vih3vp0yHIkQabnmRFDL/adEcC+zzM0XBCzM=
=MGT+
-----END PGP SIGNATURE-----
--=-=-=--
