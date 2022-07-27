Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11709C19F29
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 21:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaSs8dGxaegjU61rOKXsM9RYxQF8OjNVYPG3+1/JFL0=; b=iwzw6inWeo4nPz04IkyxQg8vp/
	ZRQ8Uhe/Xfl16wY1O8OL3N0QD4AxgvciS5vtXEFyV/vhAV0FKsAIMRgMp1iHUz2sXGhDjgJe4Stru
	A2IA2d2ma+TAYpurERuuElPfFJV9sJbDYHPcFtxIVaAGxj++KzFQBoJIcGQHmSouJZP+F8mr+2yJj
	zFb7q+wAxMcFPFNqMy8sx7XguXrPCPvvwxhe1QrGaP+adeQnmqTMvp32sLzXA2LXgEsmefpjJ3Y+U
	Z+ZXXD4d8jsxty+S9PdLHIfuVE8KBa7/omoNq/Z+Q9SLrl50siLQjFp/DNsGrgBD/hpwLGX1JVnZP
	uXpA75/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGoV1-000UDQ-HC; Wed, 27 Jul 2022 21:23:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGoUy-000UAz-Bn
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 21:23:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B76860A6D;
	Wed, 27 Jul 2022 21:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A35C433D7;
	Wed, 27 Jul 2022 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658956997;
	bh=52i8qhkewCTocArWVeX2hw4wQ14wMGLcqJ6y1FiFQFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SEMKLP4F4KK37Q9el1VFy934H2czJX1MSeUNd+Bm1MCFerO14LECG8eJW25AybOGj
	 MGqoLkWV2+9qm6dZKbrG0h/mhH4Z/+KRRiaIO7rEGNZfpj/Hu9SY4eK1oLzV0O8DCG
	 zjpKRJYoChQC9nQpfajj2qvxCz7DXNCWPS7M0VBrY7TAgRXTp3Gyo4noMOVvh7vvNd
	 2vJGY6p8DpPT7wNvhlz5olgYvPN/81J3FKzX1wuL0HTFc6HlwXBvgeMocqT9V2sus6
	 5dpjJhyuJFaRBClumFOVB9v0pxyhl7ExdRuHCYasiQZOC8pAwgSU4BFoldIzWX2xVW
	 iGyhBrhr/5hOw==
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
Subject: [PATCH net-next 3/3] net: ethernet: mtk_eth_soc: add xdp tx return bulking support
Date: Wed, 27 Jul 2022 23:20:52 +0200
Message-Id: <a5475bba4c5ce73aa9d5fd8b876bb3969b4df718.1658955249.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1658955249.git.lorenzo@kernel.org>
References: <cover.1658955249.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_142320_502806_0D7AFF4B 
X-CRM114-Status: GOOD (  14.36  )
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

Convert mtk_eth_soc driver to xdp_return_frame_bulk APIs.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 24235f8f0a8f..d9426b01f462 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1001,7 +1001,7 @@ static int txd_to_idx(struct mtk_tx_ring *ring, void *dma, u32 txd_size)
 }
 
 static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
-			 bool napi)
+			 struct xdp_frame_bulk *bq, bool napi)
 {
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
 		if (tx_buf->flags & MTK_TX_FLAGS_SINGLE0) {
@@ -1044,6 +1044,8 @@ static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
 
 			if (napi && tx_buf->type == MTK_TYPE_XDP_TX)
 				xdp_return_frame_rx_napi(xdpf);
+			else if (bq)
+				xdp_return_frame_bulk(xdpf, bq);
 			else
 				xdp_return_frame(xdpf);
 		}
@@ -1296,7 +1298,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 		tx_buf = mtk_desc_to_tx_buf(ring, itxd, soc->txrx.txd_size);
 
 		/* unmap dma */
-		mtk_tx_unmap(eth, tx_buf, false);
+		mtk_tx_unmap(eth, tx_buf, NULL, false);
 
 		itxd->txd3 = TX_DMA_LS0 | TX_DMA_OWNER_CPU;
 		if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA))
