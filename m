Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFF5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:20:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9024C60EFE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9024C60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scFnl6cAka0ywbAm4Wf7MenRww2+LaAJof0ZqeGZQA4=; b=jSDOVKOaaPopD8
	HK+3wughNv6StetEInD1ol4tmfw2YGCIAJVeR8X3GE3GmDnFKf+KyZichXqC9bCgAsNy6w9ezRRoC
	2UoBPnA2NlJ+cLELepsXai3dEN7LzCkv8XuSTxs8bdjMlVj4D0qYZ8pQ777a92BhIRptaLo6hbOX3
	ibiDomSnM5E9DKky5SaTuhzuHccFex20J2g3kJBGK2YyqZkbX9RAZkfVYEFWqBIzH4pTY4JqXzPPn
	nTNkhcHlZATIDolFdu7H7QTkWo3nJtu7jX+zsRF5OGu7RWRbBWbjcOQf1wKy3bf3G9N+RARdQD+w7
	0eX9XPdKHtCa076vXqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mff6F-004PJu-CW; Wed, 27 Oct 2021 09:19:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mff69-004PEl-RH
 for linux-mediatek@lists.infradead.org; Wed, 27 Oct 2021 09:19:57 +0000
X-UUID: ee2fe9c0d3c041e8944c6105baa3b53c-20211027
X-UUID: ee2fe9c0d3c041e8944c6105baa3b53c-20211027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2062917671; Wed, 27 Oct 2021 02:19:45 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 02:09:48 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Oct 2021 16:40:34 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 27 Oct 2021 16:40:33 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH 03/11] mt76: mt7915: rework dma.c to adapt mt7916 changes
Date: Wed, 27 Oct 2021 16:40:11 +0800
Message-ID: <58513e9a0f733f892e6ad77b7656dc86a430dbf6.1635323366.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1635323366.git.Bo.Jiao@mediatek.com>
References: <cover.1635323366.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_021953_947546_E1D06722 
X-CRM114-Status: GOOD (  19.70  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

The RXQ of mt7916 are separated to MT_RXQ_MAIN_WA and MT_RXQ_MCU_WA,
which causes a hole for queue iteration so modify it accordingly.

This is an intermediate patch to add mt7916 support.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c      |  13 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   4 +-
 .../net/wireless/mediatek/mt76/mt7915/dma.c   | 383 ++++++++++++------
 .../net/wireless/mediatek/mt76/mt7915/init.c  |   9 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |   4 +
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  42 +-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   3 +-
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  60 ++-
 8 files changed, 365 insertions(+), 153 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 5e1c150..3cc1acf 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -93,7 +93,7 @@ mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q)
 {
 	int i;
 
-	if (!q)
+	if (!q || !q->ndesc)
 		return;
 
 	/* clear descriptors */
@@ -233,7 +233,7 @@ mt76_dma_tx_cleanup(struct mt76_dev *dev, struct mt76_queue *q, bool flush)
 	struct mt76_queue_entry entry;
 	int last;
 
-	if (!q)
+	if (!q || !q->ndesc)
 		return;
 
 	spin_lock_bh(&q->cleanup_lock);
@@ -448,6 +448,9 @@ mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q)
 	int len = SKB_WITH_OVERHEAD(q->buf_size);
 	int offset = q->buf_offset;
 
