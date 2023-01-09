Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB89DC5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UpF9BQLr8Dku9e/r6Hix5mBMx2zn/DvvEm9dU3vTWI=; b=iURsz9hm8I7ilFCnLEYuRaLHib
	aJvfcGgAdLFc2lONvLr8O4fBO3D9LFWklWqWY6ZPjTb8Iikyy2pwi5d8XpdUBpzbQVTlUxbi66Riw
	8MP/DpS2VelqjmJi4IJHrjeqen7pIaUGehG+02qzxx4QqWYURyIB46MM7cdThLGMBUpA5FfQJJA7q
	7beRHlLSvpWFRu1q16f3KSBTF3njJJOW1l2ngAXLDasGTEyMBsGmfmvCwQFHBhDBap/wyeitO5MI7
	FDOONtPEtPc4ajh8ALklfLHp+0MmHrkyxDgcCHS1Bry5jh61Ab0biwCq//VX027gPmeiFUf9VJ8AD
	bW0G3l4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErqF-001QGI-Gm; Mon, 09 Jan 2023 13:05:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErqC-001QEz-Iy; Mon, 09 Jan 2023 13:05:30 +0000
X-UUID: 42b36284180543b99f2edeeff107835c-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3UpF9BQLr8Dku9e/r6Hix5mBMx2zn/DvvEm9dU3vTWI=;
	b=AwnOTpguQbKmRTW7D/dsgCKeNz1ORg1wCUdbf0XZxr6dBIs15kV8vXa7WQwHI1wWBS3NFhfL1kdIXx+2+feevmMpka+s5KHT5xuP9c8837Tdrkh0XKbmxvh+Wlo6vLoAswARokXT7hpf2zYrLbLzcLS7F558V5uW6h+27Zd/vXo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:d41ba6f4-10d3-4a9e-bdb1-a57a772b659c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:7e9fb88b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 42b36284180543b99f2edeeff107835c-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1444916120; Mon, 09 Jan 2023 06:05:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 Jan 2023 20:45:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Jan 2023 20:45:21 +0800
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
Subject: [PATCH v4 06/19] clk: mediatek: Add MT8188 camsys clock support
Date: Mon, 9 Jan 2023 20:45:03 +0800
Message-ID: <20230109124516.31425-7-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
References: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_050528_711632_7839D90C 
X-CRM114-Status: GOOD (  15.79  )
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

Add MT8188 camsys clock controllers which provide clock gate
control for camera IP blocks.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile         |   3 +-
 drivers/clk/mediatek/clk-mt8188-cam.c | 118 ++++++++++++++++++++++++++
 2 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-cam.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index a3393782f7e1..dc247bf67e8b 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -84,7 +84,8 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 				   clk-mt8186-img.o clk-mt8186-vdec.o clk-mt8186-venc.o \
 				   clk-mt8186-cam.o clk-mt8186-mdp.o clk-mt8186-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
