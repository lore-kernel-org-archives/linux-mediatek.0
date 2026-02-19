Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257E7E9A02C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LH4S+1XsJPMJRsAGgPmW1IMg5PL/3wiKYj9tUAQ4GC4=; b=s/6YCXoh1Jex8QQRugdV0ybgly
	JIJLA+6+HnDGLYUw3okm/WtpIU4Q1sNGugj4SWHrGwXn51uE9HXlXv5hj1ATYxRdGKIY4wMgy0vzw
	XeBItAsxjbmHJZz1P+AYbfSWEsMdOF7HG39GXQf0HZ+lLAvFkSFBEKqQf3ivr272D2GPL49Ams6v2
	+LHAQbBCOyfv4L7J49Q8fo6Bpm6nDAqBSDMqBG8qjoxM9od7C8makFs3D/LYsaR5227gyId2IZ/PC
	c0UOhc0orfHJN3ZFGRzttihu91my5nFEnXR2Qi2en/txD0B6G+MrbZWfMsnKCp2F+8vhYgJJCPMjJ
	svtB+T4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5W-0000000AeZF-3cfC;
	Thu, 19 Feb 2026 00:40:14 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5U-0000000AeYr-3FpZ
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:14 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40946982a78so138314fac.2
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461611; x=1772066411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LH4S+1XsJPMJRsAGgPmW1IMg5PL/3wiKYj9tUAQ4GC4=;
        b=HPRluAjFy7aUsC37g/ZzX0CUSezdBPXo41+Z9dpFut5oOdOJwpoPYpfDC+nQEMA8By
         RQ6K9ZkSNGF63fvj/o3GYkQiofrkcw+DVdxTJjhUEI1Ic8f0xS8fMdnedkxReepdxPQd
         r9hXp//mSU9wcEHE58XZNAsOv12y2Xtq25rmBCQ4baZQuT2MhkZaOJdC6HIGdO6XDXhY
         j2USe5bVPLeUXHtJnvpIqzNQqPPGqFJkdRrXbEJDpuRkZT6uhygr3x1Ev4KOi8vE1y5Z
         9ib2wBqddLZktEmk6mAlribzbaEiWdNBJcw5s0gPtgbEbNnalN6i4fLgNMFhZpp8w+sa
         Uw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqmBhZwq+4E/DkgCnQbydMgMvhbhcbjOdXACUO08JCbjXAjQGb/R39tC19hGUEZzn5Y+6rckpIdlDVqU3+5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YydzejXyPXP4qHZNawQJSSjh2Yu9tEHIWqauDGl/WNOQMTuNcxA
	xn+WYctfKA0D1+dqqklHGrj9mT+84Nfb3Nl/8mOIfVAoOYq4QkrtJBZM
X-Gm-Gg: AZuq6aKTWDUh7euMoD+v/0Lt9eNZx+r6sHKHWVg0ltsOVsIjLVWwaPKBod5VT8YyvG/
	8457QiA7zk6TKDKEUUSRrZRkuuW1wZ428Cs4np5AvIAgsXsjLkczWvMCII02ZXwkJVQxlphW+DD
	nqPhtuYoe0xhPlN2BZU7ARl+MqqGhekwAbhSsiXVnH+nDcjmVeAXBQ6D+RwAloz2n1Qtm6n8QIg
	+XMgF3/juPVYSjIcdK8kms/hylh2EQljeNrsFOEUn0kf1vcUp8V0BTWMNIu1TI8YQ9Rxk6CLq8f
	tctaWY+fN4yW3tvLQDWKFPw3VkxnQVg30roKj7/H6i90+EK+I3D/7DkZiy4+rxgrwGeZh3cFe06
	N4uWuAydNhvQNgwCWQendxpGAdGsomZBI54j1r7fDb+F9T1K3FAqDyEq3eDGplPZRKIC30szZ7A
	zgFB5xaBFd9tBhsek1gKSBogtcsJpKcjHJ0/3ED2SxwGhtjpA=
X-Received: by 2002:a05:6870:2e95:b0:40a:5795:153c with SMTP id 586e51a60fabf-40ef3ece78cmr12010225fac.34.1771461610736;
        Wed, 18 Feb 2026 16:40:10 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:10 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 01/11] wifi: mt76: connac: use is_connac2() to replace is_mt7921() checks
