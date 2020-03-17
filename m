Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3AEC10F29
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE0C2073E
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q/cgZ/gw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbtII4nX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE0C2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmTrgxDpaDF6i/oOONulx25PRXwJIt97J4RuEiJvGYk=; b=Q/cgZ/gwruHXoQ
	ckuBtH7bBVYsAHHAb5cOyVlmgyZHZ5P1EvWfuxqNHYCKZV4/idavXEaxfjVpe6b7H4Oz+gQufQvmJ
	KIcZFDiiRzqvq7/maInsuLmrKrBcXB8FsnFLVQ1pimDajKgqtN9AUDalcPeZ64BPqXGVYCyfaIjsD
	HWZrl4iULXL/Pq93iUd8cDasM1WZX/HvHdsWqkSsY90XYAfk3Q8QvQA9FY4IgMZ1s33B0l/QyA2id
	XpGHRp77ggNbZWBp7c+uqiODAc2/U1x6oj8hr6jSuEdbTHInN98tmmyO5RkSgkWH/NqmMU+Wc7Wcj
	VDQEeX3ayoVuLx+yNE7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFIG-0006oS-77; Tue, 17 Mar 2020 16:42:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFI9-0006Zc-Si
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:12 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEA7420738;
 Tue, 17 Mar 2020 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463329;
 bh=wz2tEz9xVwD0vUF4k4FtpBRZhzXLHrQ67jBHrLgI83c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lbtII4nX9IQkachDWVHy3aK5T94da79/4BeArAv5Q3Sv0PBFQOWcUfYrGhR2477r7
 w9bmtGuWC64u1Wk3pVK9aDCEJn58sIe2WtjGyYK1h1K13zMJ5NgNC+CDWX+URuwQqx
 3s0WSr/96vI2jn+GnkLC8Bl4kUcmdscDFGRIFAik=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 09/25] mt76: mt7615: move mt7615_mcu_set_sta in
 mt7615_mcu_ops
Date: Tue, 17 Mar 2020 17:41:16 +0100
Message-Id: <c3d2524f23f7a9bcefcb9b7d4924eea7ef438536.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094209_986231_619CE9D2 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move mt7615_mcu_set_sta for fw version 1 and version 2 in mt7615_mcu_ops
data structure. This is a preliminary patch to properly support mt7663e
firmware.
Rework utility routines to rely on skb APIs for msg parsing

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  |   4 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 399 +++++++-----------
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  24 +-
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |   2 -
 4 files changed, 168 insertions(+), 261 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index fcd7717db5c7..6ef1acc6531f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -469,7 +469,7 @@ int mt7615_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt7615_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	mt7615_mcu_set_sta(dev, vif, sta, 1);
+	mt7615_mcu_sta_add(dev, vif, sta, true);
 
 	return 0;
 }
@@ -480,7 +480,7 @@ void mt7615_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
 	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
 
-	mt7615_mcu_set_sta(dev, vif, sta, 0);
+	mt7615_mcu_sta_add(dev, vif, sta, false);
 	mt7615_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index b8c1b5ae9748..2ad8173f95ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -410,7 +410,8 @@ mt7615_mcu_sta_ba_tlv(struct sk_buff *skb,
 }
 
 static void
