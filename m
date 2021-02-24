Return-Path: <SRS0=l1Zb=H2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E009CC433E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 12:52:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7537964F4E
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 12:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7537964F4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rcqC0wRElhuKFxwOmdt/VZY6DgAwi0NQBzLoknW8VNg=; b=HlP3gX8+8/vlFOaAM+Spd9o9/
	SPFi9MT2WY10rMyJYSv0yLtANtzyml9YDomcGcfqPfu7+4Sj/ozHe0/d71JZPUJ5vSjJWSgp5Yilb
	oEkJSr7MIcPCkTrowg88SLi65lW4Zes00igD7hbIqNmWVbLXVmW4pyvpYWvkFmEY+LA5NAInIIhGm
	4tSNHR/YqRqv1QGJltN1tZ2ZrVpX+sbZ6nsS82k/CRwCLYWjeLlhIZh92WBdn3oMFk6nK9z/jQOC/
	JI7V9Ae9mtMf/omTTuboU4XHjrZ8j6ciGufOh8T5yMFYClellAU0AEwSFuoQSx7f+H6gDERaxMT33
	Dz+8Zxqqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEtea-0002gH-4T; Wed, 24 Feb 2021 12:52:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEteS-0002cS-63; Wed, 24 Feb 2021 12:52:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C9BD64F3C;
 Wed, 24 Feb 2021 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171143;
 bh=gOJ4KNBRe1gQ0EC8G3x8EkpMv27fqxU7e0yNcEZW3AE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H2O88S4+qn21cakRlKoitMcjaTFYP4WsM7eXWa+xZoquCr/VL4A3LCyW5MrmyyUE+
 ChA3KFIq8cZmjnKJhO4XPztkDRb6RSBu8Xo8U/lJWbSyZSfpp0g52zJjP02Xq8tgo7
 Im58/QDxGBw7bMPjlDvWhF7X7LuJSpUVFzQknTVaM8L2jSbPz71/7KXVRcyPfIo60J
 ZPcjiMPhgIvlZumb6hZQKWAxlp7P0ESnIJckiL7BUTYYDhsxYg9ZQXAOP/Jo5cLxcr
 r1yQInQNb0Mz3V5ZOEOrVP5zuff2de8ZZoareCjRCU8xYHlVdUKgOc5hVqPBkxy4Y/
 090KQLSJbhcpw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/56] mt76: mt7615: reset token when mac_reset
 happens
Date: Wed, 24 Feb 2021 07:51:24 -0500
Message-Id: <20210224125212.482485-8-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125212.482485-1-sashal@kernel.org>
References: <20210224125212.482485-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_075224_399577_B75E4D12 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: Sasha Levin <sashal@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ryder Lee <ryder.lee@mediatek.com>

[ Upstream commit a6275e934605646ef81b02d8d1164f21343149c9 ]

Reset token in mt7615_mac_reset_work() to avoid possible leakege.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 20 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 +-
 .../wireless/mediatek/mt76/mt7615/pci_init.c  | 12 +----------
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 3d62fda067e44..f1f954ff46856 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2098,6 +2098,23 @@ void mt7615_dma_reset(struct mt7615_dev *dev)
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
+EXPORT_SYMBOL_GPL(mt7615_tx_token_put);
+
 void mt7615_mac_reset_work(struct work_struct *work)
 {
 	struct mt7615_phy *phy2;
@@ -2141,6 +2158,9 @@ void mt7615_mac_reset_work(struct work_struct *work)
 
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_PDMA_STOPPED);
 
+	mt7615_tx_token_put(dev);
+	idr_init(&dev->token);
+
 	if (mt7615_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
 		mt7615_dma_reset(dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 6a9f9187f76ac..5b06294d654aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -619,7 +619,7 @@ int mt7615_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 			  struct mt76_tx_info *tx_info);
 
 void mt7615_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e);
-
+void mt7615_tx_token_put(struct mt7615_dev *dev);
 void mt7615_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			 struct sk_buff *skb);
 void mt7615_sta_ps(struct mt76_dev *mdev, struct ieee80211_sta *sta, bool ps);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index 06a0f8f7bc893..7b81aef3684ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -153,9 +153,7 @@ int mt7615_register_device(struct mt7615_dev *dev)
 
 void mt7615_unregister_device(struct mt7615_dev *dev)
 {
-	struct mt76_txwi_cache *txwi;
 	bool mcu_running;
-	int id;
 
 	mcu_running = mt7615_wait_for_mcu_init(dev);
 
@@ -165,15 +163,7 @@ void mt7615_unregister_device(struct mt7615_dev *dev)
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
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
