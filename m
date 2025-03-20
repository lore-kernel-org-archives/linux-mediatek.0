Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0545BC36003
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Mar 2025 02:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y4PRyy37+4nypqcj7LQ0pS3TlZKMM5lApjxRTz+cQdY=; b=JevWDqoyDNRDBzUMs8lxYVYaRz
	dkwUEQSDKpuZNtkXfqVrEFqkr58/yblR/ItXqzObfpJixbqA4mU/xuJ2cggDDxb4ANfi28v6VVDZD
	EXnmq+/3xZK/TNSJb03yO6t3XX+igQAK9wA/eQCpO6fD6AP2UnbHl0N0m83+qleId1c2Il7FdJgBk
	6haXePbN8xPf0Swxs0YyWHyokdYq6LoLAlBz9wXOiPWv6iO5NXP9cyTHV5ylKRr7ZVFcioOQv8oac
	sc9VWmKbEzq8ymAik3RxLaUnZ3Dfrpkahl3BCIpnYDgdmnUPep0yKcfHHPVEgsQueKdeUAF96BcvN
	JBB55TIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5bC-0000000AshH-0h9D;
	Thu, 20 Mar 2025 02:25:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5C1-0000000Am4S-1tQ6
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Mar 2025 01:59:34 +0000
X-UUID: f5da1720052e11f083f2a1c9db70dae0-20250319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Y4PRyy37+4nypqcj7LQ0pS3TlZKMM5lApjxRTz+cQdY=;
	b=YlM3SYpqLBOTViPFpYwxmhUpD0piaBPUkFYFo5BYaiU4+uApHTESSFs5fSYGs/b+I4PF9SlOJKl3HX7ldQZG+j0dLAT1wHcMv9nen6LQCGMcN/J9brT/0SG1Q+GNFS/syuQ99uCBwYnwuyZpl0dHMmUAP3M2gelpuGrE07du0Dk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d89860f3-23d6-4d58-81b3-ccf319a16beb,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:e7a2544a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f5da1720052e11f083f2a1c9db70dae0-20250319
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <stanleyyp.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 801924813; Wed, 19 Mar 2025 18:59:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 20 Mar 2025 09:59:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 20 Mar 2025 09:59:27 +0800
From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Money Wang <money.wang@mediatek.com>
Subject: [PATCH 3/3] wifi: mt76: mt7996: rework radar HWRDD idx
Date: Thu, 20 Mar 2025 09:59:26 +0800
Message-ID: <20250320015926.3948672-1-StanleyYP.Wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_185933_498352_003B4BE2 
X-CRM114-Status: GOOD (  22.28  )
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

The definition of MT_RX_SEL (for rdd_rx_sel) is mixed with the
definition of HWRDD idx.
For example, MT_RX_SEL2 is for background HWRDD idx, not an
option of rdd_rx_sel.
Additionally, HWRDD idx does not exactly map to band idx for
Connac 3 chips. So, add mt7996_get_rdd_idx as a helper function.

Finally, remove some parts of the code inherited from the legacy chips.
For instance,
1. rdd_state is used for single-band-dual-HWRDD chips (for 80+80),
especially the 76xx series.
2. rdd_rx_sel is also used for single-band-dual-HWRDD chips
rx_sel = 0 => RDD0 for WF0, RDD1 for WF2
rx_sel = 1 => RDD0 for WF1, RDD1 for WF3

