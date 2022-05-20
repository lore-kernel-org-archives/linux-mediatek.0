Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E926C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 18:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvf1Y6DDnoWO9DcyQ78mQ3JPf7Qx3DinlWJPU7EBOBM=; b=vObsK2BZWGMDdt
	xtwfjyKExzxAvHUQacxGmAiUh3Z5nmwHyOD2YjJ+4acr1Oezmn7rb51naJ4BCsMbU8pXBMUu0NMZy
	p0eQeUoMNS0PEyaZXXnAsKUoa5/Ai6MipF4AoghEAjliORuxbTtxFsjEsrMsQ/MqDhAG+8ADHs8sn
	p2AGYmI7UuwbiKP9L7j384AuKy8YN3gl07ZsuV9jELvMUQnVgGCtknMNj68V0eP2RuI8WsbkeJkWr
	uHADHbRyJlpb+luzXiWhkHf1U3V1yjQaAPO2Omigb9PJ/LeWj4q+GmatOeQMxOe2af6UP0qheIvRg
	Q1SEeiItxB3bu00mlMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns77G-00E11G-WC; Fri, 20 May 2022 18:12:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns77D-00E0xh-MA
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 18:12:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 51887B82A55;
 Fri, 20 May 2022 18:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F79CC34118;
 Fri, 20 May 2022 18:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653070361;
 bh=a0+13S2LcTmchzKxjzuZjTsZH/e0iG1iPyCiXmIKIv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sR5ZzBtQtQtClW1ZLTBVlRUQwpYr/kOTNSaciaVN3MxzvDQpoyxLYjz743DMaJrnL
 DOgGgSBtQHKYO6vS9LjED6uegGr8D4ZU/wWvMmOQj4vQPFbXbiRJyWujHS0fo6HTmQ
 5VgwZCv8UwViju/CCuSw1UkUWG8NuA3LlFKS8IcPtg3qMsame2AapgLV8/TGahV/w+
 GG9/CM/bArd1j8RiuXEvcT5EyWvkIOi2gF0CubKaHOP91GA1P3c8fJDjjxgU7PxZQR
 Jvn1r0is+vn+XStAoVzHKZluDfB9CRcEljAm/wkBvePxT5S/7Le5hEhD2hZQF1h5mx
 t7BUs/clJ8D3Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v3 net-next 07/16] net: ethernet: mtk_eth_soc: rely on
 txd_size in mtk_desc_to_tx_buf
Date: Fri, 20 May 2022 20:11:30 +0200
Message-Id: <1f2d314864f8f3547c8225ef48861ea95cb0abd3.1653069056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653069056.git.lorenzo@kernel.org>
References: <cover.1653069056.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_111244_041644_A80E35F8 
X-CRM114-Status: GOOD (  14.08  )
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

This is a preliminary patch to add mt7986 ethernet support.

Tested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 26 ++++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 331814f4801f..7c314324f929 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -861,10 +861,11 @@ static inline void *mtk_qdma_phys_to_virt(struct mtk_tx_ring *ring, u32 desc)
 	return ret + (desc - ring->phys);
 }
 
-static inline struct mtk_tx_buf *mtk_desc_to_tx_buf(struct mtk_tx_ring *ring,
-						    struct mtk_tx_dma *txd)
+static struct mtk_tx_buf *mtk_desc_to_tx_buf(struct mtk_tx_ring *ring,
+					     struct mtk_tx_dma *txd,
+					     u32 txd_size)
 {
-	int idx = txd - ring->dma;
+	int idx = ((void *)txd - (void *)ring->dma) / txd_size;
 
 	return &ring->buf[idx];
 }
@@ -986,6 +987,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 	};
 	struct mtk_mac *mac = netdev_priv(dev);
 	struct mtk_eth *eth = mac->hw;
+	const struct mtk_soc_data *soc = eth->soc;
 	struct mtk_tx_dma *itxd, *txd;
 	struct mtk_tx_dma *itxd_pdma, *txd_pdma;
 	struct mtk_tx_buf *itx_buf, *tx_buf;
@@ -997,7 +999,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 	if (itxd == ring->last_free)
 		return -ENOMEM;
 
-	itx_buf = mtk_desc_to_tx_buf(ring, itxd);
+	itx_buf = mtk_desc_to_tx_buf(ring, itxd, soc->txrx.txd_size);
 	memset(itx_buf, 0, sizeof(*itx_buf));
 
 	txd_info.addr = dma_map_single(eth->dma_dev, skb->data, txd_info.size,
@@ -1025,7 +1027,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 		while (frag_size) {
 			bool new_desc = true;
 
-			if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA) ||
+			if (MTK_HAS_CAPS(soc->caps, MTK_QDMA) ||
 			    (i & 0x1)) {
 				txd = mtk_qdma_phys_to_virt(ring, txd->txd2);
 				txd_pdma = qdma_to_pdma(ring, txd);
@@ -1049,7 +1051,8 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 
 			mtk_tx_set_dma_desc(dev, txd, &txd_info);
 
-			tx_buf = mtk_desc_to_tx_buf(ring, txd);
+			tx_buf = mtk_desc_to_tx_buf(ring, txd,
+						    soc->txrx.txd_size);
 			if (new_desc)
 				memset(tx_buf, 0, sizeof(*tx_buf));
 			tx_buf->skb = (struct sk_buff *)MTK_DMA_DUMMY_DESC;
@@ -1068,7 +1071,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 	/* store skb to cleanup */
 	itx_buf->skb = skb;
 
-	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
+	if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
 		if (k & 0x1)
 			txd_pdma->txd2 |= TX_DMA_LS0;
 		else
@@ -1086,7 +1089,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 	 */
 	wmb();
 
-	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
+	if (MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
 		if (netif_xmit_stopped(netdev_get_tx_queue(dev, 0)) ||
 		    !netdev_xmit_more())
 			mtk_w32(eth, txd->txd2, MTK_QTX_CTX_PTR);
@@ -1100,13 +1103,13 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 
 err_dma:
 	do {
-		tx_buf = mtk_desc_to_tx_buf(ring, itxd);
+		tx_buf = mtk_desc_to_tx_buf(ring, itxd, soc->txrx.txd_size);
 
 		/* unmap dma */
 		mtk_tx_unmap(eth, tx_buf, false);
 
 		itxd->txd3 = TX_DMA_LS0 | TX_DMA_OWNER_CPU;
-		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA))
+		if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA))
 			itxd_pdma->txd2 = TX_DMA_DESP2_DEF;
 
 		itxd = mtk_qdma_phys_to_virt(ring, itxd->txd2);
@@ -1417,7 +1420,8 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 		if ((desc->txd3 & TX_DMA_OWNER_CPU) == 0)
 			break;
 
-		tx_buf = mtk_desc_to_tx_buf(ring, desc);
+		tx_buf = mtk_desc_to_tx_buf(ring, desc,
+					    eth->soc->txrx.txd_size);
 		if (tx_buf->flags & MTK_TX_FLAGS_FPORT1)
 			mac = 1;
 
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