-mt7615_mcu_sta_basic_tlv(struct sk_buff *skb, bool enable)
+mt7615_mcu_sta_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
+			 struct ieee80211_sta *sta, bool enable)
 {
 	struct sta_rec_basic *basic;
 	struct tlv *tlv;
@@ -418,16 +419,63 @@ mt7615_mcu_sta_basic_tlv(struct sk_buff *skb, bool enable)
 	tlv = mt7615_mcu_add_tlv(skb, STA_REC_BASIC, sizeof(*basic));
 
 	basic = (struct sta_rec_basic *)tlv;
-	basic->conn_type = cpu_to_le32(CONNECTION_INFRA_BC);
 	basic->extra_info = cpu_to_le16(EXTRA_INFO_VER);
 
-	eth_broadcast_addr(basic->peer_addr);
 	if (enable) {
 		basic->extra_info |= cpu_to_le16(EXTRA_INFO_NEW);
 		basic->conn_state = CONN_STATE_PORT_SECURE;
 	} else {
 		basic->conn_state = CONN_STATE_DISCONNECT;
 	}
+
+	if (!sta) {
+		basic->conn_type = cpu_to_le32(CONNECTION_INFRA_BC);
+		eth_broadcast_addr(basic->peer_addr);
+		return;
+	}
+
+	switch (vif->type) {
+	case NL80211_IFTYPE_MESH_POINT:
+	case NL80211_IFTYPE_AP:
+		basic->conn_type = cpu_to_le32(CONNECTION_INFRA_STA);
+		break;
+	case NL80211_IFTYPE_STATION:
+		basic->conn_type = cpu_to_le32(CONNECTION_INFRA_AP);
+		break;
+	case NL80211_IFTYPE_ADHOC:
+		basic->conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
+		break;
+	default:
+		WARN_ON(1);
+		break;
+	}
+
+	memcpy(basic->peer_addr, sta->addr, ETH_ALEN);
+	basic->aid = cpu_to_le16(sta->aid);
+	basic->qos = sta->wme;
+}
+
+static void
+mt7615_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+{
+	struct tlv *tlv;
+
+	if (sta->ht_cap.ht_supported) {
+		struct sta_rec_ht *ht;
+
+		tlv = mt7615_mcu_add_tlv(skb, STA_REC_HT, sizeof(*ht));
+		ht = (struct sta_rec_ht *)tlv;
+		ht->ht_cap = cpu_to_le16(sta->ht_cap.cap);
+	}
+	if (sta->vht_cap.vht_supported) {
+		struct sta_rec_vht *vht;
+
+		tlv = mt7615_mcu_add_tlv(skb, STA_REC_VHT, sizeof(*vht));
+		vht = (struct sta_rec_vht *)tlv;
+		vht->vht_rx_mcs_map = sta->vht_cap.vht_mcs.rx_mcs_map;
+		vht->vht_tx_mcs_map = sta->vht_cap.vht_mcs.tx_mcs_map;
+		vht->vht_cap = cpu_to_le32(sta->vht_cap.cap);
+	}
 }
 
 static void
@@ -471,9 +519,11 @@ mt7615_mcu_wtbl_ba_tlv(struct sk_buff *skb,
 }
 
 static void
-mt7615_mcu_wtbl_generic_tlv(struct sk_buff *skb, void *sta_wtbl,
+mt7615_mcu_wtbl_generic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
+			    struct ieee80211_sta *sta, void *sta_wtbl,
 			    void *wtbl_tlv)
 {
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct wtbl_generic *generic;
 	struct wtbl_rx *rx;
 	struct tlv *tlv;
@@ -482,18 +532,92 @@ mt7615_mcu_wtbl_generic_tlv(struct sk_buff *skb, void *sta_wtbl,
 					wtbl_tlv, sta_wtbl);
 
 	generic = (struct wtbl_generic *)tlv;
-	eth_broadcast_addr(generic->peer_addr);
-	generic->muar_idx = 0xe;
+
+	if (sta) {
+		memcpy(generic->peer_addr, sta->addr, ETH_ALEN);
+		generic->partial_aid = cpu_to_le16(sta->aid);
+		generic->muar_idx = mvif->omac_idx;
+		generic->qos = sta->wme;
+	} else {
+		eth_broadcast_addr(generic->peer_addr);
+		generic->muar_idx = 0xe;
+	}
 
 	tlv = mt7615_mcu_add_nested_tlv(skb, WTBL_RX, sizeof(*rx),
 					wtbl_tlv, sta_wtbl);
 
 	rx = (struct wtbl_rx *)tlv;
-	rx->rca1 = 1;
+	rx->rca1 = sta ? vif->type != NL80211_IFTYPE_AP : 1;
 	rx->rca2 = 1;
 	rx->rv = 1;
 }
 
