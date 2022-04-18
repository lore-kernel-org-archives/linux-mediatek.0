Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F34BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jP75rZahU8YtXpxaP7OXI6E9ZESdXW+WJQGQnIxgUd0=; b=NLM8Mxplyuar+X
	VPoZIdPLn7+4nVZjY4diI8vEA2K0zexKe/hCvWPY+ebBRPKfaQusVl8gyysKNQ0U/a95Iyh8Ntw3/
	TuwXqM77vmUWPe+2TT8InhLgNhInc2ZOigJo9ZC0yNkP9EyoSHjysk4xPRO2pn8srbkuSt+V4hw7x
	S5M3a3uQbp8x3DCshhf9irMhhxDfempoGsSNzbgTPoDphStTA+HRd5csjjQjZGU+aKV0lTNYNmZZB
	cdgaNkGigXyOWvCkvie2gs1ZK+SGwMTKw9t104selN1W4vrH3KffxRTfnPLSMe+DoDH6XMv/Sw+lm
	5FxRyAjB3GOZcq27HdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngRdD-00H8js-Cs; Mon, 18 Apr 2022 13:41:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngRUZ-00H4pG-ET; Mon, 18 Apr 2022 13:32:38 +0000
X-UUID: 835b99ee98ef4b4aa46b7c630ebb6ef7-20220418
X-UUID: 835b99ee98ef4b4aa46b7c630ebb6ef7-20220418
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 110423032; Mon, 18 Apr 2022 06:32:27 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 06:22:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Apr 2022 21:22:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Apr 2022 21:22:23 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <yong.liang@mediatek.com>, <runyang.chen@mediatek.com>, 
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH 5/7] clk: mediatek: reset: Revise structure to control reset
 register
