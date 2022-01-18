Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C67C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kjsfp+vg0sg6USQP/JvOPKM/UYhw6EFTduraGL8U+ZU=; b=FvvnZMOgRnxXpc
	CFbMca91rQMA+sSs4Itz4Wg76Em2vhcAaNxZVLOJ+mbtnjEkW5CCu7/SzqGj1FxIRhQjUz5JlpM0U
	Xk95yEL3OaxE2kEMEFo+W8EuwCnMRvSaGNoX7VulCmCkQmuDpO5cofjGYvUFGOBe90wrPwKGWoRAe
	m4gYQy+3Rr96QK9u4Rue+qL80YMAU0itrWq17M93yqI19OJlHIlGWPmGzwMwoAWFf/q24EdaOr8lI
	O4L/CekaHpLqilfNdpj4DmFX+qX1GepEZYvUBMzseEx3H77S+I8xXFV9yg2RBCs1RyVuixEZI9ct8
	3xwV05RXZphI/tCHuowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9pL6-001pXv-D8; Tue, 18 Jan 2022 14:20:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9pL4-001pX5-C4
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 14:19:59 +0000
X-UUID: eeee9014912444f7bdf99d1126fd24d0-20220118
X-UUID: eeee9014912444f7bdf99d1126fd24d0-20220118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1818536008; Tue, 18 Jan 2022 07:19:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 06:19:51 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 18 Jan 2022 22:19:50 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Jan 2022 22:19:49 +0800
From: <guochun.mao@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Zhen Zhang
 <zhen.zhang@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>, "Chuanhong
 Guo" <gch981213@gmail.com>, Bin Zhang <bin.zhang@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <project_global_chrome_upstream_group@mediatek.com>, Guochun Mao
 <guochun.mao@mediatek.com>
Subject: [PATCH 2/4] spi: spi-mtk-nor: improve device table for adding more
 capabilities
Date: Tue, 18 Jan 2022 22:19:40 +0800
Message-ID: <20220118141942.2624-2-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_061958_444206_A3AC61F6 
X-CRM114-Status: GOOD (  18.09  )
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
Add a item extra_dummy_bit for new SoCs, due to design changed.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
Change-Id: I6f36e6fe1c752e57e85818758f742fb0e575bf7f
---
 drivers/spi/spi-mtk-nor.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 5c93730615f8..f5ff01f61f42 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -95,6 +95,17 @@
 
 #define CLK_TO_US(sp, clkcnt)		DIV_ROUND_UP(clkcnt, sp->spi_freq / 1000000)
 
+struct mtk_nor_caps {
+	u8 dma_bits;
+
+	/* extra_dummy_bit is adding for the IP of new SoCs.
+	 * Some new SoCs modify the timing of fetching registers' values
+	 * and IDs of nor flash, they need a extra_dummy_bit which can add
+	 * more clock cycles for fetching data.
+	 */
+	u8 extra_dummy_bit;
+};
+
 struct mtk_nor {
 	struct spi_controller *ctlr;
 	struct device *dev;
@@ -109,6 +120,7 @@ struct mtk_nor {
 	bool has_irq;
 	bool high_dma;
 	struct completion op_done;
+	const struct mtk_nor_caps *caps;
 };
 
 static inline void mtk_nor_rmw(struct mtk_nor *sp, u32 reg, u32 set, u32 clr)
@@ -554,7 +566,12 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
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
@@ -743,9 +760,19 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
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
@@ -754,10 +781,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
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
@@ -775,10 +802,12 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (IS_ERR(axi_clk))
 		return PTR_ERR(axi_clk);
 
-	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
-	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
-		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
-		return -EINVAL;
+	caps = (struct mtk_nor_caps *)of_device_get_match_data(&pdev->dev);
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(caps->dma_bits));
+	if (ret) {
+		dev_err(&pdev->dev, "failed to set dma mask(%u)\n", caps->dma_bits);
+		return ret;
 	}
 
 	ctlr = devm_spi_alloc_master(&pdev->dev, sizeof(*sp));
@@ -808,7 +837,8 @@ static int mtk_nor_probe(struct platform_device *pdev)
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