+static void
+mt7615_mcu_wtbl_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
+		       void *sta_wtbl, void *wtbl_tlv)
+{
+	struct tlv *tlv;
+	u32 flags = 0;
+
+	if (sta->ht_cap.ht_supported) {
+		struct wtbl_ht *ht;
+
+		tlv = mt7615_mcu_add_nested_tlv(skb, WTBL_HT, sizeof(*ht),
+						wtbl_tlv, sta_wtbl);
+		ht = (struct wtbl_ht *)tlv;
+		ht->ldpc = sta->ht_cap.cap & IEEE80211_HT_CAP_LDPC_CODING;
+		ht->af = sta->ht_cap.ampdu_factor;
+		ht->mm = sta->ht_cap.ampdu_density;
+		ht->ht = 1;
+
+		if (sta->ht_cap.cap & IEEE80211_HT_CAP_SGI_20)
+			flags |= MT_WTBL_W5_SHORT_GI_20;
+		if (sta->ht_cap.cap & IEEE80211_HT_CAP_SGI_40)
+			flags |= MT_WTBL_W5_SHORT_GI_40;
+	}
+
+	if (sta->vht_cap.vht_supported) {
+		struct wtbl_vht *vht;
+
+		tlv = mt7615_mcu_add_nested_tlv(skb, WTBL_VHT, sizeof(*vht),
+						wtbl_tlv, sta_wtbl);
+		vht = (struct wtbl_vht *)tlv;
+		vht->ldpc = sta->vht_cap.cap & IEEE80211_VHT_CAP_RXLDPC,
+		vht->vht = 1;
+
+		if (sta->vht_cap.cap & IEEE80211_VHT_CAP_SHORT_GI_80)
+			flags |= MT_WTBL_W5_SHORT_GI_80;
+		if (sta->vht_cap.cap & IEEE80211_VHT_CAP_SHORT_GI_160)
+			flags |= MT_WTBL_W5_SHORT_GI_160;
+	}
+
+	/* wtbl smps */
+	if (sta->smps_mode == IEEE80211_SMPS_DYNAMIC) {
+		struct wtbl_smps *smps;
+
+		tlv = mt7615_mcu_add_nested_tlv(skb, WTBL_SMPS, sizeof(*smps),
+						wtbl_tlv, sta_wtbl);
+		smps = (struct wtbl_smps *)tlv;
+		smps->smps = 1;
+	}
+
+	if (sta->ht_cap.ht_supported) {
+		/* sgi */
+		u32 msk = MT_WTBL_W5_SHORT_GI_20 | MT_WTBL_W5_SHORT_GI_40 |
+			  MT_WTBL_W5_SHORT_GI_80 | MT_WTBL_W5_SHORT_GI_160;
+		struct wtbl_raw *raw;
+
+		tlv = mt7615_mcu_add_nested_tlv(skb, WTBL_RAW_DATA,
+						sizeof(*raw), wtbl_tlv,
+						sta_wtbl);
+		raw = (struct wtbl_raw *)tlv;
+		raw->val = cpu_to_le32(flags);
+		raw->msk = cpu_to_le32(~msk);
+		raw->wtbl_idx = 1;
+		raw->dw = 5;
+	}
+}
+
 static int
 mt7615_mcu_wtbl_tx_ba(struct mt7615_dev *dev,
 		      struct ieee80211_ampdu_params *params,
@@ -564,24 +688,31 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta, bool enable)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-	struct mt7615_sta *msta = &mvif->sta;
 	struct sk_buff *skb, *sskb, *wskb = NULL;
 	struct wtbl_req_hdr *wtbl_hdr;
+	struct mt7615_sta *msta;
 	int cmd, err;
 
+	msta = sta ? (struct mt7615_sta *)sta->drv_priv : &mvif->sta;
+
 	sskb = mt7615_mcu_alloc_sta_req(mvif, msta);
 	if (IS_ERR(sskb))
 		return PTR_ERR(sskb);
 
-	mt7615_mcu_sta_basic_tlv(sskb, enable);
+	mt7615_mcu_sta_basic_tlv(sskb, vif, sta, enable);
+	if (enable && sta)
+		mt7615_mcu_sta_ht_tlv(sskb, sta);
 
 	wtbl_hdr = mt7615_mcu_alloc_wtbl_req(msta, WTBL_RESET_AND_SET, NULL,
 					     &wskb);
 	if (IS_ERR(wtbl_hdr))
 		return PTR_ERR(wtbl_hdr);
 
-	if (enable)
-		mt7615_mcu_wtbl_generic_tlv(wskb, NULL, wtbl_hdr);
+	if (enable) {
+		mt7615_mcu_wtbl_generic_tlv(wskb, vif, sta, NULL, wtbl_hdr);
+		if (sta)
+			mt7615_mcu_wtbl_ht_tlv(wskb, sta, NULL, wtbl_hdr);
+	}
 
 	cmd = enable ? MCU_EXT_CMD_WTBL_UPDATE : MCU_EXT_CMD_STA_REC_UPDATE;
 	skb = enable ? wskb : sskb;
@@ -649,23 +780,31 @@ mt7615_mcu_add_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 		   struct ieee80211_sta *sta, bool enable)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-	struct mt7615_sta *msta = &mvif->sta;
 	struct wtbl_req_hdr *wtbl_hdr;
+	struct mt7615_sta *msta;
 	struct tlv *sta_wtbl;
 	struct sk_buff *skb;
 
