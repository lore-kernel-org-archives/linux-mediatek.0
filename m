Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D607C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebwzWCPRZ0aDYLZOUzOL/UEI1oKOFgZobOkkJ5bTqbo=; b=IwfIagAWbayslw
	QZoS2dUmBV0AtBXugQbe63LFU/rQD5PwuvtTzrEgL40OAmOvG9pEonMTFxnEY4Kt3LlXBLcJFORcU
	H9hWNSphlCrAtGWWYc+VK2qu5fDRd3r1D8eqqi6WmlsVNScvagTEaxZSne6XflEp43RL0/bkZ/gxt
	nNAeRfkN8KVXDpMRSZCGPmcP4/LtizWYzavE4eyN2Tnu6ERUV/wr0gcltQHjIV1GxdWWmYTZqWTFQ
	cnJaV5FjvURZeuGkOjB1lIwN1qnrSTILf2bquvUhxhqCf8tlD4djDPLExaudU8OEmCfDrnDFZY6yX
	Isx51MONVtV9bQsZCZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2sf-005Mis-58; Wed, 06 Apr 2022 10:27:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2WQ-005Dr7-AL; Wed, 06 Apr 2022 10:04:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D520C1F43903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649239456;
 bh=Y4dZfpX+QZpdk3RA6KXeJbX1Xoehgvj2vpzCH7vlOXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cgdH3xUEwjmy/W2s64opZ6Ks8CxqBGUmLOWxzsBUUdDtFwgdUivUseUTEi2/n2xUa
 HmBv4TDrfVGqMiWKEw/XSJFgZCAQuWlwsYwrIzuRtR6sauQWgVCkXMhbIM4Nd66PzY
 Hnh7uwxc+Vghw4EWhshmDwZXrNR8nXSfxMyHLfqLyWc20PNy0ZgW5nt+7xcXytFoe2
 6589Tl8uZhGQaPodjCYX4iY9jewxw29LMibSGdp+qX/fij9NZztcPkP9AR6AgK5e8S
 iUGM/9sVoK52J/f/Rl9qUMkBDIxn/vFAPdtk2F6LvqM8WmJuBxWHrBrSzJ+RhFM9ti
 QqwLHS4VuZCIA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/7] spi: mt65xx: Add and use pointer to struct device in
 mtk_spi_probe()
Date: Wed,  6 Apr 2022 12:04:05 +0200
Message-Id: <20220406100409.93113-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
References: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_030418_705355_75E98ED3 
X-CRM114-Status: GOOD (  16.97  )
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

In preparation for switching to dev_err_probe() in this function, add
a pointer to struct device and replace all occurrences of '&pdev->dev'
to using this 'dev' pointer.
This is done for one-line fitting of the dev_err_probe() calls.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 62 ++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index e3f3b77960ae..7f381d84a005 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -789,18 +789,19 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
 
 static int mtk_spi_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct spi_master *master;
 	struct mtk_spi *mdata;
 	int i, irq, ret, addr_bits;
 
-	master = devm_spi_alloc_master(&pdev->dev, sizeof(*mdata));
+	master = devm_spi_alloc_master(dev, sizeof(*mdata));
 	if (!master) {
-		dev_err(&pdev->dev, "failed to alloc spi master\n");
+		dev_err(dev, "failed to alloc spi master\n");
 		return -ENOMEM;
 	}
 
 	master->auto_runtime_pm = true;
-	master->dev.of_node = pdev->dev.of_node;
+	master->dev.of_node = dev->of_node;
 	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST;
 
 	master->set_cs = mtk_spi_set_cs;
@@ -812,7 +813,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	master->use_gpio_descriptors = true;
 
 	mdata = spi_master_get_devdata(master);
-	mdata->dev_comp = device_get_match_data(&pdev->dev);
+	mdata->dev_comp = device_get_match_data(dev);
 
 	if (mdata->dev_comp->enhance_timing)
 		master->mode_bits |= SPI_CS_HIGH;