-				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o
+				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
+				   clk-mt8188-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-cam.c b/drivers/clk/mediatek/clk-mt8188-cam.c
new file mode 100644
index 000000000000..5f7cf9db12f2
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-cam.c
@@ -0,0 +1,118 @@
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
+static const struct mtk_gate_regs cam_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &cam_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate cam_main_clks[] = {
+	GATE_CAM(CLK_CAM_MAIN_LARB13, "cam_main_larb13", "top_cam", 0),
+	GATE_CAM(CLK_CAM_MAIN_LARB14, "cam_main_larb14", "top_cam", 1),
+	GATE_CAM(CLK_CAM_MAIN_CAM, "cam_main_cam", "top_cam", 2),
+	GATE_CAM(CLK_CAM_MAIN_CAM_SUBA, "cam_main_cam_suba", "top_cam", 3),
+	GATE_CAM(CLK_CAM_MAIN_CAM_SUBB, "cam_main_cam_subb", "top_cam", 4),
+	GATE_CAM(CLK_CAM_MAIN_CAMTG, "cam_main_camtg", "top_cam", 7),
+	GATE_CAM(CLK_CAM_MAIN_SENINF, "cam_main_seninf", "top_cam", 8),
+	GATE_CAM(CLK_CAM_MAIN_GCAMSVA, "cam_main_gcamsva", "top_cam", 9),
+	GATE_CAM(CLK_CAM_MAIN_GCAMSVB, "cam_main_gcamsvb", "top_cam", 10),
+	GATE_CAM(CLK_CAM_MAIN_GCAMSVC, "cam_main_gcamsvc", "top_cam", 11),
+	GATE_CAM(CLK_CAM_MAIN_GCAMSVD, "cam_main_gcamsvd", "top_cam", 12),
+	GATE_CAM(CLK_CAM_MAIN_GCAMSVE, "cam_main_gcamsve", "top_cam", 13),
+	GATE_CAM(CLK_CAM_MAIN_GCAMSVF, "cam_main_gcamsvf", "top_cam", 14),
+	GATE_CAM(CLK_CAM_MAIN_GCAMSVG, "cam_main_gcamsvg", "top_cam", 15),
+	GATE_CAM(CLK_CAM_MAIN_GCAMSVH, "cam_main_gcamsvh", "top_cam", 16),
+	GATE_CAM(CLK_CAM_MAIN_GCAMSVI, "cam_main_gcamsvi", "top_cam", 17),
+	GATE_CAM(CLK_CAM_MAIN_GCAMSVJ, "cam_main_gcamsvj", "top_cam", 18),
+	GATE_CAM(CLK_CAM_MAIN_CAMSV_TOP, "cam_main_camsv", "top_cam", 19),
+	GATE_CAM(CLK_CAM_MAIN_CAMSV_CQ_A, "cam_main_camsv_cq_a", "top_cam", 20),
+	GATE_CAM(CLK_CAM_MAIN_CAMSV_CQ_B, "cam_main_camsv_cq_b", "top_cam", 21),
+	GATE_CAM(CLK_CAM_MAIN_CAMSV_CQ_C, "cam_main_camsv_cq_c", "top_cam", 22),
+	GATE_CAM(CLK_CAM_MAIN_FAKE_ENG, "cam_main_fake_eng", "top_cam", 28),
+	GATE_CAM(CLK_CAM_MAIN_CAM2MM0_GALS, "cam_main_cam2mm0_gals", "top_cam", 29),
+	GATE_CAM(CLK_CAM_MAIN_CAM2MM1_GALS, "cam_main_cam2mm1_gals", "top_cam", 30),
+	GATE_CAM(CLK_CAM_MAIN_CAM2SYS_GALS, "cam_main_cam2sys_gals", "top_cam", 31),
+};
+
+static const struct mtk_gate cam_rawa_clks[] = {
+	GATE_CAM(CLK_CAM_RAWA_LARBX, "cam_rawa_larbx", "top_cam", 0),
+	GATE_CAM(CLK_CAM_RAWA_CAM, "cam_rawa_cam", "top_cam", 1),
+	GATE_CAM(CLK_CAM_RAWA_CAMTG, "cam_rawa_camtg", "top_cam", 2),
+};
+
+static const struct mtk_gate cam_rawb_clks[] = {
+	GATE_CAM(CLK_CAM_RAWB_LARBX, "cam_rawb_larbx", "top_cam", 0),
+	GATE_CAM(CLK_CAM_RAWB_CAM, "cam_rawb_cam", "top_cam", 1),
+	GATE_CAM(CLK_CAM_RAWB_CAMTG, "cam_rawb_camtg", "top_cam", 2),
+};
+
+static const struct mtk_gate cam_yuva_clks[] = {
+	GATE_CAM(CLK_CAM_YUVA_LARBX, "cam_yuva_larbx", "top_cam", 0),
+	GATE_CAM(CLK_CAM_YUVA_CAM, "cam_yuva_cam", "top_cam", 1),
+	GATE_CAM(CLK_CAM_YUVA_CAMTG, "cam_yuva_camtg", "top_cam", 2),
+};
+
+static const struct mtk_gate cam_yuvb_clks[] = {
+	GATE_CAM(CLK_CAM_YUVB_LARBX, "cam_yuvb_larbx", "top_cam", 0),
+	GATE_CAM(CLK_CAM_YUVB_CAM, "cam_yuvb_cam", "top_cam", 1),
+	GATE_CAM(CLK_CAM_YUVB_CAMTG, "cam_yuvb_camtg", "top_cam", 2),
+};
+
+static const struct mtk_clk_desc cam_main_desc = {
+	.clks = cam_main_clks,
+	.num_clks = ARRAY_SIZE(cam_main_clks),
+};
+
+static const struct mtk_clk_desc cam_rawa_desc = {
+	.clks = cam_rawa_clks,
+	.num_clks = ARRAY_SIZE(cam_rawa_clks),
+};
+
+static const struct mtk_clk_desc cam_rawb_desc = {
+	.clks = cam_rawb_clks,
+	.num_clks = ARRAY_SIZE(cam_rawb_clks),
+};
+
+static const struct mtk_clk_desc cam_yuva_desc = {
+	.clks = cam_yuva_clks,
+	.num_clks = ARRAY_SIZE(cam_yuva_clks),
+};
+
+static const struct mtk_clk_desc cam_yuvb_desc = {
+	.clks = cam_yuvb_clks,
+	.num_clks = ARRAY_SIZE(cam_yuvb_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_cam[] = {
+	{ .compatible = "mediatek,mt8188-camsys", .data = &cam_main_desc },
+	{ .compatible = "mediatek,mt8188-camsys-rawa", .data = &cam_rawa_desc },
+	{ .compatible = "mediatek,mt8188-camsys-rawb", .data = &cam_rawb_desc },
+	{ .compatible = "mediatek,mt8188-camsys-yuva", .data = &cam_yuva_desc },
+	{ .compatible = "mediatek,mt8188-camsys-yuvb", .data = &cam_yuvb_desc },
+	{ /* sentinel */}
+};
+
+static struct platform_driver clk_mt8188_cam_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-cam",
+		.of_match_table = of_match_clk_mt8188_cam,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_cam_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


