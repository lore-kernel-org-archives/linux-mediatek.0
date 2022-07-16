Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B234C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 07:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5ifM6v7TW/NmtJYwIHYsdFy3T8pugmGA3IGcqveUL8=; b=M3oZjojR7/a8PtEwgh7s7lpNyW
	w7Bu9oT6AE38zz3ny/YZfimbSQxaGe8nA49kkK8pCg3oYEGdCoto/P3M2AkQmIG0m2QgPcMHSmgsw
	Xz5Qbn/YJBP8jEsilBIofxdxDY6lVIXcL5oiVpQ75w2pI9fRm8xUPh6Bx0Tw8vEEW31CNQpY87qRy
	cP5lc5J55cNcKazkLU7FeOA3r7iw0lwhGcXUDlPfIUia6pXDVTlziepWuBzaQ8X7+LL8BGTkSEued
	HockhacTHmXJg+gKUm0RYI6bNghjaii3qoKzulIkT5tcmareQyHMZlgc7rgXMMDWOVFEnQwSI9Pr2
	dwJF1UMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcKU-00ETBu-9U; Sat, 16 Jul 2022 07:35:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCcKP-00ET7D-JT
	for linux-mediatek@lists.infradead.org; Sat, 16 Jul 2022 07:35:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 266A8B82F58;
	Sat, 16 Jul 2022 07:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C958C34114;
	Sat, 16 Jul 2022 07:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657956902;
	bh=HmXlT5MeoapjXo5g95SISHMIPOECYvB3oalAikTZRBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=feIPYuLom1Cer6kH1CTrO96db0rAczPND1K1r/PIDtcXtcteoKpaayVDRDYeydrjn
	 lf6nPxaHm9QOEfBUQR1IQXsIuqGW388ySdNIbxWjh+y1o0nAEyMy9hl0261Mi3G9FW
	 dftjYVwkhYF+aMOWOyJwWgYSAZy6+qzNz9g1hgfQQg7heJFyUeGaGskwCfUp/ifZsw
	 W5DAL01ySm/dogkCZMJx7uRHonqg9ID0n2oTRGK3MJwPrNv8yDA8CZX7OxseynzqAB
	 jOgu+MEiWek42Vwzh+Wnrcs0ptgGjcQokAAQxbbwzN4a4XOXY2M8jZ82p2MmGN5/00
	 Hz0F8dpHLiXBg==
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
Subject: [PATCH v3 net-next 4/5] net: ethernet: mtk_eth_soc: add xmit XDP support
Date: Sat, 16 Jul 2022 09:34:30 +0200
Message-Id: <f5f5c0f4c14d67345bf2c71f78f0cf2d976867df.1657956652.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657956652.git.lorenzo@kernel.org>
References: <cover.1657956652.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_003505_995305_02B40053 
X-CRM114-Status: GOOD (  23.74  )
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

Introduce XDP support for XDP_TX verdict and ndo_xdp_xmit function
pointer.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 192 +++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  10 +-
 2 files changed, 180 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e4715b6cc978..abb8bc281015 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1031,15 +1031,26 @@ static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
 		}
 	}
 
