Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EA5C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwKLAnr/Wik1u8XL21nG8XJTLhtdaliFbiZcXjUvD+w=; b=HtqOAMl597tUEUE2JzTgvB/S2W
	ytZBagukomhHm0PvFtO3wCsCRGu2AcG/e5MBEL/k6heVBWzj/Ul4KEsJYsOb2LfQOb06k+kPBmNUW
	K/mahxj/YWxNAkf4jJ/9rjwKj//19+1gQ9joPA8evKIhjhZcP2A03WIR1pcADGkiEOkDa0GQubv49
	2ReO1bQW3zzPX1KzXPs9VpSVUQM17bspWNMhCL238CGJwO+eo2errT+jqfH0wYytSAFcpbcnpJqqf
	3zFpYWQSPqR1lgYIL4xwkbKM5r5D26QBqQIPhCM/mDog3eQOBV6XBIQa3uVumVHBsZRJpsgTr6iEZ
	BwEv2iAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piE9L-007O2L-0X;
	Fri, 31 Mar 2023 12:46:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piE9I-007O1I-22;
	Fri, 31 Mar 2023 12:46:34 +0000
X-UUID: 0e1b5c3acfc211ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gwKLAnr/Wik1u8XL21nG8XJTLhtdaliFbiZcXjUvD+w=;
	b=EsKwbhCGQ1QZxnQZv41blK4+3w+xWS+6JhWmr5YtGUoSWbBcbEGemONE6TUIwcCz+qP+wYrfIXygvXWSXFliufnOBAMOR332wMfaZz7lA7UN3B1BGrxUvaOI4garmf/jmN3Q9FYAVbV5NSr55bKpYwPRzENV+6CNwYJLYqF/juY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:0be084c4-cc58-467f-9997-796074b6d82b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:a305fbb4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 0e1b5c3acfc211ed8687db9d93187ff1-20230331
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 542245112; Fri, 31 Mar 2023 05:46:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 20:36:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 20:36:25 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v8 06/19] clk: mediatek: Add MT8188 camsys clock support
Date: Fri, 31 Mar 2023 20:36:08 +0800
Message-ID: <20230331123621.16167-7-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_054632_679736_D7C29E15 
X-CRM114-Status: GOOD (  17.16  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig          |   7 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8188-cam.c | 120 ++++++++++++++++++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-cam.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 681d392620c5..9170f76a8ee7 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -692,6 +692,13 @@ config COMMON_CLK_MT8188
 	help
           This driver supports MediaTek MT8188 clocks.
 
+config COMMON_CLK_MT8188_CAMSYS
+	tristate "Clock driver for MediaTek MT8188 camsys"
+	depends on COMMON_CLK_MT8188_VPPSYS
+	default COMMON_CLK_MT8188_VPPSYS
+	help
+	  This driver supports MediaTek MT8188 camsys and camsys_raw clocks.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 1a642510ce38..3a2a35c54101 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186_VENCSYS) += clk-mt8186-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8186_WPESYS) += clk-mt8186-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8188_CAMSYS) += clk-mt8188-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-cam.c b/drivers/clk/mediatek/clk-mt8188-cam.c
new file mode 100644
index 000000000000..c5a3856bd223
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-cam.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Garmin Chang <garmin.chang@mediatek.com>
+ */
+
+#include <dt-bindings/clock/mediatek,mt8188-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
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
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_cam);
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
+module_platform_driver(clk_mt8188_cam_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


