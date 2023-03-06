Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742CBC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KUn2x/Mj6gkvuafXmcTP2GVT3ZZfTF6goy9p4JvLgg=; b=T9w135w+CtjMMvrFKG5QIu8L+q
	PdOeIsjsANq9c76iMu1tVyJr08Tu0et1VDxkXm5ZvUv3gsRyP/5lLwngVENOM9tjeo2xQvMoj+lV0
	tDrMkUdgiJ3z1nVzP13/Y3z0CF7K8ruq0QgA+8siN64yoPaD01GIdr7O/UYzkb6N/pJHx83ZHm3Vx
	kxw5zavLiXzEUZptuZ8YgTlIcdbW9/GImtOcjNHvOCH0ZMP9JNYM4qxnDNTKSOQ6PuUuyunHj3TMW
	8emTXKUWxUrSBLnkwV4fWimsXfLNIF4B6RlwHdZBpo1Jw2leJQiOHluPDvy0hb9Q+kxXrt9G8siKl
	03Aj0o7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBqs-00DGiQ-SV; Mon, 06 Mar 2023 14:30:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBUB-00D3rL-4n; Mon, 06 Mar 2023 14:06:45 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 91A796602FF2;
	Mon,  6 Mar 2023 14:06:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678111601;
	bh=ZT4QggSxpj6wDR+paGF5k1lREdRL9xb5rsl90P/FRC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JvkklMhZdK4k0YeF0frbKaOB3Jpr0v3r6AqlJXSKBV/Y+4/UKUit1YYDJ28TjAwzz
	 fbTBjmbpygBrdqN2adUZvaxG5smuAM/XIUG2nli76iP+pRMgu4Yy6aC5eJUwmJ4dYv
	 UOQiqvLhu2Uxi3cjwmlDr77uyVXklaIqTtlOaAYLZ4EYuR8lra1+9JdQ6zWFUv6/na
	 4+5kE8ZtCqq4x+F2faHwyNU475lX7xbN7yhDGMe4O87Z09cdwdpc6qVUzseMYO8PM0
	 dltN75rziFQn3rdgSIEJ8oG22XzGmv0k1klq5zW8drF8HhcUclaTnV6gSgkHjynbj1
	 mXBySeSMRVQvQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v6 34/54] clk: mediatek: mt7986-eth: Migrate to common probe mechanism
Date: Mon,  6 Mar 2023 15:05:23 +0100
Message-Id: <20230306140543.1813621-35-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_060643_658251_C89AFE41 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert this driver to use the common mtk_clk_simple_probe() mechanism.
While at it, also remove __initconst annotations (as these structures
are used also at runtime).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mt7986-eth.c | 83 +++++++++++----------------
 1 file changed, 32 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-eth.c b/drivers/clk/mediatek/clk-mt7986-eth.c