-	tx_buf->flags = 0;
-	if (tx_buf->skb &&
-	    (tx_buf->skb != (struct sk_buff *)MTK_DMA_DUMMY_DESC)) {
-		if (napi)
-			napi_consume_skb(tx_buf->skb, napi);
+	if (tx_buf->type == MTK_TYPE_SKB) {
+		if (tx_buf->data &&
+		    tx_buf->data != (void *)MTK_DMA_DUMMY_DESC) {
+			struct sk_buff *skb = tx_buf->data;
+
+			if (napi)
+				napi_consume_skb(skb, napi);
+			else
+				dev_kfree_skb_any(skb);
+		}
+	} else if (tx_buf->data) {
+		struct xdp_frame *xdpf = tx_buf->data;
+
+		if (napi && tx_buf->type == MTK_TYPE_XDP_TX)
+			xdp_return_frame_rx_napi(xdpf);
 		else
-			dev_kfree_skb_any(tx_buf->skb);
+			xdp_return_frame(xdpf);
 	}
-	tx_buf->skb = NULL;
+	tx_buf->flags = 0;
+	tx_buf->data = NULL;
 }
 
 static void setup_tx_buf(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
@@ -1056,7 +1067,7 @@ static void setup_tx_buf(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
 			dma_unmap_addr_set(tx_buf, dma_addr1, mapped_addr);
 			dma_unmap_len_set(tx_buf, dma_len1, size);
 		} else {
-			tx_buf->skb = (struct sk_buff *)MTK_DMA_DUMMY_DESC;
+			tx_buf->data = (void *)MTK_DMA_DUMMY_DESC;
 			txd->txd1 = mapped_addr;
 			txd->txd2 = TX_DMA_PLEN0(size);
 			dma_unmap_addr_set(tx_buf, dma_addr0, mapped_addr);
@@ -1232,7 +1243,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 						    soc->txrx.txd_size);
 			if (new_desc)
 				memset(tx_buf, 0, sizeof(*tx_buf));
-			tx_buf->skb = (struct sk_buff *)MTK_DMA_DUMMY_DESC;
+			tx_buf->data = (void *)MTK_DMA_DUMMY_DESC;
 			tx_buf->flags |= MTK_TX_FLAGS_PAGE0;
 			tx_buf->flags |= (!mac->id) ? MTK_TX_FLAGS_FPORT0 :
 					 MTK_TX_FLAGS_FPORT1;
@@ -1246,7 +1257,8 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 	}
 
 	/* store skb to cleanup */
-	itx_buf->skb = skb;
+	itx_buf->type = MTK_TYPE_SKB;
+	itx_buf->data = skb;
 
 	if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
 		if (k & 0x1)
@@ -1453,13 +1465,14 @@ static struct page_pool *mtk_create_page_pool(struct mtk_eth *eth,
 		.pool_size = size,
 		.nid = NUMA_NO_NODE,
 		.dev = eth->dma_dev,
-		.dma_dir = DMA_FROM_DEVICE,
 		.offset = MTK_PP_HEADROOM,
 		.max_len = MTK_PP_MAX_BUF_SIZE,
 	};
 	struct page_pool *pp;
 	int err;
 
+	pp_params.dma_dir = rcu_access_pointer(eth->prog) ? DMA_BIDIRECTIONAL
+							  : DMA_FROM_DEVICE;
 	pp = page_pool_create(&pp_params);
 	if (IS_ERR(pp))
 		return pp;
@@ -1505,6 +1518,122 @@ static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
 		skb_free_frag(data);
 }
 
