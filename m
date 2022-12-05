Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F00AC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yOdJkHXmlf9Lo+zMbG8Zssa6N7V/zjkVXVmv/RQQQgA=; b=0d/zBWZ8ER7ckUWjasz5tZeD3x
	k9JIwysu+Yxevj17Aq4g8bHjjoHULsNbH8uNe1nNsFzAwzkhnGvnYgYWWN9htGDeLOjYEVyYlR+hM
	JqSixztI3Cs9pG/FQD0TvUHayB23lHRrS3CGHns/AhfD9wvVSHTqkj5uQA0yfNDUlvuveM2YBZpre
	RKzDbvZxvwR+tJazXam2rdV4IjswGWVSEBwio6nGYFt6UATfiMj3S3Kz6ye3TILOadA9Y4WcPpQBX
	1ykO3YSuIFJfaoYaqSIuoS0Y89fFgmVz3QGP53x+aR/dZvWZ1+RbvGsfKuRZfeRX9s6mzLP0txGo9
	UHYj5P5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p29ki-001oOC-PX; Mon, 05 Dec 2022 11:35:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p29kf-001oHG-CR
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 11:35:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D5760B80D5D;
	Mon,  5 Dec 2022 11:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C55C433D6;
	Mon,  5 Dec 2022 11:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670240110;
	bh=Lj6dwU5BZRCjcAY9HTuby+KuQF+/ZqRDG+Iz9UV3slo=;
	h=From:To:Cc:Subject:Date:From;
	b=GZ5lreGuFdoN6wsfaPidKv0w/j7CWR62b7+vButeKmIMW55iHpONdfa1XrNTnbT7h
	 fwJq+6i2x9sxjUYaBf5DGu4vk4ZRcVw/Uf84DEbSAD4+NK7/8Nut8PZrv9bGsBhfUF
	 gyogaUTevoEV5WgvBhFyiJmDE283PZyhqFCVF4Rd/+kSS5LuBLL3K5C38F1S7bKQVE
	 v18q5C+7n9JVU8sSJXW9wuhZIzXv+eYQNOX2H64BQehkEqSLe1Zq3AqpPeYnwc8oCN
	 iF9O8AqRmuQaPkPYUMBJUHxG7qQ2ijfZ+tQ6dEl95IBjoPTHplyfJxG2END8HPl+Cf
	 9UIbLdle6w1zg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	leon@kernel.org,
	sujuan.chen@mediatek.com
Subject: [PATCH v2 net-next] net: ethernet: mtk_wed: add reset to rx_ring_setup callback
Date: Mon,  5 Dec 2022 12:34:42 +0100
Message-Id: <29c6e7a5469e784406cf3e2920351d1207713d05.1670239984.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_033513_752325_D8951DAE 
X-CRM114-Status: GOOD (  13.79  )
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

This patch adds reset parameter to mtk_wed_rx_ring_setup signature
in order to align rx_ring_setup callback to tx_ring_setup one introduced
in 'commit 23dca7a90017 ("net: ethernet: mtk_wed: add reset to
tx_ring_setup callback")'

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes since v1:
- update commit message
---
 drivers/net/ethernet/mediatek/mtk_wed.c  | 20 +++++++++++++-------
 drivers/net/wireless/mediatek/mt76/dma.c |  2 +-
 include/linux/soc/mediatek/mtk_wed.h     |  8 ++++----
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 2ce9fbb1c66d..a6271449617f 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1218,7 +1218,8 @@ mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 }
 
 static int
-mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size)
+mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
+			   bool reset)
 {
 	u32 desc_size = sizeof(struct mtk_wdma_desc) * dev->hw->version;
 	struct mtk_wed_ring *wdma;
@@ -1227,8 +1228,8 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size)
 		return -EINVAL;
 
 	wdma = &dev->tx_wdma[idx];
-	if (mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE, desc_size,
-			       true))
+	if (!reset && mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE,
+					 desc_size, true))
 		return -ENOMEM;
 
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_BASE,
@@ -1238,6 +1239,9 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size)
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
 
+	if (reset)
+		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
+
 	if (!idx)  {
 		wed_w32(dev, MTK_WED_WDMA_RING_TX + MTK_WED_RING_OFS_BASE,
 			wdma->desc_phys);
@@ -1579,18 +1583,20 @@ mtk_wed_txfree_ring_setup(struct mtk_wed_device *dev, void __iomem *regs)
 }
 
 static int
