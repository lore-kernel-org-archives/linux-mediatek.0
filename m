Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4BE606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cNTzYlYN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DownkYcYqpNvlsPHthmAF3y1JRd2IVBhq+1/JYtvBX4=; b=cNTzYlYNsP0J9l
	I0YOYXzF3u7BCkSbQ3jJI0NUf6L9xYLVcwrsPbeao5Ty2lD2+34vfdXK7R36iFv1zYJxldlnmzFto
	5s7pdCEoYnibTiju0eY4jj0tR7aAfWVwxbdmnjdcOlk3EuztDaMNzkKd3yBdc8DGqfq9TOibfLTmZ
	RgCO7KrlNIHPTKuiVAPCe7RIx/jfzuX8xOwdjle7+F2cB4+L/MCh9J2dslnXInN8N8S02J1CrZjP2
	/nZRZfaMyQe852CPaO4zYDMTW37Z3l6gst8q6eMTugTKQ9g45w97FbVoeiQa3w20i87wHACiMi2a3
	xjX3eu27vMzLKfKk9V8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yM-000000049PC-1EmK;
	Mon, 16 Nov 2026 23:18:50 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yJ-000000049Nr-2LKe
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:18:48 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-862b98b2e47so758777a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871126; x=1795475926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DownkYcYqpNvlsPHthmAF3y1JRd2IVBhq+1/JYtvBX4=;
        b=xd94Bz/iuSK+XGRy8cGg2XI2qfNb4N3rShX9Pdl3nvwbk5E3r4HFDCM4/epzdo1Y5W
         bTUeUKQxMRa8suYt3M6VJbevpfQakS1aK9TnxIeCMoHoxtXa+Ld0e18pzu2CTC7bRpml
         fTX4bfDOyl2RcTo6d7CEJt+thJNYSiQxiyy11SqbxWB3ZQb7cxzBRXvKn3G1Tvq69D4F
         UsswR1iuirccy3kPZUmQn/9wlXY9VO6IN+og09oT1iYT1Wt7jcdhKu7sldOXXSf1rwXh
         pA3HsBkCsoD5tRe0o6KVaTXuBZNAffhbwK/aXjLpCp3gJ4GSimAcLJEwuqdcT46kfk88
         ZssA==
X-Forwarded-Encrypted: i=1; AL+hErHIJKMLQ0EquwkJArv515Ih0ZSS1DjW86/jlTLtqKH6Tt3lHajZiGItDQa4siqFQwauicMwDVyAXIblMcUWHw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8i+N/HPPa4+rW1D/XBg1LXT/CGnQM4S39BP4pJUboJd2V9c2lK
	2hBV+/EPPF/UuTYljb6rPjVzeTCam/RqyziHszmNwmA26Bzmyfzm8l/X
X-Gm-Gg: AYBFou1yTN3wO+3NFCEbMy37v1Aiw1dQ/FkkfEmtSsb8tVOfW10HETDfWs87aQg6rPA
	+0BZP10yM1ymc/sVycEBiPXyPXOIDSYs1gLJ0dscW2IRWv+uo2vfl1C+2sbr3jrLP7rsORxSf31
	9WZsqj+d38M7xT6IGRmDP/XepgKccoRueDtyI0oroi0desICsjgdIjyT8ourgKyATUnXBUPIhh9
	SHttQ8JNU7bwtXbYZ3y9fNSQ20XjGDvkA56mFYB5UzYaAdRiVzUiB/GCcSS5h16AO/G0K1xGRDQ
	iaqBLTGrEaPVu2WryH7wsVYyjt4imuzrY2n72iRz5R7gYsUZBRzi0uI9V5uz8wogGbdMMCPe5O8
	GH/GsU2K7K39wA9u2PLgsLKt95loz/Kk38LZVvVpydkE7LaGDe9RYRh+yoQrYUSFc7Ax4Gvim4o
	OGYzP9zHRjgeq061clEvFV6E9U0Y2xy4vaAcDUvWC9G5k2ig8hbO3lbvgy8fAxyz/vKsKlKIN4W
	mDGaDTp1tL+HCgT7JakN752URuvmeodDHLg2TqY9GLqJjVjIy2s8vBK8Y0a1SICkIFXHD2X/XZJ
	E1JcgwWsnzWZg0wLGPA8/TzgTAYN2znzyeYpzlX1GdWVh8we0hgTKvwnkJWsqG93p0gNLG53Zaj
	jBs+YNACL
X-Received: by 2002:a05:6809:27ce:b0:571:b166:3d5b with SMTP id 5614622812f47-571b1759fe9mr5401883b6e.56.1794871126364;
        Mon, 16 Nov 2026 15:18:46 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:18:44 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 04/19] wifi: mt76: mt7925: implement mt7925_nan_set_key for NAN security