Date: Wed, 18 Feb 2026 18:39:57 -0600
Message-ID: <20260219004007.19733-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164012_835247_D83690DC 
X-CRM114-Status: GOOD (  15.37  )
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

From: Sean Wang <sean.wang@mediatek.com>

Unify all per-chip conditionals under the new is_connac2() helper. This
avoids confusion caused by the previous is_mt7921() check, which
implicitly covered multiple connac2 chipsets and no longer reflected its
actual scope. This is a clean-up only change with no functional impact.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  2 +-
 .../wireless/mediatek/mt76/mt76_connac_mac.c  | 16 ++++++------
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 26 +++++++++----------
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  2 +-
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt792x_dma.c   |  2 +-
 6 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 813d61bffc2c..02bea67d37c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -187,7 +187,7 @@ static inline bool is_mt7922(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7922;
 }
 
-static inline bool is_mt7921(struct mt76_dev *dev)
+static inline bool is_connac2(struct mt76_dev *dev)
 {
 	return mt76_chip(dev) == 0x7961 || is_mt7922(dev) || is_mt7920(dev);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 4ef44514d48d..e76f6e28b7f0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -173,7 +173,7 @@ void mt76_connac_write_hw_txp(struct mt76_dev *dev,
 
 	txp->msdu_id[0] = cpu_to_le16(id | MT_MSDU_ID_VALID);
 
-	if (is_mt7663(dev) || is_mt7921(dev) || is_mt7925(dev))
+	if (is_mt7663(dev) || is_connac2(dev) || is_mt7925(dev))
 		last_mask = MT_TXD_LEN_LAST;
 	else
 		last_mask = MT_TXD_LEN_AMSDU_LAST |
@@ -217,7 +217,7 @@ mt76_connac_txp_skb_unmap_hw(struct mt76_dev *dev,
 	u32 last_mask;
 	int i;
 
-	if (is_mt7663(dev) || is_mt7921(dev) || is_mt7925(dev))
+	if (is_mt7663(dev) || is_connac2(dev) || is_mt7925(dev))
 		last_mask = MT_TXD_LEN_LAST;
 	else
 		last_mask = MT_TXD_LEN_MSDU_LAST;
@@ -309,7 +309,7 @@ u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mphy,
 	chandef = mvif->ctx ? &mvif->ctx->def : &mphy->chandef;
 	band = chandef->chan->band;
 
-	if (is_mt7921(mphy->dev)) {
+	if (is_connac2(mphy->dev)) {
 		rateidx = ffs(conf->basic_rates) - 1;
 		goto legacy;
 	}
@@ -547,7 +547,7 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 	val = MT_TXD1_LONG_FORMAT |
 	      FIELD_PREP(MT_TXD1_WLAN_IDX, wcid->idx) |
 	      FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
-	if (!is_mt7921(dev))
+	if (!is_connac2(dev))
 		val |= MT_TXD1_VTA;
 	if (phy_idx || band_idx)
 		val |= MT_TXD1_TGID;
@@ -556,7 +556,7 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 	txwi[2] = 0;
 
 	val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 15);
-	if (!is_mt7921(dev))
+	if (!is_connac2(dev))
 		val |= MT_TXD3_SW_POWER_MGMT;
 	if (key)
 		val |= MT_TXD3_PROTECT_FRAME;
@@ -598,7 +598,7 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		txwi[6] |= cpu_to_le32(val);
 		txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
 
-		if (!is_mt7921(dev)) {
+		if (!is_connac2(dev)) {
 			u8 spe_idx = mt76_connac_spe_idx(mphy->antenna_mask);
 
 			if (!spe_idx)
@@ -830,7 +830,7 @@ mt76_connac2_mac_decode_he_mu_radiotap(struct mt76_dev *dev, struct sk_buff *skb
 	};
 	struct ieee80211_radiotap_he_mu *he_mu;
 
-	if (is_mt7921(dev)) {
+	if (is_connac2(dev)) {
 		mu_known.flags1 |= HE_BITS(MU_FLAGS1_SIG_B_COMP_KNOWN);
 		mu_known.flags2 |= HE_BITS(MU_FLAGS2_PUNC_FROM_SIG_A_BW_KNOWN);
 	}
@@ -1046,7 +1046,7 @@ int mt76_connac2_mac_fill_rx_rate(struct mt76_dev *dev,
 		stbc = FIELD_GET(MT_PRXV_HT_STBC, v0);
 		gi = FIELD_GET(MT_PRXV_HT_SGI, v0);
 		*mode = FIELD_GET(MT_PRXV_TX_MODE, v0);
-		if (is_mt7921(dev))
+		if (is_connac2(dev))
 			dcm = !!(idx & MT_PRXV_TX_DCM);
 		else
 			dcm = FIELD_GET(MT_PRXV_DCM, v0);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 3f583e2a1dc1..d7fbf3454bb8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -65,7 +65,7 @@ int mt76_connac_mcu_init_download(struct mt76_dev *dev, u32 addr, u32 len,
 	int cmd;
 
 	if ((!is_connac_v1(dev) && addr == MCU_PATCH_ADDRESS) ||
-	    (is_mt7921(dev) && addr == 0x900000) ||
+	    (is_connac2(dev) && addr == 0x900000) ||
 	    (is_mt7925(dev) && (addr == 0x900000 || addr == 0xe0002800)) ||
 	    (is_mt799x(dev) && addr == 0x900000))
 		cmd = MCU_CMD(PATCH_START_REQ);
@@ -402,7 +402,7 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 	switch (vif->type) {
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_AP:
-		if (vif->p2p && !is_mt7921(dev))
+		if (vif->p2p && !is_connac2(dev))
 			conn_type = CONNECTION_P2P_GC;
 		else
 			conn_type = CONNECTION_INFRA_STA;
@@ -410,7 +410,7 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 		basic->aid = cpu_to_le16(link_sta->sta->aid);
 		break;
 	case NL80211_IFTYPE_STATION:
-		if (vif->p2p && !is_mt7921(dev))
+		if (vif->p2p && !is_connac2(dev))
 			conn_type = CONNECTION_P2P_GO;
 		else
 			conn_type = CONNECTION_INFRA_AP;
@@ -874,7 +874,7 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 		struct sta_rec_vht *vht;
 		int len;
 
-		len = is_mt7921(dev) ? sizeof(*vht) : sizeof(*vht) - 4;
+		len = is_connac2(dev) ? sizeof(*vht) : sizeof(*vht) - 4;
 		tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_VHT, len);
 		vht = (struct sta_rec_vht *)tlv;
 		vht->vht_cap = cpu_to_le32(sta->deflink.vht_cap.cap);
@@ -885,7 +885,7 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 	/* starec uapsd */
 	mt76_connac_mcu_sta_uapsd(skb, vif, sta);
 
-	if (!is_mt7921(dev))
+	if (!is_connac2(dev))
 		return;
 
 	if (sta->deflink.ht_cap.ht_supported || sta->deflink.he_cap.has_he)
@@ -1778,7 +1778,7 @@ int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	req->ssid_type_ext = n_ssids ? BIT(0) : 0;
 	req->ssids_num = n_ssids;
 
-	duration = is_mt7921(phy->dev) ? 0 : MT76_CONNAC_SCAN_CHANNEL_TIME;
+	duration = is_connac2(phy->dev) ? 0 : MT76_CONNAC_SCAN_CHANNEL_TIME;
 	/* increase channel time for passive scan */
 	if (!sreq->n_ssids)
 		duration *= 2;
@@ -1821,7 +1821,7 @@ int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		req->ies_len = cpu_to_le16(sreq->ie_len);
 	}
 
-	if (is_mt7921(phy->dev))
+	if (is_connac2(phy->dev))
 		req->scan_func |= SCAN_FUNC_SPLIT_SCAN;
 
 	memcpy(req->bssid, sreq->bssid, ETH_ALEN);
@@ -1897,7 +1897,7 @@ int mt76_connac_mcu_sched_scan_req(struct mt76_phy *phy,
 		get_random_mask_addr(addr, sreq->mac_addr,
 				     sreq->mac_addr_mask);
 	}
-	if (is_mt7921(phy->dev)) {
+	if (is_connac2(phy->dev)) {
 		req->mt7921.bss_idx = mvif->idx;
 		req->mt7921.delay = cpu_to_le32(sreq->delay);
 	}
@@ -2037,7 +2037,7 @@ mt76_connac_mcu_build_sku(struct mt76_dev *dev, s8 *sku,
 			  struct mt76_power_limits *limits,
 			  enum nl80211_band band)
 {
-	int max_power = is_mt7921(dev) ? 127 : 63;
+	int max_power = is_connac2(dev) ? 127 : 63;
 	int i, offset = sizeof(limits->cck);
 
 	memset(sku, max_power, MT_SKU_POWER_LIMIT);
@@ -2065,7 +2065,7 @@ mt76_connac_mcu_build_sku(struct mt76_dev *dev, s8 *sku,
 		offset += 12;
 	}
 
-	if (!is_mt7921(dev))
+	if (!is_connac2(dev))
 		return;
 
 	/* he */
@@ -2121,7 +2121,7 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 				  enum nl80211_band band)
 {
 	struct mt76_dev *dev = phy->dev;
-	int sku_len, batch_len = is_mt7921(dev) ? 8 : 16;
+	int sku_len, batch_len = is_connac2(dev) ? 8 : 16;
 	static const u8 chan_list_2ghz[] = {
 		1, 2,  3,  4,  5,  6,  7,
 		8, 9, 10, 11, 12, 13, 14
@@ -2162,7 +2162,7 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 	if (!limits)
 		return -ENOMEM;
 
-	sku_len = is_mt7921(dev) ? sizeof(sku_tlbv) : sizeof(sku_tlbv) - 92;
+	sku_len = is_connac2(dev) ? sizeof(sku_tlbv) : sizeof(sku_tlbv) - 92;
 	tx_power = 2 * phy->hw->conf.power_level;
 	if (!tx_power)
 		tx_power = 127;
@@ -3080,7 +3080,7 @@ static u32 mt76_connac2_get_data_mode(struct mt76_dev *dev, u32 info)
 {
 	u32 mode = DL_MODE_NEED_RSP;
 
-	if ((!is_mt7921(dev) && !is_mt7925(dev)) || info == PATCH_SEC_NOT_SUPPORT)
+	if ((!is_connac2(dev) && !is_mt7925(dev)) || info == PATCH_SEC_NOT_SUPPORT)
 		return mode;
 
 	switch (FIELD_GET(PATCH_SEC_ENC_TYPE_MASK, info)) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index f44977f9093d..1ef25385f3c6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1866,7 +1866,7 @@ mt76_connac_mcu_gen_dl_mode(struct mt76_dev *dev, u8 feature_set, bool is_wa)
 
 	ret |= feature_set & FW_FEATURE_SET_ENCRYPT ?
 	       DL_MODE_ENCRYPT | DL_MODE_RESET_SEC_IV : 0;
-	if (is_mt7921(dev) || is_mt7925(dev))
+	if (is_connac2(dev) || is_mt7925(dev))
 		ret |= feature_set & FW_FEATURE_ENCRY_MODE ?
 		       DL_CONFIG_ENCRY_MODE_SEL : 0;
 	ret |= FIELD_PREP(DL_MODE_KEY_IDX,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index f318a53e4deb..2142fcc4ae27 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -151,7 +151,7 @@ void mt792x_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&dev->reset_work);
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 
-	if (is_mt7921(&dev->mt76)) {
+	if (is_connac2(&dev->mt76)) {
 		mt792x_mutex_acquire(dev);
 		mt76_connac_mcu_set_mac_enable(&dev->mt76, 0, false, false);
 		mt792x_mutex_release(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 1ddec7788b66..34f07bd3097d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -356,7 +356,7 @@ EXPORT_SYMBOL_GPL(mt792x_poll_rx);
 
 int mt792x_wfsys_reset(struct mt792x_dev *dev)
 {
-	u32 addr = is_mt7921(&dev->mt76) ? 0x18000140 : 0x7c000140;
+	u32 addr = is_connac2(&dev->mt76) ? 0x18000140 : 0x7c000140;
 
 	mt76_clear(dev, addr, WFSYS_SW_RST_B);
 	msleep(50);
-- 
2.43.0


