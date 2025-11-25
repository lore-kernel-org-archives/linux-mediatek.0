Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC5ECFD379
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 03:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E77bX+io98uqafhNvL5F2E8Wh9J9SYwndVe8zAOppaw=; b=2ADDRXVkpsRqh+T8HArGzKWaLA
	Y0X6NF5hoFoLsqQ8qhBQAgHj9KrsbPsPystL1k9XDq5dswZz5tow6x4dGvdpo5wOtNfnhDPobBxjZ
	zSGFsiNtz/At9tDu38DnPJbEXLDEq5gBJm2z3cbSrILCV1ourVxZM/nAcMf6xfvfrqjZn1Bgio1iq
	sEUz3ZnSZYXk501jzJ6c779pqOBoZuks9HjS9DhYJO+Qes59flso3awV0q7oqMhy4Ycf5D9Hlhds9
	bwF+Rp8uMZ2GmJGfLnYgV//G/BSUrMAxKQ/jnXKiapMoxcaw2ZlC3R01LVYabukT5Vp8b3E0kGSg5
	m2hqfefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNk1d-0000000Chc8-1wg4;
	Tue, 25 Nov 2025 03:47:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNk1a-0000000ChXJ-3YWP
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Nov 2025 03:47:32 +0000
X-UUID: 75b7c2fcc9b111f0a52f393f94899d25-20251124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E77bX+io98uqafhNvL5F2E8Wh9J9SYwndVe8zAOppaw=;
	b=KczoditmuBK0FJVXBQHWgRCMrD0ukBn4UuTuR3DexcCp92HXbeatyt8U5/C4Q/M9NPpUida8AHoE4OB6jvVog4kbYr2y6kLdIjHWNBSb4r5pRt4PbPrOWlZ16QYu1i0P7lBluI/6fHDJw4QmVZDrT3YPofYIIy+w0sTmlgrzFBc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6f25e878-079b-4313-8cca-3ddde3b2541f,IP:0,UR
	L:0,TC:0,Content:-5,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:88f74258-17e4-43d2-bf73-55337eed999a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:1,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75b7c2fcc9b111f0a52f393f94899d25-20251124
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 969735355; Mon, 24 Nov 2025 20:47:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 25 Nov 2025 11:47:23 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 25 Nov 2025 11:47:23 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 2/7] wifi: mt76: mt7996: fix the behavior of radar detection
Date: Tue, 25 Nov 2025 11:46:34 +0800
Message-ID: <20251125034639.1416214-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251125034639.1416214-1-shayne.chen@mediatek.com>
References: <20251125034639.1416214-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_194730_904872_B0D9C74B 
X-CRM114-Status: GOOD (  18.48  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

RDD_DET_MODE is a firmware command intended for testing and does not
pause TX after radar detection, so remove it from the normal flow;
instead, use the MAC_ENABLE_CTRL firmware command to resume TX after
the radar-triggered channel switch completes.

Fixes: 1529e335f93d ("wifi: mt76: mt7996: rework radar HWRDD idx")
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  8 +---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 20 ++++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 46 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  2 +
 5 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 2560e2f46e89..ce85d8f1bde6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2973,7 +2973,7 @@ static void mt7996_dfs_stop_radar_detector(struct mt7996_phy *phy)
 
 static int mt7996_dfs_start_rdd(struct mt7996_dev *dev, int rdd_idx)
 {
-	int err, region;
+	int region;
 
 	switch (dev->mt76.region) {
 	case NL80211_DFS_ETSI:
@@ -2988,11 +2988,7 @@ static int mt7996_dfs_start_rdd(struct mt7996_dev *dev, int rdd_idx)
 		break;
 	}
 
-	err = mt7996_mcu_rdd_cmd(dev, RDD_START, rdd_idx, region);
-	if (err < 0)
-		return err;
-
-	return mt7996_mcu_rdd_cmd(dev, RDD_DET_MODE, rdd_idx, 1);
+	return mt7996_mcu_rdd_cmd(dev, RDD_START, rdd_idx, region);
 }
 
 static int mt7996_dfs_start_radar_detector(struct mt7996_phy *phy)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 9b4bfb071292..18c6cdaae20b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -79,6 +79,7 @@ static void mt7996_stop_phy(struct mt7996_phy *phy)
 
 	mutex_lock(&dev->mt76.mutex);
 
+	mt7996_mcu_rdd_resume_tx(phy);
 	mt7996_mcu_set_radio_en(phy, false);
 
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
@@ -954,6 +955,24 @@ mt7996_channel_switch_beacon(struct ieee80211_hw *hw,
 	mutex_unlock(&dev->mt76.mutex);
 }
 
+static int
+mt7996_post_channel_switch(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			   struct ieee80211_bss_conf *link_conf)
+{
+	struct cfg80211_chan_def *chandef = &link_conf->chanreq.oper;
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	struct mt7996_phy *phy = mt7996_band_phy(dev, chandef->chan->band);
+	int ret;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	ret = mt7996_mcu_rdd_resume_tx(phy);
+
+	mutex_unlock(&dev->mt76.mutex);
+
+	return ret;
+}
+
 static int
 mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 			 struct ieee80211_bss_conf *link_conf,
@@ -2327,6 +2346,7 @@ const struct ieee80211_ops mt7996_ops = {
 	.release_buffered_frames = mt76_release_buffered_frames,
 	.get_txpower = mt7996_get_txpower,
 	.channel_switch_beacon = mt7996_channel_switch_beacon,
+	.post_channel_switch = mt7996_post_channel_switch,
 	.get_stats = mt7996_get_stats,
 	.get_et_sset_count = mt7996_get_et_sset_count,
 	.get_et_stats = mt7996_get_et_stats,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 7be03bbf34d4..c18c809ac77a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -520,24 +520,32 @@ mt7996_mcu_rx_radar_detected(struct mt7996_dev *dev, struct sk_buff *skb)
 		break;
 	case MT_RDD_IDX_BACKGROUND:
 		if (!dev->rdd2_phy)
-			return;
+			goto err;
 		mphy = dev->rdd2_phy->mt76;
 		break;
 	default:
-		dev_err(dev->mt76.dev, "Unknown RDD idx %d\n", r->rdd_idx);
-		return;
+		goto err;
 	}
 
 	if (!mphy)
-		return;
+		goto err;
 
-	if (r->rdd_idx == MT_RDD_IDX_BACKGROUND)
+	if (r->rdd_idx == MT_RDD_IDX_BACKGROUND) {
 		cfg80211_background_radar_event(mphy->hw->wiphy,
 						&dev->rdd2_chandef,
 						GFP_ATOMIC);
-	else
+	} else {
+		struct mt7996_phy *phy = mphy->priv;
+
+		phy->rdd_tx_paused = true;
 		ieee80211_radar_detected(mphy->hw, NULL);
+	}
 	dev->hw_pattern++;
+
+	return;
+
+err:
+	dev_err(dev->mt76.dev, "Invalid RDD idx %d\n", r->rdd_idx);
 }
 
 static void
