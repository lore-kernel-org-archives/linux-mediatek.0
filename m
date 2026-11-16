Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D86606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ltL+eOIX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5c3ewEuNavq3VRbHhbrC4PgRlgjF35/gUfe074TPTz8=; b=ltL+eOIXJqoOIo
	02E3rAJZ6Jhyiaq7/Qi0XLpbxHzr88uwxdLRFtPjIEyyNPbNDlME6naY+Izmbnu0lfOUzTE6r/9Xf
	jdyV0k8zkE3/L2G6QJ5frhdm+kI2OhEMGNIn6HC+CF/WJQteuXHxElB+BkEVGjyQvYbfk4Qjc2rZr
	v/t5uGvC806j42eFoiSMqAxOc6qPyWqSmd0WhA0pCP9z3Jd+Z5yKyNGMwTRAxm+KbEIwte3OwjZmq
	IjWAr7GfDbcbDNLi+rR4QCC8STtdl9kB56i/MRX8PlU3bqBPtzGWNVwtWXckL00T71n1oBZTZWGVQ
	gSy9u95YKKQkSIhWgaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yF-000000049L8-050Q;
	Mon, 16 Nov 2026 23:18:43 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yC-000000049Kf-0uEr
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:18:41 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53c156ba662so3161628b6e.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871119; x=1795475919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5c3ewEuNavq3VRbHhbrC4PgRlgjF35/gUfe074TPTz8=;
        b=PEelSOy7SsBsJQ14VJXTEVS43f/Ic6JIzhj0Dnf1h3H3lwkie9n1ob6cJ7rlBI27HH
         D2MjvPTnyLG8/5OjL3RRFbS0Ly9kQs+SwZDwC3Jq+3gyjAAJK5sfUzhpfo7I7oo0U844
         D7lzL50svscY1dr3uN8j9QTUsyInWxRaxrSrnM3C2QyE/fJFOytbQLi05LOsmfaAgdgm
         Av7uafSDSKwqsCBKLd5Mn3hi9K2SShaMtvHxbGxSpgwc0H1JfMt4FsJwVD6R7G4y+q92
         4QnqEcutseBIgN8cypqbOzfcUB9UcbKDTJ6CFwE8vyVePxs2Yk64z1NMCa0mQrRfW0sc
         kj4Q==
X-Forwarded-Encrypted: i=1; AL+hErGGuxJ8ug9Ae1FbO5F2kpAu53NRp9BtrxHko/5vPmiIxsQ9CAPf3adO+Eb9opNN+4L+cT1WBPL8aFSoNPUf2w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8chXXe1DrWnqLdpFN7E4ZtRqCCVLh7jvcUg43Nswvt7kcupTDq
	LYJVSObnx6PQsFZ8ZB+Lg8+r5bmCD3ko9/c4duExSShiM81XwWDW5IoE
X-Gm-Gg: AYBFou2sP4bNrz4McdH51hAn1MPkxHdSaE2jdr43jrv9S0BWc4Vsllgks/xNYTndhhG
	i8/WQP7kUEayta1MVWKQ8a4kQOezGgSDAKeEy/v6bWy+Fbu3tMOEgYlz91AuE3xADqh8YHL8Oia
	GrzJNxkUKBI9Cjk1t8cKCl8ZKweIIH7ruDjreY52NcyajqU5PaHpVPtqWMBpsx/roQBuO1Dhamj
	8eO0k7+72391MGzJkzy0IMsoHtiJoerdeLXh2CXXVvA3EosGLTEBNXnzodLQmtbiizh9d9bMx3S
	/2oi9zZ8Qm64lyKQezY6VIJ3O9idAU7MRVlmWWrflhojnJ1+zKxgZqJ/b57Bq6S/WnawsET7XOi
	U2inzxAU0noIvFB0HBSK/duMiE3HYqwh1o/bbBNsfOvy+VAc/Z0ICN1B7aPjE5Cy8EH172T2osm
	TjNgu7Qd7mabBTQtbeafCXLZXJHO5/Xv2nFHdXzCmuedMFPb/uTD20Ze8cHknR1RwLVVZxlLgdf
	IT1tzh7LKaB3Y+Fwt8LZwqJBQnBWTTVTZ1f2HWhbq1KFlZED6plfYti71scracionjnY+2M7xqW
	lSw0goShCAp2k8cdzo3l+3h3ZuLvjBxXOi7e/wfjKRwqIQLa57V0hoMvs1AtxiSk+jC9H8DB66a
	rIdus5KYZ
