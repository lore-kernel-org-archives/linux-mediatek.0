Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B464D3B7EA
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Dec 2025 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLTHVRIrMGwkZo4LCiidgq+vmyOpPqGHLtMSk6YnXAo=; b=Qo6aBYOTyPE0p770VszF7IHi10
	ULYlKBpAFmTJi5SeyZcAwj5BRJxUswFn5pUigL0f8k5jtPF8kZHxwFpyrNxIDQECBFM4CO/5iZeJt
	FZnEMk9IivlDkIJwoBQAY7vQdTMaS8R2/NUNvv4smlg+eifUA9kJqSpE2aXh/lBoKEHgI3KHtGb28
	cpZdAf55P4eucmj0OzvsLTfcsM9fsJ1P0mK0DOuD0ccN2d8fYIECOvO26Kiej2fpWIzRPvcW4OFSE
	Rs8aTm0Fhtbxm+0MBwz+MRof8g9E87vk1C7fefWDfuLFwW9VEvhktwSZt5LlH4j+tovfhQbPtdYAS
	vG4Rrqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvl6-0000000EBAg-3gmg;
	Tue, 09 Dec 2025 11:19:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvl5-0000000EBAW-3gyd
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Dec 2025 11:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A90FA600B0;
	Tue,  9 Dec 2025 11:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E844C4CEF5;
	Tue,  9 Dec 2025 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765279194;
	bh=amoMjqp7xLQSCw2ECKhW9piw6Bu0d9HEf10a6fZssxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PL5ppFrIoOb5w+MHMn8casV8pH41KTZTbEGA+fm5Nk+nhtfQL67BesMtClxbPmipp
	 cXuHfAxM0X4hptc26el1gGu0L/zAQmBupdIpDxgqFrWqXmuiadp8Uf8fOBdBWIz2WM
	 gJVpZ0NWOQ0FlRgIXXiV3TmDAFCbkhFkjx1C9z3Hi1NirSx1kORFs3T5Wv0/9bcGpT
	 eWuoiCTBgNR3GrhySj54I4AUxplmrM8JM0cfG6OdDyfGnbdnbuOm4FcNEnZGhF0AF5
	 OeUU3sfTtVE+IHy5LZWS+yvxdO5ekCPSKUiXxHMpjhKn+/C19fQLV/gZx8DrcqxEkS
	 ENef2948twPEw==
Date: Tue, 9 Dec 2025 12:19:52 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Subject: Re: [PATCH mt76 2/7] wifi: mt76: mt7996: fix the behavior of radar
 detection
Message-ID: <aTgF2MVHFo9fNxHQ@lore-desk>
References: <20251125034639.1416214-1-shayne.chen@mediatek.com>
 <20251125034639.1416214-2-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7u/lKbPiqnu0RI2x"
Content-Disposition: inline
In-Reply-To: <20251125034639.1416214-2-shayne.chen@mediatek.com>
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


