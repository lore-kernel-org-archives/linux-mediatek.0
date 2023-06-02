Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ADDC7EE24
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 18:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBZMzv/ot3Xku840SetQHiKKAX2JeYwIFN97L4FuYrk=; b=Nk77Sp/TW+BHuaHWKy0o55zSwu
	6T1rDzHFtoCQIhiP+Kbrxk6jhEIrGjP9JJqTzobUNtvX8jG3LlJ/hPTnVv+tP5O4oB43c5hH+R549
	KFazojVHjM1BfzzJ8oQHtCuB3Msja0YoPS7Cd9MMrY6ghVM27UqVf++sUlj9IhEcxM6xKXap0yh9S
	7xr3/IhCgtRTI76XQYHgrCafxbMZWgVolepkP8U8CdHPriso8weP/kH/POJas6A8suQHYYu97dhyL
	mpUBaltq+Xfe8nprj9VT8afpnbpwKLTh3b4BG+W7LS60ymz8y+5ttAHu6mpVxoWLBl+ZvxMODVK+w
	UVq/cqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q59Fz-007c24-0T;
	Fri, 02 Jun 2023 18:12:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q59Fv-007c1V-0o
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 18:12:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2BAF6118C;
	Fri,  2 Jun 2023 18:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC691C433EF;
	Fri,  2 Jun 2023 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685729526;
	bh=EAGy1w8W+g8YutNbUS2c4HLFAifxfO42ulcwVIJCovg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ASOVBCdUNAMbp2PMl2PTuKuVnnDjGHU2PH7x2d7EhEssVxte1sbBohlH4xTz4+XFx
	 lGhpCUoQcz/LMVb4nS25gAWEcKDZdSwoH4lS9RtVC157DEXiqwGLTs173qdsgEBmrs
	 niqKLlRySUjufZqpvvUDvPdnHxTTSy1gy5wHfjB90lwr0D+eKbyleii6BAA2L1z2F6
	 3zq2ml+7Sw3LMDVZR0kV0nSbOMUP+hog+UzvA7Dt5Hh46p0POEfztvVLqnFCqwHmcD
	 m0Inmq0UWOtxFGU/rVQ1Je3FxrqSU5MDPxr6xxNeSLrbtYQp+h54fh6ZL2SaoZP8VU
	 nIfW4Feno4X1A==
Date: Fri, 2 Jun 2023 20:12:02 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: Re: [PATCH 08/12] wifi: mt76: mt7996: set ifs time by mcu command
Message-ID: <ZHow8sIRb/vuBBWD@lore-desk>
References: <20230602152108.26860-1-shayne.chen@mediatek.com>
 <20230602152108.26860-8-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tF+QigSfJbdCboKO"
Content-Disposition: inline
In-Reply-To: <20230602152108.26860-8-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_111207_370791_53EB7066 
X-CRM114-Status: GOOD (  23.64  )
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


