Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA72C9832F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPcZ2fFHbVz/35/HnRpj2so7Fi8hcmMSUL8h6/KwQGc=; b=VtzcMKdZMkyAwWDFvKuzv0fdpB
	vhTHFff8kq0RxJ5NrI9h2kat0t3s9syFRL2iXLPich5L3c96JBPSmFBXqv2mrypDwBHzTbK+jn8qx
	/q26zjCbHK+7N0iV/sWXdlQ2780lsvsB5/ieCqDsrXn3bpv1dxtMNi8vqW2kyrXIarEzYZBv7ceos
	O0WM+vRsz2kz5szRhFdLC7tC7U2eo+bFZ0BgH8K35kUEsIeyFkFGroP331lGlkDHb4Cgd0zWz0hp3
	WtompFvjZgafEvHn/Xy2Re7emmaAmVpKzFrtR2cuaNvzjVYhtIm1J9lPP5X4bIbw2U41sWbzO0TUj
	RfXV3hbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw7c-0000000GrxI-1gjr;
	Sun, 27 Sep 2026 21:09:20 +0000
Received: from mail-qv2-f43.google.com ([74.125.230.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw7Z-0000000Grwt-2j70
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:09:18 +0000
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91434eba587so24537746d6.3
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543356; x=1791148156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPcZ2fFHbVz/35/HnRpj2so7Fi8hcmMSUL8h6/KwQGc=;
        b=yRlYyy2kC2dkE1bAv+Ktava0Zpg5YDbshZdzys35v3FUX7YiiZOW1kLkTRPHi0n/WQ
         L7ZRsg66kd3AJLpu5mQKZ7VSyCnhO9Q0iT53DBGiwpsfBqlXBhao9VS0MB2ugWlyvgQq
         ZVbAjPBRKUbZGR3PO4DE1ThYZNxuTWQKpKsCvjd5LqDc3W4+vsH6fU93RGywPalDyuml
         +P7K9BhxTIEmmHj0y4kIWMJnmx7moUaY9PbjFJKgJ2hjLRktdHKWdPuDQEYGPQe5f3JL
         xt/DwNyfHJAFKsdy/Et3nc0RPHDu2wx/WRNfu90K5IRXG7Cx0geKjYQziCiqhOGmwUJ0
         RybQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKPIco4Jf7ltyKxPKsr4AEp5PbuO6Zw1bPhkDBjEG03vohKzud8JzeamDFQMPTQuC9jMWnknA2xGvuNOHD5g==@lists.infradead.org
X-Gm-Message-State: AFuF++lvSiqnM9QBRUa/68ZYJIr8t8/GirHzrp4KQ5j5pRQtxIWZI1my
	WOS5lGMd6SiUbbFAIyryOzgDC9aFWrOntuqtFJyfez6pdAsDAn/CGSi6DF2gy4Yw
X-Gm-Gg: AYBFou1SKSRy/631H7lswsO79nNkAfrKvx9OpH7q0CJPylr9K63mIQvba84vUe3C2J3
	Bq7nyTm6B+IoO3fsGgucLM1tWre2MwSM0TjaB5vP1C89tJNyvda9uw6ZoCtA3YHkU81Al0Ncloi
	r7D34Xvd0/3U7sxIy98L5v15epa1C3TcQqRpzHyJF/gOufrCgM4AW6yltJLRXqzTXfTJ+llvxLP
	ULHMpzzbD0Ai8byxZz4WQ84pJ7+P2MRs8lE2mfYKr0vOZiCRADZtwcbnTqfrpYA3yf4tA4Bu3aO
	rAbrPlbZcQZEUJeA9B0vs9JPAvWzS/fnOdM39BYyyVOvm4E8QNKYFe299DE/gGeptSoWWXUR2QS
	hHmDp2l+RDGaaUTeoJRI59YTqjnjwvvANn5GfK/STTG8kqdFkmEzQqYWwluS0sm2LtukTvdzZpF
	hQ+sJKn2j297aY5e3zBPoMcuGsV9ijDrOC9pu7h7WeisiKHazNqHVZOv95T+9STFzF5yS+cTqye
	xVZQwZCui+qjNouGnAuNyfdhsfF8SpptunUlmEJ/ixPGf4aOqWSk34o/AG1SehsrCCDfvKLdTaL
	pkxH
X-Received: by 2002:a05:690c:6612:b0:883:2240:7df1 with SMTP id 00721157ae682-8a86d7d94a7mr23678867b3.48.1790543030458;
        Sun, 27 Sep 2026 14:03:50 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:03:50 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Chengwei Yu <chengwei.yu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 09/23] wifi: mt76: mt7925: implement mt7925_nan_set_key for NAN security
Date: Sun, 27 Sep 2026 16:02:51 -0500
Message-ID: <20260927210306.737669-10-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_140917_708692_EF85F191 
X-CRM114-Status: GOOD (  20.87  )
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

From: Chengwei Yu <chengwei.yu@mediatek.com>

Wire up NAN/NAN_DATA group key installation on top of the MCU command
and per-peer WTBLs from prior commits:

 - NAN RX IGTK/BIGTK (keyidx 4-7, sta != NULL): lazy WTBL alloc via
   nan_rx_igtk_wcid; installed as NAN_KEY_TYPE_MC_MGMT_RX_KEY.
 - NAN_DATA RX GTK (keyidx 1-2, sta != NULL): lazy WTBL alloc via
   nan_rx_gtk_wcid; installed as NAN_KEY_TYPE_MC_RX_KEY.
 - NAN_DATA TX GTK: -EOPNOTSUPP; NDC ID unavailable at set_key time,
   keeping mac80211 in SW crypto until NDC-aware support lands.

mt7925_set_key() routes NAN/NAN_DATA vifs through mt7925_nan_set_key()
and blocks NAN_DATA group keys from reaching set_link_key, preventing
silent HW-offload of the unsupported TX GTK path.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  27 +++
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 154 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  16 ++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |   7 +
 4 files changed, 204 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 1b253989f43b..6c603d57e89f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -765,6 +765,33 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt792x_link_sta *mlink;
 	int err;
 
+	/* Route NAN/NAN_DATA keys.
+	 *
+	 * mt7925_nan_set_key() owns every key that needs a dedicated WTBL and
+	 * returns -EOPNOTSUPP to signal "not mine, use the normal HW path".
+	 * Three cases legitimately reach the normal path:
+	 *
+	 *   NAN     + pairwise  (NM-TK):     set_link_key via NMI peer WTBL
+	 *   NAN_DATA + pairwise (ND-TK):     set_link_key via NDI peer WTBL
+	 *   NAN     + group     (TX IGTK/BIGTK): set_link_key via NAN iface WTBL
+	 *
+	 * NAN_DATA TX GTK is the one group key on NAN_DATA that nan_set_key
+	 * also declines (-EOPNOTSUPP) because NDC ID is unavailable at set_key
+	 * time.  It must NOT reach set_link_key: that function would succeed
+	 * and silently install the key on the interface WTBL, causing mac80211
+	 * to mark it as HW-offloaded and skip SW crypto.  Return -EOPNOTSUPP
+	 * so mac80211 uses SW encryption until TX GTK support is complete.
+	 */
+	if (vif->type == NL80211_IFTYPE_NAN || vif->type == NL80211_IFTYPE_NAN_DATA) {
+		err = mt7925_nan_set_key(hw, cmd, vif, sta, key);
+		if (err != -EOPNOTSUPP)
+			return err;
+		/* Block NAN_DATA group keys from reaching set_link_key. */
+		if (vif->type == NL80211_IFTYPE_NAN_DATA &&
+		    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
+			return -EOPNOTSUPP;
+	}
+
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
 	 */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 0579501207eb..e1dfcdc88382 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -1581,3 +1581,157 @@ int mt792x_nan_map_sta_rec(struct mt76_dev *mdev,
 
 	return ret ?: -ENOMEM;
 }
+
+/* Allocate a WTBL slot for a lazily-created per-peer NAN group key wcid.
+ * Mirrors mt76_wcid_alloc/init but wires the slot into the RCU wcid table and
+ * clears the hardware admission counter, matching what mt7925_mac_link_sta_add
+ * does for every normal per-link wcid.  Caller must hold dev->mt76.mutex; RCU
+ * publish is the final step so readers always see a fully initialised wcid.
+ */
+int mt7925_nan_wcid_alloc(struct mt792x_dev *dev, struct mt76_wcid *wcid)
+{
+	int idx;
+
+	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
+	if (idx < 0)
+		return -ENOSPC;
+
+	wcid->idx = idx;
+	wcid->tx_info |= MT_WCID_TX_INFO_SET;
+	mt76_wcid_init(wcid, 0);
+	mt7925_mac_wtbl_update(dev, idx, MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	rcu_assign_pointer(dev->mt76.wcid[idx], wcid);
+
+	return 0;
+}
+
+/* NAN RX IGTK/BIGTK (keyidx 4-7, sta != NULL): lock first, then lazy alloc. */
+static int mt7925_nan_set_rx_igtk(struct mt792x_dev *dev,
+				  const u8 *local_addr, const u8 *peer_addr,
+				  struct mt792x_sta *msta,
+				  enum set_key_cmd cmd,
+				  struct ieee80211_key_conf *key)
+{
+	enum mt7925_nan_key_operation key_op;
+	u16 wtbl_idx;
+	int err;
+
+	mt792x_mutex_acquire(dev);
+
+	/* Lazy allocation of per-peer RX IGTK/BIGTK WTBL: mt76_wcid_alloc()
+	 * touches the shared wcid mask and mt7925_mac_wtbl_update() writes
+	 * hardware registers, so both need dev->mt76.mutex and a woken chip.
+	 */
+	if (msta->nan_rx_igtk_wcid.idx == MT792x_WCID_IDX_UNSET) {
+		if (cmd != SET_KEY) {
+			mt792x_mutex_release(dev);
+			return 0;
+		}
+		err = mt7925_nan_wcid_alloc(dev, &msta->nan_rx_igtk_wcid);
+		if (err) {
+			mt792x_mutex_release(dev);
+			return err;
+		}
+	}
+
+	key_op = (cmd == SET_KEY) ? NAN_KEY_OP_SET_KEY : NAN_KEY_OP_CLS_KEY;
+	wtbl_idx = msta->nan_rx_igtk_wcid.idx;
+
+	err = mt7925_nan_manage_key_cmd(dev, key_op, NAN_KEY_TYPE_MC_MGMT_RX_KEY,
+					wtbl_idx, local_addr, peer_addr,
+					&(struct mt7925_nan_key_info){
+						.algo_id = mt7925_mcu_get_cipher(key->cipher),
+						.key_id  = key->keyidx,
+						.key_len = key->keylen,
+						.key_data = key->key,
+					});
+	mt792x_mutex_release(dev);
+	return err;
+}
+
+/* NAN_DATA GTK (keyidx 1-2): lock first, then lazy alloc for RX; TX unsupported. */
+static int mt7925_nan_set_data_gtk(struct mt792x_dev *dev,
+				   struct ieee80211_sta *sta,
+				   struct mt792x_sta *msta,
+				   enum set_key_cmd cmd,
+				   struct ieee80211_key_conf *key)
+{
+	static const u8 bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+	enum mt7925_nan_key_operation key_op;
+	enum mt7925_nan_key_type key_type;
+	u8 *peer_addr, *local_addr;
+	u16 wtbl_idx;
+	int err;
+
+	mt792x_mutex_acquire(dev);
+
+	key_op = (cmd == SET_KEY) ? NAN_KEY_OP_SET_KEY : NAN_KEY_OP_CLS_KEY;
+
+	if (sta) {
+		/* RX GTK: per-peer dedicated WTBL */
+		peer_addr = sta->addr;
+		local_addr = (u8 *)bcast_addr;
+		key_type = NAN_KEY_TYPE_MC_RX_KEY;
+
+		/* Lazy allocation of per-peer RX GTK WTBL */
+		if (msta->nan_rx_gtk_wcid.idx == MT792x_WCID_IDX_UNSET) {
+			if (key_op != NAN_KEY_OP_SET_KEY) {
+				mt792x_mutex_release(dev);
+				return 0;
+			}
+			err = mt7925_nan_wcid_alloc(dev, &msta->nan_rx_gtk_wcid);
+			if (err) {
+				mt792x_mutex_release(dev);
+				return err;
+			}
+		}
+
+		wtbl_idx = msta->nan_rx_gtk_wcid.idx;
+	} else {
+		/* TX GTK: not supported yet; NDC ID is unavailable at set_key
+		 * time so the correct TX GTK table entry cannot be selected.
+		 */
+		dev_warn(dev->mt76.dev,
+			 "nan: TX GTK not supported (missing NDC ID)\n");
+		mt792x_mutex_release(dev);
+		return -EOPNOTSUPP;
+	}
+
+	err = mt7925_nan_manage_key_cmd(dev, key_op, key_type, wtbl_idx,
+					local_addr, peer_addr,
+					&(struct mt7925_nan_key_info){
+						.algo_id = mt7925_mcu_get_cipher(key->cipher),
+						.key_id  = key->keyidx,
+						.key_len = key->keylen,
+						.key_data = key->key,
+					});
+	mt792x_mutex_release(dev);
+	return err;
+}
+
+int mt7925_nan_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
+		       struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+		       struct ieee80211_key_conf *key)
+{
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv : &mvif->sta;
+
+	/* NAN RX IGTK/BIGTK (keyidx 4-7, sta != NULL) */
+	if (vif->type == NL80211_IFTYPE_NAN && sta &&
+	    key->keyidx >= NAN_KEY_IDX_MGMT_INTEG_MIN &&
+	    key->keyidx <= NAN_KEY_IDX_MGMT_INTEG_MAX)
+		return mt7925_nan_set_rx_igtk(dev, vif->addr, sta->addr, msta,
+					      cmd, key);
+
+	/* NAN_DATA GTK (keyidx 1-2) */
+	if (vif->type == NL80211_IFTYPE_NAN_DATA &&
+	    key->keyidx >= NAN_KEY_IDX_GTK_MIN &&
+	    key->keyidx <= NAN_KEY_IDX_GTK_MAX)
+		return mt7925_nan_set_data_gtk(dev, sta, msta, cmd, key);
+
+	/* Unicast keys (NM-TK, ND-TK) and NAN TX IGTK/BIGTK use the normal
+	 * hardware path via set_link_key.
+	 */
+	return -EOPNOTSUPP;
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index f15a16b773bb..9a47940f5d61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -127,6 +127,16 @@ enum mt7925_nan_key_type {
 #define WTBL_RESERVED_ENTRY	0xFFFF
 #define NAN_PACKET_NUMBER_LEN	6
 
+/* NAN key index ranges from the Wi-Fi NAN spec.  mac80211 passes keyidx
+ * straight from wpa_supplicant without interpretation, so the driver must
+ * define these boundaries itself -- no kernel-wide equivalent exists.
+ * Wi-Fi NAN spec 7.1.3.2 (GTKSA), 7.1.3.3 (IGTKSA), 7.1.3.4 (BIGTKSA).
+ */
+#define NAN_KEY_IDX_GTK_MIN		1	/* GTKSA:  key ID 1-2 */
+#define NAN_KEY_IDX_GTK_MAX		2
+#define NAN_KEY_IDX_MGMT_INTEG_MIN	4	/* IGTKSA (4-5) + BIGTKSA (6-7) */
+#define NAN_KEY_IDX_MGMT_INTEG_MAX	7
+
 /* bit indices into mt792x_dev->nan_deferred_pending, set from the atomic
  * MCU-event RX path and consumed by mt7925_nan_deferred_work()
  */
@@ -600,6 +610,12 @@ int mt7925_nan_manage_key_cmd(struct mt792x_dev *dev,
 			      const u8 *peer_addr,
 			      const struct mt7925_nan_key_info *key);
 
+int mt7925_nan_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
+		       struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+		       struct ieee80211_key_conf *key);
+
+int mt7925_nan_wcid_alloc(struct mt792x_dev *dev, struct mt76_wcid *wcid);
+
 void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 				    struct ieee80211_vif *vif);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index c8e42447f43a..94bd0e3fe2e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -824,6 +824,13 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 		wiphy->nan_capa.max_channel_switch_time = 12;
 		wiphy->nan_capa.dev_capabilities = NAN_DEV_CAPA_EXT_KEY_ID_SUPPORTED;
 		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SECURE_NAN);
+		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_PROTECTION);
+		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_PROTECTION_CLIENT);
+		/* Per-peer group key WTBL needed for NAN RX IGTK/BIGTK delivery:
+		 * ieee80211_key_enable_hw_accel() drops per-STA group keys unless
+		 * this flag is set or the vif is NAN_DATA.
+		 */
+		ieee80211_hw_set(hw, SUPPORTS_PER_STA_GTK);
 	}
 
 	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
-- 
2.43.0


