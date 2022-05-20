Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C16C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65fDhe/OuNOM4kptn1Byd0L02JAKOEPJuUxhPh+AQqU=; b=mLdt869W5rwF4K
	ubgLnqU9TR3qqf0fkgTRuEbnUT+tORPguEoaNOk8rIqbENeykKksoPxjHCGaIyLmAEtyZ2xRz73hs
	3/LdjM7+neDUe1zngB4AmyE+QP2SWh5KlWkOcD5O7NqG3FWfE5ie6qZZerlvVCoCnIdvdB9hjYVrI
	J8xhSVJaacv0uxrr1b1qXxmj9SyGXeMC+ECxeKveWumc2dapEDlqfRylpT3IP+t3j/HQ4R83zP1t1
	EVFC0qD5Jk9GKyCXuLoLawmxZV+REULundPRz3eYdkfQkhBmQMqCt+cYmPSDYqYI7z/bnmby8l2rA
	M0u5EAzGlNxGyEZsEcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns77U-00E1EW-HD; Fri, 20 May 2022 18:13:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns77P-00E18y-8C
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 18:12:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFBE560EE7;
 Fri, 20 May 2022 18:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E3CC34117;
 Fri, 20 May 2022 18:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653070374;
 bh=jFr/C+je3NokkqyXC7uJY0JiG6vYtPSvT2wCEXT3pnc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RMp3FfJHzDDvYejKvhgrI5W11mOFuK37cKFiNHYES5trjqGFFkXFqUwJZ+9kl/eZn
 zsSxvN+UPifjI5zJmjufHgN/Cqq3y70m44zR9p/NVc6sy9746qELUEYO7EfkZNjNLG
 PiiUASaaC0ngZPH6UxKqVyTjnqtZLKZm+pjDa1V9oo6ZY3B7u8GeQSgpHSDKeDR6jB
 1ph+9HHGko7znyTsu2bStguFFY1goK+fn0BRej2OqD3Wme81FSFlYF/5WCRRGcq24L
 4lrbCNe6igSTNSLkZzpcdVsoB/qfq5opoZGbn51tSZLXXax3oIAGFvqM4gkruMtwW3
 5OKKSOiZpiQWA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v3 net-next 11/16] net: ethernet: mtk_eth_soc: rely on
 rxd_size field in mtk_rx_alloc/mtk_rx_clean
Date: Fri, 20 May 2022 20:11:34 +0200
Message-Id: <1be6a4f04eca440c610a9f22808cfd4062d1c096.1653069056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653069056.git.lorenzo@kernel.org>
References: <cover.1653069056.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_111255_361228_6CD2B5A5 
X-CRM114-Status: GOOD (  13.00  )
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

Remove mtk_rx_dma structure layout dependency in mtk_rx_alloc/mtk_rx_clean.
Initialize to 0 rxd3 and rxd4 in mtk_rx_alloc.
This is a preliminary patch to add mt7986 ethernet support.

Tested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 26 ++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index c7820dbc75f1..4706e3708bbc 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1749,18 +1749,25 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 		return -ENOMEM;
 
 	for (i = 0; i < rx_dma_size; i++) {
+		struct mtk_rx_dma *rxd;
+
 		dma_addr_t dma_addr = dma_map_single(eth->dma_dev,
 				ring->data[i] + NET_SKB_PAD + eth->ip_align,
 				ring->buf_size,
 				DMA_FROM_DEVICE);
 		if (unlikely(dma_mapping_error(eth->dma_dev, dma_addr)))
 			return -ENOMEM;
-		ring->dma[i].rxd1 = (unsigned int)dma_addr;
+
+		rxd = (void *)ring->dma + i * eth->soc->txrx.rxd_size;
+		rxd->rxd1 = (unsigned int)dma_addr;
 
 		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
-			ring->dma[i].rxd2 = RX_DMA_LSO;
+			rxd->rxd2 = RX_DMA_LSO;
 		else
-			ring->dma[i].rxd2 = RX_DMA_PLEN0(ring->buf_size);
+			rxd->rxd2 = RX_DMA_PLEN0(ring->buf_size);
+
+		rxd->rxd3 = 0;
+		rxd->rxd4 = 0;
 	}
 	ring->dma_size = rx_dma_size;
 	ring->calc_idx_update = false;
@@ -1785,14 +1792,17 @@ static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring)
 
 	if (ring->data && ring->dma) {
 		for (i = 0; i < ring->dma_size; i++) {
+			struct mtk_rx_dma *rxd;
+
 			if (!ring->data[i])
 				continue;
-			if (!ring->dma[i].rxd1)
+
+			rxd = (void *)ring->dma + i * eth->soc->txrx.rxd_size;
+			if (!rxd->rxd1)
 				continue;
-			dma_unmap_single(eth->dma_dev,
-					 ring->dma[i].rxd1,
-					 ring->buf_size,
-					 DMA_FROM_DEVICE);
+
+			dma_unmap_single(eth->dma_dev, rxd->rxd1,
+					 ring->buf_size, DMA_FROM_DEVICE);
 			skb_free_frag(ring->data[i]);
 		}
 		kfree(ring->data);
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
