Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F95C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4E41206A1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AjE7tzUq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IM0IOpV+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4E41206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RZkqLEMASd/yo3APssOgrvktN75C/Pbhmrg7eazuW54=; b=AjE7tzUqT3j15iMRmC6BtoQaT
	rqIjkcg2H4s6ws+fKtJQZ0O/gdYbhxnQqLedWwV5c8Yl4rBSdddujLZlGCC1zlqLrW0LyY1x7Ul2w
	gLuxPELZfvwYETR9ltgjc6ZEeEw9zq6rZhv/Ym3zWAKrgqZLM/mS37ID6uS9WYyMcVm9eHt3yWXzt
	50XhfVJks1AFQFOMKbNwhJiqJQ3bbeQ5m6y11qsKmhWSoJMurmnSqxzq2J9q2Vz65ar7TxsXo0Ok5
	JBMy+QbDtVu2ZFb+GGBeLX3w2FIFKZBSzWfoURxBYkJP6Grf5a9Ws6AV+8VlNte37RUlX6atIdchh
	kBCuCvhuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsW-0006Kc-8g; Fri, 03 Jul 2020 08:17:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsK-00069I-DF
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:50 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B254206A1;
 Fri,  3 Jul 2020 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764207;
 bh=7UNQABvMafBX/1iA74I4oxU/ERc2460haK7HJCw5Ufk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IM0IOpV+SBpe2xPHYWZUlaoTaWSgD/+HYKz1bZzXCQuRzLZ+WQPrvL2DVHfDWPniF
 /x0SYb1Fqmqs9Ywc/7dl1daEi+Hx52Exvrsm4oh/XozLYphGGMFkfoLoytGOyKoydE
 xcoEUgSoXt8+vgSFiQnDkiixAi1J2wnq3EUqOsQc=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 15/22] mt76: mt7615: wake device before pushing frames in
 mt7615_tx
Date: Fri,  3 Jul 2020 10:15:54 +0200
Message-Id: <f0e2af5ad6dae76c76f44b6d2337e46744d54e35.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041648_623364_CC783EFF 
X-CRM114-Status: GOOD (  15.19  )
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
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Queue frames pushed by mac80211 running mt7615_tx if the device is
low-power state. Run wake workqueue in order to swicth to full-power
before transmitting pending frames

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 25 ++++++++-
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 56 +++++++++++++++++--
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  6 ++
 4 files changed, 81 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 59c59e8630c1..501726bfda24 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -450,6 +450,7 @@ void mt7615_init_device(struct mt7615_dev *dev)
 	INIT_DELAYED_WORK(&dev->pm.ps_work, mt7615_pm_power_save_work);
 	INIT_WORK(&dev->pm.wake_work, mt7615_pm_wake_work);
 	init_completion(&dev->pm.wake_cmpl);
+	spin_lock_init(&dev->pm.txq_lock);
 	INIT_DELAYED_WORK(&dev->phy.mac_work, mt7615_mac_work);
 	INIT_DELAYED_WORK(&dev->phy.scan_work, mt7615_scan_work);
 	skb_queue_head_init(&dev->phy.scan_event_list);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index e3dbbf957426..76751117592b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1836,6 +1836,7 @@ void mt7615_pm_wake_work(struct work_struct *work)
 {
 	struct mt7615_dev *dev;
 	struct mt76_phy *mphy;
+	int i;
 
 	dev = (struct mt7615_dev *)container_of(work, struct mt7615_dev,
 						pm.wake_work);
@@ -1846,8 +1847,28 @@ void mt7615_pm_wake_work(struct work_struct *work)
 		goto out;
 	}
 
+	spin_lock_bh(&dev->pm.txq_lock);
+	for (i = 0; i < IEEE80211_NUM_ACS; i++) {
+		struct mt7615_sta *msta = dev->pm.tx_q[i].msta;
+		struct mt76_wcid *wcid = msta ? &msta->wcid : NULL;
+		struct ieee80211_sta *sta = NULL;
+
+		if (!dev->pm.tx_q[i].skb)
+			continue;
+
+		if (msta && wcid->sta)
+			sta = container_of((void *)msta, struct ieee80211_sta,
+					   drv_priv);
+
+		mt76_tx(mphy, sta, wcid, dev->pm.tx_q[i].skb);
+		dev->pm.tx_q[i].skb = NULL;
+	}
+	spin_unlock_bh(&dev->pm.txq_lock);
+
 	tasklet_schedule(&dev->mt76.tx_tasklet);
+
 out:
+	ieee80211_wake_queues(mphy->hw);
 	complete_all(&dev->pm.wake_cmpl);
 }
 
@@ -1871,8 +1892,10 @@ int mt7615_pm_wake(struct mt7615_dev *dev)
 	if (queue_work(dev->mt76.wq, &dev->pm.wake_work))
 		reinit_completion(&dev->pm.wake_cmpl);
 
