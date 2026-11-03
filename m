Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53474606A324
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=URQXRKbk;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=tpQ5VsDY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2It4Fb8ZtDEQVDFdKm8vz5VdKvtTILOcV+7ZdHxSaH0=; b=URQXRKbkvtljpfbkgmopebazRU
	z93rQiwM3IdP/2Aq2PRsQIbTdBUYI4YJDuJYMQBkxtvkbqq4++CDwIjlECW4OoaRfpdt7vBDfDlOL
	wXmCEtO2bkr7YcUNXH1xi3DmeePukQcikydms4TvOVGHmZjJX3A/CR3qlLGd9P4+f0Pnqyo7Y9owE
	2ZKb1xu7CpS0sszhYvfezi0vRluXZOAow6xMCJrFV5nEL/fxY5qYhRrD7RlC6wvNTp/+KjHG5LDd0
	CmTL14T1LSl+JUvCiK2BLZWuTwosvgti5TPuxbvkG8KRMDpkwKbe/E4XUhhInXk3Jc/6ZQXMvKqAA
	UPY5ia5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAX9-00000001hgC-0DkY;
	Tue, 03 Nov 2026 09:10:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAX4-00000001heX-25kC
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 09:10:20 +0000
X-UUID: 60f6415ed76611f1acbe4559397dec65-20261103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2It4Fb8ZtDEQVDFdKm8vz5VdKvtTILOcV+7ZdHxSaH0=;
	b=tpQ5VsDYM9Bzn+Lhx6ijoxBNxCcHmcbgSySfJjxjH1Lj4bKEK4Cl9U27266fLWjXkMxES/C/36AWPAyxECf4fmZoLSwcz702UT6SnTiPWvlK0Nhx87JV2IWgnvlYr4HXP1POPZaRpqH3Xggup1Tdu+ODX84aUWOs1fUPBaaENts=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:28072fef-b65e-4b6a-923c-10ee11eed6f0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:32557ccd-04bc-4c99-a904-b11b369fe16d,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 60f6415ed76611f1acbe4559397dec65-20261103
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2085944524; Tue, 03 Nov 2026 02:10:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Nov 2026 17:10:11 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Nov 2026 17:10:11 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Evan-ym.Li@mediatek.com>, <jb.tsai@mediatek.com>,
	Yin-Ming Li <evan-ym.li@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: mt7921: quiesce work before unregistering
