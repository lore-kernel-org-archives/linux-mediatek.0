Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BA7C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:24:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B9752070C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qObcZUxc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="puIWPOSo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B9752070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1Hdj19g6gTD71katbeiRfL6MCuAh+A6AVSQYntBvKQ=; b=qObcZUxcZm1H7G
	pc7tmTC7xS4qxyypAw1cZTe0+i9+zojNsD037RNGPYJYKWg+g1XDJe2WBXxlhleezLzaAb22kzdcx
	/EbDZj9AuHJmgMySAeH9uGcgOFuHTh7jL0VRpk+Y6bi4eQqjDl+CRVUL61hyylfzuiuIZoHqVSNku
	vQT2m/J12Tdu0zw0EiBFeaNR4B0QcjKxLoEaYg29f828jP959WtahE5qexpD2/9S2o7/pPJWMbpuB
	g4VbzrViOvhoBdkQpKiudOhp/i9Iyll1/3JwvPKAswqLOdlIQ1l6IHDOrVDz8LiY6qWfPMMIq0O+1
	rzqYWSFCWtBH4UVTarpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ituRi-0000NX-Jp; Tue, 21 Jan 2020 14:23:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ituRe-0000LP-V5
 for linux-mediatek@lists.infradead.org; Tue, 21 Jan 2020 14:23:57 +0000
X-UUID: 4441dbfdabde41aead3f5b29b0f845c2-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YIYgAeTsC2Ry43GhcJA+l8CP1UHKRxcsWstLgZaTaPY=; 
 b=puIWPOSoJMVECZz4cHHlI8xI09LwGei3cAmqK398LruP12MbV2zPcQW3dlqeX6DQhFHg7XWH4tksg8mHeZQ3fY9voNTqro4ZaY2H3dz6o1Br+teBN6qzuE3GEWHbfC58hQJksLNu3tuHqyM+kx34fQmHuEITDrHtGMAweDAhmOk=;
X-UUID: 4441dbfdabde41aead3f5b29b0f845c2-20200121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2069862671; Tue, 21 Jan 2020 06:23:52 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 06:13:49 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 22:13:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 21 Jan 2020 22:13:28 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/7] mt76: mt7615: simplify mcu_set_sta flow
Date: Tue, 21 Jan 2020 22:13:37 +0800
Message-ID: <5c0838e11b50864c3a3456159f35b657c299f781.1579237414.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
References: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_062355_021074_ABAECD20 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move mcu_add_wtbl and mcu_set_ht_cap into mcu_set_sta to simplify flow.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  |   9 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 326 ++++++++----------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |   9 +-
 3 files changed, 153 insertions(+), 191 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index dbf6200525c4..ca8c4f6fc2de 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -466,10 +466,7 @@ int mt7615_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt7615_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	mt7615_mcu_add_wtbl(dev, vif, sta);
-	mt7615_mcu_set_sta_rec(dev, vif, sta, 1);
-	if (sta->ht_cap.ht_supported)
-		mt7615_mcu_set_ht_cap(dev, vif, sta);
+	mt7615_mcu_set_sta(dev, vif, sta, 1);
 
 	return 0;
 }
@@ -480,9 +477,7 @@ void mt7615_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
 	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
 
-	mt7615_mcu_set_sta_rec(dev, vif, sta, 0);
-	mt7615_mcu_del_wtbl(dev, sta);
-
+	mt7615_mcu_set_sta(dev, vif, sta, 0);
 	mt7615_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 73a5bf11e902..30ff08bc9afc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -978,55 +978,6 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
 	return ret;
 }
 
