Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC6DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7hTXDb8xD2o3oy7Rrv46ZLKIJAPI+vCT/uRlENtJFI=; b=26TdNtO8Sft1uM
	5a2kTK8McrhYH4xFK/+kTIoA2Z9k2qgYiHVnPBe9JibaEi9yBK6FjTIlcNGCpDPRWxaHdN+0P5ZG1
	zvw1/UEIkGi5caTITD5UFKfRTA4cp6yTIG66qh9ETaYCdmXd35anl3imsdi02WEmDQBarDq5Ccyfk
	bm0Hw+9z2YIPsvVlCwwjd5liU1h213+e59UyuhcQCNGT/g7xb+ve+lRg5OAqMjvMa0dcClDw1JLNr
	NlUCex6/wAcld7NSXBsDp6US1RPyfZwNNDRWQpg2C1VCdIBOgKiBccLuPU7N4j9Pr5q67ithsg48p
	krIv0ILbQl5wttPFgMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqdHH-008s08-El; Mon, 16 May 2022 16:08:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqdGQ-008rNu-Jw
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 16:08:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 298A460FF0;
 Mon, 16 May 2022 16:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EECC36AE2;
 Mon, 16 May 2022 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652717285;
 bh=dyJ5XoChkvP74PxhAd12f/ogtOqmcld4InFdd//3jsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p4tG3nNgIkOG0h9u/zk1rrinvtvrwF2NBDtC33MLOYbfTudtQG7jDqMFqywiMivhh
 PzpOqSfjKRAsdHh7kqFJWeV7xXIJx5om6MB6qrIJ4O/M0WpJWvCkmNGYxEGxfyIGzv
 LTMDw4bp70jV7mr6225cuA8IfbzqBPdd1zjxtPk3Wxhek7bvhYKxgS4WKmIUs0ZpAF
 ETXRHe7FiVpEqCVgEK3G+sc94CRWFpdZInehEsBqCkDynCBjJrfNp7HvnYYMeFaOJH
 R/xNU6jMMvLBCuBgL2t5wErpzaFZ0wt5UpYiq75AqaQli6lenHuwYPS8k5Kfc/92Dv
 B8/ZVdnm4HSog==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v2 net-next 08/15] net: ethernet: mtk_eth_soc: add rxd_size to
 mtk_soc_data
Date: Mon, 16 May 2022 18:06:35 +0200
Message-Id: <5a5ddce4bf8fb08dcbc730864c05a1aa58ec360f.1652716741.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_090806_800183_71002B53 
X-CRM114-Status: GOOD (  14.48  )
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

Similar to tx counterpart, introduce rxd_size in mtk_soc_data data
structure.
This is a preliminary patch to add mt7986 ethernet support.

Tested-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 13 +++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 ++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index a67b22dbaac7..bb628b65a9e5 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1719,7 +1719,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 	}
 
 	ring->dma = dma_alloc_coherent(eth->dma_dev,
-				       rx_dma_size * sizeof(*ring->dma),
+				       rx_dma_size * eth->soc->txrx.rxd_size,
 				       &ring->phys, GFP_ATOMIC);
 	if (!ring->dma)
 		return -ENOMEM;
@@ -1777,9 +1777,8 @@ static void mtk_rx_clean(struct mtk_eth *eth, struct mtk_rx_ring *ring)
 
 	if (ring->dma) {
 		dma_free_coherent(eth->dma_dev,
-				  ring->dma_size * sizeof(*ring->dma),
-				  ring->dma,
-				  ring->phys);
+				  ring->dma_size * eth->soc->txrx.rxd_size,
+				  ring->dma, ring->phys);
 		ring->dma = NULL;
 	}
 }
@@ -3370,6 +3369,7 @@ static const struct mtk_soc_data mt2701_data = {
 	.required_pctl = true,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
@@ -3381,6 +3381,7 @@ static const struct mtk_soc_data mt7621_data = {
 	.offload_version = 2,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
@@ -3393,6 +3394,7 @@ static const struct mtk_soc_data mt7622_data = {
 	.offload_version = 2,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
@@ -3404,6 +3406,7 @@ static const struct mtk_soc_data mt7623_data = {
 	.offload_version = 2,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
@@ -3415,6 +3418,7 @@ static const struct mtk_soc_data mt7629_data = {
 	.required_pctl = false,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
@@ -3425,6 +3429,7 @@ static const struct mtk_soc_data rt5350_data = {
 	.required_pctl = false,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma),
+		.rxd_size = sizeof(struct mtk_rx_dma),
 	},
 };
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 495f623b62ef..150d692633fa 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -866,6 +866,7 @@ struct mtk_tx_dma_desc_info {
  * @required_pctl		A bool value to show whether the SoC requires
  *				the extra setup for those pins used by GMAC.
  * @txd_size			TX DMA descriptor size.
+ * @rxd_size			RX DMA descriptor size.
  */
 struct mtk_soc_data {
 	u32             ana_rgc3;
@@ -876,6 +877,7 @@ struct mtk_soc_data {
 	netdev_features_t hw_features;
 	struct {
 		u32	txd_size;
+		u32	rxd_size;
 	} txrx;
 };
 
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
