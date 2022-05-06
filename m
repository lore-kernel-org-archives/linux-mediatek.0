Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96329C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 12:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLTcjixRlRPZHjeZ1kDPgvIhcLr35nuuh307rIJPsrw=; b=dEI47B0gwXzZuo
	UktT8ZmkeAMuQZC6Q8v8HZnlwjzrKzs8L4KxGaIWquapFauHgOtwRUq6FhOlkjBO+GHtbanmf8wp1
	Mi+GNcEceCIMYxuZ8DjeeR2QO8tJ2OrdTb61oAdgnrZMc8rhI49HzjP6b/sT/sFiTPkMqBXH9SeVP
	+WZIcypfeyXxVhuhtL9fcATzWQ3efMiGIWSokSGqYd6NDhPCCS7Ek2LetIhDcwTsuVdQ8XiWQm7/b
	pU09ORUcfIEbpR8P/eUcWZrFjkT/YHeY5cRpAXcpZW9zvEytFBCOH9oIiGaXbjDnbTjZu0cKoA/lV
	xLLADqi4mk6GK6JX8+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmx7S-003BNK-0l; Fri, 06 May 2022 12:31:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmx7P-003BKT-0w
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 12:31:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9838761F89;
 Fri,  6 May 2022 12:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59497C385B1;
 Fri,  6 May 2022 12:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651840294;
 bh=58IWSSsRvKshbFdru4enHZgga/CVY0/Whqe26ozDW4E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X0zVET2pV1dRN+lYKDl9l8QZiVslUf6lcNa/I51mQLApbgXVnRFdYTXrz+QPxuDlo
 Wi7GKdwu4EyLdoXJbP3Q6Cl9U/lNyRpszejO8COgyXFtMHCoFhEukS+iHnm341R4He
 mNk7/9HJ6gSIF2I5TVnFgAlf5NgsGJIm4spxT5Y9VczCjODUerfqyx7H3EuFQexv5n
 HT9ilcuAf7ZiXUF6c7fak45L4j7aa7vXJoUI2yz9Gxa6McOcwfbZgirDxx092aMih1
 YEnNr0yZgMeJA2WNOEW12KGzKRNkUxYCqoFOpELWQOoBHYsC5QZYEWv++Hpzhz6AS3
 BCcgc0XYNOc6w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: [PATCH net-next 08/14] net: ethernet: mtk_eth_soc: add rxd_size to
 mtk_soc_data
Date: Fri,  6 May 2022 14:30:25 +0200
Message-Id: <35e76230f551e4a14e5f962a06e174b5f3561ca8.1651839494.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651839494.git.lorenzo@kernel.org>
References: <cover.1651839494.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_053135_171239_6FF148A3 
X-CRM114-Status: GOOD (  13.89  )
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

Similar to tx counterpart, introduce rxd_size in mtk_soc_data data
structure.
This is a preliminary patch to add mt7986 ethernet support.

Tested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 13 +++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 ++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index a67b22dbaac7..bb628b65a9e5 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1719,7 +1719,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 	}
 
 	ring->dma = dma_alloc_coherent(eth->dma_dev,
-				       rx_dma_size * sizeof(*ring->dma),
+				       rx_dma_size * eth->soc->txrx.rxd_size,
 				       &ring->phys, GFP_ATOMIC);
 	if (!ring->dma)
 		return -ENOMEM;
@@ -1777,9 +1777,8 @@ static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring)
 
 	if (ring->dma) {
 		dma_free_coherent(eth->dma_dev,
-				  ring->dma_size * sizeof(*ring->dma),
-				  ring->dma,
-				  ring->phys);
+				  ring->dma_size * eth->soc->txrx.rxd_size,
+				  ring->dma, ring->phys);
 		ring->dma = NULL;
 	}
 }
@@ -3370,6 +3369,7 @@ static const struct mtk_soc_data mt2701_data = {
 	.required_pctl = true,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
@@ -3381,6 +3381,7 @@ static const struct mtk_soc_data mt7621_data = {
 	.offload_version = 2,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
@@ -3393,6 +3394,7 @@ static const struct mtk_soc_data mt7622_data = {
 	.offload_version = 2,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
@@ -3404,6 +3406,7 @@ static const struct mtk_soc_data mt7623_data = {
 	.offload_version = 2,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
@@ -3415,6 +3418,7 @@ static const struct mtk_soc_data mt7629_data = {
 	.required_pctl = false,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
@@ -3425,6 +3429,7 @@ static const struct mtk_soc_data rt5350_data = {
 	.required_pctl = false,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 495f623b62ef..150d692633fa 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -866,6 +866,7 @@ struct mtk_tx_dma_desc_info {
  * @required_pctl		A bool value to show whether the SoC requires
  *				the extra setup for those pins used by GMAC.
  * @txd_size			TX DMA descriptor size.
+ * @rxd_size			RX DMA descriptor size.
  */
 struct mtk_soc_data {
 	u32             ana_rgc3;
@@ -876,6 +877,7 @@ struct mtk_soc_data {
 	netdev_features_t hw_features;
 	struct {
 		u32	txd_size;
+		u32	rxd_size;
 	} txrx;
 };
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
