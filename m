Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A1CC19F29
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPWxpbnQAIGCC6qrnmE5Q14i6WsTB2HlgNUBHZ+9RqY=; b=xFdYIun18W3qnmqGjXU7g8codR
	T/X8n7cGHBcPcqWr5YssRr8QHJblk8A/0AmCzEO0TZUUCq9dsXnuOJL5v/uTUqfvciXbnHQUKBWUk
	7S4lI2S0mwRj4jIyMMKliAUOi7OmAV9IVN3kUyqetLosmkHoJD9VP622vdY8iFuI0RdZkgnqsOYev
	QLp332RJAEv7nXjWozNvTs+G/Rg/xHRr+HGGRfDYLsXnoD/uByzVxlok1VjXTJIdr9CJsPLAqVxLc
	KjF5ltT1Ih2J9t68xIa0ifqjoKDHUpU+J2myR+ma2Do1kIgxX7ebviidGltUfBCSVoOpHQxyy/gtK
	kJfBdERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGoUX-000TwE-Af; Wed, 27 Jul 2022 21:22:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGoUU-000TuR-Gz
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 21:22:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2938A60A67;
	Wed, 27 Jul 2022 21:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C29C433B5;
	Wed, 27 Jul 2022 21:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658956968;
	bh=bGkV0/NSbHA6qEcuG2LEzyvloU5oiNR/vG45e/SG7tI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ieM7guo7cZ8Qtm+MXvAg4bYaoEM3u8o9PvvtIKN3fRxFRx+YL9RTgKqwYtTmNPofH
	 MRhcV53e2Ep94sh2Mh6G6rHn+hf/5RBenBSLgGzNJ9LaEzkiJCSHfdK4c15yEhbN/U
	 Rj6MmJC+3v80mUSxsgoEo84Uzu43eKtHz22fuRtvoUH72AUYYrJJLUoX7cG+Ksclv4
	 ZInt3rEPUZ+gL9G87nn8INc1FCpUdVJP1rA7lG7MB3aOM5UsbmQNAAnNxR6DQ9QkiT
	 yjNClhsNWtsHBUKQb5s2usXrIxuMB+lRszsSVkCfrKEsgtRbUGgFUzto92J4LIUyCs
	 o9CFwrPjm/39w==
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
	ilias.apalodimas@linaro.org,
	lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: [PATCH net-next 2/3] net: ethernet: mtk_eth_soc: introduce xdp multi-frag support
Date: Wed, 27 Jul 2022 23:20:51 +0200
Message-Id: <24704aaeb7f1fc44d6d2cdfa2fb919f625884421.1658955249.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1658955249.git.lorenzo@kernel.org>
References: <cover.1658955249.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_142250_662389_E414FE08 
X-CRM114-Status: GOOD (  19.43  )
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

Add the capability to map non-linear xdp frames in XDP_TX and
ndo_xdp_xmit callback.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 125 +++++++++++++-------
 1 file changed, 82 insertions(+), 43 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 8450604d22ff..24235f8f0a8f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1031,23 +1031,22 @@ static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
 		}
 	}
 
