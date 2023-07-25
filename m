Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C781C0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5isZeeGTPUf167ZCXNx3PDs99qa/SwlFpoAH665woeE=; b=xhIMngcf0Mm2RjfKo2nCnhnijR
	mE19Fow90aGEKfirqRbArTPmZShZLcYg/nb2V502SjioGjWHbYMF0j9ZOUZq+0nwqR/tPhK7UB21o
	ANBCn5VZqfBMQFsqZ5GxvVSP2DZpvTnWBbaFNuDQICdO0q+v89nwojWhASTW+bpr6Bzbi2KOCsmfP
	ilpxP8nDKWw1vG2OPmA15LFxXNmG8FTUSnS0V/Hvi+mtrZN8vHTPMC8oGmuhTBXOZ4pmUS1PPJZ/3
	lNOGbnjCJcY+PIXBcJUrvOWNXoZoRuD4SAuokoGSXNJayjAgI26CgCJ87BIPCPq+u00g3oL4xaika
	UXCmCo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCYC-006c4j-2M;
	Tue, 25 Jul 2023 07:33:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXR-006bWI-0o;
	Tue, 25 Jul 2023 07:32:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 48FC3660710D;
	Tue, 25 Jul 2023 08:32:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690270376;
	bh=zbxuTv3CWzetmAnMa1hRCpH373fWIO5UX1zWN77uZdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=enS+up93oXgqqysaBneOCCcmL+VkZ8pLkWEwPpPeqAGzk4wTy/kWr+s+MvV5AzFDV
	 Afpod2etJ3vZ+qoLErGPcdk00YWsexhEFApMjbm9J2TwuzYtpsqlv4WdzeXciQrRAK
	 Jzom0MyzHcMbk+l/MtY+En6HG4mbxheRKQ8VWSgFaHUvKWO2Zyxk+1Vmqbd4syF9R6
	 HB3RdgWRkNUuOi1jvYruDLSW5VaMnt2Wa06mvMbLwC6a1gCvg/Afph5tya2YQbKAqm
	 EMQ4Vf8UGuBBG1xlDjOM8gxZlq/O4cg6eAJrF04xBGnfQICrAxs5XoVs/j817W4WWV
	 H+ZoC4eaF22hQ==
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
	Alexandre Mergnat <amergnat@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v7 10/11] drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus
Date: Tue, 25 Jul 2023 09:32:33 +0200
Message-ID: <20230725073234.55892-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_003257_610233_61679E39 
X-CRM114-Status: GOOD (  17.55  )
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

In order to support usecases in which the panel regulator can be
switched on and off to save power, and usecases in which the panel
regulator is off at boot, add a .wait_hpd_asserted() callback for
the AUX bus: this will make sure to wait until the panel is fully
ready after power-on before trying to communicate with it.

Also, parse the eDP display capabilities in that callback, so that
we can also avoid using the .get_edid() callback from this bridge.

Since at this point the hpd machinery is performed in the new hpd
callback and the detection and edid reading are done outside of
this driver, assign the DRM_BRIDGE_OP_{DETECT, EDID, HPD} ops and
register the bridge unconditionally at probe time only if we are
probing full DisplayPort and not eDP while, for the latter, we
register the bridge in the .done_probing() callback and only if
the panel was found and triggered HPD.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 45 ++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 18c944bfc7ce..ba750d463e41 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1920,6 +1920,31 @@ static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
 	return IRQ_WAKE_THREAD;
 }
 
+static int mtk_dp_wait_hpd_asserted(struct drm_dp_aux *mtk_aux, unsigned long wait_us)
+{
+	struct mtk_dp *mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
+	u32 val;
+	int ret;
+
+	ret = regmap_read_poll_timeout(mtk_dp->regs, MTK_DP_TRANS_P0_3414,
+				       val, !!(val & HPD_DB_DP_TRANS_P0_MASK),
+				       wait_us / 100, wait_us);
+	if (ret) {
+		mtk_dp->train_info.cable_plugged_in = false;
+		return ret;
+	}
+
+	mtk_dp->train_info.cable_plugged_in = true;
+
+	ret = mtk_dp_parse_capabilities(mtk_dp);
+	if (ret) {
+		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 			   struct platform_device *pdev)
 {
@@ -2532,6 +2557,12 @@ static int mtk_dp_edp_link_panel(struct drm_dp_aux *mtk_aux)
 		mtk_dp->next_bridge = NULL;
 		return ret;
 	}
+
+	/* For eDP, we add the bridge only if the panel was found */
+	ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -2560,6 +2591,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->aux.name = "aux_mtk_dp";
 	mtk_dp->aux.dev = dev;
 	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
+	mtk_dp->aux.wait_hpd_asserted = mtk_dp_wait_hpd_asserted;
 	drm_dp_aux_init(&mtk_dp->aux);
 
 	spin_lock_init(&mtk_dp->irq_thread_lock);
@@ -2592,15 +2624,8 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
 	mtk_dp->bridge.of_node = dev->of_node;
-
-	mtk_dp->bridge.ops =
-		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
-	ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to add bridge\n");
-
 	mtk_dp->need_debounce = true;
 	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
 
@@ -2639,6 +2664,12 @@ static int mtk_dp_probe(struct platform_device *pdev)
 				return ret;
 			}
 		}
+	} else {
+		mtk_dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
+				     DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
+		ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to add bridge\n");
 	}
 
 	pm_runtime_enable(dev);
-- 
2.41.0


