Return-Path: <SRS0=SDo2=LO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC39BC48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 09:40:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE8C6100A
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 09:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DE8C6100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUPr9v4yyKdcedoVzEpZrR8b9fxzF5dr1+dKr8SIlRo=; b=J+edSiexkaBfBulHsHChQXN2G3
	cV1JrE7c2G10wT0JxUxi7Tx4nUGmT5ZaMUVj5QGDWwoIdzXJ+NMh3wGe0xn7GHoZMj+7bN6eV04GB
	6/1Oo8ukzPWEM8QpZEPj/LaEaQI3cAC0VfheXfre1OwniikJBGNQRq+Hdf9r2xQSRecNT72XVLgGT
	Y/XSdNCUiNG8NzBPHEmQPf6B2tWN3PprR2IsORqcrLbihAOaFE/DDQb7rR712hj1+h1UI5FksBClf
	0klxKviq89oNgBu8N877SH5/Q/3N8OlLqpQCkiXXkfxGSY6M8Zb2VdtnZ0cfjcos9JLlXkqWEzvON
	XVbGPZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lutwM-000ncm-UB; Sun, 20 Jun 2021 09:40:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lutwK-000ncK-Hi
 for linux-mediatek@lists.infradead.org; Sun, 20 Jun 2021 09:40:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21FE360FE8;
 Sun, 20 Jun 2021 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624182026;
 bh=8BhNwEcPn00QGGh83CZRkbLFwXQHbHpWp1rXZGdhOnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DRywM2k0SzNMdNYmHg89Ohft1OfWXtJppgI1SGrf+WLy2AyzGTweQsC7vCLfYmwNE
 r+QH3xy9emDDlhpm5D79e0BwMg5y5gSIq13wqIlYvWflmSmvMOghqNPfCmEhIOnDPA
 MboBBPTBdvDKhGXGld/xudHTDXW2Gav2gKXlfjcHs1Gy9guX40NqfDTMWD8s6PhcNM
 nA82EaTUlQJZwca4gRYblD5s1Eu9RoGnpEcAbOMyuNVVxRcw2qElBU2peK6/dOJ1SI
 +aUntDkLCXYiL+JmgktJy3U5SZu/DTHxbImw/yV2hwUKdZITUoBjbPFQ4zcLIMtVDy
 OyOxfHe8OnUAQ==
Date: Sun, 20 Jun 2021 11:40:21 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com,
 km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, jemele@google.com, yenlinlai@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: add .set_sar_specs support
Message-ID: <YM8NBUZp+/97kiIH@lore-desk>
References: <05d4551875d7ddf8de6679612ca3e650bded9926.1624167097.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <05d4551875d7ddf8de6679612ca3e650bded9926.1624167097.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_024028_677379_B1B79C2E 
X-CRM114-Status: GOOD (  26.27  )
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
Content-Type: multipart/mixed; boundary="===============7925126376988281402=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7925126376988281402==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s+HmzexPvHMkCcA1"
Content-Disposition: inline


--s+HmzexPvHMkCcA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: YN Chen <YN.Chen@mediatek.com>
>=20
> add .set_sar_specs to allow configuring SAR power limitations on the
> frequency ranges from the userland.
>=20
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  3 ++
>  .../net/wireless/mediatek/mt76/mt76_connac.h  |  5 +++
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 24 +++++++++-
>  .../net/wireless/mediatek/mt76/mt7921/init.c  | 21 +++++++++
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 45 +++++++++++++++++++
>  5 files changed, 97 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 25c5ceef5257..63ce5242c4d5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -636,6 +636,9 @@ struct mt76_phy {
>  		struct sk_buff **tail;
>  		u16 seqno;
>  	} rx_amsdu[__MT_RXQ_MAX];
> +
> +	void *frp_data;
> +	u8 num_frps;
>  };
> =20
>  struct mt76_dev {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/n=
et/wireless/mediatek/mt76/mt76_connac.h
> index f49d97d0a1c5..95c7d1cac7c4 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> @@ -83,6 +83,11 @@ struct mt76_connac_coredump {
>  	unsigned long last_activity;
>  };
> =20
> +struct mt76_connac_freq_range_power {
> +	const struct cfg80211_sar_freq_ranges *range;
> +	s8 power;
> +};
> +
>  extern const struct wiphy_wowlan_support mt76_connac_wowlan_support;
> =20
>  static inline bool is_mt7921(struct mt76_dev *dev)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 5c3a81e5f559..07f45cb4f500 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -1749,6 +1749,24 @@ mt76_connac_mcu_build_sku(struct mt76_dev *dev, s8=
 *sku,
>  	}
>  }
> =20
> +static s8 mt76_connac_get_sar_power(struct mt76_phy *phy,
> +				    struct ieee80211_channel *chan,
> +				    s8 target_power)
> +{
> +	struct mt76_connac_freq_range_power *frp =3D phy->frp_data;
> +	int freq, i;
> +
> +	freq =3D ieee80211_channel_to_frequency(chan->hw_value, chan->band);
> +	for (i =3D 0 ; i < phy->num_frps; i++) {
> +		if (frp[i].range &&
> +		    freq >=3D frp[i].range->start_freq &&
> +		    freq < frp[i].range->end_freq)
> +			target_power =3D min_t(s8, frp[i].power, target_power);

can we have overlapping freq range? if not I guess you can add a break here.

> +	}
> +
> +	return target_power;
> +}
> +
>  static int
>  mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
>  				  enum nl80211_band band)
> @@ -1816,9 +1834,13 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy =
*phy,
>  				.hw_value =3D ch_list[idx],
>  				.band =3D band,
>  			};
> +			s8 sar_power;
> +
> +			sar_power =3D mt76_connac_get_sar_power(phy, &chan,
> +							      tx_power);
> =20
>  			mt76_get_rate_power_limits(phy, &chan, &limits,
> -						   tx_power);
> +						   sar_power);
> =20
>  			tx_power_tlv.last_msg =3D ch_list[idx] =3D=3D last_ch;
>  			sku_tlbv.channel =3D ch_list[idx];
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index a9ce10b98827..e7f66d988a49 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -24,6 +24,20 @@ static const struct ieee80211_iface_combination if_com=
b[] =3D {
>  	}
>  };
> =20
> +const struct cfg80211_sar_freq_ranges mt7921_sar_freq_ranges[] =3D {
> +	{ .start_freq =3D 2402, .end_freq =3D 2494, },
> +	{ .start_freq =3D 5150, .end_freq =3D 5350, },
> +	{ .start_freq =3D 5350, .end_freq =3D 5470, },
> +	{ .start_freq =3D 5470, .end_freq =3D 5725, },
> +	{ .start_freq =3D 5725, .end_freq =3D 5950, },
> +};
> +
> +static const struct cfg80211_sar_capa mt7921_sar_capa =3D {
> +	.type =3D NL80211_SAR_TYPE_POWER,
> +	.num_freq_ranges =3D ARRAY_SIZE(mt7921_sar_freq_ranges),
> +	.freq_ranges =3D &mt7921_sar_freq_ranges[0],
> +};
> +
>  static void
>  mt7921_regd_notifier(struct wiphy *wiphy,
>  		     struct regulatory_request *request)
> @@ -75,6 +89,13 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
>  	wiphy->max_sched_scan_reqs =3D 1;
>  	wiphy->flags |=3D WIPHY_FLAG_HAS_CHANNEL_SWITCH;
>  	wiphy->reg_notifier =3D mt7921_regd_notifier;
> +	wiphy->sar_capa =3D &mt7921_sar_capa;
> +
> +	phy->mt76->frp_data =3D devm_kcalloc(dev->mt76.dev,
> +					   wiphy->sar_capa->num_freq_ranges,
> +					   sizeof(struct mt76_connac_freq_range_power),
> +					   GFP_KERNEL);