-int mt7615_mcu_add_wtbl(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-			struct ieee80211_sta *sta)
-{
-	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
-	struct {
-		struct wtbl_req_hdr hdr;
-		struct wtbl_generic g_wtbl;
-		struct wtbl_rx rx_wtbl;
-	} req = {
-		.hdr = {
-			.wlan_idx = msta->wcid.idx,
-			.operation = WTBL_RESET_AND_SET,
-			.tlv_num = cpu_to_le16(2),
-		},
-		.g_wtbl = {
-			.tag = cpu_to_le16(WTBL_GENERIC),
-			.len = cpu_to_le16(sizeof(struct wtbl_generic)),
-			.muar_idx = mvif->omac_idx,
-			.qos = sta->wme,
-			.partial_aid = cpu_to_le16(sta->aid),
-		},
-		.rx_wtbl = {
-			.tag = cpu_to_le16(WTBL_RX),
-			.len = cpu_to_le16(sizeof(struct wtbl_rx)),
-			.rca1 = vif->type != NL80211_IFTYPE_AP,
-			.rca2 = 1,
-			.rv = 1,
-		},
-	};
-	memcpy(req.g_wtbl.peer_addr, sta->addr, ETH_ALEN);
-
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-				   &req, sizeof(req), true);
-}
-
-int mt7615_mcu_del_wtbl(struct mt7615_dev *dev,
-			struct ieee80211_sta *sta)
-{
-	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
-	struct wtbl_req_hdr req = {
-		.wlan_idx = msta->wcid.idx,
-		.operation = WTBL_RESET_AND_SET,
-	};
-
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-				   &req, sizeof(req), true);
-}
-
 int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev)
 {
 	struct wtbl_req_hdr req = {
@@ -1111,8 +1062,8 @@ int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
 				   &req, (u8 *)wtbl_hdr - (u8 *)&req, true);
 }
 
