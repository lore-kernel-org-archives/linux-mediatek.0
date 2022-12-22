Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4DDC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqDsU0EotEXwy7NvAktIZePY0rbNPdzXgl+1K+n6K00=; b=1GVwfwe+5GINL0U0EkwiceWF2Q
	rf7HqcGZtkg97jcUfkJLohh2e49gJUmm8t9piWR8SRMB6xg+omOUIUWx80/oadjd0X/fCwfVny3wR
	hK8M9vT6FUdKqZ1eUybZXPVXWrq4JumTvBleuy5L82kxHpkKzEkT+ClhLvtEnctxqSG7hc0v0bNTg
	XzBoAkZhzCjDJFhEcopnRTr8cgSrhj6Xd5aD6Oakhgy/Q1fWGvjEMozBCC0MjXMVTwNqSg7qJCBm1
	cdqky6DiJ4ELh784mYpo4vg+9sLJ5++l+TvXwCm0Dc7401whmiKCMkk7d0BHE6RMhcCUJFuG1pwLI
	t47fCJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Kuz-00BzYp-BR; Thu, 22 Dec 2022 12:43:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K4k-00BXGp-Mb; Thu, 22 Dec 2022 11:49:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EF0666602CEB;
	Thu, 22 Dec 2022 11:49:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671709765;
	bh=ty48ueu2BRL62kzjZYVVfEEdsnCwD4EJP8TQYVQJie4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nii631uWp8LdLRImeC7fr7HMjLWP9xDe9Xwf4YJLx5RGE+UMQ6fsma2kyx5pLilo8
	 0TbU9KkWXHfRb5gZo90aH7faLozMjcP0u0bktoe39AlsfsM+g4hbo9ZYpHGGi312sV
	 NvC59L1Bll7u6Hziq3BJkk5CgvTJl04jEyCGyK738OQiNOexQX1/Q7S5MqJZxOKnid
	 Ysc/3ewRcFZxdg0K0d0wMfoK4xNayTUZMPRGdUFkhTN89FbgBPNqDwHEoI8CPTcdge
	 UYIh4cHiX/69Bj08ZdFzl7e2zO2x4xxvEA4FkgAOtOAJ98b8VOEH2r+NUkSBSnAtdN
	 G/ntHp00XOzGw==
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
Subject: [PATCH v1 06/25] clk: mediatek: clk-mux: Propagate struct device for mtk-mux
Date: Thu, 22 Dec 2022 12:48:38 +0100
Message-Id: <20221222114857.120060-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034927_268383_D5CF287C 
X-CRM114-Status: GOOD (  11.29  )
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

Like done for other clocks, propagate struct device for mtk mux clocks
registered through clk-mux helpers to enable runtime pm support.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt6765.c          | 2 +-
 drivers/clk/mediatek/clk-mt6779.c          | 2 +-
 drivers/clk/mediatek/clk-mt6795-topckgen.c | 2 +-
 drivers/clk/mediatek/clk-mt7986-infracfg.c | 2 +-
 drivers/clk/mediatek/clk-mt7986-topckgen.c | 2 +-
 drivers/clk/mediatek/clk-mt8183.c          | 2 +-
 drivers/clk/mediatek/clk-mt8186-topckgen.c | 2 +-
 drivers/clk/mediatek/clk-mt8192.c          | 2 +-
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 2 +-
 drivers/clk/mediatek/clk-mt8365.c          | 2 +-
 drivers/clk/mediatek/clk-mux.c             | 9 +++++----
 drivers/clk/mediatek/clk-mux.h             | 3 ++-
 12 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index 7401693ef472..30d0fe9acb37 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -827,7 +827,7 @@ static int clk_mt6765_top_probe(struct platform_device *pdev)
 	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs),
 				 clk_data);
 	mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes), node,
-			       &mt6765_clk_lock, clk_data);
+			       &mt6765_clk_lock, clk_data, &pdev->dev);
 	mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
 			       clk_data, &pdev->dev);
 
diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 825f2f57e868..6d1fb19be77b 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1245,7 +1245,7 @@ static int clk_mt6779_top_probe(struct platform_device *pdev)
 	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
 
 	mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes),
-			       node, &mt6779_clk_lock, clk_data);
+			       node, &mt6779_clk_lock, clk_data, &pdev->dev);
 
 	mtk_clk_register_composites(top_aud_muxes, ARRAY_SIZE(top_aud_muxes),
 				    base, &mt6779_clk_lock, clk_data, &pdev->dev);
diff --git a/drivers/clk/mediatek/clk-mt6795-topckgen.c b/drivers/clk/mediatek/clk-mt6795-topckgen.c
index bb232e1726f1..19440fe5460d 100644
--- a/drivers/clk/mediatek/clk-mt6795-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt6795-topckgen.c
@@ -553,7 +553,7 @@ static int clk_mt6795_topckgen_probe(struct platform_device *pdev)
 		goto unregister_fixed_clks;
 
 	ret = mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes), node,
-				     &mt6795_top_clk_lock, clk_data);
+				     &mt6795_top_clk_lock, clk_data, &pdev->dev);
 	if (ret)
 		goto unregister_factors;
 
diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index 24947ccdb70a..fe64a226c4ac 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -191,7 +191,7 @@ static int clk_mt7986_infracfg_probe(struct platform_device *pdev)
 
 	mtk_clk_register_factors(infra_divs, ARRAY_SIZE(infra_divs), clk_data);
 	mtk_clk_register_muxes(infra_muxes, ARRAY_SIZE(infra_muxes), node,
-			       &mt7986_clk_lock, clk_data);
+			       &mt7986_clk_lock, clk_data, &pdev->dev);
 	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
 			       clk_data, &pdev->dev);
 
diff --git a/drivers/clk/mediatek/clk-mt7986-topckgen.c b/drivers/clk/mediatek/clk-mt7986-topckgen.c
index de5121cf2877..d7df9585787f 100644
--- a/drivers/clk/mediatek/clk-mt7986-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7986-topckgen.c
@@ -304,7 +304,7 @@ static int clk_mt7986_topckgen_probe(struct platform_device *pdev)
 				    clk_data);
 	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
 	mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes), node,
-			       &mt7986_clk_lock, clk_data);
+			       &mt7986_clk_lock, clk_data, &pdev->dev);
 
 	clk_prepare_enable(clk_data->hws[CLK_TOP_SYSAXI_SEL]->clk);
 	clk_prepare_enable(clk_data->hws[CLK_TOP_SYSAPB_SEL]->clk);
diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 194906ca4b5b..10a82b542376 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1167,7 +1167,7 @@ static int clk_mt8183_top_probe(struct platform_device *pdev)
 	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
 
 	mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes),
-		node, &mt8183_clk_lock, top_clk_data);
+		node, &mt8183_clk_lock, top_clk_data, &pdev->dev);
 
 	mtk_clk_register_composites(top_aud_muxes, ARRAY_SIZE(top_aud_muxes),
 		base, &mt8183_clk_lock, top_clk_data, &pdev->dev);
diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
index b79954a42481..d05143891b69 100644
--- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
@@ -738,7 +738,7 @@ static int clk_mt8186_topck_probe(struct platform_device *pdev)
 		goto unregister_fixed_clks;
 
 	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
-				   &mt8186_clk_lock, clk_data);
+				   &mt8186_clk_lock, clk_data, &pdev->dev);
 	if (r)
 		goto unregister_factors;
 
diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 27ad629062c4..3ca068a4c552 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1113,7 +1113,7 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 		goto unregister_early_factors;
 
 	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
-				   &mt8192_clk_lock, top_clk_data);
+				   &mt8192_clk_lock, top_clk_data, &pdev->dev);
 	if (r)
 		goto unregister_factors;
 
diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 437c12d19b03..6d6a11d4a536 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1263,7 +1263,7 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 		goto unregister_fixed_clks;
 
 	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
-				   &mt8195_clk_lock, top_clk_data);
+				   &mt8195_clk_lock, top_clk_data, &pdev->dev);
 	if (r)
 		goto unregister_factors;
 
diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
index 00c15f89a5f6..abb719b4661a 100644
--- a/drivers/clk/mediatek/clk-mt8365.c
+++ b/drivers/clk/mediatek/clk-mt8365.c
@@ -948,7 +948,7 @@ static int clk_mt8365_top_probe(struct platform_device *pdev)
 		goto unregister_fixed_clks;
 
 	ret = mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes), node,
-				     &mt8365_clk_lock, clk_data);
+				     &mt8365_clk_lock, clk_data, &pdev->dev);
 	if (ret)
 		goto unregister_factors;
 
diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index ba1720b9e231..cd37abdf47c9 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(mtk_mux_gate_clr_set_upd_ops);
 
 static struct clk_hw *mtk_clk_register_mux(const struct mtk_mux *mux,
 				 struct regmap *regmap,
-				 spinlock_t *lock)
+				 spinlock_t *lock, struct device *dev)
 {
 	struct mtk_clk_mux *clk_mux;
 	struct clk_init_data init = {};
@@ -177,7 +177,7 @@ static struct clk_hw *mtk_clk_register_mux(const struct mtk_mux *mux,
 	clk_mux->lock = lock;
 	clk_mux->hw.init = &init;
 
-	ret = clk_hw_register(NULL, &clk_mux->hw);
+	ret = clk_hw_register(dev, &clk_mux->hw);
 	if (ret) {
 		kfree(clk_mux);
 		return ERR_PTR(ret);
@@ -201,7 +201,8 @@ static void mtk_clk_unregister_mux(struct clk_hw *hw)
 int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			   int num, struct device_node *node,
 			   spinlock_t *lock,
-			   struct clk_hw_onecell_data *clk_data)
+			   struct clk_hw_onecell_data *clk_data,
+			   struct device *dev)
 {
 	struct regmap *regmap;
 	struct clk_hw *hw;
@@ -222,7 +223,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			continue;
 		}
 
-		hw = mtk_clk_register_mux(mux, regmap, lock);
+		hw = mtk_clk_register_mux(mux, regmap, lock, dev);
 
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name,
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 83ff420f4ebe..3fe07719e5c6 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -86,7 +86,8 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			   int num, struct device_node *node,
 			   spinlock_t *lock,
-			   struct clk_hw_onecell_data *clk_data);
+			   struct clk_hw_onecell_data *clk_data,
+			   struct device *dev);
 
 void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
 			      struct clk_hw_onecell_data *clk_data);
-- 
2.39.0


