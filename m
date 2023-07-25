Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522B5C0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaeUmoiGp4LYFaMQVcLH2mtRr62KoS+siquFFdTkrAU=; b=m+xFmQZJNxm35wBhO9OwSlM/ef
	G/6bXTGbUT0OYQb8EJTR10WHYynGKXw7OtsLxiq05A32VwapVA2mkPFWabMJ+JsJQPPCPypHFX98r
	rkbCEDJWzu49+cJu706nLPJPAaTqvzCT26ZnG+ONR8gWL3XYtytfx+E54cBe0QjzU4xXR62YYrK9a
	TFCtUxo3nkXM4DAxeo29L8w84jkC0lw9M3+/28zxMKczP4qhdeO0CO5SpRqMbkzVYx6uNuI0nWMgD
	wocMjX5/ThwDCQByuBui+ci57sdWiko1rNYDa039pU3xe07VfFRSBv3oUBRcJbFFK5V0oJSucXbpe
	/wY8Ggew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCY9-006c1V-0M;
	Tue, 25 Jul 2023 07:33:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXP-006bUK-14;
	Tue, 25 Jul 2023 07:32:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0F5526607114;
	Tue, 25 Jul 2023 08:32:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690270374;
	bh=DR/G12pe4yglh3RcpLL0KLQLNBPShOVl9PCUQ7J4/Ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ek3/7nOuynkGeshEIIpPIWjcnB7Gyvspt1najiSjv7jbsHZkmWg32O6pMn3eAYa45
	 0kjKXhuSton6Pblpu4M0Xn2XV1hjR7lRNGx5okExSn6bxjcyenGwdwKWLg5YVi4hJ8
	 E+sy8oJ8YYyoWxD86nda6/VkTJAJVzAUfcUKnLFtQ5zlhb45D9RAfBjITnMlLfr+HW
	 d69sz+N+Vo55k64SmbMZrpvOeKFuUrBu7+M2f76HW7YTszA5vC/rJ4pvhm5HRSkB85
	 3fdtsN2V0Fky8cY43mARZix+RU46FIr4B9bMmWLfyC81NcGGjwFB4LWbx5xvwWTd6J
	 dSxRTfvWnU1dA==
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
Subject: [PATCH v7 08/11] drm/mediatek: dp: Move PHY registration to new function
Date: Tue, 25 Jul 2023 09:32:31 +0200
Message-ID: <20230725073234.55892-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_003255_511969_CCA90622 
X-CRM114-Status: GOOD (  13.30  )
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

In preparation for adding support for eDP, move the PHY registration
code to a new mtk_dp_register_phy() function for better readability.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 43 +++++++++++++++++++------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index c1d1a882f1db..1b4219e6a00b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2478,6 +2478,29 @@ static int mtk_dp_register_audio_driver(struct device *dev)
 	return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
 }
 
+static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
+{
+	struct device *dev = mtk_dp->dev;
+
+	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
+							PLATFORM_DEVID_AUTO,
+							&mtk_dp->regs,
+							sizeof(struct regmap *));
+	if (IS_ERR(mtk_dp->phy_dev))
+		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
+				     "Failed to create device mediatek-dp-phy\n");
+
+	mtk_dp_get_calibration_data(mtk_dp);
+
+	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
+	if (IS_ERR(mtk_dp->phy)) {
+		platform_device_unregister(mtk_dp->phy_dev);
+		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy), "Failed to get phy\n");
+	}
+
+	return 0;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2536,23 +2559,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		}
 	}
 
-	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
-							PLATFORM_DEVID_AUTO,
-							&mtk_dp->regs,
-							sizeof(struct regmap *));
-	if (IS_ERR(mtk_dp->phy_dev))
-		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
-				     "Failed to create device mediatek-dp-phy\n");
-
-	mtk_dp_get_calibration_data(mtk_dp);
-
-	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
-
-	if (IS_ERR(mtk_dp->phy)) {
-		platform_device_unregister(mtk_dp->phy_dev);
-		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy),
-				     "Failed to get phy\n");
-	}
+	ret = mtk_dp_register_phy(mtk_dp);
+	if (ret)
+		return ret;
 
 	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
 	mtk_dp->bridge.of_node = dev->of_node;
-- 
2.41.0


