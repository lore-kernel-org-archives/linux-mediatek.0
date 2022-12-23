Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3008DC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iT1DuwEyxcOOMz7LI32HlThFbaPSzNVoPL+z5zN11HU=; b=XfLdlQMqBxdoxYdk7lRZ6Tbq8q
	Fril89blDkW+vbyjhlebTvwCLeuW/cuBsckD2ZUsfaf8W4lY6oEI+TxRBsE7szggsZz9pnJiXp4kE
	ubARBasVQRcnROR8qlLdEN8gA4xBFQWJX377snQMRCjsnscx2jEdmscFmXGhhvp7dk5++p4d0+tIm
	GInSMsu5BUvEEF5AUj9e6gdmX6N/2DVW39xxeJKIlD9mhUo1+a3U5BEGZ5bnFoaX//MS1xzaNeDbd
	chGIAk9DL/JWM9hy9vwS/skkNJkESYw/Q9sOsfD0BZXo9PlpHpex1S3fmcMZuoJCFAJ95Wp8SviaL
	C69+AaWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ed0-005upx-Ht; Fri, 23 Dec 2022 09:46:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eaA-005shp-6T; Fri, 23 Dec 2022 09:43:16 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B3A376602CEA;
	Fri, 23 Dec 2022 09:43:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671788593;
	bh=TEeukEcmEw2M1hk42gs6TWEg0hPcaPFVIEtr7muKTec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n+sFVnLKV2g0PitOiTd7Tcty7AnIzOwj+3AuwbpZzqEKeF4FCTYhoa1TLKWoLueb1
	 jTg5T7SkJZaTpurkn4RAMWdBlype9JsnVnRdlqtxfwEKCkbatQUnG7H972pR9Ic2vI
	 vQMLqj1ZRCM2Qf44Iu0/NsVeScUVTEKXdnMj1fnsB4XexdVAMkzfUTrRd23/5gTNeI
	 m68bWK+v16l2hAieGhn4xGNH22to6s/3K1ZdOVZ32GKboyVM30SLz1tlozLgqvR25V
	 SB8swy+5cF/3MwfMJuEr39uaq+YTIfd5G+CYRRgeKI+bwCjt7R7IcAUgLHbErJ/XKL
	 pg3dHgweZbuGw==
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
Subject: [PATCH v2 04/23] clk: mediatek: cpumux: Propagate struct device where possible
Date: Fri, 23 Dec 2022 10:42:40 +0100
Message-Id: <20221223094259.87373-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_014314_557454_F26676AE 
X-CRM114-Status: GOOD (  15.33  )
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

Take a pointer to a struct device in mtk_clk_register_cpumuxes() and
propagate the same to mtk_clk_register_cpumux() => clk_hw_register().
Even though runtime pm is unlikely to be used with CPU muxes, this
helps with code consistency and possibly opens to commonization of
some mtk_clk_register_(x) functions.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-cpumux.c          | 9 +++++----
 drivers/clk/mediatek/clk-cpumux.h          | 3 ++-
 drivers/clk/mediatek/clk-mt2701.c          | 2 +-
 drivers/clk/mediatek/clk-mt6795-infracfg.c | 3 ++-
 drivers/clk/mediatek/clk-mt7622.c          | 2 +-
 drivers/clk/mediatek/clk-mt7629.c          | 2 +-
 drivers/clk/mediatek/clk-mt8173.c          | 2 +-
 7 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 25618eff6f2a..889534f7e97d 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -59,7 +59,7 @@ static const struct clk_ops clk_cpumux_ops = {
 
 static struct clk_hw *
 mtk_clk_register_cpumux(const struct mtk_composite *mux,
-			struct regmap *regmap)
+			struct regmap *regmap, struct device *dev)
 {
 	struct mtk_clk_cpumux *cpumux;
 	int ret;
@@ -81,7 +81,7 @@ mtk_clk_register_cpumux(const struct mtk_composite *mux,
 	cpumux->regmap = regmap;
 	cpumux->hw.init = &init;
 
-	ret = clk_hw_register(NULL, &cpumux->hw);
+	ret = clk_hw_register(dev, &cpumux->hw);
 	if (ret) {
 		kfree(cpumux);
 		return ERR_PTR(ret);
@@ -104,7 +104,8 @@ static void mtk_clk_unregister_cpumux(struct clk_hw *hw)
 
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
-			      struct clk_hw_onecell_data *clk_data)
+			      struct clk_hw_onecell_data *clk_data,
+			      struct device *dev)
 {
 	int i;
 	struct clk_hw *hw;
@@ -125,7 +126,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 			continue;
 		}
 
-		hw = mtk_clk_register_cpumux(mux, regmap);
+		hw = mtk_clk_register_cpumux(mux, regmap, dev);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name,
 			       hw);
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index 325adbef25d1..0b7a59d4e0f2 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -13,7 +13,8 @@ struct mtk_composite;
 
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
-			      struct clk_hw_onecell_data *clk_data);
+			      struct clk_hw_onecell_data *clk_data,
+			      struct device *dev);
 
 void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
 				 struct clk_hw_onecell_data *clk_data);
diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index dff69fabb171..dcae25778817 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -770,7 +770,7 @@ static void __init mtk_infrasys_init_early(struct device_node *node)
 						infra_clk_data);
 
 	mtk_clk_register_cpumuxes(node, cpu_muxes, ARRAY_SIZE(cpu_muxes),
-				  infra_clk_data);
+				  infra_clk_data, NULL);
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
 				   infra_clk_data);
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index 4bbd2bfe2ec4..850b24666592 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -106,7 +106,8 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_clk_data;
 
-	ret = mtk_clk_register_cpumuxes(node, cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
+	ret = mtk_clk_register_cpumuxes(node, cpu_muxes, ARRAY_SIZE(cpu_muxes),
+					clk_data, &pdev->dev);
 	if (ret)
 		goto unregister_gates;
 
diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index eab450fc824c..adf3b4535170 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -674,7 +674,7 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 			       clk_data, &pdev->dev);
 
 	mtk_clk_register_cpumuxes(node, infra_muxes, ARRAY_SIZE(infra_muxes),
-				  clk_data);
+				  clk_data, &pdev->dev);
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
 				   clk_data);
diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 2daceeab7fc4..48bc4a6705fb 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -609,7 +609,7 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 			       clk_data, &pdev->dev);
 
 	mtk_clk_register_cpumuxes(node, infra_muxes, ARRAY_SIZE(infra_muxes),
-				  clk_data);
+				  clk_data, &pdev->dev);
 
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
 				      clk_data);
diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index dfb819dd1b1b..125b01b9e2ab 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -893,7 +893,7 @@ static void __init mtk_infrasys_init(struct device_node *node)
 	mtk_clk_register_factors(infra_divs, ARRAY_SIZE(infra_divs), clk_data);
 
 	mtk_clk_register_cpumuxes(node, cpu_muxes, ARRAY_SIZE(cpu_muxes),
-				  clk_data);
+				  clk_data, NULL);
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-- 
2.39.0


