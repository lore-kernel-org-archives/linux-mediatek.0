Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152FCC00528
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA4UKy1DssNweAAXZVvWS9TwcZcxFRlpz/yOVzYQY8s=; b=A0huKkGoYDmmtwKgVSq+FaMZYH
	Z1kPC/wXzuOnNCLovMVGjLlGOjuGKe7BPry8ZVpr8DCCCJZNLL6IQBeCMZ6Cm9hXPDI9T+XHGeofY
	uT5OL4IgJ9YZM1ZqrxB7uCC0sIjKWEztXZ2Edb8sxPEh90wZP6Fp4DnRebsPb3kiowrDji4a/FhZO
	gWxKfO7a+Lf+JBbFwPo+dxJz033HjHEVu4jBtpMJT5qhqNqF71QLJI5lRHUp21o6mUXhvxCeRxtZN
	dJfPNpzUBYcRtpURZw0L2z2wsMP1nLBd5P0q+kZmiNbWhEOSOiCxHcqjPZgbnRrexS6Z8/tEwXXkj
	qbpG0o9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCYE-006c61-1U;
	Tue, 25 Jul 2023 07:33:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXS-006bXO-0Q;
	Tue, 25 Jul 2023 07:33:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3835B6607108;
	Tue, 25 Jul 2023 08:32:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690270376;
	bh=WTQP2Ut7m7LRENxHL7Yy7cyDeXnyPCqZ3fVTyxxJDo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=brf3em/+8qHEUZnO+7xBKOQ8lLw9REwxLD8W0JlNCBLmI7RGMAgpPMadddg5rnVH3
	 lEijpMoVt66SrmaCx333hlN7rnrYRj/UFzCZP7FpEpMh5Yq1j9u5JJQi9FuFghSctg
	 kdjVMKKOriUtOhrEXAgknDLJKMvQm1Fo+QDYtVrJ/Q4YKmDWuukmZjYcyq4oWMwwMv
	 2x/ygIsgllnbO+8h+4AVyFVUXSvPszBxNmwMcuD1jse3xdmmAqjnFB5gxfOW8PxjTK
	 cNUYiZ44xV3T6R/lpCBBAA7rW3Cu7Fu/DLG8QQxZAKP9JjUyZdAAWn0p2MBDD5cdhX
	 q2Fmnc/id7Djw==
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
	wenst@chromium.org,
	nfraprado@collabora.com,
	ehristev@collabora.com,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 11/11] drm/mediatek: dp: Don't register HPD interrupt handler for eDP case
Date: Tue, 25 Jul 2023 09:32:34 +0200
Message-ID: <20230725073234.55892-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_003258_453157_64C999E1 
X-CRM114-Status: GOOD (  18.18  )
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

The interrupt handler for HPD is useful only if a display is actually
supposed to be hotpluggable, as that manages the machinery to perform
cable (un)plug detection, debouncing and setup for re-training.

Since eDP panels are not supposed to be hotpluggable we can avoid
using the HPD interrupts altogether and rely on HPD polling only
for the suspend/resume case, saving us some spinlocking action and
the overhead of interrupts firing at every suspend/resume cycle,
achieving a faster (even if just slightly) display resume.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 73 +++++++++++++++++++------------
 1 file changed, 46 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index ba750d463e41..c06fcc7318e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2182,9 +2182,11 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 
 	mtk_dp->drm_dev = bridge->dev;
 
-	irq_clear_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
-	enable_irq(mtk_dp->irq);
-	mtk_dp_hwirq_enable(mtk_dp, true);
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
+		irq_clear_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
+		enable_irq(mtk_dp->irq);
+		mtk_dp_hwirq_enable(mtk_dp, true);
+	}
 
 	return 0;
 
@@ -2199,8 +2201,10 @@ static void mtk_dp_bridge_detach(struct drm_bridge *bridge)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
-	mtk_dp_hwirq_enable(mtk_dp, false);
-	disable_irq(mtk_dp->irq);
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
+		mtk_dp_hwirq_enable(mtk_dp, false);
+		disable_irq(mtk_dp->irq);
+	}
 	mtk_dp->drm_dev = NULL;
 	mtk_dp_poweroff(mtk_dp);
 	drm_dp_aux_unregister(&mtk_dp->aux);
