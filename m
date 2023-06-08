Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0C9C7EE43
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 10:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzhcPdnfla27Zc1fgVm6wF09Wk50X/GSq+k/6lW0Ty8=; b=3zXSVmXnpaOpPxKdnj16EH4BfX
	SgEUa68iehsCwzrn3Wk/8BVdoqw8hiGXyf/yDa+/dw/2JSwMohzVHLI/H9Pq7SbLoNEYH5ORShlpS
	TzOE1Pp7CV+RflgH/4sJDl6/OJuNFrl82hIGqCmRUx1H0UATSSpeyXuFzfgcqOemKawgdk6Q692H3
	V/IFqOjGNot8EmvhO48SFOkBFE2c0Ji25s+p+2izl9Yaxn7mEOX7GnDaHpr+9+wPST2n5+0rUOqZO
	ubi+tkxp/ZxsIRG/22Ne6ddP9Xqf/akF7oWnQY27P4/GHFJEqm2VgXaV1Ydj5doiMxOsZXc1QaFwb
	nP9+ekkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Ccz-008noh-33;
	Thu, 08 Jun 2023 10:12:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Ccr-008nhC-2T;
	Thu, 08 Jun 2023 10:12:19 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CF2BD6606F15;
	Thu,  8 Jun 2023 11:12:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686219134;
	bh=isK4CGNELBlWRVqlqiMyoiqJNOrso00n3+sFHCSv6Fs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EWE1G3exT9dMqXh46ixdS/QSrqY3n5H1InzjQQgpc5YUD+M8hWBUqsI18WHn0jydQ
	 CP4SiWKfUi/CgDEkVzR4KK5pCBUihcRW3X/XTzr2d8twlEsOcpaNOxcKwMWFKj1or6
	 L/qQ3sGl5UBesg6PJeKq4XjrGB2peba0eX9WQ67NeCcRVs24lkt7vaIlWiPm2gLmz+
	 +Hy5gFOV8VPApBbCqAGIy1zWYjes8KEcFGN7mL9BJvb9QcY/kJiemGE9fSpdfKi0P7
	 ogCIHMzDPr67jcIJioIlA4OKbc9OLMMoeNevRx3KINCADt6Ul6AsMJykwGsg+2GklN
	 ZX52SnAn2o5rw==
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
	kernel@collabora.com
Subject: [PATCH 1/3] drm/mediatek: Use devm_platform_get_and_ioremap_resource()
Date: Thu,  8 Jun 2023 12:12:07 +0200
Message-Id: <20230608101209.126499-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608101209.126499-1-angelogioacchino.delregno@collabora.com>
References: <20230608101209.126499-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_031218_135280_896BEF55 
X-CRM114-Status: GOOD (  10.92  )
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

Instead of open coding calls to platform_get_resource() followed by
devm_ioremap_resource(), perform a single call to the helper
devm_platform_get_and_ioremap_resource().

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c        | 3 +--
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 3 +--
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 3 +--
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 3 +--
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 3 +--
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 3 +--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 3 +--
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 3 +--
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 3 +--
 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 3 +--
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c   | 3 +--
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c   | 3 +--
 12 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index b640bc0559e7..5136aada9023 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -195,8 +195,7 @@ static int mtk_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cec);
 	spin_lock_init(&cec->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	cec->regs = devm_ioremap_resource(dev, res);
+	cec->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(cec->regs)) {
 		ret = PTR_ERR(cec->regs);
 		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 8ddf7a97e583..68485c09ad8f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -117,8 +117,7 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap aal\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 1773379b2439..ae243e7db9b2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -172,8 +172,7 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap ccorr\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index cac9206079e7..4ec37e20ade9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -110,8 +110,7 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap color\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index bd530e603264..cf9262aa4f89 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -276,8 +276,7 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap gamma\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 6428b6203ffe..f1dfa6dfd967 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -250,8 +250,7 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap merge\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8f52cc1f3fba..a0b0a1eb91c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -529,8 +529,7 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap ovl\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index d4df17ad600a..7106c05127b1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -332,8 +332,7 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap rdma\n");
 		return PTR_ERR(priv->regs);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 19e2b042c9d5..fb6f45165e95 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1113,8 +1113,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		goto err_unregister_host;
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->regs = devm_ioremap_resource(dev, regs);
+	dsi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
 	if (IS_ERR(dsi->regs)) {
 		ret = PTR_ERR(dsi->regs);
 		dev_err(dev, "Failed to ioremap memory: %d\n", ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0a8e0a13f516..0c784db9978b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1474,8 +1474,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	}
 	hdmi->sys_regmap = regmap;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(dev, mem);
+	hdmi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
 	if (IS_ERR(hdmi->regs)) {
 		ret = PTR_ERR(hdmi->regs);
 		goto put_device;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 4d39ea0a05ca..dfd1f07b39f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -284,8 +284,7 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 		return PTR_ERR(ddc->clk);
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ddc->regs = devm_ioremap_resource(&pdev->dev, mem);
+	ddc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
 	if (IS_ERR(ddc->regs))
 		return PTR_ERR(ddc->regs);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index e06db6e56b5f..4eac4cbc0764 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -285,8 +285,7 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap rdma\n");
 		return PTR_ERR(priv->regs);
-- 
2.40.1


