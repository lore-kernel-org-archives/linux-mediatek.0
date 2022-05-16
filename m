Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA83C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZliLkmeK2SWH7PGLC6uoWxoR9b46dgejUS+Qd4q3B1E=; b=WOEenGcQOe02RO
	t4hCcMmMTSYwUWt34BOX0KMMw5XHkuF+6F4KlRuDPjMZIcf3XpvoWXv9LOiVW21MnXH22D3AZSk5E
	xckWLtdCcnqywPxqL8aDRENe0ofP1QhmSDomqOXqKkPWcUfEIRwktbiqCBFEtLvN/GUm/4jN1nQIA
	JFLTYWfxpVS4pcJepr/L05WIRo0DfrLb9UA4noS3GpCUY69TRlxNOTpsrAkDo5i/4OQWp4Y4E/i4z
	9BJqrKLFtPDJ6FM+W8/7ZvxrRSMQ0kGDTct+2rQSnUkDDpOi+GxF34HaNpSY09pR0VrKTgRYXjsWG
	Ebp/vc4blq2+5VkaaFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdH2-008rm1-H8; Mon, 16 May 2022 16:08:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdGD-008rG0-Gx
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 16:07:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0ED9760FFA;
 Mon, 16 May 2022 16:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA28C385AA;
 Mon, 16 May 2022 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717272;
 bh=a3XU0e49ixn1FJ0IrvFS5xrudvBm8/hSAT0hJzRlaqs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tVMW0n2ZJuDDcaqWRaEFU7oRXI20dQn3aj4KCwUH0MCKizNkVddTxMiJCc1654EXR
 xpieU9dmDdiP5BzOq6ObqJL34gcDsSaB1zkdY6omvjKE65hjI7vaIk8JxRl0yNw0Is
 PGnI6Ayz9R1ifIwFbS1PJykhgaJWpM+AexAl+sEXbZemq6WTbrz15z/tQwseSy1j45
 A3Q7kdIOA9sZfx0r1G7niA3SGCcdbGoBt+x44Q6jSrCIqCov4NZcyM8KTepWNtoNQk
 sGeWaUKV6xLLGRPGTfYTwdzUQ7ceksU8DdNEyj28jukYTctVsgUvu9AA94q5PTMDnT
 UoWX19heEZbWA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v2 net-next 04/15] net: ethernet: mtk_eth_soc: add txd_size to
 mtk_soc_data
Date: Mon, 16 May 2022 18:06:31 +0200
Message-Id: <22bd1bd88c09205b9bf83ea4c3ab030d5dc6e670.1652716741.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090753_738059_19F83A04 
X-CRM114-Status: GOOD (  16.64  )
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

In order to remove mtk_tx_dma size dependency, introduce txd_size in
mtk_soc_data data structure. Rely on txd_size in mtk_init_fq_dma() and
mtk_dma_free() routines.
This is a preliminary patch to add mt7986 ethernet support.

