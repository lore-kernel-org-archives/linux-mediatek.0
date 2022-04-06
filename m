Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FECCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fzm6MchonwT1KbqNI3SduPEN3KHph1nUGw5lWeQCUY=; b=ShSIEBToE9gIFB
	RIKfO1OEgrQnrf/8PFZ/QoAHQMX7cjRhhVfFHHYC3bSiQGguLsRHnUZ0nnlH/aijfuR2tn0UYMrpU
	Frd9Yp/CrSCCGk/t7kEdFFbQ3YBt69EjRCMEr/CWK0TqqXWRWL3RX8bPx/Ut4Y1FNeXDWWHUgr/4U
	k4KLJ9eZ5BysrHuMJsWCh0LUESZag1/E7h85YM33n2awa1J1v51eMO4IFspkRDkZp0kZBGyqSiG9o
	CWNAAMJkGnfRr2ExP4qj307RHQDnfMXpOWxAkXVZ/Oil0GestyujibbmpFfogqWGXVFB1RSFHYYYZ
	2jURKlrXL+Kil9ZrUKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2tr-005NHY-RZ; Wed, 06 Apr 2022 10:28:31 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2WT-005DtQ-6Z; Wed, 06 Apr 2022 10:04:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 318F51F4390F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649239457;
 bh=E8FhNhaGBVpp9KYAfMViAIYnlBsslTuXK5L56LwxxPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iDroqQIjwGb1F45SMf1ymLcMRoiCrTI2tU6b17nIfl9XUwDoeczop+FCOASkmf+9v
 6+X4j77EdD+bcta1wEuiDuyhCrIZdbeJgKcLFniP4MwWnNpzjQXrUEAVW4c313/raH
 vfsjIlE3v2a3NeIs48Vu9k8BCgIGfrJoGMPDt65ixnTc5um3CcZKxP0tP8/4tagVbR
 R0lrZxrBNnSpxteEga3SI9ShWtcuPtpwJ0c/dacT9QMGZMdrgN9pJvzpllHM9XmSM9
 2hix9HziDZMV/sonCUyxfErF1PTCPxDmozbB4g9FZ+srzoD6LMGjlNIE6L1n6LdRHR
 zFh8SamPhFS4w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/7] spi: mt65xx: Simplify probe function with dev_err_probe()
Date: Wed,  6 Apr 2022 12:04:07 +0200
Message-Id: <20220406100409.93113-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
References: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_030421_581409_74711994 
X-CRM114-Status: GOOD (  11.65  )
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
 drivers/spi/spi-mt65xx.c | 70 ++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 45 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index b8ec04795141..c5b8aecfada6 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -795,10 +795,8 @@ static int mtk_spi_probe(struct platform_device *pdev)
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
@@ -826,11 +824,9 @@ static int mtk_spi_probe(struct platform_device *pdev)
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
@@ -841,11 +837,10 @@ static int mtk_spi_probe(struct platform_device *pdev)
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
 
@@ -863,40 +858,30 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
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
-		dev_err(dev, "failed to get parent-clk: %d\n", ret);
-		return PTR_ERR(mdata->parent_clk);
-	}
+	if (IS_ERR(mdata->parent_clk))
+		return dev_err_probe(dev, PTR_ERR(mdata->parent_clk),
+				     "failed to get parent-clk\n");
 
 	mdata->sel_clk = devm_clk_get(dev, "sel-clk");
-	if (IS_ERR(mdata->sel_clk)) {
-		dev_err(dev, "failed to get sel-clk: %d\n", ret);
-		return PTR_ERR(mdata->sel_clk);
-	}
+	if (IS_ERR(mdata->sel_clk))
+		return dev_err_probe(dev, PTR_ERR(mdata->sel_clk), "failed to get sel-clk\n");
 
 	mdata->spi_clk = devm_clk_get(dev, "spi-clk");
-	if (IS_ERR(mdata->spi_clk)) {
-		dev_err(dev, "failed to get spi-clk: %d\n", ret);
-		return PTR_ERR(mdata->spi_clk);
-	}
+	if (IS_ERR(mdata->spi_clk))
+		return dev_err_probe(dev, PTR_ERR(mdata->spi_clk), "failed to get spi-clk\n");
 
 	ret = clk_prepare_enable(mdata->spi_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable spi_clk\n");
 
 	ret = clk_set_parent(mdata->sel_clk, mdata->parent_clk);
 	if (ret < 0) {
-		dev_err(dev, "failed to clk_set_parent (%d)\n", ret);
 		clk_disable_unprepare(mdata->spi_clk);
-		return ret;
+		return dev_err_probe(dev, ret, "failed to clk_set_parent\n");
 	}
 
 	mdata->spi_clk_hz = clk_get_rate(mdata->spi_clk);
@@ -907,18 +892,14 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		clk_disable_unprepare(mdata->spi_clk);
 
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
@@ -935,8 +916,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
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
