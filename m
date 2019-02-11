From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: change the retun type of mt76_dma_attach()
Date: Mon, 11 Feb 2019 10:13:41 +0800
Message-ID: <228fdddb9ca96e8ce861e324eb9039722cf18f49.1549850911.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@codeaurora.org>
Cc: Roy Luo <roychl666@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

There is no need to retun 0 in mt76_dma_attach(), so switch it to void.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 3 +--
 drivers/net/wireless/mediatek/mt76/dma.h | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index e2ba263..d934d72 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -522,10 +522,9 @@ int mt76_dma_tx_queue_skb(struct mt76_dev *dev, struct mt76_queue *q,
 	.kick = mt76_dma_kick_queue,
 };
 
-int mt76_dma_attach(struct mt76_dev *dev)
+void mt76_dma_attach(struct mt76_dev *dev)
 {
 	dev->queue_ops = &mt76_dma_ops;
-	return 0;
 }
 EXPORT_SYMBOL_GPL(mt76_dma_attach);
 
diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index 357cc35..e3292df 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -54,7 +54,7 @@ enum mt76_mcu_evt_type {
 	EVT_EVENT_DFS_DETECT_RSP,
 };
 
-int mt76_dma_attach(struct mt76_dev *dev);
+void mt76_dma_attach(struct mt76_dev *dev);
 void mt76_dma_cleanup(struct mt76_dev *dev);
 
 #endif
-- 
1.9.1
