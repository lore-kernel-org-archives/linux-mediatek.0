Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC560C54E8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92613206E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aMgH3fNY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JofN4u5V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92613206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRNdCXk07DjRZ4GOP+hcy9gOX8b3+PL1jjHOdy+jbDQ=; b=aMgH3fNYrBvfp8
	h6RLFtrWYzdJlWoKvLfhOzshg0KKmlnBxcgri3o9y71UVmexI0UpghHOCaTPyuUcfVOvuMpg0OOyi
	uarnyH5Spd0XoLjsmoxDEiAXJiw3a9ZxJwaMp7o2KHxYLt1JRhEcoxvwqedmLqRN+2LxTMyro9ndD
	aJaW7ae8K2kMIwpI/EreaSrlwHuFy1GGBCH5tYY2L6wIS9zdyHXBFHCltHQjWOu4xhENQxoRLemeu
	K0DTd0goXaTiMp/qPbRuz4pZCN6I56nLMaN8fUaJCK0zypFyFulNqfgVQQDeRWQC/OQ32BhymoxJX
	z3t28MOk6xou+R9a91ZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAxF-0004uL-Ij; Mon, 11 May 2020 16:06:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAxC-0004tU-8T
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 16:06:56 +0000
X-UUID: 859fc4e1d5cd440ea8080d815e2a10d3-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=W1/UYjiinWpEDX+from/u3GdmMKGv1ROBsk61OpOE/Q=; 
 b=JofN4u5VFxyH4Sg8nFwTZimn9LSRDVTPe6Yb3yLKdzp+yJH9AHLuX4yvMHES4jFRmda4WJOCo9Q7dK8pRyMdXnVXYgsP/VKFuPTFhxuM0X+wHaPbX32lS4JwHOU3LO0bjlH2sjOd50eNE2B9qef8DTwC45My0hAhSLy0VBNwKpM=;
X-UUID: 859fc4e1d5cd440ea8080d815e2a10d3-20200511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 45598959; Mon, 11 May 2020 08:06:23 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 09:06:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 May 2020 00:06:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 May 2020 00:06:41 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 7/7] mt76: mt7915: fix possible deadlock in mt7915_stop
Date: Tue, 12 May 2020 00:06:38 +0800
Message-ID: <2d4d7cd62e1e3ba982b43a83748d5d683cdcc81f.1589212457.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1589212457.git.ryder.lee@mediatek.com>
References: <cover.1589212457.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_090654_311790_241F1626 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

make mac_work per phy instead of per device and fix a possible deadlock
in mt7915_stop since mt7915_mac_work runs holding mt76 mutex

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  3 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 49 +++++++++++--------
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 18 +++----
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +-
 4 files changed, 42 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index e2b0ea33053c..6f200ab3ac28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -592,6 +592,7 @@ int mt7915_register_ext_phy(struct mt7915_dev *dev)
 	if (phy)
 		return 0;
 
+	INIT_DELAYED_WORK(&phy->mac_work, mt7915_mac_work);
 	mt7915_cap_dbdc_enable(dev);
 	mphy = mt76_alloc_phy(&dev->mt76, sizeof(*phy), &mt7915_ops);
 	if (!mphy)
@@ -642,7 +643,7 @@ int mt7915_register_device(struct mt7915_dev *dev)
 	dev->phy.dev = dev;
 	dev->phy.mt76 = &dev->mt76.phy;
 	dev->mt76.phy.priv = &dev->phy;
-	INIT_DELAYED_WORK(&dev->mt76.mac_work, mt7915_mac_work);
+	INIT_DELAYED_WORK(&dev->phy.mac_work, mt7915_mac_work);
 	INIT_LIST_HEAD(&dev->sta_poll_list);
 	spin_lock_init(&dev->sta_poll_lock);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 751363b4b7a2..7ad7c2b7afdc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1156,26 +1156,32 @@ mt7915_dma_reset(struct mt7915_dev *dev)
 /* system error recovery */
 void mt7915_mac_reset_work(struct work_struct *work)
 {
+	struct mt7915_phy *phy2;
+	struct mt76_phy *ext_phy;
 	struct mt7915_dev *dev;
 
 	dev = container_of(work, struct mt7915_dev, reset_work);
+	ext_phy = dev->mt76.phy2;
+	phy2 = ext_phy ? ext_phy->priv : NULL;
 
 	if (!(READ_ONCE(dev->reset_state) & MT_MCU_CMD_STOP_DMA))
 		return;
 
 	ieee80211_stop_queues(mt76_hw(dev));
-	if (dev->mt76.phy2)
-		ieee80211_stop_queues(dev->mt76.phy2->hw);
+	if (ext_phy)
+		ieee80211_stop_queues(ext_phy->hw);
 
 	set_bit(MT76_RESET, &dev->mphy.state);
 	set_bit(MT76_MCU_RESET, &dev->mphy.state);
 	wake_up(&dev->mt76.mcu.wait);
-	cancel_delayed_work_sync(&dev->mt76.mac_work);
+	cancel_delayed_work_sync(&dev->phy.mac_work);
+	if (phy2)
+		cancel_delayed_work_sync(&phy2->mac_work);
 
 	/* lock/unlock all queues to ensure that no tx is pending */
 	mt76_txq_schedule_all(&dev->mphy);
-	if (dev->mt76.phy2)
-		mt76_txq_schedule_all(dev->mt76.phy2);
+	if (ext_phy)
+		mt76_txq_schedule_all(ext_phy);
 
 	tasklet_disable(&dev->mt76.tx_tasklet);
 	napi_disable(&dev->mt76.napi[0]);
@@ -1211,8 +1217,8 @@ void mt7915_mac_reset_work(struct work_struct *work)
 	napi_schedule(&dev->mt76.napi[2]);
 
 	ieee80211_wake_queues(mt76_hw(dev));
-	if (dev->mt76.phy2)
-		ieee80211_wake_queues(dev->mt76.phy2->hw);
+	if (ext_phy)
+		ieee80211_wake_queues(ext_phy->hw);
 
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_RESET_DONE);
 	mt7915_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE);