@@ -2579,32 +2583,44 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->dev = dev;
 	mtk_dp->data = (struct mtk_dp_data *)of_device_get_match_data(dev);
 
-	mtk_dp->irq = platform_get_irq(pdev, 0);
-	if (mtk_dp->irq < 0)
-		return dev_err_probe(dev, mtk_dp->irq,
-				     "failed to request dp irq resource\n");
-
 	ret = mtk_dp_dt_parse(mtk_dp, pdev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to parse dt\n");
 
+	/*
+	 * Request the interrupt and install service routine only if we are
+	 * on full DisplayPort.
+	 * For eDP, polling the HPD instead is more convenient because we
+	 * don't expect any (un)plug events during runtime, hence we can
+	 * avoid some locking.
+	 */
+	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP) {
+		mtk_dp->irq = platform_get_irq(pdev, 0);
+		if (mtk_dp->irq < 0)
+			return dev_err_probe(dev, mtk_dp->irq,
+					     "failed to request dp irq resource\n");
+
+		spin_lock_init(&mtk_dp->irq_thread_lock);
+
+		irq_set_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
+		ret = devm_request_threaded_irq(dev, mtk_dp->irq, mtk_dp_hpd_event,
+						mtk_dp_hpd_event_thread,
+						IRQ_TYPE_LEVEL_HIGH, dev_name(dev),
+						mtk_dp);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to request mediatek dptx irq\n");
+
+		mtk_dp->need_debounce = true;
+		timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
+	}
+
 	mtk_dp->aux.name = "aux_mtk_dp";
 	mtk_dp->aux.dev = dev;
 	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
 	mtk_dp->aux.wait_hpd_asserted = mtk_dp_wait_hpd_asserted;
 	drm_dp_aux_init(&mtk_dp->aux);
 
-	spin_lock_init(&mtk_dp->irq_thread_lock);
-
-	irq_set_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
-	ret = devm_request_threaded_irq(dev, mtk_dp->irq, mtk_dp_hpd_event,
-					mtk_dp_hpd_event_thread,
-					IRQ_TYPE_LEVEL_HIGH, dev_name(dev),
-					mtk_dp);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to request mediatek dptx irq\n");
-
 	platform_set_drvdata(pdev, mtk_dp);
 
 	if (mtk_dp->data->audio_supported) {
@@ -2626,9 +2642,6 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
-	mtk_dp->need_debounce = true;
-	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
-
 	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
 		/*
 		 * Set the data lanes to idle in case the bootloader didn't
@@ -2639,6 +2652,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		mtk_dp_initialize_aux_settings(mtk_dp);
 		mtk_dp_power_enable(mtk_dp);
 
+		/* Disable HW interrupts: we don't need any for eDP */
+		mtk_dp_hwirq_enable(mtk_dp, false);
+
 		/*
 		 * Power on the AUX to allow reading the EDID from aux-bus:
 		 * please note that it is necessary to call power off in the
@@ -2684,7 +2700,8 @@ static int mtk_dp_remove(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	del_timer_sync(&mtk_dp->debounce_timer);
+	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP)
+		del_timer_sync(&mtk_dp->debounce_timer);
 	platform_device_unregister(mtk_dp->phy_dev);
 	if (mtk_dp->audio_pdev)
 		platform_device_unregister(mtk_dp->audio_pdev);
@@ -2698,7 +2715,8 @@ static int mtk_dp_suspend(struct device *dev)
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
 
 	mtk_dp_power_disable(mtk_dp);
-	mtk_dp_hwirq_enable(mtk_dp, false);
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+		mtk_dp_hwirq_enable(mtk_dp, false);
 	pm_runtime_put_sync(dev);
 
 	return 0;
@@ -2710,7 +2728,8 @@ static int mtk_dp_resume(struct device *dev)
 
 	pm_runtime_get_sync(dev);
 	mtk_dp_init_port(mtk_dp);
-	mtk_dp_hwirq_enable(mtk_dp, true);
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+		mtk_dp_hwirq_enable(mtk_dp, true);
 	mtk_dp_power_enable(mtk_dp);
 
 	return 0;
-- 
2.41.0


