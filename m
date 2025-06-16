Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A97C71135
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jun 2025 06:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wi4kfeydm6LjlXnqhgFk6S0wXYIGS71UkUdZ20kTVvY=; b=CSokgwS/ep2cHCF0bwhqp/UfBB
	ZSq9jJTK13pFvDrHbuh6rWEer2M+LQjhGbNfBAC8itR3g+/5c1DtGu5T3n0zUUbcQwIdb5yrBJpbC
	CYOdT21X75vXhDU5HcZ4gH1ZbWlRsdEw6AArnjsyc+Gc4xONU/wERGDGbL7E4PqKHrO1xVds7ogg8
	vrxd9rPyPiyceHCtmFoGq6KIpBIrhz2EIYYu4SMvOSB90rDgJRYFwbh2lHYfSgSunRQ6mCNgb4SM5
	ZRkUoX6WSCF6tGNzDzUDGW6sZCi5VpEN/pdLNMhE+bSbA9cLDB3XnP1uxYh2TZzbUGiJKtxXnyAjr
	R6NC3R3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3Ul-00000003Wrm-29UJ;
	Mon, 16 Jun 2025 06:39:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3Sn-00000003WeX-1INS
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Jun 2025 06:37:02 +0000
X-UUID: 4aa3f6e44a7c11f09f706fa2197c6ceb-20250615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wi4kfeydm6LjlXnqhgFk6S0wXYIGS71UkUdZ20kTVvY=;
	b=O/ugijWVoHMMiEuiDbeEw1hLqXobOrCKZRhtdPYVmES46g+2f2cR6pVG/xW7jGn7EmAPhHkh52JfYtfFEezJxi4jmnmczEfu8b+BB3kVS8F2uWBMiKKTGDAjbep9i4/acAA9urLP6HfSLd1e2yCTef8GPHxlHEQ2Yg3vk2Vcwsc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:878c362e-8df0-41a8-95bc-93f95d2d73b9,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:09905cf,CLOUDID:2ad1b903-0d95-4f6b-a95f-3c560ebcf3ab,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4aa3f6e44a7c11f09f706fa2197c6ceb-20250615
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1154201685; Sun, 15 Jun 2025 23:36:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 16 Jun 2025 14:36:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 16 Jun 2025 14:36:50 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH] wifi: mt76: mt7925: fix incorrect scan probe IE handling for hw_scan
Date: Mon, 16 Jun 2025 14:36:49 +0800
Message-ID: <20250616063649.1100503-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_233701_367298_F3E28B74 
X-CRM114-Status: GOOD (  14.99  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The IEs should be processed and filled into the command tlv separately
according to each band.

Cc: stable@vger.kernel.org
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 75 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  5 +-
 3 files changed, 63 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 555ef302ae97..506387b4ce13 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1540,7 +1540,7 @@ mt7925_start_sched_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	mt792x_mutex_acquire(dev);
 
-	err = mt7925_mcu_sched_scan_req(mphy, vif, req);
+	err = mt7925_mcu_sched_scan_req(mphy, vif, req, ies);
 	if (err < 0)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index ef1d42af96f7..9993d47e643c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -192,6 +192,7 @@ mt7925_connac_mcu_set_wow_ctrl(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			       bool suspend, struct cfg80211_wowlan *wowlan)
 {
 	struct mt76_vif_link *mvif = (struct mt76_vif_link *)vif->drv_priv;
+	struct ieee80211_scan_ies ies = {};
 	struct mt76_dev *dev = phy->dev;
 	struct {
 		struct {
@@ -227,7 +228,7 @@ mt7925_connac_mcu_set_wow_ctrl(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		req.wow_ctrl_tlv.trigger |= (UNI_WOW_DETECT_TYPE_DISCONNECT |
 					     UNI_WOW_DETECT_TYPE_BCN_LOST);
 	if (wowlan->nd_config) {
-		mt7925_mcu_sched_scan_req(phy, vif, wowlan->nd_config);
+		mt7925_mcu_sched_scan_req(phy, vif, wowlan->nd_config, &ies);
 		req.wow_ctrl_tlv.trigger |= UNI_WOW_DETECT_TYPE_SCH_SCAN_HIT;
 		mt7925_mcu_sched_scan_enable(phy, vif, suspend);
 	}
@@ -3085,6 +3086,54 @@ int mt7925_mcu_set_dbdc(struct mt76_phy *phy, bool enable)
 	return err;
 }
 
+static void
+mt7925_mcu_build_scan_ie_tlv(struct mt76_dev *mdev,
+			     struct sk_buff *skb,
+			     struct ieee80211_scan_ies *scan_ies)
+{
+	u32 max_len = sizeof(struct scan_ie_tlv) + MT76_CONNAC_SCAN_IE_LEN;
+	struct scan_ie_tlv *ie;
+	enum nl80211_band i;
+	struct tlv *tlv;
+	const u8 *ies;
+	u16 ies_len;
+
+	for (i = 0; i <= NL80211_BAND_6GHZ; i++) {
+		if (i == NL80211_BAND_60GHZ)
+			continue;
+
+		ies = scan_ies->ies[i];
+		ies_len = scan_ies->len[i];
+
+		if (!ies || !ies_len)
+			continue;
+
+		if (ies_len > max_len)
+			return;
+
+		tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_IE,
+					      sizeof(*ie) + ies_len);
+		ie = (struct scan_ie_tlv *)tlv;
+
+		memcpy(ie->ies, ies, ies_len);
+		ie->ies_len = cpu_to_le16(ies_len);
+
+		switch (i) {
+		case NL80211_BAND_2GHZ:
+			ie->band = 1;
+			break;
+		case NL80211_BAND_6GHZ:
+			ie->band = 3;
+			break;
+		default:
+			ie->band = 2;
+			break;
+		}
+
+		max_len -= (sizeof(*ie) + ies_len);
+	}
+}
+
 int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		       struct ieee80211_scan_request *scan_req)
 {
@@ -3110,7 +3159,8 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 
 	max_len = sizeof(*hdr) + sizeof(*req) + sizeof(*ssid) +
 		  sizeof(*bssid) * MT7925_RNR_SCAN_MAX_BSSIDS +
-		  sizeof(*chan_info) + sizeof(*misc) + sizeof(*ie);
+		  sizeof(*chan_info) + sizeof(*misc) + sizeof(*ie) +
+		  MT76_CONNAC_SCAN_IE_LEN;
 
 	skb = mt76_mcu_msg_alloc(mdev, NULL, max_len);
 	if (!skb)
@@ -3192,13 +3242,6 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	}
 	chan_info->channel_type = sreq->n_channels ? 4 : 0;
 
-	tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_IE, sizeof(*ie));
-	ie = (struct scan_ie_tlv *)tlv;
-	if (sreq->ie_len > 0) {
-		memcpy(ie->ies, sreq->ie, sreq->ie_len);
-		ie->ies_len = cpu_to_le16(sreq->ie_len);
-	}
-
 	req->scan_func |= SCAN_FUNC_SPLIT_SCAN;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_MISC, sizeof(*misc));