+static int mtk_xdp_submit_frame(struct mtk_eth *eth, struct xdp_frame *xdpf,
+				struct net_device *dev, bool dma_map)
+{
+	const struct mtk_soc_data *soc = eth->soc;
+	struct mtk_tx_ring *ring = &eth->tx_ring;
+	struct mtk_tx_dma_desc_info txd_info = {
+		.size	= xdpf->len,
+		.first	= true,
+		.last	= true,
+	};
+	struct mtk_mac *mac = netdev_priv(dev);
+	struct mtk_tx_dma *txd, *txd_pdma;
+	int err = 0, index = 0, n_desc = 1;
+	struct mtk_tx_buf *tx_buf;
+
+	if (unlikely(test_bit(MTK_RESETTING, &eth->state)))
+		return -EBUSY;
+
+	if (unlikely(atomic_read(&ring->free_count) <= 1))
+		return -EBUSY;
+
+	spin_lock(&eth->page_lock);
+
+	txd = ring->next_free;
+	if (txd == ring->last_free) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	tx_buf = mtk_desc_to_tx_buf(ring, txd, soc->txrx.txd_size);
+	memset(tx_buf, 0, sizeof(*tx_buf));
+
+	if (dma_map) {  /* ndo_xdp_xmit */
+		txd_info.addr = dma_map_single(eth->dma_dev, xdpf->data,
+					       txd_info.size, DMA_TO_DEVICE);
+		if (unlikely(dma_mapping_error(eth->dma_dev, txd_info.addr))) {
+			err = -ENOMEM;
+			goto out;
+		}
+		tx_buf->flags |= MTK_TX_FLAGS_SINGLE0;
+	} else {
+		struct page *page = virt_to_head_page(xdpf->data);
+
+		txd_info.addr = page_pool_get_dma_addr(page) +
+				sizeof(*xdpf) + xdpf->headroom;
+		dma_sync_single_for_device(eth->dma_dev, txd_info.addr,
+					   txd_info.size,
+					   DMA_BIDIRECTIONAL);
+	}
+	mtk_tx_set_dma_desc(dev, txd, &txd_info);
+
+	tx_buf->flags |= !mac->id ? MTK_TX_FLAGS_FPORT0 : MTK_TX_FLAGS_FPORT1;
+
+	txd_pdma = qdma_to_pdma(ring, txd);
+	setup_tx_buf(eth, tx_buf, txd_pdma, txd_info.addr, txd_info.size,
+		     index++);
+
+	/* store xdpf for cleanup */
+	tx_buf->type = dma_map ? MTK_TYPE_XDP_NDO : MTK_TYPE_XDP_TX;
+	tx_buf->data = xdpf;
+
+	if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
+		if (index & 1)
+			txd_pdma->txd2 |= TX_DMA_LS0;
+		else
+			txd_pdma->txd2 |= TX_DMA_LS1;
+	}
+
+	ring->next_free = mtk_qdma_phys_to_virt(ring, txd->txd2);
+	atomic_sub(n_desc, &ring->free_count);
+
+	/* make sure that all changes to the dma ring are flushed before we
+	 * continue
+	 */
+	wmb();
+
+	if (MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
+		mtk_w32(eth, txd->txd2, soc->reg_map->qdma.ctx_ptr);
+	} else {
+		int idx;
+
+		idx = txd_to_idx(ring, txd, soc->txrx.txd_size);
+		mtk_w32(eth, NEXT_DESP_IDX(idx, ring->dma_size),
+			MT7628_TX_CTX_IDX0);
+	}
+out:
+	spin_unlock(&eth->page_lock);
+
+	return err;
+}
+
+static int mtk_xdp_xmit(struct net_device *dev, int num_frame,
+			struct xdp_frame **frames, u32 flags)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+	struct mtk_hw_stats *hw_stats = mac->hw_stats;
+	struct mtk_eth *eth = mac->hw;
+	int i, nxmit = 0;
+
+	if (unlikely(flags & ~XDP_XMIT_FLAGS_MASK))
+		return -EINVAL;
+
+	for (i = 0; i < num_frame; i++) {
+		if (mtk_xdp_submit_frame(eth, frames[i], dev, true))
+			break;
+		nxmit++;
+	}
+
+	u64_stats_update_begin(&hw_stats->syncp);
+	hw_stats->xdp_stats.tx_xdp_xmit += nxmit;
+	hw_stats->xdp_stats.tx_xdp_xmit_errors += num_frame - nxmit;
+	u64_stats_update_end(&hw_stats->syncp);
+
+	return nxmit;
+}
+
 static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
 		       struct xdp_buff *xdp, struct net_device *dev)
 {
@@ -1530,6 +1659,18 @@ static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
 
 		count = &hw_stats->xdp_stats.rx_xdp_redirect;
 		goto update_stats;
+	case XDP_TX: {
+		struct xdp_frame *xdpf = xdp_convert_buff_to_frame(xdp);
+
+		if (mtk_xdp_submit_frame(eth, xdpf, dev, false)) {
+			count = &hw_stats->xdp_stats.rx_xdp_tx_errors;
+			act = XDP_DROP;
+			break;
+		}
+
+		count = &hw_stats->xdp_stats.rx_xdp_tx;
+		goto update_stats;
+	}
 	default:
 		bpf_warn_invalid_xdp_action(dev, prog, act);
 		fallthrough;
@@ -1760,9 +1901,8 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 {
 	const struct mtk_reg_map *reg_map = eth->soc->reg_map;
 	struct mtk_tx_ring *ring = &eth->tx_ring;
-	struct mtk_tx_dma *desc;
-	struct sk_buff *skb;
 	struct mtk_tx_buf *tx_buf;
+	struct mtk_tx_dma *desc;
 	u32 cpu, dma;
 
 	cpu = ring->last_free_ptr;
@@ -1783,15 +1923,21 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 		if (tx_buf->flags & MTK_TX_FLAGS_FPORT1)
 			mac = 1;
 
-		skb = tx_buf->skb;
-		if (!skb)
+		if (!tx_buf->data)
 			break;
 
-		if (skb != (struct sk_buff *)MTK_DMA_DUMMY_DESC) {
+		if (tx_buf->type == MTK_TYPE_SKB &&
+		    tx_buf->data != (void *)MTK_DMA_DUMMY_DESC) {
+			struct sk_buff *skb = tx_buf->data;
+
 			bytes[mac] += skb->len;
 			done[mac]++;
 			budget--;
+		} else if (tx_buf->type == MTK_TYPE_XDP_TX ||
+			   tx_buf->type == MTK_TYPE_XDP_NDO) {
+			budget--;
 		}
+
 		mtk_tx_unmap(eth, tx_buf, true);
 
 		ring->last_free = desc;
@@ -1810,9 +1956,8 @@ static int mtk_poll_tx_pdma(struct mtk_eth *eth, int budget,
 			    unsigned int *done, unsigned int *bytes)
 {
 	struct mtk_tx_ring *ring = &eth->tx_ring;
-	struct mtk_tx_dma *desc;
-	struct sk_buff *skb;
 	struct mtk_tx_buf *tx_buf;
+	struct mtk_tx_dma *desc;
 	u32 cpu, dma;
 
 	cpu = ring->cpu_idx;
@@ -1820,14 +1965,18 @@ static int mtk_poll_tx_pdma(struct mtk_eth *eth, int budget,
 
 	while ((cpu != dma) && budget) {
 		tx_buf = &ring->buf[cpu];
-		skb = tx_buf->skb;
-		if (!skb)
+		if (!tx_buf->data)
 			break;
 
-		if (skb != (struct sk_buff *)MTK_DMA_DUMMY_DESC) {
+		if (tx_buf->type == MTK_TYPE_SKB &&
+		    tx_buf->data != (void *)MTK_DMA_DUMMY_DESC) {
+			struct sk_buff *skb = tx_buf->data;
 			bytes[0] += skb->len;
 			done[0]++;
 			budget--;
+		} else if (tx_buf->type == MTK_TYPE_XDP_TX ||
+			   tx_buf->type == MTK_TYPE_XDP_NDO) {
+			budget--;
 		}
 
 		mtk_tx_unmap(eth, tx_buf, true);
@@ -3507,6 +3656,7 @@ static const struct net_device_ops mtk_netdev_ops = {
 #endif
 	.ndo_setup_tc		= mtk_eth_setup_tc,
 	.ndo_bpf		= mtk_xdp,
+	.ndo_xdp_xmit		= mtk_xdp_xmit,
 };
 
 static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 2775da1a6ec3..7405c97cda66 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -696,6 +696,12 @@ enum mtk_dev_state {
 	MTK_RESETTING
 };
 
+enum mtk_tx_buf_type {
+	MTK_TYPE_SKB,
+	MTK_TYPE_XDP_TX,
+	MTK_TYPE_XDP_NDO,
+};
+
 /* struct mtk_tx_buf -	This struct holds the pointers to the memory pointed at
  *			by the TX descriptor	s
  * @skb:		The SKB pointer of the packet being sent
@@ -705,7 +711,9 @@ enum mtk_dev_state {
  * @dma_len1:		The length of the second segment
  */
 struct mtk_tx_buf {
-	struct sk_buff *skb;
+	enum mtk_tx_buf_type type;
+	void *data;
+
 	u32 flags;
 	DEFINE_DMA_UNMAP_ADDR(dma_addr0);
 	DEFINE_DMA_UNMAP_LEN(dma_len0);
-- 
2.36.1


