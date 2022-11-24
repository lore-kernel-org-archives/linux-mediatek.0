Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7649C352A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9sDlsogCjDZHxwCbUVcjFY167/U/IKnDPZSecyXBoE=; b=2oMW42llgSoSedJj3spmlAAYX9
	1iFRz7f9hRCQ5zsCTGJXkEhXUhTmiZAdljezMZ+LxGANZu9ggZFv86pkL1MeSgo5RZxkfMF53S0g8
	P0iKcfZud9YZdXHi7ikTHKjt11eKG7rHh78NXA3IKe7bJcx4A9q1KV6lcBmFcUrHZYKQyZkqnudiT
	2puMZt7lU6nasbOvn9dGbPac3Ke9rqr5fJLZLWI52Qb3fjlIJdiyu3H81E/xM4//Uf1zM53Itv9i6
	hUELySMXkb0CwImOVl/4ylWqQ8bAcg+19lZil6Can4AG07GW3LcaQlTnJHhfFq9lzdhYlyihe0xpl
	cYt59yKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyE4R-009f7K-2Z; Thu, 24 Nov 2022 15:23:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyE4M-009f3f-QF
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 15:23:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3652562189;
	Thu, 24 Nov 2022 15:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BADC433D6;
	Thu, 24 Nov 2022 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669303393;
	bh=Jn+RsWvy04FKIEZ1G57eLzq2+3w1Ek1KjYNzioxDrkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i9EmrrQPV6FNV3Bk2HiTXBvwC3YJ1mRr1x54W4N4qRpEJhEaavEPCbBIa12/m6hQ4
	 GU8iJvbd9APWiMkUy5LRYD/EVGdVyQzc2a7IdSwXXjegJnqkFfGKETXyOR7Y9WSoOJ
	 bFbTqfTThhzknBaQ4CxmI0Vj6vKOfEBu57EDQGABnVln4JwFP1VmdtkbKjcb3KBTIR
	 bKP8ZU4PAzOGU9GaVVWQGpsHgWIbtuGVJv9th/kijfmkQwT9uMe6lvYnnfe4hobYyo
	 g/4kCVb94BkxfAatsi3ErSujwan+Vzg4eZ2le/M1fOsSyvXSXhu57eSVj1gyYJfIfZ
	 P034qCG5fkngg==
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
	lorenzo.bianconi@redhat.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 net-next 2/5] net: ethernet: mtk_wed: move MTK_WDMA_RESET_IDX_TX configuration in mtk_wdma_tx_reset
Date: Thu, 24 Nov 2022 16:22:52 +0100
Message-Id: <32ef50dc0c8c325279a110362ce8af2eaa0620a5.1669303154.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1669303154.git.lorenzo@kernel.org>
References: <cover.1669303154.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_072318_942811_F6CFD9A0 
X-CRM114-Status: GOOD (  11.77  )
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

Remove duplicated code. Increase poll timeout to 10ms in order to be
aligned with vendor sdk.
This is a preliminary patch to add Wireless Ethernet Dispatcher reset
support.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index dc898ded2f05..0fb51fb31407 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -135,16 +135,15 @@ mtk_wdma_tx_reset(struct mtk_wed_device *dev)
 
 	wdma_clr(dev, MTK_WDMA_GLO_CFG, MTK_WDMA_GLO_CFG_TX_DMA_EN);
 	if (readx_poll_timeout(mtk_wdma_read_reset, dev, status,
-			       !(status & mask), 0, 1000))
+			       !(status & mask), 0, 10000))
 		dev_err(dev->hw->dev, "tx reset failed\n");
 
-	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++) {
-		if (dev->tx_wdma[i].desc)
-			continue;
+	wdma_w32(dev, MTK_WDMA_RESET_IDX, MTK_WDMA_RESET_IDX_TX);
+	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
 
+	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
 		wdma_w32(dev,
 			 MTK_WDMA_RING_TX(i) + MTK_WED_RING_OFS_CPU_IDX, 0);
-	}
 }
 
 static void
@@ -573,12 +572,6 @@ mtk_wed_detach(struct mtk_wed_device *dev)
 
 	mtk_wdma_rx_reset(dev);
 	mtk_wed_reset(dev, MTK_WED_RESET_WED);
-	if (mtk_wed_get_rx_capa(dev)) {
-		wdma_clr(dev, MTK_WDMA_GLO_CFG, MTK_WDMA_GLO_CFG_TX_DMA_EN);
-		wdma_w32(dev, MTK_WDMA_RESET_IDX, MTK_WDMA_RESET_IDX_TX);
-		wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
-	}
-
 	mtk_wed_free_tx_buffer(dev);
 	mtk_wed_free_tx_rings(dev);
 
-- 
2.38.1


