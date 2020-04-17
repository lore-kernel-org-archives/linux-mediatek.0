Return-Path: <SRS0=UdZw=6B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C49AC38A2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 15:08:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DBAD21924
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 15:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NqAlx2ac"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DBAD21924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjWCH3EZ+RxpeZLdLBAvCDZnZ7k4a0j7i8niOWybAHI=; b=NqAlx2acvo4YeK
	PrX7lxbxPl9vkT/CnPSjjFs6mQSfJOtXbb/+EmcLkt4JIS/4Vh3BOg9KNnR+CxzuzfZ0m+P8bSSYw
	oZAR/+aRg+sVBA5TFaVTIn5oLqmn046NfLJnjUDmJhxvkXBMgNDSgEDWe0VtjP14FUyiyFpWAHnm6
	r6MCeuLRR6ACjyuanMOPJFf/XJ0My0qW5yNtjL5VMN8RZGx98B3wWyNdhyqW/ExYzge4iVTq9KF8F
	C98py70k2VjLC7dPsbKezRMdT0s9QgcINSGR94dBVFaar5DwwKIyoVjpaTzGnlNzVz2THfFCrsUuf
	MBMl4TXL8FZeU2e29vIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPSbM-0001x1-UR; Fri, 17 Apr 2020 15:08:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPSZc-00008d-N7; Fri, 17 Apr 2020 15:06:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 345DD2A2A75
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org,
	Collabora Kernel ML <kernel@collabora.com>
Subject: [PATCH v3 6/7] drm/mediatek: mtk_dsi: Use the drm_panel_bridge API
Date: Fri, 17 Apr 2020 17:06:13 +0200
Message-Id: <20200417150614.2631786-7-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200417150614.2631786-1-enric.balletbo@collabora.com>
References: <20200417150614.2631786-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_080633_038645_C5943DDC 
X-CRM114-Status: GOOD (  15.96  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace the manual panel handling code by a drm_panel_bridge. This
simplifies the driver and allows all components in the display pipeline
to be treated as bridges, paving the way to generic connector handling.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v3:
- Use next_bridge field to store the panel bridge. (Laurent Pinchart)
- Add the bridge.type field. (Laurent Pinchart)
- This patch requires https://lkml.org/lkml/2020/4/16/2080 to work
  properly.

Changes in v2:
- Do not set connector_type for panel here. (Sam Ravnborg)

 drivers/gpu/drm/mediatek/mtk_dsi.c | 187 +++--------------------------
 1 file changed, 14 insertions(+), 173 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d68694ff00dc..157097c63b23 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -182,8 +182,6 @@ struct mtk_dsi {
 	struct mipi_dsi_host host;
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
-	struct drm_connector conn;
-	struct drm_panel *panel;
 	struct drm_bridge *next_bridge;
 	struct phy *phy;
 
@@ -212,11 +210,6 @@ static inline struct mtk_dsi *bridge_to_dsi(struct drm_bridge *b)
 	return container_of(b, struct mtk_dsi, bridge);
 }
 
-static inline struct mtk_dsi *connector_to_dsi(struct drm_connector *c)
-{
-	return container_of(c, struct mtk_dsi, conn);
-}
-
 static inline struct mtk_dsi *host_to_dsi(struct mipi_dsi_host *h)
 {
 	return container_of(h, struct mtk_dsi, host);
@@ -682,16 +675,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_lane0_ulp_mode_leave(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 0);
 
-	if (dsi->panel) {
-		if (drm_panel_prepare(dsi->panel)) {
-			DRM_ERROR("failed to prepare the panel\n");
-			goto err_disable_digital_clk;
-		}
-	}
-
 	return 0;
-err_disable_digital_clk:
-	clk_disable_unprepare(dsi->digital_clk);
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);
 err_phy_power_off:
@@ -718,15 +702,7 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	 */
 	mtk_dsi_stop(dsi);
 
-	if (!mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500)) {
-		if (dsi->panel) {
-			if (drm_panel_unprepare(dsi->panel)) {
-				DRM_ERROR("failed to unprepare the panel\n");
-				return;
-			}
-		}
-	}
-
+	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
 	mtk_dsi_reset_engine(dsi);
 	mtk_dsi_lane0_ulp_mode_enter(dsi);
 	mtk_dsi_clk_ulp_mode_enter(dsi);
@@ -757,19 +733,7 @@ static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 
 	mtk_dsi_start(dsi);
 
-	if (dsi->panel) {
-		if (drm_panel_enable(dsi->panel)) {
-			DRM_ERROR("failed to enable the panel\n");
-			goto err_dsi_power_off;
-		}
-	}
-
 	dsi->enabled = true;
-
-	return;
-err_dsi_power_off:
-	mtk_dsi_stop(dsi);
-	mtk_dsi_poweroff(dsi);
 }
 
 static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
@@ -777,34 +741,19 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
 	if (!dsi->enabled)
 		return;
 
-	if (dsi->panel) {
-		if (drm_panel_disable(dsi->panel)) {
-			DRM_ERROR("failed to disable the panel\n");
-			return;
-		}
-	}
-
 	mtk_dsi_poweroff(dsi);
 
 	dsi->enabled = false;
 }
 
