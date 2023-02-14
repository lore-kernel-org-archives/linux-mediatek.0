Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE8CC05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HNyWVS3WJbXUXCFGXxTNdh13kR7v+YdSJuK04SWq6I=; b=2oAPgP8pJI0hCfpvkRW9ErIRiu
	tG0eeDf9xDFXnbc7W99o1FQU/luxgPSVrPAY7h1lDISvfq2Q3A9/3AlO1UQgyYOwQX3ezCVIQSNfj
	bPMuTSgTtHNcREpHDp7QTHRBesAeUwlk4AlMfF9qysxTyPiu9mfnMm1DaUL0TMboJFsrqvgVvVqJt
	kV5rP7FSL5+XnvOrXsQa96KyAPx4RaWBvEWVi6jDU3kLXWX3JotywzQiR3tWrI8JTdcytjLlDciQu
	ZXxhOue6xCgf70jZ5g0uahGKLuvOhQ1jFfAD/PWCKc7wVcyWHCYuBVfBPD9452OmgQusbyIo4BdvL
	KMC13tig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvnG-001ss6-DD; Tue, 14 Feb 2023 13:56:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZU-001lk6-Fc; Tue, 14 Feb 2023 13:42:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F5F36602193;
	Tue, 14 Feb 2023 13:42:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382131;
	bh=Ho2NlFemL9Fnd8T8ogmhICfA8rfKWWN5rj0zCKthhRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HSx7jS9Pqv/9kKngu68v35iISfRuh2ZfRfCGjA38esqeI11/Wc8jrWFb7nFyCgFA5
	 D59BXzm6iapvBasby2k0uoji2nmjsETMfsdUmo3ZG93KWpXx+zSeKz3l5GLruvWnM9
	 Jq9jBOTUgchGfrOwhFvgx1B2+fraeDggD+AHTGsdAu7zGkOLiPesh3BmRNsFor/fN1
	 4kxkC0x8Tp8ATpvZ56PUn4Naqqj6O42Jxe/5rj+mLDJT2hv9wyq3NwPAqD3tEVwtGQ
	 HOlf+FiUWVx+Km4Gb7YPd8xb58U1khAMPgLhZxNuvECt/2coCtZiF8gQ8KWZu8l2r1
	 5Wa4mHPsVLbdA==
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
Subject: [PATCH v2 22/47] clk: mediatek: mt7622: Properly use CLK_IS_CRITICAL flag
Date: Tue, 14 Feb 2023 14:41:02 +0100
Message-Id: <20230214134127.59273-23-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054212_835159_EF71B7C6 
X-CRM114-Status: GOOD (  11.64  )
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

Instead of calling clk_prepare_enable() for clocks that shall stay
enabled, use the CLK_IS_CRITICAL flag, which purpose is exactly that.

Fixes: 2fc0a509e4ee ("clk: mediatek: add clock support for MT7622 SoC")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt7622.c | 35 +++++++++++++------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 41af8d420bbf..1c0049fbeb69 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -50,9 +50,9 @@
 		 _pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift,  \
 		 NULL, "clkxtal")
 
-#define GATE_APMIXED(_id, _name, _parent, _shift)			\
-	GATE_MTK(_id, _name, _parent, &apmixed_cg_regs, _shift,		\
-		 &mtk_clk_gate_ops_no_setclr_inv)
+#define GATE_APMIXED_AO(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &apmixed_cg_regs, _shift,	\
+		 &mtk_clk_gate_ops_no_setclr_inv, CLK_IS_CRITICAL)
 
 #define GATE_INFRA(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &infra_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
@@ -66,6 +66,10 @@
 #define GATE_PERI0(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &peri0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_PERI0_AO(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &peri0_cg_regs, _shift,	\
+		 &mtk_clk_gate_ops_setclr, CLK_IS_CRITICAL)
+
 #define GATE_PERI1(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &peri1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -315,7 +319,7 @@ static const struct mtk_pll_data plls[] = {
 };
 
 static const struct mtk_gate apmixed_clks[] = {
-	GATE_APMIXED(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
+	GATE_APMIXED_AO(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
 };
 
 static const struct mtk_gate infra_clks[] = {
@@ -450,7 +454,7 @@ static const struct mtk_gate peri_clks[] = {
 	GATE_PERI0(CLK_PERI_AP_DMA_PD, "peri_ap_dma_pd", "axi_sel", 12),
 	GATE_PERI0(CLK_PERI_MSDC30_0_PD, "peri_msdc30_0", "msdc30_0_sel", 13),
 	GATE_PERI0(CLK_PERI_MSDC30_1_PD, "peri_msdc30_1", "msdc30_1_sel", 14),
-	GATE_PERI0(CLK_PERI_UART0_PD, "peri_uart0_pd", "axi_sel", 17),
+	GATE_PERI0_AO(CLK_PERI_UART0_PD, "peri_uart0_pd", "axi_sel", 17),
 	GATE_PERI0(CLK_PERI_UART1_PD, "peri_uart1_pd", "axi_sel", 18),
 	GATE_PERI0(CLK_PERI_UART2_PD, "peri_uart2_pd", "axi_sel", 19),
 	GATE_PERI0(CLK_PERI_UART3_PD, "peri_uart3_pd", "axi_sel", 20),
@@ -478,12 +482,12 @@ static struct mtk_composite infra_muxes[] = {
 
 static struct mtk_composite top_muxes[] = {
 	/* CLK_CFG_0 */
-	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
-		 0x040, 0, 3, 7),
-	MUX_GATE(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
-		 0x040, 8, 1, 15),
-	MUX_GATE(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
-		 0x040, 16, 1, 23),
+	MUX_GATE_FLAGS(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
+		       0x040, 0, 3, 7, CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_MEM_SEL, "mem_sel", mem_parents,
+		       0x040, 8, 1, 15, CLK_IS_CRITICAL),
+	MUX_GATE_FLAGS(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel", ddrphycfg_parents,
+		       0x040, 16, 1, 23, CLK_IS_CRITICAL),
 	MUX_GATE(CLK_TOP_ETH_SEL, "eth_sel", eth_parents,
 		 0x040, 24, 3, 31),
 
@@ -621,10 +625,6 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 	mtk_clk_register_gates(&pdev->dev, node, top_clks,
 			       ARRAY_SIZE(top_clks), clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_TOP_AXI_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_MEM_SEL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_TOP_DDRPHYCFG_SEL]->clk);
-
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
@@ -667,9 +667,6 @@ static int mtk_apmixedsys_init(struct platform_device *pdev)
 	mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
 			       ARRAY_SIZE(apmixed_clks), clk_data);
 
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_ARMPLL]->clk);
-	clk_prepare_enable(clk_data->hws[CLK_APMIXED_MAIN_CORE_EN]->clk);
-
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
@@ -697,8 +694,6 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	clk_prepare_enable(clk_data->hws[CLK_PERI_UART0_PD]->clk);
-
 	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc[1]);
 
 	return 0;
-- 
2.39.1


