Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFF5C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+RcKdBJxRB7YY8vHKcXZbumhcaF10OsdDOB97fIcEA=; b=zp9qvBnDTqOXhyltkOxyQToz1c
	6+UGPvATZASOKN7GXLVlXyrBhO6Ec3k5u7aIpDbioiV1nLq/ddo+7PMcA/uSFp0XlOn7IY6uw4gjZ
	aUDk5AqhieF4dlUyEjulskD3FghKH4C7Jnd4fyVWjZhr55nNwkencBhATtCWGd7D+beak2rn/hWF2
	+gAk2ovjrUOdeLcDjO/drIZI8+93GqLJoibfIPkriomjhOrieeV4TbDGPS3Ww84QRIhrwO1rmy0EB
	OS8RNfzHMDd8x8LUjgT8YxsyekXnD676axzXJOosx9bbeOUfA8FFSs0ByuxWlAgB491JIhTpW3iRk
	mJN6giAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWZQ-00Gwlr-Sz; Thu, 03 Nov 2022 09:31:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWWz-00GvjF-BU
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 09:29:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1363EB82680;
	Thu,  3 Nov 2022 09:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A7AC433D7;
	Thu,  3 Nov 2022 09:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667467738;
	bh=bwpSPAXWJjAa9BRDYk7NgD+Z9dfRWcLPuHKoPVIKSsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ssYalvImPiwGQ55BMJ8TBjr1r6tXq2VcaAoHTBpigy2FWit1bIumNqryPdlVr7ORi
	 Bhzpp6R5/hMVUpSNvuhJUnMnFGYYfwrGs9qwX8McHeQ+2fRur8oK6QRvR/kJNib7Bw
	 MQFXo0Ky1qOE3BRmGubwy8KTIf6/MfESMaMoRlwzWd82m1yW4JWz0gp/bbSlQR5Ydw
	 VP0HL+u4uqfItOIceq9uhZ6SFnmZGykHfOazSMDOuROsNim0JghPG025r73dI9NIf5
	 IBI664iNAtx6xkZgzOIy29I5M/TmDzVJqI6N1Lm7WV28CVOPj8P/B+jIIpXFi/TSGH
	 UD1CEk4BeeRng==
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
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 net-next 5/8] net: ethernet: mtk_wed: rename tx_wdma array in rx_wdma
Date: Thu,  3 Nov 2022 10:28:04 +0100
Message-Id: <44d32d973d8384fec91c85f177e84ba3c72a1dd4.1667466887.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667466887.git.lorenzo@kernel.org>
References: <cover.1667466887.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_022901_710372_7A0970E8 
X-CRM114-Status: GOOD (  14.49  )
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

Rename tx_wdma queue array in rx_wdma since this is rx side of wdma soc.
Moreover rename mtk_wed_wdma_ring_setup routine in
mtk_wed_wdma_rx_ring_setup()

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 16 ++++++++--------
 include/linux/soc/mediatek/mtk_wed.h    |  3 ++-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 9c9dd17332b6..e904596e67de 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -253,8 +253,8 @@ mtk_wed_free_tx_rings(struct mtk_wed_device *dev)
 
 	for (i = 0; i < ARRAY_SIZE(dev->tx_ring); i++)
 		mtk_wed_free_ring(dev, &dev->tx_ring[i]);
-	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
-		mtk_wed_free_ring(dev, &dev->tx_wdma[i]);
+	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
+		mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
 }
 
 static void
@@ -688,10 +688,10 @@ mtk_wed_ring_alloc(struct mtk_wed_device *dev, struct mtk_wed_ring *ring,
 }
 
 static int
-mtk_wed_wdma_ring_setup(struct mtk_wed_device *dev, int idx, int size)
+mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size)
 {
 	u32 desc_size = sizeof(struct mtk_wdma_desc) * dev->hw->version;
-	struct mtk_wed_ring *wdma = &dev->tx_wdma[idx];
+	struct mtk_wed_ring *wdma = &dev->rx_wdma[idx];
 
 	if (mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE, desc_size))
 		return -ENOMEM;
@@ -805,9 +805,9 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
-		if (!dev->tx_wdma[i].desc)
-			mtk_wed_wdma_ring_setup(dev, i, 16);
+	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
+		if (!dev->rx_wdma[i].desc)
+			mtk_wed_wdma_rx_ring_setup(dev, i, 16);
 
 	mtk_wed_hw_init(dev);
 	mtk_wed_configure_irq(dev, irq_mask);
@@ -916,7 +916,7 @@ mtk_wed_tx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs)
 			       sizeof(*ring->desc)))
 		return -ENOMEM;
 
-	if (mtk_wed_wdma_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE))
+	if (mtk_wed_wdma_rx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE))
 		return -ENOMEM;
 
 	ring->reg_base = MTK_WED_RING_TX(idx);
diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/mediatek/mtk_wed.h
index 2cc2f1e43ba9..956978320f8b 100644
--- a/include/linux/soc/mediatek/mtk_wed.h
+++ b/include/linux/soc/mediatek/mtk_wed.h
@@ -7,6 +7,7 @@
 #include <linux/pci.h>
 
 #define MTK_WED_TX_QUEUES		2
+#define MTK_WED_RX_QUEUES		2
 
 struct mtk_wed_hw;
 struct mtk_wdma_desc;
@@ -66,7 +67,7 @@ struct mtk_wed_device {
 
 	struct mtk_wed_ring tx_ring[MTK_WED_TX_QUEUES];
 	struct mtk_wed_ring txfree_ring;
-	struct mtk_wed_ring tx_wdma[MTK_WED_TX_QUEUES];
+	struct mtk_wed_ring rx_wdma[MTK_WED_RX_QUEUES];
 
 	struct {
 		int size;
-- 
2.38.1