Date: Mon, 18 Apr 2022 21:21:52 +0800
Message-ID: <20220418132154.7401-6-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_063235_576009_250EEA0E 
X-CRM114-Status: GOOD (  14.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace the structure "struct mtk_reset" to reset.h, and rename it as
"mtk_clk_rst_data". We use it to input the resset register data and
store reset controller device.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt2701-eth.c |  9 +++-
 drivers/clk/mediatek/clk-mt2701-g3d.c |  9 +++-
 drivers/clk/mediatek/clk-mt2701-hif.c |  9 +++-
 drivers/clk/mediatek/clk-mt2701.c     | 19 +++++++-
 drivers/clk/mediatek/clk-mt2712.c     | 19 +++++++-
 drivers/clk/mediatek/clk-mt7622-eth.c |  9 +++-
 drivers/clk/mediatek/clk-mt7622-hif.c | 19 +++++++-
 drivers/clk/mediatek/clk-mt7622.c     | 19 +++++++-
 drivers/clk/mediatek/clk-mt7629-eth.c |  9 +++-
 drivers/clk/mediatek/clk-mt7629-hif.c | 19 +++++++-
 drivers/clk/mediatek/clk-mt8135.c     | 19 +++++++-
 drivers/clk/mediatek/clk-mt8173.c     | 19 +++++++-
 drivers/clk/mediatek/clk-mt8183.c     | 10 ++++-
 drivers/clk/mediatek/reset.c          | 62 +++++++++++++--------------
 drivers/clk/mediatek/reset.h          | 12 +++++-
 15 files changed, 209 insertions(+), 53 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701-eth.c b/drivers/clk/mediatek/clk-mt2701-eth.c
index 71257714e6a6..16fc4a50d513 100644
--- a/drivers/clk/mediatek/clk-mt2701-eth.c
+++ b/drivers/clk/mediatek/clk-mt2701-eth.c
@@ -36,6 +36,13 @@ static const struct mtk_gate eth_clks[] = {
 	GATE_ETH(CLK_ETHSYS_CRYPTO, "crypto_clk", "ethif_sel", 29),
 };
 
+static struct mtk_clk_rst_data clk_rst_data = {
+	.supported = true,
+	.version = MTK_RST_V1,
+	.reg_num = 1,
+	.reg_ofs = 0x34,
+};
+
 static const struct of_device_id of_match_clk_mt2701_eth[] = {
 	{ .compatible = "mediatek,mt2701-ethsys", },
 	{}
@@ -60,7 +67,7 @@ static int clk_mt2701_eth_probe(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 1, 0x34, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data);
 }
 
 static struct platform_driver clk_mt2701_eth_drv = {
diff --git a/drivers/clk/mediatek/clk-mt2701-g3d.c b/drivers/clk/mediatek/clk-mt2701-g3d.c
index f878ffba48a9..bdaa210813f4 100644
--- a/drivers/clk/mediatek/clk-mt2701-g3d.c
+++ b/drivers/clk/mediatek/clk-mt2701-g3d.c
@@ -35,6 +35,13 @@ static const struct mtk_gate g3d_clks[] = {
 	GATE_G3D(CLK_G3DSYS_CORE, "g3d_core", "mfg_sel", 0),
 };
 
+static struct mtk_clk_rst_data clk_rst_data = {
+	.supported = true,
+	.version = MTK_RST_V1,
+	.reg_num = 1,
+	.reg_ofs = 0xc,
+};
+
 static int clk_mt2701_g3dsys_init(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
@@ -54,7 +61,7 @@ static int clk_mt2701_g3dsys_init(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 1, 0xc, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data);
 }
 
 static const struct of_device_id of_match_clk_mt2701_g3d[] = {
diff --git a/drivers/clk/mediatek/clk-mt2701-hif.c b/drivers/clk/mediatek/clk-mt2701-hif.c
index ee53b227e99a..b79cf799d8f6 100644
--- a/drivers/clk/mediatek/clk-mt2701-hif.c
+++ b/drivers/clk/mediatek/clk-mt2701-hif.c
@@ -33,6 +33,13 @@ static const struct mtk_gate hif_clks[] = {
 	GATE_HIF(CLK_HIFSYS_PCIE2, "pcie2_clk", "ethpll_500m_ck", 26),
 };
 
+static struct mtk_clk_rst_data clk_rst_data = {
+	.supported = true,
+	.version = MTK_RST_V1,
+	.reg_num = 1,
+	.reg_ofs = 0x34,
+};
+
 static const struct of_device_id of_match_clk_mt2701_hif[] = {
 	{ .compatible = "mediatek,mt2701-hifsys", },
 	{}
@@ -57,7 +64,7 @@ static int clk_mt2701_hif_probe(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 1, 0x34, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data);
 }
 
 static struct platform_driver clk_mt2701_hif_drv = {
diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index c1100a20c7ed..a8ac3d11ced6 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -735,6 +735,21 @@ static const struct mtk_fixed_factor infra_fixed_divs[] = {
 	FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
 };
 
+static struct mtk_clk_rst_data clk_rst_data[] = {
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 2,
+		.reg_ofs = 0x30,
+	},
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 2,
+		.reg_ofs = 0x0,
+	},
+};
+
 static struct clk_onecell_data *infra_clk_data;
 
 static void __init mtk_infrasys_init_early(struct device_node *node)
@@ -785,7 +800,7 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	return mtk_clk_register_rst_ctrl(node, 2, 0x30, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data[0]);
 }
 
 static const struct mtk_gate_regs peri0_cg_regs = {
@@ -906,7 +921,7 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	return mtk_clk_register_rst_ctrl(node, 2, 0x0, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data[1]);
 }
 
 #define MT8590_PLL_FMAX		(2000 * MHZ)
diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index a8cfa85f06a1..cc92a54d84ce 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1258,6 +1258,21 @@ static const struct mtk_pll_data plls[] = {
 		0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
 };
 
+static struct mtk_clk_rst_data clk_rst_data[] = {
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 2,
+		.reg_ofs = 0x30,
+	},
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 2,
+		.reg_ofs = 0x0,
+	},
+};
+
 static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
@@ -1363,7 +1378,7 @@ static int clk_mt2712_infra_probe(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 2, 0x30, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data[0]);
 }
 
 static int clk_mt2712_peri_probe(struct platform_device *pdev)
@@ -1385,7 +1400,7 @@ static int clk_mt2712_peri_probe(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 2, 0, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data[1]);
 }
 
 static int clk_mt2712_mcu_probe(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt7622-eth.c b/drivers/clk/mediatek/clk-mt7622-eth.c
index 33359250fab3..2d5e00a3ae5b 100644
--- a/drivers/clk/mediatek/clk-mt7622-eth.c
+++ b/drivers/clk/mediatek/clk-mt7622-eth.c
@@ -65,6 +65,13 @@ static const struct mtk_gate sgmii_clks[] = {
 		   "ssusb_cdr_fb", 5),
 };
 