+	if (!q->ndesc)
+		return 0;
+
 	spin_lock_bh(&q->lock);
 
 	while (q->queued < q->ndesc - 1) {
@@ -484,6 +487,9 @@ mt76_dma_rx_cleanup(struct mt76_dev *dev, struct mt76_queue *q)
 	void *buf;
 	bool more;
 
+	if (!q->ndesc)
+		return;
+
 	spin_lock_bh(&q->lock);
 	do {
 		buf = mt76_dma_dequeue(dev, q, true, NULL, NULL, &more);
@@ -508,6 +514,9 @@ mt76_dma_rx_reset(struct mt76_dev *dev, enum mt76_rxq_id qid)
 	struct mt76_queue *q = &dev->q_rx[qid];
 	int i;
 
+	if (!q->ndesc)
+		return;
+
 	for (i = 0; i < q->ndesc; i++)
 		q->desc[i].ctrl = cpu_to_le32(MT_DMA_CTL_DMA_DONE);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e2da720..ce687d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -85,6 +85,7 @@ enum mt76_rxq_id {
 	MT_RXQ_MCU_WA,
 	MT_RXQ_EXT,
 	MT_RXQ_EXT_WA,
+	MT_RXQ_MAIN_WA,
 	__MT_RXQ_MAX
 };
 
@@ -892,8 +893,7 @@ static inline u16 mt76_rev(struct mt76_dev *dev)
 #define mt76_queue_reset(dev, ...)	(dev)->mt76.queue_ops->reset_q(&((dev)->mt76), __VA_ARGS__)
 
 #define mt76_for_each_q_rx(dev, i)	\
-	for (i = 0; i < ARRAY_SIZE((dev)->q_rx) && \
-		    (dev)->q_rx[i].ndesc; i++)
+	for (i = 0; i < ARRAY_SIZE((dev)->q_rx); i++)
 
 struct mt76_dev *mt76_alloc_device(struct device *pdev, unsigned int size,
 				   const struct ieee80211_ops *ops,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index ad9678b..4f236d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -44,31 +44,52 @@ static int mt7915_poll_tx(struct napi_struct *napi, int budget)
 static void __mt7915_dma_prefetch(struct mt7915_dev *dev, u32 ofs)
 {
 #define PREFETCH(base, depth)	((base) << 16 | (depth))
-
-	mt76_wr(dev, MT_WFDMA0_RX_RING0_EXT_CTRL + ofs, PREFETCH(0x0, 0x4));
-	mt76_wr(dev, MT_WFDMA0_RX_RING1_EXT_CTRL + ofs, PREFETCH(0x40, 0x4));
-	mt76_wr(dev, MT_WFDMA0_RX_RING2_EXT_CTRL + ofs, PREFETCH(0x80, 0x0));
-
-	mt76_wr(dev, MT_WFDMA1_TX_RING0_EXT_CTRL + ofs, PREFETCH(0x80, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING1_EXT_CTRL + ofs, PREFETCH(0xc0, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING2_EXT_CTRL + ofs, PREFETCH(0x100, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING3_EXT_CTRL + ofs, PREFETCH(0x140, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING4_EXT_CTRL + ofs, PREFETCH(0x180, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING5_EXT_CTRL + ofs, PREFETCH(0x1c0, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING6_EXT_CTRL + ofs, PREFETCH(0x200, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING7_EXT_CTRL + ofs, PREFETCH(0x240, 0x4));
-
-	mt76_wr(dev, MT_WFDMA1_TX_RING16_EXT_CTRL + ofs, PREFETCH(0x280, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING17_EXT_CTRL + ofs, PREFETCH(0x2c0, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING18_EXT_CTRL + ofs, PREFETCH(0x300, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING19_EXT_CTRL + ofs, PREFETCH(0x340, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING20_EXT_CTRL + ofs, PREFETCH(0x380, 0x4));
-	mt76_wr(dev, MT_WFDMA1_TX_RING21_EXT_CTRL + ofs, PREFETCH(0x3c0, 0x0));
-
-	mt76_wr(dev, MT_WFDMA1_RX_RING0_EXT_CTRL + ofs, PREFETCH(0x3c0, 0x4));
-	mt76_wr(dev, MT_WFDMA1_RX_RING1_EXT_CTRL + ofs, PREFETCH(0x400, 0x4));
-	mt76_wr(dev, MT_WFDMA1_RX_RING2_EXT_CTRL + ofs, PREFETCH(0x440, 0x4));
-	mt76_wr(dev, MT_WFDMA1_RX_RING3_EXT_CTRL + ofs, PREFETCH(0x480, 0x0));
+	struct mt76_dev *mdev = &dev->mt76;
+	u32 base_ofs = 0;
+
+	/* prefetch SRAM wrapping boundary for tx/rx ring. */
+	mt76_wr(dev, MT_WFDMA_TX_RING_EXT_CTRL_FWDL + ofs,
+		PREFETCH(0x0, 0x4));
+	mt76_wr(dev, MT_WFDMA_TX_RING_EXT_CTRL_WM + ofs,
+		PREFETCH(0x40, 0x4));
+	mt76_wr(dev, MT_WFDMA_TX_RING_EXT_CTRL_BAND0 + ofs,
+		PREFETCH(0x80, 0x4));
+	mt76_wr(dev, MT_WFDMA_TX_RING_EXT_CTRL_BAND1 + ofs,
+		PREFETCH(0xc0, 0x4));
+	mt76_wr(dev, MT_WFDMA_TX_RING_EXT_CTRL_WA + ofs,
+		PREFETCH(0x100, 0x4));
+	mt76_wr(dev, MT_WFDMA1_TX_RING21_EXT_CTRL + ofs,
+		PREFETCH(0x140, 0x0));
+
+	mt76_wr(dev, MT_WFDMA_RX_RING_EXT_CTRL_WM + ofs,
+		PREFETCH(0x140, 0x4));
+	if (!is_mt7915(mdev)) {
+		mt76_wr(dev, MT_WFDMA_RX_RING_EXT_CTRL_WA + ofs,
+			PREFETCH(0x180, 0x4));
+		base_ofs = 0x40;
+	}
+	mt76_wr(dev, MT_WFDMA_RX_RING_EXT_CTRL_STS0 + ofs,
+		PREFETCH(0x180 + base_ofs, 0x4));
+	mt76_wr(dev, MT_WFDMA_RX_RING_EXT_CTRL_STS1 + ofs,
+		PREFETCH(0x1c0 + base_ofs, 0x4));
+	mt76_wr(dev, MT_WFDMA_RX_RING_EXT_CTRL_BAND0 + ofs,
+		PREFETCH(0x200 + base_ofs, 0x4));
+	mt76_wr(dev, MT_WFDMA_RX_RING_EXT_CTRL_BAND1 + ofs,
+		PREFETCH(0x240 + base_ofs, 0x4));
+
+	/* for mt7915, the ring which is next the last
+	 * used ring must be initialized.
+	 */
+	if (is_mt7915(mdev)) {
+		mt76_wr(dev, MT_WFDMA1_TX_RING21_EXT_CTRL + ofs,
+			PREFETCH(0x140, 0x0));
+
+		mt76_wr(dev, MT_WFDMA1_RX_RING3_EXT_CTRL + ofs,
+			PREFETCH(0x200 + base_ofs, 0x0));
+
+		mt76_wr(dev, MT_WFDMA0_RX_RING2_EXT_CTRL + ofs,
+			PREFETCH(0x280 + base_ofs, 0x0));
+	}
 }
 
 void mt7915_dma_prefetch(struct mt7915_dev *dev)
@@ -78,43 +99,219 @@ void mt7915_dma_prefetch(struct mt7915_dev *dev)
 		__mt7915_dma_prefetch(dev, MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0));
 }
 
-int mt7915_dma_init(struct mt7915_dev *dev)
+static void mt7915_dma_disable(struct mt7915_dev *dev, bool rst)
 {
+	struct mt76_dev *mdev = &dev->mt76;
 	u32 hif1_ofs = 0;
-	int ret;
-
-	mt76_dma_attach(&dev->mt76);
 
 	if (dev->hif2)
 		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
 
-	/* configure global setting */
-	mt76_set(dev, MT_WFDMA1_GLO_CFG,
-		 MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
-		 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
+	/* reset */
+	if (rst) {
+		mt76_clear(dev, MT_WFDMA0_RST,
+			   MT_WFDMA0_RST_DMASHDL_ALL_RST |
+			   MT_WFDMA0_RST_LOGIC_RST);
+
+		mt76_set(dev, MT_WFDMA0_RST,
+			 MT_WFDMA0_RST_DMASHDL_ALL_RST |
+			 MT_WFDMA0_RST_LOGIC_RST);
+
+		if (is_mt7915(mdev)) {
+			mt76_clear(dev, MT_WFDMA1_RST,
+				   MT_WFDMA1_RST_DMASHDL_ALL_RST |
+				   MT_WFDMA1_RST_LOGIC_RST);
+
+			mt76_set(dev, MT_WFDMA1_RST,
+				 MT_WFDMA1_RST_DMASHDL_ALL_RST |
+				 MT_WFDMA1_RST_LOGIC_RST);
+		}
+
+		if (dev->hif2) {
+			mt76_clear(dev, MT_WFDMA0_RST + hif1_ofs,
+				   MT_WFDMA0_RST_DMASHDL_ALL_RST |
+				   MT_WFDMA0_RST_LOGIC_RST);
+
+			mt76_set(dev, MT_WFDMA0_RST + hif1_ofs,
+				 MT_WFDMA0_RST_DMASHDL_ALL_RST |
+				 MT_WFDMA0_RST_LOGIC_RST);
+
+			if (is_mt7915(mdev)) {
+				mt76_clear(dev, MT_WFDMA1_RST + hif1_ofs,
+					   MT_WFDMA1_RST_DMASHDL_ALL_RST |
+					   MT_WFDMA1_RST_LOGIC_RST);
+
+				mt76_set(dev, MT_WFDMA1_RST + hif1_ofs,
+					 MT_WFDMA1_RST_DMASHDL_ALL_RST |
+					 MT_WFDMA1_RST_LOGIC_RST);
+			}
+		}
+	}
+
+	/* disable */
+	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
+		   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+		   MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+		   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
+		   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+	if (is_mt7915(mdev))
+		mt76_clear(dev, MT_WFDMA1_GLO_CFG,
+			   MT_WFDMA1_GLO_CFG_TX_DMA_EN |
+			   MT_WFDMA1_GLO_CFG_RX_DMA_EN |
+			   MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
+			   MT_WFDMA1_GLO_CFG_OMIT_RX_INFO |
+			   MT_WFDMA1_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+	if (dev->hif2) {
+		mt76_clear(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
+			   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+			   MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+			   MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+			   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO |
+			   MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+		if (is_mt7915(mdev))
+			mt76_clear(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
+				   MT_WFDMA1_GLO_CFG_TX_DMA_EN |
+				   MT_WFDMA1_GLO_CFG_RX_DMA_EN |
+				   MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
+				   MT_WFDMA1_GLO_CFG_OMIT_RX_INFO |
+				   MT_WFDMA1_GLO_CFG_OMIT_RX_INFO_PFET2);
+	}
+}
+
+static int mt7915_dma_enable(struct mt7915_dev *dev)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	u32 hif1_ofs = 0;
+	u32 irq_mask;
+
+	if (dev->hif2)
+		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
 
 	/* reset dma idx */
 	mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR, ~0);
-	mt76_wr(dev, MT_WFDMA1_RST_DTX_PTR, ~0);
+	if (is_mt7915(mdev))
+		mt76_wr(dev, MT_WFDMA1_RST_DTX_PTR, ~0);
+	if (dev->hif2) {
+		mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR + hif1_ofs, ~0);
+		if (is_mt7915(mdev))
+			mt76_wr(dev, MT_WFDMA1_RST_DTX_PTR + hif1_ofs, ~0);
+	}
 
-	/* configure delay interrupt */
+	/* configure delay interrupt off */
 	mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0, 0);
-	mt76_wr(dev, MT_WFDMA1_PRI_DLY_INT_CFG0, 0);
+	if (is_mt7915(mdev)) {
+		mt76_wr(dev, MT_WFDMA1_PRI_DLY_INT_CFG0, 0);
+	} else {
+		mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG1, 0);
+		mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG2, 0);
+	}
 
 	if (dev->hif2) {
-		mt76_set(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
+		mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0 + hif1_ofs, 0);
+		if (is_mt7915(mdev)) {
+			mt76_wr(dev, MT_WFDMA1_PRI_DLY_INT_CFG0 +
+				hif1_ofs, 0);
+		} else {
+			mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG1 +
+				hif1_ofs, 0);
+			mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG2 +
+				hif1_ofs, 0);
+		}
+	}
+
+	/* configure perfetch settings */
+	mt7915_dma_prefetch(dev);
+
+	/* hif wait WFDMA idle */
+	mt76_set(dev, MT_WFDMA0_BUSY_ENA,
+		 MT_WFDMA0_BUSY_ENA_TX_FIFO0 |
+		 MT_WFDMA0_BUSY_ENA_TX_FIFO1 |
+		 MT_WFDMA0_BUSY_ENA_RX_FIFO);
+
+	if (is_mt7915(mdev))
+		mt76_set(dev, MT_WFDMA1_BUSY_ENA,
+			 MT_WFDMA1_BUSY_ENA_TX_FIFO0 |
+			 MT_WFDMA1_BUSY_ENA_TX_FIFO1 |
+			 MT_WFDMA1_BUSY_ENA_RX_FIFO);
+
+	if (dev->hif2) {
+		mt76_set(dev, MT_WFDMA0_BUSY_ENA + hif1_ofs,
+			 MT_WFDMA0_PCIE1_BUSY_ENA_TX_FIFO0 |
+			 MT_WFDMA0_PCIE1_BUSY_ENA_TX_FIFO1 |
+			 MT_WFDMA0_PCIE1_BUSY_ENA_RX_FIFO);
+
+		if (is_mt7915(mdev))
+			mt76_set(dev, MT_WFDMA1_BUSY_ENA + hif1_ofs,
+				 MT_WFDMA1_PCIE1_BUSY_ENA_TX_FIFO0 |
+				 MT_WFDMA1_PCIE1_BUSY_ENA_TX_FIFO1 |
+				 MT_WFDMA1_PCIE1_BUSY_ENA_RX_FIFO);
+	}
+
+	mt76_poll(dev, MT_WFDMA_EXT_CSR_HIF_MISC,
+		  MT_WFDMA_EXT_CSR_HIF_MISC_BUSY, 0, 1000);
+
+	/* set WFDMA Tx/Rx */
+	mt76_set(dev, MT_WFDMA0_GLO_CFG,
+		 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+		 MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+		 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+		 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+	if (is_mt7915(mdev))
+		mt76_set(dev, MT_WFDMA1_GLO_CFG,
+			 MT_WFDMA1_GLO_CFG_TX_DMA_EN |
+			 MT_WFDMA1_GLO_CFG_RX_DMA_EN |
 			 MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
 			 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
 
-		mt76_wr(dev, MT_WFDMA0_RST_DTX_PTR + hif1_ofs, ~0);
-		mt76_wr(dev, MT_WFDMA1_RST_DTX_PTR + hif1_ofs, ~0);
+	if (dev->hif2) {
+		mt76_set(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
+			 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
+			 MT_WFDMA0_GLO_CFG_RX_DMA_EN |
+			 MT_WFDMA0_GLO_CFG_OMIT_TX_INFO |
+			 MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2);
+
+		if (is_mt7915(mdev))
+			mt76_set(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
+				 MT_WFDMA1_GLO_CFG_TX_DMA_EN |
+				 MT_WFDMA1_GLO_CFG_RX_DMA_EN |
+				 MT_WFDMA1_GLO_CFG_OMIT_TX_INFO |
+				 MT_WFDMA1_GLO_CFG_OMIT_RX_INFO);
 
-		mt76_wr(dev, MT_WFDMA0_PRI_DLY_INT_CFG0 + hif1_ofs, 0);
-		mt76_wr(dev, MT_WFDMA1_PRI_DLY_INT_CFG0 + hif1_ofs, 0);
+		mt76_set(dev, MT_WFDMA_HOST_CONFIG,
+			 MT_WFDMA_HOST_CONFIG_PDMA_BAND);
 	}
 
-	/* configure perfetch settings */
-	mt7915_dma_prefetch(dev);
+	/* enable interrupts for TX/RX rings */
+	irq_mask = MT_INT_RX_DONE_MCU |
+		   MT_INT_TX_DONE_MCU |
+		   MT_INT_MCU_CMD |
+		   MT_INT_BAND0_RX_DONE;
+
+	if (dev->dbdc_support)
+		irq_mask |= MT_INT_BAND1_RX_DONE;
+
+	mt7915_irq_enable(dev, irq_mask);
+
+	return 0;
+}
+
+int mt7915_dma_init(struct mt7915_dev *dev)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	u32 hif1_ofs = 0;
+	int ret;
+
+	mt76_dma_attach(&dev->mt76);
+
+	if (dev->hif2)
+		hif1_ofs = MT_WFDMA0_PCIE1(0) - MT_WFDMA0(0);
+
+	mt7915_dma_disable(dev, true);
 
 	/* init tx queue */
 	ret = mt7915_init_tx_queues(&dev->phy, MT7915_TXQ_BAND0,
@@ -148,20 +345,32 @@ int mt7915_dma_init(struct mt7915_dev *dev)
 		return ret;
 
 	/* event from WA */
-	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU_WA],
-			       MT7915_RXQ_MCU_WA, MT7915_RX_MCU_RING_SIZE,
-			       MT_RX_BUF_SIZE, MT_RX_EVENT_RING_BASE);
-	if (ret)
-		return ret;
+	if (!is_mt7915(mdev)) {
+		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU_WA],
+				       MT7915_RXQ_MCU_WA,
+				       MT7915_RX_MCU_RING_SIZE,
+				       MT_RX_BUF_SIZE, MT_RX_EVENT_RING_BASE);
+		if (ret)
+			return ret;
+	}
 
-	/* rx data queue */
+	/* rx data queue for band0 */
 	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MAIN],
 			       MT7915_RXQ_BAND0, MT7915_RX_RING_SIZE,
 			       MT_RX_BUF_SIZE, MT_RX_DATA_RING_BASE);
 	if (ret)
 		return ret;
 
+	/* STS & tx free done event from WA for band0 */
+	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MAIN_WA],
+			       MT7915_RXQ_WA_BAND0,
+			       MT7915_RX_MCU_RING_SIZE,
+			       MT_RX_BUF_SIZE, MT_RX_STS_RING_BASE);
+	if (ret)
+		return ret;
+
 	if (dev->dbdc_support) {
+		/* rx data queue for band1 */
 		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_EXT],
 				       MT7915_RXQ_BAND1, MT7915_RX_RING_SIZE,
 				       MT_RX_BUF_SIZE,
@@ -169,12 +378,12 @@ int mt7915_dma_init(struct mt7915_dev *dev)
 		if (ret)
 			return ret;
 
-		/* event from WA */
+		/* STS & tx free done event from WA for band1 */
 		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_EXT_WA],
-				       MT7915_RXQ_MCU_WA_EXT,
+				       MT7915_RXQ_WA_BAND1,
 				       MT7915_RX_MCU_RING_SIZE,
 				       MT_RX_BUF_SIZE,
-				       MT_RX_EVENT_RING_BASE + hif1_ofs);
+				       MT_RX_STS_RING_BASE + hif1_ofs);
 		if (ret)
 			return ret;
 	}
