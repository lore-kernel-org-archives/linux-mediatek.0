Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9F5C47082
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 08:37:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D0E6136E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 08:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D0E6136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJVy7ZVynNrNRsnBQxVuj5/ghU4l4N8RBE4NXiCCbD0=; b=M4NEnpMoma6QFxbgRxFxdEmV/K
	3Xt4kk4lm4vU9KOGnSo6xXakKG2a8oKhEEoSs4ZCEyBzPSF5G7PNBpGb3mrry6msELJ0+md/85yLx
	8FAbZX/2Ll5dpV3icy8WnOj/lWcwJ1tzbVQJ/a+AqDn6PIzNvgao+RWcn1VB4o1SrX9Tt9kDFVrLL
	MPPmdjwl6FX9m3PQX9hI16e7q/hCsBs0UejQGCThAFzg7ULtKa47HNNV/pvXJx2LxRxegEXazUMnN
	flkHQTHQdZF+rRjHLjmBgwig7Mn3X+uVXco30+5MuELNY4nQhw8YMmB+TnfuOEwuv1h3elJfAZ7Kp
	RvV2TVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loiqe-007iQa-H7; Thu, 03 Jun 2021 08:37:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loiqb-007iQ2-Tc
 for linux-mediatek@lists.infradead.org; Thu, 03 Jun 2021 08:37:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2B7D61008;
 Thu,  3 Jun 2021 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622709421;
 bh=T2j1kK4KUGa2RWqXdkMdX/nO1XjJdI47yipEgTJfLVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fRw8/3+yp0aKqSWJzU2RQ4rWTFDKl9oO4WtKgJ3AKuD+DK6lmCKb0lXF6KrZZ8i24
 hRbMRnvvkcX9Zosfwm/uNFD7GV/bMo4xD00Arskwr1oAyt4Pkx9PknyqcnZ5kWYz54
 cAlwiiZqw3Hu4nejPHYvk7qFhIwjuZmgS/QqbQgjTfTQvbQZXgMaDYvCERXRMMY1Jn
 D7xeltdksx0zyfI35AJsueC8tv7Zsa+Dz6bj1XzY8VcwnRPmCM1L/VLgMw798C3YHi
 R9TzujHoTBfoCKfoP+NJnO+xyPwFbFuFHiA8d1RNrskwGEr4QCE/MqCulAIynXh3pL
 uMm/wk5ywxk4w==
Date: Thu, 3 Jun 2021 10:36:56 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/2] mt76: mt7921: fix sta_state incorrect
 implementation
Message-ID: <YLiUqHHsVF2ZqL+1@lore-desk>
References: <eefc22e4c64c8605bcaf2aa0feae0ef3d4084ebf.1622688431.git.objelf@gmail.com>
 <e0a33a31da8a69dcf13d30e2d2591329c8d33689.1622688431.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e0a33a31da8a69dcf13d30e2d2591329c8d33689.1622688431.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_013702_022600_DC9ACFED 
X-CRM114-Status: GOOD (  25.78  )
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
Content-Type: multipart/mixed; boundary="===============1414989525821883661=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1414989525821883661==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="glSRNysLCxhi4tEa"
Content-Disposition: inline


--glSRNysLCxhi4tEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> When .sta_state is implemented, mac80211 assumes that the station entry is
> usable after the NOTEXIST->NONE transition.
>=20
> So we should create the sta entry as early as possible in order that
> mac80211 pass assoc/auth frames to mt76 with the newly created sta entry,
> and add .sta_assoc to mt76 core to refresh the sta entry again when sta is
> being associated.
>=20
> Fixes: 8aa5a9b7361c ("mt76: mt7921: enable deep sleep at runtime")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v1->v2: Put back the careless change not belonged to the patch to keep
> 	mt7921_mcu_sta_add for BC entry and mt76_connac_mcu_uni_add_bss
> 	on the association.
> v2->v3: 1. rebase the latest mt76
> 	2. squashing 2/3 to the one
> 	3. add the proper lock in mt7921_mac_sta_assoc
> ---
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 55 ++++++++-----------
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 20 +++++++
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  4 ++
>  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  1 +
>  4 files changed, 49 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index c641a92b140c..af98835b5134 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -618,18 +618,14 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struc=
t ieee80211_vif *vif,
>  	if (ret)
>  		return ret;
> =20
> -	if (vif->type =3D=3D NL80211_IFTYPE_STATION) {
> +	if (vif->type =3D=3D NL80211_IFTYPE_STATION)
>  		mvif->wep_sta =3D msta;
> -		if (!sta->tdls)
> -			mt76_connac_mcu_uni_add_bss(&dev->mphy, vif,
> -						    &mvif->sta.wcid, true);
> -	}
> =20
>  	mt7921_mac_wtbl_update(dev, idx,
>  			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> =20
>  	ret =3D mt7921_mcu_sta_add(dev, sta, vif, true,
> -				 MT76_STA_INFO_STATE_ASSOC);
> +				 MT76_STA_INFO_STATE_NONE);
>  	if (ret)
>  		return ret;
> =20
> @@ -638,6 +634,27 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct=
 ieee80211_vif *vif,
