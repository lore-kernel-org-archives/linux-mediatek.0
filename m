Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FC7C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 13:10:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 011DD23432
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 13:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 011DD23432
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cHD4QkFsWazNvbo6TiinrkadAdSvDZkvo69k4EvgunY=; b=oY6KCesX6bEZm0ILke5wmil1j
	GIyZHuZo21XvhA6aoRunMZziDrp3ktxA9yBDlzSjOUnwoLXFSvwK2hFB5LPH3frwHS+KYu6th6fj6
	1dPuH2kjBuT0pRjPx6NDDjmfBUHbikWnGG07UNSRMQmF8VsKSaaxYqyjevZkn9yUHeiqe3srwbbH7
	IK5qBK+kI50/H+UiBEFiXnOF1ExiimanzTQ4QLzzH6gn9PQ9OJBB2LGzmJ6b1WQQMVh00zEonGxt8
	a6qhR1XprLsibPCldjNBmb1Y4Rs79LNvz5Ee6FoxNMWoCl0/UILnTf6XEJmQ9nXD0zz8rjWVeDIvP
	AjbDm/egw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzfv0-0005H9-67; Wed, 13 Jan 2021 13:10:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzfuu-0005DI-28
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 13:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610543427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pD0Vo7E4SxuDQ1/fxBJLMY+8QzjjbeMuVjguZBQdfn4=;
 b=TffG/Kk8JUAHDaqX2upoQmQ/4AEqjAzpAYjZ2P55572yyuwVLi23ztjmWA8bTm1S23eOR/
 +LuQbMbY/JqRmNDDKNWHvIOC8GvTUWgetcaDzwEBKOYcTgwaX7Hdpe6MBdfy2oL/vwSCA5
 URKXR652qycgCbEI6k4arGGFjfU9kTc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-0oSxH4_4MR2X_lNJqMldqg-1; Wed, 13 Jan 2021 08:10:23 -0500
X-MC-Unique: 0oSxH4_4MR2X_lNJqMldqg-1
Received: by mail-wm1-f71.google.com with SMTP id x12so169937wmk.7
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Jan 2021 05:10:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XgKl9nCaXs5mu0WD1FNtbmTmmv7VZTSRgUqyEAJfU9g=;
 b=Bs+Apq3vabZRL3BC8IfxbWuiZgktWZyoQuJ5tyMtc8PAh6e/Pt5RifVRRXQ20CAadN
 rVs9XULTGZV+EPmB2eXsSuhRxJg+yaIYGw77bOQC09lHHbsMOt9StR58n/hA0XaxrvfR
 jr2mh+bDe8JcqnXQ5KcAfloKhO0KK6+WMvhuFtFgLrjiq7wah7eueXEOPk7c3GqTlrdO
 ZWPiHTDunJLFJPNRgvlqFieyCNF2Kd2SPc1oYzFuxm6hv/chqZ5HEcu04W2ofmmFWYcw
 O7engXs0pzbDdbFpl/FHR62rdOn14nuE794+cGkSKYQKb7YReJeGsj9J3TBXGjfQBXQv
 qCgQ==
X-Gm-Message-State: AOAM5304ExoZnvKquiw2ZJO+s4tvY7aHUxqJOVRjZn0B+0yUKQqDChDA
 bUY8ooEs2ufFjkeGU25KMyLD1FrdKOWP2ajmSGDAvkiZ0jbQCy68Dg/X2Uaq157ogiftSyZ6QD6
 e96RuSPdL4j8h97K3jU/gJbnxcqunL8iN
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr2625446wrv.92.1610543421843; 
 Wed, 13 Jan 2021 05:10:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2QRuut/D/nE4xQvkKPe5sq8qbrjcCeoqEDVcubkyJ4eCuuVXqLpd+RJwZnmRsVRWi+JUGww==
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr2625433wrv.92.1610543421674; 
 Wed, 13 Jan 2021 05:10:21 -0800 (PST)
