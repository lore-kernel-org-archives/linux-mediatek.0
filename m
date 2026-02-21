Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384C1C61DFB
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Feb 2026 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJSGOKa6+/G+mp+NA2zgPSLrM7wV/a966Me0NC8pXyc=; b=ghdSm9VBrSsbG9tcO/fOL/y5fV
	tTPJ0wQgMFzpFM6o+ge5FLq3khS/CuAAROu5HbjCvDN43XORLoTSzCRLZMUcf4siRGZltbj9B+xZe
	7focvQqdCjuxD9UP/d+EiyzNvM5KcjGO5byRFdKOyyNeEm75gj03NfCTspfhzmjie7whqVQo8Qs1t
	uzbHv9023vmxhxW7I4z66OPDm4+Z/RI0t41FoTpkq98YfYqrcHITAAg5EraHAh+srRQb/T0kO5GAn
	F4FLvLPwrpR6xoshMeVIHxETSyBeKHtlAGJcu6JnbCyjHMHkbUOLHfaXMJ0ahMs3Q3SeBFE3AJpu6
	qZyp/Y3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vttS4-0000000GIxp-0l3P;
	Sat, 21 Feb 2026 20:19:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vttS1-0000000GIx5-3P9z
	for linux-mediatek@lists.infradead.org;
	Sat, 21 Feb 2026 20:19:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3D13444CA
	for <linux-mediatek@lists.infradead.org>; Sat, 21 Feb 2026 20:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7F4C19425
	for <linux-mediatek@lists.infradead.org>; Sat, 21 Feb 2026 20:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771705179;
	bh=82/J1K0TmNjJv64+Y0jXCam2uDTZw2JgmKUZhtxfjDc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MZXl3dbIC8eZpt1nKfQl58p4Ir0F9Sd++Qx7yUfUfuPygP90TOW1xdQKyLqLRyywI
	 B7pgK5xUIOhSc0IQU/p57fNUqasD+AOrx8gOsW29nAIt6kqlZ6p2+At0hwUZpALSzR
	 nkSxxEnntob3sKJB08GHIwQ/RqRJfnNzTICVpOAQVTpUR8JT0qM3GwnxPJkk5RBqcf
	 cKVcKG2x92kKGiOG6o9emNAQeh3BAJVF2EuFnyLt9aUrxZSvJEO9UmiaVk8qjuuKLm
	 K52SNCC9MnWYjuda/r1P9RFy/JjWxIX1M2yRvkwU7TTLdzVmm2/JARRQb70potsxE+
	 JTbaUIO0p0l3w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3871a08189aso27506651fa.1
        for <linux-mediatek@lists.infradead.org>; Sat, 21 Feb 2026 12:19:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXuOUPfnQbQM79+M8Z0robUxsKnHlI4zR4znKHRtfsqvIBvAOdJTvA48yHQv5j7+PfERJLbLazJVYcmIgpczw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo1m0YeCgtoFl8cV8CiUaJmCySadY0QGpiNbOAwsnRS45qb+SK
	LORDkgzq31FmRrlMv/5xdAFqpb2DZh648sV/HMbP4k7H0bRWuVewpquNtg6U92OWVVhFyBZdzWy
	p+7/QQAIct6nL81czEh4TKr/07Ow//YE=
X-Received: by 2002:a2e:bc20:0:b0:385:9b50:91a2 with SMTP id
 38308e7fff4ca-389a5ad674fmr10425931fa.10.1771705177633; Sat, 21 Feb 2026
 12:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20260219004007.19733-1-sean.wang@kernel.org> <cab3c9a6-5563-40f5-9389-42ae3ac877ac@manjaro.org>
In-Reply-To: <cab3c9a6-5563-40f5-9389-42ae3ac877ac@manjaro.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Sat, 21 Feb 2026 14:19:26 -0600
X-Gmail-Original-Message-ID: <CAGp9Lzr85cNvveAzpb6SaB2TofY06SGcVRuUq_xTWpURuc1AxA@mail.gmail.com>
X-Gm-Features: AaiRm531FKc9z-o01o3uU5SkRsEWPjRANy_JZKTPiXkcCOoNUt0dd_SgUA-nZ4I
Message-ID: <CAGp9Lzr85cNvveAzpb6SaB2TofY06SGcVRuUq_xTWpURuc1AxA@mail.gmail.com>
Subject: Re: [PATCH 01/11] wifi: mt76: connac: use is_connac2() to replace
 is_mt7921() checks
