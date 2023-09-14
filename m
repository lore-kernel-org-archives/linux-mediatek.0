Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931E5EEAA4E
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 14:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8DxrV4PLOG5yoIKIGsmDfBzaALIo8Atw0s4Ly7+t40=; b=Oc4t/Ggwv5yyi3nP3qO4XO9z7b
	piSwqehiLByUlAaylvbdVAEvV1uOtLpQOdTeWLbjMvB22ndEzs9CpC69kmBytFLPOmOnKvt2urIOH
	xMBb9f3skr2Pjhm3qmfCCe/Gua+Z/TeBkZ8M176k+0HB+K8ZzQMJrpKp9eONQc9K3BoWUVFtUhDrq
	dO8Q2+KG/wUGVO7Ls5j9XqdL2nMgdpbTlfpFgWHzzML+hfseztGD0RU/Fzl+Y+Yo8tiI4Mkj8blaX
	xVh8wXSKFfLK9MquW2TO85D0wVhIUSE6fX8OOfDmKxJih/1gag59Yh/88f/5f2BUaZTHGqeFr+4PK
	axRJFN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnVJ-008ekF-22;
	Thu, 14 Sep 2023 14:39:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnVG-008eiP-2g
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 14:39:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E2F261DD0;
	Thu, 14 Sep 2023 14:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC6BC43397;
	Thu, 14 Sep 2023 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694702374;
	bh=bptKA4oxu938HC76Gt7Y+c/P6Zyx8f+qya9UM/jezdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQgRUn8d7kTWrl1/JS/ClNubszPNHA6pcsRN4+rsXGTkNvYl+sKsyw7CM1h0WAvY8
	 FZcRQGYtD0hFzUCjECOTcdEtnk98pPYKRWxJSxUcsZBT2PpBBk8VzuC4wgytU1rp25
	 gq6+1N1II972L4ai0sEE9otV8HXxBA1WDhWPdDul/PnxroyM6JivlxC8o6NSC+5JZw
	 ADYFszokqS3Fbjdug9TKwJig0Jh28ktgDg8/L80Pyka5Eymw/ba+LqtSixhQsTl1Jg
	 zKOBbdJa9KcJeLxiJrkc2CAbE2D2BbnQWDbNnjVj/Crc7trZxyhzIUji/9gNJPvraY
	 M8lgQLYR2F9jg==
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
Subject: [PATCH net-next 07/15] net: ethernet: mtk_wed: introduce mtk_wed_buf structure
Date: Thu, 14 Sep 2023 16:38:12 +0200
Message-ID: <7eede969f46fee8c05913fe1893cb60db9144edf.1694701767.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694701767.git.lorenzo@kernel.org>
References: <cover.1694701767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_073934_974701_D3370F84 
X-CRM114-Status: GOOD (  12.91  )
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

Introduce mtk_wed_buf structure to store both virtual and physical
addresses allocated in mtk_wed_tx_buffer_alloc() routine. This is a
preliminary patch to add WED support for MT7988 SoC since it relies on a
different dma descriptor layout not storing page dma addresses.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 12 ++++++------
 include/linux/soc/mediatek/mtk_wed.h    |  7 ++++++-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 8880b018ffca..58d97be98029 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -300,9 +300,9 @@ mtk_wed_assign(struct mtk_wed_device *dev)
 static int
 mtk_wed_tx_buffer_alloc(struct mtk_wed_device *dev)
 {
+	struct mtk_wed_buf *page_list;
 	struct mtk_wdma_desc *desc;
 	dma_addr_t desc_phys;
-	void **page_list;
 	int token = dev->wlan.token_start;
 	int ring_size;
 	int n_pages;
@@ -343,7 +343,8 @@ mtk_wed_tx_buffer_alloc(struct mtk_wed_device *dev)
 			return -ENOMEM;
 		}
 
-		page_list[page_idx++] = page;
+		page_list[page_idx].p = page;
+		page_list[page_idx++].phy_addr = page_phys;
 		dma_sync_single_for_cpu(dev->hw->dev, page_phys, PAGE_SIZE,
 					DMA_BIDIRECTIONAL);
 
@@ -387,8 +388,8 @@ mtk_wed_tx_buffer_alloc(struct mtk_wed_device *dev)
 static void
 mtk_wed_free_tx_buffer(struct mtk_wed_device *dev)
 {
+	struct mtk_wed_buf *page_list = dev->tx_buf_ring.pages;
 	struct mtk_wdma_desc *desc = dev->tx_buf_ring.desc;
-	void **page_list = dev->tx_buf_ring.pages;
 	int page_idx;
 	int i;
 
@@ -400,13 +401,12 @@ mtk_wed_free_tx_buffer(struct mtk_wed_device *dev)
 
 	for (i = 0, page_idx = 0; i < dev->tx_buf_ring.size;
 	     i += MTK_WED_BUF_PER_PAGE) {
-		void *page = page_list[page_idx++];
-		dma_addr_t buf_addr;
+		dma_addr_t buf_addr = page_list[page_idx].phy_addr;
+		void *page = page_list[page_idx++].p;
 
 		if (!page)
 			break;
 
-		buf_addr = le32_to_cpu(desc[i].buf0);
 		dma_unmap_page(dev->hw->dev, buf_addr, PAGE_SIZE,
 			       DMA_BIDIRECTIONAL);
 		__free_page(page);
diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/mediatek/mtk_wed.h
index c6512c216b27..5f00dc26582b 100644
--- a/include/linux/soc/mediatek/mtk_wed.h
+++ b/include/linux/soc/mediatek/mtk_wed.h
@@ -76,6 +76,11 @@ struct mtk_wed_wo_rx_stats {
 	__le32 rx_drop_cnt;
 };
 
+struct mtk_wed_buf {
+	void *p;
+	dma_addr_t phy_addr;
+};
+
 struct mtk_wed_device {
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
 	const struct mtk_wed_ops *ops;
@@ -97,7 +102,7 @@ struct mtk_wed_device {
 
 	struct {
 		int size;
-		void **pages;
+		struct mtk_wed_buf *pages;
 		struct mtk_wdma_desc *desc;
 		dma_addr_t desc_phys;
 	} tx_buf_ring;
-- 
2.41.0


