Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D020C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCCt6KvagSM68uSAjbhvPPQYe86VWyZadntpOpcR1hg=; b=kPBCJNBCatB62Uy/tZjHan6jdH
	B4mrda9q+c5LwTGLPtGHJ6v/HVmAF0KtGD6/cvtXzqfVFb1uBiwZyrDx207GMvVRfFCSoNPMxqxoy
	OTq/GCDSz6F8AT8AeJlwRlNBr71IKSuW2OMQS3OjFof/jlMF2dxcqAiZaSLUAHnqFZuEje8mUNWgF
	vWIppiVkEsnhIJu8J+nomceZdiwgI3gdqgoYpKtVQhCRINJvE8FgcoTaKZEjVYAF1RlUZE0EV004q
	sa/LemjcjalxdJs+HC87SWFR57WRqrdsGAdxdWUhwKmxGLmxsXjfDxqBGlMsVmrtK5ALse+PRlssc
	D1jeME7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2f2-00BZWQ-6L; Mon, 21 Nov 2022 09:00:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2ez-00BZV7-2A
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 09:00:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A10F060F37;
	Mon, 21 Nov 2022 09:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2DFC433C1;
	Mon, 21 Nov 2022 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669021212;
	bh=QoNX4n5yKUnksQs6IHlT8R25KCm57YTFGMPSuoUZgy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RGm5Lvqtbw7Oo8Bfyz7FGqGCZ3M0LbgN20+WqSGD+zVSnUJc62fL/RVjQCM6V/gU6
	 O6hKLPag+1vsmMfPmTd+KRgKsuvb07fh6jjvhkouZdsk2clT1SbqlqDm3jkiYVLu1t
	 Mb//FJhM+/K4PwAgh4bRqaFaZZ9u7OcysQTMNaQ7/qkWkJ9kZMvEe8PZHbL1IjTwov
	 JfikaVUspMRldaUS8EyzFjtWuZccQ8jLj/XfZ1ba0MPaDKIgjV58mAJkDwyqHGq2Cg
	 T9AJgKdhQDEunHDGCejikFPcyUGkAEewEfTM4rFF5byOgQuP4Y3VKVwjcP7IwOHYkV
	 IJGs8A+VXY/NQ==
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
Subject: [PATCH net-next 2/5] net: ethernet: mtk_wed: move MTK_WDMA_RESET_IDX_TX configuration in mtk_wdma_tx_reset
Date: Mon, 21 Nov 2022 09:59:22 +0100
Message-Id: <00f8791e9d386d9a8110f60a0f73033587b6227f.1669020847.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1669020847.git.lorenzo@kernel.org>
References: <cover.1669020847.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_010013_158864_37B29B23 
X-CRM114-Status: GOOD (  11.52  )
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

Remove duplicated code. This is a preliminary patch to add Wireless
Ethernet Dispatcher reset support.

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


