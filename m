Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 10:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mdvHJgB/oXJbAH3wtnuT4FmuyAVQ5BpX14q1hLXxq0=; b=aApZC/tFfYFpFO
	F2PX2eQ6/wD2P7CJKXdEWEgVlBYp212BOWx0XtCEKH1gddEh1JNNxOKVR0Qj/e6BA3hV6mDU9//KC
	8M6KfjCJ5mxdOAnlTC73HwmcmyUAaBE30JccUYO1qelHAH2ilG7C5OoscCTBehqGbakIlMkFQEY8B
	9YmlYzipJ8qJVKg0PHUHiN0/6RBwuc1bBBC+SVtFPVpDSDqv89pzR12VLVvkW2oimiHbBU2i6nS5f
	KeiwXIBoIR+EiKtfDAJV4ylU5agrgwCt8YVBnbOHwRvPXLaJ9yS/hoFITFEiHjFkkcgRFT5D8ADS8
	c3IzsYCZIJRLJVxfEYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNXiQ-004KgH-9N; Fri, 25 Feb 2022 10:20:46 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNXg8-004JYK-Os; Fri, 25 Feb 2022 10:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=06OCQCfzRM3AQk74DAkSaoO7ceaJRK4FzE+cUvlP0yg=; b=DXyZLSJwxmKtn4w0aXvBNK4f0G
 hdclrVv331n2QhRNadvci/MPIbeAtX/CRz56uu7dArWsYHE7nO0bflzD+9f+VY31WmHyGYtvVhsFC
 CgieAqrKz+wwch9i+/X6RfkEMBc7b/7cCvdJMDmORyeMhj2Zskgw5Teg/YleRMoxhzMM=;
Received: from p200300daa7204f00f847964d075b2b3d.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:f847:964d:75b:2b3d] helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nNXfx-0007J1-Dl; Fri, 25 Feb 2022 11:18:13 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] net: ethernet: mtk_eth_soc: add support for coherent DMA
Date: Fri, 25 Feb 2022 11:18:00 +0100
Message-Id: <20220225101811.72103-2-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220225101811.72103-1-nbd@nbd.name>
References: <20220225101811.72103-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_021825_062242_713577DB 
X-CRM114-Status: GOOD (  23.09  )
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

It improves performance by eliminating the need for a cache flush on rx and tx
In preparation for supporting WED (Wireless Ethernet Dispatch), also add a
function for disabling coherent DMA at runtime.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 95 +++++++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  9 ++
 2 files changed, 80 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f02d07ec5ccb..70db217ed831 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -9,6 +9,7 @@
 #include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
+#include <linux/of_address.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/clk.h>
@@ -786,7 +787,7 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
 	dma_addr_t dma_addr;
 	int i;
 
