Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96513C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E+YFmT1U16y2/zsmSI2aUCnIhh3pJCMQ/718vkEFbmk=; b=e1/hfwbG9WMl+04XNfTKEoH/B7
	9cEZadViy3x7TKVDACTpriBhfh7/QReedgEZrJm0WQHOhxOt/mSwjJBtia9bpCk9AHlCMJiPtky+M
	OOEX51w05x85IcmLMHgBT2q8qSLkah1VlvvDikqTVX+tXnrJGaOFe5xLEfloHiNLj+ri8n4Sy48LB
	JRqWEg51sJFevcTJoQ8iqeBeiqUt5+MW6bDUEx40ndh8GmiQoS0hZV1T8Dja6okQ5PNcs9LFcynmR
	Fap2muEZTEDHfEU/0wxiKP9OjNb1NWHQGqXhIfwRFlcIwCUjuJaQVuyPmNUN0mGZSgYe+zctH7EOK
	WuLxzI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO09n-005CNX-B1; Tue, 16 Aug 2022 17:15:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO09i-005CM1-Ih
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 17:15:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0E3261303;
	Tue, 16 Aug 2022 17:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1F7C433C1;
	Tue, 16 Aug 2022 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660670105;
	bh=XHYU4LYQAmbNhHrkrLx9er6CglyvBpEC9FIKkn8jxvA=;
	h=From:To:Cc:Subject:Date:From;
	b=dqUCMrHsYVGEl9+N+vwoABiJJHUgaRkJlRR1GCqPiW2acPhfdEpTuHiM4vVv5RJI1
	 EHPpcwuWgpZvY00Ygg26qK9mOPjhxXMie6Vw8Zx6Pu3qd+CEY1IRLzKM7QetKKmOLJ
	 xYj6Q4/ZGBdz4wf7QTiZhBmHw00squRPCoEfLe7Ey+dGOBsfQVb6aCqU3mxmpWxMTD
	 +qmLMUDGIZbH8QZvv1TllJousbd6W0glfLSm07sbDTu2whiqS8tzpLtxEMRV6KVX3m
	 s8N9daiBYVITuRgWeLpmnUmGGw4sLezX3/TB3W2bPij2d+b0N7lUANCImyI1bEFYOK
	 NlcZ1fwOpiI/g==
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
	ilias.apalodimas@linaro.org,
	lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: remove unused txd_pdma pointer in mtk_xdp_submit_frame
Date: Tue, 16 Aug 2022 19:14:30 +0200
Message-Id: <2c40b0fbb9163a0d62ff897abae17db84a9f3b99.1660669138.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_101506_773211_FF84DDDF 
X-CRM114-Status: GOOD (  13.33  )
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

Get rid of unnecessary txd_pdma pointer in mtk_xdp_submit_frame for loop
since it is actually used at the end of the routine using latest mtk_tx_dma
consumed pointer as reference.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index d9426b01f462..dff274132ae3 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1573,8 +1573,8 @@ static int mtk_xdp_submit_frame(struct mtk_eth *eth, struct xdp_frame *xdpf,
 		.last	= !xdp_frame_has_frags(xdpf),
 	};
 	int err, index = 0, n_desc = 1, nr_frags;
-	struct mtk_tx_dma *htxd, *txd, *txd_pdma;
 	struct mtk_tx_buf *htx_buf, *tx_buf;
+	struct mtk_tx_dma *htxd, *txd;
 	void *data = xdpf->data;
 
 	if (unlikely(test_bit(MTK_RESETTING, &eth->state)))
@@ -1608,7 +1608,6 @@ static int mtk_xdp_submit_frame(struct mtk_eth *eth, struct xdp_frame *xdpf,
 
 		if (MTK_HAS_CAPS(soc->caps, MTK_QDMA) || (index & 0x1)) {
 			txd = mtk_qdma_phys_to_virt(ring, txd->txd2);
-			txd_pdma = qdma_to_pdma(ring, txd);
 			if (txd == ring->last_free)
 				goto unmap;
 
@@ -1629,7 +1628,8 @@ static int mtk_xdp_submit_frame(struct mtk_eth *eth, struct xdp_frame *xdpf,
 	htx_buf->data = xdpf;
 
 	if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
-		txd_pdma = qdma_to_pdma(ring, txd);
+		struct mtk_tx_dma *txd_pdma = qdma_to_pdma(ring, txd);
+
 		if (index & 1)
 			txd_pdma->txd2 |= TX_DMA_LS0;
 		else
@@ -1660,13 +1660,15 @@ static int mtk_xdp_submit_frame(struct mtk_eth *eth, struct xdp_frame *xdpf,
 
 unmap:
 	while (htxd != txd) {
-		txd_pdma = qdma_to_pdma(ring, htxd);
 		tx_buf = mtk_desc_to_tx_buf(ring, htxd, soc->txrx.txd_size);
 		mtk_tx_unmap(eth, tx_buf, NULL, false);
 
 		htxd->txd3 = TX_DMA_LS0 | TX_DMA_OWNER_CPU;
-		if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA))
+		if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA)) {
+			struct mtk_tx_dma *txd_pdma = qdma_to_pdma(ring, htxd);
+
 			txd_pdma->txd2 = TX_DMA_DESP2_DEF;
+		}
 
 		htxd = mtk_qdma_phys_to_virt(ring, htxd->txd2);
 	}
-- 
2.37.2