-mtk_wed_rx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs)
+mtk_wed_rx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs,
+		      bool reset)
 {
 	struct mtk_wed_ring *ring = &dev->rx_ring[idx];
 
 	if (WARN_ON(idx >= ARRAY_SIZE(dev->rx_ring)))
 		return -EINVAL;
 
-	if (mtk_wed_ring_alloc(dev, ring, MTK_WED_RX_RING_SIZE,
-			       sizeof(*ring->desc), false))
+	if (!reset && mtk_wed_ring_alloc(dev, ring, MTK_WED_RX_RING_SIZE,
+					 sizeof(*ring->desc), false))
 		return -ENOMEM;
 
-	if (mtk_wed_wdma_tx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE))
+	if (mtk_wed_wdma_tx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE,
+				       reset))
 		return -ENOMEM;
 
 	ring->reg_base = MTK_WED_RING_RX_DATA(idx);
diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 3f8c0845fcca..f795548562f5 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -648,7 +648,7 @@ mt76_dma_wed_setup(struct mt76_dev *dev, struct mt76_queue *q)
 			q->wed_regs = wed->txfree_ring.reg_base;
 		break;
 	case MT76_WED_Q_RX:
-		ret = mtk_wed_device_rx_ring_setup(wed, ring, q->regs);
+		ret = mtk_wed_device_rx_ring_setup(wed, ring, q->regs, false);
 		if (!ret)
 			q->wed_regs = wed->rx_ring[ring].reg_base;
 		break;
diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/mediatek/mtk_wed.h
index beb190449704..a0746d4aec20 100644
--- a/include/linux/soc/mediatek/mtk_wed.h
+++ b/include/linux/soc/mediatek/mtk_wed.h
@@ -160,7 +160,7 @@ struct mtk_wed_ops {
 	int (*tx_ring_setup)(struct mtk_wed_device *dev, int ring,
 			     void __iomem *regs, bool reset);
 	int (*rx_ring_setup)(struct mtk_wed_device *dev, int ring,
-			     void __iomem *regs);
+			     void __iomem *regs, bool reset);
 	int (*txfree_ring_setup)(struct mtk_wed_device *dev,
 				 void __iomem *regs);
 	int (*msg_update)(struct mtk_wed_device *dev, int cmd_id,
@@ -228,8 +228,8 @@ mtk_wed_get_rx_capa(struct mtk_wed_device *dev)
 	(_dev)->ops->irq_get(_dev, _mask)
 #define mtk_wed_device_irq_set_mask(_dev, _mask) \
 	(_dev)->ops->irq_set_mask(_dev, _mask)
-#define mtk_wed_device_rx_ring_setup(_dev, _ring, _regs) \
-	(_dev)->ops->rx_ring_setup(_dev, _ring, _regs)
+#define mtk_wed_device_rx_ring_setup(_dev, _ring, _regs, _reset) \
+	(_dev)->ops->rx_ring_setup(_dev, _ring, _regs, _reset)
 #define mtk_wed_device_ppe_check(_dev, _skb, _reason, _hash) \
 	(_dev)->ops->ppe_check(_dev, _skb, _reason, _hash)
 #define mtk_wed_device_update_msg(_dev, _id, _msg, _len) \
@@ -249,7 +249,7 @@ static inline bool mtk_wed_device_active(struct mtk_wed_device *dev)
 #define mtk_wed_device_reg_write(_dev, _reg, _val) do {} while (0)
 #define mtk_wed_device_irq_get(_dev, _mask) 0
 #define mtk_wed_device_irq_set_mask(_dev, _mask) do {} while (0)
-#define mtk_wed_device_rx_ring_setup(_dev, _ring, _regs) -ENODEV
+#define mtk_wed_device_rx_ring_setup(_dev, _ring, _regs, _reset) -ENODEV
 #define mtk_wed_device_ppe_check(_dev, _skb, _reason, _hash)  do {} while (0)
 #define mtk_wed_device_update_msg(_dev, _id, _msg, _len) -ENODEV
 #define mtk_wed_device_stop(_dev) do {} while (0)
-- 
2.38.1


