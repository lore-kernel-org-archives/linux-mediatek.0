Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B1AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 12:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pe6Ula5dz+evCUIIJdR5ZoAcmu/nC1xkD+7JH6WVB44=; b=dlZJd0c2GUc/jo
	E2ZlpDU2ENZCwYRJBoDAA/rbmVzxCCxIvWFBpX0H4jPil3EeG4C7DZ6zXAVBrPBY7BYdW7Yr1G5VB
	mDZi6ofdfNygRYLRYVRj2D8ChkoG4h2oYMYgpmTgsSAnYAjKYT8hpYQUf4zTDNT1HRcVDSGuH0mqm
	DqS1p7fG2Yvr+SyusL9UOy1WHPC+zw0UKt68fkKCqKqEBBjwlim3h58cItoh1iPou0RpUbhRAjIo8
	OCesB7Woy4xrOaS2DujX3iqkpePycUvRX86BzSErxTyL/VfLPQCSHo4QKNmhE9IhXBlBxoq+nwyeu
	Feai1eHrh97LlCe1KZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmx7L-003BHx-L4; Fri, 06 May 2022 12:31:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmx7J-003BF1-7Z
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 12:31:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5ECED61FE6;
 Fri,  6 May 2022 12:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AAAC385A8;
 Fri,  6 May 2022 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651840287;
 bh=7mqAuh+F4hB++eFxWT4777VV/Pd+PivBh9QIDzyTqRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dxrXavAPjdTwuNcfe1/aznQF371oD619oRADefopAmP0yblvpn5PbdqKXb2DVRa6V
 D3xAYQ7GgOKvdsufRPOnWwSlDR//6dzySKGE20+MOPk8JF33igX8XvbAYIsVJfNGby
 VIZs5r43YzS8yLJqFkKht/zr3IMrK52s+Xfv2W4qgyJ2R//H+Gp92G+WsQjnSWCK0X
 N8q4V+WIqGLN7wkGWq9AnwVSWu5/A6F8ronKFS5hDVCr81dpevLQ0cz5h6865CCmG+
 l0Z8w3+qID5rZp9UbTnq3JDwrpVWC1rIaq0QeO//n+fp7TWQHd6AnDAIowwtmHPpBz
 2qshi87GT/BWw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: [PATCH net-next 06/14] net: ethernet: mtk_eth_soc: rely on txd_size
 in mtk_desc_to_tx_buf
Date: Fri,  6 May 2022 14:30:23 +0200
Message-Id: <41062b85a49a26b18f5ccdd3a7a79da814b95e45.1651839494.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651839494.git.lorenzo@kernel.org>
References: <cover.1651839494.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_053129_399011_7BD6E6E1 
X-CRM114-Status: GOOD (  13.48  )
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
index a48e93792db1..5f0082f92cc7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -837,10 +837,11 @@ static inline void *mtk_qdma_phys_to_virt(struct mtk_tx_ring *ring, u32 desc)
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
@@ -962,6 +963,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 	};
 	struct mtk_mac *mac = netdev_priv(dev);
 	struct mtk_eth *eth = mac->hw;
+	const struct mtk_soc_data *soc = eth->soc;
 	struct mtk_tx_dma *itxd, *txd;
 	struct mtk_tx_dma *itxd_pdma, *txd_pdma;
 	struct mtk_tx_buf *itx_buf, *tx_buf;
@@ -973,7 +975,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 	if (itxd == ring->last_free)
 		return -ENOMEM;
 
-	itx_buf = mtk_desc_to_tx_buf(ring, itxd);
+	itx_buf = mtk_desc_to_tx_buf(ring, itxd, soc->txrx.txd_size);
 	memset(itx_buf, 0, sizeof(*itx_buf));
 
 	txd_info.addr = dma_map_single(eth->dma_dev, skb->data, txd_info.size,
@@ -1001,7 +1003,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 		while (frag_size) {
 			bool new_desc = true;
 
-			if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA) ||
+			if (MTK_HAS_CAPS(soc->caps, MTK_QDMA) ||
 			    (i & 0x1)) {
 				txd = mtk_qdma_phys_to_virt(ring, txd->txd2);
 				txd_pdma = qdma_to_pdma(ring, txd);
@@ -1025,7 +1027,8 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 
 			mtk_tx_set_dma_desc(dev, txd, &txd_info);
 
-			tx_buf = mtk_desc_to_tx_buf(ring, txd);
+			tx_buf = mtk_desc_to_tx_buf(ring, txd,
+						    soc->txrx.txd_size);
 			if (new_desc)
 				memset(tx_buf, 0, sizeof(*tx_buf));
 			tx_buf->skb = (struct sk_buff *)MTK_DMA_DUMMY_DESC;
@@ -1044,7 +1047,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 	/* store skb to cleanup */
 	itx_buf->skb = skb;
 
-	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
+	if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
 		if (k & 0x1)
 			txd_pdma->txd2 |= TX_DMA_LS0;
 		else
@@ -1062,7 +1065,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 	 */
 	wmb();
 
-	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
+	if (MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
 		if (netif_xmit_stopped(netdev_get_tx_queue(dev, 0)) ||
 		    !netdev_xmit_more())
 			mtk_w32(eth, txd->txd2, MTK_QTX_CTX_PTR);
@@ -1076,13 +1079,13 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 
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
@@ -1393,7 +1396,8 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 		if ((desc->txd3 & TX_DMA_OWNER_CPU) == 0)
 			break;
 
-		tx_buf = mtk_desc_to_tx_buf(ring, desc);
+		tx_buf = mtk_desc_to_tx_buf(ring, desc,
+					    eth->soc->txrx.txd_size);
 		if (tx_buf->flags & MTK_TX_FLAGS_FPORT1)
 			mac = 1;
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