Here I guess we need to check if devm_kcalloc fails returning an int from
mt7921_init_wiphy()

> +	phy->mt76->num_frps =3D wiphy->sar_capa->num_freq_ranges;
> =20
>  	wiphy->features |=3D NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
>  			   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 7fd21049ff5a..e9b5d79e139f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -1171,6 +1171,50 @@ static void mt7921_sta_set_decap_offload(struct ie=
ee80211_hw *hw,
>  					     MCU_UNI_CMD_STA_REC_UPDATE);
>  }
> =20
> +static int mt7921_set_sar_specs(struct ieee80211_hw *hw,
> +				const struct cfg80211_sar_specs *sar)
> +{
> +	const struct cfg80211_sar_capa *capa =3D hw->wiphy->sar_capa;
> +	struct mt76_connac_freq_range_power *frp_data, *frp;
> +	struct mt7921_dev *dev =3D mt7921_hw_dev(hw);
> +	struct mt76_phy *mphy =3D hw->priv;
> +	int err;
> +	u32 i;
> +
> +	mt7921_mutex_acquire(dev);
> +
> +	if (!sar || sar->type !=3D NL80211_SAR_TYPE_POWER ||
> +	    sar->num_sub_specs =3D=3D 0) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}

I guess you can move this out of the lock

> +
> +	frp_data =3D mphy->frp_data;
> +
> +	for (i =3D 0; i < sar->num_sub_specs; i++) {
> +		u32 index =3D sar->sub_specs[i].freq_range_index;
> +		/* SAR specifies power limitaton in 0.25dbm */
> +		s32 power =3D sar->sub_specs[i].power >> 1;
> +
> +		if (power > 127 || power < -127)
> +			power =3D 127;
> +
> +		if (index >=3D mphy->num_frps)
> +			continue;
> +
> +		frp =3D &frp_data[index];
> +		frp->range =3D &capa->freq_ranges[index];

I guess there is an use-after-free here since sar is freed at the end of
nl80211_set_sar_specs, right?

Regards,
Lorenzo

> +		frp->power =3D power;
> +	}
> +
> +	err =3D mt76_connac_mcu_set_rate_txpower(mphy);
> +
> +out:
> +	mt7921_mutex_release(dev);
> +
> +	return err;
> +}
> +
>  const struct ieee80211_ops mt7921_ops =3D {
>  	.tx =3D mt7921_tx,
>  	.start =3D mt7921_start,
> @@ -1209,4 +1253,5 @@ const struct ieee80211_ops mt7921_ops =3D {
>  	.set_rekey_data =3D mt7921_set_rekey_data,
>  #endif /* CONFIG_PM */
>  	.flush =3D mt7921_flush,
> +	.set_sar_specs =3D mt7921_set_sar_specs,
>  };
> --=20
> 2.25.1
>=20

--s+HmzexPvHMkCcA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYM8NAwAKCRA6cBh0uS2t
rPO8APwMPm+IbwGECFPvMko76rrnHWifWvKBYyiLm6535Y7P0QEA5rYMFdl1QvVO
2f7NBsh1RPs6Ln16wcIpeDAsJE7jdw4=
=wFmb
-----END PGP SIGNATURE-----

--s+HmzexPvHMkCcA1--


--===============7925126376988281402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7925126376988281402==--

