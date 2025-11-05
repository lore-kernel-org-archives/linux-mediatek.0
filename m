Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C91CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51W2CnN+Guuudae3OD1SUKvnW9S79T25TQpKrmukDus=; b=NKLQWG8t13QpjXzep9BGvC1B8S
	HQSC0zM+bZkJJ8suAJAwJU7OGsO7IY0haXvmwtT4Ymu/JDBQs9QXssjhj0jARske/K2JIRBjiRzt6
	Mhhp4J6mngu/+uvXToMsjdXxnQ8iuIgb8RnfL12zbNG33iHBClMHWpQGXFwJ4ofXa9WPAHlfOGhDY
	4T/NtSIcgdRcUufhYZcHuiqWtW2aJGKKGhMA/s5ZNgPCTfvKhaOot9BcFeodvMfusySihgiyxISOB
	gKxI5w158UQpOmZudNxFRGxVCK5lUaI51bbDM0ggSFOI/RApYLv1qLgagKisEK9LBiffWIwq5wdmc
	eO6CLSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaNg-0000000DRZk-2xgz;
	Wed, 05 Nov 2025 10:04:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaNf-0000000DRZV-40XY
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 10:04:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 160B960203;
	Wed,  5 Nov 2025 10:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693CBC4CEFB;
	Wed,  5 Nov 2025 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762337082;
	bh=Ka8z3Hv/2rtt+qWKWxn11yRa+1TDqPq3B0nEETFhsVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IAU1MxdUVi00nZHBno4TzKdnVU6X0EE4ExkUMqDUj6p+UEx7YPPAM7kd3tAA6/Fyy
	 0s3LWdVLi7mjf2X4FlISyVkAg+OzPB2YdEvSE5zqyR6LCxLHsLam9b3+bmisZSOzDo
	 WQCIMiJUlSaPsr6WwGsnomYwd6GJ2RaY7h1AxBMM9wPHOxZw4cMROTt3RkWff8uKwB
	 3/2YnUw1ozjbd0Gk0MCmxfLCJ9gHfsWXHpNoYFBamiEyPrOuFMW+ak+jBczTPgItnE
	 lGyk3ONkXcQepmzCUJRWOUoWQnG9opaJ4xcBXCdWAjD+DfsdBlWaJRNxPgujYt2zZM
	 OYzQoMmpRuVtw==
Date: Wed, 5 Nov 2025 11:04:40 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH mt76 05/12] wifi: mt76: mt7996: fix several fields in
 mt7996_mcu_bss_basic_tlv()
Message-ID: <aQshODZaMJSUoWPd@lore-desk>
References: <20251105093100.541408-1-shayne.chen@mediatek.com>
 <20251105093100.541408-5-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BZxWA+vEG1kVrO84"
Content-Disposition: inline
In-Reply-To: <20251105093100.541408-5-shayne.chen@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--BZxWA+vEG1kVrO84
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Fix several fields in mt7996_mcu_bss_basic_tlv() that were not obtained
> from the correct link. Without this patch, the MLD station interface
> does not function properly.
>=20
> Fixes: 34a41bfbcb71 ("wifi: mt76: mt7996: prepare mt7996_mcu_add_dev/bss_=
info for MLO support")
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.c
> index 82dd34a8780f..f1892aaf6a91 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -1037,7 +1037,6 @@ mt7996_mcu_bss_basic_tlv(struct sk_buff *skb,
>  	struct mt76_connac_bss_basic_tlv *bss;
>  	u32 type =3D CONNECTION_INFRA_AP;
>  	u16 sta_wlan_idx =3D wlan_idx;
> -	struct ieee80211_sta *sta;
>  	struct tlv *tlv;
>  	int idx;
> =20
> @@ -1048,14 +1047,18 @@ mt7996_mcu_bss_basic_tlv(struct sk_buff *skb,
>  		break;
>  	case NL80211_IFTYPE_STATION:
>  		if (enable) {
> +			struct ieee80211_sta *sta;
> +
>  			rcu_read_lock();
> -			sta =3D ieee80211_find_sta(vif, vif->bss_conf.bssid);
> -			/* TODO: enable BSS_INFO_UAPSD & BSS_INFO_PM */
> +			sta =3D ieee80211_find_sta(vif, link_conf->bssid);
>  			if (sta) {
> -				struct mt76_wcid *wcid;
> +				struct mt7996_sta *msta =3D (void *)sta->drv_priv;
> +				struct mt7996_sta_link *msta_link;
> +				int link_id =3D link_conf->link_id;
> =20
> -				wcid =3D (struct mt76_wcid *)sta->drv_priv;
> -				sta_wlan_idx =3D wcid->idx;
> +				msta_link =3D rcu_dereference(msta->link[link_id]);
> +				if (msta_link)
> +					sta_wlan_idx =3D msta_link->wcid.idx;
>  			}
>  			rcu_read_unlock();
>  		}
> @@ -1072,8 +1075,6 @@ mt7996_mcu_bss_basic_tlv(struct sk_buff *skb,
>  	tlv =3D mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_BASIC, sizeof(*bss));
> =20
>  	bss =3D (struct mt76_connac_bss_basic_tlv *)tlv;
> -	bss->bcn_interval =3D cpu_to_le16(link_conf->beacon_int);
> -	bss->dtim_period =3D link_conf->dtim_period;
>  	bss->bmc_tx_wlan_idx =3D cpu_to_le16(wlan_idx);
>  	bss->sta_idx =3D cpu_to_le16(sta_wlan_idx);
>  	bss->conn_type =3D cpu_to_le32(type);
> @@ -1093,10 +1094,10 @@ mt7996_mcu_bss_basic_tlv(struct sk_buff *skb,
> =20
>  	memcpy(bss->bssid, link_conf->bssid, ETH_ALEN);
>  	bss->bcn_interval =3D cpu_to_le16(link_conf->beacon_int);
> -	bss->dtim_period =3D vif->bss_conf.dtim_period;
> +	bss->dtim_period =3D link_conf->dtim_period;
>  	bss->phymode =3D mt76_connac_get_phy_mode(phy, vif,
>  						chandef->chan->band, NULL);
> -	bss->phymode_ext =3D mt76_connac_get_phy_mode_ext(phy, &vif->bss_conf,
> +	bss->phymode_ext =3D mt76_connac_get_phy_mode_ext(phy, link_conf,
>  							chandef->chan->band);
> =20
>  	return 0;
> --=20
> 2.51.0
>=20

--BZxWA+vEG1kVrO84
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQshOAAKCRA6cBh0uS2t
rM0dAQDXpwmIF/R2OQWLsGxTyuO0LQdf0mqBlkF8/8nFgog6WwEA3JI0fxX+dabP
sFyqJrhqUzOZjcPS9mZuEVqJri+F4AM=
=YTxf
-----END PGP SIGNATURE-----

--BZxWA+vEG1kVrO84--

