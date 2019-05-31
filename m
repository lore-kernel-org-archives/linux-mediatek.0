From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH 1/2] mt76: mt7615: enable support for mesh
Date: Fri, 31 May 2019 12:02:03 +0200
Message-ID: <20190531100201.GA3527@localhost.localdomain>
References: <7f167d09736652f81383991c971506630bbedacc.1559287432.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7f167d09736652f81383991c971506630bbedacc.1559287432.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.Chen@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Enable NL80211_IFTYPE_MESH_POINT and add its path.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/init.c | 6 ++++++
>  drivers/net/wireless/mediatek/mt76/mt7615/main.c | 1 +
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c  | 5 ++++-
>  3 files changed, 11 insertions(+), 1 deletion(-)
>=20

[...]

> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7615/main.c
> index b0bb7cc12385..585e67fa2728 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> @@ -37,6 +37,7 @@ static int get_omac_idx(enum nl80211_iftype type, u32 m=
ask)
> =20
>  	switch (type) {
>  	case NL80211_IFTYPE_AP:
> +	case NL80211_IFTYPE_MESH_POINT:
>  		/* ap use hw bssid 0 and ext bssid */
>  		if (~mask & BIT(HW_BSSID_0))
>  			return HW_BSSID_0;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index 43f70195244c..8b8db526cb16 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -754,6 +754,7 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
> =20
>  	switch (vif->type) {
>  	case NL80211_IFTYPE_AP:
> +	case NL80211_IFTYPE_MESH_POINT:
>  		tx_wlan_idx =3D mvif->sta.wcid.idx;
>  		conn_type =3D CONNECTION_INFRA_AP;

Just out of curiosity, why not using CONNECTION_MESH_{AP,STA} here?
why not NETWORK_MESH?

>  		break;
> @@ -968,7 +969,8 @@ int mt7615_mcu_add_wtbl(struct mt7615_dev *dev, struc=
t ieee80211_vif *vif,
>  		.rx_wtbl =3D {
>  			.tag =3D cpu_to_le16(WTBL_RX),
>  			.len =3D cpu_to_le16(sizeof(struct wtbl_rx)),
> -			.rca1 =3D vif->type !=3D NL80211_IFTYPE_AP,
> +			.rca1 =3D vif->type !=3D (NL80211_IFTYPE_AP ||
> +					      NL80211_IFTYPE_MESH_POINT),
>  			.rca2 =3D 1,
>  			.rv =3D 1,
>  		},
> @@ -1042,6 +1044,7 @@ static void sta_rec_convert_vif_type(enum nl80211_i=
ftype type, u32 *conn_type)
>  {
>  	switch (type) {
>  	case NL80211_IFTYPE_AP:
> +	case NL80211_IFTYPE_MESH_POINT:
>  		if (conn_type)
>  			*conn_type =3D CONNECTION_INFRA_STA;
>  		break;

same here.

Regards,
Lorenzo

> --=20
> 2.18.0
>=20

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXPD7lgAKCRA6cBh0uS2t
rFA6AP9xl4wUemuHlJ2lNcCI2smmKaZNi4KmXW4gSR0kGjaB3wEAsww6TO6o9pAq
PI3sKVdjK8j31EW9B+ekCKNxFmSPBgA=
=w7DQ
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
