Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70212C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FVi43O2hhEkBB1+/ML86GmtG6dEULcGHlrYpDkLU1g=; b=H9eyes7n6yF0rrjcMGlU0Beplw
	0VbJgOtuYB6Caz/SjoSSh5XmqGi3xT43z/RxlTy/BRIXBSN6gldYRold3Vo2v6JYcDD95Nl/aUA9d
	aN3O3C8pLNH4k5zANa41XJikqY/92uedue9zhnIABQQM3zo6up/fOdCSAZ5TzvZD2a+1QPQ00NzKf
	zyjgpz2dcmBfgleFTqNvEWRx0Bei1e6eT7bKlxHyR7vebVu8YAR9Ao7DLPhYZbsRVcqiXYopOevzw
	1X1n3/wBAo2dTqYlSoiPQMmNq3FNkDdMBsdS3wW2RTYHu1jYFTcJskzKZxsfzNNIxj/jYaa3v48vm
	hvaARnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGI2a-0024dt-GH; Fri, 13 Jan 2023 11:16:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHtr-0020Yn-FZ; Fri, 13 Jan 2023 11:07:10 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ECEDE6602DD1;
	Fri, 13 Jan 2023 11:07:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673608026;
	bh=PGO3NiBc+eG+zlOj+zCEsQPdPVSpKwfxJukNUr/qR44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KH2y3s+5NRwlMUJwKDpB5mu84EqxQBpNCQks5s8d2JOtwlvBZMtTbgtvOaxv8c2dC
	 KhWTNT8Acm9dfYlDB8A2DGLfnxmjDBrT/4FXCI6pd0INWFfODCQCib0wsNnN3/NxQM
	 gHwHE2eDIdjiZYlqLwo/6JlaMtueJPcTZG7dedhXp/LnYG858y0a42lDQzH0quDw7Y
	 Q8GMlhXAo0aBZHuAKbpNGMCK6WJQNgrgJ0gjZKbiyF+4mrhjqDRXbSVwqOq9yZmspX
	 ilN1Fw82l7fM3Cm1ve1lxvaQMbwzMPSMrPX/jHd0qqj9VLb6vjwsrHEz+51XBwI8fs
	 mCX17xqjHD+tg==
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
Subject: [PATCH v3 04/23] clk: mediatek: cpumux: Propagate struct device where possible
Date: Fri, 13 Jan 2023 12:05:57 +0100
Message-Id: <20230113110616.111001-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
References: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_030707_852071_393801D1 
X-CRM114-Status: GOOD (  16.04  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/clk/mediatek/clk-cpumux.c          | 8 ++++----
 drivers/clk/mediatek/clk-cpumux.h          | 2 +-
 drivers/clk/mediatek/clk-mt2701.c          | 2 +-
 drivers/clk/mediatek/clk-mt6795-infracfg.c | 3 ++-
 drivers/clk/mediatek/clk-mt7622.c          | 4 ++--
 drivers/clk/mediatek/clk-mt7629.c          | 4 ++--
 drivers/clk/mediatek/clk-mt8173.c          | 4 ++--
 7 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 25618eff6f2a..da05f06192c0 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -58,7 +58,7 @@ static const struct clk_ops clk_cpumux_ops = {
 };
 
 static struct clk_hw *
-mtk_clk_register_cpumux(const struct mtk_composite *mux,
+mtk_clk_register_cpumux(struct device *dev, const struct mtk_composite *mux,
 			struct regmap *regmap)
 {
 	struct mtk_clk_cpumux *cpumux;
@@ -81,7 +81,7 @@ mtk_clk_register_cpumux(const struct mtk_composite *mux,
 	cpumux->regmap = regmap;
 	cpumux->hw.init = &init;
 
-	ret = clk_hw_register(NULL, &cpumux->hw);
+	ret = clk_hw_register(dev, &cpumux->hw);
 	if (ret) {
 		kfree(cpumux);
 		return ERR_PTR(ret);
@@ -102,7 +102,7 @@ static void mtk_clk_unregister_cpumux(struct clk_hw *hw)
 	kfree(cpumux);
 }
 
-int mtk_clk_register_cpumuxes(struct device_node *node,
+int mtk_clk_register_cpumuxes(struct device *dev, struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_hw_onecell_data *clk_data)
 {
@@ -125,7 +125,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 			continue;
 		}
 
-		hw = mtk_clk_register_cpumux(mux, regmap);
+		hw = mtk_clk_register_cpumux(dev, mux, regmap);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name,
 			       hw);
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index 325adbef25d1..64e45c63b4a0 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -11,7 +11,7 @@ struct clk_hw_onecell_data;
 struct device_node;
 struct mtk_composite;
 
-int mtk_clk_register_cpumuxes(struct device_node *node,
+int mtk_clk_register_cpumuxes(struct device *dev, struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_hw_onecell_data *clk_data);
 
diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 61f1f358104b..3d56ab25aeac 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -769,7 +769,7 @@ static void __init mtk_infrasys_init_early(struct device_node *node)
 	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
 						infra_clk_data);
 
-	mtk_clk_register_cpumuxes(node, cpu_muxes, ARRAY_SIZE(cpu_muxes),
+	mtk_clk_register_cpumuxes(NULL, node, cpu_muxes, ARRAY_SIZE(cpu_muxes),
 				  infra_clk_data);
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index 8025d171d692..23d9fc057e61 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -106,7 +106,8 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_clk_data;
 
-	ret = mtk_clk_register_cpumuxes(node, cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
+	ret = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
+					ARRAY_SIZE(cpu_muxes), clk_data);
 	if (ret)
 		goto unregister_gates;
 
diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 976f318c2e5e..a51a6ed9c4b8 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -673,8 +673,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	mtk_clk_register_gates(&pdev->dev, node, infra_clks,
 			       ARRAY_SIZE(infra_clks), clk_data);
 
-	mtk_clk_register_cpumuxes(node, infra_muxes, ARRAY_SIZE(infra_muxes),
-				  clk_data);
+	mtk_clk_register_cpumuxes(&pdev->dev, node, infra_muxes,
+				  ARRAY_SIZE(infra_muxes), clk_data);
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
 				   clk_data);
diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index aadf5d1bc986..0fa158d61a29 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -608,8 +608,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	mtk_clk_register_gates(&pdev->dev, node, infra_clks,
 			       ARRAY_SIZE(infra_clks), clk_data);
 
-	mtk_clk_register_cpumuxes(node, infra_muxes, ARRAY_SIZE(infra_muxes),
-				  clk_data);
+	mtk_clk_register_cpumuxes(&pdev->dev, node, infra_muxes,
+				  ARRAY_SIZE(infra_muxes), clk_data);
 
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
 				      clk_data);
diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index c6545f9c759f..767368463ec5 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -892,8 +892,8 @@ static void __init mtk_infrasys_init(struct device_node *node)
 			       ARRAY_SIZE(infra_clks), clk_data);
 	mtk_clk_register_factors(infra_divs, ARRAY_SIZE(infra_divs), clk_data);
 
-	mtk_clk_register_cpumuxes(node, cpu_muxes, ARRAY_SIZE(cpu_muxes),
-				  clk_data);
+	mtk_clk_register_cpumuxes(NULL, node, cpu_muxes,
+				  ARRAY_SIZE(cpu_muxes), clk_data);
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-- 
2.39.0


