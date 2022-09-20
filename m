Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB29C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 10:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AIA9YsUN3Ghc3rDqBJHQtfsugrwQqa0ZwSJNZ4bom8=; b=gL/5najWMz/oZAQqYz4pw9T7IT
	u70fsiFbFNpEte7VrI2qZ/pb6K6wq4gNAXDD0QF1UEjgqp4By1ib+qpOvGisFHZcwNZPVeDiKqxdC
	4iZeUnuy443Up9cpxkn3/DoUh8eTpHC6kphJRV5+pSQKKVwBJRPZx3EbuWQn5CI1ACbN43EIEuXWu
	FEuNs7uAR4ZoU+lqqudjwotfuVBQ2s3guz9md/+uObm6HjVFQsURzpDFA5n7j/rZEJv/JJFv5h100
	ldwFllqOjmU9zAPmH6gwI4ikL1Z73ESPUkd+pWy/Z4/XWR/R+I4iwsyRJ84/B/wHkLsZqkg4vHiR7
	JWrp2zFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaF2-002pPU-ES; Tue, 20 Sep 2022 10:12:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaEl-002pBL-Gh
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 10:12:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0F68EB80B99;
	Tue, 20 Sep 2022 10:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64952C433D6;
	Tue, 20 Sep 2022 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663668736;
	bh=b79gxAGo/3/7ht6y1pJ+KEuYpGyQY3VF4J+joPURoo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oUlWtp+golMbqj36RwiKNnTc0hNVveAUZhD+hJ86DrdbWHhkr4Q68j4m3M43TT5HG
	 RprtK7VSANbjLOgMoKQi79U/5GdsCw93tUeDqWXQ472g4lhTS3KdRFZPPtung8RW+y
	 ScOKciyLVFqzQn0YTp4rPOntTdMXKM8iJNA9BI5v7sQOev4WgZRqnz+l2Ip4TZD+MO
	 d4FySWSkyyevTqE/z9diu8oYiTi1AVDb8HE0es9VL+aAIoNemlj4sOPZ/LKKWr1WOs
	 VqeLKofvvJMwcJulV+qNTl+0qWqoz3qwXSRSiQUEiKXNYiA0AwD4XxRgUqVWAHE/pK
	 vZCB9KKAhcVJA==
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
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	daniel@makrotopia.org
Subject: [PATCH v3 net-next 06/11] net: ethernet: mtk_eth_soc: move wdma_base definitions in mtk register map
Date: Tue, 20 Sep 2022 12:11:18 +0200
Message-Id: <72dc22c2f45e2310bd944839377f31073b5263d1.1663668203.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1663668203.git.lorenzo@kernel.org>
References: <cover.1663668203.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_031219_985065_A70F02CF 
X-CRM114-Status: GOOD (  15.10  )
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

This is a preliminary patch to introduce mt7986 wed support.

Tested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 16 ++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 +---
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index bbafe5598b14..f289b994e7d5 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -75,6 +75,10 @@ static const struct mtk_reg_map mtk_reg_map = {
 	.gdm1_cnt		= 0x2400,
 	.gdma_to_ppe		= 0x4444,
 	.ppe_base		= 0x0c00,
+	.wdma_base = {
+		[0]		= 0x2800,
+		[1]		= 0x2c00,
+	},
 };
 
 static const struct mtk_reg_map mt7628_reg_map = {
@@ -130,6 +134,10 @@ static const struct mtk_reg_map mt7986_reg_map = {
 	.gdm1_cnt		= 0x1c00,
 	.gdma_to_ppe		= 0x3333,
 	.ppe_base		= 0x2000,
+	.wdma_base = {
+		[0]		= 0x4800,
+		[1]		= 0x4c00,
+	},
 };
 
 /* strings used by ethtool */
@@ -4019,16 +4027,12 @@ static int mtk_probe(struct platform_device *pdev)
 	for (i = 0;; i++) {
 		struct device_node *np = of_parse_phandle(pdev->dev.of_node,
 							  "mediatek,wed", i);
-		static const u32 wdma_regs[] = {
-			MTK_WDMA0_BASE,
-			MTK_WDMA1_BASE
-		};
 		void __iomem *wdma;
 
-		if (!np || i >= ARRAY_SIZE(wdma_regs))
+		if (!np || i >= ARRAY_SIZE(eth->soc->reg_map->wdma_base))
 			break;
 
-		wdma = eth->base + wdma_regs[i];
+		wdma = eth->base + eth->soc->reg_map->wdma_base[i];
 		mtk_wed_add_hw(np, eth, wdma, i);
 	}
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 54448795159d..39a0361ca989 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -268,9 +268,6 @@
 #define TX_DMA_FPORT_MASK_V2	0xf
 #define TX_DMA_SWC_V2		BIT(30)
 
-#define MTK_WDMA0_BASE		0x2800
-#define MTK_WDMA1_BASE		0x2c00
-
 /* QDMA descriptor txd4 */
 #define TX_DMA_CHKSUM		(0x7 << 29)
 #define TX_DMA_TSO		BIT(28)
@@ -956,6 +953,7 @@ struct mtk_reg_map {
 	u32	gdm1_cnt;
 	u32	gdma_to_ppe;
 	u32	ppe_base;
+	u32	wdma_base[2];
 };
 
 /* struct mtk_eth_data -	This is the structure holding all differences
-- 
2.37.3


