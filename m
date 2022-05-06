Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C568C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Me3lT4S/ERT9StmWo1GWacdkq2M6sFIF6KYODthZYA=; b=ixRyEp8eV/19Ee
	mTyKnIPQpCQbFwHIGCjiAoReSJ8gnPN395RHJNJvE2TBCL5dXuYolMP52HTpIqmwSbLkvdQFR7YTi
	YDWg6rfxbaPUoOcqtTqkoKOySvCA1UBJ1ZP9E0b8s4mitKYtDpz11XEt+P3bx+H0DwzWeSNmH+RDF
	8vayqbul5LYvgO1LbM6L6EH0yejF95hv3Wlp5yLreJy6E+DnffnMvi95hVTIlpy/PhPXKZen7uafY
	V9CdJLYY6Xb0A2Wvva+N5khrcTfO7LJNCuChtLoWJm9ic9XTNhTneOSD4LXop0RY+tbEFYWNYDOki
	ZZqirfPCflQZPFxRh3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmx7V-003BRa-JA; Fri, 06 May 2022 12:31:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmx7S-003BND-4y
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 12:31:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B459861F80;
 Fri,  6 May 2022 12:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79235C385B3;
 Fri,  6 May 2022 12:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651840297;
 bh=zEJsWirQnQXWctCHPkKQJzi/whAfvJ6iSHD6rFIf3tM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nbE/+C/zareGS3Cj9zNzl4xxtkgN1Chg4HA45QPMN/LaoHG3CSraAZJMnb8VipvZk
 iLBQcvvWiHyNdvjiWViZnR0rQ6xRKVjT76EXq26WhkiQuSbKelBUDK+WQF0FIo6/0u
 aNb6rVP2XcuReUtytLQDt1Ao1ibsMX0shqz647nkl2NzBATfea/J3HcFROsFb/3fSG
 fZW0zUVfHtEsL+0kbSMVNcpo85EyVogYzMph/ulCS8BCEbP//HdCOgQfESnxar9xFV
 9ZQSv8yB8kMYv4qePs5m+Mp17/b7Jp+0KHQBuwwBA7W8k6dNnxGfRRS+ewF+UNuxpJ
 9PIPd5Qz5ofrw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: [PATCH net-next 09/14] net: ethernet: mtk_eth_soc: rely on txd_size
 field in mtk_poll_tx/mtk_poll_rx
Date: Fri,  6 May 2022 14:30:26 +0200
Message-Id: <9e09eaa3ac54ceea29fc4a3ce1eb64e765d41955.1651839494.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651839494.git.lorenzo@kernel.org>
References: <cover.1651839494.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_053138_269203_C15D5128 
X-CRM114-Status: GOOD (  11.83  )
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

This is a preliminary to ad mt7986 ethernet support.

Tested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index bb628b65a9e5..d431311578e8 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1211,9 +1211,12 @@ static struct mtk_rx_ring *mtk_get_rx_ring(struct mtk_eth *eth)
 		return &eth->rx_ring[0];
 
 	for (i = 0; i < MTK_MAX_RX_RING_NUM; i++) {
+		struct mtk_rx_dma *rxd;
+
 		ring = &eth->rx_ring[i];
 		idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
-		if (ring->dma[idx].rxd2 & RX_DMA_DONE) {
+		rxd = (void *)ring->dma + idx * eth->soc->txrx.rxd_size;
+		if (rxd->rxd2 & RX_DMA_DONE) {
 			ring->calc_idx_update = true;
 			return ring;
 		}
@@ -1264,7 +1267,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			goto rx_done;
 
 		idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
-		rxd = &ring->dma[idx];
+		rxd = (void *)ring->dma + idx * eth->soc->txrx.rxd_size;
 		data = ring->data[idx];
 
 		if (!mtk_rx_get_desc(&trxd, rxd))
@@ -1453,7 +1456,7 @@ static int mtk_poll_tx_pdma(struct mtk_eth *eth, int budget,
 
 		mtk_tx_unmap(eth, tx_buf, true);
 
-		desc = &ring->dma[cpu];
+		desc = (void *)ring->dma + cpu * eth->soc->txrx.txd_size;
 		ring->last_free = desc;
 		atomic_inc(&ring->free_count);
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
