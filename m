Return-Path: <SRS0=NHOn=6A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A93DC352BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 15:59:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEA4E217D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 15:59:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbX3p1nS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEA4E217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpBwwGlavX4MP6HW0FpWN/E+a+0rIZXUfd4QWRPJiWk=; b=GbX3p1nSrqhcMb
	WqAGe3R03wu4hA+BqfMMHqFPx52gCU+P0BFO6g9svIVKGrf4zb2jQsXiVTg4CPvsDMiBs7JaC9FzM
	KwvsMZqJufHeyxIjO85BYuEiKg052iQu2uUZqK5YdZWpmR7opvK/IBiXm8yJTZclI7wzO+KU0P6pP
	1MCnkVI8XXFAg/nTiABuGK4i34bBpw+WXR9wcOaqAKuu5QR+GuCCKZXFxxgQAzMQq3LrwxLTz+1y+
	JR4G+GgtQpkIsHparAhNCA95+sxdkTDlNv8yT7D/vXkS9SbX3R7qakWahPKW0B7eHpCsksOAILGa9
	DGwI7f7graYtvD/Pj06Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP6ux-0000gm-OF; Thu, 16 Apr 2020 15:59:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP6tR-0007WL-4m; Thu, 16 Apr 2020 15:57:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 06F8D2A22AB
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] drm/mediatek: mtk_dsi: Convert to bridge driver
Date: Thu, 16 Apr 2020 17:57:16 +0200
Message-Id: <20200416155720.2360443-5-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200416155720.2360443-1-enric.balletbo@collabora.com>
References: <20200416155720.2360443-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_085733_476532_7CCDCC93 
X-CRM114-Status: GOOD (  15.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 laurent.pinchart@ideasonboard.com, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert mtk_dsi to a bridge driver with built-in encoder support for
compatibility with existing component drivers.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2: None

 drivers/gpu/drm/mediatek/mtk_dsi.c | 106 ++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 44ee884cc31c..3400d6686c85 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -180,6 +180,7 @@ struct mtk_dsi {
 	struct device *dev;
 	struct mipi_dsi_host host;
 	struct drm_encoder encoder;
+	struct drm_bridge bridge;
 	struct drm_connector conn;
 	struct drm_panel *panel;
 	struct drm_bridge *next_bridge;
@@ -205,9 +206,9 @@ struct mtk_dsi {
 	const struct mtk_dsi_driver_data *driver_data;
 };
 
-static inline struct mtk_dsi *encoder_to_dsi(struct drm_encoder *e)
+static inline struct mtk_dsi *bridge_to_dsi(struct drm_bridge *b)
 {
-	return container_of(e, struct mtk_dsi, encoder);
+	return container_of(b, struct mtk_dsi, bridge);
 }
 
 static inline struct mtk_dsi *connector_to_dsi(struct drm_connector *c)
@@ -796,32 +797,43 @@ static const struct drm_encoder_funcs mtk_dsi_encoder_funcs = {
 	.destroy = mtk_dsi_encoder_destroy,
 };
 
-static bool mtk_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
+static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi);
+static void mtk_dsi_destroy_conn_enc(struct mtk_dsi *dsi);
+
+static int mtk_dsi_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
-	return true;
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+
+	return mtk_dsi_create_conn_enc(bridge->dev, dsi);
+}
+
+static void mtk_dsi_bridge_detach(struct drm_bridge *bridge)
+{
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+
+	mtk_dsi_destroy_conn_enc(dsi);
 }
 
-static void mtk_dsi_encoder_mode_set(struct drm_encoder *encoder,
-				     struct drm_display_mode *mode,
-				     struct drm_display_mode *adjusted)
+static void mtk_dsi_bridge_mode_set(struct drm_bridge *bridge,
+				    const struct drm_display_mode *mode,
+				    const struct drm_display_mode *adjusted)
 {
-	struct mtk_dsi *dsi = encoder_to_dsi(encoder);
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
 	drm_display_mode_to_videomode(adjusted, &dsi->vm);
 }
 
-static void mtk_dsi_encoder_disable(struct drm_encoder *encoder)
+static void mtk_dsi_bridge_disable(struct drm_bridge *bridge)
 {
-	struct mtk_dsi *dsi = encoder_to_dsi(encoder);
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
 	mtk_output_dsi_disable(dsi);
 }
 