X-Received: by 2002:a05:6808:5092:b0:573:7a6b:f32c with SMTP id 5614622812f47-5737a6c0a74mr6031072b6e.50.1794871119170;
        Mon, 16 Nov 2026 15:18:39 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:18:37 -0800 (PST)
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
Subject: [PATCH v2 02/19] wifi: mt76: mt7925: implement NAN key management MCU command
Date: Mon, 16 Nov 2026 17:16:13 -0600
Message-ID: <20261116231630.1733906-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151840_297317_857BF9CB 
X-CRM114-Status: GOOD (  15.67  )
X-Spam-Score: -0.5 (/)
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

Add mt7925_nan_manage_key_cmd() and mt7925_nan_key_mgmt_tlv() to
install and remove NAN group and pairwise keys via
NAN_UNI_CMD_KEY_MANAGEMENT. The TLV builder covers all firmware key
types: NM-TK, ND-TK (unicast), TX/RX GTK (multicast data) and
TX/RX IGTK/BIGTK (multicast management).

Follows the same skb + mt76_connac_mcu_add_tlv() pattern as other NAN
commands (mt7925_nan_enable(), mt7925_nan_change_configure()) rather
than hand-assembling a packed struct, so it composes naturally with
the existing NAN command helpers.

Key material is grouped into struct mt7925_nan_key_info so callers
pass one pointer instead of five arguments; init/key_exist firmware
flags are hardcoded 1/0 since every real caller uses the same values.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 122 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  72 +++++++++++
 2 files changed, 194 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 39d56519bce4..2c01dee27649 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -787,6 +787,128 @@ int mt7925_nan_send_lowpower_ctrl_cmd(struct mt792x_dev *dev, bool enable)
 	return mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
 }
 