index e04bc6845ea6..138ba0a47221 100644
--- a/drivers/clk/mediatek/clk-mt7986-eth.c
+++ b/drivers/clk/mediatek/clk-mt7986-eth.c
@@ -25,7 +25,7 @@ static const struct mtk_gate_regs sgmii0_cg_regs = {
 #define GATE_SGMII0(_id, _name, _parent, _shift)		\
 	GATE_MTK(_id, _name, _parent, &sgmii0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
 
-static const struct mtk_gate sgmii0_clks[] __initconst = {
+static const struct mtk_gate sgmii0_clks[] = {
 	GATE_SGMII0(CLK_SGMII0_TX250M_EN, "sgmii0_tx250m_en", "top_xtal", 2),
 	GATE_SGMII0(CLK_SGMII0_RX250M_EN, "sgmii0_rx250m_en", "top_xtal", 3),
 	GATE_SGMII0(CLK_SGMII0_CDR_REF, "sgmii0_cdr_ref", "top_xtal", 4),
@@ -41,7 +41,7 @@ static const struct mtk_gate_regs sgmii1_cg_regs = {
 #define GATE_SGMII1(_id, _name, _parent, _shift)		\
 	GATE_MTK(_id, _name, _parent, &sgmii1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
 
-static const struct mtk_gate sgmii1_clks[] __initconst = {
+static const struct mtk_gate sgmii1_clks[] = {
 	GATE_SGMII1(CLK_SGMII1_TX250M_EN, "sgmii1_tx250m_en", "top_xtal", 2),
 	GATE_SGMII1(CLK_SGMII1_RX250M_EN, "sgmii1_rx250m_en", "top_xtal", 3),
 	GATE_SGMII1(CLK_SGMII1_CDR_REF, "sgmii1_cdr_ref", "top_xtal", 4),
@@ -57,7 +57,7 @@ static const struct mtk_gate_regs eth_cg_regs = {
 #define GATE_ETH(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &eth_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
 
-static const struct mtk_gate eth_clks[] __initconst = {
+static const struct mtk_gate eth_clks[] = {
 	GATE_ETH(CLK_ETH_FE_EN, "eth_fe_en", "netsys_2x_sel", 6),
 	GATE_ETH(CLK_ETH_GP2_EN, "eth_gp2_en", "sgm_325m_sel", 7),
 	GATE_ETH(CLK_ETH_GP1_EN, "eth_gp1_en", "sgm_325m_sel", 8),
@@ -65,56 +65,37 @@ static const struct mtk_gate eth_clks[] __initconst = {
 	GATE_ETH(CLK_ETH_WOCPU0_EN, "eth_wocpu0_en", "netsys_mcu_sel", 15),
 };
 
-static void __init mtk_sgmiisys_0_init(struct device_node *node)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(sgmii0_clks));
-
-	mtk_clk_register_gates(NULL, node, sgmii0_clks,
-			       ARRAY_SIZE(sgmii0_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-}
-CLK_OF_DECLARE(mtk_sgmiisys_0, "mediatek,mt7986-sgmiisys_0",
-	       mtk_sgmiisys_0_init);
-
-static void __init mtk_sgmiisys_1_init(struct device_node *node)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(sgmii1_clks));
-
-	mtk_clk_register_gates(NULL, node, sgmii1_clks,
-			       ARRAY_SIZE(sgmii1_clks), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-}
-CLK_OF_DECLARE(mtk_sgmiisys_1, "mediatek,mt7986-sgmiisys_1",
-	       mtk_sgmiisys_1_init);
+static const struct mtk_clk_desc eth_desc = {
+	.clks = eth_clks,
+	.num_clks = ARRAY_SIZE(eth_clks),
+};
 
-static void __init mtk_ethsys_init(struct device_node *node)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
+static const struct mtk_clk_desc sgmii0_desc = {
+	.clks = sgmii0_clks,
+	.num_clks = ARRAY_SIZE(sgmii0_clks),
+};
 
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(eth_clks));
+static const struct mtk_clk_desc sgmii1_desc = {
+	.clks = sgmii1_clks,
+	.num_clks = ARRAY_SIZE(sgmii1_clks),
+};
 
-	mtk_clk_register_gates(NULL, node, eth_clks, ARRAY_SIZE(eth_clks), clk_data);
+static const struct of_device_id of_match_clk_mt7986_eth[] = {
+	{ .compatible = "mediatek,mt7986-ethsys", .data = &eth_desc },
+	{ .compatible = "mediatek,mt7986-sgmiisys_0", .data = &sgmii0_desc },
+	{ .compatible = "mediatek,mt7986-sgmiisys_1", .data = &sgmii1_desc },
+	{ /* sentinel */ }
+};
 
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+static struct platform_driver clk_mt7986_eth_drv = {
+	.driver = {
+		.name = "clk-mt7986-eth",
+		.of_match_table = of_match_clk_mt7986_eth,
+	},
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+};
+module_platform_driver(clk_mt7986_eth_drv);
 
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-}
-CLK_OF_DECLARE(mtk_ethsys, "mediatek,mt7986-ethsys", mtk_ethsys_init);
+MODULE_DESCRIPTION("MediaTek MT7986 Ethernet clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2


