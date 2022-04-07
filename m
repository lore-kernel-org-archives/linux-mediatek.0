Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A232C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zINR29KPdxOjUHlxIyB3qqhlRUtxHDo4jW4cFCQLyJQ=; b=XoxfvgwNEOAscg
	bgTjeVldY2wTYpVzAicLV9bJqn7MCP6073gNq6IvhZl6SFJbeiJQ+zlmYDwlbL72yh5N8Stcy9ALb
	Zh1FoxBRZ2ml5W73C+rvMFnrtM/PIvD6chNZhbCJPvyTxbV3lKXDTbtWkCQ5cV//zXMeyaPcv/3j5
	1hYT54d/eYgR9GoZY42XNHyBAbM3llB2537/HtMXOZw5HoJE7sOoWqNNVtMfpFVysvOlJvXUwMFVG
	1XlBqTDh0T0zzz7d266GQTwr7qYnsFTIA2N72gWC6QZDO5g/y7dY5pRPhzxYE+Et1XgIuvApiJZAL
	xNtHD05sl+S3WUYNLjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncQbJ-00BcYr-By; Thu, 07 Apr 2022 11:46:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncQZC-00BbFx-MW; Thu, 07 Apr 2022 11:44:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0C80B1F46135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649331885;
 bh=pTStl/14Z/S+CR10wg8/YuEaIz0uvQeEvLyXgSz/Y5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mUtDE9WMM46QqXOyyYTt0JrWUL707XCubtrbcINdX28SGw47oqmJ2+ySXmNNEaziT
 BkHv+nmE2jj5BEoFhnv7Bp96rIMmxJNa/K7Zl0wLtFni5hMVk/9NFdm1dKQ+krh3rC
 q/jYyeJE7JeplSQpTGH2OIFlZD8fJrzGCzLo6HE6xaf3S4AsLO4+6pXy3/WPHNT40n
 6Nbf0kTzsSrXwRBO1T+pbt2qdGSNFLyG3wzIB8g/ZcMHAJX5HXg0AH75yWb57UUviv
 jHJZzOGGSwTlFfAanD97Eq0IgvAYop3HSwzMpptQyZ+3BU1L34KexwTNNXPq3+H99L
 AD+cRoqr9aK/g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 6/8] spi: mt65xx: Simplify probe function with
 dev_err_probe()
Date: Thu,  7 Apr 2022 13:44:26 +0200
Message-Id: <20220407114428.167091-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
References: <20220407114428.167091-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_044447_049784_29562A5E 
X-CRM114-Status: GOOD (  11.83  )
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

Switch to dev_err_probe() to remove all dev_err() -> return repeated
patterns, simplifying and shortening the probe function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 86 ++++++++++++++--------------------------
 1 file changed, 29 insertions(+), 57 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 3f307b25433d..111ce351359a 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1088,10 +1088,8 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	int i, irq, ret, addr_bits;
 
 	master = devm_spi_alloc_master(dev, sizeof(*mdata));
-	if (!master) {
-		dev_err(dev, "failed to alloc spi master\n");
-		return -ENOMEM;
-	}
+	if (!master)
+		return dev_err_probe(dev, -ENOMEM, "failed to alloc spi master\n");
 
 	master->auto_runtime_pm = true;
 	master->dev.of_node = dev->of_node;
@@ -1125,11 +1123,9 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	if (mdata->dev_comp->need_pad_sel) {
 		mdata->pad_num = of_property_count_u32_elems(dev->of_node,
 			"mediatek,pad-select");
-		if (mdata->pad_num < 0) {
-			dev_err(dev,
+		if (mdata->pad_num < 0)
+			return dev_err_probe(dev, -EINVAL,
 				"No 'mediatek,pad-select' property\n");
-			return -EINVAL;
-		}
 
 		mdata->pad_sel = devm_kmalloc_array(dev, mdata->pad_num,
 						    sizeof(u32), GFP_KERNEL);
@@ -1140,11 +1136,10 @@ static int mtk_spi_probe(struct platform_device *pdev)
 			of_property_read_u32_index(dev->of_node,
 						   "mediatek,pad-select",
 						   i, &mdata->pad_sel[i]);
-			if (mdata->pad_sel[i] > MT8173_SPI_MAX_PAD_SEL) {
-				dev_err(dev, "wrong pad-sel[%d]: %u\n",
-					i, mdata->pad_sel[i]);
-				return -EINVAL;
-			}
+			if (mdata->pad_sel[i] > MT8173_SPI_MAX_PAD_SEL)
+				return dev_err_probe(dev, -EINVAL,
+						     "wrong pad-sel[%d]: %u\n",
+						     i, mdata->pad_sel[i]);
 		}
 	}
 