@@ -187,80 +396,14 @@ int mt7915_dma_init(struct mt7915_dev *dev)
 			  mt7915_poll_tx, NAPI_POLL_WEIGHT);
 	napi_enable(&dev->mt76.tx_napi);
 
-	/* hif wait WFDMA idle */
-	mt76_set(dev, MT_WFDMA0_BUSY_ENA,
-		 MT_WFDMA0_BUSY_ENA_TX_FIFO0 |
-		 MT_WFDMA0_BUSY_ENA_TX_FIFO1 |
-		 MT_WFDMA0_BUSY_ENA_RX_FIFO);
-
-	mt76_set(dev, MT_WFDMA1_BUSY_ENA,
-		 MT_WFDMA1_BUSY_ENA_TX_FIFO0 |
-		 MT_WFDMA1_BUSY_ENA_TX_FIFO1 |
-		 MT_WFDMA1_BUSY_ENA_RX_FIFO);
-
-	mt76_set(dev, MT_WFDMA0_PCIE1_BUSY_ENA,
-		 MT_WFDMA0_PCIE1_BUSY_ENA_TX_FIFO0 |
-		 MT_WFDMA0_PCIE1_BUSY_ENA_TX_FIFO1 |
-		 MT_WFDMA0_PCIE1_BUSY_ENA_RX_FIFO);
-
-	mt76_set(dev, MT_WFDMA1_PCIE1_BUSY_ENA,
-		 MT_WFDMA1_PCIE1_BUSY_ENA_TX_FIFO0 |
-		 MT_WFDMA1_PCIE1_BUSY_ENA_TX_FIFO1 |
-		 MT_WFDMA1_PCIE1_BUSY_ENA_RX_FIFO);
-
-	mt76_poll(dev, MT_WFDMA_EXT_CSR_HIF_MISC,
-		  MT_WFDMA_EXT_CSR_HIF_MISC_BUSY, 0, 1000);
-
-	/* set WFDMA Tx/Rx */
-	mt76_set(dev, MT_WFDMA0_GLO_CFG,
-		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
-	mt76_set(dev, MT_WFDMA1_GLO_CFG,
-		 MT_WFDMA1_GLO_CFG_TX_DMA_EN | MT_WFDMA1_GLO_CFG_RX_DMA_EN);
-
-	if (dev->hif2) {
-		mt76_set(dev, MT_WFDMA0_GLO_CFG + hif1_ofs,
-			 (MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-			  MT_WFDMA0_GLO_CFG_RX_DMA_EN));
-		mt76_set(dev, MT_WFDMA1_GLO_CFG + hif1_ofs,
-			 (MT_WFDMA1_GLO_CFG_TX_DMA_EN |
-			  MT_WFDMA1_GLO_CFG_RX_DMA_EN));
-		mt76_set(dev, MT_WFDMA_HOST_CONFIG,
-			 MT_WFDMA_HOST_CONFIG_PDMA_BAND);
-	}
-
-	/* enable interrupts for TX/RX rings */
-	mt7915_irq_enable(dev, MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_MCU |
-			  MT_INT_MCU_CMD);
+	mt7915_dma_enable(dev);
 
 	return 0;
 }
 
 void mt7915_dma_cleanup(struct mt7915_dev *dev)
 {
-	/* disable */
-	mt76_clear(dev, MT_WFDMA0_GLO_CFG,
-		   MT_WFDMA0_GLO_CFG_TX_DMA_EN |
-		   MT_WFDMA0_GLO_CFG_RX_DMA_EN);
-	mt76_clear(dev, MT_WFDMA1_GLO_CFG,
-		   MT_WFDMA1_GLO_CFG_TX_DMA_EN |
-		   MT_WFDMA1_GLO_CFG_RX_DMA_EN);
-
-	/* reset */
-	mt76_clear(dev, MT_WFDMA1_RST,
-		   MT_WFDMA1_RST_DMASHDL_ALL_RST |
-		   MT_WFDMA1_RST_LOGIC_RST);
-
-	mt76_set(dev, MT_WFDMA1_RST,
-		 MT_WFDMA1_RST_DMASHDL_ALL_RST |
-		 MT_WFDMA1_RST_LOGIC_RST);
-
-	mt76_clear(dev, MT_WFDMA0_RST,
-		   MT_WFDMA0_RST_DMASHDL_ALL_RST |
-		   MT_WFDMA0_RST_LOGIC_RST);
-
-	mt76_set(dev, MT_WFDMA0_RST,
-		 MT_WFDMA0_RST_DMASHDL_ALL_RST |
-		 MT_WFDMA0_RST_LOGIC_RST);
+	mt7915_dma_disable(dev, true);
 
 	mt76_dma_cleanup(&dev->mt76);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 4b56358..f455c12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -397,8 +397,15 @@ mt7915_mac_init_band(struct mt7915_dev *dev, u8 band)
 static void mt7915_mac_init(struct mt7915_dev *dev)
 {
 	int i;
+	u32 rx_len = is_mt7915(&dev->mt76) ? 0x400 : 0x680;
+
+	/* config pse qid6 wfdma port selection */
+	if (!is_mt7915(&dev->mt76) && dev->hif2)
+		mt76_rmw(dev, MT_WF_PP_TOP_RXQ_WFDMA_CF_5, 0,
+			 MT_WF_PP_TOP_RXQ_QID6_WFDMA_HIF_SEL_MASK);
+
+	mt76_rmw_field(dev, MT_MDP_DCR1, MT_MDP_DCR1_MAX_RX_LEN, rx_len);
 
-	mt76_rmw_field(dev, MT_MDP_DCR1, MT_MDP_DCR1_MAX_RX_LEN, 0x400);
 	/* enable hardware de-agg */
 	mt76_set(dev, MT_MDP_DCR0, MT_MDP_DCR0_DAMSDU_EN);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 4216858..ba39f3d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -696,6 +696,10 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 	if (!status->wcid || !ieee80211_is_data_qos(fc))
 		return 0;
 
+	/* drop no data frame */
+	if (fc & cpu_to_le16(IEEE80211_STYPE_NULLFUNC))
+		return -EINVAL;
+
 	status->aggr = unicast &&
 		       !ieee80211_is_qos_nullfunc(fc);
 	status->qos_ctl = qos_ctl;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 0d67321..4c06ddf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -55,8 +55,20 @@ static const struct __reg mt7915_reg[] = {
 	[INT1_MASK_CSR]		= { MT_WFDMA_EXT_CSR_BASE, 0x8c },
 	[INT_MCU_CMD_SOURCE]	= { MT_WFDMA1_BASE, 0x1f0 },
 	[INT_MCU_CMD_EVENT]	= { MT_MCU_WFDMA1_BASE, 0x108 },
+	[TX_RING_CTRL_FWDL]	= { MT_WFDMA1_BASE, 0x640 },
+	[TX_RING_CTRL_WM]	= { MT_WFDMA1_BASE, 0x644 },
+	[TX_RING_CTRL_BAND0]	= { MT_WFDMA1_BASE, 0x648 },
+	[TX_RING_CTRL_BAND1]	= { MT_WFDMA1_BASE, 0x64c },
+	[TX_RING_CTRL_WA]	= { MT_WFDMA1_BASE, 0x650 },
+	[RX_RING_CTRL_WM]	= { MT_WFDMA1_BASE, 0x680 },
+	[RX_RING_CTRL_WA]	= { INVALID_BASE, INVALID_OFFSET },
+	[RX_RING_CTRL_STS0]	= { MT_WFDMA1_BASE, 0x684 },
+	[RX_RING_CTRL_STS1]	= { MT_WFDMA1_BASE, 0x688 },
+	[RX_RING_CTRL_BAND0]	= { MT_WFDMA0_BASE, 0x680 },
+	[RX_RING_CTRL_BAND1]	= { MT_WFDMA0_BASE, 0x684 },
 	[TX_RING_BASE]		= { MT_WFDMA1_BASE, 0x400 },
 	[RX_EVENT_RING_BASE]	= { MT_WFDMA1_BASE, 0x500 },
+	[RX_STS_RING_BASE]	= { MT_WFDMA1_BASE, 0x510 },
 	[RX_DATA_RING_BASE]	= { MT_WFDMA0_BASE, 0x500 },
 	[TMAC_CDTR]		= { INVALID_BASE, 0x090 },
 	[TMAC_ODTR]		= { INVALID_BASE, 0x094 },
@@ -137,8 +149,20 @@ static const struct __reg mt7916_reg[] = {
 	[INT1_MASK_CSR]		= { MT_WFDMA0_PCIE1_BASE, 0x204 },
 	[INT_MCU_CMD_SOURCE]	= { MT_WFDMA0_BASE, 0x1f0 },
 	[INT_MCU_CMD_EVENT]	= { MT_MCU_WFDMA0_BASE, 0x108 },
+	[TX_RING_CTRL_FWDL]	= { MT_WFDMA0_BASE, 0x640 },
+	[TX_RING_CTRL_WM]	= { MT_WFDMA0_BASE, 0x644 },
+	[TX_RING_CTRL_BAND0]	= { MT_WFDMA0_BASE, 0x648 },
+	[TX_RING_CTRL_BAND1]	= { MT_WFDMA0_BASE, 0x64c },
+	[TX_RING_CTRL_WA]	= { MT_WFDMA0_BASE, 0x650 },
+	[RX_RING_CTRL_WM]	= { MT_WFDMA0_BASE, 0x680 },
+	[RX_RING_CTRL_WA]	= { MT_WFDMA0_BASE, 0x684 },
+	[RX_RING_CTRL_STS0]	= { MT_WFDMA0_BASE, 0x688 },
+	[RX_RING_CTRL_STS1]	= { MT_WFDMA0_BASE, 0x68c },
+	[RX_RING_CTRL_BAND0]	= { MT_WFDMA0_BASE, 0x690 },
+	[RX_RING_CTRL_BAND1]	= { MT_WFDMA0_BASE, 0x694 },
 	[TX_RING_BASE]		= { MT_WFDMA0_BASE, 0x400 },
 	[RX_EVENT_RING_BASE]	= { MT_WFDMA0_BASE, 0x500 },
+	[RX_STS_RING_BASE]	= { MT_WFDMA0_BASE, 0x520 },
 	[RX_DATA_RING_BASE]	= { MT_WFDMA0_BASE, 0x540 },
 	[TMAC_CDTR]		= { INVALID_BASE, 0x0c8 },
 	[TMAC_ODTR]		= { INVALID_BASE, 0x0cc },
@@ -547,18 +571,21 @@ static void mt7915_rx_poll_complete(struct mt76_dev *mdev,
 	case MT_RXQ_MAIN:
 		rx_irq_mask = MT_INT_RX_DONE_DATA0;
 		break;
+	case MT_RXQ_MAIN_WA:
+		rx_irq_mask = MT_INT_RX_DONE_WA_MAIN;
+		break;
 	case MT_RXQ_EXT:
 		rx_irq_mask = MT_INT_RX_DONE_DATA1;
 		break;
+	case MT_RXQ_EXT_WA:
+		rx_irq_mask = MT_INT_RX_DONE_WA_EXT;
+		break;
 	case MT_RXQ_MCU:
 		rx_irq_mask = MT_INT_RX_DONE_WM;
 		break;
 	case MT_RXQ_MCU_WA:
 		rx_irq_mask = MT_INT_RX_DONE_WA;
 		break;
-	case MT_RXQ_EXT_WA:
-		rx_irq_mask = MT_INT_RX_DONE_WA_EXT;
-		break;
 	default:
 		break;
 	}
@@ -608,8 +635,13 @@ static void mt7915_irq_tasklet(struct tasklet_struct *t)
 	if (intr & MT_INT_RX_DONE_WM)
 		napi_schedule(&dev->mt76.napi[MT_RXQ_MCU]);
 
-	if (intr & MT_INT_RX_DONE_WA)
-		napi_schedule(&dev->mt76.napi[MT_RXQ_MCU_WA]);
+	if (!is_mt7915(&dev->mt76)) {
+		if (intr & MT_INT_RX_DONE_WA)
+			napi_schedule(&dev->mt76.napi[MT_RXQ_MCU_WA]);
+	}
+
+	if (intr & MT_INT_RX_DONE_WA_MAIN)
+		napi_schedule(&dev->mt76.napi[MT_RXQ_MAIN_WA]);
 
 	if (intr & MT_INT_RX_DONE_WA_EXT)
 		napi_schedule(&dev->mt76.napi[MT_RXQ_EXT_WA]);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index b69e00d..8adb069 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -65,7 +65,8 @@ enum mt7915_rxq_id {
 	MT7915_RXQ_BAND1,
 	MT7915_RXQ_MCU_WM = 0,
 	MT7915_RXQ_MCU_WA,
-	MT7915_RXQ_MCU_WA_EXT,
+	MT7915_RXQ_WA_BAND0 = 0,
+	MT7915_RXQ_WA_BAND1,
 };
 
 struct mt7915_sta_key_conf {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 3837b2b..4745e3f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -62,8 +62,20 @@ enum reg_rev {
 	INT1_MASK_CSR,
 	INT_MCU_CMD_SOURCE,
 	INT_MCU_CMD_EVENT,
+	TX_RING_CTRL_FWDL,
+	TX_RING_CTRL_WM,
+	TX_RING_CTRL_BAND0,
+	TX_RING_CTRL_BAND1,
+	TX_RING_CTRL_WA,
+	RX_RING_CTRL_WM,
+	RX_RING_CTRL_WA,
+	RX_RING_CTRL_STS0,
+	RX_RING_CTRL_STS1,
+	RX_RING_CTRL_BAND0,
+	RX_RING_CTRL_BAND1,
 	TX_RING_BASE,
 	RX_EVENT_RING_BASE,
+	RX_STS_RING_BASE,
 	RX_DATA_RING_BASE,
 	TMAC_CDTR,
 	TMAC_ODTR,
@@ -574,12 +586,15 @@ enum bit_rev {
 #define MT_WFDMA0_GLO_CFG		MT_WFDMA0(0x208)
 #define MT_WFDMA0_GLO_CFG_TX_DMA_EN	BIT(0)
 #define MT_WFDMA0_GLO_CFG_RX_DMA_EN	BIT(2)
+#define MT_WFDMA0_GLO_CFG_OMIT_TX_INFO	BIT(28)
+#define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO	BIT(27)
+#define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2	BIT(21)
 
 #define MT_WFDMA0_RST_DTX_PTR		MT_WFDMA0(0x20c)
 #define MT_WFDMA0_PRI_DLY_INT_CFG0	MT_WFDMA0(0x2f0)
+#define MT_WFDMA0_PRI_DLY_INT_CFG1	MT_WFDMA0(0x2f4)
+#define MT_WFDMA0_PRI_DLY_INT_CFG2	MT_WFDMA0(0x2f8)
 
-#define MT_WFDMA0_RX_RING0_EXT_CTRL	MT_WFDMA0(0x680)
-#define MT_WFDMA0_RX_RING1_EXT_CTRL	MT_WFDMA0(0x684)
 #define MT_WFDMA0_RX_RING2_EXT_CTRL	MT_WFDMA0(0x688)
 
 /* WFDMA1 */
@@ -599,31 +614,12 @@ enum bit_rev {
 #define MT_WFDMA1_GLO_CFG_RX_DMA_EN	BIT(2)
 #define MT_WFDMA1_GLO_CFG_OMIT_TX_INFO	BIT(28)
 #define MT_WFDMA1_GLO_CFG_OMIT_RX_INFO	BIT(27)
+#define MT_WFDMA1_GLO_CFG_OMIT_RX_INFO_PFET2	BIT(21)
 
 #define MT_WFDMA1_RST_DTX_PTR		MT_WFDMA1(0x20c)
 #define MT_WFDMA1_PRI_DLY_INT_CFG0	MT_WFDMA1(0x2f0)
 
-#define MT_WFDMA1_TX_RING0_EXT_CTRL	MT_WFDMA1(0x600)
-#define MT_WFDMA1_TX_RING1_EXT_CTRL	MT_WFDMA1(0x604)
-#define MT_WFDMA1_TX_RING2_EXT_CTRL	MT_WFDMA1(0x608)
-#define MT_WFDMA1_TX_RING3_EXT_CTRL	MT_WFDMA1(0x60c)
-#define MT_WFDMA1_TX_RING4_EXT_CTRL	MT_WFDMA1(0x610)
-#define MT_WFDMA1_TX_RING5_EXT_CTRL	MT_WFDMA1(0x614)
-#define MT_WFDMA1_TX_RING6_EXT_CTRL	MT_WFDMA1(0x618)
-#define MT_WFDMA1_TX_RING7_EXT_CTRL	MT_WFDMA1(0x61c)
-
-#define MT_WFDMA1_TX_RING16_EXT_CTRL	MT_WFDMA1(0x640)
-#define MT_WFDMA1_TX_RING17_EXT_CTRL	MT_WFDMA1(0x644)
-#define MT_WFDMA1_TX_RING18_EXT_CTRL	MT_WFDMA1(0x648)
-#define MT_WFDMA1_TX_RING19_EXT_CTRL	MT_WFDMA1(0x64c)
-#define MT_WFDMA1_TX_RING20_EXT_CTRL	MT_WFDMA1(0x650)
 #define MT_WFDMA1_TX_RING21_EXT_CTRL	MT_WFDMA1(0x654)
-#define MT_WFDMA1_TX_RING22_EXT_CTRL	MT_WFDMA1(0x658)
-#define MT_WFDMA1_TX_RING23_EXT_CTRL	MT_WFDMA1(0x65c)
-
-#define MT_WFDMA1_RX_RING0_EXT_CTRL	MT_WFDMA1(0x680)
-#define MT_WFDMA1_RX_RING1_EXT_CTRL	MT_WFDMA1(0x684)
-#define MT_WFDMA1_RX_RING2_EXT_CTRL	MT_WFDMA1(0x688)
 #define MT_WFDMA1_RX_RING3_EXT_CTRL	MT_WFDMA1(0x68c)
 
 /* WFDMA CSR */
@@ -662,8 +658,21 @@ enum bit_rev {
 #define MT_INT1_SOURCE_CSR		__REG(dev, INT1_SOURCE_CSR)
 #define MT_INT1_MASK_CSR		__REG(dev, INT1_MASK_CSR)
 
+#define MT_WFDMA_TX_RING_EXT_CTRL_FWDL	__REG(dev, TX_RING_CTRL_FWDL)
+#define MT_WFDMA_TX_RING_EXT_CTRL_WM	__REG(dev, TX_RING_CTRL_WM)
+#define MT_WFDMA_TX_RING_EXT_CTRL_BAND0	__REG(dev, TX_RING_CTRL_BAND0)
+#define MT_WFDMA_TX_RING_EXT_CTRL_BAND1	__REG(dev, TX_RING_CTRL_BAND1)
+#define MT_WFDMA_TX_RING_EXT_CTRL_WA	__REG(dev, TX_RING_CTRL_WA)
+#define MT_WFDMA_RX_RING_EXT_CTRL_WM	__REG(dev, RX_RING_CTRL_WM)
+#define MT_WFDMA_RX_RING_EXT_CTRL_WA	__REG(dev, RX_RING_CTRL_WA)
+#define MT_WFDMA_RX_RING_EXT_CTRL_STS0	__REG(dev, RX_RING_CTRL_STS0)
+#define MT_WFDMA_RX_RING_EXT_CTRL_STS1	__REG(dev, RX_RING_CTRL_STS1)
+#define MT_WFDMA_RX_RING_EXT_CTRL_BAND0	__REG(dev, RX_RING_CTRL_BAND0)
+#define MT_WFDMA_RX_RING_EXT_CTRL_BAND1	__REG(dev, RX_RING_CTRL_BAND1)
+
 #define MT_TX_RING_BASE			__REG(dev, TX_RING_BASE)
 #define MT_RX_EVENT_RING_BASE		__REG(dev, RX_EVENT_RING_BASE)
+#define MT_RX_STS_RING_BASE		__REG(dev, RX_STS_RING_BASE)
 #define MT_RX_DATA_RING_BASE		__REG(dev, RX_DATA_RING_BASE)
 
 #define MT_INT_RX_DONE_DATA0		__BIT(dev, RX_DONE_DAND0)
@@ -797,6 +806,13 @@ enum bit_rev {
 #define MT_PCIE1_MAC(ofs)		__REG_MAP(dev, MT_PCIE1_MAC_BASE, (ofs))
 #define MT_PCIE1_MAC_INT_ENABLE		MT_PCIE1_MAC(0x188)
 
+/* PP TOP */
+#define MT_WF_PP_TOP_BASE		0x820cc000
+#define MT_WF_PP_TOP(ofs)		(MT_WF_PP_TOP_BASE + (ofs))
+
+#define MT_WF_PP_TOP_RXQ_WFDMA_CF_5	MT_WF_PP_TOP(0x0e8)
+#define MT_WF_PP_TOP_RXQ_QID6_WFDMA_HIF_SEL_MASK	BIT(6)
+
 #define MT_WF_IRPI_BASE			0x83006000
 #define MT_WF_IRPI(ofs)			(MT_WF_IRPI_BASE + ((ofs) << 16))
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