-static void mtk_dsi_encoder_enable(struct drm_encoder *encoder)
+static void mtk_dsi_bridge_enable(struct drm_bridge *bridge)
 {
-	struct mtk_dsi *dsi = encoder_to_dsi(encoder);
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
 	mtk_output_dsi_enable(dsi);
 }
@@ -833,11 +845,12 @@ static int mtk_dsi_connector_get_modes(struct drm_connector *connector)
 	return drm_panel_get_modes(dsi->panel, connector);
 }
 
-static const struct drm_encoder_helper_funcs mtk_dsi_encoder_helper_funcs = {
-	.mode_fixup = mtk_dsi_encoder_mode_fixup,
-	.mode_set = mtk_dsi_encoder_mode_set,
-	.disable = mtk_dsi_encoder_disable,
-	.enable = mtk_dsi_encoder_enable,
+static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
+	.attach = mtk_dsi_bridge_attach,
+	.detach = mtk_dsi_bridge_detach,
+	.disable = mtk_dsi_bridge_disable,
+	.enable = mtk_dsi_bridge_enable,
+	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
 static const struct drm_connector_funcs mtk_dsi_connector_funcs = {
@@ -888,20 +901,6 @@ static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
 {
 	int ret;
 
-	ret = drm_encoder_init(drm, &dsi->encoder, &mtk_dsi_encoder_funcs,
-			       DRM_MODE_ENCODER_DSI, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to encoder init to drm\n");
-		return ret;
-	}
-	drm_encoder_helper_add(&dsi->encoder, &mtk_dsi_encoder_helper_funcs);
-
-	/*
-	 * Currently display data paths are statically assigned to a crtc each.
-	 * crtc 0 is OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0
-	 */
-	dsi->encoder.possible_crtcs = 1;
-
 	/* If there's a bridge, attach to it and let it create the connector */
 	if (dsi->next_bridge) {
 		ret = drm_bridge_attach(&dsi->encoder, dsi->next_bridge, NULL,
@@ -1123,6 +1122,34 @@ static const struct mipi_dsi_host_ops mtk_dsi_ops = {
 	.transfer = mtk_dsi_host_transfer,
 };
 
+static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
+{
+	int ret;
+
+	ret = drm_encoder_init(drm, &dsi->encoder, &mtk_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
+	if (ret) {
+		DRM_ERROR("Failed to encoder init to drm\n");
+		return ret;
+	}
+
+	/*
+	 * Currently display data paths are statically assigned to a crtc each.
+	 * crtc 0 is OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0
+	 */
+	dsi->encoder.possible_crtcs = 1;
+
+	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
+	if (ret)
+		goto err_cleanup_encoder;
+
+	return 0;
+
+err_cleanup_encoder:
+	drm_encoder_cleanup(&dsi->encoder);
+	return ret;
+}
+
 static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	int ret;
@@ -1136,11 +1163,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	ret = mtk_dsi_create_conn_enc(drm, dsi);
-	if (ret) {
-		DRM_ERROR("Encoder create failed with %d\n", ret);
+	ret = mtk_dsi_encoder_init(drm, dsi);
+	if (ret)
 		goto err_unregister;
-	}
 
 	return 0;
 
@@ -1155,7 +1180,6 @@ static void mtk_dsi_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
-	mtk_dsi_destroy_conn_enc(dsi);
 	mtk_ddp_comp_unregister(drm, &dsi->ddp_comp);
 }
 
@@ -1265,6 +1289,11 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dsi);
 
+	dsi->bridge.funcs = &mtk_dsi_bridge_funcs;
+	dsi->bridge.of_node = dev->of_node;
+
+	drm_bridge_add(&dsi->bridge);
+
 	ret = component_add(&pdev->dev, &mtk_dsi_component_ops);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add component: %d\n", ret);
@@ -1283,6 +1312,7 @@ static int mtk_dsi_remove(struct platform_device *pdev)
 	struct mtk_dsi *dsi = platform_get_drvdata(pdev);
 
 	mtk_output_dsi_disable(dsi);
+	drm_bridge_remove(&dsi->bridge);
 	component_del(&pdev->dev, &mtk_dsi_component_ops);
 	mipi_dsi_host_unregister(&dsi->host);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
