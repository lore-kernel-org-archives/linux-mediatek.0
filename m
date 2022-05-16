Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C54C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qjzCUdO2tto9hFtXw/hNGXLAu/AP9Kd6w2ucIwUyeY=; b=rW+QqNiFh/6a6Y
	QceWcJJpg51xBVUVibQOw4lnwnWWhl1rsPCuN3hYGyhIK5m9+LmkOEcDi+GZJahiQB7U3ZLLpmOZ0
	8VcvAsDdFuDiq+z4b2jmjGKKjyjv93OVgwuwYAr9VuaYrM2XSYEvQPo9KXTYQXrro4lhnjfLUe3wz
	s95WJk046v498Vzbzfn/S42BsyYV4rP2Xp1fOVLe5VopmQYqgX9TDUz9hFnotwcufom6LTBavp4vv
	OSHWYKjN0wnh8k97pj0UZrFdi8rNYF6m2fArEzQZTYBnCIvrPnHjbzPhqSqnol2T9Xm5eywdrwDFY
	nxpnvfpnP4da+sRzCVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdHO-008s6c-5c; Mon, 16 May 2022 16:09:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdGX-008rRo-EV
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 16:08:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B52CC60F58;
 Mon, 16 May 2022 16:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3D8C36AE5;
 Mon, 16 May 2022 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717292;
 bh=1BP0hNAhVdSiaByBwuA4bapH8q0B/c5pl0i6BWJcHFU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qIS/fgeOVOq4M/JM/e6N7JJbGjwpKZ5YYTI9q/vQDq4f81wBLps+6hOIlYF/JtBVs
 GoqrZ24GOGAL6RWWN45OxXUSaSSLWE2WUsTWe2mhJNn16lztx4uxzT6BWIa/sent7x
 ytaVvf1OCdBYIfU8vM0una1WQaRJZd5iE/HK+Zrz4BmON+/TN6Qy1dslV4mI+YWQsz
 +W6od/m2RpTuBPU09D6MINKCWtDGKSb189guLmyBuPeo0ykJ8i3yvfNzuQ96sIEw3/
 FvEhdzbvDALcKKtCIWfyIfO+3syI+fQGnYKAyoNvJ9ju41pV0p6FQZXjbgb8C7ZODf
 HdoLaWeGVLRpA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v2 net-next 10/15] net: ethernet: mtk_eth_soc: rely on
 rxd_size field in mtk_rx_alloc/mtk_rx_clean
Date: Mon, 16 May 2022 18:06:37 +0200
Message-Id: <eca56ab1af7f4bbedc4a6d0990a10ff58911d842.1652716741.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090813_576185_B149F00E 
X-CRM114-Status: GOOD (  12.85  )
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

This is a preliminary patch to add mt7986 ethernet support.

Tested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 26 ++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index d431311578e8..1e2fddc2bdcb 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1728,18 +1728,25 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
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
@@ -1764,14 +1771,17 @@ static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring)
 
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