>  	return 0;
>  }
> =20
> +void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *v=
if,
> +			  struct ieee80211_sta *sta)
> +{
> +	struct mt7921_dev *dev =3D container_of(mdev, struct mt7921_dev, mt76);
> +	struct mt7921_sta *msta =3D (struct mt7921_sta *)sta->drv_priv;
> +	struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
> +
> +	mt7921_mutex_acquire(dev);
> +
> +	if (vif->type =3D=3D NL80211_IFTYPE_STATION && !sta->tdls)
> +		mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
> +					    true);
> +
> +	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
> +			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> +
> +	mt7921_mcu_sta_update(dev, sta, vif, MT76_STA_INFO_STATE_ASSOC);
> +
> +	mt7921_mutex_release(dev);
> +}
> +
>  void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *=
vif,
>  			   struct ieee80211_sta *sta)
>  {
> @@ -793,22 +810,6 @@ mt7921_ampdu_action(struct ieee80211_hw *hw, struct =
ieee80211_vif *vif,
>  	return ret;
>  }
> =20
> -static int
> -mt7921_sta_add(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> -	       struct ieee80211_sta *sta)
> -{
> -	return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NOTEXIST,
> -			      IEEE80211_STA_NONE);
> -}
> -
> -static int
> -mt7921_sta_remove(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> -		  struct ieee80211_sta *sta)
> -{
> -	return mt76_sta_state(hw, vif, sta, IEEE80211_STA_NONE,
> -			      IEEE80211_STA_NOTEXIST);
> -}
> -
>  static int mt7921_sta_state(struct ieee80211_hw *hw,
>  			    struct ieee80211_vif *vif,
>  			    struct ieee80211_sta *sta,
> @@ -823,15 +824,7 @@ static int mt7921_sta_state(struct ieee80211_hw *hw,
>  		mt7921_mutex_release(dev);
>  	}
> =20
> -	if (old_state =3D=3D IEEE80211_STA_AUTH &&
> -	    new_state =3D=3D IEEE80211_STA_ASSOC) {
> -		return mt7921_sta_add(hw, vif, sta);
> -	} else if (old_state =3D=3D IEEE80211_STA_ASSOC &&
> -		   new_state =3D=3D IEEE80211_STA_AUTH) {
> -		return mt7921_sta_remove(hw, vif, sta);
> -	}
> -
> -	return 0;
> +	return mt76_sta_state(hw, vif, sta, old_state, new_state);
>  }
> =20
>  static int
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 4f0fd9674950..ab338bdf4f4a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -1289,6 +1289,26 @@ int mt7921_mcu_sta_add(struct mt7921_dev *dev, str=
uct ieee80211_sta *sta,
>  	return mt76_connac_mcu_add_sta_cmd(&dev->mphy, &info);
>  }
> =20
> +int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *=
sta,
> +			  struct ieee80211_vif *vif, u8 state)
> +{
> +	struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
> +	int rssi =3D -ewma_rssi_read(&mvif->rssi);
> +	struct mt76_sta_cmd_info info =3D {
> +		.sta =3D sta,
> +		.vif =3D vif,
> +		.enable =3D true,
> +		.state =3D state,
> +		.cmd =3D MCU_UNI_CMD_STA_REC_UPDATE,
> +		.rcpi =3D to_rcpi(rssi),
> +	};
> +	struct mt7921_sta *msta;
> +
> +	msta =3D sta ? (struct mt7921_sta *)sta->drv_priv : NULL;
> +	info.wcid =3D msta ? &msta->wcid : &mvif->sta.wcid;
> +	return mt76_connac_mcu_update_sta_cmd(&dev->mphy, &info);

It seems to me it is quite the same of mt7921_mcu_sta_add, right?
Why not always use mt7921_mcu_sta_update?

Regards,
Lorenzo

> +}
> +
>  int __mt7921_mcu_drv_pmctrl(struct mt7921_dev *dev)
>  {
>  	struct mt76_phy *mphy =3D &dev->mt76.phy;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index d4d84b898011..196e47f89fc1 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -265,6 +265,8 @@ int mt7921_set_channel(struct mt7921_phy *phy);
>  int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
>  		       struct ieee80211_vif *vif, bool enable,
>  		       enum mt76_sta_info_state state);
> +int mt7921_mcu_sta_update(struct mt7921_dev *dev, struct ieee80211_sta *=
sta,
> +			  struct ieee80211_vif *vif, u8 state);
>  int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd);
>  int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif);
>  int mt7921_mcu_set_eeprom(struct mt7921_dev *dev);
> @@ -336,6 +338,8 @@ void mt7921_mac_fill_rx_vector(struct mt7921_dev *dev=
, struct sk_buff *skb);
>  void mt7921_mac_tx_free(struct mt7921_dev *dev, struct sk_buff *skb);
>  int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
>  		       struct ieee80211_sta *sta);
> +void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *v=
if,
> +			  struct ieee80211_sta *sta);
>  void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *=
vif,
>  			   struct ieee80211_sta *sta);
>  void mt7921_mac_work(struct work_struct *work);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index 13263f50dc00..27906b2cd912 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -106,6 +106,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>  		.rx_poll_complete =3D mt7921_rx_poll_complete,
>  		.sta_ps =3D mt7921_sta_ps,
>  		.sta_add =3D mt7921_mac_sta_add,
> +		.sta_assoc =3D mt7921_mac_sta_assoc,
>  		.sta_remove =3D mt7921_mac_sta_remove,
>  		.update_survey =3D mt7921_update_channel,
>  	};
> --=20
> 2.25.1
>=20

--glSRNysLCxhi4tEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYLiUpAAKCRA6cBh0uS2t
rP3BAP0e+UOpYqAuMuc8Axtzg1ThrClCoNvdP+2cxlF3OA1wdgEAq2i++VXnOLxM
L4TLndtLrAjIr2VjUGjSBs9HqsdZWgE=
=fGJR
-----END PGP SIGNATURE-----

--glSRNysLCxhi4tEa--


--===============1414989525821883661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1414989525821883661==--

