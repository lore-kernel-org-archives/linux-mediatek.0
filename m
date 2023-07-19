Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F0CC001E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8MaP6nQDZH8Y9K5brzxODK4teXwzKGzAUwaz8ZAK+g=; b=Knv2Joi2tOEsPm
	F/XmFSJIHPs3l2vPd3T+M0vBDhVOm1ZSjqQ11HrXM+JOhcyxWiUYQYfmaIX9FN0FNHOOBAqr0qPj0
	QevGcq/1xL19m9dSDTXA6ZWqvm8Roa9DBXinRrge8ye/gGVpd7/3sSLW216//xUgqovnRkd0d6NR1
	KRK183ZIvfYOAz05UCOb0TDrmPF9mCW2Igcv7O1dz/aJ8jWVKH011oqXWc9doeWo9uJ9Z/PXy48rp
	GY6aj8zqwdZn7gMD71RrZ93JCniFi2rLWP5snO+3dgxgjMtV0hQggVv3aZYlMrRXzCfCEX58wIFeb
	6BbUf1QAdIAYru3UF9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1xw-0068wG-18;
	Wed, 19 Jul 2023 07:51:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1xl-0068nF-28;
	Wed, 19 Jul 2023 07:51:11 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E2836607071;
	Wed, 19 Jul 2023 08:51:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689753068;
	bh=/guFaoIX4NI5OLZeiGkk3cUFsDGNGR4HcNgc6I/UWos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ljb+s1S6A8nO+QXVJGYqXNZhgvYVDxBP5cztZP78sAI6qJyRz19cr0+vozAQXFu5s
	 vZXdUPEaK3xCVFUJrOZN0eBq1yxI3hJpqDHGTExl7i2YFMAqkAi3Ka0D59p6VbCHas
	 Ye0UqOBfOAYNWJgGCPm9ZRwoFUEeT1aUgs0Oj7sgMbYvILT6GwN1+8v2S+0k0a297I
	 S8YXqpUrkW++CJVmlRkb0m7ILU4AFrEAK/+QTLL8VGvbDd7HBhInzlB9zmRC0p5Uqm
	 8lJ0AlnsibrBCL9mZgJjUqULuAxdPy7RuuWJCtIRzONnhyz4Uv7v25uJ4C8HvyyHVk
	 aA8YxemF+Eo5A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 2/6] drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
Date: Wed, 19 Jul 2023 09:50:52 +0200
Message-Id: <20230719075056.72178-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005109_826539_20077076 
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use dev_err_probe() across the entire probe function of this driver
to shrink the size.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 44 ++++++++++--------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 74068aa70e0c..03a2b900bb50 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1040,38 +1040,24 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	}
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dpi->regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(dpi->regs)) {
-		ret = PTR_ERR(dpi->regs);
-		dev_err(dev, "Failed to ioremap mem resource: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dpi->regs))
+		return dev_err_probe(dev, PTR_ERR(dpi->regs),
+				     "Failed to ioremap mem resource\n");
 
 	dpi->engine_clk = devm_clk_get(dev, "engine");
-	if (IS_ERR(dpi->engine_clk)) {
-		ret = PTR_ERR(dpi->engine_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get engine clock: %d\n", ret);
-
-		return ret;
-	}
+	if (IS_ERR(dpi->engine_clk))
+		return dev_err_probe(dev, PTR_ERR(dpi->engine_clk),
+				     "Failed to get engine clock\n");
 
 	dpi->pixel_clk = devm_clk_get(dev, "pixel");
-	if (IS_ERR(dpi->pixel_clk)) {
-		ret = PTR_ERR(dpi->pixel_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get pixel clock: %d\n", ret);
-
-		return ret;
-	}
+	if (IS_ERR(dpi->pixel_clk))
+		return dev_err_probe(dev, PTR_ERR(dpi->pixel_clk),
+				     "Failed to get pixel clock\n");
 
 	dpi->tvd_clk = devm_clk_get(dev, "pll");
-	if (IS_ERR(dpi->tvd_clk)) {
-		ret = PTR_ERR(dpi->tvd_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get tvdpll clock: %d\n", ret);
-
-		return ret;
-	}
+	if (IS_ERR(dpi->tvd_clk))
+		return dev_err_probe(dev, PTR_ERR(dpi->tvd_clk),
+				     "Failed to get tvdpll clock\n");
 
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
@@ -1095,10 +1081,8 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = component_add(dev, &mtk_dpi_component_ops);
-	if (ret) {
-		dev_err(dev, "Failed to add component: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add component.\n");
 
 	return 0;
 }
-- 
2.40.1


