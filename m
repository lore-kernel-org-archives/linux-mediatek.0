From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/4] mt76: add unlikely() for dma_mapping_error() check
Date: Mon, 1 Apr 2019 14:56:23 +0800
Message-ID: <3a9f54e6a5bbbdab2a3129b1b541a951e8b695fa.1554100584.git.ryder.lee@mediatek.com>
References: <cover.1554100584.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1554100584.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>
Cc: Roy Luo <royluo@google.com>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, YF Luo <yf.luo@mediatek.com>, Kai Lin <kai.lin@mediatek.com>, Rorscha Yang <rorscha.yang@mediatek.com>, Kyle Lee <kyle.lee@mediatek.com>, Miller Shen <miller.shen@mediatek.com>, Haipin Liang <haipin.liang@mediatek.com>, KL Huang <kl.huang@mediatek.com>, YH chen <yh.chen@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

In the tx/rx fastpath, the funciton dma_map_single() rarely fails.
This adds unlikely() optimization to this error check conditional.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 8a4b935..6f3ef09 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -272,7 +272,7 @@
 
 	addr = dma_map_single(dev->dev, skb->data, skb->len,
 			      DMA_TO_DEVICE);
-	if (dma_mapping_error(dev->dev, addr))
+	if (unlikely(dma_mapping_error(dev->dev, addr)))
 		return -ENOMEM;
 
 	buf.addr = addr;
@@ -315,7 +315,7 @@
 
 	len = skb_headlen(skb);
 	addr = dma_map_single(dev->dev, skb->data, len, DMA_TO_DEVICE);
-	if (dma_mapping_error(dev->dev, addr))
+	if (unlikely(dma_mapping_error(dev->dev, addr)))
 		goto free;
 
 	tx_info.buf[n].addr = t->dma_addr;
@@ -329,7 +329,7 @@
 
 		addr = dma_map_single(dev->dev, iter->data, iter->len,
 				      DMA_TO_DEVICE);
-		if (dma_mapping_error(dev->dev, addr))
+		if (unlikely(dma_mapping_error(dev->dev, addr)))
 			goto unmap;
 
 		tx_info.buf[n].addr = addr;
@@ -386,7 +386,7 @@
 			break;
 
 		addr = dma_map_single(dev->dev, buf, len, DMA_FROM_DEVICE);
-		if (dma_mapping_error(dev->dev, addr)) {
+		if (unlikely(dma_mapping_error(dev->dev, addr))) {
 			skb_free_frag(buf);
 			break;
 		}
-- 
1.9.1
