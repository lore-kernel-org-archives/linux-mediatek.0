Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 06:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26Rw3jgAUStbsOGuCagjKy6IxgU0W5ui/af6HtF/2Zk=; b=QLuY6LM7n/GJ9w
	AdXk+ym2CLLwt4E6e/92LOjdfCRgQ/eMVaAsVsJJXvTe16W6V2LC4EglxIBlE3FJ9WyoV0Fwrb+PK
	/WkI7ZnpP9pHeZ2OmBkq3LzACcmlkAArUawA5YRguaWCBXuKUBi1TIOqyYFVy2PqWJzEZuNsrLnY/
	Tnz3NcT7bGHlNzVnqPjIaA3oStW+/LKsZSyZkm19Cslw2L6NrNfcriYTQwMO+aWeXsIXA+YbzMBAE
	PQt0DOyp2ia3cUYjop4fGmvlFY3Ir/QOgmdorFqKvH9MHD6xOBuoJK28ey4zOqgQlZjQqAreQ5G3y
	AM9hYGHzbIe0Jy0GUGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8G20-007uJd-QY; Fri, 14 Jan 2022 06:25:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8G1u-007uFF-PA
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 06:25:44 +0000
X-UUID: 45672ae946f5485aa8463f226cdc4e96-20220113
X-UUID: 45672ae946f5485aa8463f226cdc4e96-20220113
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1686142913; Thu, 13 Jan 2022 23:24:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 22:24:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 14 Jan 2022 14:24:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 14:24:26 +0800
From: <guochun.mao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>, "Guochun
 Mao" <guochun.mao@mediatek.com>
Subject: [PATCH v1 2/4] spi: spi-mtk-nor: improve device table for adding more
 capabilities
Date: Fri, 14 Jan 2022 14:24:06 +0800
Message-ID: <20220114062408.9077-3-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114062408.9077-1-guochun.mao@mediatek.com>
References: <20220114062408.9077-1-guochun.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_222542_863094_B9DC1556 
X-CRM114-Status: GOOD (  15.19  )
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

Define a structure for adding more capabilities.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
---
 drivers/spi/spi-mtk-nor.c | 40 +++++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 5c93730615f8..f3bcdc1d4d8b 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -95,6 +95,11 @@
 
 #define CLK_TO_US(sp, clkcnt)		DIV_ROUND_UP(clkcnt, sp->spi_freq / 1000000)
 
+struct mtk_nor_caps {
+	u32 dma_bits;
+	u32 extra_dummy_bit;
+};
+
 struct mtk_nor {
 	struct spi_controller *ctlr;
 	struct device *dev;
@@ -109,6 +114,7 @@ struct mtk_nor {
 	bool has_irq;
 	bool high_dma;
 	struct completion op_done;
+	const struct mtk_nor_caps *caps;
 };
 
 static inline void mtk_nor_rmw(struct mtk_nor *sp, u32 reg, u32 set, u32 clr)
@@ -554,7 +560,12 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
 	}
 
 	// trigger op
-	writel(prg_len * BITS_PER_BYTE, sp->base + MTK_NOR_REG_PRG_CNT);
+	if (rx_len)
+		writel(prg_len * BITS_PER_BYTE + sp->caps->extra_dummy_bit,
+		       sp->base + MTK_NOR_REG_PRG_CNT);
+	else
+		writel(prg_len * BITS_PER_BYTE, sp->base + MTK_NOR_REG_PRG_CNT);
+
 	ret = mtk_nor_cmd_exec(sp, MTK_NOR_CMD_PROGRAM,
 			       prg_len * BITS_PER_BYTE);
 	if (ret)
@@ -743,9 +754,19 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
 	.exec_op = mtk_nor_exec_op
 };
 
+const struct mtk_nor_caps mtk_nor_caps_mt8173 = {
+	.dma_bits = 32,
+	.extra_dummy_bit = 0,
+};
+
+const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
+	.dma_bits = 36,
+	.extra_dummy_bit = 0,
+};
+
 static const struct of_device_id mtk_nor_match[] = {
-	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
-	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
+	{ .compatible = "mediatek,mt8173-nor", .data = &mtk_nor_caps_mt8173 },
+	{ .compatible = "mediatek,mt8192-nor", .data = &mtk_nor_caps_mt8192 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_nor_match);
@@ -754,10 +775,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr;
 	struct mtk_nor *sp;
+	struct mtk_nor_caps *caps;
 	void __iomem *base;
 	struct clk *spi_clk, *ctlr_clk, *axi_clk;
 	int ret, irq;
-	unsigned long dma_bits;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -775,9 +796,11 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (IS_ERR(axi_clk))
 		return PTR_ERR(axi_clk);
 
-	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
-	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
-		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
+	caps = (struct mtk_nor_caps *)of_device_get_match_data(&pdev->dev);
+	if (dma_set_mask_and_coherent(&pdev->dev,
+				      DMA_BIT_MASK(caps->dma_bits))) {
+		dev_err(&pdev->dev, "failed to set dma mask(%u)\n",
+			caps->dma_bits);
 		return -EINVAL;
 	}
 
@@ -808,7 +831,8 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
 	sp->axi_clk = axi_clk;
-	sp->high_dma = (dma_bits > 32);
+	sp->caps = caps;
+	sp->high_dma = caps->dma_bits > 32;
 	sp->buffer = dmam_alloc_coherent(&pdev->dev,
 				MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
 				&sp->buffer_dma, GFP_KERNEL);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
