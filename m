Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2796FC54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZgx+TVb6FKrnit7peM9MZmUvtQbWcxRIqLBTjYg+54=; b=WXmcxMZEnisb/cIAWPQn7/AGct
	5ktBO1wNNMTFm8a1e9DDr6ARKatZsCshJrVcT974jylEJSnA/6JkhjUN72omPNoKdBA4hzjQeLxih
	6fuyLN7BOv7t/7DzXLSk+UfBoRBlzXRVMsUEMCydM+oLUOWlzni2wXbxgYBSD3W28IKf0Z2h5z9xI
	K+za9xQWOCEgAh5HUEY4ctsd9zxuu3XPuq2KLYnhay5abU7TPi9gtsPVRwjHXkVKADk7qsOd28Rs4
	obruricIVVe2XZN2jTqMZmVNiM92bHMuRvHBS7enNumk/Z6LVJDAFWNua3avk+3UVkIJK4ejC4XMp
	d0gQyn2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGID0-0029xd-Jn; Fri, 13 Jan 2023 11:26:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHu2-0020dX-3a; Fri, 13 Jan 2023 11:07:25 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F3946602DD5;
	Fri, 13 Jan 2023 11:07:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673608036;
	bh=VFCn4Szik6kD72u0B1YdwGvIiJWbiMZBeom3Vl/uyao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jEF7kt2otfep8hTef9U3XoyyaAbjz86+heJdrVYlM4TcgTSc3jtHXpkS0DPvjfVVL
	 sWF97LdiCBspeOXELdgxbIdVToDNYjwx0ExSmCG15X192xcY2rLd4ojAbo0unkgl8Z
	 zAyidIAkyoE7VWcZaEnVI33bk9/E3wirScLti+ONejanVWVYC6NGofb059Dhhak3Tj
	 0NNikQfsIg37U9YK0K5/hve6R64xJoIiDcBPLzyDsWSHqg+Yd25ZaS4AcxuCHVE5L7
	 xx6kN1opvtnXsLCmrfkR+5iyF6zrL1KmdIywRnIX3Ff/VBJwraZhwjfRgAPBlAvaEj
	 h9nGia8ZMIGnw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	fparent@baylibre.com,
	chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com,
	y.oudjana@protonmail.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org,
	daniel@makrotopia.org,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	pablo.sun@mediatek.com,
	msp@baylibre.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 11/23] clk: mediatek: Switch to mtk_clk_simple_probe() where possible
Date: Fri, 13 Jan 2023 12:06:04 +0100
Message-Id: <20230113110616.111001-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
References: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_030718_519613_A62B5F44 
X-CRM114-Status: GOOD (  19.31  )
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

mtk_clk_simple_probe() is a function that registers mtk gate clocks
and, if reset data is present, a reset controller and across all of
the MTK clock drivers, such a function is duplicated many times:
switch to the common mtk_clk_simple_probe() function for all of the
clock drivers that are registering as platform drivers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt2701-aud.c   | 31 ++++----
 drivers/clk/mediatek/clk-mt2701-eth.c   | 36 +++------
 drivers/clk/mediatek/clk-mt2701-g3d.c   | 56 +++-----------
 drivers/clk/mediatek/clk-mt2701-hif.c   | 38 +++-------
 drivers/clk/mediatek/clk-mt2712.c       | 83 ++++++++-------------
 drivers/clk/mediatek/clk-mt6779.c       | 42 ++++++-----
 drivers/clk/mediatek/clk-mt7622-aud.c   | 54 +++++---------
 drivers/clk/mediatek/clk-mt7622-eth.c   | 82 ++++-----------------
 drivers/clk/mediatek/clk-mt7622-hif.c   | 85 ++++-----------------
 drivers/clk/mediatek/clk-mt7629-hif.c   | 85 ++++-----------------
 drivers/clk/mediatek/clk-mt8183-audio.c | 27 ++++---
 drivers/clk/mediatek/clk-mt8183.c       | 75 ++++++++-----------
 drivers/clk/mediatek/clk-mt8192-aud.c   | 31 ++++----
 drivers/clk/mediatek/clk-mt8192.c       | 98 ++++++++-----------------
 14 files changed, 263 insertions(+), 560 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701-aud.c b/drivers/clk/mediatek/clk-mt2701-aud.c
