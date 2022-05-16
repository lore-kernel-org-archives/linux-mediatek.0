Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14E9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOGuEefex6UVGKLIkMiqKZvRAfqNJpJBvybBYNGADpw=; b=UxxMzca/rils2m
	315iOlfIhvp9t09tUQVjYiX6rNvnepZO3/mRB7kcKkSdO8QvWFYVrVXSavKYiTNuS0RL/nSZUoFas
	QMLyvRH+wlXlOEC8nLmU9xXzMaZiWKG72gKUGhX1yxYIfvsmih++IBUelp81lFAeUc5oo+cz8uw1k
	c49uxh/olgOj3Q4osfl1dqqTh6y/26yERWDlRnY0jS66fMJ7pUvcFQ1yDYPWazJ+pXruWFYkAhHv8
	Jzvc3tfy2JXG3PlCsAY3BHL1tt/8R0kKuue2QgDRpTth2bVqtRLQvS4wUZYUGDLgdZoTR+ZiAxaqg
	eFlstjs1cHZ7539lHPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdHB-008ruq-Ew; Mon, 16 May 2022 16:08:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdGM-008rLl-VI
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 16:08:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7730D60FEE;
 Mon, 16 May 2022 16:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D72C34116;
 Mon, 16 May 2022 16:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717282;
 bh=/7JibGmqxINAAC2OLNWW7h4NBtLSDt9RP8nVknEhicc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kfXRNgO2WskOdTn3GnqwOmDwAZhkdOQoiCrQZqwaN2h9LiIGhhMZ6BqKT0ii2/URU
 tk+NvpBbRlOFdOzQPLYnYxfiWpHa95JIHohZxJCSIW6j368UO5K+fN7G39PZhB386A
 es2tUU3jSnVmX5INwWrS9lGle8J/FH/RTLRB2qq8rZgD9QC2qxbghjoERXxRK2UqOt
 Z4QQsRDMoW6qaRv5jdMx65i4GUBMvk4yejBDztaqSAwMVF3WW/WkeleQRRC/56TwvK
 Q1/JtwGAHl9HwHGwHTCmjmYnEghnvoP+/WArW2wIqRrrd15J6MuAoqUUe4WIqz8Xnv
 pzaK0cD66eglw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v2 net-next 07/15] net: ethernet: mtk_eth_soc: rely on
 txd_size in txd_to_idx
Date: Mon, 16 May 2022 18:06:34 +0200
Message-Id: <4e672c71564e1071ff1c94691984173ae9b0b54d.1652716741.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090803_125535_EF2E7187 
X-CRM114-Status: GOOD (  11.37  )
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
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
