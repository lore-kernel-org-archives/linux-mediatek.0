Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0502DC3DA7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 07:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5pNvEUWLe4foJ4XiwUhLmSCYu35anxnndwHiSm+4D4=; b=1h9NhPihS10CxjgPPbORlAgsFb
	g+hlitZRCrO3xwkD0EZXY/H0xMpqZ+jpxOWorcuUVEnY1eH//hy/ea2MQiCmVfe6fdmltGfGqNHT5
	QxYhZrfGr4EsFPZb5iVVIocok56bCX6zxXsfERBN5BoDAzVkqn5O34CZuzYwrMrU4GLgUAvreFub6
	txt5eunR0B4HBG7FMPKrz0pcz8Mz3ewQutzyRmumsqHQY1D+jKG4p4IvoxwrpMecq9O8Q7Ppoh0qx
	yGFEzlyc6RdK+EAGD6bUE3kTUScBHuGyEykj+kWe0Mwi65s48EDAIWEz1cs/cENgmp3PChpqmPDBi
	c848lvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9wC-006wUG-L4; Fri, 30 Dec 2022 07:36:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9uh-006vi1-GX; Fri, 30 Dec 2022 07:34:51 +0000
X-UUID: e0ad94940299402c9785ce844d944778-20221230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=x5pNvEUWLe4foJ4XiwUhLmSCYu35anxnndwHiSm+4D4=;
	b=KbCfOVFq49z+t+R95tFa3XZIZGmqE17f6xYaljTiVto3hsDMiPMBSrFP+N/Q81q+nJ6DF9L2LrImGJcHxx1MIiA3UKMgH46eT1n3kBKQPA828MDWmbKiQ3lsKB5gANZItknsLcmkaDsM1OF708fbT33+9oJMVYCPWbtW5Y7zzIw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:016b7f4d-d67f-4720-b3a2-b2c59bee5163,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:09771b1,CLOUDID:58173953-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: e0ad94940299402c9785ce844d944778-20221230
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 491497370; Fri, 30 Dec 2022 00:34:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 30 Dec 2022 15:34:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Dec 2022 15:34:01 +0800
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
Subject: [PATCH v3 17/19] clk: mediatek: Add MT8188 wpesys clock support
Date: Fri, 30 Dec 2022 15:33:55 +0800
Message-ID: <20221230073357.18503-18-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
References: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_233447_901478_AAE67CE2 
X-CRM114-Status: GOOD (  15.85  )
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

Add MT8188 wpesys clock controllers which provide clock gate
control in Wrapping Engine.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile         |   2 +-
 drivers/clk/mediatek/clk-mt8188-wpe.c | 101 ++++++++++++++++++++++++++
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-wpe.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 37663de293bf..ed35546819a9 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -88,7 +88,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
 				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
 				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
 				   clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o \
-				   clk-mt8188-vpp0.o clk-mt8188-vpp1.o
+				   clk-mt8188-vpp0.o clk-mt8188-vpp1.o clk-mt8188-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-wpe.c b/drivers/clk/mediatek/clk-mt8188-wpe.c
new file mode 100644
index 000000000000..d104402ae80b
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-wpe.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Garmin Chang <garmin.chang@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs wpe_top_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs wpe_vpp0_0_cg_regs = {
+	.set_ofs = 0x58,
+	.clr_ofs = 0x58,
+	.sta_ofs = 0x58,
+};
+
+static const struct mtk_gate_regs wpe_vpp0_1_cg_regs = {
+	.set_ofs = 0x5c,
+	.clr_ofs = 0x5c,
+	.sta_ofs = 0x5c,
+};
+
+#define GATE_WPE_TOP(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &wpe_top_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+#define GATE_WPE_VPP0_0(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &wpe_vpp0_0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+#define GATE_WPE_VPP0_1(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &wpe_vpp0_1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate wpe_top_clks[] = {
+	GATE_WPE_TOP(CLK_WPE_TOP_WPE_VPP0, "wpe_wpe_vpp0", "top_wpe_vpp", 16),
+	GATE_WPE_TOP(CLK_WPE_TOP_SMI_LARB7, "wpe_smi_larb7", "top_wpe_vpp", 18),
+	GATE_WPE_TOP(CLK_WPE_TOP_WPESYS_EVENT_TX, "wpe_wpesys_event_tx", "top_wpe_vpp", 20),
+	GATE_WPE_TOP(CLK_WPE_TOP_SMI_LARB7_PCLK_EN, "wpe_smi_larb7_p_en", "top_wpe_vpp", 24),
+};
+
+static const struct mtk_gate wpe_vpp0_clks[] = {
+	/* WPE_VPP00 */
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_VGEN, "wpe_vpp0_vgen", "top_img", 0),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_EXT, "wpe_vpp0_ext", "top_img", 1),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_VFC, "wpe_vpp0_vfc", "top_img", 2),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_CACH0_TOP, "wpe_vpp0_cach0_top", "top_img", 3),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_CACH0_DMA, "wpe_vpp0_cach0_dma", "top_img", 4),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_CACH1_TOP, "wpe_vpp0_cach1_top", "top_img", 5),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_CACH1_DMA, "wpe_vpp0_cach1_dma", "top_img", 6),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_CACH2_TOP, "wpe_vpp0_cach2_top", "top_img", 7),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_CACH2_DMA, "wpe_vpp0_cach2_dma", "top_img", 8),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_CACH3_TOP, "wpe_vpp0_cach3_top", "top_img", 9),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_CACH3_DMA, "wpe_vpp0_cach3_dma", "top_img", 10),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_PSP, "wpe_vpp0_psp", "top_img", 11),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_PSP2, "wpe_vpp0_psp2", "top_img", 12),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_SYNC, "wpe_vpp0_sync", "top_img", 13),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_C24, "wpe_vpp0_c24", "top_img", 14),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_MDP_CROP, "wpe_vpp0_mdp_crop", "top_img", 15),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_ISP_CROP, "wpe_vpp0_isp_crop", "top_img", 16),
+	GATE_WPE_VPP0_0(CLK_WPE_VPP0_TOP, "wpe_vpp0_top", "top_img", 17),
+	/* WPE_VPP0_1 */
+	GATE_WPE_VPP0_1(CLK_WPE_VPP0_VECI, "wpe_vpp0_veci", "top_img", 0),
+	GATE_WPE_VPP0_1(CLK_WPE_VPP0_VEC2I, "wpe_vpp0_vec2i", "top_img", 1),
+	GATE_WPE_VPP0_1(CLK_WPE_VPP0_VEC3I, "wpe_vpp0_vec3i", "top_img", 2),
+	GATE_WPE_VPP0_1(CLK_WPE_VPP0_WPEO, "wpe_vpp0_wpeo", "top_img", 3),
+	GATE_WPE_VPP0_1(CLK_WPE_VPP0_MSKO, "wpe_vpp0_msko", "top_img", 4),
+};
+
+static const struct mtk_clk_desc wpe_top_desc = {
+	.clks = wpe_top_clks,
+	.num_clks = ARRAY_SIZE(wpe_top_clks),
+};
+
+static const struct mtk_clk_desc wpe_vpp0_desc = {
+	.clks = wpe_vpp0_clks,
+	.num_clks = ARRAY_SIZE(wpe_vpp0_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_wpe[] = {
+	{ .compatible = "mediatek,mt8188-wpesys", .data = &wpe_top_desc },
+	{ .compatible = "mediatek,mt8188-wpesys-vpp0", .data = &wpe_vpp0_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_wpe_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-wpe",
+		.of_match_table = of_match_clk_mt8188_wpe,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_wpe_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