Tested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 47 +++++++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 085c740779de..cde66463bf98 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -784,20 +784,20 @@ static inline bool mtk_rx_get_desc(struct mtk_rx_dma *rxd,
 /* the qdma core needs scratch memory to be setup */
 static int mtk_init_fq_dma(struct mtk_eth *eth)
 {
+	const struct mtk_soc_data *soc = eth->soc;
 	dma_addr_t phy_ring_tail;
 	int cnt = MTK_DMA_SIZE;
 	dma_addr_t dma_addr;
 	int i;
 
 	eth->scratch_ring = dma_alloc_coherent(eth->dma_dev,
-					       cnt * sizeof(struct mtk_tx_dma),
+					       cnt * soc->txrx.txd_size,
 					       &eth->phy_scratch_ring,
 					       GFP_ATOMIC);
 	if (unlikely(!eth->scratch_ring))
 		return -ENOMEM;
 
-	eth->scratch_head = kcalloc(cnt, MTK_QDMA_PAGE_SIZE,
-				    GFP_KERNEL);
+	eth->scratch_head = kcalloc(cnt, MTK_QDMA_PAGE_SIZE, GFP_KERNEL);
 	if (unlikely(!eth->scratch_head))
 		return -ENOMEM;
 
@@ -807,16 +807,19 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
 	if (unlikely(dma_mapping_error(eth->dma_dev, dma_addr)))
 		return -ENOMEM;
 
-	phy_ring_tail = eth->phy_scratch_ring +
-			(sizeof(struct mtk_tx_dma) * (cnt - 1));
+	phy_ring_tail = eth->phy_scratch_ring + soc->txrx.txd_size * (cnt - 1);
 
 	for (i = 0; i < cnt; i++) {
-		eth->scratch_ring[i].txd1 =
-					(dma_addr + (i * MTK_QDMA_PAGE_SIZE));
+		struct mtk_tx_dma *txd;
+
+		txd = (void *)eth->scratch_ring + i * soc->txrx.txd_size;
+		txd->txd1 = dma_addr + i * MTK_QDMA_PAGE_SIZE;
 		if (i < cnt - 1)
-			eth->scratch_ring[i].txd2 = (eth->phy_scratch_ring +
-				((i + 1) * sizeof(struct mtk_tx_dma)));
-		eth->scratch_ring[i].txd3 = TX_DMA_SDL(MTK_QDMA_PAGE_SIZE);
+			txd->txd2 = eth->phy_scratch_ring +
+				    (i + 1) * soc->txrx.txd_size;
+
+		txd->txd3 = TX_DMA_PLEN0(MTK_QDMA_PAGE_SIZE);
+		txd->txd4 = 0;
 	}
 
 	mtk_w32(eth, eth->phy_scratch_ring, MTK_QDMA_FQ_HEAD);
@@ -2108,6 +2111,7 @@ static int mtk_dma_init(struct mtk_eth *eth)
 
 static void mtk_dma_free(struct mtk_eth *eth)
 {
+	const struct mtk_soc_data *soc = eth->soc;
 	int i;
 
 	for (i = 0; i < MTK_MAC_COUNT; i++)
@@ -2115,9 +2119,8 @@ static void mtk_dma_free(struct mtk_eth *eth)
 			netdev_reset_queue(eth->netdev[i]);
 	if (eth->scratch_ring) {
 		dma_free_coherent(eth->dma_dev,
-				  MTK_DMA_SIZE * sizeof(struct mtk_tx_dma),
-				  eth->scratch_ring,
-				  eth->phy_scratch_ring);
+				  MTK_DMA_SIZE * soc->txrx.txd_size,
+				  eth->scratch_ring, eth->phy_scratch_ring);
 		eth->scratch_ring = NULL;
 		eth->phy_scratch_ring = 0;
 	}
@@ -3353,6 +3356,9 @@ static const struct mtk_soc_data mt2701_data = {
 	.hw_features = MTK_HW_FEATURES,
 	.required_clks = MT7623_CLKS_BITMAP,
 	.required_pctl = true,
+	.txrx = {
+		.txd_size = sizeof(struct mtk_tx_dma),
+	},
 };
 
 static const struct mtk_soc_data mt7621_data = {
@@ -3361,6 +3367,9 @@ static const struct mtk_soc_data mt7621_data = {
 	.required_clks = MT7621_CLKS_BITMAP,
 	.required_pctl = false,
 	.offload_version = 2,
+	.txrx = {
+		.txd_size = sizeof(struct mtk_tx_dma),
+	},
 };
 
 static const struct mtk_soc_data mt7622_data = {
@@ -3370,6 +3379,9 @@ static const struct mtk_soc_data mt7622_data = {
 	.required_clks = MT7622_CLKS_BITMAP,
 	.required_pctl = false,
 	.offload_version = 2,
+	.txrx = {
+		.txd_size = sizeof(struct mtk_tx_dma),
+	},
 };
 
 static const struct mtk_soc_data mt7623_data = {
@@ -3378,6 +3390,9 @@ static const struct mtk_soc_data mt7623_data = {
 	.required_clks = MT7623_CLKS_BITMAP,
 	.required_pctl = true,
 	.offload_version = 2,
+	.txrx = {
+		.txd_size = sizeof(struct mtk_tx_dma),
+	},
 };
 
 static const struct mtk_soc_data mt7629_data = {
@@ -3386,6 +3401,9 @@ static const struct mtk_soc_data mt7629_data = {
 	.hw_features = MTK_HW_FEATURES,
 	.required_clks = MT7629_CLKS_BITMAP,
 	.required_pctl = false,
+	.txrx = {
+		.txd_size = sizeof(struct mtk_tx_dma),
+	},
 };
 
 static const struct mtk_soc_data rt5350_data = {
@@ -3393,6 +3411,9 @@ static const struct mtk_soc_data rt5350_data = {
 	.hw_features = MTK_HW_FEATURES_MT7628,
 	.required_clks = MT7628_CLKS_BITMAP,
 	.required_pctl = false,
+	.txrx = {
+		.txd_size = sizeof(struct mtk_tx_dma),
+	},
 };
 
 const struct of_device_id of_mtk_match[] = {
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 5d940315c7ba..495f623b62ef 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -865,6 +865,7 @@ struct mtk_tx_dma_desc_info {
  *				the target SoC
  * @required_pctl		A bool value to show whether the SoC requires
  *				the extra setup for those pins used by GMAC.
+ * @txd_size			TX DMA descriptor size.
  */
 struct mtk_soc_data {
 	u32             ana_rgc3;
@@ -873,6 +874,9 @@ struct mtk_soc_data {
 	bool		required_pctl;
 	u8		offload_version;
 	netdev_features_t hw_features;
+	struct {
+		u32	txd_size;
+	} txrx;
 };
 
 /* currently no SoC has more than 2 macs */
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
