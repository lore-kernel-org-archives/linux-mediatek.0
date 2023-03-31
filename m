Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BD9C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7+GBom51YJ874aMhJC/KC91ripLRdIbRIfSvzOPLtk=; b=I+YmR1PCWWuqggt896Mu1iqhtI
	6sLrOYIgxd4/6nFtQYma4bTXxJDAiVCCDCSbRQ29iAbUvxSXlb33JXZe8drnNE2IqXXD7zkQ30w5O
	Nh11DCtb+jkeFz7vmMagTwpF6Vh9TfBIX2GO/igsHGPGnnK1Son75zmOSQC/NXtQK3Pd0RYT7rn7Z
	p6VREyu8U7RaPOO18NSIin8NFQx1EW5/FHARIK5sFwBJTzjJaCUu+aq0nbK+9YPyiO8oz7fPotM5w
	SXhJ9k8NwoycIsm74y487HeYAEijz6VeqGp+uIf8aL1yij2nakSoHeIcd26AsfRIwz9DQ1/SES1aC
	KHzoAB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piE0E-007JUt-0E;
	Fri, 31 Mar 2023 12:37:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piDzd-007J8Z-2q;
	Fri, 31 Mar 2023 12:36:36 +0000
X-UUID: a9bb04dacfc011ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+7+GBom51YJ874aMhJC/KC91ripLRdIbRIfSvzOPLtk=;
	b=eZ0C0yl6K50RrdqeH2xaUb+a1RHF642OfSI+CKG3EL7fklmLJmSlEO6T07KFvaDRSA8u22YDvUWi81A0MxVqkncMLbpxIwaOX5p/1m2O6RWFJnJgredJC/+TorQ4RafDwZWu7LiLfVdj0vBX5lu1gsxKKxghHjERQ8ALLQ667os=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:e9f1eab7-d2eb-4104-8e13-e4256660805e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:ed9b88f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: a9bb04dacfc011ed8687db9d93187ff1-20230331
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1470930329; Fri, 31 Mar 2023 05:36:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 20:36:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 20:36:26 +0800
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
Subject: [PATCH v8 17/19] clk: mediatek: Add MT8188 wpesys clock support
Date: Fri, 31 Mar 2023 20:36:19 +0800
Message-ID: <20230331123621.16167-18-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_053634_069257_9FC6CB56 
X-CRM114-Status: GOOD (  17.50  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig          |   7 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8188-wpe.c | 103 ++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-wpe.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 70c139256236..998cf4f559ea 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -748,6 +748,13 @@ config COMMON_CLK_MT8188_VPPSYS
 	help
 	  This driver supports MediaTek MT8188 vppsys0/1 clocks.
 
+config COMMON_CLK_MT8188_WPESYS
+	tristate "Clock driver for MediaTek MT8188 wpesys"
+	depends on COMMON_CLK_MT8188_IMGSYS
+	default COMMON_CLK_MT8188_IMGSYS
+	help
+	  This driver supports MediaTek MT8188 Warp Engine clocks.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index dec47ef9830c..df4e2da1ca49 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -110,6 +110,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDECSYS) += clk-mt8188-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
+obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-wpe.c b/drivers/clk/mediatek/clk-mt8188-wpe.c
new file mode 100644
index 000000000000..5abded13cece
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-wpe.c
@@ -0,0 +1,103 @@
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
+MODULE_DEVICE_TABLE(platform, clk_mt8188_vpp1_id_table);
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
+module_platform_driver(clk_mt8188_wpe_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


