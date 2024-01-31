Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2021EC47DB3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJURPG5/fRDe4K9+HDtJRFwlrSLXYVYEnRS473iLhpE=; b=uiTowzgMnkaXdC
	AYTofXxPPRISDXuoND+cDhDDjgteaNKpxk4DiYjyKfzhhawszem/mSJLLt342tJeuUqR9q5LfAP2s
	eVJr/aVERTG2xYfWpPy1KJ0mRxaIAeu8R5rPRj+Z7dAJTlDguj2phzPfnAJjLH0/XoHT1+rqhRiIq
	khJ+xCrd7qiFO/OpepKHOgt/LdbT351xn4V+36ohe0MCn4YjAj8gaQ4vWZTbmyrY5C6MCtpQiJa3s
	OXeyEhvHSX/PeAJdt0VLh6D/I4oY8CKK+0v5pEBbkR5OKj8wCc8Q2utOFwl0yOSSXagNyo9SVwZjQ
	zlRsRx9cFgQQZRovNtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8sL-000000038ft-2IKp;
	Wed, 31 Jan 2024 11:35:29 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8rg-000000038BW-0SRT;
	Wed, 31 Jan 2024 11:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706700886;
	bh=ez/krp9UYdl/uYGqHtJoEk78GGME1WaiapUNmzMMnNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1ME7a2wRNuV+zfLkzfeKrOeJPOz7YPHXfMD3BLKZfJA8TXF+AGHshjKmNbHpOZLSO
	 KnVooCsMsmYTA41x9Pt4RBr6Lb9m/UWkIDd7ImSg6fjB6osGrlwRCetfEQgxORQ6Js
	 vUYBsT/217En8Z7l0nhVA1fRhfwlJtPpeszFaf8opK52akAyAelc9Gg1LvUv3qtTNZ
	 Pz1dcUk/VMwvVxTxICdgdfWzl1pRCQx0LWesovFXGVOcdRbS627JibJqGL5mrp5nq5
	 JySFm4QkqfdH4/t2wBe9L0qDUp13qI6NvkkyA/OwaTduTd03zT8VJ41ZRxPp0LhDmq
	 deRoIG1Vlwevw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 12D803782089;
	Wed, 31 Jan 2024 11:34:46 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 6/7] drm/mediatek: dsi: Simplify with dev_err_probe and remove gotos
Date: Wed, 31 Jan 2024 12:34:33 +0100
Message-ID: <20240131113434.241929-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
References: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_033448_403209_76CB5A69 
X-CRM114-Status: GOOD (  12.79  )
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

Most of the functions that are called in the probe callback are
devm managed, or all but mipi_dsi_host_register(): simplify the probe
function's error paths with dev_err_probe() and remove the lonely
instance of `goto err_unregister_host` by just directly calling the
mipi_dsi_host_unregister() function in the devm_request_irq() error
path, allowing to also remove the same label.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 60 +++++++++---------------------
 1 file changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 709a65656b79..5a0f078987d3 100644
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


