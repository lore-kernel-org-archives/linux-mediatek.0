Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6D3CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07LWpgfQhs4YWp+fFk0vDNhKXQE0NPzaBPw1lSucWzQ=; b=W4xIdyroFNuZBYvR4hyILEtyuP
	4i8Pl5m+7sa9XTReTSDh6q84wj/HbGcI1NamXEfLFPK8adOZRLMsQAVtLIqjWzjdDui2irkzwp0fN
	+cq8h1RL+4QS1X/slBIYL9u2+iQbEGAEEN0sfocg9mClYVcRCw+KMcJSrD01GIUYyUHgLLPRCSEjU
	NiiY5c4hU/4q2MoEaNhkeB8+KXRTNd15TLg9MB/e+a2vMbu97p0Klsu+BHMeYARY97IqXwW/PzY/D
	ogndMfHTKzVXM2uMbp0goj7/UEHFhYJpTyTqqvI4GTPFz0Js1KUCk0ZGWo6pvRDPVQ9O7tnCaUl2R
	ZiWaTSDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWd-00F8Li-0C;
	Mon, 18 Sep 2023 10:30:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWa-00F8Ig-07
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D4C860DFB;
	Mon, 18 Sep 2023 10:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE463C433C9;
	Mon, 18 Sep 2023 10:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033039;
	bh=QL4jpAkpk7t0C/5aBzEHHqQxp4y9HEFkn3UAfaCe8Js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Upe/6t1Q4QCfXt8qrfK8uMqPXPLVfAXaNak4hs1mUG36SQOjsD9wdZAdJkRKaK3MP
	 ndizjfizb59O5GsaLdZXw0x3LjpIeZvFaCa+2v49kzEvOrrQ1BXRrp587o8wmNY6In
	 VeQ8JArkFfTsx2fgE4EHOJ0UoGQaY4iUyZJk8mwrhzX03MGc/tJBAqBp68Rd5hzNri
	 jQ7ro86PpvKAASvTBI10JERZi68PgpoYqXK8+gU9oqHo2UpQOs8G0/bPllQpb/yZhB
	 noJlegA7wP1kOem94ObodsyQ8n2lpDNeI0FKHngbebxrKe2f2ChU1ow3+l1WBYaIBR
	 0l4L3RzIRtweA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	horms@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 12/17] net: ethernet: mtk_wed: refactor mtk_wed_check_wfdma_rx_fill routine
Date: Mon, 18 Sep 2023 12:29:14 +0200
Message-ID: <67af87aaf109fc167b34d97ce1fbe98ac10fb5c9.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033040_168991_50B7788E 
X-CRM114-Status: GOOD (  13.53  )
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

Refactor mtk_wed_check_wfdma_rx_fill() in order to be reused adding HW
receive offload support for MT7988 SoC.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 44 +++++++++++++++----------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index b6ca12686beb..18cbf028f6ed 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -586,22 +586,15 @@ mtk_wed_set_512_support(struct mtk_wed_device *dev, bool enable)
 	}
 }
 
-#define MTK_WFMDA_RX_DMA_EN	BIT(2)
-static void
-mtk_wed_check_wfdma_rx_fill(struct mtk_wed_device *dev, int idx)
+static int
+mtk_wed_check_wfdma_rx_fill(struct mtk_wed_device *dev,
+			    struct mtk_wed_ring *ring)
 {
-	u32 val;
 	int i;
 
-	if (!(dev->rx_ring[idx].flags & MTK_WED_RING_CONFIGURED))
-		return; /* queue is not configured by mt76 */
-
 	for (i = 0; i < 3; i++) {
-		u32 cur_idx;
+		u32 cur_idx = readl(ring->wpdma + MTK_WED_RING_OFS_CPU_IDX);
 
-		cur_idx = wed_r32(dev,
-				  MTK_WED_WPDMA_RING_RX_DATA(idx) +
-				  MTK_WED_RING_OFS_CPU_IDX);
 		if (cur_idx == MTK_WED_RX_RING_SIZE - 1)
 			break;
 
@@ -610,12 +603,10 @@ mtk_wed_check_wfdma_rx_fill(struct mtk_wed_device *dev, int idx)
 
 	if (i == 3) {
 		dev_err(dev->hw->dev, "rx dma enable failed\n");
-		return;
+		return -ETIMEDOUT;
 	}
 
-	val = wifi_r32(dev, dev->wlan.wpdma_rx_glo - dev->wlan.phy_base) |
-	      MTK_WFMDA_RX_DMA_EN;
-	wifi_w32(dev, dev->wlan.wpdma_rx_glo - dev->wlan.phy_base, val);
+	return 0;
 }
 
 static void
@@ -1546,6 +1537,7 @@ mtk_wed_configure_irq(struct mtk_wed_device *dev, u32 irq_mask)
 	wed_w32(dev, MTK_WED_INT_MASK, irq_mask);
 }
 
+#define MTK_WFMDA_RX_DMA_EN	BIT(2)
 static void
 mtk_wed_dma_enable(struct mtk_wed_device *dev)
 {
@@ -1633,8 +1625,26 @@ mtk_wed_dma_enable(struct mtk_wed_device *dev)
 		wdma_set(dev, MTK_WDMA_WRBK_TX_CFG, MTK_WDMA_WRBK_TX_CFG_WRBK_EN);
 	}
 
-	for (i = 0; i < MTK_WED_RX_QUEUES; i++)
-		mtk_wed_check_wfdma_rx_fill(dev, i);
+	for (i = 0; i < MTK_WED_RX_QUEUES; i++) {
+		struct mtk_wed_ring *ring = &dev->rx_ring[i];
+		u32 val;
+
+		if (!(ring->flags & MTK_WED_RING_CONFIGURED))
+			continue; /* queue is not configured by mt76 */
+
+		if (mtk_wed_check_wfdma_rx_fill(dev, ring)) {
+			dev_err(dev->hw->dev,
+				"rx_ring(%d) dma enable failed\n", i);
+			continue;
+		}
+
+		val = wifi_r32(dev,
+			       dev->wlan.wpdma_rx_glo -
+			       dev->wlan.phy_base) | MTK_WFMDA_RX_DMA_EN;
+		wifi_w32(dev,
+			 dev->wlan.wpdma_rx_glo - dev->wlan.phy_base,
+			 val);
+	}
 }
 
 static void
-- 
2.41.0