-int mt7615_mcu_set_sta_rec(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-			   struct ieee80211_sta *sta, bool en)
+int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta, bool en)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
@@ -1120,7 +1071,8 @@ int mt7615_mcu_set_sta_rec(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 	struct {
 		struct sta_req_hdr hdr;
 		struct sta_rec_basic basic;
-	} req = {
+		u8 buf[MT7615_WTBL_UPDATE_MAX_SIZE];
+	} __packed req = {
 		.hdr = {
 			.bss_idx = mvif->idx,
 			.wlan_idx = msta->wcid.idx,
@@ -1135,6 +1087,12 @@ int mt7615_mcu_set_sta_rec(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			.aid = cpu_to_le16(sta->aid),
 		},
 	};
+	struct wtbl_req_hdr *wtbl_hdr;
+	struct wtbl_generic *wtbl_g;
+	struct wtbl_rx *wtbl_rx;
+	u8 *buf = req.buf;
+	u8 wtlv = 0, stlv = 1;
+
 	memcpy(req.basic.peer_addr, sta->addr, ETH_ALEN);
 
 	switch (vif->type) {
@@ -1160,10 +1118,148 @@ int mt7615_mcu_set_sta_rec(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 	} else {
 		req.basic.conn_state = CONN_STATE_DISCONNECT;
 		req.basic.extra_info = cpu_to_le16(EXTRA_INFO_VER);
+
+		/* wtbl reset */
+		wtbl_hdr = (struct wtbl_req_hdr *)buf;
+		buf += sizeof(*wtbl_hdr);
+		wtbl_hdr->wlan_idx = msta->wcid.idx;
+		wtbl_hdr->operation = WTBL_RESET_AND_SET;
+
+		__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
+				    &req, req.buf - (u8 *)&req, true);
+
+		return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
+					   req.buf, buf - req.buf, true);
 	}
 
+	/* sta_rec ht */
+	if (sta->ht_cap.ht_supported) {
+		struct sta_rec_ht *sta_ht;
+
+		sta_ht = (struct sta_rec_ht *)buf;
+		buf += sizeof(*sta_ht);
+		sta_ht->tag = cpu_to_le16(STA_REC_HT);
+		sta_ht->len = cpu_to_le16(sizeof(*sta_ht));
+		sta_ht->ht_cap = cpu_to_le16(sta->ht_cap.cap);
+		stlv++;
+
+		/* sta_rec vht */
+		if (sta->vht_cap.vht_supported) {
+			struct sta_rec_vht *sta_vht;
+
+			sta_vht = (struct sta_rec_vht *)buf;
+			buf += sizeof(*sta_vht);
+			sta_vht->tag = cpu_to_le16(STA_REC_VHT);
+			sta_vht->len = cpu_to_le16(sizeof(*sta_vht));
+			sta_vht->vht_cap = cpu_to_le32(sta->vht_cap.cap);
+			sta_vht->vht_rx_mcs_map =
+				sta->vht_cap.vht_mcs.rx_mcs_map;
+			sta_vht->vht_tx_mcs_map =
+				sta->vht_cap.vht_mcs.tx_mcs_map;
+			stlv++;
+		}
+	}
+
+	/* wtbl */
+	wtbl_hdr = (struct wtbl_req_hdr *)buf;
+	buf += sizeof(*wtbl_hdr);
+	wtbl_hdr->wlan_idx = msta->wcid.idx;
+	wtbl_hdr->operation = WTBL_RESET_AND_SET;
+
+	wtbl_g = (struct wtbl_generic *)buf;
+	buf += sizeof(*wtbl_g);
+	wtbl_g->tag = cpu_to_le16(WTBL_GENERIC);
+	wtbl_g->len = cpu_to_le16(sizeof(*wtbl_g));
+	wtbl_g->muar_idx = mvif->omac_idx;
+	wtbl_g->qos = sta->wme;
+	wtbl_g->partial_aid = cpu_to_le16(sta->aid);
+	memcpy(wtbl_g->peer_addr, sta->addr, ETH_ALEN);
+	wtlv++;
+
+	wtbl_rx = (struct wtbl_rx *)buf;
+	buf += sizeof(*wtbl_rx);
+	wtbl_rx->tag = cpu_to_le16(WTBL_RX);
+	wtbl_rx->len = cpu_to_le16(sizeof(*wtbl_rx));
+	wtbl_rx->rv = 1;
+	wtbl_rx->rca1 = vif->type != NL80211_IFTYPE_AP;
+	wtbl_rx->rca2 = 1;
+	wtlv++;
+
+	/* wtbl ht */
+	if (sta->ht_cap.ht_supported) {
+		struct wtbl_ht *wtbl_ht;
+		struct wtbl_raw *wtbl_raw;
+		u32 val = 0, msk;
+
+		wtbl_ht = (struct wtbl_ht *)buf;
+		buf += sizeof(*wtbl_ht);
+		wtbl_ht->tag = cpu_to_le16(WTBL_HT);
+		wtbl_ht->len = cpu_to_le16(sizeof(*wtbl_ht));
+		wtbl_ht->ht = 1;
+		wtbl_ht->ldpc = sta->ht_cap.cap & IEEE80211_HT_CAP_LDPC_CODING;
+		wtbl_ht->af = sta->ht_cap.ampdu_factor;
+		wtbl_ht->mm = sta->ht_cap.ampdu_density;
+		wtlv++;
+
+		/* wtbl vht */
+		if (sta->vht_cap.vht_supported) {
+			struct wtbl_vht *wtbl_vht;
+
+			wtbl_vht = (struct wtbl_vht *)buf;
+			buf += sizeof(*wtbl_vht);
+			wtbl_vht->tag = cpu_to_le16(WTBL_VHT);
+			wtbl_vht->len = cpu_to_le16(sizeof(*wtbl_vht));
+			wtbl_vht->vht = 1;
+			wtbl_vht->ldpc = sta->vht_cap.cap &
+					 IEEE80211_VHT_CAP_RXLDPC;
+			wtlv++;
+
+			if (sta->vht_cap.cap & IEEE80211_VHT_CAP_SHORT_GI_80)
+				val |= MT_WTBL_W5_SHORT_GI_80;
+			if (sta->vht_cap.cap & IEEE80211_VHT_CAP_SHORT_GI_160)
+				val |= MT_WTBL_W5_SHORT_GI_160;
+		}
+
+		/* wtbl smps */
+		if (sta->smps_mode == IEEE80211_SMPS_DYNAMIC) {
+			struct wtbl_smps *wtbl_smps;
+
+			wtbl_smps = (struct wtbl_smps *)buf;
+			buf += sizeof(*wtbl_smps);
+			wtbl_smps->tag = cpu_to_le16(WTBL_SMPS);
+			wtbl_smps->len = cpu_to_le16(sizeof(*wtbl_smps));
+			wtbl_smps->smps = 1;
+			wtlv++;
+		}
+
+		/* sgi */
+		msk = MT_WTBL_W5_SHORT_GI_20 | MT_WTBL_W5_SHORT_GI_40 |
+			MT_WTBL_W5_SHORT_GI_80 | MT_WTBL_W5_SHORT_GI_160;
+
+		if (sta->ht_cap.cap & IEEE80211_HT_CAP_SGI_20)
+			val |= MT_WTBL_W5_SHORT_GI_20;
+		if (sta->ht_cap.cap & IEEE80211_HT_CAP_SGI_40)
+			val |= MT_WTBL_W5_SHORT_GI_40;
+
+		wtbl_raw = (struct wtbl_raw *)buf;
+		buf += sizeof(*wtbl_raw);
+		wtbl_raw->tag = cpu_to_le16(WTBL_RAW_DATA);
+		wtbl_raw->len = cpu_to_le16(sizeof(*wtbl_raw));
+		wtbl_raw->wtbl_idx = 1;
+		wtbl_raw->dw = 5;
+		wtbl_raw->msk = cpu_to_le32(~msk);
+		wtbl_raw->val = cpu_to_le32(val);
+		wtlv++;
+	}
+
+	wtbl_hdr->tlv_num = cpu_to_le16(wtlv);
+	req.hdr.tlv_num = cpu_to_le16(stlv);
+
+	__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE, (u8 *)wtbl_hdr,
+			    buf - (u8 *)wtbl_hdr, true);
+
 	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