To: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_121941_900180_94FF1AF0 
X-CRM114-Status: GOOD (  20.62  )
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

On Fri, Feb 20, 2026 at 2:41=E2=80=AFPM Philip M=C3=BCller <philm@manjaro.o=
rg> wrote:
>
> Hi Sean,
>
> this patch needed the following lines additionally to compile cleanly:
>

Hi Philip,

Thanks for the catch I=E2=80=99ll update this in the next version.

Best,
Sean

> drivers/net/wireless/mediatek/mt76/mt792x_core.c
>
> @@ -691,7 +691,7 @@ int mt792x_init_wiphy(struct ieee80211_h
>       ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
>       ieee80211_hw_set(hw, SUPPORTS_ONLY_HE_MULTI_BSSID);
>
> -    if (is_mt7921(&dev->mt76)) {
> +    if (is_connac2(&dev->mt76)) {
>           ieee80211_hw_set(hw, CHANCTX_STA_CSA);
>       }
>
> On 2/19/26 01:39, sean.wang@kernel.org wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > Unify all per-chip conditionals under the new is_connac2() helper. This
> > avoids confusion caused by the previous is_mt7921() check, which
> > implicitly covered multiple connac2 chipsets and no longer reflected it=
s
> > actual scope. This is a clean-up only change with no functional impact.
> >
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >   .../net/wireless/mediatek/mt76/mt76_connac.h  |  2 +-
> >   .../wireless/mediatek/mt76/mt76_connac_mac.c  | 16 ++++++------
> >   .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 26 +++++++++---------=
-
> >   .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  2 +-
> >   .../net/wireless/mediatek/mt76/mt792x_core.c  |  2 +-
> >   .../net/wireless/mediatek/mt76/mt792x_dma.c   |  2 +-
> >   6 files changed, 25 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers=
/net/wireless/mediatek/mt76/mt76_connac.h
> > index 813d61bffc2c..02bea67d37c3 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> > @@ -187,7 +187,7 @@ static inline bool is_mt7922(struct mt76_dev *dev)
> >       return mt76_chip(dev) =3D=3D 0x7922;
> >   }
> >
> > -static inline bool is_mt7921(struct mt76_dev *dev)
> > +static inline bool is_connac2(struct mt76_dev *dev)
> >   {
> >       return mt76_chip(dev) =3D=3D 0x7961 || is_mt7922(dev) || is_mt792=
0(dev);
> >   }
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/dri=
vers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> > index 4ef44514d48d..e76f6e28b7f0 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> > @@ -173,7 +173,7 @@ void mt76_connac_write_hw_txp(struct mt76_dev *dev,
> >
> >       txp->msdu_id[0] =3D cpu_to_le16(id | MT_MSDU_ID_VALID);
> >
> > -     if (is_mt7663(dev) || is_mt7921(dev) || is_mt7925(dev))
> > +     if (is_mt7663(dev) || is_connac2(dev) || is_mt7925(dev))
> >               last_mask =3D MT_TXD_LEN_LAST;
> >       else
> >               last_mask =3D MT_TXD_LEN_AMSDU_LAST |
> > @@ -217,7 +217,7 @@ mt76_connac_txp_skb_unmap_hw(struct mt76_dev *dev,
> >       u32 last_mask;
> >       int i;
> >
> > -     if (is_mt7663(dev) || is_mt7921(dev) || is_mt7925(dev))
> > +     if (is_mt7663(dev) || is_connac2(dev) || is_mt7925(dev))
> >               last_mask =3D MT_TXD_LEN_LAST;
> >       else
> >               last_mask =3D MT_TXD_LEN_MSDU_LAST;
> > @@ -309,7 +309,7 @@ u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *m=
phy,
> >       chandef =3D mvif->ctx ? &mvif->ctx->def : &mphy->chandef;
> >       band =3D chandef->chan->band;
> >
> > -     if (is_mt7921(mphy->dev)) {
> > +     if (is_connac2(mphy->dev)) {
> >               rateidx =3D ffs(conf->basic_rates) - 1;
> >               goto legacy;
> >       }
> > @@ -547,7 +547,7 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *d=
ev, __le32 *txwi,
> >       val =3D MT_TXD1_LONG_FORMAT |
> >             FIELD_PREP(MT_TXD1_WLAN_IDX, wcid->idx) |
> >             FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
> > -     if (!is_mt7921(dev))
> > +     if (!is_connac2(dev))
> >               val |=3D MT_TXD1_VTA;
> >       if (phy_idx || band_idx)
> >               val |=3D MT_TXD1_TGID;
> > @@ -556,7 +556,7 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *d=
ev, __le32 *txwi,
> >       txwi[2] =3D 0;
> >
> >       val =3D FIELD_PREP(MT_TXD3_REM_TX_COUNT, 15);
> > -     if (!is_mt7921(dev))
> > +     if (!is_connac2(dev))
> >               val |=3D MT_TXD3_SW_POWER_MGMT;
> >       if (key)
> >               val |=3D MT_TXD3_PROTECT_FRAME;
> > @@ -598,7 +598,7 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *d=
ev, __le32 *txwi,
> >               txwi[6] |=3D cpu_to_le32(val);
> >               txwi[3] |=3D cpu_to_le32(MT_TXD3_BA_DISABLE);
> >
> > -             if (!is_mt7921(dev)) {
> > +             if (!is_connac2(dev)) {
> >                       u8 spe_idx =3D mt76_connac_spe_idx(mphy->antenna_=
mask);
> >
> >                       if (!spe_idx)
> > @@ -830,7 +830,7 @@ mt76_connac2_mac_decode_he_mu_radiotap(struct mt76_=
dev *dev, struct sk_buff *skb
> >       };
> >       struct ieee80211_radiotap_he_mu *he_mu;
> >
> > -     if (is_mt7921(dev)) {
> > +     if (is_connac2(dev)) {
> >               mu_known.flags1 |=3D HE_BITS(MU_FLAGS1_SIG_B_COMP_KNOWN);
> >               mu_known.flags2 |=3D HE_BITS(MU_FLAGS2_PUNC_FROM_SIG_A_BW=
_KNOWN);
> >       }
> > @@ -1046,7 +1046,7 @@ int mt76_connac2_mac_fill_rx_rate(struct mt76_dev=
 *dev,
> >               stbc =3D FIELD_GET(MT_PRXV_HT_STBC, v0);
> >               gi =3D FIELD_GET(MT_PRXV_HT_SGI, v0);
> >               *mode =3D FIELD_GET(MT_PRXV_TX_MODE, v0);
> > -             if (is_mt7921(dev))
> > +             if (is_connac2(dev))
> >                       dcm =3D !!(idx & MT_PRXV_TX_DCM);
> >               else
> >                       dcm =3D FIELD_GET(MT_PRXV_DCM, v0);
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/dri=
vers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > index 3f583e2a1dc1..d7fbf3454bb8 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > @@ -65,7 +65,7 @@ int mt76_connac_mcu_init_download(struct mt76_dev *de=
v, u32 addr, u32 len,
> >       int cmd;
> >
> >       if ((!is_connac_v1(dev) && addr =3D=3D MCU_PATCH_ADDRESS) ||
> > -         (is_mt7921(dev) && addr =3D=3D 0x900000) ||
> > +         (is_connac2(dev) && addr =3D=3D 0x900000) ||
> >           (is_mt7925(dev) && (addr =3D=3D 0x900000 || addr =3D=3D 0xe00=
02800)) ||
> >           (is_mt799x(dev) && addr =3D=3D 0x900000))
> >               cmd =3D MCU_CMD(PATCH_START_REQ);
> > @@ -402,7 +402,7 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev =
*dev, struct sk_buff *skb,
> >       switch (vif->type) {
> >       case NL80211_IFTYPE_MESH_POINT:
> >       case NL80211_IFTYPE_AP:
> > -             if (vif->p2p && !is_mt7921(dev))
> > +             if (vif->p2p && !is_connac2(dev))
> >                       conn_type =3D CONNECTION_P2P_GC;
> >               else
> >                       conn_type =3D CONNECTION_INFRA_STA;
> > @@ -410,7 +410,7 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev =
*dev, struct sk_buff *skb,
> >               basic->aid =3D cpu_to_le16(link_sta->sta->aid);
> >               break;
> >       case NL80211_IFTYPE_STATION:
> > -             if (vif->p2p && !is_mt7921(dev))
> > +             if (vif->p2p && !is_connac2(dev))
> >                       conn_type =3D CONNECTION_P2P_GO;
> >               else
> >                       conn_type =3D CONNECTION_INFRA_AP;
> > @@ -874,7 +874,7 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy,=
 struct sk_buff *skb,
> >               struct sta_rec_vht *vht;
> >               int len;
> >
> > -             len =3D is_mt7921(dev) ? sizeof(*vht) : sizeof(*vht) - 4;
> > +             len =3D is_connac2(dev) ? sizeof(*vht) : sizeof(*vht) - 4=
;
> >               tlv =3D mt76_connac_mcu_add_tlv(skb, STA_REC_VHT, len);
> >               vht =3D (struct sta_rec_vht *)tlv;
> >               vht->vht_cap =3D cpu_to_le32(sta->deflink.vht_cap.cap);
> > @@ -885,7 +885,7 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy,=
 struct sk_buff *skb,
> >       /* starec uapsd */
> >       mt76_connac_mcu_sta_uapsd(skb, vif, sta);
> >
> > -     if (!is_mt7921(dev))
> > +     if (!is_connac2(dev))
> >               return;
> >
> >       if (sta->deflink.ht_cap.ht_supported || sta->deflink.he_cap.has_h=
e)
> > @@ -1778,7 +1778,7 @@ int mt76_connac_mcu_hw_scan(struct mt76_phy *phy,=
 struct ieee80211_vif *vif,
> >       req->ssid_type_ext =3D n_ssids ? BIT(0) : 0;
> >       req->ssids_num =3D n_ssids;
> >
> > -     duration =3D is_mt7921(phy->dev) ? 0 : MT76_CONNAC_SCAN_CHANNEL_T=
IME;
> > +     duration =3D is_connac2(phy->dev) ? 0 : MT76_CONNAC_SCAN_CHANNEL_=
TIME;
> >       /* increase channel time for passive scan */
> >       if (!sreq->n_ssids)
> >               duration *=3D 2;
> > @@ -1821,7 +1821,7 @@ int mt76_connac_mcu_hw_scan(struct mt76_phy *phy,=
 struct ieee80211_vif *vif,
> >               req->ies_len =3D cpu_to_le16(sreq->ie_len);
> >       }
> >
> > -     if (is_mt7921(phy->dev))
> > +     if (is_connac2(phy->dev))
> >               req->scan_func |=3D SCAN_FUNC_SPLIT_SCAN;
> >
> >       memcpy(req->bssid, sreq->bssid, ETH_ALEN);
> > @@ -1897,7 +1897,7 @@ int mt76_connac_mcu_sched_scan_req(struct mt76_ph=
y *phy,
> >               get_random_mask_addr(addr, sreq->mac_addr,
> >                                    sreq->mac_addr_mask);
> >       }
> > -     if (is_mt7921(phy->dev)) {
> > +     if (is_connac2(phy->dev)) {
> >               req->mt7921.bss_idx =3D mvif->idx;
> >               req->mt7921.delay =3D cpu_to_le32(sreq->delay);
> >       }
> > @@ -2037,7 +2037,7 @@ mt76_connac_mcu_build_sku(struct mt76_dev *dev, s=
8 *sku,
> >                         struct mt76_power_limits *limits,
> >                         enum nl80211_band band)
> >   {
> > -     int max_power =3D is_mt7921(dev) ? 127 : 63;
> > +     int max_power =3D is_connac2(dev) ? 127 : 63;
> >       int i, offset =3D sizeof(limits->cck);
> >
> >       memset(sku, max_power, MT_SKU_POWER_LIMIT);
> > @@ -2065,7 +2065,7 @@ mt76_connac_mcu_build_sku(struct mt76_dev *dev, s=
8 *sku,
> >               offset +=3D 12;
> >       }
> >
> > -     if (!is_mt7921(dev))
> > +     if (!is_connac2(dev))
> >               return;
> >
> >       /* he */
> > @@ -2121,7 +2121,7 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy=
 *phy,
> >                                 enum nl80211_band band)
> >   {
> >       struct mt76_dev *dev =3D phy->dev;
> > -     int sku_len, batch_len =3D is_mt7921(dev) ? 8 : 16;
> > +     int sku_len, batch_len =3D is_connac2(dev) ? 8 : 16;
> >       static const u8 chan_list_2ghz[] =3D {
> >               1, 2,  3,  4,  5,  6,  7,
> >               8, 9, 10, 11, 12, 13, 14
> > @@ -2162,7 +2162,7 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy=
 *phy,
> >       if (!limits)
> >               return -ENOMEM;
> >
> > -     sku_len =3D is_mt7921(dev) ? sizeof(sku_tlbv) : sizeof(sku_tlbv) =
- 92;
> > +     sku_len =3D is_connac2(dev) ? sizeof(sku_tlbv) : sizeof(sku_tlbv)=
 - 92;
> >       tx_power =3D 2 * phy->hw->conf.power_level;
> >       if (!tx_power)
> >               tx_power =3D 127;
> > @@ -3080,7 +3080,7 @@ static u32 mt76_connac2_get_data_mode(struct mt76=
_dev *dev, u32 info)
> >   {
> >       u32 mode =3D DL_MODE_NEED_RSP;
> >
> > -     if ((!is_mt7921(dev) && !is_mt7925(dev)) || info =3D=3D PATCH_SEC=
_NOT_SUPPORT)
> > +     if ((!is_connac2(dev) && !is_mt7925(dev)) || info =3D=3D PATCH_SE=
C_NOT_SUPPORT)
> >               return mode;
> >
> >       switch (FIELD_GET(PATCH_SEC_ENC_TYPE_MASK, info)) {
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/dri=
vers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > index f44977f9093d..1ef25385f3c6 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > @@ -1866,7 +1866,7 @@ mt76_connac_mcu_gen_dl_mode(struct mt76_dev *dev,=
 u8 feature_set, bool is_wa)
> >
> >       ret |=3D feature_set & FW_FEATURE_SET_ENCRYPT ?
> >              DL_MODE_ENCRYPT | DL_MODE_RESET_SEC_IV : 0;
> > -     if (is_mt7921(dev) || is_mt7925(dev))
> > +     if (is_connac2(dev) || is_mt7925(dev))
> >               ret |=3D feature_set & FW_FEATURE_ENCRY_MODE ?
> >                      DL_CONFIG_ENCRY_MODE_SEL : 0;
> >       ret |=3D FIELD_PREP(DL_MODE_KEY_IDX,
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers=
/net/wireless/mediatek/mt76/mt792x_core.c
> > index f318a53e4deb..2142fcc4ae27 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> > @@ -151,7 +151,7 @@ void mt792x_stop(struct ieee80211_hw *hw, bool susp=
end)
> >       cancel_work_sync(&dev->reset_work);
> >       mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
> >
> > -     if (is_mt7921(&dev->mt76)) {
> > +     if (is_connac2(&dev->mt76)) {
> >               mt792x_mutex_acquire(dev);
> >               mt76_connac_mcu_set_mac_enable(&dev->mt76, 0, false, fals=
e);
> >               mt792x_mutex_release(dev);
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/=
net/wireless/mediatek/mt76/mt792x_dma.c
> > index 1ddec7788b66..34f07bd3097d 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
> > @@ -356,7 +356,7 @@ EXPORT_SYMBOL_GPL(mt792x_poll_rx);
> >
> >   int mt792x_wfsys_reset(struct mt792x_dev *dev)
> >   {
> > -     u32 addr =3D is_mt7921(&dev->mt76) ? 0x18000140 : 0x7c000140;
> > +     u32 addr =3D is_connac2(&dev->mt76) ? 0x18000140 : 0x7c000140;
> >
> >       mt76_clear(dev, addr, WFSYS_SW_RST_B);
> >       msleep(50);
>
>
> --
> Best, Philip
>

