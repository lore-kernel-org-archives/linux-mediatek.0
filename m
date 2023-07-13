Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDDAC001DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CSJ+Dhn3nAFW8XXu0/QcT1Re3lHKLxSYf4lYTv8dkg=; b=LAysCKm9UmlnE8pmxFYhR/6JA4
	bPW5agk5Pg0lBahU36jgQRNxr9cdt0QHvoW6EhLjceA3cmoxXH7PYrvh3yEBEOPNKkRLe+bC8xQb0
	uUh62V/cRCiosU0hsEihI4bZDaU5P/9QMb+4dHOGeT9UA2PAXuxk7C21iFR5Q3FdKCiOfB8cAIqxD
	8qpgESzaJvIEUmWH/HVXnkwU+8xu0Mmfot2EcDA3dFoW3fnJuDmk0KakMjyvmPUGuvpAg82ImofPm
	zPGu6voVn7AyNRITzHxRtne0OPfQ8KOdvOglwjD420z5Ouf1KhufLcHEj6/MDN+dX6eWND14Q3rCI
	HcyWpAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsDP-002XLD-0X;
	Thu, 13 Jul 2023 09:02:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsD8-002X3X-2V;
	Thu, 13 Jul 2023 09:02:09 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DE1BA6607053;
	Thu, 13 Jul 2023 10:02:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689238925;
	bh=PYI+JO0rcW6CSRRbNcpz6yRrOkgaYF52PNv7n+IILpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GgTrLr24tt4w4iFcdSNtVdIvgUTd67OCB6msx2c79XtbBOdfx0XiW8Zkr76Hn8AHa
	 kEdqTpiIbrL8dyKWaUzt6R4+Utwa+MGXoRf/89rhMAtt7Bhl9EAv6Luey9FxM9+qxh
	 AqSQ485AkuePxcUVdqXOKKqYWgvQhFbYNK64SGwbajLRGPXB3yjeRmqGdT626BAfPr
	 v6gqCpApDnjKskxUvfTfDc+VTLs7ZYz8W/4K/aNoYSyfjiILAG8QHi0gOcf7fhO3SH
	 ZfMCUTwBakK8yzQn1MB3M/7+w/uuGTyiJEZk3CrHFIFvbfSlDLBHWv7UkWUwq8tUbs
	 Yr5onWlPj3Gxw==
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
	nfraprado@collabora.com
Subject: [PATCH v5 09/10] drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus
Date: Thu, 13 Jul 2023 11:01:51 +0200
Message-Id: <20230713090152.140060-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
References: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_020206_964426_35ADCC10 
X-CRM114-Status: GOOD (  15.41  )
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
this driver, assign the DRM_BRIDGE_OP_{DETECT, EDID, HPD} ops only
if we're probing full DisplayPort and not eDP.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 8668ab17135d..a00bf6693b28 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1915,6 +1915,29 @@ static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
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
+	if (ret)
+		return ret;
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
@@ -2564,6 +2587,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->aux.name = "aux_mtk_dp";
 	mtk_dp->aux.dev = dev;
 	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
+	mtk_dp->aux.wait_hpd_asserted = mtk_dp_wait_hpd_asserted;
 	drm_dp_aux_init(&mtk_dp->aux);
 
 	spin_lock_init(&mtk_dp->irq_thread_lock);
@@ -2596,11 +2620,12 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
 	mtk_dp->bridge.of_node = dev->of_node;
-
-	mtk_dp->bridge.ops =
-		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+		mtk_dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
+				     DRM_BRIDGE_OP_HPD;
+
 	devm_drm_bridge_add(dev, &mtk_dp->bridge);
 
 	mtk_dp->need_debounce = true;
-- 
2.40.1


