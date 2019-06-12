From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH v2] mt76: mt7615: add support for per-chain signal
 strength reporting
Date: Wed, 12 Jun 2019 10:37:40 +0200
Message-ID: <20190612083739.GB8107@localhost.localdomain>
References: <22e5caff3581dc92fd6fec2f25966d86b7276bba.1560220443.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <22e5caff3581dc92fd6fec2f25966d86b7276bba.1560220443.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Fill in RX status->chain_signal to avoid empty value.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> Changes since v2 - correct calculation sequence
> ---
>  .../net/wireless/mediatek/mt76/mt7615/mac.c   | 30 ++++++++++++++++++-
>  .../net/wireless/mediatek/mt76/mt7615/mac.h   |  5 ++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.c
> index b60d42b5923d..2f49a99e77b1 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -13,6 +13,11 @@
>  #include "../dma.h"
>  #include "mac.h"
> =20

[...]

> @@ -169,7 +175,29 @@ int mt7615_mac_fill_rx(struct mt7615_dev *dev, struc=
t sk_buff *skb)
> =20
>  		status->enc_flags |=3D RX_ENC_FLAG_STBC_MASK * stbc;
> =20
> -		/* TODO: RSSI */
> +		status->chains =3D dev->mt76.antenna_mask;
> +		status->chain_signal[0] =3D to_rssi(MT_RXV4_RCPI0, rxdg3);
> +		status->chain_signal[1] =3D to_rssi(MT_RXV4_RCPI1, rxdg3);
> +		status->chain_signal[2] =3D to_rssi(MT_RXV4_RCPI2, rxdg3);
> +		status->chain_signal[3] =3D to_rssi(MT_RXV4_RCPI3, rxdg3);
> +		status->signal =3D status->chain_signal[0];
> +
> +		switch (status->chains) {
> +		case 0xf:
> +			status->signal =3D max(status->signal,
> +					     status->chain_signal[3]);
> +			/* fall through */
> +		case 0x7:
> +			status->signal =3D max(status->signal,
> +					     status->chain_signal[2]);
> +			/* fall through */
> +		case 0x3:
> +			status->signal =3D max(status->signal,
> +					     status->chain_signal[1]);
> +			break;
> +		default:
> +			break;
> +		}

is it possible to enable rx chains selectively (e.g. chain 0 and 2)?
If so we can do something like:

for (i =3D 1; i < hweight8(dev->mt76.antenna_mask); i++) {
	if (!(status->chains & BIT(i)))
		continue;

	status->signal =3D max(status->signal,
			     status->chain_signal[i]);
}

Regards,
Lorenzo

>  		rxd +=3D 6;
>  		if ((u8 *)rxd - skb->data >=3D skb->len)
>  			return -EINVAL;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.h
> index 18ad4b8a3807..b00ce8db58e9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
> @@ -98,6 +98,11 @@ enum rx_pkt_type {
>  #define MT_RXV2_GROUP_ID		GENMASK(26, 21)
>  #define MT_RXV2_LENGTH			GENMASK(20, 0)
> =20
> +#define MT_RXV4_RCPI3			GENMASK(31, 24)
> +#define MT_RXV4_RCPI2			GENMASK(23, 16)
> +#define MT_RXV4_RCPI1			GENMASK(15, 8)
> +#define MT_RXV4_RCPI0			GENMASK(7, 0)
> +
>  enum tx_header_format {
>  	MT_HDR_FORMAT_802_3,
>  	MT_HDR_FORMAT_CMD,
> --=20
> 2.18.0
>=20

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXQC50QAKCRA6cBh0uS2t
rI6hAP9Warx35hWYlrpmqbAqHAOcATtC3HRS5Vgg2y5PiTNWDwD8C/oyAz5+UBIJ
0DP/Sqd38fAYdghH3zy/ZhxyNT/VRgU=
=1Un8
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