@@ -3209,6 +3252,9 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		req->scan_func |= SCAN_FUNC_RANDOM_MAC;
 	}
 
+	/* Append scan probe IEs as the last tlv */
+	mt7925_mcu_build_scan_ie_tlv(mdev, skb, &scan_req->ies);
+
 	err = mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(SCAN_REQ),
 				    true);
 	if (err < 0)
@@ -3220,7 +3266,8 @@ EXPORT_SYMBOL_GPL(mt7925_mcu_hw_scan);
 
 int mt7925_mcu_sched_scan_req(struct mt76_phy *phy,
 			      struct ieee80211_vif *vif,
-			      struct cfg80211_sched_scan_request *sreq)
+			      struct cfg80211_sched_scan_request *sreq,
+			      struct ieee80211_scan_ies *ies)
 {
 	struct mt76_vif_link *mvif = (struct mt76_vif_link *)vif->drv_priv;
 	struct ieee80211_channel **scan_list = sreq->channels;
@@ -3308,12 +3355,8 @@ int mt7925_mcu_sched_scan_req(struct mt76_phy *phy,
 	}
 	chan_info->channel_type = sreq->n_channels ? 4 : 0;
 
-	tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_IE, sizeof(*ie));
-	ie = (struct scan_ie_tlv *)tlv;
-	if (sreq->ie_len > 0) {
-		memcpy(ie->ies, sreq->ie, sreq->ie_len);
-		ie->ies_len = cpu_to_le16(sreq->ie_len);
-	}
+	/* Append scan probe IEs as the last tlv */
+	mt7925_mcu_build_scan_ie_tlv(mdev, skb, ies);
 
 	return mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(SCAN_REQ),
 				     true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 3dddadb7457b..c34b28769782 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -269,7 +269,7 @@ struct scan_ie_tlv {
 	__le16 ies_len;
 	u8 band;
 	u8 pad;
-	u8 ies[MT76_CONNAC_SCAN_IE_LEN];
+	u8 ies[];
 };
 
 struct scan_misc_tlv {
@@ -674,7 +674,8 @@ int mt7925_mcu_cancel_hw_scan(struct mt76_phy *phy,
 			      struct ieee80211_vif *vif);
 int mt7925_mcu_sched_scan_req(struct mt76_phy *phy,
 			      struct ieee80211_vif *vif,
-			      struct cfg80211_sched_scan_request *sreq);
+			      struct cfg80211_sched_scan_request *sreq,
+			      struct ieee80211_scan_ies *ies);
 int mt7925_mcu_sched_scan_enable(struct mt76_phy *phy,
 				 struct ieee80211_vif *vif,
 				 bool enable);
-- 
2.34.1


