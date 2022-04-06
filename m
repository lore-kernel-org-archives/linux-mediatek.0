Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789F5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFd7AXhCYW0dhsqn/TQgbYaoHE4yw2PkwzY0AX8ea94=; b=GC4DybqIPUJlUb
	SAV1DBsOuv3cmThatronvUwBstUuP6e0nI0qIFdaed3wVtnELZ29m1KjBXOJ3WfGlXiCggLJPk+K5
	kjomiqYEBvlqoPRAc9yrpFlAsKh7bWG6ZK5yg6v1tlmJ33oxaMLdseuS9xbsOfqbanvpqYFrbTnef
	Rs+iyhj+Xh1RxeOg9LMrVv9QMRXGmaX/CzsLSrC5TZbhyR49bCcOuG1Q+bXiAeK7Pu58Nd53kvFj0
	BojQBP3pITzGkZrR71/svBxnrVLJ2UYURvoirXl3LBxYd1ZdsWM+2uEbquRZ3G713+IbDuQf78ASW
	R0xB0m3GnURh6gzzjbwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2th-005NCR-IE; Wed, 06 Apr 2022 10:28:21 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2WQ-005DqV-Ua; Wed, 06 Apr 2022 10:04:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6A8431F43901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649239455;
 bh=vFZRSUCtzPmI05FbkG5koMycIxN2nba9jZW7kLwOcfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z4Vk7efUMCoApCY0Gl4KRXzkQIm19g5H5ymp3IUIMtqQ68duLQ4OnQ/osMDQftCgX
 Hiw1XB27d6hmcCIUNlUQU0L6WOxMkyE9GLNiH/Sfuf88roOSG3PXosQhxUq1PqxlFr
 h81KxqflxYfgLRGh7kdWbc1/XjDR2Elgx4NzPp2HIX5g8u2Z/1dcD0P5ATPW6HNO8Z
 +3NfB6ZSMMqrhn+/IcZ5c1gf7OlGAcqsMZscyP5IJ8p8oNeW8CpLqJ65cA1Qv2zSn8
 jf0b36XFRY7QYRvHErHA436VdjeRFpFtfDgKYn83a/Xeh2ec3VW0ev5BcGuQNv8om5
 DeRrZJnzbe11Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/7] spi: mt65xx: Simplify probe function with
 devm_spi_alloc_master
Date: Wed,  6 Apr 2022 12:04:03 +0200
Message-Id: <20220406100409.93113-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
References: <20220406100409.93113-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_030419_341076_6E550693 
X-CRM114-Status: GOOD (  12.88  )
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

Switch to the devm variant of spi_alloc_master() to save some gotos.
This patch is a cleanup that brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 46 ++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 30 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 1a0b3208dfca..4f53c3446bc0 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -794,7 +794,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	const struct of_device_id *of_id;
 	int i, irq, ret, addr_bits;
 
-	master = spi_alloc_master(&pdev->dev, sizeof(*mdata));
+	master = devm_spi_alloc_master(&pdev->dev, sizeof(*mdata));
 	if (!master) {
 		dev_err(&pdev->dev, "failed to alloc spi master\n");
 		return -ENOMEM;
@@ -815,8 +815,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 	of_id = of_match_node(mtk_spi_of_match, pdev->dev.of_node);
 	if (!of_id) {
 		dev_err(&pdev->dev, "failed to probe of_node\n");
-		ret = -EINVAL;
-		goto err_put_master;
+		return -EINVAL;
 	}
 
 	mdata = spi_master_get_devdata(master);
@@ -837,16 +836,13 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		if (mdata->pad_num < 0) {
 			dev_err(&pdev->dev,
 				"No 'mediatek,pad-select' property\n");
-			ret = -EINVAL;
-			goto err_put_master;
+			return -EINVAL;
 		}
 
 		mdata->pad_sel = devm_kmalloc_array(&pdev->dev, mdata->pad_num,
 						    sizeof(u32), GFP_KERNEL);
-		if (!mdata->pad_sel) {
-			ret = -ENOMEM;
-			goto err_put_master;
-		}
+		if (!mdata->pad_sel)
+			return -ENOMEM;
 
 		for (i = 0; i < mdata->pad_num; i++) {
 			of_property_read_u32_index(pdev->dev.of_node,
@@ -855,24 +851,19 @@ static int mtk_spi_probe(struct platform_device *pdev)
 			if (mdata->pad_sel[i] > MT8173_SPI_MAX_PAD_SEL) {
 				dev_err(&pdev->dev, "wrong pad-sel[%d]: %u\n",
 					i, mdata->pad_sel[i]);
-				ret = -EINVAL;
-				goto err_put_master;
+				return -EINVAL;
 			}
 		}
 	}
 
 	platform_set_drvdata(pdev, master);
 	mdata->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mdata->base)) {
-		ret = PTR_ERR(mdata->base);
-		goto err_put_master;
-	}
+	if (IS_ERR(mdata->base))
+		return PTR_ERR(mdata->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_put_master;
-	}
+	if (irq < 0)
+		return irq;
 
 	if (!pdev->dev.dma_mask)
 		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
@@ -881,41 +872,38 @@ static int mtk_spi_probe(struct platform_device *pdev)
 			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), master);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register irq (%d)\n", ret);
-		goto err_put_master;
+		return ret;
 	}
 
 	mdata->parent_clk = devm_clk_get(&pdev->dev, "parent-clk");
 	if (IS_ERR(mdata->parent_clk)) {
-		ret = PTR_ERR(mdata->parent_clk);
 		dev_err(&pdev->dev, "failed to get parent-clk: %d\n", ret);
-		goto err_put_master;
+		return PTR_ERR(mdata->parent_clk);
 	}
 
 	mdata->sel_clk = devm_clk_get(&pdev->dev, "sel-clk");
 	if (IS_ERR(mdata->sel_clk)) {
-		ret = PTR_ERR(mdata->sel_clk);
 		dev_err(&pdev->dev, "failed to get sel-clk: %d\n", ret);
-		goto err_put_master;
+		return PTR_ERR(mdata->sel_clk);
 	}
 
 	mdata->spi_clk = devm_clk_get(&pdev->dev, "spi-clk");
 	if (IS_ERR(mdata->spi_clk)) {
-		ret = PTR_ERR(mdata->spi_clk);
 		dev_err(&pdev->dev, "failed to get spi-clk: %d\n", ret);
-		goto err_put_master;
+		return PTR_ERR(mdata->spi_clk);
 	}
 
 	ret = clk_prepare_enable(mdata->spi_clk);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to enable spi_clk (%d)\n", ret);
-		goto err_put_master;
+		return ret;
 	}
 
 	ret = clk_set_parent(mdata->sel_clk, mdata->parent_clk);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to clk_set_parent (%d)\n", ret);
 		clk_disable_unprepare(mdata->spi_clk);
-		goto err_put_master;
+		return ret;
 	}
 
 	mdata->spi_clk_hz = clk_get_rate(mdata->spi_clk);
@@ -963,8 +951,6 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 err_disable_runtime_pm:
 	pm_runtime_disable(&pdev->dev);
-err_put_master:
-	spi_master_put(master);
 
 	return ret;
 }
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
