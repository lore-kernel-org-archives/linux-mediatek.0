Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B88C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 23:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC90661288
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 23:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC90661288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyOpt8QHFOzzmQjxiDZrVT4YEnGmdC51U4IL2F1T5I4=; b=frrEGCLJtZdDF1
	vzzOjfgAT5xPP3Bk/+q9PXCrs/K+350ETpwIQeO6Yf75yr0q0c04E8dUoSg48v+HZnpFhNSnypDco
	AGLidtzS/pCq1fxcB46XmndZBYUOxSI3cd8Ufn/8bKZw+lhT215FVpD7snj+COWHz43z5hJ/Rqnjb
	FDGt+xOu9In6xFvazPDH80MHOpubRp5f05++4F6Fa/vqYkNW9dWJOIm2+osjk2tYNbJrYU+24TAjG
	kNATVBCFEFc1wTnsGrtlwvYAxtDup6eQ8wg3mQBVHkk1Fo1IgSW9OL1X3YwRDnSfDo7JRhM4Ciu+p
	zlERWnprdc/HHfWHIN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW5sz-00GBGQ-7E; Thu, 30 Sep 2021 23:54:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW5sv-00GBDs-Cb
 for linux-mediatek@lists.infradead.org; Thu, 30 Sep 2021 23:54:42 +0000
X-UUID: ea30c18b6c2548b5858502ceea0b546c-20210930
X-UUID: ea30c18b6c2548b5858502ceea0b546c-20210930
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 359879499; Thu, 30 Sep 2021 16:54:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Sep 2021 16:48:14 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Oct 2021 07:48:14 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <shawnku@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 02/16] mt76: mt7921: refactor dma.c to be pcie specific
Date: Fri, 1 Oct 2021 07:47:49 +0800
Message-ID: <8c608c4b4569e2dba681e3c15c5aa95d4fbcf705.1632961096.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1632961096.git.objelf@gmail.com>
References: <cover.1632961096.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_165441_457567_19FA3A96 
X-CRM114-Status: GOOD (  11.32  )
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

This is a preliminary patch to introduce mt7921s support.

make dma.c be used dedicately for mt7921e.

by moving out mt7921_tx_cleanup from dma.c to mcu.c and then renaming
mt7921_tx_cleanup to refect the exact thing the function actually does.

Finally, dma.c totally become pcie specific one, only needed to
be compiled only when CONFIG_MT7921E is enabled.

Tested-by: Deren Wu <deren.wu@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/dma.c    | 8 +-------
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c    | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h | 7 ++++++-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index 802e40e42040..d3e2036a1974 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -19,12 +19,6 @@ int mt7921_init_tx_queues(struct mt7921_phy *phy, int idx, int n_desc)
 	return 0;
 }
 
-void mt7921_tx_cleanup(struct mt7921_dev *dev)
-{
-	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WM], false);
-	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WA], false);
-}
-
 static int mt7921_poll_tx(struct napi_struct *napi, int budget)
 {
 	struct mt7921_dev *dev;
@@ -37,7 +31,7 @@ static int mt7921_poll_tx(struct napi_struct *napi, int budget)
 		return 0;
 	}
 
-	mt7921_tx_cleanup(dev);
+	mt7921_mcu_tx_cleanup(dev);
 	if (napi_complete(napi))
 		mt7921_irq_enable(dev, MT_INT_TX_DONE_ALL);
 	mt76_connac_pm_unref(&dev->mphy, &dev->pm);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 0857d523bb06..eb27d8ab4a8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1386,7 +1386,7 @@ void mt7921_pm_wake_work(struct work_struct *work)
 		mt76_for_each_q_rx(&dev->mt76, i)
 			napi_schedule(&dev->mt76.napi[i]);
 		mt76_connac_pm_dequeue_skbs(mphy, &dev->pm);
-		mt7921_tx_cleanup(dev);
+		mt7921_mcu_tx_cleanup(dev);
 		if (test_bit(MT76_STATE_RUNNING, &mphy->state))
 			ieee80211_queue_delayed_work(mphy->hw, &mphy->mac_work,
 						     MT7921_WATCHDOG_TIME);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 70c0f41180a1..a6c3661b2bdd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -316,6 +316,12 @@ static inline bool mt7921_dma_need_reinit(struct mt7921_dev *dev)
 	return !mt76_get_field(dev, MT_WFDMA_DUMMY_CR, MT_WFDMA_NEED_REINIT);
 }
 
+static inline void mt7921_mcu_tx_cleanup(struct mt7921_dev *dev)
+{
+	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WM], false);
+	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WA], false);
+}
+
 int mt7921_mac_init(struct mt7921_dev *dev);
 bool mt7921_mac_wtbl_update(struct mt7921_dev *dev, int idx, u32 mask);
 void mt7921_mac_reset_counters(struct mt7921_phy *phy);
@@ -330,7 +336,6 @@ void mt7921_mac_work(struct work_struct *work);
 void mt7921_mac_reset_work(struct work_struct *work);
 void mt7921_mac_update_mib_stats(struct mt7921_phy *phy);
 void mt7921_reset(struct mt76_dev *mdev);
-void mt7921_tx_cleanup(struct mt7921_dev *dev);
 int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 			   enum mt76_txq_id qid, struct mt76_wcid *wcid,
 			   struct ieee80211_sta *sta,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