-	if (tx_buf->type == MTK_TYPE_SKB) {
-		if (tx_buf->data &&
-		    tx_buf->data != (void *)MTK_DMA_DUMMY_DESC) {
+	if (tx_buf->data && tx_buf->data != (void *)MTK_DMA_DUMMY_DESC) {
+		if (tx_buf->type == MTK_TYPE_SKB) {
 			struct sk_buff *skb = tx_buf->data;
 
 			if (napi)
 				napi_consume_skb(skb, napi);
 			else
 				dev_kfree_skb_any(skb);
-		}
-	} else if (tx_buf->data) {
-		struct xdp_frame *xdpf = tx_buf->data;
+		} else {
+			struct xdp_frame *xdpf = tx_buf->data;
 
-		if (napi && tx_buf->type == MTK_TYPE_XDP_TX)
-			xdp_return_frame_rx_napi(xdpf);
-		else
-			xdp_return_frame(xdpf);
+			if (napi && tx_buf->type == MTK_TYPE_XDP_TX)
+				xdp_return_frame_rx_napi(xdpf);
+			else
+				xdp_return_frame(xdpf);
+		}
 	}
 	tx_buf->flags = 0;
 	tx_buf->data = NULL;
@@ -1550,6 +1549,8 @@ static int mtk_xdp_frame_map(struct mtk_eth *eth, struct net_device *dev,
 	mtk_tx_set_dma_desc(dev, txd, txd_info);
 
 	tx_buf->flags |= !mac->id ? MTK_TX_FLAGS_FPORT0 : MTK_TX_FLAGS_FPORT1;
+	tx_buf->type = dma_map ? MTK_TYPE_XDP_NDO : MTK_TYPE_XDP_TX;
+	tx_buf->data = (void *)MTK_DMA_DUMMY_DESC;
 
 	txd_pdma = qdma_to_pdma(ring, txd);
 	setup_tx_buf(eth, tx_buf, txd_pdma, txd_info->addr, txd_info->size,
@@ -1561,43 +1562,69 @@ static int mtk_xdp_frame_map(struct mtk_eth *eth, struct net_device *dev,
 static int mtk_xdp_submit_frame(struct mtk_eth *eth, struct xdp_frame *xdpf,
 				struct net_device *dev, bool dma_map)
 {
+	struct skb_shared_info *sinfo = xdp_get_shared_info_from_frame(xdpf);
 	const struct mtk_soc_data *soc = eth->soc;
 	struct mtk_tx_ring *ring = &eth->tx_ring;
 	struct mtk_tx_dma_desc_info txd_info = {
 		.size	= xdpf->len,
 		.first	= true,
-		.last	= true,
+		.last	= !xdp_frame_has_frags(xdpf),
 	};
-	int err = 0, index = 0, n_desc = 1;
-	struct mtk_tx_dma *txd, *txd_pdma;
-	struct mtk_tx_buf *tx_buf;
+	int err, index = 0, n_desc = 1, nr_frags;
+	struct mtk_tx_dma *htxd, *txd, *txd_pdma;
+	struct mtk_tx_buf *htx_buf, *tx_buf;
+	void *data = xdpf->data;
 
 	if (unlikely(test_bit(MTK_RESETTING, &eth->state)))
 		return -EBUSY;
 
-	if (unlikely(atomic_read(&ring->free_count) <= 1))
+	nr_frags = unlikely(xdp_frame_has_frags(xdpf)) ? sinfo->nr_frags : 0;
+	if (unlikely(atomic_read(&ring->free_count) <= 1 + nr_frags))
 		return -EBUSY;
 
 	spin_lock(&eth->page_lock);
 
 	txd = ring->next_free;
 	if (txd == ring->last_free) {
-		err = -ENOMEM;
-		goto out;
+		spin_unlock(&eth->page_lock);
+		return -ENOMEM;
 	}
+	htxd = txd;
 
 	tx_buf = mtk_desc_to_tx_buf(ring, txd, soc->txrx.txd_size);
 	memset(tx_buf, 0, sizeof(*tx_buf));
+	htx_buf = tx_buf;
 
-	err = mtk_xdp_frame_map(eth, dev, &txd_info, txd, tx_buf,
-				xdpf->data, xdpf->headroom, index,
-				dma_map);
-	if (err < 0)
-		goto out;
+	for (;;) {
+		err = mtk_xdp_frame_map(eth, dev, &txd_info, txd, tx_buf,
+					data, xdpf->headroom, index, dma_map);
+		if (err < 0)
+			goto unmap;
+
+		if (txd_info.last)
+			break;
+
+		if (MTK_HAS_CAPS(soc->caps, MTK_QDMA) || (index & 0x1)) {
+			txd = mtk_qdma_phys_to_virt(ring, txd->txd2);
+			txd_pdma = qdma_to_pdma(ring, txd);
+			if (txd == ring->last_free)
+				goto unmap;
 
+			tx_buf = mtk_desc_to_tx_buf(ring, txd,
+						    soc->txrx.txd_size);
+			memset(tx_buf, 0, sizeof(*tx_buf));
+			n_desc++;
+		}
+
+		memset(&txd_info, 0, sizeof(struct mtk_tx_dma_desc_info));
+		txd_info.size = skb_frag_size(&sinfo->frags[index]);
+		txd_info.last = index + 1 == nr_frags;
+		data = skb_frag_address(&sinfo->frags[index]);
+
+		index++;
+	}
 	/* store xdpf for cleanup */
-	tx_buf->type = dma_map ? MTK_TYPE_XDP_NDO : MTK_TYPE_XDP_TX;
-	tx_buf->data = xdpf;
+	htx_buf->data = xdpf;
 
 	if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
 		txd_pdma = qdma_to_pdma(ring, txd);
@@ -1624,7 +1651,24 @@ static int mtk_xdp_submit_frame(struct mtk_eth *eth, struct xdp_frame *xdpf,
 		mtk_w32(eth, NEXT_DESP_IDX(idx, ring->dma_size),
 			MT7628_TX_CTX_IDX0);
 	}
-out:
+
+	spin_unlock(&eth->page_lock);
+
+	return 0;
+
+unmap:
+	while (htxd != txd) {
+		txd_pdma = qdma_to_pdma(ring, htxd);
+		tx_buf = mtk_desc_to_tx_buf(ring, htxd, soc->txrx.txd_size);
+		mtk_tx_unmap(eth, tx_buf, false);
+
+		htxd->txd3 = TX_DMA_LS0 | TX_DMA_OWNER_CPU;
+		if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA))
+			txd_pdma->txd2 = TX_DMA_DESP2_DEF;
+
+		htxd = mtk_qdma_phys_to_virt(ring, htxd->txd2);
+	}
+
 	spin_unlock(&eth->page_lock);
 
 	return err;
@@ -1953,18 +1997,15 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 		if (!tx_buf->data)
 			break;
 
-		if (tx_buf->type == MTK_TYPE_SKB &&
-		    tx_buf->data != (void *)MTK_DMA_DUMMY_DESC) {
-			struct sk_buff *skb = tx_buf->data;
+		if (tx_buf->data != (void *)MTK_DMA_DUMMY_DESC) {
+			if (tx_buf->type == MTK_TYPE_SKB) {
+				struct sk_buff *skb = tx_buf->data;
 
-			bytes[mac] += skb->len;
-			done[mac]++;
-			budget--;
-		} else if (tx_buf->type == MTK_TYPE_XDP_TX ||
-			   tx_buf->type == MTK_TYPE_XDP_NDO) {
+				bytes[mac] += skb->len;
+				done[mac]++;
+			}
 			budget--;
 		}
-
 		mtk_tx_unmap(eth, tx_buf, true);
 
 		ring->last_free = desc;
@@ -1995,17 +2036,15 @@ static int mtk_poll_tx_pdma(struct mtk_eth *eth, int budget,
 		if (!tx_buf->data)
 			break;
 
-		if (tx_buf->type == MTK_TYPE_SKB &&
-		    tx_buf->data != (void *)MTK_DMA_DUMMY_DESC) {
-			struct sk_buff *skb = tx_buf->data;
-			bytes[0] += skb->len;
-			done[0]++;
-			budget--;
-		} else if (tx_buf->type == MTK_TYPE_XDP_TX ||
-			   tx_buf->type == MTK_TYPE_XDP_NDO) {
+		if (tx_buf->data != (void *)MTK_DMA_DUMMY_DESC) {
+			if (tx_buf->type == MTK_TYPE_SKB) {
+				struct sk_buff *skb = tx_buf->data;
+
+				bytes[0] += skb->len;
+				done[0]++;
+			}
 			budget--;
 		}
-
 		mtk_tx_unmap(eth, tx_buf, true);
 
 		desc = ring->dma + cpu * eth->soc->txrx.txd_size;
-- 
2.37.1