+	msta = sta ? (struct mt7615_sta *)sta->drv_priv : &mvif->sta;
+
 	skb = mt7615_mcu_alloc_sta_req(mvif, msta);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	mt7615_mcu_sta_basic_tlv(skb, enable);
+	mt7615_mcu_sta_basic_tlv(skb, vif, sta, enable);
+	if (enable && sta)
+		mt7615_mcu_sta_ht_tlv(skb, sta);
+
 	sta_wtbl = mt7615_mcu_add_tlv(skb, STA_REC_WTBL,
 				      sizeof(struct sta_rec_wtbl));
 
 	wtbl_hdr = mt7615_mcu_alloc_wtbl_req(msta, WTBL_RESET_AND_SET,
 					     sta_wtbl, &skb);
-	if (enable)
-		mt7615_mcu_wtbl_generic_tlv(skb, sta_wtbl, wtbl_hdr);
+	if (enable) {
+		mt7615_mcu_wtbl_generic_tlv(skb, vif, sta, sta_wtbl, wtbl_hdr);
+		if (sta)
+			mt7615_mcu_wtbl_ht_tlv(skb, sta, sta_wtbl, wtbl_hdr);
+	}
 
 	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				       MCU_EXT_CMD_STA_REC_UPDATE, true);
@@ -1514,236 +1653,6 @@ int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev)
 				   &req, sizeof(req), true);
 }
 
