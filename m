Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5EEC4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 12:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWluXsY6lb3C1Eah26IIF9w71j/OC+zMjQHqdih8wLI=; b=cNySg/KRUpNcXk
	CmTvxORs6swv8r31PQGnu87jHJtkFEyDcWCTYP/uhBp+T0jmcNZw0Jtx1TGCEOyeUWBXYCp9Uet6q
	4BTDz4wNyWiX2ovlvUmVVZL9wLDP8dFXcHCVhgces5FzV4jSZ5enJHbeH+gc8zSWH2Kf1zFez0r77
	oMz6s28VB/UktnAChInDFxdSgMm6eChajpY2ZR9DhplW+g2lapt6uvmQ8cVfZf6B+GJ3Ylh2owdQ8
	kHm1f50KrGJzhSa5C45SrEq/m+GbgW4boi5PgpWobIylPHFlP6Z8z+HwMWzgM0KTwlaldhMnYIKWl
	r44CsBY6/7Q6YNqpBEng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXKFT-00000007UKa-3pfI;
	Tue, 06 Feb 2024 12:08:23 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXKF5-00000007Tvm-3bmg;
	Tue, 06 Feb 2024 12:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707221278;
	bh=KQ+9GSduM0u+BUTeEpV9c56+NpNaqgdR1oTlNOSuCF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nt24JE8oU7BA+nXkjDzVtZvgXIrhXRzpqMjiUUskZAFWbXbS9voNSX3dSltaGYYot
	 tKSp2Wq48Zer+Cge6JN7JWbf4WEd2N4KyKHHMpxD8IVaq5izcTVPBb6FL0UJhcqyxX
	 qtQZB+1K+nd6T9mRM5tSwU5lvDmdae0cJC9ziupTMRT4WTF3rVUK/yDEAfOEf+sn1f
	 t6tIA8kRRZQcidZp7/u/s53dsNj5iHwkWEK26DwR+TJwY9mnehydz+OaP7A3SbqotP
	 NnuueyFnYtukJRNm2AirHJzjShBRBU++LqjmP4fDHpTGuGx+EfNB7SBMAHqdzQFszY
	 TZ4mkQc5q2yFQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D94B03782083;
	Tue,  6 Feb 2024 12:07:57 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v4 6/9] drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY
Date: Tue,  6 Feb 2024 13:07:45 +0100
Message-ID: <20240206120748.136610-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_040800_080471_3C3122AF 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Registering the dsi host with its ops before getting dsi->regs is
simply wrong: even though there's nothing (for now) asynchronously
calling those ops before the end of the probe function, installing
ops that are using iospace(s) and clocks before even initializing
those is too fragile.

Register the DSI host after getting clocks, iospace and PHY.
This wil also allow to simplify the error paths in a later commit.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5e383ca00ba8..6ee01626d55c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1114,14 +1114,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
-	dsi->host.ops = &mtk_dsi_ops;
-	dsi->host.dev = dev;
-	ret = mipi_dsi_host_register(&dsi->host);
-	if (ret < 0) {
-		dev_err(dev, "failed to register DSI host: %d\n", ret);
-		return ret;
-	}
-
 	dsi->driver_data = of_device_get_match_data(dev);
 
 	dsi->engine_clk = devm_clk_get(dev, "engine");
@@ -1130,7 +1122,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get engine clock: %d\n", ret);
-		goto err_unregister_host;
+		return ret;
 	}
 
 	dsi->digital_clk = devm_clk_get(dev, "digital");
@@ -1139,14 +1131,14 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get digital clock: %d\n", ret);
-		goto err_unregister_host;
+		return ret;
 	}
 
 	dsi->hs_clk = devm_clk_get(dev, "hs");
 	if (IS_ERR(dsi->hs_clk)) {
 		ret = PTR_ERR(dsi->hs_clk);
 		dev_err(dev, "Failed to get hs clock: %d\n", ret);
-		goto err_unregister_host;
+		return ret;
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1154,20 +1146,28 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->regs)) {
 		ret = PTR_ERR(dsi->regs);
 		dev_err(dev, "Failed to ioremap memory: %d\n", ret);
-		goto err_unregister_host;
+		return ret;
 	}
 
 	dsi->phy = devm_phy_get(dev, "dphy");
 	if (IS_ERR(dsi->phy)) {
 		ret = PTR_ERR(dsi->phy);
 		dev_err(dev, "Failed to get MIPI-DPHY: %d\n", ret);
-		goto err_unregister_host;
+		return ret;
 	}
 
 	irq_num = platform_get_irq(pdev, 0);
 	if (irq_num < 0) {
 		ret = irq_num;
-		goto err_unregister_host;
+		return ret;
+	}
+
+	dsi->host.ops = &mtk_dsi_ops;
+	dsi->host.dev = dev;
+	ret = mipi_dsi_host_register(&dsi->host);
+	if (ret < 0) {
+		dev_err(dev, "failed to register DSI host: %d\n", ret);
+		return ret;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
-- 
2.43.0


