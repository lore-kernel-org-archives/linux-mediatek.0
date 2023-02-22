Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C477BC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+hcyX18vbib74NMeaiBwsCDRfWE6QflHgsJyAcOy20=; b=dz9iWslN/wyGo0qjNhPBwnym0T
	iYpf1ZYnmYfEBcShwOUP4msIOxrQCR3nLOjtXgP9Rn0YIDqzqfK73mQP0FinABJVDpoZuyaXDnC7c
	UUO6B37SuIj8JhaJVegMz4K8BzoClK8aSiuX2nXNpwCvBCbO5033J01BShGQJzwPcTvxoANRSa41M
	j17OksD7ISK4f5cw8HzYGwWLwoc51AtuYqoRM8UewCu0PLaIHHVw2OxX/69lNR7ee8Pl/ctr/8F92
	6asKGrm7oNUwxU3VUjAf5lYnayh6tEYqMjxF253w2rc/oa4Mk2oFhsiMxQ9Y2H+lHZ9PA5wYCYF6O
	PYE1WI+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtZN-00DNqN-PG; Wed, 22 Feb 2023 18:10:21 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtZB-00DNi6-EJ; Wed, 22 Feb 2023 18:10:11 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pUtZA-0008LQ-0d;
	Wed, 22 Feb 2023 19:10:08 +0100
Date: Wed, 22 Feb 2023 18:10:03 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH RFC 4/4] clk: mediatek: de-duplicate MT7981 and MT7986 clock
 drivers
Message-ID: <86cc16f19e923cce5ed13c962d0f541fcd694009.1677089171.git.daniel@makrotopia.org>
References: <cover.1677089171.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677089171.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_101009_667860_B73A9FF5 
X-CRM114-Status: GOOD (  21.15  )
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

The MediaTek MT7981 and MT7986 SoCs have identical apmixed and ethsys
clocks. De-duplicate the drivers in favor of sharing code on these two
SoCs.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/Kconfig              |  16 +--
 drivers/clk/mediatek/Makefile             |   3 +-
 drivers/clk/mediatek/clk-mt7981-apmixed.c | 104 -------------------
 drivers/clk/mediatek/clk-mt7981-eth.c     | 119 ----------------------
 drivers/clk/mediatek/clk-mt7986-apmixed.c |   1 +
 drivers/clk/mediatek/clk-mt7986-eth.c     |   3 +
 6 files changed, 9 insertions(+), 237 deletions(-)
 delete mode 100644 drivers/clk/mediatek/clk-mt7981-apmixed.c
 delete mode 100644 drivers/clk/mediatek/clk-mt7981-eth.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 7a12aefb1d0b6..f928f39a064cb 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -397,14 +397,6 @@ config COMMON_CLK_MT7981
 	  This driver supports MediaTek MT7981 basic clocks and clocks
 	  required for various peripherals found on this SoC.
 
-config COMMON_CLK_MT7981_ETHSYS
-	tristate "Clock driver for MediaTek MT7981 ETHSYS"
-	depends on COMMON_CLK_MT7981
-	default COMMON_CLK_MT7981
-	help
-	  This driver adds support for clocks for Ethernet and SGMII
-	  required on MediaTek MT7981 SoC.
-
 config COMMON_CLK_MT7986
 	tristate "Clock driver for MediaTek MT7986"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
@@ -415,12 +407,12 @@ config COMMON_CLK_MT7986
 	  required for various peripherals found on MediaTek.
 
 config COMMON_CLK_MT7986_ETHSYS
-	tristate "Clock driver for MediaTek MT7986 ETHSYS"
-	depends on COMMON_CLK_MT7986
-	default COMMON_CLK_MT7986
+	tristate "Clock driver for MediaTek MT7981 and MT7986 ETHSYS"
+	depends on COMMON_CLK_MT7981 || COMMON_CLK_MT7986
+	default COMMON_CLK_MT7981 || COMMON_CLK_MT7986
 	help
 	  This driver adds support for clocks for Ethernet and SGMII