@@ -1660,7 +1662,7 @@ static int mtk_xdp_submit_frame(struct mtk_eth *eth, struct xdp_frame *xdpf,
 	while (htxd != txd) {
 		txd_pdma = qdma_to_pdma(ring, htxd);
 		tx_buf = mtk_desc_to_tx_buf(ring, htxd, soc->txrx.txd_size);
-		mtk_tx_unmap(eth, tx_buf, false);
+		mtk_tx_unmap(eth, tx_buf, NULL, false);
 
 		htxd->txd3 = TX_DMA_LS0 | TX_DMA_OWNER_CPU;
 		if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA))
@@ -1973,6 +1975,7 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 	const struct mtk_reg_map *reg_map = eth->soc->reg_map;
 	struct mtk_tx_ring *ring = &eth->tx_ring;
 	struct mtk_tx_buf *tx_buf;
+	struct xdp_frame_bulk bq;
 	struct mtk_tx_dma *desc;
 	u32 cpu, dma;
 
@@ -1980,6 +1983,7 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 	dma = mtk_r32(eth, reg_map->qdma.drx_ptr);
 
 	desc = mtk_qdma_phys_to_virt(ring, cpu);
+	xdp_frame_bulk_init(&bq);
 
 	while ((cpu != dma) && budget) {
 		u32 next_cpu = desc->txd2;
@@ -2006,13 +2010,14 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 			}
 			budget--;
 		}
-		mtk_tx_unmap(eth, tx_buf, true);
+		mtk_tx_unmap(eth, tx_buf, &bq, true);
 
 		ring->last_free = desc;
 		atomic_inc(&ring->free_count);
 
 		cpu = next_cpu;
 	}
+	xdp_flush_frame_bulk(&bq);
 
 	ring->last_free_ptr = cpu;
 	mtk_w32(eth, cpu, reg_map->qdma.crx_ptr);
@@ -2025,11 +2030,13 @@ static int mtk_poll_tx_pdma(struct mtk_eth *eth, int budget,
 {
 	struct mtk_tx_ring *ring = &eth->tx_ring;
 	struct mtk_tx_buf *tx_buf;
+	struct xdp_frame_bulk bq;
 	struct mtk_tx_dma *desc;
 	u32 cpu, dma;
 
 	cpu = ring->cpu_idx;
 	dma = mtk_r32(eth, MT7628_TX_DTX_IDX0);
+	xdp_frame_bulk_init(&bq);
 
 	while ((cpu != dma) && budget) {
 		tx_buf = &ring->buf[cpu];
@@ -2045,7 +2052,7 @@ static int mtk_poll_tx_pdma(struct mtk_eth *eth, int budget,
 			}
 			budget--;
 		}
-		mtk_tx_unmap(eth, tx_buf, true);
+		mtk_tx_unmap(eth, tx_buf, &bq, true);
 
 		desc = ring->dma + cpu * eth->soc->txrx.txd_size;
 		ring->last_free = desc;
@@ -2053,6 +2060,7 @@ static int mtk_poll_tx_pdma(struct mtk_eth *eth, int budget,
 
 		cpu = NEXT_DESP_IDX(cpu, ring->dma_size);
 	}
+	xdp_flush_frame_bulk(&bq);
 
 	ring->cpu_idx = cpu;
 
@@ -2262,7 +2270,7 @@ static void mtk_tx_clean(struct mtk_eth *eth)
 
 	if (ring->buf) {
 		for (i = 0; i < MTK_DMA_SIZE; i++)
-			mtk_tx_unmap(eth, &ring->buf[i], false);
+			mtk_tx_unmap(eth, &ring->buf[i], NULL, false);
 		kfree(ring->buf);
 		ring->buf = NULL;
 	}
-- 
2.37.1


