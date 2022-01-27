Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46A5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 14:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+6f4whl92sSPsDt7vYKRfgm+EqV0gDV89Q/4Ew2yIWg=; b=dNAYsX7Y3n70N7
	VVNSnHfJBe9457Xk1DJnk9DSRY1+8p6AylKvn7E4toUcTWrE3m+xVvTVDtxq+C3oaNY3rRvIri8Zy
	PZ5nYVe6UiutOqyh1QaJmKbAYFRKzbcAXmjsBJ/8uM7Kl7PbqCUKng2ItVyp0zklk9/gXeAf0nz/1
	noM8lywl2c06SW14FCOMK+PE+cYo+9f/lyk++EViSZ/5lXfCZQR8vpudFJsQ3NtECinuexaUQQhKQ
	vIxuV/JFM6BV+0sZlGktzWff8rWemAEqRDBTImgmluDcfka4Qln9pcVddLuhyh3nADeO5whR0bblj
	h1hOs2wYPKVO3ooIZgfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD5tI-00G5Um-DV; Thu, 27 Jan 2022 14:36:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD5t2-00G5Q7-LO; Thu, 27 Jan 2022 14:36:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DFA301F45393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643294190;
 bh=3IdE6LoZ1ETmacWuilGWdcqDG0QyqCl29Cn/VqP2g/s=;
 h=From:To:Cc:Subject:Date:From;
 b=T595yv6mYzunV8OirmSDlCOEeBshfA/Gcqi6nDLt7C4T1u9Wy2UCurKE7qa2PpN4x
 fhh3u5klUdom2Q6cVe+7WM8m1D/sPVqxTn/jZB7HSu1uluq/R0KKk4nakG6yoyOp+L
 dZEesjMmV71Xugvsc2/SXXA5VvVr4k1sC4pvulSP7R7a5ZpMcYW/XLsWcbYNNHpcCE
 VbkjoABbxwfDsVcgLReyjO7Y1U5eU2UFiKS51RSqLtyVPlLiaQEvIENc/kaQzAWQSG
 GbTJr6GOb7/wuJYdhVWAykUyAveX1XTmIZ/eMhQPyoKStO1+oFonBxnmLg3FzsHc5/
 22jZxZ+cmucXQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, kernel@collabora.com, andrzej.hajda@intel.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
Date: Thu, 27 Jan 2022 15:36:23 +0100
Message-Id: <20220127143623.123025-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_063633_011326_A4E2BD7E 
X-CRM114-Status: GOOD (  20.59  )
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

DRM bridge drivers are now attaching their DSI device at probe time,
which requires us to register our DSI host in order to let the bridge
to probe: this recently started producing an endless -EPROBE_DEFER
loop on some machines that are using external bridges, like the
parade-ps8640, found on the ACER Chromebook R13.

Now that the DSI hosts/devices probe sequence is documented, we can
do adjustments to the mtk_dsi driver as to both fix now and make sure
to avoid this situation in the future: for this, following what is
documented in drm_bridge.c, move the mtk_dsi component_add() to the
mtk_dsi_ops.attach callback and delete it in the detach callback;
keeping in mind that we are registering a drm_bridge for our DSI,
which is only used/attached if the DSI Host is bound, it wouldn't
make sense to keep adding our bridge at probe time (as it would
be useless to have it if mtk_dsi_ops.attach() fails!), so also move
that one to the dsi host attach function (and remove it in detach).

Fixes: 209264a85707 ("drm/bridge: Document the probe issue with MIPI-DSI bridges")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>

---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++--------------
 1 file changed, 84 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..bced4c7d668e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -786,18 +786,101 @@ void mtk_dsi_ddp_stop(struct device *dev)
 	mtk_dsi_poweroff(dsi);
 }
 
