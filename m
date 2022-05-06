Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798B4C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8quu9y8DCD9seaUGrQBU53oME+NBpAY/dN/SVt8+yA=; b=l5/gXMT68m8o3f
	FMqTBf33yNGrhRTrNQp5cPqnHr1YPbKp0jNeLxfFHwUnzR80Gt6+QFdxuOkuCwIWvUzgPZhUnUgub
	TuLYzmU3dBF0U54/H0dWgEsWQisR1Tjc2ySWSsOIU4MZOLIMEU3R8sCDLxPLOzaHth8TFcC+U0yjr
	LU4pbN7Z2Wcw9rM1rAuABd7uV2SaUrXOL3zWmeoWCEHpQq8SWoM7yz7R0QZTfUgjTLYDQZjy+huWY
	Dlr4J/uNaxm4GrMhLJrtydK8e2lnO9X8PtNEKxqrOCRanHyfhlx7oRx3txZFUxlnCbw2OMvEzNAex
	bIxQJTm45h/jzxjHr/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmx7N-003BJd-NC; Fri, 06 May 2022 12:31:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmx7L-003BI1-TC
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 12:31:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 745A561F80;
 Fri,  6 May 2022 12:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF98C385B0;
 Fri,  6 May 2022 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651840290;
 bh=si2hwRw1V74T6VtiHYEBGPs8aiSwK8sDjNn2Ywl3hcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B0fdpGHJrk3L5nWKeddTriUxiKv6kE3Vp+8fWItcC1qhCvWlAXFu+W02rNNvBEL9k
 Fh2G8/L6iOKI932mwNyc+OK44MGr5jJ6LiM5A3CYt69VXS++yhyPAGiFQIXVFKUr1O
 FxvjxtkBRya7x3R8jr+M0tACp1Xg/Q6EPeQ/Tbm3KDPe2Skm9wC76anXg381jf9450
 P6nMPLfdRZkRzznvGB/+qH5ruDkN2fYqX4qAQKKQdiBtw68xSyJYZV9Up6/6AKAZUu
 odY7ArnWP39QbOaCsHyWwjVn9YjjDl4DKnQoEIiD4WoLJJbTgc44kiAzCveM4JAkxP
 KPWQgKP1RAS0Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: [PATCH net-next 07/14] net: ethernet: mtk_eth_soc: rely on txd_size
 in txd_to_idx
Date: Fri,  6 May 2022 14:30:24 +0200
Message-Id: <e3156f4cd5e53e369125389bc7d61ad402788fbb.1651839494.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651839494.git.lorenzo@kernel.org>
References: <cover.1651839494.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_053132_011577_A9A92B4C 
X-CRM114-Status: GOOD (  10.68  )
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
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 5f0082f92cc7..a67b22dbaac7 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -852,9 +852,10 @@ static struct mtk_tx_dma *qdma_to_pdma(struct mtk_tx_ring *ring,
 	return ring->dma_pdma - ring->dma + dma;
 }
 
-static int txd_to_idx(struct mtk_tx_ring *ring, struct mtk_tx_dma *dma)
+static int txd_to_idx(struct mtk_tx_ring *ring, struct mtk_tx_dma *dma,
+		      u32 txd_size)
 {
-	return ((void *)dma - (void *)ring->dma) / sizeof(*dma);
+	return ((void *)dma - (void *)ring->dma) / txd_size;
 }
 
 static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
@@ -1070,8 +1071,10 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 		    !netdev_xmit_more())
 			mtk_w32(eth, txd->txd2, MTK_QTX_CTX_PTR);
 	} else {
-		int next_idx = NEXT_DESP_IDX(txd_to_idx(ring, txd),
-					     ring->dma_size);
+		int next_idx;
+
+		next_idx = NEXT_DESP_IDX(txd_to_idx(ring, txd, soc->txrx.txd_size),
+					 ring->dma_size);
 		mtk_w32(eth, next_idx, MT7628_TX_CTX_IDX0);
 	}
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
