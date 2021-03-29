Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E25C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:07:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B6261987
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58B6261987
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjPJqlTYTrZTzLX0Rc1hW+KYmPPSQXqnMsoIwMBtYkw=; b=OujqbfD033B1BanUuW52QqzQsC
	pVXyITaZQ3QN0x76TyKHz9CvzhUHQn+IjfY73zvKQmsbw0Bc6Lbccy8P+rgQt85OeClIECaRUUxmz
	JUsao8FjB+UcAAnhvtdIYapxhhFwwRBu3upPe8rdpi6YgSnE1FlY+JmITxbzvPQfbgiuZYF747TMG
	jyGEm5o5QLuwkBIJl1Vl1prG5kxFozAILDHMj3QNKCrTzD7Ec/PCSkpgV0ilqgd2at6MA6Xbb56s6
	W8HcPgdfDYh4yzg+IF8MvOxrWvM7g5m2w+hsr3T5yNpv1+pfl+7LXj1ZUzG9YfzSpuxYVxdxT11LP
	n0utuGjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0yJ-001pwg-Gb; Mon, 29 Mar 2021 23:06:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQtwm-000jtx-PN
 for linux-mediatek@lists.infradead.org; Mon, 29 Mar 2021 15:37:11 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:85ba:22ea:8b43:4375])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 582AD1F45543;
 Mon, 29 Mar 2021 16:36:53 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, kernel@collabora.com, dafna3@gmail.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, enric.balletbo@collabora.com,
 laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 2/3] drm/mediatek: Don't support hdmi connector creation
Date: Mon, 29 Mar 2021 17:36:31 +0200
Message-Id: <20210329153632.17559-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329153632.17559-1-dafna.hirschfeld@collabora.com>
References: <20210329153632.17559-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_163707_760999_68C6E51F 
X-CRM114-Status: GOOD (  18.39  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

commit f01195148967 ("drm/mediatek: mtk_dpi: Create connector for bridges")
broke the display support for elm device since mtk_dpi calls
drm_bridge_attach with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
while mtk_hdmi does not yet support this flag.

Fix this by accepting DRM_BRIDGE_ATTACH_NO_CONNECTOR in bridge attachment.
Implement the drm_bridge_funcs .detect() and .get_edid() operations, and
call drm_bridge_hpd_notify() to report HPD. This provides the
necessary API to support disabling connector creation.

This patch is inspired by a similar patch for bridge/synopsys/dw-hdmi.c:
commit ec971aaa6775 ("drm: bridge: dw-hdmi: Make connector creation optional")
But with the difference that in mtk-hdmi only the option of not creating
a connector is supported.

Fixes: f01195148967 ("drm/mediatek: mtk_dpi: Create connector for bridges")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 129 ++++++++++------------------
 1 file changed, 44 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index f2c810b767ef..1eeb211b1536 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -186,11 +186,6 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
 	return container_of(b, struct mtk_hdmi, bridge);
 }
 
-static inline struct mtk_hdmi *hdmi_ctx_from_conn(struct drm_connector *c)
-{
-	return container_of(c, struct mtk_hdmi, conn);
-}
-
 static u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
 {
 	return readl(hdmi->regs + offset);
@@ -1201,48 +1196,30 @@ mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 	       connector_status_connected : connector_status_disconnected;
 }
 
-static enum drm_connector_status hdmi_conn_detect(struct drm_connector *conn,
-						  bool force)
-{
-	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
-	return mtk_hdmi_update_plugged_status(hdmi);
-}
-
-static void hdmi_conn_destroy(struct drm_connector *conn)
+static struct edid *mtk_hdmi_get_edid(struct mtk_hdmi *hdmi,
+				      struct drm_connector *connector)
 {
-	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
-
-	mtk_cec_set_hpd_event(hdmi->cec_dev, NULL, NULL);
-
-	drm_connector_cleanup(conn);
-}
-
-static int mtk_hdmi_conn_get_modes(struct drm_connector *conn)
-{
-	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
 	struct edid *edid;
-	int ret;
 
 	if (!hdmi->ddc_adpt)
-		return -ENODEV;
-
-	edid = drm_get_edid(conn, hdmi->ddc_adpt);
+		return NULL;
+	edid = drm_get_edid(connector, hdmi->ddc_adpt);
 	if (!edid)
-		return -ENODEV;
-
+		return NULL;
 	hdmi->dvi_mode = !drm_detect_monitor_audio(edid);
+	return edid;
+}
 
