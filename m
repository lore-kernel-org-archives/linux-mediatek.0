Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF5BC761AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwQBNRmlPIP2eKeLPuqK7W/U5Ik8MmnYCS1pzhWzXhc=; b=vByEAfM2g9j8OUTrV29+Tcwl2v
	rmYEAyjFwJHMploboMQsQ1gtYi5w1eRGQMnOAciloEl1hzdZcbiWbQ7hwwJxcMUU3lbsVwRqGW8D1
	yj9W9n8NPXhN8ycAz8Ou7y5QU5Iq/6NodIDxlZ9bdqZam+5WB8vrql5up82FjZW6PdwmIx019NjAQ
	/yPaIHeobRSP0D6wkteVDQLdQyvcSW615FOcOAhsLKgzWLpZsOEw9wf8ZQtPBU1JDMH8c8ht99Ufm
	EaJIjwfYE/SeVas7Z5yXNUhfH79zANINpZSvfpNNwLF/S3CSLbqV3pfFPw/yqS6Awggk1CynIhDui
	36LmCxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piE2v-007LBY-2l;
	Fri, 31 Mar 2023 12:39:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piE0c-007JjH-0d;
	Fri, 31 Mar 2023 12:37:38 +0000
X-UUID: ccb1558ecfc011ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HwQBNRmlPIP2eKeLPuqK7W/U5Ik8MmnYCS1pzhWzXhc=;
	b=cxvbvKxISolbtc76pMlLSU1zAouQ6eAP7CYY9g9nLzc5MWZ2dc0wlyUvaC/UMZbmCqw/m7TfzvLGUbzpZ1XYcOvvNMdUhG/79oSOmItRrHhDQ/ZQiQR4BjlhzzRZX26kMFPdfabJzYwCs51IJ+KzL/r51e1nDH5WxPgKiVkz65o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:3d2e9261-5b72-4a9d-bb03-7de30dc55cff,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:ff9f88f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: ccb1558ecfc011ed8687db9d93187ff1-20230331
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 839045177; Fri, 31 Mar 2023 05:37:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [PATCH v8 15/19] clk: mediatek: Add MT8188 vppsys0 clock support
Date: Fri, 31 Mar 2023 20:36:17 +0800
Message-ID: <20230331123621.16167-16-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_053734_318741_D003C6FE 
X-CRM114-Status: GOOD (  17.70  )
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

Add MT8188 vppsys0 clock controller which provides clock gate
controller for Video Processor Pipe.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig           |   7 ++
 drivers/clk/mediatek/Makefile          |   1 +
 drivers/clk/mediatek/clk-mt8188-vpp0.c | 114 +++++++++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vpp0.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 87ac1df8e901..70c139256236 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -741,6 +741,13 @@ config COMMON_CLK_MT8188_VENCSYS
 	help
 	  This driver supports MediaTek MT8188 vencsys clocks.
 
