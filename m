From: Lorenzo Bianconi <lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] mt76: mt7615: update peer's bssid when state
 transition changes
Date: Wed, 12 Jun 2019 10:26:19 +0200
Message-ID: <20190612082618.GA8107@localhost.localdomain>
References: <3065a01998dfa04a5d2d680e820a17cb5c110d0f.1560221172.git.ryder.lee@mediatek.com>
 <449fee28c558b6f02b62275f9beefaab02b47efc.1560221172.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <449fee28c558b6f02b62275f9beefaab02b47efc.1560221172.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Driver should update peer's bssid and bss information when
> state transition changes.
>=20
> Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../net/wireless/mediatek/mt76/mt7615/main.c  |  5 +-
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 49 ++++++++++---------
>  2 files changed, 27 insertions(+), 27 deletions(-)
>=20

[...]

> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mcu.c
> index e82086eb8aa4..8fc12cd37906 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -741,17 +741,6 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
>  	u8 *buf, *data, tx_wlan_idx =3D 0;
>  	struct req_hdr *hdr;
> =20
> -	if (en) {
> -		len +=3D sizeof(struct bss_info_omac);
> -		features |=3D BIT(BSS_INFO_OMAC);
> -		if (mvif->omac_idx > EXT_BSSID_START) {
> -			len +=3D sizeof(struct bss_info_ext_bss);
> -			features |=3D BIT(BSS_INFO_EXT_BSS);
> -			ntlv++;
> -		}
> -		ntlv++;
> -	}
> -
>  	switch (vif->type) {
>  	case NL80211_IFTYPE_AP:
>  	case NL80211_IFTYPE_MESH_POINT:
> @@ -759,22 +748,23 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
>  		conn_type =3D CONNECTION_INFRA_AP;
>  		break;
>  	case NL80211_IFTYPE_STATION: {
> -		struct ieee80211_sta *sta;
> -		struct mt7615_sta *msta;
> -
> -		rcu_read_lock();
> -
> -		sta =3D ieee80211_find_sta(vif, vif->bss_conf.bssid);
> -		if (!sta) {
> +		/* TODO: enable BSS_INFO_UAPSD & BSS_INFO_PM */
> +		if (en) {
> +			struct ieee80211_sta *sta;
> +			struct mt7615_sta *msta;
> +
> +			rcu_read_lock();
> +			sta =3D ieee80211_find_sta(vif, vif->bss_conf.bssid);
> +			if (!sta) {
> +				rcu_read_unlock();
> +				return -EINVAL;
> +			}
> +
> +			msta =3D (struct mt7615_sta *)sta->drv_priv;
> +			tx_wlan_idx =3D msta->wcid.idx;
>  			rcu_read_unlock();
> -			return -EINVAL;
>  		}
> -
> -		msta =3D (struct mt7615_sta *)sta->drv_priv;
> -		tx_wlan_idx =3D msta->wcid.idx;
>  		conn_type =3D CONNECTION_INFRA_STA;
> -
> -		rcu_read_unlock();
>  		break;
>  	}
>  	default:
> @@ -782,6 +772,17 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
>  		break;
>  	}
> =20
> +	if (en) {
> +		len +=3D sizeof(struct bss_info_omac);
> +		features |=3D BIT(BSS_INFO_OMAC);
> +		if (mvif->omac_idx > EXT_BSSID_START) {
> +			len +=3D sizeof(struct bss_info_ext_bss);
> +			features |=3D BIT(BSS_INFO_EXT_BSS);
> +			ntlv++;
> +		}
> +		ntlv++;
> +	}

What did you move this chunk down?

Regards,
Lorenzo

> +
>  	buf =3D kzalloc(len, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
> --=20
> 2.18.0
>=20

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXQC3JwAKCRA6cBh0uS2t
rFJyAQCPhUzOHTO9oIBENFN5792OnafbeU2m65jRccNwracrZQD/WD/HqK3FoDS4
EeDnEIgj1yzcCgdAU7vhN8a9VE9gtA4=
=rUIW
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