+static struct mtk_clk_rst_data clk_rst_data = {
+	.supported = true,
+	.version = MTK_RST_V1,
+	.reg_num = 1,
+	.reg_ofs = 0x34,
+};
+
 static int clk_mt7622_ethsys_init(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
@@ -84,7 +91,7 @@ static int clk_mt7622_ethsys_init(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 1, 0x34, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data);
 }
 
 static int clk_mt7622_sgmiisys_init(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt7622-hif.c b/drivers/clk/mediatek/clk-mt7622-hif.c
index 6be894299ae3..a10ecc5b88a1 100644
--- a/drivers/clk/mediatek/clk-mt7622-hif.c
+++ b/drivers/clk/mediatek/clk-mt7622-hif.c
@@ -76,6 +76,21 @@ static const struct mtk_gate pcie_clks[] = {
 	GATE_PCIE(CLK_SATA_PM_EN, "sata_pm_en", "univpll2_d4", 30),
 };
 
+static struct mtk_clk_rst_data clk_rst_data[] = {
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 1,
+		.reg_ofs = 0x34,
+	},
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 1,
+		.reg_ofs = 0x34,
+	},
+};
+
 static int clk_mt7622_ssusbsys_init(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
@@ -95,7 +110,7 @@ static int clk_mt7622_ssusbsys_init(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 1, 0x34, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data[0]);
 }
 
 static int clk_mt7622_pciesys_init(struct platform_device *pdev)
@@ -117,7 +132,7 @@ static int clk_mt7622_pciesys_init(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 1, 0x34, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data[1]);
 }
 
 static const struct of_device_id of_match_clk_mt7622_hif[] = {
diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index e8387df38798..cd5181a43132 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -610,6 +610,21 @@ static struct mtk_composite peri_muxes[] = {
 	MUX(CLK_PERIBUS_SEL, "peribus_ck_sel", peribus_ck_parents, 0x05C, 0, 1),
 };
 
+static struct mtk_clk_rst_data clk_rst_data[] = {
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 1,
+		.reg_ofs = 0x30,
+	},
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 2,
+		.reg_ofs = 0x0,
+	},
+};
+
 static int mtk_topckgen_init(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
@@ -663,7 +678,7 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	return mtk_clk_register_rst_ctrl(node, 1, 0x30, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data[0]);
 }
 
 static int mtk_apmixedsys_init(struct platform_device *pdev)
@@ -712,7 +727,7 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 
 	clk_prepare_enable(clk_data->clks[CLK_PERI_UART0_PD]);
 
-	return mtk_clk_register_rst_ctrl(node, 2, 0x0, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data[1]);
 }
 
 static const struct of_device_id of_match_clk_mt7622[] = {
diff --git a/drivers/clk/mediatek/clk-mt7629-eth.c b/drivers/clk/mediatek/clk-mt7629-eth.c
index bf1791efe05d..c0ff826a9769 100644
--- a/drivers/clk/mediatek/clk-mt7629-eth.c
+++ b/drivers/clk/mediatek/clk-mt7629-eth.c
@@ -76,6 +76,13 @@ static const struct mtk_gate sgmii_clks[2][4] = {
 	}
 };
 
+static struct mtk_clk_rst_data clk_rst_data = {
+	.supported = true,
+	.version = MTK_RST_V1,
+	.reg_num = 1,
+	.reg_ofs = 0x34,
+};
+
 static int clk_mt7629_ethsys_init(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
@@ -94,7 +101,7 @@ static int clk_mt7629_ethsys_init(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 1, 0x34, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data);
 }
 
 static int clk_mt7629_sgmiisys_init(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt7629-hif.c b/drivers/clk/mediatek/clk-mt7629-hif.c
index 23d22c69d47b..3b81b7e546a4 100644
--- a/drivers/clk/mediatek/clk-mt7629-hif.c
+++ b/drivers/clk/mediatek/clk-mt7629-hif.c
@@ -71,6 +71,21 @@ static const struct mtk_gate pcie_clks[] = {
 	GATE_PCIE(CLK_PCIE_P0_PIPE_EN, "pcie_p0_pipe_en", "pcie0_pipe_en", 23),
 };
 
+static struct mtk_clk_rst_data clk_rst_data[] = {
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 1,
+		.reg_ofs = 0x34,
+	},
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 1,
+		.reg_ofs = 0x34,
+	},
+};
+
 static int clk_mt7629_ssusbsys_init(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
@@ -90,7 +105,7 @@ static int clk_mt7629_ssusbsys_init(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 1, 0x34, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data[0]);
 }
 
 static int clk_mt7629_pciesys_init(struct platform_device *pdev)
