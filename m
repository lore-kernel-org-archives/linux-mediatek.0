Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA8BC43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZB0GbA+joSKjUE5+2KCjAaEzFXuDlUZ+C10J0NIY1Y=; b=wPBuU7xbtlTquuNOwl/fN8IGWc
	p7UhTvfJsHRIO5fNWjI2Hrj7qRo/2EAXKuPGj9/eWZo6wQpglCDWe17r6ZWQh1cwT1Xlv6Znx9Bbn
	ZcrjLDX4uuI4CC56JMW9UyI1VpwJGUnshwSSLh89vJr1vqbAC3mCJunFr0SWpbOajNlxdJGW9Wtou
	MEXeThfzp/3Uf/OUuEEbHpm4XBlEtHEB1oAVj9lOHNTwBeZcibGPnh5RRizFgZ3LTwg5c+Lrjv+ZI
	7kBEm0F81drhdnheB9paxUGBtXFYWVIMwThRHpOUvt5l8NHz2ciJ/meyHYOCxyXvCxZokXbgWBMi/
	Rs4d+vQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyE4L-009f2p-1V; Thu, 24 Nov 2022 15:23:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyE4G-009eyi-Hh
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 15:23:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EE992B826FF;
	Thu, 24 Nov 2022 15:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8CCC433C1;
	Thu, 24 Nov 2022 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669303389;
	bh=gkG/CFKzk4MuB3f6M6uabhgEVgS5tUtQ/c7+V8pmd0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o4ARMKcDZhk+RaLk1n+PeZVKM+ce0g02Ic8oaQK7KxG/jY975Q7OI9Y0qCx/+cwhB
	 n9wL7EZvlYGYh++jIRGkB7Y16ukGvb9xc3cJsiyAlawlEN34AJBD84k7BoHBmVoNgi
	 1V8L5mokzkz4y5f7cteRC75GjrU0oeJnoTIx1kmv+RodVCdD99/+NyHS5r+sb7sPp+
	 xo9oM+teD44fuRt7A4GaO8fKl1bGk19+3dum/ncqU2QsrLugTZe1FBlCPaL0bsVWIB
	 kRJ2nYuLtVNeodcC+oJKm5MoGrwQjxrFms6n/lXiL8wt6I8XSXO8KdzoEd7SpVlERd
	 Rl0GHB/dwBRng==
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
	lorenzo.bianconi@redhat.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 net-next 1/5] net: ethernet: mtk_wed: return status value in mtk_wdma_rx_reset
Date: Thu, 24 Nov 2022 16:22:51 +0100
Message-Id: <b8284d47918e9b6a4a27b7757d2c9391d5a0c0aa.1669303154.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1669303154.git.lorenzo@kernel.org>
References: <cover.1669303154.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_072312_941032_9C9FDCB8 
X-CRM114-Status: GOOD (  12.34  )
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

Move MTK_WDMA_RESET_IDX configuration in mtk_wdma_rx_reset routine.
Increase poll timeout to 10ms in order to be aligned with vendor sdk.
This is a preliminary patch to add Wireless Ethernet Dispatcher reset
support.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 7d8842378c2b..dc898ded2f05 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -101,17 +101,21 @@ mtk_wdma_read_reset(struct mtk_wed_device *dev)
 	return wdma_r32(dev, MTK_WDMA_GLO_CFG);
 }
 
-static void
+static int
 mtk_wdma_rx_reset(struct mtk_wed_device *dev)
 {
 	u32 status, mask = MTK_WDMA_GLO_CFG_RX_DMA_BUSY;
-	int i;
+	int i, ret;
 
 	wdma_clr(dev, MTK_WDMA_GLO_CFG, MTK_WDMA_GLO_CFG_RX_DMA_EN);
-	if (readx_poll_timeout(mtk_wdma_read_reset, dev, status,
-			       !(status & mask), 0, 1000))
+	ret = readx_poll_timeout(mtk_wdma_read_reset, dev, status,
+				 !(status & mask), 0, 10000);
+	if (ret)
 		dev_err(dev->hw->dev, "rx reset failed\n");
 
+	wdma_w32(dev, MTK_WDMA_RESET_IDX, MTK_WDMA_RESET_IDX_RX);
+	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
+
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
 		if (dev->rx_wdma[i].desc)
 			continue;
@@ -119,6 +123,8 @@ mtk_wdma_rx_reset(struct mtk_wed_device *dev)
 		wdma_w32(dev,
 			 MTK_WDMA_RING_RX(i) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	}
+
+	return ret;
 }
 
 static void
@@ -565,9 +571,7 @@ mtk_wed_detach(struct mtk_wed_device *dev)
 
 	mtk_wed_stop(dev);
 
-	wdma_w32(dev, MTK_WDMA_RESET_IDX, MTK_WDMA_RESET_IDX_RX);
-	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
-
+	mtk_wdma_rx_reset(dev);
 	mtk_wed_reset(dev, MTK_WED_RESET_WED);
 	if (mtk_wed_get_rx_capa(dev)) {
 		wdma_clr(dev, MTK_WDMA_GLO_CFG, MTK_WDMA_GLO_CFG_TX_DMA_EN);
@@ -582,7 +586,6 @@ mtk_wed_detach(struct mtk_wed_device *dev)
 		mtk_wed_wo_reset(dev);
 		mtk_wed_free_rx_rings(dev);
 		mtk_wed_wo_deinit(hw);
-		mtk_wdma_rx_reset(dev);
 	}
 
 	if (dev->wlan.bus_type == MTK_WED_BUS_PCIE) {
@@ -999,11 +1002,7 @@ mtk_wed_reset_dma(struct mtk_wed_device *dev)
 		wed_w32(dev, MTK_WED_RESET_IDX, 0);
 	}
 
-	wdma_w32(dev, MTK_WDMA_RESET_IDX, MTK_WDMA_RESET_IDX_RX);
-	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
-
-	if (mtk_wed_get_rx_capa(dev))
-		mtk_wdma_rx_reset(dev);
+	mtk_wdma_rx_reset(dev);
 
 	if (busy) {
 		mtk_wed_reset(dev, MTK_WED_RESET_WDMA_INT_AGENT);
-- 
2.38.1