Date: Tue, 3 Nov 2026 17:10:08 +0800
Message-ID: <20261103091010.1148974-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_011018_574595_D9D3A98D 
X-CRM114-Status: GOOD (  19.93  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yin-Ming Li <evan-ym.li@mediatek.com>

An MT76_REMOVED check alone cannot synchronize an accepted MCU event
with removal. A handler can pass the check and then arm scan, coredump or
ROC activity after the corresponding consumer has been cancelled.

Serialize unsolicited event side effects with a teardown gate. Leave
command responses outside this gate. Preserve event delivery during
firmware initialization, which precedes hardware registration: the gate
uses a dedicated stop flag and retains the existing REMOVED check rather
than requiring MT76_STATE_REGISTERED. Use GFP_ATOMIC for RSSI notifications
from the atomic event dispatch path.

Add a common MT7921 unregister helper that drains initialization, closes
the event gate and disables reset, MAC and PM work before unregistering
mac80211. Shut down the ROC timer and drain its work after closing the
event producer. Work disabling rejects late queue attempts from bus
workers and NAPI, whereas cancellation alone does not.

Keep the bus and PM wake path operational while draining work that needs
them. Then disable PM work and park the TX worker. Request driver ownership
under the PM mutex and set pm->suspended to suppress power-save scheduling
before entering mac80211 teardown. If ownership acquisition succeeds,
teardown commands can run without the disabled PM wake work. The bus
implementations log ownership failures and removal continues best-effort.

Clear MT76_STATE_REGISTERED before entering mac80211 so the state reflects
unregistration. Bus drivers still have to stop their asynchronous
producers. The following patches wire the helper into PCIe and SDIO
removal; the existing reset-work REMOVED guards remain in place.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Yin-Ming Li <evan-ym.li@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c      |  8 +++--
 drivers/net/wireless/mediatek/mt76/mt7921/init.c   | 35 +++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    | 36 ++++++++++------------
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h        |  3 ++
 5 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index f92277770488aaca2a186a88fcd279086b9ee0f3..be8cd122cc04b904ccc1e413df9717e03be94a15 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -602,7 +602,7 @@ void mt76_unregister_phy(struct mt76_phy *phy)
 {
 	struct mt76_dev *dev = phy->dev;
 
-	if (!test_bit(MT76_STATE_REGISTERED, &phy->state))
+	if (!test_and_clear_bit(MT76_STATE_REGISTERED, &phy->state))
 		return;
 
 	if (IS_ENABLED(CONFIG_MT76_LEDS))
@@ -808,7 +808,11 @@ void mt76_unregister_device(struct mt76_dev *dev)
 {
 	struct ieee80211_hw *hw = dev->hw;
 
-	if (!test_bit(MT76_STATE_REGISTERED, &dev->phy.state))
+	/*
+	 * Publish the unregistering state before entering mac80211.
+	 * Drivers must separately quiesce their asynchronous work producers.
+	 */
+	if (!test_and_clear_bit(MT76_STATE_REGISTERED, &dev->phy.state))
 		return;
 
 	if (IS_ENABLED(CONFIG_MT76_LEDS))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 49be2fa4e3fa178e03764fb03c627413b8967c86..7ceb6c5894d0d5539fd7580be17250b0cf4d3535 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -167,6 +167,40 @@ static void mt7921_init_work(struct work_struct *work)
 	mt76_connac_mcu_set_deep_sleep(&dev->mt76, dev->pm.ds_enable);
 }
 
+void mt7921_unregister_device(struct mt792x_dev *dev)
+{
+	struct mt76_connac_pm *pm = &dev->pm;
+
+	cancel_work_sync(&dev->init_work);
+
+	/* Wait for accepted events and reject new unsolicited events. */
+	spin_lock_bh(&dev->mcu_event_lock);
+	dev->mcu_events_stopped = true;
+	spin_unlock_bh(&dev->mcu_event_lock);
+
+	/* Keep the bus and PM wake path available while running work drains. */
+	disable_work_sync(&dev->reset_work);
+	disable_delayed_work_sync(&dev->mphy.mac_work);
+	cancel_delayed_work_sync(&dev->phy.scan_work);
+	timer_shutdown_sync(&dev->phy.roc_timer);
+	cancel_work_sync(&dev->phy.roc_work);
+
+	/* Stop PM producers before mac80211 tears down its queues. */
+	disable_delayed_work_sync(&pm->ps_work);
+	mt76_worker_disable(&dev->mt76.tx_worker);
+	disable_work_sync(&pm->wake_work);
+
+	/* Keep the device awake for teardown commands without PM work. */
+	mutex_lock(&pm->mutex);
+	__mt792x_mcu_drv_pmctrl(dev);
+	mutex_unlock(&pm->mutex);
+	wake_up(&pm->wait);
+	pm->suspended = true;
+
+	mt76_unregister_device(&dev->mt76);
+}
+EXPORT_SYMBOL_GPL(mt7921_unregister_device);
+
 int mt7921_register_device(struct mt792x_dev *dev)
 {
 	struct ieee80211_hw *hw = mt76_hw(dev);
@@ -177,6 +211,7 @@ int mt7921_register_device(struct mt792x_dev *dev)
 	dev->mt76.phy.priv = &dev->phy;
 	dev->mt76.tx_worker.fn = mt792x_tx_worker;
 
+	spin_lock_init(&dev->mcu_event_lock);
 	INIT_DELAYED_WORK(&dev->pm.ps_work, mt792x_pm_power_save_work);
 	INIT_WORK(&dev->pm.wake_work, mt792x_pm_wake_work);
 	spin_lock_init(&dev->pm.wake.lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 4e85b7644a9945f966ecf2fa12d17d2333533a0c..78328838abe583fdaad12d3eec97a7bf8dfff73a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -276,7 +276,7 @@ mt7921_mcu_rssi_monitor_iter(void *priv, u8 *mac,
 	else
 		nl_event = NL80211_CQM_RSSI_THRESHOLD_EVENT_LOW;
 
-	ieee80211_cqm_rssi_notify(vif, nl_event, rssi, GFP_KERNEL);
+	ieee80211_cqm_rssi_notify(vif, nl_event, rssi, GFP_ATOMIC);
 }
 
 static void
@@ -297,14 +297,11 @@ mt7921_mcu_rx_unsolicited_event(struct mt792x_dev *dev, struct sk_buff *skb)
 {
 	struct mt76_connac2_mcu_rxd *rxd;
 
-	/* See mt7921_mcu_uni_rx_unsolicited_event(). MCU_EVENT_SCAN_DONE and
-	 * MCU_EVENT_COREDUMP in particular arm scan_work and coredump.work
-	 * after mt7921s_unregister_device() has already cancelled them.
-	 */
-	if (test_bit(MT76_REMOVED, &dev->mphy.state)) {
-		dev_kfree_skb(skb);
-		return;
-	}
+	/* Serialize event side effects with mt7921_unregister_device(). */
+	spin_lock_bh(&dev->mcu_event_lock);
+	if (dev->mcu_events_stopped ||
+	    test_bit(MT76_REMOVED, &dev->mphy.state))
+		goto free_skb;
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
 	switch (rxd->eid) {
@@ -314,7 +311,7 @@ mt7921_mcu_rx_unsolicited_event(struct mt792x_dev *dev, struct sk_buff *skb)
 	case MCU_EVENT_SCHED_SCAN_DONE:
 	case MCU_EVENT_SCAN_DONE:
 		mt7921_mcu_scan_event(dev, skb);
-		return;
+		goto out;
 	case MCU_EVENT_DBG_MSG:
 		mt7921_mcu_debug_msg_event(dev, skb);
 		break;
@@ -322,7 +319,7 @@ mt7921_mcu_rx_unsolicited_event(struct mt792x_dev *dev, struct sk_buff *skb)
 		dev->fw_assert = true;
 		mt76_connac_mcu_coredump_event(&dev->mt76, skb,
 					       &dev->coredump);
-		return;
+		goto out;
 	case MCU_EVENT_LP_INFO:
 		mt7921_mcu_low_power_event(dev, skb);
 		break;
@@ -335,7 +332,10 @@ mt7921_mcu_rx_unsolicited_event(struct mt792x_dev *dev, struct sk_buff *skb)
 	default:
 		break;
 	}
+free_skb:
 	dev_kfree_skb(skb);
+out:
+	spin_unlock_bh(&dev->mcu_event_lock);
 }
 
 static void
@@ -344,14 +344,10 @@ mt7921_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 {
 	struct mt76_connac2_mcu_rxd *rxd;
 
-	/* Every handler below either calls into mac80211 or arms a work item or
-	 * timer that does. mac80211 is already unregistered once the device is
-	 * being removed, so drop the event instead.
-	 */
-	if (test_bit(MT76_REMOVED, &dev->mphy.state)) {
-		dev_kfree_skb(skb);
-		return;
-	}
+	spin_lock_bh(&dev->mcu_event_lock);
+	if (dev->mcu_events_stopped ||
+	    test_bit(MT76_REMOVED, &dev->mphy.state))
+		goto out;
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
 
@@ -362,6 +358,8 @@ mt7921_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 	default:
 		break;
 	}
+out:
+	spin_unlock_bh(&dev->mcu_event_lock);
 	dev_kfree_skb(skb);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index fb8654b7c5e7e713abbb989e3fee15dc93c20e2a..1a3c25cb30eeb6ae8321cc072adebed351722eca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -260,6 +260,7 @@ mt7921_l1_rmw(struct mt792x_dev *dev, u32 addr, u32 mask, u32 val)
 #define mt7921_l1_set(dev, addr, val)	mt7921_l1_rmw(dev, addr, 0, val)
 #define mt7921_l1_clear(dev, addr, val)	mt7921_l1_rmw(dev, addr, val, 0)
 
+void mt7921_unregister_device(struct mt792x_dev *dev);
 int mt7921_mac_init(struct mt792x_dev *dev);
 bool mt7921_mac_wtbl_update(struct mt792x_dev *dev, int idx, u32 mask);
 int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 9567ff883b285145552e1367233cb76a077e11ad..f515e091dad64c7d21540cf9729107087a359b74 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -323,6 +323,9 @@ struct mt792x_dev {
 
 	struct mt76_connac_pm pm;
 	struct mt76_connac_coredump coredump;
+	/* MT7921 unsolicited event dispatch versus unregister. */
+	spinlock_t mcu_event_lock;
+	bool mcu_events_stopped;
 	const struct mt792x_hif_ops *hif_ops;
 	const struct mt792x_irq_map *irq_map;
 	const struct mt792x_pcie_reg *pcie_reg;
-- 
2.43.0

