Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4C2C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+RcKdBJxRB7YY8vHKcXZbumhcaF10OsdDOB97fIcEA=; b=fCRdaGWbGz0f0Xqm56Y10Maecm
	MsgSrlftupMscaGEy8dcEEtAJFNJNOqykXmicBZ3rWW7ubmzwB4dUFbKP6skt2kGVin/U6BSbgjqf
	rNSOQ/GNa/9TCW/HFPealC+BeNur/7fELqpYkhCKlGxYZZnvpe/vaYnbW/ZKVKy4ZylqjoA+OcPSd
	n867A6sQPmeB2k4NrU6kLvmkfh6rbbapf1L4OM8EbLe0IH+JNZgBIKAjUUiQB67ri6g+1MxC5MCTL
	mU/PnlQAeERa9/T+YHQJaFht6dfvB7jd9IygkOrxBxAdj9AknnKzqP2V0EkWvmbGlfMDWchZe4GZ4
	4yodjtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orRmb-007K9b-O9; Sat, 05 Nov 2022 22:36:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orRmY-007K6X-BF
	for linux-mediatek@lists.infradead.org; Sat, 05 Nov 2022 22:36:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CB32BCE09B1;
	Sat,  5 Nov 2022 22:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9155C433D7;
	Sat,  5 Nov 2022 22:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667687811;
	bh=bwpSPAXWJjAa9BRDYk7NgD+Z9dfRWcLPuHKoPVIKSsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k9+IMLVh9riS0QsgDtjPCo3BHbNGvLT7lshpE98fPUnBN5qhi4vV5GpBtp9GaFsWa
	 hB7ml2FJ3RRARNBoKrZif4VDP6W5WbXAXwLKP3R/3hd/aNzDkXR48G1vfi/NJ7pPUt
	 Qf646J4sxtIfTbmbxyTKRMpCPVjELGRV8CWS6bUtB/bmRwTVM2ag40xmaQrxMlhffE
	 xW98lmJxGOYa8abrK54N3exP1/6nTGu3oikC0SNWxq2LDYM6LE7cu533ZxrgD2dKt1
	 F1gesB9HTRGZlNh5XFp/eRMDA604AfSQ8KAKUgu3FX7TOA0u58iWe7sWlZAmDfB1IQ
	 CjOgLqpzb7Hkg==
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
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v4 net-next 5/8] net: ethernet: mtk_wed: rename tx_wdma array in rx_wdma
Date: Sat,  5 Nov 2022 23:36:20 +0100
Message-Id: <e5ca37ab77ea54feac0f1c1bbf9edfa22117f18c.1667687249.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667687249.git.lorenzo@kernel.org>
References: <cover.1667687249.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_153654_743163_A4A5E6FA 
X-CRM114-Status: GOOD (  14.10  )
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


