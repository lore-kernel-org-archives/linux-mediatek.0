Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB51C04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Knn3Qy2R13x90+gT2dYWwDGDZDbPftFdfA2dtNlCThs=; b=3eg9qSb9iyVW7oW48G1wUXB09H
	476OVwvawgmYI1QToW/+XbSLkE6B4SxhNVSdNQBZsISP1XhpTzfWghqg26GKqN1XGh4Paq9pePSHT
	20BMXpYH+XxojaKZp/xb3OV8fU7PSGq8mU9RiRWeXFMd1KCxTtYipwu/cUAOCxNW/JZkqNTxy8aFL
	naTbX7phFkCrJBxyIiD0ue7oOCMqCMarYEyOQyWAI8+FZW7ULlHarUhh1QWxnQHhHJkIpj9eX180w
	aBkOG6nLDvceg4Ep/4Vel76Xg82qiJb3FedEy2qhaKeeLOcAMqyVPBT6azSoidqFX+2AjYb9enTeY
	AnjauHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR8Qh-00AA4Q-AW; Thu, 25 Aug 2022 08:41:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR8Qa-00AA2e-By
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 08:41:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 330FF61B32;
	Thu, 25 Aug 2022 08:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEEFC433D7;
	Thu, 25 Aug 2022 08:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661416886;
	bh=H2QZFKgh6j5irNfACvqxlvc4RiYU/z0FyKpvIZAthR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OBqP7NB9PjHdpQQq5z88fXWkddQe/YsZcaGnTVGw3ELYS0e6FI8UBhvrkwfYvqY5M
	 o7j6Qg+37DWnRvBkDCRuCb5qdHN0a8VwtzDTc9I8f2p/vaxUvvKP+bARu1d90jLzKu
	 Ign2TAfRR7RdYFIhwArWXstNgGwRQzi5kUmRpJDJfeYQvDCXjffwXzUlzujhwT/zUx
	 g7fKXZDD11ZIuU1Uw/4V9+1m9RlImV2BbxLL+kQV7S7Ky1cOUs02cq1Y8egLcOTPeF
	 ZwwIFeilutAIq/wP9TAdV+XO5vdk1ClyJ7YJsLsc+O2WEYASc1eez1o7e9eCMhye3h
	 0Omruh8G8l1hg==
Date: Thu, 25 Aug 2022 10:41:22 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
	Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
	km.lin@mediatek.com, jenhao.yang@mediatek.com,
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
	ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
	steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
	kuabhs@google.com, druth@google.com, abhishekpandit@google.com,
	shawnku@google.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: reset msta->airtime_ac while clearing up
 hw value
Message-ID: <Ywc1srMmMu51Nuzv@lore-desk>
References: <fd716a393e20d5db89f4f9d705d6dbbfde7260a6.1661400412.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GBjSkNIqgczU0Eds"
Content-Disposition: inline
In-Reply-To: <fd716a393e20d5db89f4f9d705d6dbbfde7260a6.1661400412.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_014128_513889_7D0D3FBD 
X-CRM114-Status: GOOD (  23.41  )
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


--GBjSkNIqgczU0Eds
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> We should reset mstat->airtime_ac along with clear up the entries in the
> hardware WLAN table for the Rx and Rx accumulative airtime. Otherwsie, the
> value msta->airtime_ac - [tx, rx]_last may be a negative and that is not
> the actual airtime the device took in the last run.

the only point where we need it is mt7921_mac_sta_assoc() since in
mt7921_mac_sta_add() airtime_ac array is supposed to be already 0 and in
mt7921_mac_sta_remove() we are removing the sta. Is my understanding correc=
t?
If so, is it better to just add a memset(, 0, ..) in mt7921_mac_sta_assoc()?

Regards,
Lorenzo

>=20
> Reported-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mac.c   | 15 ++++++++++-----
>  drivers/net/wireless/mediatek/mt76/mt7921/main.c  |  9 +++------
>  .../net/wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
>  3 files changed, 15 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index 47f0aa81ab02..87dd0babff7a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -46,6 +46,14 @@ bool mt7921_mac_wtbl_update(struct mt7921_dev *dev, in=
t idx, u32 mask)
>  			 0, 5000);
>  }
> =20
> +void mt7921_mac_sta_airtime_clear(struct mt7921_dev *dev,
> +				  struct mt7921_sta *msta)
> +{
> +	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
> +			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> +	memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
> +}
> +
>  void mt7921_mac_sta_poll(struct mt7921_dev *dev)
>  {
>  	static const u8 ac_to_tid[] =3D {
> @@ -100,11 +108,8 @@ void mt7921_mac_sta_poll(struct mt7921_dev *dev)
>  			addr +=3D 8;
>  		}
> =20
> -		if (clear) {
> -			mt7921_mac_wtbl_update(dev, idx,
> -					       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> -			memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
> -		}
> +		if (clear)
> +			mt7921_mac_sta_airtime_clear(dev, msta);
> =20
>  		if (!msta->wcid.sta)
>  			continue;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 1438a9f8d1fd..9d70884e24af 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -723,8 +723,7 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct =
ieee80211_vif *vif,
>  	if (vif->type =3D=3D NL80211_IFTYPE_STATION)
>  		mvif->wep_sta =3D msta;
> =20
> -	mt7921_mac_wtbl_update(dev, idx,
> -			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> +	mt7921_mac_sta_airtime_clear(dev, msta);
> =20
>  	ret =3D mt7921_mcu_sta_update(dev, sta, vif, true,
>  				    MT76_STA_INFO_STATE_NONE);
> @@ -750,8 +749,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, stru=
ct ieee80211_vif *vif,
>  		mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
>  					    true);
> =20
> -	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
> -			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> +	mt7921_mac_sta_airtime_clear(dev, msta);
> =20
>  	mt7921_mcu_sta_update(dev, sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
> =20
> @@ -769,8 +767,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, str=
uct ieee80211_vif *vif,
>  	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
> =20
>  	mt7921_mcu_sta_update(dev, sta, vif, false, MT76_STA_INFO_STATE_NONE);
> -	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
> -			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> +	mt7921_mac_sta_airtime_clear(dev, msta);
> =20
>  	if (vif->type =3D=3D NL80211_IFTYPE_STATION) {
>  		struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index c161031ac62a..8b704d08509d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -362,6 +362,8 @@ void mt7921_stop(struct ieee80211_hw *hw);
>  int mt7921_mac_init(struct mt7921_dev *dev);
>  bool mt7921_mac_wtbl_update(struct mt7921_dev *dev, int idx, u32 mask);
>  void mt7921_mac_reset_counters(struct mt7921_phy *phy);
> +void mt7921_mac_sta_airtime_clear(struct mt7921_dev *dev,
> +				  struct mt7921_sta *msta);
>  void mt7921_mac_set_timing(struct mt7921_phy *phy);
>  int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
>  		       struct ieee80211_sta *sta);
> --=20
> 2.25.1
>=20

--GBjSkNIqgczU0Eds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYwc1sgAKCRA6cBh0uS2t
rNOxAPsECOLlQF/2VpapcI3Y3xn1EgbJRfjKrcUJkCoZQdFH+wD+L3ppCfAFtnUz
9FB5FYkBrVZRHHsGQiXvXPoTpmKlDgk=
=SeO5
-----END PGP SIGNATURE-----

--GBjSkNIqgczU0Eds--