-static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi);
-static void mtk_dsi_destroy_conn_enc(struct mtk_dsi *dsi);
-
 static int mtk_dsi_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
-	return mtk_dsi_create_conn_enc(bridge->dev, dsi);
-}
-
-static void mtk_dsi_bridge_detach(struct drm_bridge *bridge)
-{
-	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
-
-	mtk_dsi_destroy_conn_enc(dsi);
+	/* Attach the panel or bridge to the dsi bridge */
+	return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
+				 &dsi->bridge, flags);
 }
 
 static void mtk_dsi_bridge_mode_set(struct drm_bridge *bridge,
@@ -830,115 +779,13 @@ static void mtk_dsi_bridge_enable(struct drm_bridge *bridge)
 	mtk_output_dsi_enable(dsi);
 }
 
-static int mtk_dsi_connector_get_modes(struct drm_connector *connector)
-{
-	struct mtk_dsi *dsi = connector_to_dsi(connector);
-
-	return drm_panel_get_modes(dsi->panel, connector);
-}
-
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
-	.detach = mtk_dsi_bridge_detach,
 	.disable = mtk_dsi_bridge_disable,
 	.enable = mtk_dsi_bridge_enable,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-static const struct drm_connector_funcs mtk_dsi_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs
-	mtk_dsi_connector_helper_funcs = {
-	.get_modes = mtk_dsi_connector_get_modes,
-};
-
-static int mtk_dsi_create_connector(struct drm_device *drm, struct mtk_dsi *dsi)
-{
-	int ret;
-
-	ret = drm_connector_init(drm, &dsi->conn, &mtk_dsi_connector_funcs,
-				 DRM_MODE_CONNECTOR_DSI);
-	if (ret) {
-		DRM_ERROR("Failed to connector init to drm\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(&dsi->conn, &mtk_dsi_connector_helper_funcs);
-
-	dsi->conn.dpms = DRM_MODE_DPMS_OFF;
-	drm_connector_attach_encoder(&dsi->conn, &dsi->encoder);
-
-	if (dsi->panel) {
-		ret = drm_panel_attach(dsi->panel, &dsi->conn);
-		if (ret) {
-			DRM_ERROR("Failed to attach panel to drm\n");
-			goto err_connector_cleanup;
-		}
-	}
-
-	return 0;
-
-err_connector_cleanup:
-	drm_connector_cleanup(&dsi->conn);
-	return ret;
-}
-
-static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
-{
-	int ret;
-
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
-	/* If there's a next bridge, attach to it and let it create the connector */
-	if (dsi->next_bridge) {
-		ret = drm_bridge_attach(&dsi->encoder, dsi->next_bridge, NULL,
-					0);
-		if (ret) {
-			DRM_ERROR("Failed to attach bridge to drm\n");
-			goto err_encoder_cleanup;
-		}
-	} else {
-		/* Otherwise create our own connector and attach to a panel */
-		ret = mtk_dsi_create_connector(drm, dsi);
-		if (ret)
-			goto err_encoder_cleanup;
-	}
-
-	return 0;
-
-err_encoder_cleanup:
-	drm_encoder_cleanup(&dsi->encoder);
-	return ret;
-}
-
-static void mtk_dsi_destroy_conn_enc(struct mtk_dsi *dsi)
-{
-	drm_encoder_cleanup(&dsi->encoder);
-	/* Skip connector cleanup if creation was delegated to the bridge */
-	if (dsi->conn.dev)
-		drm_connector_cleanup(&dsi->conn);
-	if (dsi->panel)
-		drm_panel_detach(dsi->panel);
-}
-
 static void mtk_dsi_ddp_start(struct mtk_ddp_comp *comp)
 {
 	struct mtk_dsi *dsi = container_of(comp, struct mtk_dsi, ddp_comp);
@@ -967,20 +814,6 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	if (dsi->conn.dev)
-		drm_helper_hpd_irq_event(dsi->conn.dev);
-
-	return 0;
-}
-
-static int mtk_dsi_host_detach(struct mipi_dsi_host *host,
-			       struct mipi_dsi_device *device)
-{
-	struct mtk_dsi *dsi = host_to_dsi(host);
-
-	if (dsi->conn.dev)
-		drm_helper_hpd_irq_event(dsi->conn.dev);
-
 	return 0;
 }
 
@@ -1124,7 +957,6 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 
 static const struct mipi_dsi_host_ops mtk_dsi_ops = {
 	.attach = mtk_dsi_host_attach,
-	.detach = mtk_dsi_host_detach,
 	.transfer = mtk_dsi_host_transfer,
 };
 
@@ -1198,6 +1030,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
+	struct drm_panel *panel;
 	struct resource *regs;
 	int irq_num;
 	int comp_id;
@@ -1216,10 +1049,18 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &dsi->panel, &dsi->next_bridge);
+					  &panel, &dsi->next_bridge);
 	if (ret)
 		goto err_unregister_host;
 
+	if (panel) {
+		dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(dsi->next_bridge)) {
+			ret = PTR_ERR(dsi->next_bridge);
+			goto err_unregister_host;
+		}
+	}
+
 	dsi->driver_data = of_device_get_match_data(dev);
 
 	dsi->engine_clk = devm_clk_get(dev, "engine");
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