-				   &req, sizeof(req), true);
+				   &req, (u8 *)wtbl_hdr - (u8 *)&req, true);
 }
 
 int mt7615_mcu_set_bcn(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
@@ -1432,130 +1528,6 @@ int mt7615_mcu_set_channel(struct mt7615_phy *phy)
 				   &req, sizeof(req), true);
 }
 
-int mt7615_mcu_set_ht_cap(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-			  struct ieee80211_sta *sta)
-{
-	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
-	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-	struct wtbl_req_hdr *wtbl_hdr;
-	struct sta_req_hdr *sta_hdr;
-	struct wtbl_raw *wtbl_raw;
-	struct sta_rec_ht *sta_ht;
-	struct wtbl_ht *wtbl_ht;
-	int buf_len, ret, ntlv = 2;
-	u32 msk, val = 0;
-	u8 *buf;
-
-	buf = kzalloc(MT7615_WTBL_UPDATE_MAX_SIZE, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	wtbl_hdr = (struct wtbl_req_hdr *)buf;
-	wtbl_hdr->wlan_idx = msta->wcid.idx;
-	wtbl_hdr->operation = WTBL_SET;
-	buf_len = sizeof(*wtbl_hdr);
-
-	/* ht basic */
-	wtbl_ht = (struct wtbl_ht *)(buf + buf_len);
-	wtbl_ht->tag = cpu_to_le16(WTBL_HT);
-	wtbl_ht->len = cpu_to_le16(sizeof(*wtbl_ht));
-	wtbl_ht->ht = 1;
-	wtbl_ht->ldpc = sta->ht_cap.cap & IEEE80211_HT_CAP_LDPC_CODING;
-	wtbl_ht->af = sta->ht_cap.ampdu_factor;
-	wtbl_ht->mm = sta->ht_cap.ampdu_density;
-	buf_len += sizeof(*wtbl_ht);
-
-	if (sta->ht_cap.cap & IEEE80211_HT_CAP_SGI_20)
-		val |= MT_WTBL_W5_SHORT_GI_20;
-	if (sta->ht_cap.cap & IEEE80211_HT_CAP_SGI_40)
-		val |= MT_WTBL_W5_SHORT_GI_40;
-
-	/* vht basic */
-	if (sta->vht_cap.vht_supported) {
-		struct wtbl_vht *wtbl_vht;
-
-		wtbl_vht = (struct wtbl_vht *)(buf + buf_len);
-		buf_len += sizeof(*wtbl_vht);
-		wtbl_vht->tag = cpu_to_le16(WTBL_VHT);
-		wtbl_vht->len = cpu_to_le16(sizeof(*wtbl_vht));
-		wtbl_vht->ldpc = sta->vht_cap.cap & IEEE80211_VHT_CAP_RXLDPC;
-		wtbl_vht->vht = 1;
-		ntlv++;
-
-		if (sta->vht_cap.cap & IEEE80211_VHT_CAP_SHORT_GI_80)
-			val |= MT_WTBL_W5_SHORT_GI_80;
-		if (sta->vht_cap.cap & IEEE80211_VHT_CAP_SHORT_GI_160)
-			val |= MT_WTBL_W5_SHORT_GI_160;
-	}
-
-	/* smps */
-	if (sta->smps_mode == IEEE80211_SMPS_DYNAMIC) {
-		struct wtbl_smps *wtbl_smps;
-
-		wtbl_smps = (struct wtbl_smps *)(buf + buf_len);
-		buf_len += sizeof(*wtbl_smps);
-		wtbl_smps->tag = cpu_to_le16(WTBL_SMPS);
-		wtbl_smps->len = cpu_to_le16(sizeof(*wtbl_smps));
-		wtbl_smps->smps = 1;
-		ntlv++;
-	}
-
-	/* sgi */
-	msk = MT_WTBL_W5_SHORT_GI_20 | MT_WTBL_W5_SHORT_GI_40 |
-	      MT_WTBL_W5_SHORT_GI_80 | MT_WTBL_W5_SHORT_GI_160;
-
-	wtbl_raw = (struct wtbl_raw *)(buf + buf_len);
-	buf_len += sizeof(*wtbl_raw);
-	wtbl_raw->tag = cpu_to_le16(WTBL_RAW_DATA);
-	wtbl_raw->len = cpu_to_le16(sizeof(*wtbl_raw));
-	wtbl_raw->wtbl_idx = 1;
-	wtbl_raw->dw = 5;
-	wtbl_raw->msk = cpu_to_le32(~msk);
-	wtbl_raw->val = cpu_to_le32(val);
-
-	wtbl_hdr->tlv_num = cpu_to_le16(ntlv);
-	ret = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-				  buf, buf_len, true);
-	if (ret)
-		goto out;
-
-	memset(buf, 0, MT7615_WTBL_UPDATE_MAX_SIZE);
-
-	sta_hdr = (struct sta_req_hdr *)buf;
-	sta_hdr->bss_idx = mvif->idx;
-	sta_hdr->wlan_idx = msta->wcid.idx;
-	sta_hdr->is_tlv_append = 1;
-	ntlv = sta->vht_cap.vht_supported ? 2 : 1;
-	sta_hdr->tlv_num = cpu_to_le16(ntlv);
-	sta_hdr->muar_idx = mvif->omac_idx;
-	buf_len = sizeof(*sta_hdr);
-
-	sta_ht = (struct sta_rec_ht *)(buf + buf_len);
-	sta_ht->tag = cpu_to_le16(STA_REC_HT);
-	sta_ht->len = cpu_to_le16(sizeof(*sta_ht));
-	sta_ht->ht_cap = cpu_to_le16(sta->ht_cap.cap);
-	buf_len += sizeof(*sta_ht);
-
-	if (sta->vht_cap.vht_supported) {
-		struct sta_rec_vht *sta_vht;
-
-		sta_vht = (struct sta_rec_vht *)(buf + buf_len);
-		buf_len += sizeof(*sta_vht);
-		sta_vht->tag = cpu_to_le16(STA_REC_VHT);
-		sta_vht->len = cpu_to_le16(sizeof(*sta_vht));
-		sta_vht->vht_cap = cpu_to_le32(sta->vht_cap.cap);
-		sta_vht->vht_rx_mcs_map = sta->vht_cap.vht_mcs.rx_mcs_map;
-		sta_vht->vht_tx_mcs_map = sta->vht_cap.vht_mcs.tx_mcs_map;
-	}
-
-	ret = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
-				  buf, buf_len, true);
-out:
-	kfree(buf);
-
-	return ret;
-}
-
 int mt7615_mcu_set_tx_ba(struct mt7615_dev *dev,
 			 struct ieee80211_ampdu_params *params,
 			 bool add)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 84949256601f..9bd926d6963f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -241,14 +241,11 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 			  struct ieee80211_tx_rate *probe_rate,
 			  struct ieee80211_tx_rate *rates);
-int mt7615_mcu_add_wtbl(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-			struct ieee80211_sta *sta);
-int mt7615_mcu_del_wtbl(struct mt7615_dev *dev, struct ieee80211_sta *sta);
 int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev);
 int mt7615_mcu_set_bmc(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 		       bool en);
-int mt7615_mcu_set_sta_rec(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-			   struct ieee80211_sta *sta, bool en);
+int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta, bool en);
 int mt7615_mcu_set_bcn(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		       int en);
 int mt7615_mcu_set_channel(struct mt7615_phy *phy);
@@ -260,8 +257,6 @@ int mt7615_mcu_set_tx_ba(struct mt7615_dev *dev,
 int mt7615_mcu_set_rx_ba(struct mt7615_dev *dev,
 			 struct ieee80211_ampdu_params *params,
 			 bool add);
-int mt7615_mcu_set_ht_cap(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-			  struct ieee80211_sta *sta);
 void mt7615_mcu_rx_event(struct mt7615_dev *dev, struct sk_buff *skb);
 int mt7615_mcu_rdd_cmd(struct mt7615_dev *dev,
 		       enum mt7615_rdd_cmd cmd, u8 index,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
