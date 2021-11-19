Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4F6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 23:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VI3cMMukz1vAiXKrI5r8/XTNr+c+ywKUvAZodsXC3+c=; b=vo4ZNyGhhZCUvR
	R/CoPLHvrMRRePOBJAMP4OrLYovHpXeEajzeisYrR8+GYWY3Hgl/JDZKXrizu3etaBqCyOR6EpL2/
	4JIlsNJ9zVnJ2NemuTCyP/Erf8QERR9iawQMq8HDG503os0GQQXKTOQDS0NG6KWfb6GhmSfcwiZZg
	MGCVSr/PtudcnQHFjgq7f4kcgzs4pvm5OfkWeZ0eEVtlVTOjtciNNwP7/aTkPZUVRde7ICVGUDNsK
	twfMfYzjhpFvm1nGPEKRDj5m7TzaFHNOElVcxWabYfiXJ4xtjj4UTislr03AmRvZ1DW52eVvWLADN
	C/15RRFyik31mJNTl6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moDD6-00BmpW-KP; Fri, 19 Nov 2021 23:22:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moDD1-00Bmol-SI
 for linux-mediatek@lists.infradead.org; Fri, 19 Nov 2021 23:22:23 +0000
X-UUID: b11b62eb68e54fd29d73cf63e23d73c5-20211119
X-UUID: b11b62eb68e54fd29d73cf63e23d73c5-20211119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 290395825; Fri, 19 Nov 2021 16:22:16 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Nov 2021 15:22:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 20 Nov 2021 07:22:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 20 Nov 2021 07:22:13 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] mt76: mt7921: move mt76_connac_mcu_set_hif_suspend to
 bus-related files