Received: from localhost ([151.66.42.92])
 by smtp.gmail.com with ESMTPSA id b132sm3071303wmh.21.2021.01.13.05.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:10:21 -0800 (PST)
Date: Wed, 13 Jan 2021 14:10:18 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 2/2] mt76: mt7915: add implicit Tx beamforming support
Message-ID: <20210113131018.GB5528@lore-desk>
References: <287bbdb0193bd74069219b97199ba4ec72127bd8.1610539467.git.ryder.lee@mediatek.com>
 <8663392490d6b0552aaf0b5b7a8eb36ff38c8bba.1610539467.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <8663392490d6b0552aaf0b5b7a8eb36ff38c8bba.1610539467.git.ryder.lee@mediatek.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_081028_181965_7022F82B 
X-CRM114-Status: GOOD (  18.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Content-Type: multipart/mixed; boundary="===============3455997891311231930=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3455997891311231930==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add ht/vht implicit Tx beamforming support and enable it via debugfs.
>=20
> Tested-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7915/debugfs.c   |  28 +++++
>  .../net/wireless/mediatek/mt76/mt7915/init.c  |   8 +-
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 104 ++++++++++--------
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |   1 +
>  4 files changed, 89 insertions(+), 52 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/driver=
s/net/wireless/mediatek/mt76/mt7915/debugfs.c
> index 7d810fbf2862..340d489993bb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
> @@ -6,6 +6,32 @@
> =20
>  /** global debugfs **/
> =20
> +static int
> +mt7915_implicit_txbf_set(void *data, u64 val)
> +{
> +=09struct mt7915_dev *dev =3D data;
> +
> +=09if (test_bit(MT76_STATE_RUNNING, &dev->mphy.state))
> +=09=09return 0;

Maybe return -EBUSY here?

> +
> +=09dev->ibf =3D !!val;
> +
> +=09return mt7915_mcu_set_txbf_type(dev);
> +}
> +
> +static int
> +mt7915_implicit_txbf_get(void *data, u64 *val)
> +{
> +=09struct mt7915_dev *dev =3D data;
> +
> +=09*val =3D dev->ibf;
> +
> +=09return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_implicit_txbf, mt7915_implicit_txbf_get,
> +=09=09=09 mt7915_implicit_txbf_set, "%lld\n");
> +
>  /* test knob of system layer 1/2 error recovery */
>  static int mt7915_ser_trigger_set(void *data, u64 val)
>  {
> @@ -355,6 +381,8 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
>  =09=09=09=09    mt7915_queues_acq);
>  =09debugfs_create_file("tx_stats", 0400, dir, dev, &fops_tx_stats);
>  =09debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
> +=09debugfs_create_file("implicit_txbf", 0600, dir, dev,
> +=09=09=09    &fops_implicit_txbf);
>  =09debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
>  =09/* test knobs */
>  =09debugfs_create_file("radar_trigger", 0200, dir, dev,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/init.c
> index 255ccd7e3d27..cb501c5dc1cc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -169,18 +169,12 @@ static int mt7915_txbf_init(struct mt7915_dev *dev)
>  {
>  =09int ret;
> =20
> -=09/*
> -=09 * TODO: DBDC & check whether iBF phase calibration data has
> -=09 * been stored in eeprom offset 0x651~0x7b8, then write down
> -=09 * 0x1111 into 0x651 and 0x651 to trigger iBF.
> -=09 */
> -
>  =09/* trigger sounding packets */
>  =09ret =3D mt7915_mcu_set_txbf_sounding(dev);
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09/* enable iBF & eBF */
> +=09/* enable eBF */
>  =09return mt7915_mcu_set_txbf_type(dev);
>  }
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index f38bc421ea8e..2ac780bc2696 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -1736,13 +1736,14 @@ mt7915_mcu_sta_sounding_rate(struct sta_rec_bf *b=
f)
>  }
> =20
>  static void
> -mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta, struct sta_rec_bf *bf)
> +mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta, struct mt7915_phy *phy=
,
> +=09=09       struct sta_rec_bf *bf)
>  {
>  =09struct ieee80211_mcs_info *mcs =3D &sta->ht_cap.mcs;
>  =09u8 n =3D 0;
> =20
>  =09bf->tx_mode =3D MT_PHY_TYPE_HT;
> -=09bf->bf_cap |=3D MT_IBF;
> +=09bf->bf_cap =3D MT_IBF;
> =20
>  =09if (mcs->tx_params & IEEE80211_HT_MCS_TX_RX_DIFF &&
>  =09    (mcs->tx_params & IEEE80211_HT_MCS_TX_DEFINED))
> @@ -1755,8 +1756,9 @@ mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta, s=
truct sta_rec_bf *bf)
>  =09else if (mcs->rx_mask[1])
>  =09=09n =3D 1;
> =20
> +=09bf->nr =3D hweight8(phy->chainmask) - 1;
>  =09bf->nc =3D min_t(u8, bf->nr, n);
> -=09bf->ibf_ncol =3D bf->nc;
> +=09bf->ibf_ncol =3D n;
> =20
>  =09if (sta->bandwidth <=3D IEEE80211_STA_RX_BW_40 && !bf->nc)
>  =09=09bf->ibf_timeout =3D 0x48;
> @@ -1764,34 +1766,46 @@ mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta,=
 struct sta_rec_bf *bf)