--tF+QigSfJbdCboKO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Peter Chiu <chui-hao.chiu@mediatek.com>
>=20
> There's a race between driver and fw on some tx/rx control registers
> when setting ifs, which will cause accidental hw queue pause problems.
> Avoid this by setting ifs time with bss_info mcu command.
>=20
> Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7996/mac.c   | 27 +----------
>  .../net/wireless/mediatek/mt76/mt7996/main.c  |  5 +-
>  .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 47 +++++++++++++++++++
>  .../net/wireless/mediatek/mt76/mt7996/mcu.h   | 17 +++++++
>  .../wireless/mediatek/mt76/mt7996/mt7996.h    |  3 +-
>  5 files changed, 70 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index 130eb7b4fd91..78d9127e63ab 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -1604,20 +1604,19 @@ void mt7996_mac_reset_counters(struct mt7996_phy =
*phy)
>  	mt7996_mcu_get_chan_mib_info(phy, true);
>  }
> =20
> -void mt7996_mac_set_timing(struct mt7996_phy *phy)
> +void mt7996_mac_set_coverage_class(struct mt7996_phy *phy)
>  {
>  	s16 coverage_class =3D phy->coverage_class;
>  	struct mt7996_dev *dev =3D phy->dev;
>  	struct mt7996_phy *phy2 =3D mt7996_phy2(dev);
>  	struct mt7996_phy *phy3 =3D mt7996_phy3(dev);
> -	u32 val, reg_offset;
> +	u32 reg_offset;
>  	u32 cck =3D FIELD_PREP(MT_TIMEOUT_VAL_PLCP, 231) |
>  		  FIELD_PREP(MT_TIMEOUT_VAL_CCA, 48);
>  	u32 ofdm =3D FIELD_PREP(MT_TIMEOUT_VAL_PLCP, 60) |
>  		   FIELD_PREP(MT_TIMEOUT_VAL_CCA, 28);
>  	u8 band_idx =3D phy->mt76->band_idx;
>  	int offset;
> -	bool a_band =3D !(phy->mt76->chandef.chan->band =3D=3D NL80211_BAND_2GH=
Z);
> =20
>  	if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
>  		return;
> @@ -1630,34 +1629,12 @@ void mt7996_mac_set_timing(struct mt7996_phy *phy)
>  		coverage_class =3D max_t(s16, coverage_class,
>  				       phy3->coverage_class);
> =20
> -	mt76_set(dev, MT_ARB_SCR(band_idx),
> -		 MT_ARB_SCR_TX_DISABLE | MT_ARB_SCR_RX_DISABLE);
> -	udelay(1);
> -
>  	offset =3D 3 * coverage_class;
>  	reg_offset =3D FIELD_PREP(MT_TIMEOUT_VAL_PLCP, offset) |
>  		     FIELD_PREP(MT_TIMEOUT_VAL_CCA, offset);
> =20
>  	mt76_wr(dev, MT_TMAC_CDTR(band_idx), cck + reg_offset);
>  	mt76_wr(dev, MT_TMAC_ODTR(band_idx), ofdm + reg_offset);
> -	mt76_wr(dev, MT_TMAC_ICR0(band_idx),
> -		FIELD_PREP(MT_IFS_EIFS_OFDM, a_band ? 84 : 78) |
> -		FIELD_PREP(MT_IFS_RIFS, 2) |
> -		FIELD_PREP(MT_IFS_SIFS, 10) |
> -		FIELD_PREP(MT_IFS_SLOT, phy->slottime));
> -
> -	if (!a_band)
> -		mt76_wr(dev, MT_TMAC_ICR1(band_idx),
> -			FIELD_PREP(MT_IFS_EIFS_CCK, 314));
> -
> -	if (phy->slottime < 20 || a_band)
> -		val =3D MT7996_CFEND_RATE_DEFAULT;
> -	else
> -		val =3D MT7996_CFEND_RATE_11B;
> -
> -	mt76_rmw_field(dev, MT_RATE_HRCR0(band_idx), MT_RATE_HRCR0_CFEND_RATE, =
val);
> -	mt76_clear(dev, MT_ARB_SCR(band_idx),
> -		   MT_ARB_SCR_TX_DISABLE | MT_ARB_SCR_RX_DISABLE);
>  }
> =20
>  void mt7996_mac_enable_nf(struct mt7996_dev *dev, u8 band)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/main.c
> index 8a1edc5c1288..6001b534b657 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -287,7 +287,6 @@ int mt7996_set_channel(struct mt7996_phy *phy)
>  	if (ret)
>  		goto out;
> =20
> -	mt7996_mac_set_timing(phy);
>  	ret =3D mt7996_dfs_init_radar_detector(phy);
>  	mt7996_mac_cca_stats_reset(phy);
> =20
> @@ -565,7 +564,7 @@ static void mt7996_bss_info_changed(struct ieee80211_=
hw *hw,
> =20
>  		if (slottime !=3D phy->slottime) {
>  			phy->slottime =3D slottime;
> -			mt7996_mac_set_timing(phy);
> +			mt7996_mcu_set_timing(phy, vif);
>  		}
>  	}
> =20
> @@ -905,7 +904,7 @@ mt7996_set_coverage_class(struct ieee80211_hw *hw, s1=
6 coverage_class)
> =20
>  	mutex_lock(&dev->mt76.mutex);
>  	phy->coverage_class =3D max_t(s16, coverage_class, 0);
> -	mt7996_mac_set_timing(phy);
> +	mt7996_mac_set_coverage_class(phy);
>  	mutex_unlock(&dev->mt76.mutex);
>  }
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.c
> index db51b3023654..52c6c502e9b3 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -701,6 +701,35 @@ mt7996_mcu_muar_config(struct mt7996_phy *phy, struc=
t ieee80211_vif *vif,
>  				 sizeof(req), true);
>  }
> =20
> +static void
> +mt7996_mcu_bss_ifs_timing_tlv(struct sk_buff *skb, struct ieee80211_vif =
*vif)
> +{
> +	struct mt7996_vif *mvif =3D (struct mt7996_vif *)vif->drv_priv;
> +	struct mt7996_phy *phy =3D mvif->phy;
> +	struct bss_ifs_time_tlv *ifs_time;
> +	struct tlv *tlv;
> +	bool a_band =3D !(phy->mt76->chandef.chan->band =3D=3D NL80211_BAND_2GH=
Z);

nit: I think it is better to do it in the other way around since the band c=
an
be even 6GHz. Something like:

	bool is_2ghz_band =3D phy->mt76->chandef.chan->band =3D=3D NL80211_BAND_2G=
HZ

or even just use phy->mt76->chandef.chan->band directly.

Regards,
Lorenzo

> +	u16 eifs_time =3D a_band ? 84 : 78;
> +
> +	tlv =3D mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_IFS_TIME, sizeof(*ifs_=
time));
> +
> +	ifs_time =3D (struct bss_ifs_time_tlv *)tlv;
> +	ifs_time->slot_valid =3D true;
> +	ifs_time->sifs_valid =3D true;
> +	ifs_time->rifs_valid =3D true;
> +	ifs_time->eifs_valid =3D true;
> +
> +	ifs_time->slot_time =3D cpu_to_le16(phy->slottime);
> +	ifs_time->sifs_time =3D cpu_to_le16(10);
> +	ifs_time->rifs_time =3D cpu_to_le16(2);
> +	ifs_time->eifs_time =3D cpu_to_le16(eifs_time);
> +
> +	if (!a_band) {
> +		ifs_time->eifs_cck_valid =3D true;
> +		ifs_time->eifs_cck_time =3D cpu_to_le16(314);
> +	}
> +}
> +
>  static int
>  mt7996_mcu_bss_basic_tlv(struct sk_buff *skb,
>  			 struct ieee80211_vif *vif,
> @@ -826,6 +855,7 @@ int mt7996_mcu_add_bss_info(struct mt7996_phy *phy,
>  		mt7996_mcu_bss_bmc_tlv(skb, vif, phy);
>  		mt7996_mcu_bss_ra_tlv(skb, vif, phy);
>  		mt7996_mcu_bss_txcmd_tlv(skb, true);
> +		mt7996_mcu_bss_ifs_timing_tlv(skb, vif);
> =20
>  		if (vif->bss_conf.he_support)
>  			mt7996_mcu_bss_he_tlv(skb, vif, phy);
> @@ -838,6 +868,23 @@ int mt7996_mcu_add_bss_info(struct mt7996_phy *phy,
>  				     MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
>  }
> =20
> +int mt7996_mcu_set_timing(struct mt7996_phy *phy, struct ieee80211_vif *=
vif)
> +{
> +	struct mt7996_vif *mvif =3D (struct mt7996_vif *)vif->drv_priv;
> +	struct mt7996_dev *dev =3D phy->dev;
> +	struct sk_buff *skb;
> +
> +	skb =3D __mt7996_mcu_alloc_bss_req(&dev->mt76, &mvif->mt76,
> +					 MT7996_BSS_UPDATE_MAX_SIZE);
> +	if (IS_ERR(skb))
> +		return PTR_ERR(skb);
> +
> +	mt7996_mcu_bss_ifs_timing_tlv(skb, vif);
> +
> +	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
> +				     MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
> +}
> +
>  static int
>  mt7996_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif *mvif,
>  		  struct ieee80211_ampdu_params *params,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.h
> index d7075a4d0667..078f82858621 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
> @@ -317,6 +317,22 @@ struct bss_sec_tlv {
>  	u8 __rsv2[1];
>  } __packed;
> =20
> +struct bss_ifs_time_tlv {
> +	__le16 tag;
> +	__le16 len;
> +	u8 slot_valid;
> +	u8 sifs_valid;
> +	u8 rifs_valid;
> +	u8 eifs_valid;
> +	__le16 slot_time;
> +	__le16 sifs_time;
> +	__le16 rifs_time;
> +	__le16 eifs_time;
> +	u8 eifs_cck_valid;
> +	u8 rsv;
> +	__le16 eifs_cck_time;
> +} __packed;
> +
>  struct bss_power_save {
>  	__le16 tag;
>  	__le16 len;
> @@ -552,6 +568,7 @@ enum {
>  					 sizeof(struct bss_txcmd_tlv) +		\
>  					 sizeof(struct bss_power_save) +	\
>  					 sizeof(struct bss_sec_tlv) +		\
> +					 sizeof(struct bss_ifs_time_tlv) +	\
>  					 sizeof(struct bss_mld_tlv))
> =20
>  #define MT7996_STA_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +		\
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers=
/net/wireless/mediatek/mt76/mt7996/mt7996.h
> index 7dfdc7384056..42892f06faa7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> @@ -463,6 +463,7 @@ int mt7996_mcu_set_radar_th(struct mt7996_dev *dev, i=
nt index,
>  			    const struct mt7996_dfs_pattern *pattern);
>  int mt7996_mcu_set_radio_en(struct mt7996_phy *phy, bool enable);
>  int mt7996_mcu_set_rts_thresh(struct mt7996_phy *phy, u32 val);
> +int mt7996_mcu_set_timing(struct mt7996_phy *phy, struct ieee80211_vif *=
vif);
>  int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switc=
h);
>  int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 index,
>  		       u8 rx_sel, u8 val);
> @@ -526,7 +527,7 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __=
le32 *txwi,
>  			   struct sk_buff *skb, struct mt76_wcid *wcid,
>  			   struct ieee80211_key_conf *key, int pid,
>  			   enum mt76_txq_id qid, u32 changed);
> -void mt7996_mac_set_timing(struct mt7996_phy *phy);
> +void mt7996_mac_set_coverage_class(struct mt7996_phy *phy);
>  int mt7996_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
>  		       struct ieee80211_sta *sta);
>  void mt7996_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *=
vif,
> --=20
> 2.39.2
>=20

--tF+QigSfJbdCboKO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZHow8gAKCRA6cBh0uS2t
rJkUAPwKhPScaeqB3/TkEabVg0rSEiBv4kEhjQtUAaftCh0vxwEAnfDO0h/SqobU
xsLRwpd+1t5l2PK6xuOJT48STB8uuAs=
=o5VE
-----END PGP SIGNATURE-----

--tF+QigSfJbdCboKO--