@@ -112,7 +127,7 @@ static int clk_mt7629_pciesys_init(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 1, 0x34, MTK_RST_V1);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data[1]);
 }
 
 static const struct of_device_id of_match_clk_mt7629_hif[] = {
diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 68ce0866c5b7..272a201c13ca 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -514,6 +514,21 @@ static const struct mtk_composite peri_clks[] __initconst = {
 	MUX(CLK_PERI_UART3_SEL, "uart3_ck_sel", uart_ck_sel_parents, 0x40c, 3, 1),
 };
 
+static struct mtk_clk_rst_data clk_rst_data[] = {
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 2,
+		.reg_ofs = 0x30,
+	},
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 2,
+		.reg_ofs = 0x0,
+	}
+};
+
 static void __init mtk_topckgen_init(struct device_node *node)
 {
 	struct clk_onecell_data *clk_data;
@@ -561,7 +576,7 @@ static void __init mtk_infrasys_init(struct device_node *node)
 		return;
 	}
 
-	r = mtk_clk_register_rst_ctrl(node, 2, 0x30, MTK_RST_V1);
+	r = mtk_clk_register_rst_ctrl(node, &clk_rst_data[0]);
 }
 CLK_OF_DECLARE(mtk_infrasys, "mediatek,mt8135-infracfg", mtk_infrasys_init);
 
@@ -591,7 +606,7 @@ static void __init mtk_pericfg_init(struct device_node *node)
 		return;
 	}
 
-	r = mtk_clk_register_rst_ctrl(node, 2, 0, MTK_RST_V1);
+	r = mtk_clk_register_rst_ctrl(node, &clk_rst_data[1]);
 }
 CLK_OF_DECLARE(mtk_pericfg, "mediatek,mt8135-pericfg", mtk_pericfg_init);
 
diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index fd56dbe8ff95..56f324948a8c 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -819,6 +819,21 @@ static const struct mtk_gate venclt_clks[] __initconst = {
 	GATE_VENCLT(CLK_VENCLT_CKE1, "venclt_cke1", "venclt_sel", 4),
 };
 
+static struct mtk_clk_rst_data clk_rst_data[] = {
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 2,
+		.reg_ofs = 0x30,
+	},
+	{
+		.supported = true,
+		.version = MTK_RST_V1,
+		.reg_num = 2,
+		.reg_ofs = 0x0,
+	}
+};
+
 static struct clk_onecell_data *mt8173_top_clk_data __initdata;
 static struct clk_onecell_data *mt8173_pll_clk_data __initdata;
 
@@ -884,7 +899,7 @@ static void __init mtk_infrasys_init(struct device_node *node)
 		return;
 	}
 
-	r = mtk_clk_register_rst_ctrl(node, 2, 0x30, MTK_RST_V1);
+	r = mtk_clk_register_rst_ctrl(node, &clk_rst_data[0]);
 }
 CLK_OF_DECLARE(mtk_infrasys, "mediatek,mt8173-infracfg", mtk_infrasys_init);
 
@@ -914,7 +929,7 @@ static void __init mtk_pericfg_init(struct device_node *node)
 		return;
 	}
 
-	r = mtk_clk_register_rst_ctrl(node, 2, 0, MTK_RST_V1);
+	r = mtk_clk_register_rst_ctrl(node, &clk_rst_data[1]);
 }
 CLK_OF_DECLARE(mtk_pericfg, "mediatek,mt8173-pericfg", mtk_pericfg_init);
 
diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index e796af76f960..adf78d882c72 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1153,6 +1153,13 @@ static const struct mtk_pll_data plls[] = {
 		0, 0, 32, 8, 0x02B4, 1, 0x02BC, 0x0014, 1, 0x02B8, 0, 0x02B4),
 };
 
+static struct mtk_clk_rst_data clk_rst_data = {
+	.supported = true,
+	.version = MTK_RST_V2,
+	.reg_num = 4,
+	.reg_ofs = INFRA_RST0_SET_OFFSET,
+};
+
 static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
@@ -1239,8 +1246,7 @@ static int clk_mt8183_infra_probe(struct platform_device *pdev)
 		return r;
 	}
 