> =20
>  static void
>  mt7915_mcu_sta_bfer_vht(struct ieee80211_sta *sta, struct mt7915_phy *ph=
y,
> -=09=09=09struct sta_rec_bf *bf)
> +=09=09=09struct sta_rec_bf *bf, bool explicit)
>  {
>  =09struct ieee80211_sta_vht_cap *pc =3D &sta->vht_cap;
>  =09struct ieee80211_sta_vht_cap *vc =3D &phy->mt76->sband_5g.sband.vht_c=
ap;
> -=09u8 bfee_nr, bfer_nr, n, tx_ant =3D hweight8(phy->chainmask) - 1;
> -=09u16 mcs_map;
> +=09u16 mcs_map =3D le16_to_cpu(pc->vht_mcs.rx_mcs_map);
> +=09u8 nss_mcs =3D mt7915_mcu_get_sta_nss(mcs_map);
> +=09u8 tx_ant =3D hweight8(phy->chainmask) - 1;
> =20
>  =09bf->tx_mode =3D MT_PHY_TYPE_VHT;
> -=09bf->bf_cap |=3D MT_EBF;
> =20
> -=09mt7915_mcu_sta_sounding_rate(bf);
> +=09if (explicit) {
> +=09=09u8 n, bfee_nr, bfer_nr;
> =20
> -=09bfee_nr =3D FIELD_GET(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK,
> -=09=09=09    pc->cap);
> -=09bfer_nr =3D FIELD_GET(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
> -=09=09=09    vc->cap);
> -=09mcs_map =3D le16_to_cpu(pc->vht_mcs.rx_mcs_map);
> +=09=09bf->bf_cap =3D MT_EBF;
> =20
> -=09n =3D min_t(u8, bfer_nr, bfee_nr);
> -=09bf->nr =3D min_t(u8, n, tx_ant);
> -=09n =3D mt7915_mcu_get_sta_nss(mcs_map);
> +=09=09mt7915_mcu_sta_sounding_rate(bf);
> =20
> -=09bf->nc =3D min_t(u8, n, bf->nr);
> -=09bf->ibf_ncol =3D bf->nc;
> +=09=09bfee_nr =3D FIELD_GET(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK,
> +=09=09=09=09    pc->cap);
> +=09=09bfer_nr =3D FIELD_GET(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
> +=09=09=09=09    vc->cap);
> +=09=09n =3D min_t(u8, bfer_nr, bfee_nr);
> +=09=09bf->nr =3D min_t(u8, n, tx_ant);
> +=09=09bf->nc =3D min_t(u8, nss_mcs, bf->nr);
> +=09=09bf->ibf_ncol =3D bf->nc;
> +
> +=09=09if (sta->bandwidth =3D=3D IEEE80211_STA_RX_BW_160)
> +=09=09=09bf->nr =3D 1;
> +=09} else {
> +=09=09bf->bf_cap =3D MT_IBF;
> +=09=09bf->nr =3D tx_ant;
> +=09=09bf->nc =3D min_t(u8, nss_mcs, bf->nr);
> +=09=09bf->ibf_ncol =3D nss_mcs;
> +
> +=09=09if (sta->bandwidth <=3D IEEE80211_STA_RX_BW_40 && !bf->nc)
> +=09=09=09bf->ibf_timeout =3D 0x48;
> =20
> -=09/* force nr from 4 to 2 */
> -=09if (sta->bandwidth =3D=3D IEEE80211_STA_RX_BW_160)
> -=09=09bf->nr =3D 1;
> +=09=09if (sta->bandwidth =3D=3D IEEE80211_STA_RX_BW_160)
> +=09=09=09bf->ibf_nrow =3D 1;
> +=09}
>  }
> =20
>  static void
> @@ -1800,16 +1814,14 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta,=
 struct ieee80211_vif *vif,
