Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ACDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8K/0NwWcsNH/AIrCCwEmW4hDODscMmXC9oEE2jWO2A=; b=kDwNcJkq55g3e1
	JxHhvrBHbJUQpifTewARa/DOpDVjrM7aLGbN6Ln3mU366czbNQEaeOn99wGkutASlSY66f8kLlTrl
	5lmndARtN8KtjHBLxZFFOxVDq3vfZ8IgDtTj1ajlo3fsayNHjIdzjhmp9hLACybCC9GoaQWRSin4T
	JW338s19MIBgc4sFIz8AHTuu4v5Be/Y2hZ/O2iUoY0R+JDu2sGDpbISAhlU7F84wX8nIU+3J4zkpW
	lFYU/Jl88KXw4ZmOhNmPupNlWyQft1U9uCcoGg1WHWS3eqTDtyedOuffNaHI0CkjTyZsFL7Yuyq3k
	9A5DyOEHbfOjcYE9/Bgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns77J-00E13o-Qa; Fri, 20 May 2022 18:12:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns77F-00E0zr-F9
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 18:12:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF66060FF1;
 Fri, 20 May 2022 18:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B28C34114;
 Fri, 20 May 2022 18:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653070364;
 bh=lQrsokyRSn+VHAOZ8sZtPBVYQaol9to5OyjMtUmuk0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C0xhMFa+36PIYrIj5a3FRj8GjO0WWdxpv+Io8Ri4hgv/AP36haU32u/CarCLMApB+
 xRza+XW2zjuzXlKMYHEMlM2yx9pc9rxg8r1E+iVHhrb3nuIL8/k42ABIwdZp7Hv6Yf
 MtR4T86nHf+WiF9OrZAiLPHumNMWF3XMTsgH5/EpdhJH+w/7k0fGl5gu+wFxrnu8hS
 4HFFAF7OY4/t0if8V4x2nMyodz1WX1mSHI5pTydB9M/Cm+mLefq4U9xFCPETplnaUw
 LkUaAl7eQwNkVZ+vT6BzBHIeDi59jHu0J2NvcOI8cl/lVEGtqernyNjvAkmOhq+v/5
 VG9bvVImuPEFQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v3 net-next 08/16] net: ethernet: mtk_eth_soc: rely on
 txd_size in txd_to_idx
Date: Fri, 20 May 2022 20:11:31 +0200
Message-Id: <04420b6dbf1982edf53fae52a6b738ac391cb5d9.1653069056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653069056.git.lorenzo@kernel.org>
References: <cover.1653069056.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_111245_584182_15A44739 
X-CRM114-Status: GOOD (  11.19  )
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
index 7c314324f929..1bf5edd9eb44 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -876,9 +876,10 @@ static struct mtk_tx_dma *qdma_to_pdma(struct mtk_tx_ring *ring,
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
@@ -1094,8 +1095,10 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
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
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
