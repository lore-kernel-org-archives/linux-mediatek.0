Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEB1C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 20:39:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 501F023C85
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 20:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 501F023C85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ynSqZ4TJq37qXuBatB8UQKhNo6KwhWOxWunAE4R2ybk=; b=m1KD6NfE21V0uM9YzgiLsInVQ
	Grid+yHzhxTzo1Q4fkdWn6p2H1TitKkBltayPENFj4AQ/BINwNwnV400GFfT7/ZGVh/F4SxAKjV14
	hn7eqDOjDTIsxFxOkhwzDKsaPly1abDM5Oq7A4ZiH26ddg2KEAwViJtegKT64/bOEoBdAB5Sb/1nX
	ttIBqKPGu9rAOSzi0NaaOFjDBX5OhBtD6H0Wg9uG7/YtkF6z3WLDpI7quju9WR75KcQMWcoQzfl0M
	1nd5HohPzVvTrEOVZkbL02ZoF5LlVuolUZ/HJXVd5xfQoldFZa25ALEdTW/PrKMQpF3XwfwUNSu4V
	yZdq5V4Yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn6FB-0007Z6-Pd; Wed, 09 Dec 2020 20:39:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn6F9-0007Y4-4D
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 20:39:24 +0000
X-UUID: a8bf5a684522471c9266ba55db99a790-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MczkTOY2lsiE2Q7cw2q+whVS/dDiNImasRIOCkf9Y5s=; 
 b=PyKkFqqmLwgd3TvkIqEOvi9aRjHr0KQgpyGgynXk90QIXGDRCKrOF8t1Wri66poSTvDHVnKI2iRmtTvoldp+z8Rle7dgG3Ide+8/64zL8ZtUBuo7nOyIJ+g7GOBQY8mVKnuzkXhejqrghWeg5aMwno6O87Yjc9m4dUgLWOHvf5Y=;
X-UUID: a8bf5a684522471c9266ba55db99a790-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2147092641; Wed, 09 Dec 2020 12:39:18 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 12:29:15 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 04:29:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Dec 2020 04:29:02 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 2/2] mt76: mt7615: reset token when mac_reset happens
Date: Thu, 10 Dec 2020 04:28:58 +0800
Message-ID: <ec08a926e11e74bb590e57b3705c9f1d135dd191.1607542812.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <69d62cd40ae52e0ddd5b26ba96bc7480385585a5.1607542812.git.ryder.lee@mediatek.com>
References: <69d62cd40ae52e0ddd5b26ba96bc7480385585a5.1607542812.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_153923_372966_869D34AF 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reset token in mt7615_mac_reset_work() to avoid possible leakege.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - rebase on top of latest codebase
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 19 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 +-
 .../wireless/mediatek/mt76/mt7615/pci_init.c  | 12 +-----------
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 0f360be0b885..1b4986dd3baa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2058,6 +2058,22 @@ void mt7615_dma_reset(struct mt7615_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt7615_dma_reset);
 
+void mt7615_tx_token_put(struct mt7615_dev *dev)
+{
+	struct mt76_txwi_cache *txwi;
+	int id;
+
+	spin_lock_bh(&dev->token_lock);
+	idr_for_each_entry(&dev->token, txwi, id) {
+		mt7615_txp_skb_unmap(&dev->mt76, txwi);
+		if (txwi->skb)
+			dev_kfree_skb_any(txwi->skb);
+		mt76_put_txwi(&dev->mt76, txwi);
+	}
+	spin_unlock_bh(&dev->token_lock);
+	idr_destroy(&dev->token);
+}
+
 void mt7615_mac_reset_work(struct work_struct *work)
 {
 	struct mt7615_phy *phy2;
@@ -2101,6 +2117,9 @@ void mt7615_mac_reset_work(struct work_struct *work)
 
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_PDMA_STOPPED);
 
+	mt7615_tx_token_put(dev);
+	idr_init(&dev->token);
+
 	if (mt7615_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
 		mt7615_dma_reset(dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 99b8abdbb08f..50e729906fa9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -583,7 +583,7 @@ int mt7615_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 			  struct mt76_tx_info *tx_info);
 
 void mt7615_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e);
-
+void mt7615_tx_token_put(struct mt7915_dev *dev);
 void mt7615_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			 struct sk_buff *skb);
 void mt7615_sta_ps(struct mt76_dev *mdev, struct ieee80211_sta *sta, bool ps);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index 27fcb1374685..58a0ec1bf8d7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -160,9 +160,7 @@ int mt7615_register_device(struct mt7615_dev *dev)
 
 void mt7615_unregister_device(struct mt7615_dev *dev)
 {
-	struct mt76_txwi_cache *txwi;
 	bool mcu_running;
-	int id;
 
 	mcu_running = mt7615_wait_for_mcu_init(dev);
 
@@ -172,15 +170,7 @@ void mt7615_unregister_device(struct mt7615_dev *dev)
 		mt7615_mcu_exit(dev);
 	mt7615_dma_cleanup(dev);
 
-	spin_lock_bh(&dev->token_lock);
-	idr_for_each_entry(&dev->token, txwi, id) {
-		mt7615_txp_skb_unmap(&dev->mt76, txwi);
-		if (txwi->skb)
-			dev_kfree_skb_any(txwi->skb);
-		mt76_put_txwi(&dev->mt76, txwi);
-	}
-	spin_unlock_bh(&dev->token_lock);
-	idr_destroy(&dev->token);
+	mt7615_tx_token_put(dev);
 
 	tasklet_disable(&dev->irq_tasklet);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