index 263c7075bbcb..1a32d8b7db84 100644
--- a/drivers/clk/mediatek/clk-mt2701-aud.c
+++ b/drivers/clk/mediatek/clk-mt2701-aud.c
@@ -76,6 +76,7 @@ static const struct mtk_gate_regs audio3_cg_regs = {
 };
 
 static const struct mtk_gate audio_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "aud_dummy"),
 	/* AUDIO0 */
 	GATE_AUDIO0(CLK_AUD_AFE, "audio_afe", "aud_intbus_sel", 2),
 	GATE_AUDIO0(CLK_AUD_HDMI, "audio_hdmi", "audpll_sel", 20),
@@ -138,29 +139,27 @@ static const struct mtk_gate audio_clks[] = {
 	GATE_AUDIO3(CLK_AUD_MEM_ASRC5, "audio_mem_asrc5", "asm_h_sel", 14),
 };
 
+static const struct mtk_clk_desc audio_desc = {
+	.clks = audio_clks,
+	.num_clks = ARRAY_SIZE(audio_clks),
+};
+
 static const struct of_device_id of_match_clk_mt2701_aud[] = {
-	{ .compatible = "mediatek,mt2701-audsys", },
-	{}
+	{ .compatible = "mediatek,mt2701-audsys", .data = &audio_desc },
+	{ /* sentinel */ }
 };
 
 static int clk_mt2701_aud_probe(struct platform_device *pdev)
 {
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
 	int r;
 
-	clk_data = mtk_alloc_clk_data(CLK_AUD_NR);
-
-	mtk_clk_register_gates(&pdev->dev, node, audio_clks,
-			       ARRAY_SIZE(audio_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	r = mtk_clk_simple_probe(pdev);
 	if (r) {
 		dev_err(&pdev->dev,
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
-		goto err_clk_provider;
+		return r;
 	}
 
 	r = devm_of_platform_populate(&pdev->dev);
@@ -170,13 +169,19 @@ static int clk_mt2701_aud_probe(struct platform_device *pdev)
 	return 0;
 
 err_plat_populate:
-	of_clk_del_provider(node);
-err_clk_provider:
+	mtk_clk_simple_remove(pdev);
 	return r;
 }
 
+static int clk_mt2701_aud_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+	return mtk_clk_simple_remove(pdev);
+}
+
 static struct platform_driver clk_mt2701_aud_drv = {
 	.probe = clk_mt2701_aud_probe,
+	.remove = clk_mt2701_aud_remove,
 	.driver = {
 		.name = "clk-mt2701-aud",
 		.of_match_table = of_match_clk_mt2701_aud,
diff --git a/drivers/clk/mediatek/clk-mt2701-eth.c b/drivers/clk/mediatek/clk-mt2701-eth.c
index 844902bd1ffa..f3cb78e7f6e9 100644
--- a/drivers/clk/mediatek/clk-mt2701-eth.c
+++ b/drivers/clk/mediatek/clk-mt2701-eth.c
@@ -26,6 +26,7 @@ static const struct mtk_gate_regs eth_cg_regs = {
 	}
 
 static const struct mtk_gate eth_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "eth_dummy"),
 	GATE_ETH(CLK_ETHSYS_HSDMA, "hsdma_clk", "ethif_sel", 5),
 	GATE_ETH(CLK_ETHSYS_ESW, "esw_clk", "ethpll_500m_ck", 6),
 	GATE_ETH(CLK_ETHSYS_GP2, "gp2_clk", "trgpll", 7),
@@ -44,35 +45,20 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
-static const struct of_device_id of_match_clk_mt2701_eth[] = {
-	{ .compatible = "mediatek,mt2701-ethsys", },
-	{}
+static const struct mtk_clk_desc eth_desc = {
+	.clks = eth_clks,
+	.num_clks = ARRAY_SIZE(eth_clks),
+	.rst_desc = &clk_rst_desc,
 };
 
-static int clk_mt2701_eth_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_ETHSYS_NR);
-
-	mtk_clk_register_gates(&pdev->dev, node, eth_clks,
-			       ARRAY_SIZE(eth_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-
-	return r;
-}
+static const struct of_device_id of_match_clk_mt2701_eth[] = {
+	{ .compatible = "mediatek,mt2701-ethsys", .data = &eth_desc },
+	{ /* sentinel */ }
+};
 
 static struct platform_driver clk_mt2701_eth_drv = {
-	.probe = clk_mt2701_eth_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-eth",
 		.of_match_table = of_match_clk_mt2701_eth,
diff --git a/drivers/clk/mediatek/clk-mt2701-g3d.c b/drivers/clk/mediatek/clk-mt2701-g3d.c
index b71e774a16a9..499a170ba5f9 100644
--- a/drivers/clk/mediatek/clk-mt2701-g3d.c
+++ b/drivers/clk/mediatek/clk-mt2701-g3d.c
@@ -32,6 +32,7 @@ static const struct mtk_gate_regs g3d_cg_regs = {
 };
 
 static const struct mtk_gate g3d_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "g3d_dummy"),
 	GATE_G3D(CLK_G3DSYS_CORE, "g3d_core", "mfg_sel", 0),
 };
 
@@ -43,57 +44,20 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
-static int clk_mt2701_g3dsys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_G3DSYS_NR);
-
-	mtk_clk_register_gates(&pdev->dev, node, g3d_clks, ARRAY_SIZE(g3d_clks),
-			       clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-
-	return r;
-}
+static const struct mtk_clk_desc g3d_desc = {
+	.clks = g3d_clks,
+	.num_clks = ARRAY_SIZE(g3d_clks),
+	.rst_desc = &clk_rst_desc,
+};
 
 static const struct of_device_id of_match_clk_mt2701_g3d[] = {
-	{
-		.compatible = "mediatek,mt2701-g3dsys",
-		.data = clk_mt2701_g3dsys_init,
-	}, {
-		/* sentinel */
-	}
+	{ .compatible = "mediatek,mt2701-g3dsys", .data = &g3d_desc },
+	{ /* sentinel */ }
 };
 
-static int clk_mt2701_g3d_probe(struct platform_device *pdev)
-{
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
-
 static struct platform_driver clk_mt2701_g3d_drv = {
-	.probe = clk_mt2701_g3d_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-g3d",
 		.of_match_table = of_match_clk_mt2701_g3d,
diff --git a/drivers/clk/mediatek/clk-mt2701-hif.c b/drivers/clk/mediatek/clk-mt2701-hif.c
index ca7c022ad2d0..d5465d782993 100644
--- a/drivers/clk/mediatek/clk-mt2701-hif.c
+++ b/drivers/clk/mediatek/clk-mt2701-hif.c
@@ -26,6 +26,7 @@ static const struct mtk_gate_regs hif_cg_regs = {
 	}
 
 static const struct mtk_gate hif_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "hif_dummy"),
 	GATE_HIF(CLK_HIFSYS_USB0PHY, "usb0_phy_clk", "ethpll_500m_ck", 21),
 	GATE_HIF(CLK_HIFSYS_USB1PHY, "usb1_phy_clk", "ethpll_500m_ck", 22),
 	GATE_HIF(CLK_HIFSYS_PCIE0, "pcie0_clk", "ethpll_500m_ck", 24),
@@ -41,37 +42,20 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
-static const struct of_device_id of_match_clk_mt2701_hif[] = {
-	{ .compatible = "mediatek,mt2701-hifsys", },
-	{}
+static const struct mtk_clk_desc hif_desc = {
+	.clks = hif_clks,
+	.num_clks = ARRAY_SIZE(hif_clks),
+	.rst_desc = &clk_rst_desc,
 };
 
-static int clk_mt2701_hif_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_HIFSYS_NR);
-
-	mtk_clk_register_gates(&pdev->dev, node, hif_clks,
-			       ARRAY_SIZE(hif_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-		return r;
-	}
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-
-	return 0;
-}
+static const struct of_device_id of_match_clk_mt2701_hif[] = {
+	{ .compatible = "mediatek,mt2701-hifsys", .data = &hif_desc },
+	{ /* sentinel */ }
+};
 
 static struct platform_driver clk_mt2701_hif_drv = {
-	.probe = clk_mt2701_hif_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-hif",
 		.of_match_table = of_match_clk_mt2701_hif,
diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index c483a7ad64fe..94f8fc2a4f7b 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1363,50 +1363,6 @@ static int clk_mt2712_top_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int clk_mt2712_infra_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-			       ARRAY_SIZE(infra_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-
-	if (r != 0)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc[0]);
-
-	return r;
-}
-
-static int clk_mt2712_peri_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, peri_clks,
-			       ARRAY_SIZE(peri_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-
-	if (r != 0)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc[1]);
-
-	return r;
-}
-
 static int clk_mt2712_mcu_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
@@ -1444,12 +1400,6 @@ static const struct of_device_id of_match_clk_mt2712[] = {
 	}, {
 		.compatible = "mediatek,mt2712-topckgen",
 		.data = clk_mt2712_top_probe,
-	}, {
-		.compatible = "mediatek,mt2712-infracfg",
-		.data = clk_mt2712_infra_probe,
-	}, {
-		.compatible = "mediatek,mt2712-pericfg",
-		.data = clk_mt2712_peri_probe,
 	}, {
 		.compatible = "mediatek,mt2712-mcucfg",
 		.data = clk_mt2712_mcu_probe,
@@ -1476,6 +1426,33 @@ static int clk_mt2712_probe(struct platform_device *pdev)
 	return r;
 }
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.rst_desc = &clk_rst_desc[0],
+};
+
+static const struct mtk_clk_desc peri_desc = {
+	.clks = peri_clks,
+	.num_clks = ARRAY_SIZE(peri_clks),
+	.rst_desc = &clk_rst_desc[1],
+};
+
+static const struct of_device_id of_match_clk_mt2712_simple[] = {
+	{ .compatible = "mediatek,mt2712-infracfg", .data = &infra_desc },
+	{ .compatible = "mediatek,mt2712-pericfg", .data = &peri_desc, },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt2712_simple_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt2712-simple",
+		.of_match_table = of_match_clk_mt2712_simple,
+	},
+};
+
 static struct platform_driver clk_mt2712_drv = {
 	.probe = clk_mt2712_probe,
 	.driver = {
@@ -1486,7 +1463,11 @@ static struct platform_driver clk_mt2712_drv = {
 
 static int __init clk_mt2712_init(void)
 {
-	return platform_driver_register(&clk_mt2712_drv);
+	int ret = platform_driver_register(&clk_mt2712_drv);
+
+	if (ret)
+		return ret;
+	return platform_driver_register(&clk_mt2712_simple_drv);
 }
 
 arch_initcall(clk_mt2712_init);
diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 248aaa50ced1..827025d127d9 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -880,6 +880,7 @@ static const struct mtk_gate_regs infra3_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate infra_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "ifa_dummy"),
 	/* INFRA0 */
 	GATE_INFRA0(CLK_INFRA_PMIC_TMR, "infra_pmic_tmr",
 		    "axi_sel", 0),
@@ -1259,19 +1260,6 @@ static int clk_mt6779_top_probe(struct platform_device *pdev)
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
-static int clk_mt6779_infra_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-			       ARRAY_SIZE(infra_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
-
 static const struct of_device_id of_match_clk_mt6779[] = {
 	{
 		.compatible = "mediatek,mt6779-apmixed",
@@ -1279,9 +1267,6 @@ static const struct of_device_id of_match_clk_mt6779[] = {
 	}, {
 		.compatible = "mediatek,mt6779-topckgen",
 		.data = clk_mt6779_top_probe,
-	}, {
-		.compatible = "mediatek,mt6779-infracfg_ao",
-		.data = clk_mt6779_infra_probe,
 	}, {
 		/* sentinel */
 	}
@@ -1305,6 +1290,25 @@ static int clk_mt6779_probe(struct platform_device *pdev)
 	return r;
 }
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+};
+
+static const struct of_device_id of_match_clk_mt6779_infra[] = {
+	{ .compatible = "mediatek,mt6779-infracfg_ao", .data = &infra_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt6779_infra_drv  = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt6779-infra",
+		.of_match_table = of_match_clk_mt6779_infra,
+	},
+};
+
 static struct platform_driver clk_mt6779_drv = {
 	.probe = clk_mt6779_probe,
 	.driver = {
@@ -1315,7 +1319,11 @@ static struct platform_driver clk_mt6779_drv = {
 
 static int __init clk_mt6779_init(void)
 {
-	return platform_driver_register(&clk_mt6779_drv);
+	int ret = platform_driver_register(&clk_mt6779_drv);
+
+	if (ret)
+		return ret;
+	return platform_driver_register(&clk_mt6779_infra_drv);
 }
 
 arch_initcall(clk_mt6779_init);
diff --git a/drivers/clk/mediatek/clk-mt7622-aud.c b/drivers/clk/mediatek/clk-mt7622-aud.c
index a3eb66b7532e..b8aabfeb1cba 100644
--- a/drivers/clk/mediatek/clk-mt7622-aud.c
+++ b/drivers/clk/mediatek/clk-mt7622-aud.c
@@ -130,24 +130,22 @@ static const struct mtk_gate audio_clks[] = {
 	GATE_AUDIO3(CLK_AUDIO_MEM_ASRC5, "audio_mem_asrc5", "asm_h_sel", 14),
 };
 
-static int clk_mt7622_audiosys_init(struct platform_device *pdev)
+static const struct mtk_clk_desc audio_desc = {
+	.clks = audio_clks,
+	.num_clks = ARRAY_SIZE(audio_clks),
+};
+
+static int clk_mt7622_aud_probe(struct platform_device *pdev)
 {
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
 	int r;
 
-	clk_data = mtk_alloc_clk_data(CLK_AUDIO_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, audio_clks,
-			       ARRAY_SIZE(audio_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	r = mtk_clk_simple_probe(pdev);
 	if (r) {
 		dev_err(&pdev->dev,
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
 
-		goto err_clk_provider;
+		return r;
 	}
 
 	r = devm_of_platform_populate(&pdev->dev);
@@ -157,40 +155,24 @@ static int clk_mt7622_audiosys_init(struct platform_device *pdev)
 	return 0;
 
 err_plat_populate:
-	of_clk_del_provider(node);
-err_clk_provider:
+	mtk_clk_simple_remove(pdev);
 	return r;
 }
 
-static const struct of_device_id of_match_clk_mt7622_aud[] = {
-	{
-		.compatible = "mediatek,mt7622-audsys",
-		.data = clk_mt7622_audiosys_init,
-	}, {
-		/* sentinel */
-	}
-};
-
-static int clk_mt7622_aud_probe(struct platform_device *pdev)
+static int clk_mt7622_aud_remove(struct platform_device *pdev)
 {
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
+	of_platform_depopulate(&pdev->dev);
+	return mtk_clk_simple_remove(pdev);
 }
 
+static const struct of_device_id of_match_clk_mt7622_aud[] = {
+	{ .compatible = "mediatek,mt7622-audsys", .data = &audio_desc },
+	{ /* sentinel */ }
+};
+
 static struct platform_driver clk_mt7622_aud_drv = {
 	.probe = clk_mt7622_aud_probe,
+	.remove = clk_mt7622_aud_remove,
 	.driver = {
 		.name = "clk-mt7622-aud",
 		.of_match_table = of_match_clk_mt7622_aud,
diff --git a/drivers/clk/mediatek/clk-mt7622-eth.c b/drivers/clk/mediatek/clk-mt7622-eth.c
index e058e4a9cc42..aee583fa77d0 100644
--- a/drivers/clk/mediatek/clk-mt7622-eth.c
+++ b/drivers/clk/mediatek/clk-mt7622-eth.c
@@ -73,80 +73,26 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
-static int clk_mt7622_ethsys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_ETH_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, eth_clks,
-			       ARRAY_SIZE(eth_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-
-	return r;
-}
-
-static int clk_mt7622_sgmiisys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_SGMII_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, sgmii_clks,
-			       ARRAY_SIZE(sgmii_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
+static const struct mtk_clk_desc eth_desc = {
+	.clks = eth_clks,
+	.num_clks = ARRAY_SIZE(eth_clks),
+	.rst_desc = &clk_rst_desc,
+};
 
-	return r;
-}
+static const struct mtk_clk_desc sgmii_desc = {
+	.clks = sgmii_clks,
+	.num_clks = ARRAY_SIZE(sgmii_clks),
+};
 
 static const struct of_device_id of_match_clk_mt7622_eth[] = {
-	{
-		.compatible = "mediatek,mt7622-ethsys",
-		.data = clk_mt7622_ethsys_init,
-	}, {
-		.compatible = "mediatek,mt7622-sgmiisys",
-		.data = clk_mt7622_sgmiisys_init,
-	}, {
-		/* sentinel */
-	}
+	{ .compatible = "mediatek,mt7622-ethsys", .data = &eth_desc },
+	{ .compatible = "mediatek,mt7622-sgmiisys", .data = &sgmii_desc },
+	{ /* sentinel */ }
 };
 
-static int clk_mt7622_eth_probe(struct platform_device *pdev)
-{
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
-
 static struct platform_driver clk_mt7622_eth_drv = {
-	.probe = clk_mt7622_eth_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7622-eth",
 		.of_match_table = of_match_clk_mt7622_eth,
diff --git a/drivers/clk/mediatek/clk-mt7622-hif.c b/drivers/clk/mediatek/clk-mt7622-hif.c
index 9371520c628b..ab5cad0c2b1c 100644
--- a/drivers/clk/mediatek/clk-mt7622-hif.c
+++ b/drivers/clk/mediatek/clk-mt7622-hif.c
@@ -84,82 +84,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
-static int clk_mt7622_ssusbsys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_SSUSB_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, ssusb_clks,
-			       ARRAY_SIZE(ssusb_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-
-	return r;
-}
-
-static int clk_mt7622_pciesys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_PCIE_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, pcie_clks,
-			       ARRAY_SIZE(pcie_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
+static const struct mtk_clk_desc ssusb_desc = {
+	.clks = ssusb_clks,
+	.num_clks = ARRAY_SIZE(ssusb_clks),
+	.rst_desc = &clk_rst_desc,
+};
 
-	return r;
-}
+static const struct mtk_clk_desc pcie_desc = {
+	.clks = pcie_clks,
+	.num_clks = ARRAY_SIZE(pcie_clks),
+	.rst_desc = &clk_rst_desc,
+};
 
 static const struct of_device_id of_match_clk_mt7622_hif[] = {
-	{
-		.compatible = "mediatek,mt7622-pciesys",
-		.data = clk_mt7622_pciesys_init,
-	}, {
-		.compatible = "mediatek,mt7622-ssusbsys",
-		.data = clk_mt7622_ssusbsys_init,
-	}, {
-		/* sentinel */
-	}
+	{ .compatible = "mediatek,mt7622-pciesys", .data = &pcie_desc },
+	{ .compatible = "mediatek,mt7622-ssusbsys", .data = &ssusb_desc },
+	{ /* sentinel */ }
 };
 
-static int clk_mt7622_hif_probe(struct platform_device *pdev)
-{
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
-
 static struct platform_driver clk_mt7622_hif_drv = {
-	.probe = clk_mt7622_hif_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7622-hif",
 		.of_match_table = of_match_clk_mt7622_hif,
diff --git a/drivers/clk/mediatek/clk-mt7629-hif.c b/drivers/clk/mediatek/clk-mt7629-hif.c
index bd1ce65aad2b..c3eb09ea6036 100644
--- a/drivers/clk/mediatek/clk-mt7629-hif.c
+++ b/drivers/clk/mediatek/clk-mt7629-hif.c
@@ -79,82 +79,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(rst_ofs),
 };
 
-static int clk_mt7629_ssusbsys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_SSUSB_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, ssusb_clks,
-			       ARRAY_SIZE(ssusb_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-
-	return r;
-}
-
-static int clk_mt7629_pciesys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_PCIE_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, pcie_clks,
-			       ARRAY_SIZE(pcie_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
+static const struct mtk_clk_desc ssusb_desc = {
+	.clks = ssusb_clks,
+	.num_clks = ARRAY_SIZE(ssusb_clks),
+	.rst_desc = &clk_rst_desc,
+};
 
-	return r;
-}
+static const struct mtk_clk_desc pcie_desc = {
+	.clks = pcie_clks,
+	.num_clks = ARRAY_SIZE(pcie_clks),
+	.rst_desc = &clk_rst_desc,
+};
 
 static const struct of_device_id of_match_clk_mt7629_hif[] = {
-	{
-		.compatible = "mediatek,mt7629-pciesys",
-		.data = clk_mt7629_pciesys_init,
-	}, {
-		.compatible = "mediatek,mt7629-ssusbsys",
-		.data = clk_mt7629_ssusbsys_init,
-	}, {
-		/* sentinel */
-	}
+	{ .compatible = "mediatek,mt7629-pciesys", .data = &pcie_desc },
+	{ .compatible = "mediatek,mt7629-ssusbsys", .data = &ssusb_desc },
+	{ /* sentinel */ }
 };
 
-static int clk_mt7629_hif_probe(struct platform_device *pdev)
-{
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
-
 static struct platform_driver clk_mt7629_hif_drv = {
-	.probe = clk_mt7629_hif_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7629-hif",
 		.of_match_table = of_match_clk_mt7629_hif,
diff --git a/drivers/clk/mediatek/clk-mt8183-audio.c b/drivers/clk/mediatek/clk-mt8183-audio.c
index f358a6e7a340..3f1630290b93 100644
--- a/drivers/clk/mediatek/clk-mt8183-audio.c
+++ b/drivers/clk/mediatek/clk-mt8183-audio.c
@@ -67,35 +67,40 @@ static const struct mtk_gate audio_clks[] = {
 		20),
 };
 
+static const struct mtk_clk_desc audio_desc = {
+	.clks = audio_clks,
+	.num_clks = ARRAY_SIZE(audio_clks),
+};
+
 static int clk_mt8183_audio_probe(struct platform_device *pdev)
 {
-	struct clk_hw_onecell_data *clk_data;
 	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_AUDIO_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, audio_clks,
-			       ARRAY_SIZE(audio_clks), clk_data);
 
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	r = mtk_clk_simple_probe(pdev);
 	if (r)
 		return r;
 
 	r = devm_of_platform_populate(&pdev->dev);
 	if (r)
-		of_clk_del_provider(node);
+		mtk_clk_simple_remove(pdev);
 
 	return r;
 }
 
+static int clk_mt8183_audio_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+	return mtk_clk_simple_remove(pdev);
+}
+
 static const struct of_device_id of_match_clk_mt8183_audio[] = {
-	{ .compatible = "mediatek,mt8183-audiosys", },
-	{}
+	{ .compatible = "mediatek,mt8183-audiosys", .data = &audio_desc },
+	{ /* sentinel */ }
 };
 
 static struct platform_driver clk_mt8183_audio_drv = {
 	.probe = clk_mt8183_audio_probe,
+	.remove = clk_mt8183_audio_remove,
 	.driver = {
 		.name = "clk-mt8183-audio",
 		.of_match_table = of_match_clk_mt8183_audio,
diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 9d29db8a7c7b..cc4f71bffba1 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1190,43 +1190,6 @@ static int clk_mt8183_top_probe(struct platform_device *pdev)
 				      top_clk_data);
 }
 
-static int clk_mt8183_infra_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-			       ARRAY_SIZE(infra_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		dev_err(&pdev->dev,
-			"%s(): could not register clock provider: %d\n",
-			__func__, r);
-		return r;
-	}
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-
-	return r;
-}
-
-static int clk_mt8183_peri_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
-
-	mtk_clk_register_gates(&pdev->dev, node, peri_clks,
-			       ARRAY_SIZE(peri_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
-
 static int clk_mt8183_mcu_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
@@ -1253,12 +1216,6 @@ static const struct of_device_id of_match_clk_mt8183[] = {
 	}, {
 		.compatible = "mediatek,mt8183-topckgen",
 		.data = clk_mt8183_top_probe,
-	}, {
-		.compatible = "mediatek,mt8183-infracfg",
-		.data = clk_mt8183_infra_probe,
-	}, {
-		.compatible = "mediatek,mt8183-pericfg",
-		.data = clk_mt8183_peri_probe,
 	}, {
 		.compatible = "mediatek,mt8183-mcucfg",
 		.data = clk_mt8183_mcu_probe,
@@ -1285,6 +1242,32 @@ static int clk_mt8183_probe(struct platform_device *pdev)
 	return r;
 }
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.rst_desc = &clk_rst_desc,
+};
+
+static const struct mtk_clk_desc peri_desc = {
+	.clks = peri_clks,
+	.num_clks = ARRAY_SIZE(peri_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8183_simple[] = {
+	{ .compatible = "mediatek,mt8183-infracfg", .data = &infra_desc },
+	{ .compatible = "mediatek,mt8183-pericfg", .data = &peri_desc, },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8183_simple_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8183-simple",
+		.of_match_table = of_match_clk_mt8183_simple,
+	},
+};
+
 static struct platform_driver clk_mt8183_drv = {
 	.probe = clk_mt8183_probe,
 	.driver = {
@@ -1295,7 +1278,11 @@ static struct platform_driver clk_mt8183_drv = {
 
 static int __init clk_mt8183_init(void)
 {
-	return platform_driver_register(&clk_mt8183_drv);
+	int ret = platform_driver_register(&clk_mt8183_drv);
+
+	if (ret)
+		return ret;
+	return platform_driver_register(&clk_mt8183_simple_drv);
 }
 
 arch_initcall(clk_mt8183_init);
diff --git a/drivers/clk/mediatek/clk-mt8192-aud.c b/drivers/clk/mediatek/clk-mt8192-aud.c
index f524188fe4c2..29affb68e854 100644
--- a/drivers/clk/mediatek/clk-mt8192-aud.c
+++ b/drivers/clk/mediatek/clk-mt8192-aud.c
@@ -77,39 +77,40 @@ static const struct mtk_gate aud_clks[] = {
 	GATE_AUD2(CLK_AUD_I2S9_B, "aud_i2s9_b", "audio_sel", 4),
 };
 
+static const struct mtk_clk_desc aud_desc = {
+	.clks = aud_clks,
+	.num_clks = ARRAY_SIZE(aud_clks),
+};
+
 static int clk_mt8192_aud_probe(struct platform_device *pdev)
 {
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
 	int r;
 
-	clk_data = mtk_alloc_clk_data(CLK_AUD_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_gates(&pdev->dev, node, aud_clks,
-				   ARRAY_SIZE(aud_clks), clk_data);
-	if (r)
-		return r;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	r = mtk_clk_simple_probe(pdev);
 	if (r)
 		return r;
 
 	r = devm_of_platform_populate(&pdev->dev);
 	if (r)
-		of_clk_del_provider(node);
+		mtk_clk_simple_remove(pdev);
 
 	return r;
 }
 
+static int clk_mt8192_aud_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+	return mtk_clk_simple_remove(pdev);
+}
+
 static const struct of_device_id of_match_clk_mt8192_aud[] = {
-	{ .compatible = "mediatek,mt8192-audsys", },
-	{}
+	{ .compatible = "mediatek,mt8192-audsys", .data = &aud_desc },
+	{ /* sentinel */ }
 };
 
 static struct platform_driver clk_mt8192_aud_drv = {
 	.probe = clk_mt8192_aud_probe,
+	.remove = clk_mt8192_aud_remove,
 	.driver = {
 		.name = "clk-mt8192-aud",
 		.of_match_table = of_match_clk_mt8192_aud,
diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 09d065c680e4..ea4164c0995e 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1164,66 +1164,6 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int clk_mt8192_infra_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-				   ARRAY_SIZE(infra_clks), clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (r)
-		goto unregister_gates;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_gates;
-
-	return r;
-
-unregister_gates:
-	mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static int clk_mt8192_peri_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_gates(&pdev->dev, node, peri_clks,
-				   ARRAY_SIZE(peri_clks), clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_gates;
-
-	return r;
-
-unregister_gates:
-	mtk_clk_unregister_gates(peri_clks, ARRAY_SIZE(peri_clks), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
@@ -1260,12 +1200,6 @@ static const struct of_device_id of_match_clk_mt8192[] = {
 	}, {
 		.compatible = "mediatek,mt8192-topckgen",
 		.data = clk_mt8192_top_probe,
-	}, {
-		.compatible = "mediatek,mt8192-infracfg",
-		.data = clk_mt8192_infra_probe,
-	}, {
-		.compatible = "mediatek,mt8192-pericfg",
-		.data = clk_mt8192_peri_probe,
 	}, {
 		/* sentinel */
 	}
@@ -1287,6 +1221,32 @@ static int clk_mt8192_probe(struct platform_device *pdev)
 	return r;
 }
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.rst_desc = &clk_rst_desc,
+};
+
+static const struct mtk_clk_desc peri_desc = {
+	.clks = peri_clks,
+	.num_clks = ARRAY_SIZE(peri_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_simple[] = {
+	{ .compatible = "mediatek,mt8192-infracfg", .data = &infra_desc },
+	{ .compatible = "mediatek,mt8192-pericfg", .data = &peri_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8192_simple_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8192-simple",
+		.of_match_table = of_match_clk_mt8192_simple,
+	},
+};
+
 static struct platform_driver clk_mt8192_drv = {
 	.probe = clk_mt8192_probe,
 	.driver = {
@@ -1297,7 +1257,11 @@ static struct platform_driver clk_mt8192_drv = {
 
 static int __init clk_mt8192_init(void)
 {
-	return platform_driver_register(&clk_mt8192_drv);
+	int ret = platform_driver_register(&clk_mt8192_drv);
+
+	if (ret)
+		return ret;
+	return platform_driver_register(&clk_mt8192_simple_drv);
 }
 
 arch_initcall(clk_mt8192_init);
-- 
2.39.0