-	  required on MediaTek MT7986 SoC.
+	  required on MediaTek MT7981 and MT7986 SoC.
 
 config COMMON_CLK_MT8135
 	tristate "Clock driver for MediaTek MT8135"
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 228cb3e3a4c4e..77a13f0a6fd6a 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -54,10 +54,9 @@ obj-$(CONFIG_COMMON_CLK_MT7622_AUDSYS) += clk-mt7622-aud.o
 obj-$(CONFIG_COMMON_CLK_MT7629) += clk-mt7629.o
 obj-$(CONFIG_COMMON_CLK_MT7629_ETHSYS) += clk-mt7629-eth.o
 obj-$(CONFIG_COMMON_CLK_MT7629_HIFSYS) += clk-mt7629-hif.o
-obj-$(CONFIG_COMMON_CLK_MT7981) += clk-mt7981-apmixed.o
+obj-$(CONFIG_COMMON_CLK_MT7981) += clk-mt7986-apmixed.o
 obj-$(CONFIG_COMMON_CLK_MT7981) += clk-mt7981-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT7981) += clk-mt7981-infracfg.o
-obj-$(CONFIG_COMMON_CLK_MT7981_ETHSYS) += clk-mt7981-eth.o
 obj-$(CONFIG_COMMON_CLK_MT7986) += clk-mt7986-apmixed.o
 obj-$(CONFIG_COMMON_CLK_MT7986) += clk-mt7986-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT7986) += clk-mt7986-infracfg.o
