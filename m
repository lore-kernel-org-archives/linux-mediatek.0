Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB96C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HktwwgWki2qip+Ixww9hI+jxXkMfQycx3tXKWu9qcrE=; b=1rsLyu6/8+Xzatnwgda268HOkB
	h9vSUq8jznQXkI64c6iCdyWRWYrKhJ1yxvXccqdaA+Lf91hNyoJdLOm4NLmdjgmwbHTvuFgQi7ZpU
	TcYnswtwdksL/CSVurLsVydsSb2gH5QHQyHndlRUR3qZL0oDoORXG/Cz5ZdhlYul13O0zsAcm7l4q
	8IAAsY+s/N+sNV4ywL80cQb6+ii21Wk/4u6zHAW/rH2I/D5E9nPFRN7egswoRfnwLJP0iP3VHLM3t
	9iUcFJkkUUGjK2qTagDHboQJZIHe3oqDug/7Z61ixc6qqRihFkpfGj+OtKmOEdvAPi0UX9GC9hWdm
	zMYKKFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBA45-0070Ct-Bv; Fri, 30 Dec 2022 07:44:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9uh-006viQ-Gr; Fri, 30 Dec 2022 07:34:54 +0000
X-UUID: 3b35e9a598ca4c21a182279406d96bc8-20221230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HktwwgWki2qip+Ixww9hI+jxXkMfQycx3tXKWu9qcrE=;
	b=QdUSJhsMM6E1yFD6EKkQAXlg91HLSCKJ5r8N4Igh/6OMf3c2IPSBDsbHHIG7e67oWXfNt6oDx1GGVIAPU7fagkTmyrV6VssVmSrL6Lt9EBHVCD9Yn0/V6cqnAlxcfcA1WjBxc1XPPbxqKJY4kn+ozNbzPf4MCYjFDYpNZAJaUR8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:2cd37cea-664a-45c5-a042-68a32734f517,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:09771b1,CLOUDID:59173953-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 3b35e9a598ca4c21a182279406d96bc8-20221230
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1652274085; Fri, 30 Dec 2022 00:34:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Dec 2022 15:33:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Dec 2022 15:33:59 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v3 02/19] clk: mediatek: Add MT8188 apmixedsys clock support
Date: Fri, 30 Dec 2022 15:33:40 +0800
Message-ID: <20221230073357.18503-3-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
References: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_233447_911573_ECC2F8E2 
X-CRM114-Status: GOOD (  17.88  )
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

Add MT8188 apmixedsys clock controller which provides Plls
generated from SoC 26m and ssusb clock gate control.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Kconfig                 |  11 ++
 drivers/clk/mediatek/Makefile                |   1 +
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 154 +++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-apmixedsys.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 22e8e79475ee..f02b679f71d0 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -565,6 +565,17 @@ config COMMON_CLK_MT8186
 	help
 	  This driver supports MediaTek MT8186 clocks.
 
+config COMMON_CLK_MT8188
+	bool "Clock driver for MediaTek MT8188"
+	depends on ARM64 || COMPILE_TEST
+	select COMMON_CLK_MEDIATEK
+	default ARCH_MEDIATEK
+	help
+	  This driver supports MediaTek MT8188 basic clocks and clocks
+	  required for various peripheral found on MediaTek. Choose
+	  M or Y here if you want to use clocks such as peri_ao,
+	  infra_ao, etc.
+
 config COMMON_CLK_MT8192
 	bool "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index e24080fd6e7f..13ab8deb362c 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 				   clk-mt8186-mfg.o clk-mt8186-mm.o clk-mt8186-wpe.o \
 				   clk-mt8186-img.o clk-mt8186-vdec.o clk-mt8186-venc.o \
 				   clk-mt8186-cam.o clk-mt8186-mdp.o clk-mt8186-ipe.o
+obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
new file mode 100644
index 000000000000..8d73ae3a0da8
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Garmin Chang <garmin.chang@mediatek.com>
+
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
+
+static const struct mtk_gate_regs apmixed_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_APMIXED(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &apmixed_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate apmixed_clks[] = {
+	GATE_APMIXED(CLK_APMIXED_PLL_SSUSB26M_EN, "pll_ssusb26m_en", "clk26m", 1),
+};
+
+#define MT8188_PLL_FMAX		(3800UL * MHZ)
+#define MT8188_PLL_FMIN		(1500UL * MHZ)
+#define MT8188_INTEGER_BITS	8
+
+#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,		\
+	    _rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,		\
+	    _tuner_reg, _tuner_en_reg, _tuner_en_bit,			\
+	    _pcw_reg, _pcw_shift, _pcw_chg_reg,				\
+	    _en_reg, _pll_en_bit) {					\
+		.id = _id,						\
+		.name = _name,						\
+		.reg = _reg,						\
+		.pwr_reg = _pwr_reg,					\
+		.en_mask = _en_mask,					\
+		.flags = _flags,					\
+		.rst_bar_mask = _rst_bar_mask,				\
+		.fmax = MT8188_PLL_FMAX,				\
+		.fmin = MT8188_PLL_FMIN,				\
+		.pcwbits = _pcwbits,					\
+		.pcwibits = MT8188_INTEGER_BITS,			\
+		.pd_reg = _pd_reg,					\
+		.pd_shift = _pd_shift,					\
+		.tuner_reg = _tuner_reg,				\
+		.tuner_en_reg = _tuner_en_reg,				\
+		.tuner_en_bit = _tuner_en_bit,				\
+		.pcw_reg = _pcw_reg,					\
+		.pcw_shift = _pcw_shift,				\
+		.pcw_chg_reg = _pcw_chg_reg,				\
+		.en_reg = _en_reg,					\
+		.pll_en_bit = _pll_en_bit,				\
+	}
+
+static const struct mtk_pll_data plls[] = {
+	PLL(CLK_APMIXED_ETHPLL, "ethpll", 0x044C, 0x0458, 0,
+	    0, 0, 22, 0x0450, 24, 0, 0, 0, 0x0450, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0514, 0x0520, 0,
+	    0, 0, 22, 0x0518, 24, 0, 0, 0, 0x0518, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_TVDPLL1, "tvdpll1", 0x0524, 0x0530, 0,
+	    0, 0, 22, 0x0528, 24, 0, 0, 0, 0x0528, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_TVDPLL2, "tvdpll2", 0x0534, 0x0540, 0,
+	    0, 0, 22, 0x0538, 24, 0, 0, 0, 0x0538, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0544, 0x0550, 0xff000000,
+	    HAVE_RST_BAR, BIT(23), 22, 0x0548, 24, 0, 0, 0, 0x0548, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x045C, 0x0468, 0xff000000,
+	    HAVE_RST_BAR, BIT(23), 22, 0x0460, 24, 0, 0, 0, 0x0460, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_IMGPLL, "imgpll", 0x0554, 0x0560, 0,
+	    0, 0, 22, 0x0558, 24, 0, 0, 0, 0x0558, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0504, 0x0510, 0xff000000,
+	    HAVE_RST_BAR, BIT(23), 22, 0x0508, 24, 0, 0, 0, 0x0508, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_ADSPPLL, "adsppll", 0x042C, 0x0438, 0,
+	    0, 0, 22, 0x0430, 24, 0, 0, 0, 0x0430, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x0304, 0x0314, 0,
+	    0, 0, 32, 0x0308, 24, 0x0034, 0x0000, 12, 0x030C, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x0318, 0x0328, 0,
+	    0, 0, 32, 0x031C, 24, 0x0038, 0x0000, 13, 0x0320, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_APLL3, "apll3", 0x032C, 0x033C, 0,
+	    0, 0, 32, 0x0330, 24, 0x003C, 0x0000, 14, 0x0334, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_APLL4, "apll4", 0x0404, 0x0414, 0,
+	    0, 0, 32, 0x0408, 24, 0x0040, 0x0000, 15, 0x040C, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_APLL5, "apll5", 0x0418, 0x0428, 0,
+	    0, 0, 32, 0x041C, 24, 0x0044, 0x0000, 16, 0x0420, 0, 0, 0, 9),
+	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x0340, 0x034C, 0,
+	    0, 0, 22, 0x0344, 24, 0, 0, 0, 0x0344, 0, 0, 0, 9),
+};
+
+static const struct of_device_id of_match_clk_mt8188_apmixed[] = {
+	{ .compatible = "mediatek,mt8188-apmixedsys", },
+	{}
+};
+
+static int clk_mt8188_apmixed_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	if (r)
+		goto free_apmixed_data;
+
+	r = mtk_clk_register_gates_with_dev(node, apmixed_clks,
+		ARRAY_SIZE(apmixed_clks), clk_data, NULL);
+	if (r)
+		goto unregister_plls;
+
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (r)
+		goto unregister_gates;
+
+	platform_set_drvdata(pdev, clk_data);
+
+	return r;
+
+unregister_gates:
+	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+unregister_plls:
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+free_apmixed_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static int clk_mt8188_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
+static struct platform_driver clk_mt8188_apmixed_drv = {
+	.probe = clk_mt8188_apmixed_probe,
+	.remove = clk_mt8188_apmixed_remove,
+	.driver = {
+		.name = "clk-mt8188-apmixed",
+		.of_match_table = of_match_clk_mt8188_apmixed,
+	},
+};
+builtin_platform_driver(clk_mt8188_apmixed_drv);
-- 
2.18.0


