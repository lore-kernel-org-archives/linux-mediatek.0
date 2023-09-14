Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F59EEAA4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mQaxBgAyfUePTZmkB+eKbxaK7lKPHuUk22pf4LyUCw=; b=lAIVMocpdLt2eysBrp+OzOlwwX
	U4Jc7e2g3Gqwn/3WyJEEoXeBtC+VLe0+bOu+fViAXLeJTgz5sWNSmHWhjz0m9mXG1IxGPaER4vRPZ
	9iM9sWVI8+tSkMuaZdE/HgpVZuETr/2w3d1YkB5rd1EbHPJ/+Kx0iVFnfMyTb3/kyr4XkL67aRdrz
	mk8hukaVX9PSKotL/ZNU0giCraXzG7efn28ZgRUiorDqDSrJq71+Vo57ix/BhJd4ovfixrkM56dA8
	8dfuvZdZyJlHWflg0sSG/Tlg6JqVXjZ7e53GdcEc8y9u6bzM2vVPNzEsKBxqsKLbKJU24KuGejfdC
	N0GPzugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnVa-008erD-1E;
	Thu, 14 Sep 2023 14:39:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnVX-008eq4-1A
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 14:39:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7F7861DCB;
	Thu, 14 Sep 2023 14:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5747C433C8;
	Thu, 14 Sep 2023 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694702390;
	bh=pdNAyyWoHcPfZPFOImFhDdd+CXIxgjMrheWwMocSdGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rzPzWRoGVvuvniyzNWIbBjubfdWysnp5iMNgFhbJoUEqQWFFK+rwMgfM74k8+jxNv
	 5+umePkV47dgFUkknvZX8m0/j04B8U5uSr3FymaEXvCHhLG6kLQERqNvmBrv3Hqtp/
	 sco96PwiV4lV5tgTQwX0jcJXVPuhXv8IQRRLnrIBHdNK6B29H19DwtNd3BJn6+pdPo
	 NGVJnIqDkIZSYRgDQmFgRZs4NDrHkDk9g/zNvJ3wLrmrjkF4lunpM1Wz2frjM/z09V
	 FeG9cMgaAV8TWxl61SQl9K+VOhjrI0+uBrbl/hyakK5AlwIPg7P1FD207ZeIrXAAMS
	 ZJWBhEjWZEyzA==
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
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next 11/15] net: ethernet: mtk_wed: refactor mtk_wed_check_wfdma_rx_fill routine
Date: Thu, 14 Sep 2023 16:38:16 +0200
Message-ID: <7cc25d625181a5a73c8dab3f79fff310de95b7c3.1694701767.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694701767.git.lorenzo@kernel.org>
References: <cover.1694701767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_073951_479330_7A1C118C 
X-CRM114-Status: GOOD (  13.14  )
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
index 0d8e10df9da2..ad7cd6c88d64 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -554,22 +554,15 @@ mtk_wed_set_512_support(struct mtk_wed_device *dev, bool enable)
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
 
@@ -578,12 +571,10 @@ mtk_wed_check_wfdma_rx_fill(struct mtk_wed_device *dev, int idx)
 
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


