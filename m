Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC20C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06ZF4ItelX89VwssdKIMjisyN2uexg+uSdwhfkwcQas=; b=HXMCA6i8o3sGDR2nf60NwRqgb3
	iK28NDpaLoCax0O/KQawROEA6fBug8v71Ay/6GJWUBYxDUKVI6t0RAWFIN+kZjjOVHVveSwTSc0ZK
	ysJniE3vyFhO1KQ26UeF21emVKPhLzlec7YlWv/qNdLSVCw7brvLfR3XpETsQ4GgxVlZw61pMi6x6
	AQvRR8qrZ5CyAvJOLZVemKBvEEZrMdCvWXFMS9FPyA7UhwBSneG1SUw5uu/6yNjYWkyCmkUiBSPxm
	eUCji+q7UAPI8uPo/OzH4tFGNaHHZJp+FBpqyJMwoQPEnAuzkXLn5KuMxq7Pn8ogJLnxx1IxQaktO
	e1vwDsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbPD8-00Fi5A-8z; Mon, 04 Apr 2022 16:05:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbPAQ-00FgdZ-Qc
 for linux-mediatek@lists.infradead.org; Mon, 04 Apr 2022 16:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649088176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EiZF/Qr6iwGs2hyqUfY7JePap+6rMqg9c0ZRjVkijgY=;
 b=i/HCaEqv8JbKQRBcNnZJ+i82m2PjECdV47wLwMzEDuvInuEYbkyc7aM4/sI5Z4Iq4hUFTj
 qiCB2ZR0fmfNoNDOZh3lQh4a37z6MQczk8ynCJVM3o24Ps63/NCNGRv0SgAOOFnRkr1d83
 s4whTgHSswWgyu5672SGj4PTCjkJpXA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-T-O7J53yOMG3wabsP6ONLQ-1; Mon, 04 Apr 2022 12:02:53 -0400
X-MC-Unique: T-O7J53yOMG3wabsP6ONLQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h16-20020adfaa90000000b002061894030bso454931wrc.0
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Apr 2022 09:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EiZF/Qr6iwGs2hyqUfY7JePap+6rMqg9c0ZRjVkijgY=;
 b=klRPc8eK5Igu8I+bW7JjWaVnZ/0xXQ2HEzOsaZa5H3NqrUv1sFIj9qaOnRFDRzpSJk
 ktHQZAYg8IpV7DtlVnAwxtyw4WkeJ08BIHQKGj83GRMtizLEtD+A3rk7y7PplgCSTsep
 k0Q4QbW9iCVsF/IWdp6oqWctRhD+EzLdbKzB/lu28W0g1auKcgHPkn8t5lxZ20Rps03o
 LmkJfQ2V/9sc2bTIaCZw4Ra9qOGseB1XfC1RdLDTAr0o6l/ukk51iXglCk75gqEjV0Qw
 sc9HWPHYRmxRcjzQ2N2s6vOeHR7VDt9pD3uwxzxE6ZMWo+5I9ROf30i86qEklynQBI58
 WMWA==
X-Gm-Message-State: AOAM532+StXb53STNwppKknxKWlcByIYrkB++jBy1zwKbvtbl4iutMiE
 R+jxoBom64gSfYuhlcChbzdTlsK8p8CNxHE+Sv/Dwqc51/W8au2fofkSOGZlOjVcswWJ+Jm9ID6
 llOiPrFPnPfimfte8Pe3eNp1Ui/Mc+BLK
X-Received: by 2002:adf:fa83:0:b0:206:1084:37ec with SMTP id
 h3-20020adffa83000000b00206108437ecmr319493wrr.417.1649088171794; 
 Mon, 04 Apr 2022 09:02:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBtkmi51Emk8lk2sAi1xWnflI1HmHtccdOxfugooLvTWF4xGaZjTMErg4JiMatd6Wb2SUn3A==
X-Received: by 2002:adf:fa83:0:b0:206:1084:37ec with SMTP id
 h3-20020adffa83000000b00206108437ecmr319472wrr.417.1649088171525; 
 Mon, 04 Apr 2022 09:02:51 -0700 (PDT)
Received: from localhost (net-93-71-56-156.cust.vodafonedsl.it. [93.71.56.156])
 by smtp.gmail.com with ESMTPSA id
 100-20020adf806d000000b00205ba671b25sm9842086wrk.56.2022.04.04.09.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 09:02:50 -0700 (PDT)