--7u/lKbPiqnu0RI2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 25, Shayne Chen wrote:
> From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
>=20
> RDD_DET_MODE is a firmware command intended for testing and does not
> pause TX after radar detection, so remove it from the normal flow;
> instead, use the MAC_ENABLE_CTRL firmware command to resume TX after
> the radar-triggered channel switch completes.
>=20
> Fixes: 1529e335f93d ("wifi: mt76: mt7996: rework radar HWRDD idx")
> Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7996/mac.c   |  8 +---
>  .../net/wireless/mediatek/mt76/mt7996/main.c  | 20 ++++++++
>  .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 46 ++++++++++++++++---
>  .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  1 +
>  .../wireless/mediatek/mt76/mt7996/mt7996.h    |  2 +
>  5 files changed, 65 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index 2560e2f46e89..ce85d8f1bde6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -2973,7 +2973,7 @@ static void mt7996_dfs_stop_radar_detector(struct m=
t7996_phy *phy)
> =20
>  static int mt7996_dfs_start_rdd(struct mt7996_dev *dev, int rdd_idx)
>  {
> -	int err, region;
> +	int region;
> =20
>  	switch (dev->mt76.region) {
>  	case NL80211_DFS_ETSI:
> @@ -2988,11 +2988,7 @@ static int mt7996_dfs_start_rdd(struct mt7996_dev =
*dev, int rdd_idx)
>  		break;
>  	}
> =20
> -	err =3D mt7996_mcu_rdd_cmd(dev, RDD_START, rdd_idx, region);
> -	if (err < 0)
> -		return err;
> -
> -	return mt7996_mcu_rdd_cmd(dev, RDD_DET_MODE, rdd_idx, 1);
> +	return mt7996_mcu_rdd_cmd(dev, RDD_START, rdd_idx, region);
>  }
> =20
>  static int mt7996_dfs_start_radar_detector(struct mt7996_phy *phy)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/main.c
> index 9b4bfb071292..18c6cdaae20b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -79,6 +79,7 @@ static void mt7996_stop_phy(struct mt7996_phy *phy)
> =20
>  	mutex_lock(&dev->mt76.mutex);
> =20
> +	mt7996_mcu_rdd_resume_tx(phy);
>  	mt7996_mcu_set_radio_en(phy, false);
> =20
>  	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
> @@ -954,6 +955,24 @@ mt7996_channel_switch_beacon(struct ieee80211_hw *hw,
>  	mutex_unlock(&dev->mt76.mutex);
>  }
> =20
> +static int
> +mt7996_post_channel_switch(struct ieee80211_hw *hw, struct ieee80211_vif=
 *vif,
> +			   struct ieee80211_bss_conf *link_conf)
> +{
> +	struct cfg80211_chan_def *chandef =3D &link_conf->chanreq.oper;
> +	struct mt7996_dev *dev =3D mt7996_hw_dev(hw);
> +	struct mt7996_phy *phy =3D mt7996_band_phy(dev, chandef->chan->band);
> +	int ret;
> +
> +	mutex_lock(&dev->mt76.mutex);
> +
> +	ret =3D mt7996_mcu_rdd_resume_tx(phy);
> +
> +	mutex_unlock(&dev->mt76.mutex);
> +
> +	return ret;
> +}
> +
>  static int
>  mt7996_mac_sta_init_link(struct mt7996_dev *dev,
>  			 struct ieee80211_bss_conf *link_conf,
> @@ -2327,6 +2346,7 @@ const struct ieee80211_ops mt7996_ops =3D {
>  	.release_buffered_frames =3D mt76_release_buffered_frames,
>  	.get_txpower =3D mt7996_get_txpower,
>  	.channel_switch_beacon =3D mt7996_channel_switch_beacon,
> +	.post_channel_switch =3D mt7996_post_channel_switch,
>  	.get_stats =3D mt7996_get_stats,
>  	.get_et_sset_count =3D mt7996_get_et_sset_count,
>  	.get_et_stats =3D mt7996_get_et_stats,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.c
> index 7be03bbf34d4..c18c809ac77a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -520,24 +520,32 @@ mt7996_mcu_rx_radar_detected(struct mt7996_dev *dev=
, struct sk_buff *skb)
>  		break;
>  	case MT_RDD_IDX_BACKGROUND:
>  		if (!dev->rdd2_phy)
> -			return;
> +			goto err;
>  		mphy =3D dev->rdd2_phy->mt76;
>  		break;
>  	default:
> -		dev_err(dev->mt76.dev, "Unknown RDD idx %d\n", r->rdd_idx);
> -		return;
> +		goto err;
>  	}
> =20
>  	if (!mphy)
> -		return;
> +		goto err;
> =20
> -	if (r->rdd_idx =3D=3D MT_RDD_IDX_BACKGROUND)
> +	if (r->rdd_idx =3D=3D MT_RDD_IDX_BACKGROUND) {
>  		cfg80211_background_radar_event(mphy->hw->wiphy,
>  						&dev->rdd2_chandef,
>  						GFP_ATOMIC);
> -	else
> +	} else {
> +		struct mt7996_phy *phy =3D mphy->priv;
> +
> +		phy->rdd_tx_paused =3D true;
>  		ieee80211_radar_detected(mphy->hw, NULL);
> +	}
>  	dev->hw_pattern++;
> +
> +	return;
> +
> +err:
> +	dev_err(dev->mt76.dev, "Invalid RDD idx %d\n", r->rdd_idx);
>  }
> =20
>  static void
> @@ -4610,6 +4618,32 @@ int mt7996_mcu_set_radio_en(struct mt7996_phy *phy=
, bool enable)
>  				 &req, sizeof(req), true);
>  }
> =20
> +int mt7996_mcu_rdd_resume_tx(struct mt7996_phy *phy)
> +{
> +	struct {
> +		u8 band_idx;
> +		u8 _rsv[3];
> +
> +		__le16 tag;
> +		__le16 len;
> +		u8 mac_enable;
> +		u8 _rsv2[3];
> +	} __packed req =3D {
> +		.band_idx =3D phy->mt76->band_idx,
> +		.tag =3D cpu_to_le16(UNI_BAND_CONFIG_MAC_ENABLE_CTRL),
> +		.len =3D cpu_to_le16(sizeof(req) - 4),
> +		.mac_enable =3D 2,
> +	};
> +
> +	if (!phy->rdd_tx_paused)
> +		return 0;
> +
> +	phy->rdd_tx_paused =3D false;

should you check the return value of mt76_mcu_send_msg() before setting
rdd_tx_paused to false here?

Regards,
Lorenzo

> +
> +	return mt76_mcu_send_msg(&phy->dev->mt76, MCU_WM_UNI_CMD(BAND_CONFIG),
> +				 &req, sizeof(req), true);
> +}
> +
>  int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 rdd_idx, u8 v=
al)
>  {
>  	struct {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.h
> index fc8b09e76f01..5b3597ca79be 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
> @@ -835,6 +835,7 @@ enum {
>  enum {
>  	UNI_BAND_CONFIG_RADIO_ENABLE,
>  	UNI_BAND_CONFIG_RTS_THRESHOLD =3D 0x08,
> +	UNI_BAND_CONFIG_MAC_ENABLE_CTRL =3D 0x0c,
>  };
> =20
>  enum {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers=
/net/wireless/mediatek/mt76/mt7996/mt7996.h
> index 7a884311800e..d31864f973cc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> @@ -377,6 +377,7 @@ struct mt7996_phy {
> =20
>  	bool has_aux_rx;
>  	bool counter_reset;
> +	bool rdd_tx_paused;
>  };
> =20
>  struct mt7996_dev {
> @@ -726,6 +727,7 @@ int mt7996_mcu_get_temperature(struct mt7996_phy *phy=
);
>  int mt7996_mcu_set_thermal_throttling(struct mt7996_phy *phy, u8 state);
>  int mt7996_mcu_set_thermal_protect(struct mt7996_phy *phy, bool enable);
>  int mt7996_mcu_set_txpower_sku(struct mt7996_phy *phy);
> +int mt7996_mcu_rdd_resume_tx(struct mt7996_phy *phy);
>  int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 rdd_idx, u8 v=
al);
>  int mt7996_mcu_rdd_background_enable(struct mt7996_phy *phy,
>  				     struct cfg80211_chan_def *chandef);
> --=20
> 2.51.0
>=20

--7u/lKbPiqnu0RI2x
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaTgF2AAKCRA6cBh0uS2t
rNbEAP47Y/VZCHtiOF21Rj5+0olveOrvHIVDgauXObmR0xjbjgEAslwKOdKp6nk5
iaKpCbLihG1Ntz/wQd8QXDqivxyf2wM=
=zrln
-----END PGP SIGNATURE-----

--7u/lKbPiqnu0RI2x--

