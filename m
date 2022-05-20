Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE73EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 18:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nb1khqXAklz11Kj5RVwptC0nKktcQDooHjiPRrJDzO8=; b=O/39oVpAZcQ/V/
	7COEYRF/sWjfUiJujZOzGe86z0VZSRKu1To2qL0qIby++SquQhkALeFCSkzPLyPubkzpwJ4MDrnFk
	cJCbSOtD4wnD1xG3mhReH23JD5DY71D/Ux80dSdtNLYP6qr15F/klDOiOiea1peA293pPx+EK6akG
	bk/J43cWyMEL4cJraWLjwXKjhWVMSmVlwSHeBfWlTeenq5Zsel4mW5uLnF02b+wnMvIym/vqevLoc
	FD77lEDDCQ7dJf5NZKfpomY0Hq5icc1x3JU8O1W/gcqKFfxzKWjfdMv4tOes5VdQPt7zj20pEl0ku
	3HN5DyME/SAIJHLMs8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns772-00E0qd-Gw; Fri, 20 May 2022 18:12:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns770-00E0oh-Du
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 18:12:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 20846B82D77;
 Fri, 20 May 2022 18:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BCEC34116;
 Fri, 20 May 2022 18:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653070347;
 bh=0hDAKVM6YH6gIxA25jk8QajliGXLumpZOREVwF1ZjI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DOyyfN188Vu+xRsaB+Qu+MZJHdkdz5UNIJEpR3xPOxMv+a8W8NeVNj+ftEVnMJtuQ
 QAw8oF7ylSQTG5wJ3ljjqjTfzMY0B8vy5h0+3qLfcoTjeAOyAIyElCwybMfMsePS8N
 fGI3YLQiFsc32NO6tf6VbeCPom4n1H3gjkw0F8M0ClOzJQpE64oRHOscSlyyyrpa6I
 0UpUD6nIlbPsWZP//X1HJ0EEtx00LbnjHMO7oTta7ehf/DG6TgA5mbCIRlr9zCOcKQ
 KVjkuOz9rAsz5x+zbyc2G3JUeHDMcRhHLZNX5DilsQJyY5h0go9OSixGaNCNH58BRK
 LFEQ62+BRhYVw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v3 net-next 03/16] net: ethernet: mtk_eth_soc: rely on
 GFP_KERNEL for dma_alloc_coherent whenever possible
Date: Fri, 20 May 2022 20:11:26 +0200
Message-Id: <2962c1559ff67d2095acbb51d2bcd1dfd8b0abe4.1653069056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653069056.git.lorenzo@kernel.org>
References: <cover.1653069056.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_111230_669609_916A2418 
X-CRM114-Status: GOOD (  10.57  )
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

Rely on GFP_KERNEL for dma descriptors mappings in mtk_tx_alloc(),
mtk_rx_alloc() and mtk_init_fq_dma() since they are run in non-irq
context.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 16f131445d8b..ccd864c968b2 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -816,7 +816,7 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
 	eth->scratch_ring = dma_alloc_coherent(eth->dma_dev,
 					       cnt * sizeof(struct mtk_tx_dma),
 					       &eth->phy_scratch_ring,
-					       GFP_ATOMIC);
+					       GFP_KERNEL);
 	if (unlikely(!eth->scratch_ring))
 		return -ENOMEM;
 
@@ -1591,7 +1591,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 		goto no_tx_mem;
 
 	ring->dma = dma_alloc_coherent(eth->dma_dev, MTK_DMA_SIZE * sz,
-				       &ring->phys, GFP_ATOMIC);
+				       &ring->phys, GFP_KERNEL);
 	if (!ring->dma)
 		goto no_tx_mem;
 
@@ -1609,8 +1609,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 	 */
 	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
 		ring->dma_pdma = dma_alloc_coherent(eth->dma_dev, MTK_DMA_SIZE * sz,
-						    &ring->phys_pdma,
-						    GFP_ATOMIC);
+						    &ring->phys_pdma, GFP_KERNEL);
 		if (!ring->dma_pdma)
 			goto no_tx_mem;
 
@@ -1722,7 +1721,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 
 	ring->dma = dma_alloc_coherent(eth->dma_dev,
 				       rx_dma_size * sizeof(*ring->dma),
-				       &ring->phys, GFP_ATOMIC);
+				       &ring->phys, GFP_KERNEL);
 	if (!ring->dma)
 		return -ENOMEM;
 
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