+config COMMON_CLK_MT8188_VPPSYS
+	tristate "Clock driver for MediaTek MT8188 vppsys"
+	depends on COMMON_CLK_MT8188
+	default COMMON_CLK_MT8188
+	help
+	  This driver supports MediaTek MT8188 vppsys0/1 clocks.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index d56be5cb0534..4189f2ee20f1 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -109,6 +109,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_MFGCFG) += clk-mt8188-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VDECSYS) += clk-mt8188-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
+obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-vpp0.c b/drivers/clk/mediatek/clk-mt8188-vpp0.c
new file mode 100644
index 000000000000..07bdedf6a21a
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-vpp0.c
@@ -0,0 +1,114 @@
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
+static const struct mtk_gate_regs vpp0_0_cg_regs = {
+	.set_ofs = 0x24,
+	.clr_ofs = 0x28,
+	.sta_ofs = 0x20,
+};
+
+static const struct mtk_gate_regs vpp0_1_cg_regs = {
+	.set_ofs = 0x30,
+	.clr_ofs = 0x34,
+	.sta_ofs = 0x2c,
+};
+
+static const struct mtk_gate_regs vpp0_2_cg_regs = {
+	.set_ofs = 0x3c,
+	.clr_ofs = 0x40,
+	.sta_ofs = 0x38,
+};
+
+#define GATE_VPP0_0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vpp0_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VPP0_1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vpp0_1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VPP0_2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vpp0_2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate vpp0_clks[] = {
+	/* VPP0_0 */
+	GATE_VPP0_0(CLK_VPP0_MDP_FG, "vpp0_mdp_fg", "top_vpp", 1),
+	GATE_VPP0_0(CLK_VPP0_STITCH, "vpp0_stitch", "top_vpp", 2),
+	GATE_VPP0_0(CLK_VPP0_PADDING, "vpp0_padding", "top_vpp", 7),
+	GATE_VPP0_0(CLK_VPP0_MDP_TCC, "vpp0_mdp_tcc", "top_vpp", 8),
+	GATE_VPP0_0(CLK_VPP0_WARP0_ASYNC_TX, "vpp0_warp0_async_tx", "top_vpp", 10),
+	GATE_VPP0_0(CLK_VPP0_WARP1_ASYNC_TX, "vpp0_warp1_async_tx", "top_vpp", 11),
+	GATE_VPP0_0(CLK_VPP0_MUTEX, "vpp0_mutex", "top_vpp", 13),
+	GATE_VPP0_0(CLK_VPP02VPP1_RELAY, "vpp02vpp1_relay", "top_vpp", 14),
+	GATE_VPP0_0(CLK_VPP0_VPP12VPP0_ASYNC, "vpp0_vpp12vpp0_async", "top_vpp", 15),
+	GATE_VPP0_0(CLK_VPP0_MMSYSRAM_TOP, "vpp0_mmsysram_top", "top_vpp", 16),
+	GATE_VPP0_0(CLK_VPP0_MDP_AAL, "vpp0_mdp_aal", "top_vpp", 17),
+	GATE_VPP0_0(CLK_VPP0_MDP_RSZ, "vpp0_mdp_rsz", "top_vpp", 18),
+	/* VPP0_1 */
+	GATE_VPP0_1(CLK_VPP0_SMI_COMMON_MMSRAM, "vpp0_smi_common_mmsram", "top_vpp", 0),
+	GATE_VPP0_1(CLK_VPP0_GALS_VDO0_LARB0_MMSRAM, "vpp0_gals_vdo0_larb0_mmsram", "top_vpp", 1),
+	GATE_VPP0_1(CLK_VPP0_GALS_VDO0_LARB1_MMSRAM, "vpp0_gals_vdo0_larb1_mmsram", "top_vpp", 2),
+	GATE_VPP0_1(CLK_VPP0_GALS_VENCSYS_MMSRAM, "vpp0_gals_vencsys_mmsram", "top_vpp", 3),
+	GATE_VPP0_1(CLK_VPP0_GALS_VENCSYS_CORE1_MMSRAM,
+		    "vpp0_gals_vencsys_core1_mmsram", "top_vpp", 4),
+	GATE_VPP0_1(CLK_VPP0_GALS_INFRA_MMSRAM, "vpp0_gals_infra_mmsram", "top_vpp", 5),
+	GATE_VPP0_1(CLK_VPP0_GALS_CAMSYS_MMSRAM, "vpp0_gals_camsys_mmsram", "top_vpp", 6),
+	GATE_VPP0_1(CLK_VPP0_GALS_VPP1_LARB5_MMSRAM, "vpp0_gals_vpp1_larb5_mmsram", "top_vpp", 7),
+	GATE_VPP0_1(CLK_VPP0_GALS_VPP1_LARB6_MMSRAM, "vpp0_gals_vpp1_larb6_mmsram", "top_vpp", 8),
+	GATE_VPP0_1(CLK_VPP0_SMI_REORDER_MMSRAM, "vpp0_smi_reorder_mmsram", "top_vpp", 9),
+	GATE_VPP0_1(CLK_VPP0_SMI_IOMMU, "vpp0_smi_iommu", "top_vpp", 10),
+	GATE_VPP0_1(CLK_VPP0_GALS_IMGSYS_CAMSYS, "vpp0_gals_imgsys_camsys", "top_vpp", 11),
+	GATE_VPP0_1(CLK_VPP0_MDP_RDMA, "vpp0_mdp_rdma", "top_vpp", 12),
+	GATE_VPP0_1(CLK_VPP0_MDP_WROT, "vpp0_mdp_wrot", "top_vpp", 13),
+	GATE_VPP0_1(CLK_VPP0_GALS_EMI0_EMI1, "vpp0_gals_emi0_emi1", "top_vpp", 16),
+	GATE_VPP0_1(CLK_VPP0_SMI_SUB_COMMON_REORDER, "vpp0_smi_sub_common_reorder", "top_vpp", 17),
+	GATE_VPP0_1(CLK_VPP0_SMI_RSI, "vpp0_smi_rsi", "top_vpp", 18),
+	GATE_VPP0_1(CLK_VPP0_SMI_COMMON_LARB4, "vpp0_smi_common_larb4", "top_vpp", 19),
+	GATE_VPP0_1(CLK_VPP0_GALS_VDEC_VDEC_CORE1, "vpp0_gals_vdec_vdec_core1", "top_vpp", 20),
+	GATE_VPP0_1(CLK_VPP0_GALS_VPP1_WPESYS, "vpp0_gals_vpp1_wpesys", "top_vpp", 21),
+	GATE_VPP0_1(CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1,
+		    "vpp0_gals_vdo0_vdo1_vencsys_core1", "top_vpp", 22),
+	GATE_VPP0_1(CLK_VPP0_FAKE_ENG, "vpp0_fake_eng", "top_vpp", 23),
+	GATE_VPP0_1(CLK_VPP0_MDP_HDR, "vpp0_mdp_hdr", "top_vpp", 24),
+	GATE_VPP0_1(CLK_VPP0_MDP_TDSHP, "vpp0_mdp_tdshp", "top_vpp", 25),
+	GATE_VPP0_1(CLK_VPP0_MDP_COLOR, "vpp0_mdp_color", "top_vpp", 26),
+	GATE_VPP0_1(CLK_VPP0_MDP_OVL, "vpp0_mdp_ovl", "top_vpp", 27),
+	GATE_VPP0_1(CLK_VPP0_DSIP_RDMA, "vpp0_dsip_rdma", "top_vpp", 28),
+	GATE_VPP0_1(CLK_VPP0_DISP_WDMA, "vpp0_disp_wdma", "top_vpp", 29),
+	GATE_VPP0_1(CLK_VPP0_MDP_HMS, "vpp0_mdp_hms", "top_vpp", 30),
+	/* VPP0_2 */
+	GATE_VPP0_2(CLK_VPP0_WARP0_RELAY, "vpp0_warp0_relay", "top_wpe_vpp", 0),
+	GATE_VPP0_2(CLK_VPP0_WARP0_ASYNC, "vpp0_warp0_async", "top_wpe_vpp", 1),
+	GATE_VPP0_2(CLK_VPP0_WARP1_RELAY, "vpp0_warp1_relay", "top_wpe_vpp", 2),
+	GATE_VPP0_2(CLK_VPP0_WARP1_ASYNC, "vpp0_warp1_async", "top_wpe_vpp", 3),
+};
+
+static const struct mtk_clk_desc vpp0_desc = {
+	.clks = vpp0_clks,
+	.num_clks = ARRAY_SIZE(vpp0_clks),
+};
+
+static const struct platform_device_id clk_mt8188_vpp0_id_table[] = {
+	{ .name = "clk-mt8188-vpp0", .driver_data = (kernel_ulong_t)&vpp0_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, clk_mt8188_vpp0_id_table);
+
+static struct platform_driver clk_mt8188_vpp0_drv = {
+	.probe = mtk_clk_pdev_probe,
+	.remove = mtk_clk_pdev_remove,
+	.driver = {
+		.name = "clk-mt8188-vpp0",
+	},
+	.id_table = clk_mt8188_vpp0_id_table,
+};
+module_platform_driver(clk_mt8188_vpp0_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