@@ -823,26 +824,25 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		master->mode_bits |= SPI_LOOP;
 
 	if (mdata->dev_comp->need_pad_sel) {
-		mdata->pad_num = of_property_count_u32_elems(
-			pdev->dev.of_node,
+		mdata->pad_num = of_property_count_u32_elems(dev->of_node,
 			"mediatek,pad-select");
 		if (mdata->pad_num < 0) {
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"No 'mediatek,pad-select' property\n");
 			return -EINVAL;
 		}
 
-		mdata->pad_sel = devm_kmalloc_array(&pdev->dev, mdata->pad_num,
+		mdata->pad_sel = devm_kmalloc_array(dev, mdata->pad_num,
 						    sizeof(u32), GFP_KERNEL);
 		if (!mdata->pad_sel)
 			return -ENOMEM;
 
 		for (i = 0; i < mdata->pad_num; i++) {
-			of_property_read_u32_index(pdev->dev.of_node,
+			of_property_read_u32_index(dev->of_node,
 						   "mediatek,pad-select",
 						   i, &mdata->pad_sel[i]);
 			if (mdata->pad_sel[i] > MT8173_SPI_MAX_PAD_SEL) {
-				dev_err(&pdev->dev, "wrong pad-sel[%d]: %u\n",
+				dev_err(dev, "wrong pad-sel[%d]: %u\n",
 					i, mdata->pad_sel[i]);
 				return -EINVAL;
 			}
@@ -858,43 +858,43 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	if (!pdev->dev.dma_mask)
-		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
+	if (!dev->dma_mask)
+		dev->dma_mask = &dev->coherent_dma_mask;
 
-	ret = devm_request_irq(&pdev->dev, irq, mtk_spi_interrupt,
-			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), master);
+	ret = devm_request_irq(dev, irq, mtk_spi_interrupt,
+			       IRQF_TRIGGER_NONE, dev_name(dev), master);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register irq (%d)\n", ret);
+		dev_err(dev, "failed to register irq (%d)\n", ret);
 		return ret;
 	}
 
-	mdata->parent_clk = devm_clk_get(&pdev->dev, "parent-clk");
+	mdata->parent_clk = devm_clk_get(dev, "parent-clk");
 	if (IS_ERR(mdata->parent_clk)) {
-		dev_err(&pdev->dev, "failed to get parent-clk: %d\n", ret);
+		dev_err(dev, "failed to get parent-clk: %d\n", ret);
 		return PTR_ERR(mdata->parent_clk);
 	}
 
-	mdata->sel_clk = devm_clk_get(&pdev->dev, "sel-clk");
+	mdata->sel_clk = devm_clk_get(dev, "sel-clk");
 	if (IS_ERR(mdata->sel_clk)) {
-		dev_err(&pdev->dev, "failed to get sel-clk: %d\n", ret);
+		dev_err(dev, "failed to get sel-clk: %d\n", ret);
 		return PTR_ERR(mdata->sel_clk);
 	}
 
-	mdata->spi_clk = devm_clk_get(&pdev->dev, "spi-clk");
+	mdata->spi_clk = devm_clk_get(dev, "spi-clk");
 	if (IS_ERR(mdata->spi_clk)) {
-		dev_err(&pdev->dev, "failed to get spi-clk: %d\n", ret);
+		dev_err(dev, "failed to get spi-clk: %d\n", ret);
 		return PTR_ERR(mdata->spi_clk);
 	}
 
 	ret = clk_prepare_enable(mdata->spi_clk);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to enable spi_clk (%d)\n", ret);
+		dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
 		return ret;
 	}
 
 	ret = clk_set_parent(mdata->sel_clk, mdata->parent_clk);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to clk_set_parent (%d)\n", ret);
+		dev_err(dev, "failed to clk_set_parent (%d)\n", ret);
 		clk_disable_unprepare(mdata->spi_clk);
 		return ret;
 	}
@@ -906,11 +906,11 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	else
 		clk_disable_unprepare(mdata->spi_clk);
 
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
 	if (mdata->dev_comp->need_pad_sel) {
 		if (mdata->pad_num != master->num_chipselect) {
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"pad_num does not match num_chipselect(%d != %d)\n",
 				mdata->pad_num, master->num_chipselect);
 			ret = -EINVAL;
@@ -918,7 +918,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		}
 
 		if (!master->cs_gpiods && master->num_chipselect > 1) {
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"cs_gpios not specified and num_chipselect > 1\n");
 			ret = -EINVAL;
 			goto err_disable_runtime_pm;
@@ -929,21 +929,21 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		addr_bits = DMA_ADDR_EXT_BITS;
 	else
 		addr_bits = DMA_ADDR_DEF_BITS;
-	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(addr_bits));
+	ret = dma_set_mask(dev, DMA_BIT_MASK(addr_bits));
 	if (ret)
-		dev_notice(&pdev->dev, "SPI dma_set_mask(%d) failed, ret:%d\n",
+		dev_notice(dev, "SPI dma_set_mask(%d) failed, ret:%d\n",
 			   addr_bits, ret);
 
-	ret = devm_spi_register_master(&pdev->dev, master);
+	ret = devm_spi_register_master(dev, master);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register master (%d)\n", ret);
+		dev_err(dev, "failed to register master (%d)\n", ret);
 		goto err_disable_runtime_pm;
 	}
 
 	return 0;
 
 err_disable_runtime_pm:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