+static int
+mt7925_nan_key_mgmt_tlv(struct sk_buff *skb,
+			enum mt7925_nan_key_operation key_op,
+			enum mt7925_nan_key_type key_type,
+			u16 wtbl_entry,
+			const u8 *local_addr,
+			const u8 *peer_addr,
+			const struct mt7925_nan_key_info *key)
+{
+	struct mt7925_nan_key_mgmt_tlv *key_mgmt_tlv = NULL;
+	struct tlv *tlv = NULL;
+
+	if (!skb)
+		return -EINVAL;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, NAN_UNI_CMD_KEY_MANAGEMENT,
+				      sizeof(struct mt7925_nan_key_mgmt_tlv));
+	if (!tlv)
+		return -ENOMEM;
+
+	key_mgmt_tlv = (struct mt7925_nan_key_mgmt_tlv *)tlv;
+	key_mgmt_tlv->op = (u8)key_op;
+	key_mgmt_tlv->key_type = (u8)key_type;
+	key_mgmt_tlv->wtbl_idx = cpu_to_le16(wtbl_entry);
+	key_mgmt_tlv->init = 1;
+	key_mgmt_tlv->key_exist = 0;
+	key_mgmt_tlv->is_nmi_tk = 0;
+
+	memcpy(key_mgmt_tlv->local_addr, local_addr, ETH_ALEN);
+	memcpy(key_mgmt_tlv->peer_addr, peer_addr, ETH_ALEN);
+
+	switch (key_type) {
+	case NAN_KEY_TYPE_NMI_CXT_MGMT_KEY:
+		key_mgmt_tlv->nmi_key_idx = 0;
+		key_mgmt_tlv->is_nmi_tk = true;
+		break;
+	case NAN_KEY_TYPE_MC_TX_KEY:
+	case NAN_KEY_TYPE_MC_MGMT_TX_KEY:
+		/* TX GTK/IGTK/BIGTK: NDI-indexed slot; NDC ID not yet tracked */
+		key_mgmt_tlv->ndi_idx = 0;
+		break;
+	case NAN_KEY_TYPE_MC_RX_KEY:
+	case NAN_KEY_TYPE_MC_MGMT_RX_KEY:
+		key_mgmt_tlv->mc_rx_idx = (u8)wtbl_entry;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (key_op == NAN_KEY_OP_SET_KEY) {
+		key_mgmt_tlv->algorithm_id = key->algo_id;
+		key_mgmt_tlv->key_id = key->key_id;
+		key_mgmt_tlv->key_len = key->key_len;
+
+		if (key_type == NAN_KEY_TYPE_MC_MGMT_RX_KEY && key->pn) {
+			memcpy(key_mgmt_tlv->key_rsc, key->pn,
+			       min_t(size_t, NAN_PACKET_NUMBER_LEN,
+				     sizeof(key_mgmt_tlv->key_rsc)));
+		}
+
+		if (key->key_data) {
+			memcpy(key_mgmt_tlv->key_material, key->key_data,
+			       min_t(size_t, key->key_len,
+				     sizeof(key_mgmt_tlv->key_material)));
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * mt7925_nan_manage_key_cmd - Install/remove a NAN group or pairwise key
+ * @dev: mt792x device pointer
+ * @key_op: NAN_KEY_OP_SET_KEY or NAN_KEY_OP_CLS_KEY
+ * @key_type: which NAN key slot this targets (enum mt7925_nan_key_type)
+ * @wtbl_entry: WTBL index the key is bound to (WTBL_RESERVED_ENTRY invalid)
+ * @local_addr: local MAC address for this key context
+ * @peer_addr: peer MAC address for this key context
+ * @key: key material; key->key_data required for NAN_KEY_OP_SET_KEY
+ *
+ * There are no other callers yet; NAN group key installation added by a
+ * later change calls into this single command path.
+ */
+int
+mt7925_nan_manage_key_cmd(struct mt792x_dev *dev,
+			  enum mt7925_nan_key_operation key_op,
+			  enum mt7925_nan_key_type key_type,
+			  u16 wtbl_entry,
+			  const u8 *local_addr,
+			  const u8 *peer_addr,
+			  const struct mt7925_nan_key_info *key)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	struct mt7925_nan_common_hdr *hdr = NULL;
+	struct sk_buff *skb = NULL;
+	int ret;
+
+	if (!key || !local_addr || !peer_addr ||
+	    key_type >= NAN_KEY_TYPE_NUM ||
+	    wtbl_entry == WTBL_RESERVED_ENTRY ||
+	    (key_op == NAN_KEY_OP_SET_KEY && !key->key_data))
+		return -EINVAL;
+
+	skb = mt76_mcu_msg_alloc(mdev, NULL,
+				 sizeof(struct mt7925_nan_common_hdr) +
+				 sizeof(struct mt7925_nan_key_mgmt_tlv));
+	if (!skb)
+		return -ENOMEM;
+
+	hdr = (struct mt7925_nan_common_hdr *)skb_put(skb, sizeof(*hdr));
+	memset(hdr, 0, sizeof(*hdr));
+
+	ret = mt7925_nan_key_mgmt_tlv(skb, key_op, key_type, wtbl_entry,
+				      local_addr, peer_addr, key);
+	if (ret) {
+		dev_kfree_skb(skb);
+		return ret;
+	}
+
+	return mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
+}
+
 static int mt7925_nan_avail_ctrl_tlv(struct sk_buff *skb,
 				     struct ieee80211_vif *vif)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 6979f0347d77..190de376ef54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -110,6 +110,24 @@ enum nan_disc_event_type {
 	NAN_EVENT_ID_JOINED_CLUSTER		= 2,
 };
 
+enum mt7925_nan_key_operation {
+	NAN_KEY_OP_SET_KEY,
+	NAN_KEY_OP_CLS_KEY,
+};
+
+enum mt7925_nan_key_type {
+	NAN_KEY_TYPE_NMI_CXT_MGMT_KEY,	/* NM-TK: NAN Management pairwise key */
+	NAN_KEY_TYPE_ND_TK,		/* ND-TK: NAN Data pairwise key */
+	NAN_KEY_TYPE_MC_TX_KEY,		/* TX GTK (multicast data) */
+	NAN_KEY_TYPE_MC_RX_KEY,		/* RX GTK (multicast data) */
+	NAN_KEY_TYPE_MC_MGMT_TX_KEY,	/* TX IGTK/BIGTK (multicast mgmt) */
+	NAN_KEY_TYPE_MC_MGMT_RX_KEY,	/* RX IGTK/BIGTK (multicast mgmt) */
+	NAN_KEY_TYPE_NUM,
+};
+
+#define WTBL_RESERVED_ENTRY	0xFFFF
+#define NAN_PACKET_NUMBER_LEN	6
+
 /* bit indices into mt792x_dev->nan_deferred_pending, set from the atomic
  * MCU-event RX path and consumed by mt7925_nan_deferred_work()
  */
@@ -479,6 +497,35 @@ struct mt7925_nan_update_phy_setting_tlv {
 	struct mt7925_nan_phy_setting phy_5g;
 } __packed __aligned(4);
 
+struct mt7925_nan_key_mgmt_tlv {
+	__le16 tag;
+	__le16 len;
+
+	u8 op;			/* enum mt7925_nan_key_operation */
+	u8 key_type;		/* enum mt7925_nan_key_type */
+	__le16 wtbl_idx;
+	u8 init;
+	u8 key_exist;
+	u8 is_nmi_tk;
+	u8 reserved0;
+
+	u8 local_addr[ETH_ALEN];
+	u8 peer_addr[ETH_ALEN];
+
+	union {
+		u8 nmi_key_idx;
+		u8 ndi_idx;
+		u8 mc_rx_idx;
+	};
+	u8 algorithm_id;
+	u8 key_id;
+	u8 key_len;
+
+	u8 key_rsc[NAN_PACKET_NUMBER_LEN];
+	u8 reserved1[2];
+	u8 key_material[32];
+} __packed __aligned(4);
+
 /* NAN Low Power Control Command */
 struct mt7925_nan_lowpower_ctrl_tlv {
 	__le16 tag;
@@ -514,6 +561,31 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb);
 
 int mt7925_nan_send_lowpower_ctrl_cmd(struct mt792x_dev *dev, bool enable);
 
+/**
+ * struct mt7925_nan_key_info - key material for mt7925_nan_manage_key_cmd
+ * @algo_id:  firmware cipher algorithm ID (from mt7925_mcu_get_cipher())
+ * @key_id:   key index (1-2 for GTK, 4-7 for IGTK/BIGTK)
+ * @key_len:  key material length in bytes (16 or 32)
+ * @key_data: key bytes; must be non-NULL for SET_KEY operations
+ * @pn:       6-byte packet number / RSC; only used for MC_MGMT_RX_KEY,
+ *            pass NULL for all other key types
+ */
+struct mt7925_nan_key_info {
+	u8 algo_id;
+	u8 key_id;
+	u8 key_len;
+	const u8 *key_data;
+	const u8 *pn;
+};
+
+int mt7925_nan_manage_key_cmd(struct mt792x_dev *dev,
+			      enum mt7925_nan_key_operation key_op,
+			      enum mt7925_nan_key_type key_type,
+			      u16 wtbl_entry,
+			      const u8 *local_addr,
+			      const u8 *peer_addr,
+			      const struct mt7925_nan_key_info *key);
+
 void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 				    struct ieee80211_vif *vif);
 
-- 
2.43.0