+static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
+{
+	int ret;
+
+	ret = drm_simple_encoder_init(drm, &dsi->encoder,
+				      DRM_MODE_ENCODER_DSI);
+	if (ret) {
+		DRM_ERROR("Failed to encoder init to drm\n");
+		return ret;
+	}
+
+	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
+
+	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		goto err_cleanup_encoder;
+
+	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
+	if (IS_ERR(dsi->connector)) {
+		DRM_ERROR("Unable to create bridge connector\n");
+		ret = PTR_ERR(dsi->connector);
+		goto err_cleanup_encoder;
+	}
+	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
+
+	return 0;
+
+err_cleanup_encoder:
+	drm_encoder_cleanup(&dsi->encoder);
+	return ret;
+}
+
+static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
+{
+	int ret;
+	struct drm_device *drm = data;
+	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+
+	ret = mtk_dsi_encoder_init(drm, dsi);
+	if (ret)
+		return ret;
+
+	return device_reset_optional(dev);
+}
+
+static void mtk_dsi_unbind(struct device *dev, struct device *master,
+			   void *data)
+{
+	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+
+	drm_encoder_cleanup(&dsi->encoder);
+}
+
+static const struct component_ops mtk_dsi_component_ops = {
+	.bind = mtk_dsi_bind,
+	.unbind = mtk_dsi_unbind,
+};
+
 static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
 			       struct mipi_dsi_device *device)
 {
 	struct mtk_dsi *dsi = host_to_dsi(host);
+	struct device *dev = host->dev;
+	int ret;
 
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
+	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(dsi->next_bridge))
+		return PTR_ERR(dsi->next_bridge);
+
+	drm_bridge_add(&dsi->bridge);
+
+	ret = component_add(host->dev, &mtk_dsi_component_ops);
+	if (ret) {
+		DRM_ERROR("failed to add dsi_host component: %d\n", ret);
+		drm_bridge_remove(&dsi->bridge);
+		return ret;
+	}
 
 	return 0;
 }
 
+static int mtk_dsi_host_detach(struct mipi_dsi_host *host,
+			       struct mipi_dsi_device *device)
+{
+	struct mtk_dsi *dsi = host_to_dsi(host);
+
+	component_del(host->dev, &mtk_dsi_component_ops);
+	drm_bridge_remove(&dsi->bridge);
+	return 0;
+}
+
 static void mtk_dsi_wait_for_idle(struct mtk_dsi *dsi)
 {
 	int ret;
@@ -938,73 +1021,14 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 
 static const struct mipi_dsi_host_ops mtk_dsi_ops = {
 	.attach = mtk_dsi_host_attach,
+	.detach = mtk_dsi_host_detach,
 	.transfer = mtk_dsi_host_transfer,
 };
 
-static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
-{
-	int ret;
-
-	ret = drm_simple_encoder_init(drm, &dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
-	if (ret) {
-		DRM_ERROR("Failed to encoder init to drm\n");
-		return ret;
-	}
-
-	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
-
-	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
-				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret)
-		goto err_cleanup_encoder;
-
-	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
-	if (IS_ERR(dsi->connector)) {
-		DRM_ERROR("Unable to create bridge connector\n");
-		ret = PTR_ERR(dsi->connector);
-		goto err_cleanup_encoder;
-	}
-	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
-
-	return 0;
-
-err_cleanup_encoder:
-	drm_encoder_cleanup(&dsi->encoder);
-	return ret;
-}
-
-static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
-{
-	int ret;
-	struct drm_device *drm = data;
-	struct mtk_dsi *dsi = dev_get_drvdata(dev);
-
-	ret = mtk_dsi_encoder_init(drm, dsi);
-	if (ret)
-		return ret;
-
-	return device_reset_optional(dev);
-}
-
-static void mtk_dsi_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	struct mtk_dsi *dsi = dev_get_drvdata(dev);
-
-	drm_encoder_cleanup(&dsi->encoder);
-}
-
-static const struct component_ops mtk_dsi_component_ops = {
-	.bind = mtk_dsi_bind,
-	.unbind = mtk_dsi_unbind,
-};
-
 static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	struct drm_panel *panel;
 	struct resource *regs;
 	int irq_num;
 	int ret;
@@ -1021,19 +1045,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &panel, &dsi->next_bridge);
-	if (ret)
-		goto err_unregister_host;
-
-	if (panel) {
-		dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
-		if (IS_ERR(dsi->next_bridge)) {
-			ret = PTR_ERR(dsi->next_bridge);
-			goto err_unregister_host;
-		}
-	}
-
 	dsi->driver_data = of_device_get_match_data(dev);
 
 	dsi->engine_clk = devm_clk_get(dev, "engine");
@@ -1098,14 +1109,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-	drm_bridge_add(&dsi->bridge);
-
-	ret = component_add(&pdev->dev, &mtk_dsi_component_ops);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to add component: %d\n", ret);
-		goto err_unregister_host;
-	}
-
 	return 0;
 
 err_unregister_host:
@@ -1118,8 +1121,6 @@ static int mtk_dsi_remove(struct platform_device *pdev)
 	struct mtk_dsi *dsi = platform_get_drvdata(pdev);
 
 	mtk_output_dsi_disable(dsi);
-	drm_bridge_remove(&dsi->bridge);
-	component_del(&pdev->dev, &mtk_dsi_component_ops);
 	mipi_dsi_host_unregister(&dsi->host);
 
 	return 0;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
