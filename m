Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D86C4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 08:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evxi6usGPO+fiAY9RJ/ytCvgy5L0z9oCNmAUy6UezAE=; b=n62/lohzC04iSR
	RfkGQVrricT0jOSqYheH8WNvsJ5WY3NA4BaTLHki3pjg2eJbFdFz3km9qa5o1vsViSocrhQ9x8A1O
	ims5OpyqtNPQks03KEYDNpiHxjwUqgMlwcf/hQX/gzoMTCRbAQLkgF90FgVa58lQ+3mmvjGabn6fA
	yNnYoRVeN0eT9qousITYdZtXJtJ1vR02GjY4Z30M9BVwBD/3CDUPXdahSgH5PC5dW8d57Jx8ZV62K
	7K8gq2CEF+6BwS2p3zeyKGwGnjLlaVD5WysGFb9tSNowIXW2ZGiWqbKmq2vGwbVHchRXeK+IjBjRw
	kDDXvrA2REqg/k3yUWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXVW-0000000FPVF-0VZp;
	Thu, 15 Feb 2024 08:54:14 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXUn-0000000FOtU-2zsP;
	Thu, 15 Feb 2024 08:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707987208;
	bh=jewx2tbyoHc8XkBckJRK6kMqgXG1NMO8tumrU7DXJMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qGLdn6Dx2Tsr2gpHcGQbcAKqsCLbT7fgh4ZWv5StJ65+WIWsMWBAvd/mOB9cMgGPl
	 AVg+t2ygVDNo65HKoUB16F61w8045yCnUM38NyBPE5XCYSVlnOpBTv0aq6qiPd7gmb
	 pCTFuW3rQNQ1cNXaH+jSfL7v8qYKGGU05+F6z/WVGkmm11EbbAVxBQ5at3MXfklcsx
	 /FpqjTufwuWUJppN42Q2GsR18Js4SVIz3P9Ig2TpL7mhnO4WR0W2/FNj/tlR9Qj/nE
	 rUInpEfhPnNr18tpTwGtxVu0s0HOv0qGI6tH+/BKsDNr/OnFjVx55cgfDpiyFGLF6k
	 IinOiVV42fMdw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 836D737820B2;
	Thu, 15 Feb 2024 08:53:27 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v6 7/9] drm/mediatek: dsi: Simplify with dev_err_probe and remove gotos
Date: Thu, 15 Feb 2024 09:53:14 +0100
Message-ID: <20240215085316.56835-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
References: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_005329_940050_07CCD301 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: p.zabel@pengutronix.de, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Most of the functions that are called in the probe callback are
devm managed, or all but mipi_dsi_host_register(): simplify the probe
function's error paths with dev_err_probe() and remove the lonely
instance of `goto err_unregister_host` by just directly calling the
mipi_dsi_host_unregister() function in the devm_request_irq() error
path, allowing to also remove the same label.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 60 +++++++++---------------------
 1 file changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index b3dd6251d611..195ff4dfc3a3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1117,64 +1117,44 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->driver_data = of_device_get_match_data(dev);
 
 	dsi->engine_clk = devm_clk_get(dev, "engine");
-	if (IS_ERR(dsi->engine_clk)) {
-		ret = PTR_ERR(dsi->engine_clk);
+	if (IS_ERR(dsi->engine_clk))
+		return dev_err_probe(dev, PTR_ERR(dsi->engine_clk),
+				     "Failed to get engine clock\n");
 
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get engine clock: %d\n", ret);
-		return ret;
-	}
 
 	dsi->digital_clk = devm_clk_get(dev, "digital");
-	if (IS_ERR(dsi->digital_clk)) {
-		ret = PTR_ERR(dsi->digital_clk);
-
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get digital clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->digital_clk))
+		return dev_err_probe(dev, PTR_ERR(dsi->digital_clk),
+				     "Failed to get digital clock\n");
 
 	dsi->hs_clk = devm_clk_get(dev, "hs");
-	if (IS_ERR(dsi->hs_clk)) {
-		ret = PTR_ERR(dsi->hs_clk);
-		dev_err(dev, "Failed to get hs clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->hs_clk))
+		return dev_err_probe(dev, PTR_ERR(dsi->hs_clk), "Failed to get hs clock\n");
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dsi->regs = devm_ioremap_resource(dev, regs);
-	if (IS_ERR(dsi->regs)) {
-		ret = PTR_ERR(dsi->regs);
-		dev_err(dev, "Failed to ioremap memory: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->regs))
+		return dev_err_probe(dev, PTR_ERR(dsi->regs), "Failed to ioremap memory\n");
 
 	dsi->phy = devm_phy_get(dev, "dphy");
-	if (IS_ERR(dsi->phy)) {
-		ret = PTR_ERR(dsi->phy);
-		dev_err(dev, "Failed to get MIPI-DPHY: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->phy))
+		return dev_err_probe(dev, PTR_ERR(dsi->phy), "Failed to get MIPI-DPHY\n");
 
 	irq_num = platform_get_irq(pdev, 0);
-	if (irq_num < 0) {
-		ret = irq_num;
-		return ret;
-	}
+	if (irq_num < 0)
+		return irq_num;
 
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
 	ret = mipi_dsi_host_register(&dsi->host);
-	if (ret < 0) {
-		dev_err(dev, "failed to register DSI host: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
 
 	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
 			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), dsi);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to request mediatek dsi irq\n");
-		goto err_unregister_host;
+		mipi_dsi_host_unregister(&dsi->host);
+		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
 	}
 
 	init_waitqueue_head(&dsi->irq_wait_queue);
@@ -1186,10 +1166,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	return 0;
-
-err_unregister_host:
-	mipi_dsi_host_unregister(&dsi->host);
-	return ret;
 }
 
 static void mtk_dsi_remove(struct platform_device *pdev)
-- 
2.43.0