-	return mtk_clk_register_rst_ctrl(node, 4,
-					 INFRA_RST0_SET_OFFSET, MTK_RST_V2);
+	return mtk_clk_register_rst_ctrl(node, &clk_rst_data);
 }
 
 static int clk_mt8183_peri_probe(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 2a55e8bf6b28..709ae54efc18 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -13,49 +13,51 @@
 
 #include "clk-mtk.h"
 
-struct mtk_reset {
-	struct regmap *regmap;
-	int regofs;
-	struct reset_controller_dev rcdev;
-};
-
 static int mtk_reset_assert_v1(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
-	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
+	struct mtk_clk_rst_data *data = container_of(rcdev,
+						     struct mtk_clk_rst_data,
+						     rcdev);
 
 	return regmap_update_bits(data->regmap,
-				  data->regofs + ((id / 32) << 2),
+				  data->reg_ofs + ((id / 32) << 2),
 				  BIT(id % 32), ~0);
 }
 
 static int mtk_reset_deassert_v1(struct reset_controller_dev *rcdev,
 				 unsigned long id)
 {
-	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
+	struct mtk_clk_rst_data *data = container_of(rcdev,
+						     struct mtk_clk_rst_data,
+						     rcdev);
 
 	return regmap_update_bits(data->regmap,
-				  data->regofs + ((id / 32) << 2),
+				  data->reg_ofs + ((id / 32) << 2),
 				  BIT(id % 32), 0);
 }
 
 static int mtk_reset_assert_v2(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
-	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
+	struct mtk_clk_rst_data *data = container_of(rcdev,
+						     struct mtk_clk_rst_data,
+						     rcdev);
 
 	return regmap_write(data->regmap,
-			    data->regofs + ((id / 32) << 4),
+			    data->reg_ofs + ((id / 32) << 4),
 			    BIT(id % 32));
 }
 
 static int mtk_reset_deassert_v2(struct reset_controller_dev *rcdev,
 				 unsigned long id)
 {
-	struct mtk_reset *data = container_of(rcdev, struct mtk_reset, rcdev);
+	struct mtk_clk_rst_data *data = container_of(rcdev,
+						     struct mtk_clk_rst_data,
+						     rcdev);
 
 	return regmap_write(data->regmap,
-			    data->regofs + ((id / 32) << 4) + 0x4,
+			    data->reg_ofs + ((id / 32) << 4) + 0x4,
 			    BIT(id % 32));
 }
 
@@ -100,14 +102,18 @@ static const struct reset_control_ops *rst_op[MTK_RST_MAX] = {
 };
 
 int mtk_clk_register_rst_ctrl(struct device_node *np,
-			      u32 reg_num, u16 reg_ofs, u8 version)
+			      struct mtk_clk_rst_data *clk_rst)
 {
-	struct mtk_reset *data;
-	int ret;
 	struct regmap *regmap;
+	int ret;
 
-	if (version >= MTK_RST_MAX) {
-		pr_err("Error version number: %d\n", version);
+	if (!clk_rst) {
+		pr_err("mtk clock reset data is NULL\n");
+		return -EINVAL;
+	}
+
+	if (clk_rst->version >= MTK_RST_MAX) {
+		pr_err("Error version number: %d\n", clk_rst->version);
 		return -EINVAL;
 	}
 
@@ -117,21 +123,15 @@ int mtk_clk_register_rst_ctrl(struct device_node *np,
 		return -EINVAL;
 	}
 
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->regmap = regmap;
-	data->regofs = reg_ofs;
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = reg_num * 32;
-	data->rcdev.ops = rst_op[version];
-	data->rcdev.of_node = np;
+	clk_rst->regmap = regmap;
+	clk_rst->rcdev.owner = THIS_MODULE;
+	clk_rst->rcdev.nr_resets = clk_rst->reg_num * 32;
+	clk_rst->rcdev.ops = rst_op[clk_rst->version];
+	clk_rst->rcdev.of_node = np;
 
-	ret = reset_controller_register(&data->rcdev);
+	ret = reset_controller_register(&clk_rst->rcdev);
 	if (ret) {
 		pr_err("could not register reset controller: %d\n", ret);
-		kfree(data);
 		return -EINVAL;
 	}
 
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 0af77531b918..851a29c92440 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -6,6 +6,7 @@
 #ifndef __DRV_CLK_MTK_RESET_H
 #define __DRV_CLK_MTK_RESET_H
 
+#include <linux/reset-controller.h>
 #include <linux/types.h>
 
 enum mtk_reset_version {
@@ -14,7 +15,16 @@ enum mtk_reset_version {
 	MTK_RST_MAX,
 };
 
+struct mtk_clk_rst_data {
+	struct reset_controller_dev rcdev;
+	struct regmap *regmap;
+	bool supported;
+	u8 version;
+	u32 reg_num;
+	u16 reg_ofs;
+};
+
 int mtk_clk_register_rst_ctrl(struct device_node *np,
-			      u32 reg_num, u16 reg_ofs, u8 version);
+			      struct mtk_clk_rst_data *clk_rst);
 
 #endif /* __DRV_CLK_MTK_RESET_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