>  {
>  =09struct ieee80211_sta_he_cap *pc =3D &sta->he_cap;
>  =09struct ieee80211_he_cap_elem *pe =3D &pc->he_cap_elem;
> -=09const struct ieee80211_he_cap_elem *ve;
> -=09const struct ieee80211_sta_he_cap *vc;
> -=09u8 bfee_nr, bfer_nr, nss_mcs;
> -=09u16 mcs_map;
> -
> -=09vc =3D mt7915_get_he_phy_cap(phy, vif);
> -=09ve =3D &vc->he_cap_elem;
> +=09const struct ieee80211_sta_he_cap *vc =3D mt7915_get_he_phy_cap(phy, =
vif);
> +=09const struct ieee80211_he_cap_elem *ve =3D &vc->he_cap_elem;
> +=09u16 mcs_map =3D le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_80);
> +=09u8 nss_mcs =3D mt7915_mcu_get_sta_nss(mcs_map);
> +=09u8 bfee_nr, bfer_nr;
> =20
>  =09bf->tx_mode =3D MT_PHY_TYPE_HE_SU;
> -=09bf->bf_cap |=3D MT_EBF;
> +=09bf->bf_cap =3D MT_EBF;
> =20
>  =09mt7915_mcu_sta_sounding_rate(bf);
> =20
> @@ -1821,10 +1833,6 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, =
struct ieee80211_vif *vif,
>  =09=09=09 ve->phy_cap_info[5]);
>  =09bfee_nr =3D HE_PHY(CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK,
>  =09=09=09 pe->phy_cap_info[4]);
> -
> -=09mcs_map =3D le16_to_cpu(pc->he_mcs_nss_supp.tx_mcs_80);
> -=09nss_mcs =3D mt7915_mcu_get_sta_nss(mcs_map);
> -
>  =09bf->nr =3D min_t(u8, bfer_nr, bfee_nr);
>  =09bf->nc =3D min_t(u8, nss_mcs, bf->nr);
>  =09bf->ibf_ncol =3D bf->nc;
> @@ -1863,7 +1871,7 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, s=
truct ieee80211_vif *vif,
>  static void
>  mt7915_mcu_sta_bfer_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
>  =09=09=09struct ieee80211_vif *vif, struct mt7915_phy *phy,
> -=09=09=09bool enable)
> +=09=09=09bool enable, bool explicit)
>  {
>  =09struct sta_rec_bf *bf;
>  =09struct tlv *tlv;
> @@ -1885,19 +1893,25 @@ mt7915_mcu_sta_bfer_tlv(struct sk_buff *skb, stru=
ct ieee80211_sta *sta,
>  =09=09return;
>  =09}
> =20
> -=09bf->bw =3D sta->bandwidth;
> -=09bf->ibf_dbw =3D sta->bandwidth;
> -=09bf->ibf_nrow =3D tx_ant;
> -=09bf->ibf_timeout =3D 0x18;
> -
> +=09/* he: eBF only, in accordance with spec
> +=09 * vht: support eBF and iBF
> +=09 * ht: iBF only, since mac80211 lacks of eBF support
> +=09 */
>  =09if (sta->he_cap.has_he)
>  =09=09mt7915_mcu_sta_bfer_he(sta, vif, phy, bf);
>  =09else if (sta->vht_cap.vht_supported)
> -=09=09mt7915_mcu_sta_bfer_vht(sta, phy, bf);
> +=09=09mt7915_mcu_sta_bfer_vht(sta, phy, bf, explicit);
>  =09else if (sta->ht_cap.ht_supported)
> -=09=09mt7915_mcu_sta_bfer_ht(sta, bf);
> +=09=09mt7915_mcu_sta_bfer_ht(sta, phy, bf);
> +=09else
> +=09=09return;
> +
> +=09bf->bw =3D sta->bandwidth;
> +=09bf->ibf_dbw =3D sta->bandwidth;
> +=09bf->ibf_nrow =3D tx_ant;
> +=09bf->ibf_timeout =3D 0x18;
> =20
> -=09if (bf->bf_cap & MT_EBF && bf->nr !=3D tx_ant)
> +=09if (explicit && bf->nr !=3D tx_ant)
>  =09=09bf->mem_20m =3D matrix[tx_ant][bf->nc];
>  =09else
>  =09=09bf->mem_20m =3D matrix[bf->nr][bf->nc];
> @@ -2002,14 +2016,14 @@ mt7915_mcu_add_txbf(struct mt7915_dev *dev, struc=
t ieee80211_vif *vif,
>  =09/* must keep each tag independent */
> =20
>  =09/* starec bf */
> -=09if (ebf) {
> +=09if (ebf || dev->ibf) {
>  =09=09len =3D sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bf);
> =20
>  =09=09skb =3D mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
>  =09=09if (IS_ERR(skb))
>  =09=09=09return PTR_ERR(skb);
> =20
> -=09=09mt7915_mcu_sta_bfer_tlv(skb, sta, vif, phy, enable);
> +=09=09mt7915_mcu_sta_bfer_tlv(skb, sta, vif, phy, enable, ebf);
> =20
>  =09=09r =3D mt76_mcu_skb_send_msg(&dev->mt76, skb,
>  =09=09=09=09=09  MCU_EXT_CMD_STA_REC_UPDATE, true);
> @@ -3442,7 +3456,7 @@ int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev=
)
>  =09} __packed req =3D {
>  =09=09.action =3D MT_BF_TYPE_UPDATE,
>  =09=09.ebf =3D true,
> -=09=09.ibf =3D false,
> +=09=09.ibf =3D dev->ibf,
>  =09};
> =20
>  =09return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_TXBF_ACTION, &req,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers=
/net/wireless/mediatek/mt76/mt7915/mt7915.h
> index df7ac2cf052f..63ad1f8199f2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
> @@ -191,6 +191,7 @@ struct mt7915_dev {
>  =09bool dbdc_support;
>  =09bool flash_mode;
>  =09bool fw_debug;
> +=09bool ibf;
>  };
> =20
>  enum {
> --=20
> 2.18.0
>=20

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCX/7xNwAKCRA6cBh0uS2t
rA/uAQD+SjXzj8iT92THsyBpqkiTAzPIr4A3emVeWZWk2UGz2wD/R3C+j400jXhg
gNeJGNdbeXych02kczZ1zC3O7NIm5As=
=23n3
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--



--===============3455997891311231930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3455997891311231930==--


