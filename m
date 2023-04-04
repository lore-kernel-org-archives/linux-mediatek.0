Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA150C761AF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmWKdqxDsvfexi1yEi6FSub5mgsp34ZQ9W6zOyDfYqA=; b=ub+nHNxiHw6Bl7Wqy7quUuZQNY
	3RPdtkzZR+NdQkjhg0g1RyVgStaYWTiF6cBRMr8ZzWVyzyPhDNf9+BkVkVUFgjYvl1k1ROsp40fBJ
	HcDNDIBATwyk/XR/kxFALgYYySBpYwM95/CaIMsDef7VSlu1fP9zkUw17phimSdtVHiuCoYa1Ebwb
	qdeB8pO6mxidsKa0Y/nBSN5K2FiNwiX8xfp4HLe2nEfvrqvxwvl/b3z1WRayWs5bj9/WX1kUXXFqi
	YmM1zkQFiMowyCIUoeIgsNHcVeZpGBYkXBa7ANEXtBdJr24kM1gtuVliNVF+ShRN5l/on8FZJ7UK3
	E9k/Gp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjeDM-000wdf-2k;
	Tue, 04 Apr 2023 10:48:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjeD1-000wH1-2L;
	Tue, 04 Apr 2023 10:48:18 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 85711660326B;
	Tue,  4 Apr 2023 11:48:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680605293;
	bh=+E8hTN3wC4q97x93aXteKC9CVFfI18J5GBPZJYT7VQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Efpx2sJ5N9N3X1hL/oznHMWpKTzXWKL+gA3TXF9fED37IxvaVpNVe5nHbegXovHDM
	 7P55UpaxPdbpHkV3cbGNVAP00olpklBSGn1m/ZK1LRAw3mC8pjMYBdha3AI2FjF9Oe
	 F5Vw6aUDUi3DxHRsl/dRugvuEAWhjQrl8JZ4qMSXzXa8BCjBAK3L1Ya0Ug7FzjrYHZ
	 zNA7PWcT4/dCCJc5CrDnGj+B372wlqMbZDDS7encx4SKPnYoZIsi9NqaLXGvi4s7ob
	 9zT3NjbsuSweIkQJTvUJxsyAp4WPnvPEMrkzqczPvLLBmVAP42b5elmYCs3yn/YHAv
	 0F5oSJhBxnxJA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v3 9/9] drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
Date: Tue,  4 Apr 2023 12:48:00 +0200
Message-Id: <20230404104800.301150-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_034816_031202_183B0439 
X-CRM114-Status: GOOD (  21.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For the eDP case we can support using aux-bus on MediaTek DP: this
gives us the possibility to declare our panel as generic "panel-edp"
which will automatically configure the timings and available modes
via the EDID that we read from it.

To do this, move the panel parsing at the end of the probe function
so that the hardware is initialized beforehand and also initialize
the DPTX AUX block and power both on as, when we populate the
aux-bus, the panel driver will trigger an EDID read to perform
panel detection.

Last but not least, since now the AUX transfers can happen in the
separated aux-bus, it was necessary to add an exclusion for the
cable_plugged_in check in `mtk_dp_aux_transfer()` and the easiest
way to do this is to simply ignore checking that when the bridge
type is eDP.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 61 ++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index a67143c22024..8109f5b4392b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2022 BayLibre
  */
 
+#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic_helper.h>
@@ -2042,7 +2043,8 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 
 	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
 
-	if (!mtk_dp->train_info.cable_plugged_in) {
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP &&
+	    !mtk_dp->train_info.cable_plugged_in) {
 		ret = -EAGAIN;
 		goto err;
 	}
@@ -2154,6 +2156,11 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 	enable_irq(mtk_dp->irq);
 	mtk_dp_hwirq_enable(mtk_dp, true);
 
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
+		mtk_dp->train_info.cable_plugged_in = true;
+		drm_helper_hpd_irq_event(mtk_dp->drm_dev);
+	}
+
 	return 0;
 
 err_bridge_attach:
@@ -2483,6 +2490,20 @@ static int mtk_dp_register_audio_driver(struct device *dev)
 	return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
 }
 
+static int mtk_dp_edp_link_panel(struct drm_dp_aux *mtk_aux)
+{
+	struct mtk_dp *mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
+	struct device *dev = mtk_aux->dev;
+	struct drm_bridge *panel_aux_bridge;
+
+	panel_aux_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(panel_aux_bridge))
+		return PTR_ERR(panel_aux_bridge);
+
+	mtk_dp->next_bridge = panel_aux_bridge;
+	return 0;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2501,21 +2522,14 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, mtk_dp->irq,
 				     "failed to request dp irq resource\n");
 
-	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(mtk_dp->next_bridge) &&
-	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV)
-		mtk_dp->next_bridge = NULL;
-	else if (IS_ERR(mtk_dp->next_bridge))
-		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
-				     "Failed to get bridge\n");
-
 	ret = mtk_dp_dt_parse(mtk_dp, pdev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to parse dt\n");
 
-	drm_dp_aux_init(&mtk_dp->aux);
 	mtk_dp->aux.name = "aux_mtk_dp";
+	mtk_dp->aux.dev = dev;
 	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
+	drm_dp_aux_init(&mtk_dp->aux);
 
 	spin_lock_init(&mtk_dp->irq_thread_lock);
 
@@ -2571,6 +2585,33 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->need_debounce = true;
 	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
 
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
+		/* Initialize, reset and poweron the DPTX AUX block */
+		mtk_dp_initialize_aux_settings(mtk_dp);
+		mtk_dp_power_enable(mtk_dp);
+
+		/* Power on the panel to allow EDID read from aux-bus */
+		mtk_dp_aux_panel_poweron(mtk_dp, true);
+
+		ret = devm_of_dp_aux_populate_bus(&mtk_dp->aux, NULL);
+
+		/* If the panel is present, detection is done: power off! */
+		mtk_dp_aux_panel_poweron(mtk_dp, false);
+		mtk_dp_power_disable(mtk_dp);
+
+		/* We ignore -ENODEV error, as the panel may not be on aux-bus */
+		if (ret && ret != -ENODEV)
+			return ret;
+
+		/*
+		 * Here we don't ignore any error, as if there's no panel to
+		 * link, eDP is not configured correctly and will be unusable.
+		 */
+		ret = mtk_dp_edp_link_panel(&mtk_dp->aux);
+		if (ret)
+			return ret;
+	}
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-- 
2.40.0


