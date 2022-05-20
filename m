Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC11C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ogc27m16C71D8ITzCJfUYrQqpPPv3PW+lJrfABkL+g=; b=3PjBLwXneJDAXY
	yHR3elqHwTTUx88KKRlE0p2lW4TbNLaChSXpNv7CpTsLdJs6a+Pmu7JzgK3P/U+mj8eZNBWpU+5zz
	kV+E5AstRrp/o5Y+u9ZWbtoV09340JR3WDs37Whc7aFhezR1lt7r6jKJ3x0m03H9K3a1IIdPhnVM4
	DHEjT5nsHutnY9dZbMhU95DflKXbZ32qE0R3eHU5z1XT2m4yjIrc+/FTi4fown1IJ1CQz6qeyxSvf
	YiyjyjsaEZxGT5R1udkw7JvZzhhajmV1Qs63cFK61qwXjZqr+mziu/bIi5Q8Ya6/T7fZgf7lkgTF/
	Eyna0V8so2NwmpbM8vog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns77Q-00E1Ae-Jd; Fri, 20 May 2022 18:12:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns77N-00E16I-GV
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 18:12:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22DE8B82A55;
 Fri, 20 May 2022 18:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150D3C3411A;
 Fri, 20 May 2022 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653070370;
 bh=K+DrRmpRVXepET5twu9KU4kHTQjdvJrEkgES8lPb8SM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=di7nb890nAdVs661MY3ArhaorebCvREmDch9fcVeCypR5Y79eINRqbbEkmyLdySv8
 s1TkRpOL8iZV2jYbUEPl2SEJH0w+TYSPb3wY6WrMayh0D+keTVkiX4t2ojd5nKUYGh
 tIE9AYATvi1vkjxAbcmXDTvDtQvFZfmQWhnro7y1x4YK0AgNaIbAq7ta5Ic7MMegLQ
 yhos6Lg1FPKn/rNn+9bvuDbVbzGvDTsWSayu5fYK6uEqTrDrHYsG7x3jbs+5y9vW7L
 80poTZrfVeodcasojYGiPoG3PHvsVQ/cpqn8bRL/hWguotzMTgCt1MTIDII7WqV8+W
 lvtXgF8eU9xMA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v3 net-next 10/16] net: ethernet: mtk_eth_soc: rely on
 txd_size field in mtk_poll_tx/mtk_poll_rx
Date: Fri, 20 May 2022 20:11:33 +0200
Message-Id: <6b20d0ac8cde94c6f5057004a60bde2b3ae37702.1653069056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653069056.git.lorenzo@kernel.org>
References: <cover.1653069056.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_111253_767761_3C2C3AB2 
X-CRM114-Status: GOOD (  12.43  )
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
index 7c4e63cc7c2a..c7820dbc75f1 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1235,9 +1235,12 @@ static struct mtk_rx_ring *mtk_get_rx_ring(struct mtk_eth *eth)
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
@@ -1288,7 +1291,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			goto rx_done;
 
 		idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
-		rxd = &ring->dma[idx];
+		rxd = (void *)ring->dma + idx * eth->soc->txrx.rxd_size;
 		data = ring->data[idx];
 
 		if (!mtk_rx_get_desc(&trxd, rxd))
@@ -1477,7 +1480,7 @@ static int mtk_poll_tx_pdma(struct mtk_eth *eth, int budget,
 
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
