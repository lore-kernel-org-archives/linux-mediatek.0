Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6DBC7EE2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mD4mU1YwCWh1J2nYcvjfP1+7I2+/g0A6mzKU1yemu/k=; b=uGjMhsfEJIG90yz+X/z/3zWqEr
	C3dB4bt1m0pr0dEz4OEoBITwmam0VuZ4jNXe2cW1lwyHBrpoPGYwEcXoo2LTDTpch2wHcUCJiM+BM
	VH/MeyotWAA7rVEhpmZtX9S4kmWH4HRAxCytvd940yLsut/0MGKy6nBqK/YmWkxnXCkOkuItpH5YP
	flUKejtJn8wIvCO2ck2CU0oIUPobrwbg5UVu8nJWoHykLeA+93HxxQlGP3WIoGLRtl2nz3ARUOWna
	Ln/+znZXFuPInsB969Mhi1rC7S7prczED5ZQrSX7nVOSAndTkjJ0Tu/R7F8D/b8166Cut3541NHr6
	Q3L7fNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q29Wo-00GYSG-30;
	Thu, 25 May 2023 11:53:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q29Wk-00GYPd-0s;
	Thu, 25 May 2023 11:53:07 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 08ECC6605843;
	Thu, 25 May 2023 12:53:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685015584;
	bh=ibbIncxSMJ9OQRBCjzpd8XZcUis5nE1o0tS/1VouNis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hgEY88Cq9TMuHGJnoSIwneEqOlWQXeuUFHyfjBwGMLShM4ZxMaEipCQYdnpX19Kcj
	 atkrdl1BZULCVCGBKYmRpBvr5osFZ4kGKrfi36Ntzkn693I+4ewyBu+Bwz8VVbWyy6
	 OF2Z+O2Ux8N4aLdCk9dUPno9fyPtxy+KTRM8oktjrvMYJGRip8fl4lACWkRAXvNvdq
	 hwqG4jwL0hDJ3W7kjZBMXy6miQqOmTSFTNh0cWKsS+0nwgxiQiFLVWBjH4hNmG6CrY
	 cVnzdaqfPcjE/eEdRRD3wNgFxyGgezAmaXKswLGERw3bGBF0Q+HHDw+/7hMFRfx0DP
	 JlpGK+Cp3n0Aw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/3] phy: mediatek: mipi-dsi: Convert to register clk_hw
Date: Thu, 25 May 2023 13:52:56 +0200
Message-Id: <20230525115258.90091-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
References: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_045306_523230_82E23D10 
X-CRM114-Status: GOOD (  13.48  )
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

Instead of registering a struct clk, directly register clk_hw: this
allows us to cleanup a pointer to struct clk from struct mtk_mipi_tx.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 13 ++++++-------
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h |  1 -
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 526c05a4af5e..362145198ff5 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -36,7 +36,7 @@ static int mtk_mipi_tx_power_on(struct phy *phy)
 	int ret;
 
 	/* Power up core and enable PLL */
-	ret = clk_prepare_enable(mipi_tx->pll);
+	ret = clk_prepare_enable(mipi_tx->pll_hw.clk);
 	if (ret < 0)
 		return ret;
 
@@ -53,7 +53,7 @@ static int mtk_mipi_tx_power_off(struct phy *phy)
 	mipi_tx->driver_data->mipi_tx_disable_signal(phy);
 
 	/* Disable PLL and power down core */
-	clk_disable_unprepare(mipi_tx->pll);
+	clk_disable_unprepare(mipi_tx->pll_hw.clk);
 
 	return 0;
 }
@@ -158,9 +158,9 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 	clk_init.ops = mipi_tx->driver_data->mipi_tx_clk_ops;
 
 	mipi_tx->pll_hw.init = &clk_init;
-	mipi_tx->pll = devm_clk_register(dev, &mipi_tx->pll_hw);
-	if (IS_ERR(mipi_tx->pll))
-		return dev_err_probe(dev, PTR_ERR(mipi_tx->pll), "Failed to register PLL\n");
+	ret = devm_clk_hw_register(dev, &mipi_tx->pll_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register PLL\n");
 
 	phy = devm_phy_create(dev, NULL, &mtk_mipi_tx_ops);
 	if (IS_ERR(phy))
@@ -176,8 +176,7 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 
 	mtk_mipi_tx_get_calibration_datal(mipi_tx);
 
-	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
-				   mipi_tx->pll);
+	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get, &mipi_tx->pll_hw);
 }
 
 static void mtk_mipi_tx_remove(struct platform_device *pdev)
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
index 47b60b1a7226..0250c4a454e7 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
@@ -32,7 +32,6 @@ struct mtk_mipi_tx {
 	u32 rt_code[5];
 	const struct mtk_mipitx_data *driver_data;
 	struct clk_hw pll_hw;
-	struct clk *pll;
 };
 
 struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw);
-- 
2.40.1