diff --git a/drivers/clk/mediatek/clk-mt7981-apmixed.c b/drivers/clk/mediatek/clk-mt7981-apmixed.c
deleted file mode 100644
index 875813d8b4a9c..0000000000000
--- a/drivers/clk/mediatek/clk-mt7981-apmixed.c
+++ /dev/null
@@ -1,104 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2021 MediaTek Inc.
- * Author: Sam Shih <sam.shih@mediatek.com>
- * Author: Wenzhen Yu <wenzhen.yu@mediatek.com>
- * Author: Jianhui Zhao <zhaojh329@gmail.com>
- * Author: Daniel Golle <daniel@makrotopia.org>
- */
-
-#include <linux/clk-provider.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-
-#include "clk-gate.h"
-#include "clk-mtk.h"
-#include "clk-mux.h"
-#include "clk-pll.h"
-
-#include <dt-bindings/clock/mediatek,mt7981-clk.h>
-#include <linux/clk.h>
-
-#define MT7981_PLL_FMAX (2500UL * MHZ)
-#define CON0_MT7981_RST_BAR BIT(27)
-
-#define PLL_xtal(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,       \
-		 _pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift,         \
-		 _div_table, _parent_name)                                     \
-	{                                                                      \
-		.id = _id, .name = _name, .reg = _reg, .pwr_reg = _pwr_reg,    \
-		.en_mask = _en_mask, .flags = _flags,                          \
-		.rst_bar_mask = CON0_MT7981_RST_BAR, .fmax = MT7981_PLL_FMAX,  \
-		.pcwbits = _pcwbits, .pd_reg = _pd_reg, .pd_shift = _pd_shift, \
-		.tuner_reg = _tuner_reg, .pcw_reg = _pcw_reg,                  \
-		.pcw_shift = _pcw_shift, .div_table = _div_table,              \
-		.parent_name = _parent_name,                                   \
-	}
-
-#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits, _pd_reg,   \
-	    _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift)                       \
-	PLL_xtal(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,       \
-		 _pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift, NULL,   \
-		 "clkxtal")
-
-static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x00000001, PLL_AO,
-	    32, 0x0200, 4, 0, 0x0204, 0),
-	PLL(CLK_APMIXED_NET2PLL, "net2pll", 0x0210, 0x021C, 0x00000001, 0, 32,
-	    0x0210, 4, 0, 0x0214, 0),
-	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0220, 0x022C, 0x00000001, 0, 32,
-	    0x0220, 4, 0, 0x0224, 0),
-	PLL(CLK_APMIXED_SGMPLL, "sgmpll", 0x0230, 0x023C, 0x00000001, 0, 32,
-	    0x0230, 4, 0, 0x0234, 0),
-	PLL(CLK_APMIXED_WEDMCUPLL, "wedmcupll", 0x0240, 0x024C, 0x00000001, 0, 32,
-	    0x0240, 4, 0, 0x0244, 0),
-	PLL(CLK_APMIXED_NET1PLL, "net1pll", 0x0250, 0x025C, 0x00000001, 0, 32,
-	    0x0250, 4, 0, 0x0254, 0),
-	PLL(CLK_APMIXED_MPLL, "mpll", 0x0260, 0x0270, 0x00000001, 0, 32,
-	    0x0260, 4, 0, 0x0264, 0),
-	PLL(CLK_APMIXED_APLL2, "apll2", 0x0278, 0x0288, 0x00000001, 0, 32,
-	    0x0278, 4, 0, 0x027C, 0),
-};
-
-static const struct of_device_id of_match_clk_mt7981_apmixed[] = {
-	{ .compatible = "mediatek,mt7981-apmixedsys", },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_apmixed);
-
-static int clk_mt7981_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_apmixed_data;
-	}
-	return r;
-
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static struct platform_driver clk_mt7981_apmixed_drv = {
-	.probe = clk_mt7981_apmixed_probe,
-	.driver = {
-		.name = "clk-mt7981-apmixed",
-		.of_match_table = of_match_clk_mt7981_apmixed,
-	},
-};
-builtin_platform_driver(clk_mt7981_apmixed_drv);
-MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt7981-eth.c b/drivers/clk/mediatek/clk-mt7981-eth.c
deleted file mode 100644
index b1f256b5ed4e7..0000000000000
--- a/drivers/clk/mediatek/clk-mt7981-eth.c
+++ /dev/null
@@ -1,119 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2021 MediaTek Inc.
- * Author: Sam Shih <sam.shih@mediatek.com>
- * Author: Wenzhen Yu <wenzhen.yu@mediatek.com>
- * Author: Jianhui Zhao <zhaojh329@gmail.com>
- * Author: Daniel Golle <daniel@makrotopia.org>
- */
-
-#include <linux/clk-provider.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-
-#include "clk-mtk.h"
-#include "clk-gate.h"
-
-#include <dt-bindings/clock/mediatek,mt7981-clk.h>
-
-static const struct mtk_gate_regs sgmii0_cg_regs = {
-	.set_ofs = 0xE4,
-	.clr_ofs = 0xE4,
-	.sta_ofs = 0xE4,
-};
-
-#define GATE_SGMII0(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &sgmii0_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
-	}
-
-static const struct mtk_gate sgmii0_clks[] __initconst = {
-	GATE_SGMII0(CLK_SGM0_TX_EN, "sgm0_tx_en", "usb_tx250m", 2),
-	GATE_SGMII0(CLK_SGM0_RX_EN, "sgm0_rx_en", "usb_eq_rx250m", 3),
-	GATE_SGMII0(CLK_SGM0_CK0_EN, "sgm0_ck0_en", "usb_ln0", 4),
-	GATE_SGMII0(CLK_SGM0_CDR_CK0_EN, "sgm0_cdr_ck0_en", "usb_cdr", 5),
-};
-
-static const struct mtk_gate_regs sgmii1_cg_regs = {
-	.set_ofs = 0xE4,
-	.clr_ofs = 0xE4,
-	.sta_ofs = 0xE4,
-};
-
-#define GATE_SGMII1(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &sgmii1_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
-	}
-
-static const struct mtk_gate sgmii1_clks[] __initconst = {
-	GATE_SGMII1(CLK_SGM1_TX_EN, "sgm1_tx_en", "usb_tx250m", 2),
-	GATE_SGMII1(CLK_SGM1_RX_EN, "sgm1_rx_en", "usb_eq_rx250m", 3),
-	GATE_SGMII1(CLK_SGM1_CK1_EN, "sgm1_ck1_en", "usb_ln0", 4),
-	GATE_SGMII1(CLK_SGM1_CDR_CK1_EN, "sgm1_cdr_ck1_en", "usb_cdr", 5),
-};
-
-static const struct mtk_gate_regs eth_cg_regs = {
-	.set_ofs = 0x30,
-	.clr_ofs = 0x30,
-	.sta_ofs = 0x30,
-};
-
-#define GATE_ETH(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &eth_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
-	}
-
-static const struct mtk_gate eth_clks[] __initconst = {
-	GATE_ETH(CLK_ETH_FE_EN, "eth_fe_en", "netsys_2x", 6),
-	GATE_ETH(CLK_ETH_GP2_EN, "eth_gp2_en", "sgm_325m", 7),
-	GATE_ETH(CLK_ETH_GP1_EN, "eth_gp1_en", "sgm_325m", 8),
-	GATE_ETH(CLK_ETH_WOCPU0_EN, "eth_wocpu0_en", "netsys_wed_mcu", 15),
-};
-
-static const struct mtk_clk_desc eth_desc = {
-	.clks = eth_clks,
-	.num_clks = ARRAY_SIZE(eth_clks),
-};
-
-static const struct mtk_clk_desc sgmii0_desc = {
-	.clks = sgmii0_clks,
-	.num_clks = ARRAY_SIZE(sgmii0_clks),
-};
-
-static const struct mtk_clk_desc sgmii1_desc = {
-	.clks = sgmii1_clks,
-	.num_clks = ARRAY_SIZE(sgmii1_clks),
-};
-
-static const struct of_device_id of_match_clk_mt7981_eth[] = {
-	{ .compatible = "mediatek,mt7981-ethsys", .data = &eth_desc },
-	{ .compatible = "mediatek,mt7981-sgmiisys_0", .data = &sgmii0_desc },
-	{ .compatible = "mediatek,mt7981-sgmiisys_1", .data = &sgmii1_desc },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_eth);
-
-static struct platform_driver clk_mt7981_eth_drv = {
-	.probe = mtk_clk_simple_probe,
-	.remove = mtk_clk_simple_remove,
-	.driver = {
-		.name = "clk-mt7981-eth",
-		.of_match_table = of_match_clk_mt7981_eth,
-	},
-};
-module_platform_driver(clk_mt7981_eth_drv);
-MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index 89112c1c476e1..e3186734a46a0 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -61,6 +61,7 @@ static const struct mtk_pll_data plls[] = {
 };
 
 static const struct of_device_id of_match_clk_mt7986_apmixed[] = {
+	{ .compatible = "mediatek,mt7981-apmixedsys", },
 	{ .compatible = "mediatek,mt7986-apmixedsys", },
 	{ }
 };
diff --git a/drivers/clk/mediatek/clk-mt7986-eth.c b/drivers/clk/mediatek/clk-mt7986-eth.c
index aace5a9f0f1f4..c2587009bf150 100644
--- a/drivers/clk/mediatek/clk-mt7986-eth.c
+++ b/drivers/clk/mediatek/clk-mt7986-eth.c
@@ -81,6 +81,9 @@ static const struct mtk_clk_desc sgmii1_desc = {
 };
 
 static const struct of_device_id of_match_clk_mt7986_eth[] = {
+	{ .compatible = "mediatek,mt7981-ethsys", .data = &eth_desc },
+	{ .compatible = "mediatek,mt7981-sgmiisys_0", .data = &sgmii0_desc },
+	{ .compatible = "mediatek,mt7981-sgmiisys_1", .data = &sgmii1_desc },
 	{ .compatible = "mediatek,mt7986-ethsys", .data = &eth_desc },
 	{ .compatible = "mediatek,mt7986-sgmiisys_0", .data = &sgmii0_desc },
 	{ .compatible = "mediatek,mt7986-sgmiisys_1", .data = &sgmii1_desc },
-- 
2.39.2