@@ -4610,6 +4618,32 @@ int mt7996_mcu_set_radio_en(struct mt7996_phy *phy, bool enable)
 				 &req, sizeof(req), true);
 }
 
+int mt7996_mcu_rdd_resume_tx(struct mt7996_phy *phy)
+{
+	struct {
+		u8 band_idx;
+		u8 _rsv[3];
+
+		__le16 tag;
+		__le16 len;
+		u8 mac_enable;
+		u8 _rsv2[3];
+	} __packed req = {
+		.band_idx = phy->mt76->band_idx,
+		.tag = cpu_to_le16(UNI_BAND_CONFIG_MAC_ENABLE_CTRL),
+		.len = cpu_to_le16(sizeof(req) - 4),
+		.mac_enable = 2,
+	};
+
+	if (!phy->rdd_tx_paused)
+		return 0;
+
+	phy->rdd_tx_paused = false;
+
+	return mt76_mcu_send_msg(&phy->dev->mt76, MCU_WM_UNI_CMD(BAND_CONFIG),
+				 &req, sizeof(req), true);
+}
+
 int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 rdd_idx, u8 val)
 {
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index fc8b09e76f01..5b3597ca79be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -835,6 +835,7 @@ enum {
 enum {
 	UNI_BAND_CONFIG_RADIO_ENABLE,
 	UNI_BAND_CONFIG_RTS_THRESHOLD = 0x08,
+	UNI_BAND_CONFIG_MAC_ENABLE_CTRL = 0x0c,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 7a884311800e..d31864f973cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -377,6 +377,7 @@ struct mt7996_phy {
 
 	bool has_aux_rx;
 	bool counter_reset;
+	bool rdd_tx_paused;
 };
 
 struct mt7996_dev {
@@ -726,6 +727,7 @@ int mt7996_mcu_get_temperature(struct mt7996_phy *phy);
 int mt7996_mcu_set_thermal_throttling(struct mt7996_phy *phy, u8 state);
 int mt7996_mcu_set_thermal_protect(struct mt7996_phy *phy, bool enable);
 int mt7996_mcu_set_txpower_sku(struct mt7996_phy *phy);
+int mt7996_mcu_rdd_resume_tx(struct mt7996_phy *phy);
 int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 rdd_idx, u8 val);
 int mt7996_mcu_rdd_background_enable(struct mt7996_phy *phy,
 				     struct cfg80211_chan_def *chandef);
-- 
2.51.0