-	drm_connector_update_edid_property(conn, edid);
-
-	ret = drm_add_edid_modes(conn, edid);
-	kfree(edid);
-	return ret;
+static enum drm_connector_status mtk_hdmi_detect(struct mtk_hdmi *hdmi)
+{
+	return mtk_hdmi_update_plugged_status(hdmi);
 }
 
-static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
-				    struct drm_display_mode *mode)
+static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
+				      const struct drm_display_info *info,
+				      const struct drm_display_mode *mode)
 {
-	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 	struct drm_bridge *next_bridge;
 
 	dev_dbg(hdmi->dev, "xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
@@ -1267,74 +1244,50 @@ static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
 	return drm_mode_validate_size(mode, 0x1fff, 0x1fff);
 }
 
-static struct drm_encoder *mtk_hdmi_conn_best_enc(struct drm_connector *conn)
-{
-	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
-
-	return hdmi->bridge.encoder;
-}
-
-static const struct drm_connector_funcs mtk_hdmi_connector_funcs = {
-	.detect = hdmi_conn_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = hdmi_conn_destroy,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs
-		mtk_hdmi_connector_helper_funcs = {
-	.get_modes = mtk_hdmi_conn_get_modes,
-	.mode_valid = mtk_hdmi_conn_mode_valid,
-	.best_encoder = mtk_hdmi_conn_best_enc,
-};
-
 static void mtk_hdmi_hpd_event(bool hpd, struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 
-	if (hdmi && hdmi->bridge.encoder && hdmi->bridge.encoder->dev)
+	if (hdmi && hdmi->bridge.encoder && hdmi->bridge.encoder->dev) {
+		static enum drm_connector_status status;
+
+		status = mtk_hdmi_detect(hdmi);
 		drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
+		drm_bridge_hpd_notify(&hdmi->bridge, status);
+	}
 }
 
 /*
  * Bridge callbacks
  */
 
+static enum drm_connector_status mtk_hdmi_bridge_detect(struct drm_bridge *bridge)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	return mtk_hdmi_detect(hdmi);
+}
+
+static struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
+					     struct drm_connector *connector)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	return mtk_hdmi_get_edid(hdmi, connector);
+}
+
 static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 				  enum drm_bridge_attach_flags flags)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_ERROR("%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
+			  __func__);
 		return -EINVAL;
 	}
 
-	ret = drm_connector_init_with_ddc(bridge->encoder->dev, &hdmi->conn,
-					  &mtk_hdmi_connector_funcs,
-					  DRM_MODE_CONNECTOR_HDMIA,
-					  hdmi->ddc_adpt);
-	if (ret) {
-		dev_err(hdmi->dev, "Failed to initialize connector: %d\n", ret);
-		return ret;
-	}
-	drm_connector_helper_add(&hdmi->conn, &mtk_hdmi_connector_helper_funcs);
-
-	hdmi->conn.polled = DRM_CONNECTOR_POLL_HPD;
-	hdmi->conn.interlace_allowed = true;
-	hdmi->conn.doublescan_allowed = false;
-
-	ret = drm_connector_attach_encoder(&hdmi->conn,
-						bridge->encoder);
-	if (ret) {
-		dev_err(hdmi->dev,
-			"Failed to attach connector to encoder: %d\n", ret);
-		return ret;
-	}
-
 	if (hdmi->next_bridge) {
 		ret = drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
 					bridge, flags);
@@ -1444,6 +1397,7 @@ static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
+	.mode_valid = mtk_hdmi_bridge_mode_valid,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
@@ -1454,6 +1408,8 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.mode_set = mtk_hdmi_bridge_mode_set,
 	.atomic_pre_enable = mtk_hdmi_bridge_atomic_pre_enable,
 	.atomic_enable = mtk_hdmi_bridge_atomic_enable,
+	.detect = mtk_hdmi_bridge_detect,
+	.get_edid = mtk_hdmi_bridge_get_edid,
 };
 
 static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
@@ -1762,6 +1718,9 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
 	hdmi->bridge.of_node = pdev->dev.of_node;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
+			   | DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	drm_bridge_add(&hdmi->bridge);
 
 	ret = mtk_hdmi_clk_enable_audio(hdmi);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