Date: Sat, 20 Nov 2021 07:22:10 +0800
Message-ID: <92851c34c3758b7d50f3eaa24b1a27adccde2b1a.1637363831.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_152219_977959_3E32D756 
X-CRM114-Status: GOOD (  16.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

This is a preliminary patch for the following patch
("mt76: mt7921s: fix the device cannot sleep deeply in suspend).

mt76_connac_mcu_set_hif_suspend eventually would be handled in each
bus-level suspend/resume handler in either mt7921/sdio.c or mt7921/pci.c
depending on what type of the bus the device is running on. We can move
mt76_connac_mcu_set_hif_suspend to bus-related files to simplify the logic.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c   | 13 ++-----------
 .../net/wireless/mediatek/mt76/mt7921/pci.c    | 18 +++++-------------
 .../net/wireless/mediatek/mt76/mt7921/sdio.c   | 18 +++++-------------
 3 files changed, 12 insertions(+), 37 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index b144f5491798..e022251b4006 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1232,7 +1232,6 @@ static int mt7921_suspend(struct ieee80211_hw *hw,
 {
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
 	struct mt7921_phy *phy = mt7921_hw_phy(hw);
-	int err;
 
 	cancel_delayed_work_sync(&phy->scan_work);
 	cancel_delayed_work_sync(&phy->mt76->mac_work);
@@ -1250,25 +1249,18 @@ static int mt7921_suspend(struct ieee80211_hw *hw,
 					    mt76_connac_mcu_set_suspend_iter,
 					    &dev->mphy);
 
-	err = mt76_connac_mcu_set_hif_suspend(&dev->mt76, true);
-
 	mt7921_mutex_release(dev);
 
-	return err;
+	return 0;
 }
 
 static int mt7921_resume(struct ieee80211_hw *hw)
 {
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
 	struct mt7921_phy *phy = mt7921_hw_phy(hw);
-	int err;
 
 	mt7921_mutex_acquire(dev);
 
-	err = mt76_connac_mcu_set_hif_suspend(&dev->mt76, false);
-	if (err < 0)
-		goto out;
-
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 	clear_bit(MT76_STATE_SUSPEND, &phy->mt76->state);
 	ieee80211_iterate_active_interfaces(hw,
@@ -1278,11 +1270,10 @@ static int mt7921_resume(struct ieee80211_hw *hw)
 
 	ieee80211_queue_delayed_work(hw, &phy->mt76->mac_work,
 				     MT7921_WATCHDOG_TIME);
-out:
 
 	mt7921_mutex_release(dev);
 
-	return err;
+	return 0;
 }
 
 static void mt7921_set_wakeup(struct ieee80211_hw *hw, bool enabled)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 305b63fa1a8a..c29dde23d4ab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -235,7 +235,6 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	struct mt76_dev *mdev = pci_get_drvdata(pdev);
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
 	struct mt76_connac_pm *pm = &dev->pm;
-	bool hif_suspend;
 	int i, err;
 
 	pm->suspended = true;
@@ -246,12 +245,9 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	if (err < 0)
 		goto restore_suspend;
 
-	hif_suspend = !test_bit(MT76_STATE_SUSPEND, &dev->mphy.state);
-	if (hif_suspend) {
-		err = mt76_connac_mcu_set_hif_suspend(mdev, true);
-		if (err)
-			goto restore_suspend;
-	}
+	err = mt76_connac_mcu_set_hif_suspend(mdev, true);
+	if (err)
+		goto restore_suspend;
 
 	/* always enable deep sleep during suspend to reduce
 	 * power consumption
@@ -302,8 +298,7 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	if (!pm->ds_enable)
 		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
 
-	if (hif_suspend)
-		mt76_connac_mcu_set_hif_suspend(mdev, false);
+	mt76_connac_mcu_set_hif_suspend(mdev, false);
 
 restore_suspend:
 	pm->suspended = false;
@@ -356,10 +351,7 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
 	if (!pm->ds_enable)
 		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
 
-	if (!test_bit(MT76_STATE_SUSPEND, &dev->mphy.state))
-		err = mt76_connac_mcu_set_hif_suspend(mdev, false);
-
-	return err;
+	return mt76_connac_mcu_set_hif_suspend(mdev, false);
 }
 #endif /* CONFIG_PM */
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index ddf0eeb8b688..5fee489c7a99 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -203,7 +203,6 @@ static int mt7921s_suspend(struct device *__dev)
 	struct mt7921_dev *dev = sdio_get_drvdata(func);
 	struct mt76_connac_pm *pm = &dev->pm;
 	struct mt76_dev *mdev = &dev->mt76;
-	bool hif_suspend;
 	int err;
 
 	pm->suspended = true;
@@ -214,12 +213,9 @@ static int mt7921s_suspend(struct device *__dev)
 	if (err < 0)
 		goto restore_suspend;
 
-	hif_suspend = !test_bit(MT76_STATE_SUSPEND, &dev->mphy.state);
-	if (hif_suspend) {
-		err = mt76_connac_mcu_set_hif_suspend(mdev, true);
-		if (err)
-			goto restore_suspend;
-	}
+	err = mt76_connac_mcu_set_hif_suspend(mdev, true);
+	if (err)
+		goto restore_suspend;
 
 	/* always enable deep sleep during suspend to reduce
 	 * power consumption
@@ -253,8 +249,7 @@ static int mt7921s_suspend(struct device *__dev)
 	if (!pm->ds_enable)
 		mt76_connac_mcu_set_deep_sleep(mdev, false);
 
-	if (hif_suspend)
-		mt76_connac_mcu_set_hif_suspend(mdev, false);
+	mt76_connac_mcu_set_hif_suspend(mdev, false);
 
 restore_suspend:
 	pm->suspended = false;
@@ -285,10 +280,7 @@ static int mt7921s_resume(struct device *__dev)
 	if (!pm->ds_enable)
 		mt76_connac_mcu_set_deep_sleep(mdev, false);
 
-	if (!test_bit(MT76_STATE_SUSPEND, &dev->mphy.state))
-		err = mt76_connac_mcu_set_hif_suspend(mdev, false);
-
-	return err;
+	return mt76_connac_mcu_set_hif_suspend(mdev, false);
 }
 
 static const struct dev_pm_ops mt7921s_pm_ops = {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