@@ -1221,8 +1227,11 @@ void mt7915_mac_reset_work(struct work_struct *work)
 
 	mt7915_update_beacons(dev);
 
-	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mt76.mac_work,
+	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->phy.mac_work,
 				     MT7915_WATCHDOG_TIME);
+	if (phy2)
+		ieee80211_queue_delayed_work(ext_phy->hw, &phy2->mac_work,
+					     MT7915_WATCHDOG_TIME);
 }
 
 static void
@@ -1307,25 +1316,25 @@ void mt7915_mac_sta_stats_work(struct work_struct *work)
 
 void mt7915_mac_work(struct work_struct *work)
 {
-	struct mt7915_dev *dev;
+	struct mt7915_phy *phy;
+	struct mt76_dev *mdev;
 
-	dev = (struct mt7915_dev *)container_of(work, struct mt76_dev,
+	phy = (struct mt7915_phy *)container_of(work, struct mt7915_phy,
 						mac_work.work);
+	mdev = &phy->dev->mt76;
 
-	mutex_lock(&dev->mt76.mutex);
-	mt76_update_survey(&dev->mt76);
-	if (++dev->mac_work_count == 5) {
-		struct mt7915_phy *ext_phy = mt7915_ext_phy(dev);
+	mutex_lock(&mdev->mutex);
 
-		mt7915_mac_update_mib_stats(&dev->phy);
-		if (ext_phy)
-			mt7915_mac_update_mib_stats(ext_phy);
+	mt76_update_survey(mdev);
+	if (++phy->mac_work_count == 5) {
+		phy->mac_work_count = 0;
 
-		dev->mac_work_count = 0;
+		mt7915_mac_update_mib_stats(phy);
 	}
-	mutex_unlock(&dev->mt76.mutex);
 
-	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mt76.mac_work,
+	mutex_unlock(&mdev->mutex);
+
+	ieee80211_queue_delayed_work(phy->mt76->hw, &phy->mac_work,
 				     MT7915_WATCHDOG_TIME);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 147ab7da7aa9..98567374c2c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -47,14 +47,12 @@ static int mt7915_start(struct ieee80211_hw *hw)
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
-	if (running)
-		goto out;
+	ieee80211_queue_delayed_work(hw, &phy->mac_work,
+				     MT7915_WATCHDOG_TIME);
 
-	mt7915_mac_reset_counters(phy);
+	if (!running)
+		mt7915_mac_reset_counters(phy);
 
-	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mt76.mac_work,
-				     MT7915_WATCHDOG_TIME);
-out:
 	mutex_unlock(&dev->mt76.mutex);
 
 	return 0;
@@ -65,6 +63,8 @@ static void mt7915_stop(struct ieee80211_hw *hw)
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_phy *phy = mt7915_hw_phy(hw);
 
+	cancel_delayed_work_sync(&phy->mac_work);
+
 	mutex_lock(&dev->mt76.mutex);
 
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
@@ -75,8 +75,6 @@ static void mt7915_stop(struct ieee80211_hw *hw)
 	}
 
 	if (!mt7915_dev_running(dev)) {
-		cancel_delayed_work_sync(&dev->mt76.mac_work);
-
 		mt7915_mcu_set_pm(dev, 0, 1);
 		mt7915_mcu_set_mac(dev, 0, false, false);
 	}
@@ -230,7 +228,7 @@ static int mt7915_set_channel(struct mt7915_phy *phy)
 	struct mt7915_dev *dev = phy->dev;
 	int ret;
 
-	cancel_delayed_work_sync(&dev->mt76.mac_work);
+	cancel_delayed_work_sync(&phy->mac_work);
 
 	mutex_lock(&dev->mt76.mutex);
 	set_bit(MT76_RESET, &phy->mt76->state);
@@ -254,7 +252,7 @@ static int mt7915_set_channel(struct mt7915_phy *phy)
 	mutex_unlock(&dev->mt76.mutex);
 
 	mt76_txq_schedule_all(phy->mt76);
-	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mt76.mac_work,
+	ieee80211_queue_delayed_work(phy->mt76->hw, &phy->mac_work,
 				     MT7915_WATCHDOG_TIME);
 
 	return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 537fc126289f..5392292a838e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -141,6 +141,9 @@ struct mt7915_phy {
 	u32 ampdu_ref;
 
 	struct mib_stats mib;
+
+	struct delayed_work mac_work;
+	u8 mac_work_count;
 };
 
 struct mt7915_dev {
@@ -168,7 +171,6 @@ struct mt7915_dev {
 
 	s8 **rate_power; /* TODO: use mt76_rate_power */
 
-	u8 mac_work_count;
 	bool fw_debug;
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