-static int
-mt7615_mcu_send_sta_rec(struct mt7615_dev *dev, u8 *req, u8 *wreq,
-			u8 wlen, bool enable)
-{
-	bool is_v1 = (dev->fw_ver == MT7615_FIRMWARE_V1);
-	u32 slen = is_v1 ? wreq - req : wreq - req + wlen;
-	int ret;
-
-	if (is_v1 && !enable) {
-		ret = __mt76_mcu_send_msg(&dev->mt76,
-					  MCU_EXT_CMD_STA_REC_UPDATE,
-					  req, slen, true);
-		if (ret)
-			return ret;
-
-		return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-					   wreq, wlen, true);
-	}
-
-	if (is_v1) {
-		ret = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-					  wreq, wlen, true);
-		if (ret)
-			return ret;
-	}
-
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
-				   req, slen, true);
-}
-
-int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-		       struct ieee80211_sta *sta, bool en)
-{
-	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
-
-	struct {
-		struct sta_req_hdr hdr;
-		struct sta_rec_basic basic;
-		u8 buf[MT7615_WTBL_UPDATE_MAX_SIZE];
-	} __packed req = {
-		.hdr = {
-			.bss_idx = mvif->idx,
-			.wlan_idx = msta->wcid.idx,
-			.is_tlv_append = 1,
-			.muar_idx = mvif->omac_idx,
-		},
-		.basic = {
-			.tag = cpu_to_le16(STA_REC_BASIC),
-			.len = cpu_to_le16(sizeof(struct sta_rec_basic)),
-			.qos = sta->wme,
-			.aid = cpu_to_le16(sta->aid),
-		},
-	};
-	struct sta_rec_wtbl *wtbl = NULL;
-	struct wtbl_req_hdr *wtbl_hdr;
-	struct wtbl_generic *wtbl_g;
-	struct wtbl_rx *wtbl_rx;
-	u8 *buf = req.buf;
-	u8 wtlv = 0, stlv = 1;
-
-	memcpy(req.basic.peer_addr, sta->addr, ETH_ALEN);
-
-	switch (vif->type) {
-	case NL80211_IFTYPE_AP:
-	case NL80211_IFTYPE_MESH_POINT:
-		req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_STA);
-		break;
-	case NL80211_IFTYPE_STATION:
-		req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_AP);
-		break;
-	case NL80211_IFTYPE_ADHOC:
-		req.basic.conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
-		break;
-	default:
-		WARN_ON(1);
-		break;
-	}
-
-	if (en) {
-		req.basic.conn_state = CONN_STATE_PORT_SECURE;
-		req.basic.extra_info = cpu_to_le16(EXTRA_INFO_VER |
-						   EXTRA_INFO_NEW);
-
-		/* sta_rec ht */
-		if (sta->ht_cap.ht_supported) {
-			struct sta_rec_ht *sta_ht;
-
-			sta_ht = (struct sta_rec_ht *)buf;
-			buf += sizeof(*sta_ht);
-			sta_ht->tag = cpu_to_le16(STA_REC_HT);
-			sta_ht->len = cpu_to_le16(sizeof(*sta_ht));
-			sta_ht->ht_cap = cpu_to_le16(sta->ht_cap.cap);
-			stlv++;
-
-			/* sta_rec vht */
-			if (sta->vht_cap.vht_supported) {
-				struct sta_rec_vht *sta_vht;
-
-				sta_vht = (struct sta_rec_vht *)buf;
-				buf += sizeof(*sta_vht);
-				sta_vht->tag = cpu_to_le16(STA_REC_VHT);
-				sta_vht->len = cpu_to_le16(sizeof(*sta_vht));
-				sta_vht->vht_cap =
-					cpu_to_le32(sta->vht_cap.cap);
-				sta_vht->vht_rx_mcs_map =
-					sta->vht_cap.vht_mcs.rx_mcs_map;
-				sta_vht->vht_tx_mcs_map =
-					sta->vht_cap.vht_mcs.tx_mcs_map;
-				stlv++;
-			}
-		}
-	} else {
-		req.basic.conn_state = CONN_STATE_DISCONNECT;
-		req.basic.extra_info = cpu_to_le16(EXTRA_INFO_VER);
-	}
-
-	/* wtbl */
-	if (dev->fw_ver > MT7615_FIRMWARE_V1) {
-		wtbl = (struct sta_rec_wtbl *)buf;
-		wtbl->tag = cpu_to_le16(STA_REC_WTBL);
-		buf += sizeof(*wtbl);
-		stlv++;
-	}
-
-	wtbl_hdr = (struct wtbl_req_hdr *)buf;
-	buf += sizeof(*wtbl_hdr);
-	wtbl_hdr->wlan_idx = msta->wcid.idx;
-	wtbl_hdr->operation = WTBL_RESET_AND_SET;
-
-	if (!en)
-		goto out;
-
-	wtbl_g = (struct wtbl_generic *)buf;
-	buf += sizeof(*wtbl_g);
-	wtbl_g->tag = cpu_to_le16(WTBL_GENERIC);
-	wtbl_g->len = cpu_to_le16(sizeof(*wtbl_g));
-	wtbl_g->muar_idx = mvif->omac_idx;
-	wtbl_g->qos = sta->wme;
-	wtbl_g->partial_aid = cpu_to_le16(sta->aid);
-	memcpy(wtbl_g->peer_addr, sta->addr, ETH_ALEN);
-	wtlv++;
-
-	wtbl_rx = (struct wtbl_rx *)buf;
-	buf += sizeof(*wtbl_rx);
-	wtbl_rx->tag = cpu_to_le16(WTBL_RX);
-	wtbl_rx->len = cpu_to_le16(sizeof(*wtbl_rx));
-	wtbl_rx->rv = 1;
-	wtbl_rx->rca1 = vif->type != NL80211_IFTYPE_AP;
-	wtbl_rx->rca2 = 1;
-	wtlv++;
-
-	/* wtbl ht */
-	if (sta->ht_cap.ht_supported) {
-		struct wtbl_ht *wtbl_ht;
-		struct wtbl_raw *wtbl_raw;
-		u32 val = 0, msk;
-
-		wtbl_ht = (struct wtbl_ht *)buf;
-		buf += sizeof(*wtbl_ht);
-		wtbl_ht->tag = cpu_to_le16(WTBL_HT);
-		wtbl_ht->len = cpu_to_le16(sizeof(*wtbl_ht));
-		wtbl_ht->ht = 1;
-		wtbl_ht->ldpc = sta->ht_cap.cap & IEEE80211_HT_CAP_LDPC_CODING;
-		wtbl_ht->af = sta->ht_cap.ampdu_factor;
-		wtbl_ht->mm = sta->ht_cap.ampdu_density;
-		wtlv++;
-
-		/* wtbl vht */
-		if (sta->vht_cap.vht_supported) {
-			struct wtbl_vht *wtbl_vht;
-
-			wtbl_vht = (struct wtbl_vht *)buf;
-			buf += sizeof(*wtbl_vht);
-			wtbl_vht->tag = cpu_to_le16(WTBL_VHT);
-			wtbl_vht->len = cpu_to_le16(sizeof(*wtbl_vht));
-			wtbl_vht->vht = 1;
-			wtbl_vht->ldpc = sta->vht_cap.cap &
-					 IEEE80211_VHT_CAP_RXLDPC;
-			wtlv++;
-
-			if (sta->vht_cap.cap & IEEE80211_VHT_CAP_SHORT_GI_80)
-				val |= MT_WTBL_W5_SHORT_GI_80;
-			if (sta->vht_cap.cap & IEEE80211_VHT_CAP_SHORT_GI_160)
-				val |= MT_WTBL_W5_SHORT_GI_160;
-		}
-
-		/* wtbl smps */
-		if (sta->smps_mode == IEEE80211_SMPS_DYNAMIC) {
-			struct wtbl_smps *wtbl_smps;
-
-			wtbl_smps = (struct wtbl_smps *)buf;
-			buf += sizeof(*wtbl_smps);
-			wtbl_smps->tag = cpu_to_le16(WTBL_SMPS);
-			wtbl_smps->len = cpu_to_le16(sizeof(*wtbl_smps));
-			wtbl_smps->smps = 1;
-			wtlv++;
-		}
-
-		/* sgi */
-		msk = MT_WTBL_W5_SHORT_GI_20 | MT_WTBL_W5_SHORT_GI_40 |
-			MT_WTBL_W5_SHORT_GI_80 | MT_WTBL_W5_SHORT_GI_160;
-
-		if (sta->ht_cap.cap & IEEE80211_HT_CAP_SGI_20)
-			val |= MT_WTBL_W5_SHORT_GI_20;
-		if (sta->ht_cap.cap & IEEE80211_HT_CAP_SGI_40)
-			val |= MT_WTBL_W5_SHORT_GI_40;
-
-		wtbl_raw = (struct wtbl_raw *)buf;
-		buf += sizeof(*wtbl_raw);
-		wtbl_raw->tag = cpu_to_le16(WTBL_RAW_DATA);
-		wtbl_raw->len = cpu_to_le16(sizeof(*wtbl_raw));
-		wtbl_raw->wtbl_idx = 1;
-		wtbl_raw->dw = 5;
-		wtbl_raw->msk = cpu_to_le32(~msk);
-		wtbl_raw->val = cpu_to_le32(val);
-		wtlv++;
-	}
-
-out:
-	if (wtbl)
-		wtbl->len = cpu_to_le16(buf - (u8 *)wtbl_hdr);
-
-	wtbl_hdr->tlv_num = cpu_to_le16(wtlv);
-	req.hdr.tlv_num = cpu_to_le16(stlv);
-
-	return mt7615_mcu_send_sta_rec(dev, (u8 *)&req, (u8 *)wtbl_hdr,
-				       buf - (u8 *)wtbl_hdr, en);
-}
-
 int mt7615_mcu_set_bcn(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		       int en)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 54491bda3b3a..c84695facf08 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -488,18 +488,18 @@ struct wtbl_raw {
 	__le32 val;
 } __packed;
 