@@ -1162,56 +1157,38 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, mtk_spi_interrupt,
 			       IRQF_TRIGGER_NONE, dev_name(dev), master);
-	if (ret) {
-		dev_err(dev, "failed to register irq (%d)\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register irq\n");
 
 	mdata->parent_clk = devm_clk_get(dev, "parent-clk");
-	if (IS_ERR(mdata->parent_clk)) {
-		ret = PTR_ERR(mdata->parent_clk);
-		dev_err(dev, "failed to get parent-clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(mdata->parent_clk))
+		return dev_err_probe(dev, PTR_ERR(mdata->parent_clk),
+				     "failed to get parent-clk\n");
 
 	mdata->sel_clk = devm_clk_get(dev, "sel-clk");
-	if (IS_ERR(mdata->sel_clk)) {
-		ret = PTR_ERR(mdata->sel_clk);
-		dev_err(dev, "failed to get sel-clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(mdata->sel_clk))
+		return dev_err_probe(dev, PTR_ERR(mdata->sel_clk), "failed to get sel-clk\n");
 
 	mdata->spi_clk = devm_clk_get(dev, "spi-clk");
-	if (IS_ERR(mdata->spi_clk)) {
-		ret = PTR_ERR(mdata->spi_clk);
-		dev_err(dev, "failed to get spi-clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(mdata->spi_clk))
+		return dev_err_probe(dev, PTR_ERR(mdata->spi_clk), "failed to get spi-clk\n");
 
 	mdata->spi_hclk = devm_clk_get_optional(dev, "hclk");
-	if (IS_ERR(mdata->spi_hclk)) {
-		ret = PTR_ERR(mdata->spi_hclk);
-		dev_err(dev, "failed to get hclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(mdata->spi_hclk))
+		return dev_err_probe(dev, PTR_ERR(mdata->spi_hclk), "failed to get hclk\n");
 
 	ret = clk_set_parent(mdata->sel_clk, mdata->parent_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to clk_set_parent (%d)\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to clk_set_parent\n");
 
 	ret = clk_prepare_enable(mdata->spi_hclk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable hclk (%d)\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable hclk\n");
 
 	ret = clk_prepare_enable(mdata->spi_clk);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
 		clk_disable_unprepare(mdata->spi_hclk);
-		return ret;
+		return dev_err_probe(dev, ret, "failed to enable spi_clk\n");
 	}
 
 	mdata->spi_clk_hz = clk_get_rate(mdata->spi_clk);
@@ -1225,18 +1202,14 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	}
 
 	if (mdata->dev_comp->need_pad_sel) {
-		if (mdata->pad_num != master->num_chipselect) {
-			dev_err(dev,
+		if (mdata->pad_num != master->num_chipselect)
+			return dev_err_probe(dev, -EINVAL,
 				"pad_num does not match num_chipselect(%d != %d)\n",
 				mdata->pad_num, master->num_chipselect);
-			return -EINVAL;
-		}
 
-		if (!master->cs_gpiods && master->num_chipselect > 1) {
-			dev_err(dev,
+		if (!master->cs_gpiods && master->num_chipselect > 1)
+			return dev_err_probe(dev, -EINVAL,
 				"cs_gpios not specified and num_chipselect > 1\n");
-			return -EINVAL;
-		}
 	}
 
 	if (mdata->dev_comp->dma_ext)
@@ -1253,8 +1226,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	ret = devm_spi_register_master(dev, master);
 	if (ret) {
 		pm_runtime_disable(dev);
-		dev_err(dev, "failed to register master (%d)\n", ret);
-		return ret;
+		return dev_err_probe(dev, ret, "failed to register master\n");
 	}
 
 	return 0;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
