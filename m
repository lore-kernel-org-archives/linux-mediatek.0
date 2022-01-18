Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18880C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 14:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLidbXs2MN7Cc5LiaD9fzdv/fMxTJIKScpSJeahUroA=; b=xuyMShzLKFAoFE
	nBhQXUA2T49ot2kkItVfsYiQi6bzIIWv1+v6TAXS+Ra2qp+uEI5gEQg2XJtfcwHzDgrb4BdY1EPz0
	RzQuuP0QzU5Fz46Spxhn622FpC4BEY3KxF/i3Jq7wN0rLMFeLskQ8als2P6B3lWQMHKL2tydTwFR0
	YwrbhkG2bxW7cyf/bPfQXcw2wRul31rovgsfGwEf7wLoG+p8GgDRaCgR8bT2pw2e5UBR2d3DHMY+q
	cqCGVf7ezAY+yayL4Bthdm09dfqo2l2n7jHH0AnAj6fN5QjRfW2sAQcLuL/ddkJSlB+0kg5ACja40
	5oXBjzgiEbT1dAtjhU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9pTT-001r3g-2e; Tue, 18 Jan 2022 14:28:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9pTN-001r16-D0
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 14:28:34 +0000
X-UUID: 696f13ca2db84fcbad1a53d3b799b656-20220118
X-UUID: 696f13ca2db84fcbad1a53d3b799b656-20220118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1206753861; Tue, 18 Jan 2022 07:28:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 06:28:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 18 Jan 2022 22:28:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Jan 2022 22:28:27 +0800
From: <guochun.mao@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Zhen Zhang
 <zhen.zhang@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>, "Chuanhong
 Guo" <gch981213@gmail.com>, Bin Zhang <bin.zhang@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <project_global_chrome_upstream_group@mediatek.com>, Guochun Mao
 <guochun.mao@mediatek.com>
Subject: [PATCH v2 4/4] spi: spi-mtk-nor: add axi_s clock for mt8186
Date: Tue, 18 Jan 2022 22:28:20 +0800
Message-ID: <20220118142820.2729-5-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118142820.2729-1-guochun.mao@mediatek.com>
References: <20220118142820.2729-1-guochun.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_062833_465257_34CE4018 
X-CRM114-Status: GOOD (  13.78  )
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

From: Guochun Mao <guochun.mao@mediatek.com>

MT8186 needs axi_s clock for DMA feature.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mtk-nor.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index e44fdf7c9e4b..455b4dcb26e9 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -115,6 +115,7 @@ struct mtk_nor {
 	struct clk *spi_clk;
 	struct clk *ctlr_clk;
 	struct clk *axi_clk;
+	struct clk *axi_s_clk;
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
@@ -691,6 +692,7 @@ static void mtk_nor_disable_clk(struct mtk_nor *sp)
 	clk_disable_unprepare(sp->spi_clk);
 	clk_disable_unprepare(sp->ctlr_clk);
 	clk_disable_unprepare(sp->axi_clk);
+	clk_disable_unprepare(sp->axi_s_clk);
 }
 
 static int mtk_nor_enable_clk(struct mtk_nor *sp)
@@ -714,6 +716,14 @@ static int mtk_nor_enable_clk(struct mtk_nor *sp)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(sp->axi_s_clk);
+	if (ret) {
+		clk_disable_unprepare(sp->spi_clk);
+		clk_disable_unprepare(sp->ctlr_clk);
+		clk_disable_unprepare(sp->axi_clk);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -789,7 +799,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	struct mtk_nor *sp;
 	struct mtk_nor_caps *caps;
 	void __iomem *base;
-	struct clk *spi_clk, *ctlr_clk, *axi_clk;
+	struct clk *spi_clk, *ctlr_clk, *axi_clk, *axi_s_clk;
 	int ret, irq;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -808,6 +818,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (IS_ERR(axi_clk))
 		return PTR_ERR(axi_clk);
 
+	axi_s_clk = devm_clk_get_optional(&pdev->dev, "axi_s");
+	if (IS_ERR(axi_s_clk))
+		return PTR_ERR(axi_s_clk);
+
 	caps = (struct mtk_nor_caps *)of_device_get_match_data(&pdev->dev);
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(caps->dma_bits));
@@ -843,6 +857,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
 	sp->axi_clk = axi_clk;
+	sp->axi_s_clk = axi_s_clk;
 	sp->caps = caps;
 	sp->high_dma = caps->dma_bits > 32;
 	sp->buffer = dmam_alloc_coherent(&pdev->dev,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
