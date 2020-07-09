Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B3FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 10:55:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D0B205CB
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 10:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j7seCI2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D0B205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ktdgI86cVugdKcBiYH3qu8+1VhB/o2eF/5PAIGiRAW8=; b=j7seCI2Lw2d8joMApMrGcAdYi
	xcQuWR+VzXUv2v1/eIcHh0k1s/V4ptFEkAxIG+rRU7lWOmkxlW64Gbs2FRJot8YnjPb5GOizzKMZm
	7XArKonMgTyoPC64+MrhcOvwyI+wAmI6nB83JcbyWAeiEgbwYJsQCjvRoKCe6VBYHyJqjGcK6QQ8s
	XrtG//nthK4ACzlVOjce47fwQHkDOszU1h1OnCICF6zugLRMx6ZQfkW7y4JjhZMsvsDOEH68Jb4JI
	Gh9en5bwDgxk4/9ck52uwiOYC3dB6n7jfqqBTHPPpIvo5GN87FAEQdB2OOb1A6jITKfcb9LN7gLSG
	6tEv0dLXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtUD8-0002lL-CB; Thu, 09 Jul 2020 10:55:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtUCu-0002fT-En; Thu, 09 Jul 2020 10:55:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A03852A6391
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org,
	Collabora Kernel ML <kernel@collabora.com>
Subject: [PATCH v2 2/2] drm/mediatek: mtk_dpi: Convert to bridge driver
Date: Thu,  9 Jul 2020 12:55:01 +0200
Message-Id: <20200709105501.1465636-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709105501.1465636-1-enric.balletbo@collabora.com>
References: <20200709105501.1465636-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_065512_715470_52A78F66 
X-CRM114-Status: GOOD (  14.79  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, laurent.pinchart@ideasonboard.com,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org, matthias.bgg@gmail.com,
 sam@ravnborg.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert mtk_dpi to a bridge driver with built-in encoder support for
compatibility with existing component drivers.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---

Changes in v2:
- Maintain error message when attach to bridge fails. (Boris)

 drivers/gpu/drm/mediatek/mtk_dpi.c | 71 ++++++++++++++++++------------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index f7372dbdac0e..589ef33a1780 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -64,6 +64,7 @@ enum mtk_dpi_out_color_format {
 struct mtk_dpi {
 	struct mtk_ddp_comp ddp_comp;
 	struct drm_encoder encoder;
+	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 	void __iomem *regs;
 	struct device *dev;
@@ -83,9 +84,9 @@ struct mtk_dpi {
 	int refcount;
 };
 
-static inline struct mtk_dpi *mtk_dpi_from_encoder(struct drm_encoder *e)
+static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
 {
-	return container_of(e, struct mtk_dpi, encoder);
+	return container_of(b, struct mtk_dpi, bridge);
 }
 
 enum mtk_dpi_polarity {
@@ -521,50 +522,53 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	return 0;
 }
 
-static bool mtk_dpi_encoder_mode_fixup(struct drm_encoder *encoder,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
+static void mtk_dpi_encoder_destroy(struct drm_encoder *encoder)
 {
-	return true;
+	drm_encoder_cleanup(encoder);
 }
 
-static void mtk_dpi_encoder_mode_set(struct drm_encoder *encoder,
-				     struct drm_display_mode *mode,
-				     struct drm_display_mode *adjusted_mode)
+static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
+	.destroy = mtk_dpi_encoder_destroy,
+};
+
+static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
 {
-	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, dpi->next_bridge,
+				 &dpi->bridge, flags);
+}
+
+static void mtk_dpi_bridge_mode_set(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
 	drm_mode_copy(&dpi->mode, adjusted_mode);
 }
 
-static void mtk_dpi_encoder_disable(struct drm_encoder *encoder)
+static void mtk_dpi_bridge_disable(struct drm_bridge *bridge)
 {
-	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
 	mtk_dpi_power_off(dpi);
 }
 
-static void mtk_dpi_encoder_enable(struct drm_encoder *encoder)
+static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
 {
-	struct mtk_dpi *dpi = mtk_dpi_from_encoder(encoder);
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
 	mtk_dpi_power_on(dpi);
 	mtk_dpi_set_display_mode(dpi, &dpi->mode);
 }
 
-static int mtk_dpi_atomic_check(struct drm_encoder *encoder,
-				struct drm_crtc_state *crtc_state,
-				struct drm_connector_state *conn_state)
-{
-	return 0;
-}
-
-static const struct drm_encoder_helper_funcs mtk_dpi_encoder_helper_funcs = {
-	.mode_fixup = mtk_dpi_encoder_mode_fixup,
-	.mode_set = mtk_dpi_encoder_mode_set,
-	.disable = mtk_dpi_encoder_disable,
-	.enable = mtk_dpi_encoder_enable,
-	.atomic_check = mtk_dpi_atomic_check,
+static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
+	.attach = mtk_dpi_bridge_attach,
+	.mode_set = mtk_dpi_bridge_mode_set,
+	.disable = mtk_dpi_bridge_disable,
+	.enable = mtk_dpi_bridge_enable,
 };
 
 static void mtk_dpi_start(struct mtk_ddp_comp *comp)
@@ -605,12 +609,11 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
 		goto err_unregister;
 	}
-	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);
 
 	/* Currently DPI0 is fixed to be driven by OVL1 */
 	dpi->encoder.possible_crtcs = BIT(1);
 
-	ret = drm_bridge_attach(&dpi->encoder, dpi->next_bridge, NULL, 0);
+	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to attach bridge: %d\n", ret);
 		goto err_cleanup;
@@ -791,8 +794,15 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dpi);
 
+	dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
+	dpi->bridge.of_node = dev->of_node;
+	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
+
+	drm_bridge_add(&dpi->bridge);
+
 	ret = component_add(dev, &mtk_dpi_component_ops);
 	if (ret) {
+		drm_bridge_remove(&dpi->bridge);
 		dev_err(dev, "Failed to add component: %d\n", ret);
 		return ret;
 	}
@@ -802,7 +812,10 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 static int mtk_dpi_remove(struct platform_device *pdev)
 {
+	struct mtk_dpi *dpi = platform_get_drvdata(pdev);
+
 	component_del(&pdev->dev, &mtk_dpi_component_ops);
+	drm_bridge_remove(&dpi->bridge);
 
 	return 0;
 }
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