-	eth->scratch_ring = dma_alloc_coherent(eth->dev,
+	eth->scratch_ring = dma_alloc_coherent(eth->dma_dev,
 					       cnt * sizeof(struct mtk_tx_dma),
 					       &eth->phy_scratch_ring,
 					       GFP_ATOMIC);
@@ -798,10 +799,10 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
 	if (unlikely(!eth->scratch_head))
 		return -ENOMEM;
 
-	dma_addr = dma_map_single(eth->dev,
+	dma_addr = dma_map_single(eth->dma_dev,
 				  eth->scratch_head, cnt * MTK_QDMA_PAGE_SIZE,
 				  DMA_FROM_DEVICE);
-	if (unlikely(dma_mapping_error(eth->dev, dma_addr)))
+	if (unlikely(dma_mapping_error(eth->dma_dev, dma_addr)))
 		return -ENOMEM;
 
 	phy_ring_tail = eth->phy_scratch_ring +
@@ -855,26 +856,26 @@ static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
 {
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
 		if (tx_buf->flags & MTK_TX_FLAGS_SINGLE0) {
-			dma_unmap_single(eth->dev,
+			dma_unmap_single(eth->dma_dev,
 					 dma_unmap_addr(tx_buf, dma_addr0),
 					 dma_unmap_len(tx_buf, dma_len0),
 					 DMA_TO_DEVICE);
 		} else if (tx_buf->flags & MTK_TX_FLAGS_PAGE0) {
-			dma_unmap_page(eth->dev,
+			dma_unmap_page(eth->dma_dev,
 				       dma_unmap_addr(tx_buf, dma_addr0),
 				       dma_unmap_len(tx_buf, dma_len0),
 				       DMA_TO_DEVICE);
 		}
 	} else {
 		if (dma_unmap_len(tx_buf, dma_len0)) {
-			dma_unmap_page(eth->dev,
+			dma_unmap_page(eth->dma_dev,
 				       dma_unmap_addr(tx_buf, dma_addr0),
 				       dma_unmap_len(tx_buf, dma_len0),
 				       DMA_TO_DEVICE);
 		}
 
 		if (dma_unmap_len(tx_buf, dma_len1)) {
-			dma_unmap_page(eth->dev,
+			dma_unmap_page(eth->dma_dev,
 				       dma_unmap_addr(tx_buf, dma_addr1),
 				       dma_unmap_len(tx_buf, dma_len1),
 				       DMA_TO_DEVICE);
@@ -952,9 +953,9 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 	if (skb_vlan_tag_present(skb))
 		txd4 |= TX_DMA_INS_VLAN | skb_vlan_tag_get(skb);
 
-	mapped_addr = dma_map_single(eth->dev, skb->data,
+	mapped_addr = dma_map_single(eth->dma_dev, skb->data,
 				     skb_headlen(skb), DMA_TO_DEVICE);
-	if (unlikely(dma_mapping_error(eth->dev, mapped_addr)))
+	if (unlikely(dma_mapping_error(eth->dma_dev, mapped_addr)))
 		return -ENOMEM;
 
 	WRITE_ONCE(itxd->txd1, mapped_addr);
@@ -993,10 +994,10 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 
 
 			frag_map_size = min(frag_size, MTK_TX_DMA_BUF_LEN);
-			mapped_addr = skb_frag_dma_map(eth->dev, frag, offset,
+			mapped_addr = skb_frag_dma_map(eth->dma_dev, frag, offset,
 						       frag_map_size,
 						       DMA_TO_DEVICE);
-			if (unlikely(dma_mapping_error(eth->dev, mapped_addr)))
+			if (unlikely(dma_mapping_error(eth->dma_dev, mapped_addr)))
 				goto err_dma;
 
 			if (i == nr_frags - 1 &&
@@ -1274,18 +1275,18 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			netdev->stats.rx_dropped++;
 			goto release_desc;
 		}
-		dma_addr = dma_map_single(eth->dev,
+		dma_addr = dma_map_single(eth->dma_dev,
 					  new_data + NET_SKB_PAD +
 					  eth->ip_align,
 					  ring->buf_size,
 					  DMA_FROM_DEVICE);
-		if (unlikely(dma_mapping_error(eth->dev, dma_addr))) {
+		if (unlikely(dma_mapping_error(eth->dma_dev, dma_addr))) {
 			skb_free_frag(new_data);
 			netdev->stats.rx_dropped++;
 			goto release_desc;
 		}
 
-		dma_unmap_single(eth->dev, trxd.rxd1,
+		dma_unmap_single(eth->dma_dev, trxd.rxd1,
 				 ring->buf_size, DMA_FROM_DEVICE);
 
 		/* receive data */
@@ -1558,7 +1559,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 	if (!ring->buf)
 		goto no_tx_mem;
 
-	ring->dma = dma_alloc_coherent(eth->dev, MTK_DMA_SIZE * sz,
+	ring->dma = dma_alloc_coherent(eth->dma_dev, MTK_DMA_SIZE * sz,
 				       &ring->phys, GFP_ATOMIC);
 	if (!ring->dma)
 		goto no_tx_mem;
@@ -1576,7 +1577,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 	 * descriptors in ring->dma_pdma.
 	 */
 	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
-		ring->dma_pdma = dma_alloc_coherent(eth->dev, MTK_DMA_SIZE * sz,
+		ring->dma_pdma = dma_alloc_coherent(eth->dma_dev, MTK_DMA_SIZE * sz,
 						    &ring->phys_pdma,
 						    GFP_ATOMIC);
 		if (!ring->dma_pdma)
@@ -1635,7 +1636,7 @@ static void mtk_tx_clean(struct mtk_eth *eth)
 	}
 
 	if (ring->dma) {
-		dma_free_coherent(eth->dev,
+		dma_free_coherent(eth->dma_dev,
 				  MTK_DMA_SIZE * sizeof(*ring->dma),
 				  ring->dma,
 				  ring->phys);
@@ -1643,7 +1644,7 @@ static void mtk_tx_clean(struct mtk_eth *eth)
 	}
 
 	if (ring->dma_pdma) {
-		dma_free_coherent(eth->dev,
+		dma_free_coherent(eth->dma_dev,
 				  MTK_DMA_SIZE * sizeof(*ring->dma_pdma),
 				  ring->dma_pdma,
 				  ring->phys_pdma);
@@ -1688,18 +1689,18 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 			return -ENOMEM;
 	}
 
-	ring->dma = dma_alloc_coherent(eth->dev,
+	ring->dma = dma_alloc_coherent(eth->dma_dev,
 				       rx_dma_size * sizeof(*ring->dma),
 				       &ring->phys, GFP_ATOMIC);
 	if (!ring->dma)
 		return -ENOMEM;
 
 	for (i = 0; i < rx_dma_size; i++) {
-		dma_addr_t dma_addr = dma_map_single(eth->dev,
+		dma_addr_t dma_addr = dma_map_single(eth->dma_dev,
 				ring->data[i] + NET_SKB_PAD + eth->ip_align,
 				ring->buf_size,
 				DMA_FROM_DEVICE);
-		if (unlikely(dma_mapping_error(eth->dev, dma_addr)))
+		if (unlikely(dma_mapping_error(eth->dma_dev, dma_addr)))
 			return -ENOMEM;
 		ring->dma[i].rxd1 = (unsigned int)dma_addr;
 
@@ -1735,7 +1736,7 @@ static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring)
 				continue;
 			if (!ring->dma[i].rxd1)
 				continue;
-			dma_unmap_single(eth->dev,
+			dma_unmap_single(eth->dma_dev,
 					 ring->dma[i].rxd1,
 					 ring->buf_size,
 					 DMA_FROM_DEVICE);
@@ -1746,7 +1747,7 @@ static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring)
 	}
 
 	if (ring->dma) {
-		dma_free_coherent(eth->dev,
+		dma_free_coherent(eth->dma_dev,
 				  ring->dma_size * sizeof(*ring->dma),
 				  ring->dma,
 				  ring->phys);
@@ -2099,7 +2100,7 @@ static void mtk_dma_free(struct mtk_eth *eth)
 		if (eth->netdev[i])
 			netdev_reset_queue(eth->netdev[i]);
 	if (eth->scratch_ring) {
-		dma_free_coherent(eth->dev,
+		dma_free_coherent(eth->dma_dev,
 				  MTK_DMA_SIZE * sizeof(struct mtk_tx_dma),
 				  eth->scratch_ring,
 				  eth->phy_scratch_ring);
@@ -2448,6 +2449,8 @@ static void mtk_dim_tx(struct work_struct *work)
 
 static int mtk_hw_init(struct mtk_eth *eth)
 {
+	u32 dma_mask = ETHSYS_DMA_AG_MAP_PDMA | ETHSYS_DMA_AG_MAP_QDMA |
+		       ETHSYS_DMA_AG_MAP_PPE;
 	int i, val, ret;
 
 	if (test_and_set_bit(MTK_HW_INIT, &eth->state))
@@ -2460,6 +2463,10 @@ static int mtk_hw_init(struct mtk_eth *eth)
 	if (ret)
 		goto err_disable_pm;
 
+	if (eth->ethsys)
+		regmap_update_bits(eth->ethsys, ETHSYS_DMA_AG_MAP, dma_mask,
+				   of_dma_is_coherent(eth->dma_dev->of_node) * dma_mask);
+
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
 		ret = device_reset(eth->dev);
 		if (ret) {
@@ -3040,6 +3047,35 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	return err;
 }
 
+void mtk_eth_set_dma_device(struct mtk_eth *eth, struct device *dma_dev)
+{
+	struct net_device *dev, *tmp;
+	LIST_HEAD(dev_list);
+	int i;
+
+	rtnl_lock();
+
+	for (i = 0; i < MTK_MAC_COUNT; i++) {
+		dev = eth->netdev[i];
+
+		if (!dev || !(dev->flags & IFF_UP))
+			continue;
+
+		list_add_tail(&dev->close_list, &dev_list);
+	}
+
+	dev_close_many(&dev_list, false);
+
+	eth->dma_dev = dma_dev;
+
+	list_for_each_entry_safe(dev, tmp, &dev_list, close_list) {
+		list_del_init(&dev->close_list);
+		dev_open(dev, NULL);
+	}
+
+	rtnl_unlock();
+}
+
 static int mtk_probe(struct platform_device *pdev)
 {
 	struct device_node *mac_np;
@@ -3053,6 +3089,7 @@ static int mtk_probe(struct platform_device *pdev)
 	eth->soc = of_device_get_match_data(&pdev->dev);
 
 	eth->dev = &pdev->dev;
+	eth->dma_dev = &pdev->dev;
 	eth->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(eth->base))
 		return PTR_ERR(eth->base);
@@ -3101,6 +3138,16 @@ static int mtk_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (of_dma_is_coherent(pdev->dev.of_node)) {
+		struct regmap *cci;
+
+		cci = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+						      "mediatek,cci-control");
+		/* enable CPU/bus coherency */
+		if (!IS_ERR(cci))
+			regmap_write(cci, 0, 3);
+	}
+
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SGMII)) {
 		eth->sgmii = devm_kzalloc(eth->dev, sizeof(*eth->sgmii),
 					  GFP_KERNEL);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index c9d42be314b5..e701544c4287 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -465,6 +465,12 @@
 #define RSTCTRL_FE		BIT(6)
 #define RSTCTRL_PPE		BIT(31)
 
+/* ethernet dma channel agent map */
+#define ETHSYS_DMA_AG_MAP	0x408
+#define ETHSYS_DMA_AG_MAP_PDMA	BIT(0)
+#define ETHSYS_DMA_AG_MAP_QDMA	BIT(1)
+#define ETHSYS_DMA_AG_MAP_PPE	BIT(2)
+
 /* SGMII subsystem config registers */
 /* Register to auto-negotiation restart */
 #define SGMSYS_PCS_CONTROL_1	0x0
@@ -882,6 +888,7 @@ struct mtk_sgmii {
 /* struct mtk_eth -	This is the main datasructure for holding the state
  *			of the driver
  * @dev:		The device pointer
+ * @dev:		The device pointer used for dma mapping/alloc
  * @base:		The mapped register i/o base
  * @page_lock:		Make sure that register operations are atomic
  * @tx_irq__lock:	Make sure that IRQ register operations are atomic
@@ -925,6 +932,7 @@ struct mtk_sgmii {
 
 struct mtk_eth {
 	struct device			*dev;
+	struct device			*dma_dev;
 	void __iomem			*base;
 	spinlock_t			page_lock;
 	spinlock_t			tx_irq_lock;
@@ -1023,6 +1031,7 @@ int mtk_gmac_rgmii_path_setup(struct mtk_eth *eth, int mac_id);
 int mtk_eth_offload_init(struct mtk_eth *eth);
 int mtk_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 		     void *type_data);
+void mtk_eth_set_dma_device(struct mtk_eth *eth, struct device *dma_dev);
 
 
 #endif /* MTK_ETH_H */
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