-#define MT7615_WTBL_UPDATE_MAX_SIZE (sizeof(struct wtbl_req_hdr) + \
-				     sizeof(struct wtbl_generic) + \
-				     sizeof(struct wtbl_rx) + \
-				     sizeof(struct wtbl_ht) + \
-				     sizeof(struct wtbl_vht) + \
-				     sizeof(struct wtbl_tx_ps) + \
-				     sizeof(struct wtbl_hdr_trans) + \
-				     sizeof(struct wtbl_ba) + \
-				     sizeof(struct wtbl_bf) + \
-				     sizeof(struct wtbl_smps) + \
-				     sizeof(struct wtbl_pn) + \
-				     sizeof(struct wtbl_spe))
+#define MT7615_WTBL_UPDATE_MAX_SIZE	(sizeof(struct wtbl_req_hdr) +	\
+					 sizeof(struct wtbl_generic) +	\
+					 sizeof(struct wtbl_rx) +	\
+					 sizeof(struct wtbl_ht) +	\
+					 sizeof(struct wtbl_vht) +	\
+					 sizeof(struct wtbl_tx_ps) +	\
+					 sizeof(struct wtbl_hdr_trans) +\
+					 sizeof(struct wtbl_ba) +	\
+					 sizeof(struct wtbl_bf) +	\
+					 sizeof(struct wtbl_smps) +	\
+					 sizeof(struct wtbl_pn) +	\
+					 sizeof(struct wtbl_spe))
 
 #define MT7615_STA_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +	\
 					 sizeof(struct sta_rec_basic) +	\
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 9584aa912b74..ea98c652711f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -309,8 +309,6 @@ void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 			  struct ieee80211_tx_rate *probe_rate,
 			  struct ieee80211_tx_rate *rates);
 int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev);
-int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-		       struct ieee80211_sta *sta, bool en);
 int mt7615_mcu_set_bcn(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		       int en);
 int mt7615_mcu_set_chan_info(struct mt7615_phy *phy, int cmd);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
