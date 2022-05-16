Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B48C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9LjIdDY3B02PEjfWa9QOfcGX5DJpfMAWuB+NeXQ2Mc=; b=GvZLljcwEr7dGP
	Qc2tEb2EKAxW8hXJ0ksxeu/sHDMe309GoP32XjjwzAl2AoZPqPl7V0TrfV5p3EdYfhU7gy9Oq4+zI
	Ye4rrj5N6ShyOzVThD3P6AmYD4xC5C9zURA+0sJ1L0dKVFoSWv8j0Lg2DNzGTtskgieG8UynR9sVS
	3h7xvCS3TE0btAWx+TtUdIcs2pj1yH2rPyt2jH6lgVrcHVEeJH1soUaPlutSMRZLPW4Q8y4vRY2Kp
	MbnvA55SEy6zkMYMLGjvVAJie6FeVqcQiGly800ndcfGBrt2QoHiNJrtEDYCNxFMMQMgIZF/jRRkY
	j0wzs2K0HAQQ1/VcPuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdHK-008s36-Q3; Mon, 16 May 2022 16:09:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdGV-008rQK-HR
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 16:08:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2777EB8125C;
 Mon, 16 May 2022 16:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08663C36AE3;
 Mon, 16 May 2022 16:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717288;
 bh=t9Pe6TXTNALE+q/ldJlquf7ThnvPV79cToZ2NboGpxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X0D/+6G8mP/AWzIsQLvSuw0LSpd18Bv0OLjcNWim29BH7jtv1nZGuB3jv5F8SHuFX
 crOzUQyqTCOVNLcPDsUePdv2wV4QCFoVrnMV4Qtg1Mdj0/JxQU0paIHbmFDUWJ/1c/
 cqUy/pvwTP/q1vLydTH4y+dqiWVogccDDblqvdr4O+k4swkQA0O+2R5KojnVg94fHA
 HXYJw1Y3cV24YPFkpVk+2Co8XDW1Zt9OMEwsMFDPLqmTYGG+NOYE3BNARTyoY2LC+Z
 fNIN3UkmKkDGGLzFGGCPYH0TOsuP2W38+Zi8Db6Eu4mlkPZNSroEbxTrepfvCwsxuU
 76IiZ90ujIIQQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v2 net-next 09/15] net: ethernet: mtk_eth_soc: rely on
 txd_size field in mtk_poll_tx/mtk_poll_rx
Date: Mon, 16 May 2022 18:06:36 +0200
Message-Id: <af15492e3eaa4a86f80bfa4145376dce40a1a7d4.1652716741.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090811_777245_DC2A33F0 
X-CRM114-Status: GOOD (  12.52  )
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
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