-	if (!wait_for_completion_timeout(&dev->pm.wake_cmpl, 3 * HZ))
+	if (!wait_for_completion_timeout(&dev->pm.wake_cmpl, 3 * HZ)) {
+		ieee80211_wake_queues(mphy->hw);
 		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 3ff387f31659..57d5e3aa9439 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -24,6 +24,22 @@ static bool mt7615_dev_running(struct mt7615_dev *dev)
 	return phy && test_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 }
 
+static void mt7615_free_pending_tx_skbs(struct mt7615_dev *dev,
+					struct mt7615_sta *msta)
+{
+	int i;
+
+	spin_lock_bh(&dev->pm.txq_lock);
+	for (i = 0; i < IEEE80211_NUM_ACS; i++) {
+		if (msta && dev->pm.tx_q[i].msta != msta)
+			continue;
+
+		dev_kfree_skb(dev->pm.tx_q[i].skb);
+		dev->pm.tx_q[i].skb = NULL;
+	}
+	spin_unlock_bh(&dev->pm.txq_lock);
+}
+
 static int mt7615_start(struct ieee80211_hw *hw)
 {
 	struct mt7615_dev *dev = mt7615_hw_dev(hw);
@@ -77,6 +93,8 @@ static void mt7615_stop(struct ieee80211_hw *hw)
 	cancel_delayed_work_sync(&dev->pm.ps_work);
 	cancel_work_sync(&dev->pm.wake_work);
 
+	mt7615_free_pending_tx_skbs(dev, NULL);
+
 	mt7615_mutex_acquire(dev);
 
 	mt76_testmode_reset(&dev->mt76, true);
@@ -214,6 +232,8 @@ static void mt7615_remove_interface(struct ieee80211_hw *hw,
 	if (vif == phy->monitor_vif)
 	    phy->monitor_vif = NULL;
 
+	mt7615_free_pending_tx_skbs(dev, msta);
+
 	mt7615_mcu_add_dev_info(dev, vif, false);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
@@ -595,6 +615,8 @@ void mt7615_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
 	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
 
+	mt7615_free_pending_tx_skbs(dev, msta);
+
 	mt7615_mcu_sta_add(dev, vif, sta, false);
 	mt7615_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
@@ -665,22 +687,43 @@ static void mt7615_tx(struct ieee80211_hw *hw,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
 	struct mt76_wcid *wcid = &dev->mt76.global_wcid;
+	struct mt7615_sta *msta = NULL;
+	int qid;
 
 	if (control->sta) {
-		struct mt7615_sta *sta;
-
-		sta = (struct mt7615_sta *)control->sta->drv_priv;
-		wcid = &sta->wcid;
+		msta = (struct mt7615_sta *)control->sta->drv_priv;
+		wcid = &msta->wcid;
 	}
 
 	if (vif && !control->sta) {
 		struct mt7615_vif *mvif;
 
 		mvif = (struct mt7615_vif *)vif->drv_priv;
-		wcid = &mvif->sta.wcid;
+		msta = &mvif->sta;
+		wcid = &msta->wcid;
+	}
+
+	if (!test_bit(MT76_STATE_PM, &mphy->state)) {
+		mt76_tx(mphy, control->sta, wcid, skb);
+		return;
+	}
+
+	qid = skb_get_queue_mapping(skb);
+	if (qid >= MT_TXQ_PSD) {
+		qid = IEEE80211_AC_BE;
+		skb_set_queue_mapping(skb, qid);
 	}
 
-	mt76_tx(mphy, control->sta, wcid, skb);
+	spin_lock_bh(&dev->pm.txq_lock);
+	if (!dev->pm.tx_q[qid].skb) {
+		ieee80211_stop_queues(hw);
+		dev->pm.tx_q[qid].msta = msta;
+		dev->pm.tx_q[qid].skb = skb;
+		queue_work(dev->mt76.wq, &dev->pm.wake_work);
+	} else {
+		dev_kfree_skb(skb);
+	}
+	spin_unlock_bh(&dev->pm.txq_lock);
 }
 
 static int mt7615_set_rts_threshold(struct ieee80211_hw *hw, u32 val)
@@ -1059,6 +1102,7 @@ static int mt7615_suspend(struct ieee80211_hw *hw,
 	int err = 0;
 
 	cancel_delayed_work_sync(&dev->pm.ps_work);
+	mt7615_free_pending_tx_skbs(dev, NULL);
 
 	mt7615_mutex_acquire(dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index ee02c45dfa9e..66489f44c1a9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -300,6 +300,12 @@ struct mt7615_dev {
 #endif
 
 	struct {
+		spinlock_t txq_lock;
+		struct {
+			struct mt7615_sta *msta;
+			struct sk_buff *skb;
+		} tx_q[IEEE80211_NUM_ACS];
+
 		struct work_struct wake_work;
 		struct completion wake_cmpl;
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
