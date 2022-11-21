Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370EAC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 09:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7N3nOcd3LPpm0eZHJDxPFokleb5ZDUDOnAggEIyD1U=; b=oG32V5DsFbf/TdN3mBiWj/1pKY
	M1Zke4fKBDCMGzrTAgcFqg3UOzVPPfPzHUNxqoa6bG9Omc2phfL4BZk0MUjyANZqCqUj5L82WeBJw
	2LN7ryrlOpBJD/pCCvj3lPMA4sKZddqVJbpFxc/fa86za1hY8Xnk4+ByWZUWNrXW8mGBAsecELXr7
	m/u++P6fRkX8q9eS1Ba/mUkYERxxu092FtFAmXKEabKFkojiMLSlInGXp7/AgkyyujSwt2GN1pOca
	6SYIs7CmfCMvmWHUprqZnPo2+/5kWl+mJF2pUIzp2ZgZJJ97moxrkgd5Tk3iyjfPViU7zndTfU8lC
	H4sMl2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2ez-00BZVQ-87; Mon, 21 Nov 2022 09:00:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2ew-00BZUH-Dj
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 09:00:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 062C860F42;
	Mon, 21 Nov 2022 09:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC928C433D7;
	Mon, 21 Nov 2022 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669021208;
	bh=srTuEf+fXRk7EGL41puQfe4XvdcfYWiNbJCBj7D+JYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TPt5BlilkmqQf7us9nnpR6ibWlMjdkQDA04Bg7lmma1qzCu85laqxR+LE+jpDj/Kl
	 I34iwfRh5Dp1y7JzJltaB1bcjEphkkRlHzCPdP7Oyy43yoQbKflHCT4K/TRzbuZ38n
	 n0S6/+TdqXZw1Dkdp32Id03xA2B/szqQeKXEpkY8or/R7WRsTRst4YoLevgWw3nwe5
	 2d7bgLXAqDeS8I3sWMRq6eivnytuyCHuqYieX7pq22jm5IEKjQ/J/LXiNszrjztrzO
	 nyteLv0w9gGG1jlK680fGeIeLDRc5kCDCgR0bRueYzwWPWwtCx4TcucWnWtMdQiIdq
	 XUD7UafvHGPJg==
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
Subject: [PATCH net-next 1/5] net: ethernet: mtk_wed: return status value in mtk_wdma_rx_reset
Date: Mon, 21 Nov 2022 09:59:21 +0100
Message-Id: <8917d87eded7142a3a792c3ba64434a983278247.1669020847.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1669020847.git.lorenzo@kernel.org>
References: <cover.1669020847.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_010010_561199_3E3A6D82 
X-CRM114-Status: GOOD (  12.35  )
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