Date: Mon, 4 Apr 2022 18:02:49 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com,
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: Add hotspot mode support
Message-ID: <YksWqWcwmIHcttDv@lore-desk>
References: <734908dd741b85b7cc3855f23596cc5884c335e4.1648765636.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <734908dd741b85b7cc3855f23596cc5884c335e4.1648765636.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_090259_046344_EA317FD9 
X-CRM114-Status: GOOD (  25.96  )
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
Content-Type: multipart/mixed; boundary="===============5247387032030044192=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5247387032030044192==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+BimVkDN4/xKoKAF"
Content-Disposition: inline


--+BimVkDN4/xKoKAF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> add hostspot mode support to mt7921 that can work for mt7921[e,s,u]
> with the common code.
>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/init.c  | 11 ++-
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   |  9 +++
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 46 +++++++++++
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 79 ++++++++++++++++++-
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  4 +
>  5 files changed, 147 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index 91fc41922d95..f9e1255bd9c7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -11,6 +11,10 @@ static const struct ieee80211_iface_limit if_limits[] =
=3D {
>  	{
>  		.max =3D MT7921_MAX_INTERFACES,
>  		.types =3D BIT(NL80211_IFTYPE_STATION)
> +	},
> +	{
> +		.max =3D 1,
> +		.types =3D BIT(NL80211_IFTYPE_AP)
>  	}
>  };
> =20
> @@ -64,7 +68,8 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
>  	wiphy->iface_combinations =3D if_comb;
>  	wiphy->flags &=3D ~(WIPHY_FLAG_IBSS_RSN | WIPHY_FLAG_4ADDR_AP |
>  			  WIPHY_FLAG_4ADDR_STATION);
> -	wiphy->interface_modes =3D BIT(NL80211_IFTYPE_STATION);
> +	wiphy->interface_modes =3D BIT(NL80211_IFTYPE_STATION) |
> +				 BIT(NL80211_IFTYPE_AP);
>  	wiphy->n_iface_combinations =3D ARRAY_SIZE(if_comb);
>  	wiphy->max_scan_ie_len =3D MT76_CONNAC_SCAN_IE_LEN;
>  	wiphy->max_scan_ssids =3D 4;
> @@ -80,6 +85,10 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
>  	wiphy->features |=3D NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
>  			   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
>  	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SET_SCAN_DWELL);
> +	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_LEGACY);
> +	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HT);
> +	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_VHT);
> +	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HE);
> =20
>  	ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
>  	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index f34070ca7bbe..368e54c53ddd 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -1361,12 +1361,21 @@ mt7921_vif_connect_iter(void *priv, u8 *mac,
>  {
>  	struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
>  	struct mt7921_dev *dev =3D mvif->phy->dev;
> +	struct ieee80211_hw *hw =3D mt76_hw(dev);
> =20
>  	if (vif->type =3D=3D NL80211_IFTYPE_STATION)
>  		ieee80211_disconnect(vif, true);
> =20
>  	mt76_connac_mcu_uni_add_dev(&dev->mphy, vif, &mvif->sta.wcid, true);
>  	mt7921_mcu_set_tx(dev, vif);
> +
> +	if (vif->type =3D=3D NL80211_IFTYPE_AP) {
> +		mt76_connac_mcu_uni_add_bss(dev->phy.mt76, vif, &mvif->sta.wcid,
> +					    true);
> +		mt7921_mcu_sta_update(dev, NULL, vif, true,
> +				      MT76_STA_INFO_STATE_NONE);
> +		mt7921_mcu_uni_add_beacon_offload(dev, hw, vif, true);
> +	}
>  }
> =20
>  /* system error recovery */
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index ae86705faec2..52b7e3684189 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -53,6 +53,7 @@ mt7921_init_he_caps(struct mt7921_phy *phy, enum nl8021=
1_band band,
> =20
>  		switch (i) {
>  		case NL80211_IFTYPE_STATION:
> +		case NL80211_IFTYPE_AP:
>  			break;
>  		default:
>  			continue;
> @@ -86,6 +87,23 @@ mt7921_init_he_caps(struct mt7921_phy *phy, enum nl802=
11_band band,
>  			IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
> =20
>  		switch (i) {
> +		case NL80211_IFTYPE_AP:
> +			he_cap_elem->mac_cap_info[2] |=3D
> +				IEEE80211_HE_MAC_CAP2_BSR;
> +			he_cap_elem->mac_cap_info[4] |=3D
> +				IEEE80211_HE_MAC_CAP4_BQR;
> +			he_cap_elem->mac_cap_info[5] |=3D
> +				IEEE80211_HE_MAC_CAP5_OM_CTRL_UL_MU_DATA_DIS_RX;
> +			he_cap_elem->phy_cap_info[3] |=3D
> +				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
> +				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_QPSK;
> +			he_cap_elem->phy_cap_info[6] |=3D
> +				IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
> +				IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
> +			he_cap_elem->phy_cap_info[9] |=3D
> +				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
> +				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU;
> +			break;
>  		case NL80211_IFTYPE_STATION:
>  			he_cap_elem->mac_cap_info[1] |=3D
>  				IEEE80211_HE_MAC_CAP1_TF_MAC_PAD_DUR_16US;
> @@ -634,6 +652,21 @@ static void mt7921_bss_info_changed(struct ieee80211=
_hw *hw,
>  		}
>  	}
> =20
> +	if (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon) {
> +		struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
> +
> +		mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid,
> +					    true);
> +		mt7921_mcu_sta_update(dev, NULL, vif, true,
> +				      MT76_STA_INFO_STATE_NONE);
> +	}
> +
> +	if (changed & (BSS_CHANGED_BEACON |
> +		       BSS_CHANGED_BEACON_ENABLED)) {

nit: we do not need brackets here.

> +		mt7921_mcu_uni_add_beacon_offload(dev, hw, vif,
> +						  info->enable_beacon);
> +	}
> +
>  	/* ensure that enable txcmd_mode after bss_info */
>  	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))
>  		mt7921_mcu_set_tx(dev, vif);
> @@ -1394,6 +1427,18 @@ static int mt7921_set_sar_specs(struct ieee80211_h=
w *hw,
>  	return err;
>  }
> =20
> +static void
> +mt7921_channel_switch_beacon(struct ieee80211_hw *hw,
> +			     struct ieee80211_vif *vif,
> +			     struct cfg80211_chan_def *chandef)
> +{
> +	struct mt7921_dev *dev =3D mt7921_hw_dev(hw);
> +
> +	mt7921_mutex_acquire(dev);
> +	mt7921_mcu_uni_add_beacon_offload(dev, hw, vif, true);
> +	mt7921_mutex_release(dev);
> +}
> +
>  const struct ieee80211_ops mt7921_ops =3D {
>  	.tx =3D mt7921_tx,
>  	.start =3D mt7921_start,
> @@ -1412,6 +1457,7 @@ const struct ieee80211_ops mt7921_ops =3D {
>  	.set_rts_threshold =3D mt7921_set_rts_threshold,
>  	.wake_tx_queue =3D mt76_wake_tx_queue,
>  	.release_buffered_frames =3D mt76_release_buffered_frames,
> +	.channel_switch_beacon =3D mt7921_channel_switch_beacon,
>  	.get_txpower =3D mt76_get_txpower,
>  	.get_stats =3D mt7921_get_stats,
>  	.get_et_sset_count =3D mt7921_get_et_sset_count,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index da2be050ed7c..1ecbbe4fa498 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -248,7 +248,8 @@ mt7921_mcu_connection_loss_iter(void *priv, u8 *mac,
>  	if (mvif->idx !=3D event->bss_idx)
>  		return;
> =20
> -	if (!(vif->driver_flags & IEEE80211_VIF_BEACON_FILTER))
> +	if (!(vif->driver_flags & IEEE80211_VIF_BEACON_FILTER) ||
> +	    vif->type !=3D NL80211_IFTYPE_STATION)
>  		return;
> =20
>  	ieee80211_connection_loss(vif);
> @@ -1166,3 +1167,79 @@ int mt7921_mcu_set_sniffer(struct mt7921_dev *dev,=
 struct ieee80211_vif *vif,
>  	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(SNIFFER), &req, sizeof=
(req),
>  				 true);
>  }
> +
> +int
> +mt7921_mcu_uni_add_beacon_offload(struct mt7921_dev *dev,
> +				  struct ieee80211_hw *hw,
> +				  struct ieee80211_vif *vif,
> +				  bool enable)
> +{
> +	struct mt7921_vif *mvif =3D (struct mt7921_vif *)vif->drv_priv;
> +	struct mt76_wcid *wcid =3D &dev->mt76.global_wcid;
> +	struct ieee80211_mutable_offsets offs;
> +	struct {
> +		struct req_hdr {
> +			u8 bss_idx;
> +			u8 pad[3];
> +		} __packed hdr;
> +		struct bcn_content_tlv {
> +			__le16 tag;
> +			__le16 len;
> +			__le16 tim_ie_pos;
> +			__le16 csa_ie_pos;
> +			__le16 bcc_ie_pos;

does the fw support bcc IE? if so I guess we introduce support for it here,
right?

Regards,
Lorenzo

> +			/* 0: disable beacon offload
> +			 * 1: enable beacon offload
> +			 * 2: update probe respond offload
> +			 */
> +			u8 enable;
> +			/* 0: legacy format (TXD + payload)
> +			 * 1: only cap field IE
> +			 */
> +			u8 type;
> +			__le16 pkt_len;
> +			u8 pkt[512];
> +		} __packed beacon_tlv;
> +	} req =3D {
> +		.hdr =3D {
> +			.bss_idx =3D mvif->mt76.idx,
> +		},
> +		.beacon_tlv =3D {
> +			.tag =3D cpu_to_le16(UNI_BSS_INFO_BCN_CONTENT),
> +			.len =3D cpu_to_le16(sizeof(struct bcn_content_tlv)),
> +			.enable =3D enable,
> +		},
> +	};
> +	struct sk_buff *skb;
> +
> +	if (!enable)
> +		goto out;
> +
> +	skb =3D ieee80211_beacon_get_template(mt76_hw(dev), vif, &offs);
> +	if (!skb)
> +		return -EINVAL;
> +
> +	if (skb->len > 512 - MT_TXD_SIZE) {
> +		dev_err(dev->mt76.dev, "beacon size limit exceed\n");
> +		dev_kfree_skb(skb);
> +		return -EINVAL;
> +	}
> +
> +	mt7921_mac_write_txwi(dev, (__le32 *)(req.beacon_tlv.pkt), skb,
> +			      wcid, NULL, 0, true);
> +	memcpy(req.beacon_tlv.pkt + MT_TXD_SIZE, skb->data, skb->len);
> +	req.beacon_tlv.pkt_len =3D cpu_to_le16(MT_TXD_SIZE + skb->len);
> +	req.beacon_tlv.tim_ie_pos =3D cpu_to_le16(MT_TXD_SIZE + offs.tim_offset=
);
> +
> +	if (offs.cntdwn_counter_offs[0]) {
> +		u16 csa_offs;
> +
> +		csa_offs =3D MT_TXD_SIZE + offs.cntdwn_counter_offs[0] - 4;
> +		req.beacon_tlv.csa_ie_pos =3D cpu_to_le16(csa_offs);
> +	}
> +	dev_kfree_skb(skb);
> +
> +out:
> +	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(BSS_INFO_UPDATE),
> +				 &req, sizeof(req), true);
> +}
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index eae223a31000..adbdb2e22934 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -469,4 +469,8 @@ int mt7921u_wfsys_reset(struct mt7921_dev *dev);
>  int mt7921u_dma_init(struct mt7921_dev *dev, bool resume);
>  int mt7921u_init_reset(struct mt7921_dev *dev);
>  int mt7921u_mac_reset(struct mt7921_dev *dev);
> +int mt7921_mcu_uni_add_beacon_offload(struct mt7921_dev *dev,
> +				      struct ieee80211_hw *hw,
> +				      struct ieee80211_vif *vif,
> +				      bool enable);
>  #endif
> --=20
> 2.25.1
>=20

--+BimVkDN4/xKoKAF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYksWqAAKCRA6cBh0uS2t
rFi5AQCYgFRj6aWGkwIUBlx7fLpDsMKfsksfa2TtpTbJjHMauwD+MpPXC1TMSCGm
yyYL9RQecimhGgc5MHrarfeslaVrwQo=
=qa06
-----END PGP SIGNATURE-----

--+BimVkDN4/xKoKAF--



--===============5247387032030044192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5247387032030044192==--


