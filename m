Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A8FC19F4F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 10:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jg5dVr0zS6yygkmnE1hZdqlMs6iVCHqmRjpmbRxNJI=; b=H6R6fUUPySelmuMxwuv4P3Voy1
	SK6pKfikksZzipFpszXMgva2T9E2q8VAj9SUMhdOJnFmbGxGtwlOoE6gX8Ac1/EKjhEw5o+Qdm07E
	AqTC0PZAV3FEutaX/qtRKwdDkR8WAtmaWofebDxaZy6wSPsixcuWcbQ/8iJI4hvxDfPOZIUe+lEm4
	+e1/MlTzf5wb/T0qf+APkI3CjpRHWcJNtZzlZTQ+QleMrFfWnCB/Aqs3SCDyWfaU7qH4xGgTTEMsc
	fDtNhN+S2ObYYUb9gobR6X8Agtu5lFH2PHIV+ZfZuzbeplnQ8Ie9bcgNNkA+5qZgtD0sZTnAlyfE9
	DAWewaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4emP-0000000F2oo-1zLL;
	Wed, 08 May 2024 10:44:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4emK-0000000F2lt-1fEl;
	Wed, 08 May 2024 10:44:05 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s4emF-000000001cW-3S33;
	Wed, 08 May 2024 10:43:59 +0000
Date: Wed, 8 May 2024 11:43:56 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/2] net: ethernet: mediatek: use ADMAv1 instead of
 ADMAv2.0 on MT7981 and MT7986
Message-ID: <57cef74bbd0c243366ad1ff4221e3f72f437ec80.1715164770.git.daniel@makrotopia.org>
References: <70a799b1f060ec2f57883e88ccb420ac0fb0abb5.1715164770.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70a799b1f060ec2f57883e88ccb420ac0fb0abb5.1715164770.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_034404_545075_4049BE7A 
X-CRM114-Status: GOOD (  13.68  )
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

ADMAv2.0 is plagued by RX hangs which can't easily detected and happen upon
receival of a corrupted Ethernet frame.

Use ADMAv1 instead which is also still present and usable, and doesn't
suffer from that problem.

Fixes: 197c9e9b17b1 ("net: ethernet: mtk_eth_soc: introduce support for mt7986 chipset")
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: improve commit message
v3: resend because messages were accidentally sent inline

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 46 ++++++++++-----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 3eefb735ce19..d7d73295f0dc 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -110,16 +110,16 @@ static const struct mtk_reg_map mt7986_reg_map = {
 	.tx_irq_mask		= 0x461c,
 	.tx_irq_status		= 0x4618,
 	.pdma = {
-		.rx_ptr		= 0x6100,
-		.rx_cnt_cfg	= 0x6104,
-		.pcrx_ptr	= 0x6108,
-		.glo_cfg	= 0x6204,
-		.rst_idx	= 0x6208,
-		.delay_irq	= 0x620c,
-		.irq_status	= 0x6220,
-		.irq_mask	= 0x6228,
-		.adma_rx_dbg0	= 0x6238,
-		.int_grp	= 0x6250,
+		.rx_ptr		= 0x4100,
+		.rx_cnt_cfg	= 0x4104,
+		.pcrx_ptr	= 0x4108,
+		.glo_cfg	= 0x4204,
+		.rst_idx	= 0x4208,
+		.delay_irq	= 0x420c,
+		.irq_status	= 0x4220,
+		.irq_mask	= 0x4228,
+		.adma_rx_dbg0	= 0x4238,
+		.int_grp	= 0x4250,
 	},
 	.qdma = {
 		.qtx_cfg	= 0x4400,
@@ -1107,7 +1107,7 @@ static bool mtk_rx_get_desc(struct mtk_eth *eth, struct mtk_rx_dma_v2 *rxd,
 	rxd->rxd1 = READ_ONCE(dma_rxd->rxd1);
 	rxd->rxd3 = READ_ONCE(dma_rxd->rxd3);
 	rxd->rxd4 = READ_ONCE(dma_rxd->rxd4);
-	if (mtk_is_netsys_v2_or_greater(eth)) {
+	if (mtk_is_netsys_v3_or_greater(eth)) {
 		rxd->rxd5 = READ_ONCE(dma_rxd->rxd5);
 		rxd->rxd6 = READ_ONCE(dma_rxd->rxd6);
 	}
@@ -2028,7 +2028,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			break;
 
 		/* find out which mac the packet come from. values start at 1 */
-		if (mtk_is_netsys_v2_or_greater(eth)) {
+		if (mtk_is_netsys_v3_or_greater(eth)) {
 			u32 val = RX_DMA_GET_SPORT_V2(trxd.rxd5);
 
 			switch (val) {
@@ -2140,7 +2140,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		skb->dev = netdev;
 		bytes += skb->len;
 
-		if (mtk_is_netsys_v2_or_greater(eth)) {
+		if (mtk_is_netsys_v3_or_greater(eth)) {
 			reason = FIELD_GET(MTK_RXD5_PPE_CPU_REASON, trxd.rxd5);
 			hash = trxd.rxd5 & MTK_RXD5_FOE_ENTRY;
 			if (hash != MTK_RXD5_FOE_ENTRY)
@@ -2690,7 +2690,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 
 		rxd->rxd3 = 0;
 		rxd->rxd4 = 0;
-		if (mtk_is_netsys_v2_or_greater(eth)) {
+		if (mtk_is_netsys_v3_or_greater(eth)) {
 			rxd->rxd5 = 0;
 			rxd->rxd6 = 0;
 			rxd->rxd7 = 0;
@@ -3893,7 +3893,7 @@ static int mtk_hw_init(struct mtk_eth *eth, bool reset)
 	else
 		mtk_hw_reset(eth);
 
-	if (mtk_is_netsys_v2_or_greater(eth)) {
+	if (mtk_is_netsys_v3_or_greater(eth)) {
 		/* Set FE to PDMAv2 if necessary */
 		val = mtk_r32(eth, MTK_FE_GLO_MISC);
 		mtk_w32(eth,  val | BIT(4), MTK_FE_GLO_MISC);
@@ -5169,11 +5169,11 @@ static const struct mtk_soc_data mt7981_data = {
 		.dma_len_offset = 8,
 	},
 	.rx = {
-		.desc_size = sizeof(struct mtk_rx_dma_v2),
-		.irq_done_mask = MTK_RX_DONE_INT_V2,
+		.desc_size = sizeof(struct mtk_rx_dma),
+		.irq_done_mask = MTK_RX_DONE_INT,
 		.dma_l4_valid = RX_DMA_L4_VALID_V2,
-		.dma_max_len = MTK_TX_DMA_BUF_LEN_V2,
-		.dma_len_offset = 8,
+		.dma_max_len = MTK_TX_DMA_BUF_LEN,
+		.dma_len_offset = 16,
 	},
 };
 
@@ -5195,11 +5195,11 @@ static const struct mtk_soc_data mt7986_data = {
 		.dma_len_offset = 8,
 	},
 	.rx = {
-		.desc_size = sizeof(struct mtk_rx_dma_v2),
-		.irq_done_mask = MTK_RX_DONE_INT_V2,
+		.desc_size = sizeof(struct mtk_rx_dma),
+		.irq_done_mask = MTK_RX_DONE_INT,
 		.dma_l4_valid = RX_DMA_L4_VALID_V2,
-		.dma_max_len = MTK_TX_DMA_BUF_LEN_V2,
-		.dma_len_offset = 8,
+		.dma_max_len = MTK_TX_DMA_BUF_LEN,
+		.dma_len_offset = 16,
 	},
 };
 
-- 
2.45.0

