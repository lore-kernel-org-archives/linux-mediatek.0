Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3FAC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 12:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYevom0g4aLAdKOWzoiAmp8CQAkfHdag1cdVM5pkKCg=; b=wVDNhle2sQGtJi6niWVbQVvy1r
	E77gkDR9C26sA2cskvzSKU4PEouR/OVQYdnmTbSlzCoEQTx9ggj4P+X0YHrbzN/RQActBohaC1CyV
	QCAZeM+P/npn1xtPG9LetAyc1cPXtfJm9z3psqD7zomNnU29sj061HQTiiAczyAqksIA5sNolw3+u
	mTvdTcjcRzIwSjb/qt96411Qes+465DPsB5jz4C51l0ffLqVvLTKSM8U0sOs0nf+aJPDyXw24TXXU
	SDvj+b6L5q+zdAK4tdQY+HGGZK4ECRSw4TNfN9jlmqtRTwRnHDrlufBH3M994GNpiQzISL4VmZU9o
	+9FJDIXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURWW-007sV1-T0; Tue, 21 Feb 2023 12:13:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURG0-007jne-GG; Tue, 21 Feb 2023 11:56:31 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C59566021C4;
	Tue, 21 Feb 2023 11:56:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676980587;
	bh=Fe57I1kGqe16XALYEp8pdWfQ1Wcgh45oXl57mxR/RbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FUmOPWgByfvgXGcMlDu6cTyfXDm6+2irfxAVA7Af+yAlt0hFqlHy3e7O9ISBD5Yz4
	 EDsuUyms34guG7n939PcxTpW3RfsECJdCFF/Yw3XHi/MmNUXMaywVJ2kL8ZjfGONM9
	 UnwU1VukRKNsDNDKTJrjfQQ9rWkVziAQca1x27BOF/ly1c4YJWGlPb+4rpDdxbHSNF
	 a5dsgjmkszqSa6rmUQPqviX89O+3WcmWEPkyj5XfKWmloC+fTdPYs1qNBuiEiumIxN
	 BPsED9FBkj5mgoTNxXptRoP3hxtBtVE3JQ7sMoJyFvesYb2IvD6Z7W5P5imZJobp+B
	 ZWE34tpHpe8rA==
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
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 24/54] clk: mediatek: mt7622: Move apmixedsys clock driver to its own file
Date: Tue, 21 Feb 2023 12:55:19 +0100
Message-Id: <20230221115549.360132-25-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
References: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_035628_876862_154BF8B0 
X-CRM114-Status: GOOD (  23.62  )
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

In preparation for migrating mt7622 clocks to the common simple
probe mechanism, move apmixedsys clocks to a different file.
While at it, use the builtin_platform_driver() macro for it.

During the conversion, error handling was added to the apmixedsys
probe function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Makefile                |   2 +-
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 137 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt7622.c            |  87 ------------
 3 files changed, 138 insertions(+), 88 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt7622-apmixedsys.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 10038a0f25e0..c1bee331eebf 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -46,7 +46,7 @@ obj-$(CONFIG_COMMON_CLK_MT2712_MFGCFG) += clk-mt2712-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT2712_MMSYS) += clk-mt2712-mm.o
 obj-$(CONFIG_COMMON_CLK_MT2712_VDECSYS) += clk-mt2712-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT2712_VENCSYS) += clk-mt2712-venc.o
-obj-$(CONFIG_COMMON_CLK_MT7622) += clk-mt7622.o
+obj-$(CONFIG_COMMON_CLK_MT7622) += clk-mt7622.o clk-mt7622-apmixedsys.o
 obj-$(CONFIG_COMMON_CLK_MT7622_ETHSYS) += clk-mt7622-eth.o
 obj-$(CONFIG_COMMON_CLK_MT7622_HIFSYS) += clk-mt7622-hif.o
 obj-$(CONFIG_COMMON_CLK_MT7622_AUDSYS) += clk-mt7622-aud.o
diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
new file mode 100644
index 000000000000..497fada797b9
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017 MediaTek Inc.
+ * Copyright (c) 2023 Collabora, Ltd.
+ *               AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <dt-bindings/clock/mt7622-clk.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
+
+#define MT7622_PLL_FMAX		(2500UL * MHZ)
+#define CON0_MT7622_RST_BAR	BIT(27)
+
+#define PLL_xtal(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,\
+			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg,	\
+			_pcw_shift, _div_table, _parent_name) {		\
+		.id = _id,						\
+		.name = _name,						\
+		.reg = _reg,						\
+		.pwr_reg = _pwr_reg,					\
+		.en_mask = _en_mask,					\
+		.flags = _flags,					\
+		.rst_bar_mask = CON0_MT7622_RST_BAR,			\
+		.fmax = MT7622_PLL_FMAX,				\
+		.pcwbits = _pcwbits,					\
+		.pd_reg = _pd_reg,					\
+		.pd_shift = _pd_shift,					\
+		.tuner_reg = _tuner_reg,				\
+		.pcw_reg = _pcw_reg,					\
+		.pcw_shift = _pcw_shift,				\
+		.div_table = _div_table,				\
+		.parent_name = _parent_name,				\
+	}
+
+#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,	\
+			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg,	\
+			_pcw_shift)					\
+	PLL_xtal(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,\
+		 _pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift,  \
+		 NULL, "clkxtal")
+
+static const struct mtk_gate_regs apmixed_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_APMIXED_AO(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &apmixed_cg_regs, _shift,	\
+		 &mtk_clk_gate_ops_no_setclr_inv, CLK_IS_CRITICAL)
+
+static const struct mtk_pll_data plls[] = {
+	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0,
+	    PLL_AO, 21, 0x0204, 24, 0, 0x0204, 0),
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0210, 0x021C, 0,
+	    HAVE_RST_BAR, 21, 0x0214, 24, 0, 0x0214, 0),
+	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0220, 0x022C, 0,
+	    HAVE_RST_BAR, 7, 0x0224, 24, 0, 0x0224, 14),
+	PLL(CLK_APMIXED_ETH1PLL, "eth1pll", 0x0300, 0x0310, 0,
+	    0, 21, 0x0300, 1, 0, 0x0304, 0),
+	PLL(CLK_APMIXED_ETH2PLL, "eth2pll", 0x0314, 0x0320, 0,
+	    0, 21, 0x0314, 1, 0, 0x0318, 0),
+	PLL(CLK_APMIXED_AUD1PLL, "aud1pll", 0x0324, 0x0330, 0,
+	    0, 31, 0x0324, 1, 0, 0x0328, 0),
+	PLL(CLK_APMIXED_AUD2PLL, "aud2pll", 0x0334, 0x0340, 0,
+	    0, 31, 0x0334, 1, 0, 0x0338, 0),
+	PLL(CLK_APMIXED_TRGPLL, "trgpll", 0x0344, 0x0354, 0,
+	    0, 21, 0x0344, 1, 0, 0x0348, 0),
+	PLL(CLK_APMIXED_SGMIPLL, "sgmipll", 0x0358, 0x0368, 0,
+	    0, 21, 0x0358, 1, 0, 0x035C, 0),
+};
+
+static const struct mtk_gate apmixed_clks[] = {
+	GATE_APMIXED_AO(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
+};
+
+static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
+{
+	void __iomem *base;
+	struct clk_hw_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	clk_data = mtk_devm_alloc_clk_data(dev, CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	ret = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	if (ret)
+		return ret;
+
+	ret = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
+				     ARRAY_SIZE(apmixed_clks), clk_data);
+	if (ret)
+		goto unregister_plls;
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		goto unregister_gates;
+
+	return 0;
+
+unregister_gates:
+	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+unregister_plls:
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+
+	return ret;
+}
+
+static const struct of_device_id of_match_clk_mt7622_apmixed[] = {
+	{ .compatible = "mediatek,mt7622-apmixedsys" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt7622_apmixed_drv = {
+	.probe = clk_mt7622_apmixed_probe,
+	.driver = {
+		.name = "clk-mt7622-apmixed",
+		.of_match_table = of_match_clk_mt7622_apmixed,
+	},
+};
+builtin_platform_driver(clk_mt7622_apmixed_drv)
+
+MODULE_DESCRIPTION("MediaTek MT7622 apmixedsys clocks driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 1c0049fbeb69..6cf74c948ac7 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -14,46 +14,10 @@
 #include "clk-cpumux.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
-#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt7622-clk.h>
 #include <linux/clk.h> /* for consumer */
 
-#define MT7622_PLL_FMAX		(2500UL * MHZ)
-#define CON0_MT7622_RST_BAR	BIT(27)
-
-#define PLL_xtal(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,\
-			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg,	\
-			_pcw_shift, _div_table, _parent_name) {		\
-		.id = _id,						\
-		.name = _name,						\
-		.reg = _reg,						\
-		.pwr_reg = _pwr_reg,					\
-		.en_mask = _en_mask,					\
-		.flags = _flags,					\
-		.rst_bar_mask = CON0_MT7622_RST_BAR,			\
-		.fmax = MT7622_PLL_FMAX,				\
-		.pcwbits = _pcwbits,					\
-		.pd_reg = _pd_reg,					\
-		.pd_shift = _pd_shift,					\
-		.tuner_reg = _tuner_reg,				\
-		.pcw_reg = _pcw_reg,					\
-		.pcw_shift = _pcw_shift,				\
-		.div_table = _div_table,				\
-		.parent_name = _parent_name,				\
-	}
-
-#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,	\
-			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg,	\
-			_pcw_shift)					\
-	PLL_xtal(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,\
-		 _pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift,  \
-		 NULL, "clkxtal")
-
-#define GATE_APMIXED_AO(_id, _name, _parent, _shift)			\
-	GATE_MTK_FLAGS(_id, _name, _parent, &apmixed_cg_regs, _shift,	\
-		 &mtk_clk_gate_ops_no_setclr_inv, CLK_IS_CRITICAL)
-
 #define GATE_INFRA(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &infra_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -261,12 +225,6 @@ static const char * const peribus_ck_parents[] = {
 	"syspll1_d4"
 };
 
-static const struct mtk_gate_regs apmixed_cg_regs = {
-	.set_ofs = 0x8,
-	.clr_ofs = 0x8,
-	.sta_ofs = 0x8,
-};
-
 static const struct mtk_gate_regs infra_cg_regs = {
 	.set_ofs = 0x40,
 	.clr_ofs = 0x44,
@@ -297,31 +255,6 @@ static const struct mtk_gate_regs peri1_cg_regs = {
 	.sta_ofs = 0x1C,
 };
 
-static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0,
-	    PLL_AO, 21, 0x0204, 24, 0, 0x0204, 0),
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0210, 0x021C, 0,
-	    HAVE_RST_BAR, 21, 0x0214, 24, 0, 0x0214, 0),
-	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0220, 0x022C, 0,
-	    HAVE_RST_BAR, 7, 0x0224, 24, 0, 0x0224, 14),
-	PLL(CLK_APMIXED_ETH1PLL, "eth1pll", 0x0300, 0x0310, 0,
-	    0, 21, 0x0300, 1, 0, 0x0304, 0),
-	PLL(CLK_APMIXED_ETH2PLL, "eth2pll", 0x0314, 0x0320, 0,
-	    0, 21, 0x0314, 1, 0, 0x0318, 0),
-	PLL(CLK_APMIXED_AUD1PLL, "aud1pll", 0x0324, 0x0330, 0,
-	    0, 31, 0x0324, 1, 0, 0x0328, 0),
-	PLL(CLK_APMIXED_AUD2PLL, "aud2pll", 0x0334, 0x0340, 0,
-	    0, 31, 0x0334, 1, 0, 0x0338, 0),
-	PLL(CLK_APMIXED_TRGPLL, "trgpll", 0x0344, 0x0354, 0,
-	    0, 21, 0x0344, 1, 0, 0x0348, 0),
-	PLL(CLK_APMIXED_SGMIPLL, "sgmipll", 0x0358, 0x0368, 0,
-	    0, 21, 0x0358, 1, 0, 0x035C, 0),
-};
-
-static const struct mtk_gate apmixed_clks[] = {
-	GATE_APMIXED_AO(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
-};
-
 static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA(CLK_INFRA_DBGCLK_PD, "infra_dbgclk_pd", "axi_sel", 0),
 	GATE_INFRA(CLK_INFRA_TRNG, "trng_ck", "axi_sel", 2),
@@ -652,23 +585,6 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_apmixedsys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls),
-			      clk_data);
-
-	mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-			       ARRAY_SIZE(apmixed_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
 
 static int mtk_pericfg_init(struct platform_device *pdev)
 {
@@ -701,9 +617,6 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 
 static const struct of_device_id of_match_clk_mt7622[] = {
 	{
-		.compatible = "mediatek,mt7622-apmixedsys",
-		.data = mtk_apmixedsys_init,
-	}, {
 		.compatible = "mediatek,mt7622-infracfg",
 		.data = mtk_infrasys_init,
 	}, {
-- 
2.39.1


