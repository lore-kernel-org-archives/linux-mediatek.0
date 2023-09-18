Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE80CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGYKizyeijHP7aiU85jH2I0DHnf3jS9zp4nkTh9lxnM=; b=MHHRhp9EocLQkMjut/X0S6aRBC
	q9FpxOL2E1bWlQFiyGFy7eHfuS5I0CUncs4nnRT4qhvy97jnT1v/8oeUzjZJ2mvfb4Ip4n8vHS4i1
	LEVo1mFeIHDHv3qZ0LiS7HbZ++CsubnW6Mn9RUYf4sGfl6k61QTgiLeFjogTWwprbS3lascO/+JJY
	OUrKzjNBS1XDlEZHFlUI6DwlhSza2sHlOqTDE4egAUBN0084PkY+T9SEMIqgmzEaXEe552T4P76p+
	HeyaYIytpSM20x5BUSKz5GUo+bLtuHzvWuoL+6srKXUWlHK7Wal0FIjZcWzgGeSzVkaZP9XnIvLD8
	xNndFSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWH-00F83G-0s;
	Mon, 18 Sep 2023 10:30:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWE-00F801-08
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8735F61070;
	Mon, 18 Sep 2023 10:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E9EC433C7;
	Mon, 18 Sep 2023 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033017;
	bh=5rS22PfOS63kepWvydr81OXjCBhdsiTDMLnp9BJbb70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ScGQRcRmtMi2gBX0CaB1sUAhNCvhZhM5SjCTKYBVrP70CUX7wqfVn3SAfmIh0SCa+
	 OlbUgqxclTX7+oRjMKaJ657ZocyiEjLmQXbscA2117DxxJGh8jkUtM6txDm+meOsch
	 w2RCuMyCRvnjXWC2PnnV69vRGlEok/V54jvz+RZxMmgrw6s/dhvOE3L/Qq6NMpWFGK
	 Sgayw1dmuGon9CY1Vob7yz559LWV62EkUtAD3F4/uVnzhghDaDYaLh2uBrwoNFLhqm
	 X9Mk7KzoKCDEZ+z9o9Ny8wM6yUOzRgw11dwmrY1eHzbmpk+EkoCxEBKwqjHEh7pkXg
	 k2yphMGy7VW9g==
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
Subject: [PATCH v2 net-next 06/17] net: ethernet: mtk_wed: introduce mtk_wed_buf structure
Date: Mon, 18 Sep 2023 12:29:08 +0200
Message-ID: <ace7593384841ae6238f3f9a0270a808711c69e4.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033018_170485_D3070FFF 
X-CRM114-Status: GOOD (  13.30  )
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
index f166d4f0b793..592e497984e3 100644
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