Date: Mon, 16 Nov 2026 17:16:15 -0600
Message-ID: <20261116231630.1733906-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151847_625968_A1911597 
X-CRM114-Status: GOOD (  24.67  )
X-Spam-Score: -0.4 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  28 ++++
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 155 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  16 ++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  42 ++++-
 .../net/wireless/mediatek/mt76/mt792x_core.c  |   7 +
 5 files changed, 245 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 490507ce97cd..a258996a6aae 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -491,6 +491,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 
 	if (vif->type == NL80211_IFTYPE_NAN)
 		dev->nan_vif = vif;
+
 out:
 	mt792x_mutex_release(dev);
 
@@ -825,6 +826,33 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
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
index 2c01dee27649..c1af0dc2315f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -1469,3 +1469,158 @@ int mt792x_nan_map_sta_rec(struct mt76_dev *mdev,
 
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
+		/* TX GTK: not supported yet.  Each NAN Data Cluster uses its own
+		 * TX GTK, but mac80211 does not pass an NDC ID at set_key time,
+		 * so the correct key cannot be selected.
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
index 190de376ef54..0dcd1eeaa92b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -128,6 +128,16 @@ enum mt7925_nan_key_type {
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
@@ -586,6 +596,12 @@ int mt7925_nan_manage_key_cmd(struct mt792x_dev *dev,
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
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 07004066e666..7ab84de262d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -155,9 +155,7 @@ struct mt792x_sta {
 	/* NAN peer schedule */
 	struct mt792x_sta_nan_sched nan_sched;
 
-	/* NAN per-peer group key WTBLs (allocated lazily when keys are installed)
-	 * Note: TX GTK is interface-level, see mt792x_vif->nan_tx_gtk_table
-	 */
+	/* NAN per-peer group key WTBLs (allocated lazily when keys are installed) */
 	struct mt76_wcid nan_rx_gtk_wcid;    /* NAN_DATA peer: RX GTK WTBL (per-peer) */
 	struct mt76_wcid nan_rx_igtk_wcid;   /* NAN peer: RX IGTK/BIGTK WTBL (per-peer) */
 };
@@ -190,6 +188,44 @@ struct mt792x_nan_conf {
 	bool enable_dw_notification;
 };
 
+/*
+ * NAN WTBL layout (mt7925)
+ *
+ * TX scope -- determined by who shares the encrypting key:
+ *
+ *   mvif->sta.deflink.wcid          [NAN vif, interface-level]
+ *     TX IGTK/BIGTK: multicast management TX.  Shared by all NMI peers;
+ *     installed via the normal hardware key path (set_key fallback).
+ *
+ *   mvif->sta.deflink.wcid          [NAN_DATA vif, interface-level]
+ *     TX GTK: multicast data TX.
+ *     NOTE: all peers in the same NAN Data Cluster share one TX GTK, and
+ *     different NDCs use independent keys, so this really wants one WTBL
+ *     per NDC.  set_key returns -EOPNOTSUPP instead: mac80211 does not
+ *     pass an NDC ID, so the right key cannot be picked.
+ *
+ * RX scope -- always per-peer because each sender has its own key:
+ *
+ *   msta->deflink.wcid              [NMI or NDI peer, peer-level]
+ *     NM-TK (NMI unicast) or ND-TK (NDI unicast).
+ *
+ *   msta->nan_rx_gtk_wcid           [NDI peer under NAN_DATA vif, peer-level]
+ *     RX GTK: multicast data RX.  Keyidx 1-2; allocated lazily in set_key.
+ *
+ *   msta->nan_rx_igtk_wcid          [NMI peer under NAN vif, peer-level]
+ *     RX IGTK/BIGTK: multicast management RX.  Keyidx 4-7; allocated
+ *     lazily in set_key.
+ *
+ * Example -- 2 peers, full security:
+ *   1  NAN vif WTBL                 TX IGTK/BIGTK
+ *   1  NAN_DATA vif WTBL            TX GTK
+ *   2  NMI peer WTBLs               NM-TK (one per peer)
+ *   2  NDI peer WTBLs               ND-TK (one per peer)
+ *   2  RX GTK WTBLs                 nan_rx_gtk_wcid, one per NDI peer
+ *   2  RX IGTK/BIGTK WTBLs          nan_rx_igtk_wcid, one per NMI peer
+ *  = 10 WTBLs total
+ */
+
 struct mt792x_nan {
 	struct mt792x_nan_conf conf;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 1965e9de7099..472333ac1a62 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -828,6 +828,13 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
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


