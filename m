From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] mt76: mt7615: Make mt7615_irq_handler static
Date: Sat, 4 May 2019 18:22:47 +0800
Message-ID: <20190504102247.43720-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, royluo@google.com, kvalo@codeaurora.org, matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-mediatek@lists.infradead.org

Fix sparse warning:

drivers/net/wireless/mediatek/mt76/mt7615/pci.c:37:13:
 warning: symbol 'mt7615_irq_handler' was not declared. Should it be static?

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
index 11122bd..c181e59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
@@ -34,7 +34,7 @@ void mt7615_rx_poll_complete(struct mt76_dev *mdev, enum mt76_rxq_id q)
 	mt7615_irq_enable(dev, MT_INT_RX_DONE(q));
 }
 
-irqreturn_t mt7615_irq_handler(int irq, void *dev_instance)
+static irqreturn_t mt7615_irq_handler(int irq, void *dev_instance)
 {
 	struct mt7615_dev *dev = dev_instance;
 	u32 intr;
-- 
2.7.4