Chip Variants              | 5G rdd idx     | Background rdd idx
---------------------------|----------------|-------------------
MT7996 (except 205/255)    | 1              | 2
MT7992                     | 1              | 2
MT7990                     | 1              | 2

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Reviewed-by: Money Wang <money.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7996/debugfs.c   | 17 ++++--
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 57 +++++++------------
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 40 ++++++-------
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  2 +-
 .../wireless/mediatek/mt76/mt7996/mt7996.h    | 28 ++++++---
 5 files changed, 75 insertions(+), 69 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index d453c2fc97e4..6b12b888fb2c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -222,18 +222,27 @@ static const struct file_operations mt7996_sys_recovery_ops = {
 static int
 mt7996_radar_trigger(void *data, u64 val)
 {
+#define RADAR_MAIN_CHAIN	1
+#define RADAR_BACKGROUND	2
 	struct mt7996_dev *dev = data;
+	struct mt7996_phy *phy = mt7996_band_phy(dev, NL80211_BAND_5GHZ);
+	int rdd_idx;
 
-	if (val > MT_RX_SEL2)
+	if (!phy || !val || val > RADAR_BACKGROUND)
 		return -EINVAL;
 
-	if (val == MT_RX_SEL2 && !dev->rdd2_phy) {
+	if (val == RADAR_BACKGROUND && !dev->rdd2_phy) {
 		dev_err(dev->mt76.dev, "Background radar is not enabled\n");
 		return -EINVAL;
 	}
 
-	return mt7996_mcu_rdd_cmd(dev, RDD_RADAR_EMULATE,
-				  val, 0, 0);
+	rdd_idx = mt7996_get_rdd_idx(phy, val == RADAR_BACKGROUND);
+	if (rdd_idx < 0) {
+		dev_err(dev->mt76.dev, "No RDD found\n");
+		return -EINVAL;
+	}
+
+	return mt7996_mcu_rdd_cmd(dev, RDD_RADAR_EMULATE, rdd_idx, 0);
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_radar_trigger, NULL,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 7ddd4b0cadf5..dabb10de12fe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2341,16 +2341,15 @@ void mt7996_mac_work(struct work_struct *work)
 static void mt7996_dfs_stop_radar_detector(struct mt7996_phy *phy)
 {
 	struct mt7996_dev *dev = phy->dev;
+	int rdd_idx = mt7996_get_rdd_idx(phy, false);
 
-	if (phy->rdd_state & BIT(0))
-		mt7996_mcu_rdd_cmd(dev, RDD_STOP, 0,
-				   MT_RX_SEL0, 0);
-	if (phy->rdd_state & BIT(1))
-		mt7996_mcu_rdd_cmd(dev, RDD_STOP, 1,
-				   MT_RX_SEL0, 0);
+	if (rdd_idx < 0)
+		return;
+
+	mt7996_mcu_rdd_cmd(dev, RDD_STOP, rdd_idx, 0);
 }
 
-static int mt7996_dfs_start_rdd(struct mt7996_dev *dev, int chain)
+static int mt7996_dfs_start_rdd(struct mt7996_dev *dev, int rdd_idx)
 {
 	int err, region;
 
@@ -2367,44 +2366,30 @@ static int mt7996_dfs_start_rdd(struct mt7996_dev *dev, int chain)
 		break;
 	}
 
-	err = mt7996_mcu_rdd_cmd(dev, RDD_START, chain,
-				 MT_RX_SEL0, region);
+	err = mt7996_mcu_rdd_cmd(dev, RDD_START, rdd_idx, region);
 	if (err < 0)
 		return err;
 
-	return mt7996_mcu_rdd_cmd(dev, RDD_DET_MODE, chain,
-				 MT_RX_SEL0, 1);
+	return mt7996_mcu_rdd_cmd(dev, RDD_DET_MODE, rdd_idx, 1);
 }
 
 static int mt7996_dfs_start_radar_detector(struct mt7996_phy *phy)
 {
-	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
 	struct mt7996_dev *dev = phy->dev;
-	u8 band_idx = phy->mt76->band_idx;
-	int err;
+	int err, rdd_idx;
 
-	/* start CAC */
-	err = mt7996_mcu_rdd_cmd(dev, RDD_CAC_START, band_idx,
-				 MT_RX_SEL0, 0);
-	if (err < 0)
-		return err;
+	rdd_idx = mt7996_get_rdd_idx(phy, false);
+	if (rdd_idx < 0)
+		return -EINVAL;
 
-	err = mt7996_dfs_start_rdd(dev, band_idx);
+	/* start CAC */
+	err = mt7996_mcu_rdd_cmd(dev, RDD_CAC_START, rdd_idx, 0);
 	if (err < 0)
 		return err;
 
-	phy->rdd_state |= BIT(band_idx);
-
-	if (chandef->width == NL80211_CHAN_WIDTH_160 ||
-	    chandef->width == NL80211_CHAN_WIDTH_80P80) {
-		err = mt7996_dfs_start_rdd(dev, 1);
-		if (err < 0)
-			return err;
+	err = mt7996_dfs_start_rdd(dev, rdd_idx);
 
-		phy->rdd_state |= BIT(1);
-	}
-
-	return 0;
+	return err;
 }
 
 static int
@@ -2445,12 +2430,12 @@ int mt7996_dfs_init_radar_detector(struct mt7996_phy *phy)
 {
 	struct mt7996_dev *dev = phy->dev;
 	enum mt76_dfs_state dfs_state, prev_state;
-	int err;
+	int err, rdd_idx = mt7996_get_rdd_idx(phy, false);
 
 	prev_state = phy->mt76->dfs_state;
 	dfs_state = mt76_phy_dfs_state(phy->mt76);
 
-	if (prev_state == dfs_state)
+	if (prev_state == dfs_state || rdd_idx < 0)
 		return 0;
 
 	if (prev_state == MT_DFS_STATE_UNKNOWN)
@@ -2474,8 +2459,7 @@ int mt7996_dfs_init_radar_detector(struct mt7996_phy *phy)
 	if (dfs_state == MT_DFS_STATE_CAC)
 		return 0;
 
-	err = mt7996_mcu_rdd_cmd(dev, RDD_CAC_END,
-				 phy->mt76->band_idx, MT_RX_SEL0, 0);
+	err = mt7996_mcu_rdd_cmd(dev, RDD_CAC_END, rdd_idx, 0);
 	if (err < 0) {
 		phy->mt76->dfs_state = MT_DFS_STATE_UNKNOWN;
 		return err;
@@ -2485,8 +2469,7 @@ int mt7996_dfs_init_radar_detector(struct mt7996_phy *phy)
 	return 0;
 
 stop:
-	err = mt7996_mcu_rdd_cmd(dev, RDD_NORMAL_START,
-				 phy->mt76->band_idx, MT_RX_SEL0, 0);
+	err = mt7996_mcu_rdd_cmd(dev, RDD_NORMAL_START, rdd_idx, 0);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index e6ebb309a825..67f213e5a6cb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -364,21 +364,27 @@ mt7996_mcu_rx_radar_detected(struct mt7996_dev *dev, struct sk_buff *skb)
 
 	r = (struct mt7996_mcu_rdd_report *)skb->data;
 
-	if (r->band_idx >= ARRAY_SIZE(dev->mt76.phys))
-		return;
-
-	if (r->band_idx == MT_RX_SEL2 && !dev->rdd2_phy)
-		return;
-
-	if (r->band_idx == MT_RX_SEL2)
+	switch (r->rdd_idx) {
+	case MT_RDD_IDX_BAND2:
+		mphy = dev->mt76.phys[MT_BAND2];
+		break;
+	case MT_RDD_IDX_BAND1:
+		mphy = dev->mt76.phys[MT_BAND1];
+		break;
+	case MT_RDD_IDX_BACKGROUND:
+		if (!dev->rdd2_phy)
+			return;
 		mphy = dev->rdd2_phy->mt76;
-	else
-		mphy = dev->mt76.phys[r->band_idx];
+		break;
+	default:
+		dev_err(dev->mt76.dev, "Unknown RDD idx %d\n", r->rdd_idx);
+		return;
+	}
 
 	if (!mphy)
 		return;
 
-	if (r->band_idx == MT_RX_SEL2)
+	if (r->rdd_idx == MT_RDD_IDX_BACKGROUND)
 		cfg80211_background_radar_event(mphy->hw->wiphy,
 						&dev->rdd2_chandef,
 						GFP_ATOMIC);
@@ -3436,11 +3442,10 @@ int mt7996_mcu_rdd_background_enable(struct mt7996_phy *phy,
 				     struct cfg80211_chan_def *chandef)
 {
 	struct mt7996_dev *dev = phy->dev;
-	int err, region;
+	int err, region, rdd_idx = mt7996_get_rdd_idx(phy, true);
 
 	if (!chandef) { /* disable offchain */
-		err = mt7996_mcu_rdd_cmd(dev, RDD_STOP, MT_RX_SEL2,
-					 0, 0);
+		err = mt7996_mcu_rdd_cmd(dev, RDD_STOP, rdd_idx, 0);
 		if (err)
 			return err;
 
@@ -3466,8 +3471,7 @@ int mt7996_mcu_rdd_background_enable(struct mt7996_phy *phy,
 		break;
 	}
 
-	return mt7996_mcu_rdd_cmd(dev, RDD_START, MT_RX_SEL2,
-				  0, region);
+	return mt7996_mcu_rdd_cmd(dev, RDD_START, rdd_idx, region);
 }
 
 int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag)
@@ -4333,8 +4337,7 @@ int mt7996_mcu_set_radio_en(struct mt7996_phy *phy, bool enable)
 				 &req, sizeof(req), true);
 }
 
-int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 index,
-		       u8 rx_sel, u8 val)
+int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 rdd_idx, u8 val)
 {
 	struct {
 		u8 _rsv[4];
@@ -4351,8 +4354,7 @@ int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 index,
 		.tag = cpu_to_le16(UNI_RDD_CTRL_PARM),
 		.len = cpu_to_le16(sizeof(req) - 4),
 		.ctrl = cmd,
-		.rdd_idx = index,
-		.rdd_rx_sel = rx_sel,
+		.rdd_idx = rdd_idx,
 		.val = val,
 	};
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 5fdc47dad28c..162734815d18 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -69,7 +69,7 @@ struct mt7996_mcu_rdd_report {
 	__le16 tag;
 	__le16 len;
 
-	u8 band_idx;
+	u8 rdd_idx;
 	u8 long_detected;
 	u8 constant_prf_detected;
 	u8 staggered_prf_detected;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 84b9ff707d56..c736cefb6c91 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -281,8 +281,6 @@ struct mt7996_phy {
 	s16 coverage_class;
 	u8 slottime;
 
-	u8 rdd_state;
-
 	u16 beacon_rate;
 
 	u32 rx_ampdu_ts;
@@ -405,10 +403,10 @@ enum {
 	__MT_WFDMA_MAX,
 };
 
-enum {
-	MT_RX_SEL0,
-	MT_RX_SEL1,
-	MT_RX_SEL2, /* monitor chain */
+enum rdd_idx {
+	MT_RDD_IDX_BAND2,	/* RDD idx for band idx 2 */
+	MT_RDD_IDX_BAND1,	/* RDD idx for band idx 1 */
+	MT_RDD_IDX_BACKGROUND,	/* RDD idx for background chain */
 };
 
 enum mt7996_rdd_cmd {
@@ -427,6 +425,21 @@ enum mt7996_rdd_cmd {
 	RDD_IRQ_OFF,
 };
 
+static inline int
+mt7996_get_rdd_idx(struct mt7996_phy *phy, bool is_background)
+{
+	if (!phy->mt76->cap.has_5ghz)
+		return -1;
+
+	if (is_background)
+		return MT_RDD_IDX_BACKGROUND;
+
+	if (phy->mt76->band_idx == MT_BAND2)
+		return MT_RDD_IDX_BAND2;
+
+	return MT_RDD_IDX_BAND1;
+}
+
 static inline struct mt7996_dev *
 mt7996_hw_dev(struct ieee80211_hw *hw)
 {
@@ -623,8 +636,7 @@ int mt7996_mcu_get_temperature(struct mt7996_phy *phy);
 int mt7996_mcu_set_thermal_throttling(struct mt7996_phy *phy, u8 state);
 int mt7996_mcu_set_thermal_protect(struct mt7996_phy *phy, bool enable);
 int mt7996_mcu_set_txpower_sku(struct mt7996_phy *phy);
-int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 index,
-		       u8 rx_sel, u8 val);
+int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 rdd_idx, u8 val);
 int mt7996_mcu_rdd_background_enable(struct mt7996_phy *phy,
 				     struct cfg80211_chan_def *chandef);
 int mt7996_mcu_set_fixed_rate_table(struct mt7996_phy *phy, u8 table_idx,
-- 
2.45.2


