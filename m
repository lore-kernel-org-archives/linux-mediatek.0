Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D98DC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tk6XvBQolEtHU3KaLMbwBDhmEb8xOBuNMIbk5mIPePg=; b=Pei2lPBe29zfA9tWeC1ueV4b/o
	uTTkgOxRO9qIg6ds4+EIJRig27URBnY4zNPyq7w4ymZTLumEcqNyfqZ1WcD/hsixgnChhIyMsXJcP
	IT81bKVhhAoxitUY/OGCjOqonJhoDd5IcXw9dL3lo88XdiKBn5T7Dd5jkGu36mZIjZdVv3D+9UgHv
	R4I0wiCBBcOhBWlhvZXYA8F3z3qdE3jVThdIwMz2/pUyMpfNMrWn5+cl+z0zKlCprLysCB94Wetx2
	x8HP5rBXBjk+Natj4Qu2+lMjHM3v+A3Iyh/som5UAyimn2BaLpS/5sSpwxDt8YqfZZcPb6mrUokpX
	KVKes1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLVU-003MhO-NM; Fri, 29 Jul 2022 08:38:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLJf-003DOk-S6; Fri, 29 Jul 2022 08:25:55 +0000
X-UUID: a33968505c6941aab365a81d3c8ef683-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ccf0eede-9e01-42ec-9285-f5c5511d47e5,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:8de1add0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a33968505c6941aab365a81d3c8ef683-20220729
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1250938697; Fri, 29 Jul 2022 01:25:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 29 Jul 2022 16:25:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 16:25:23 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Garmin Chang <garmin.chang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH 15/18] clk: mediatek: Add MT8188 vppsys0 clock support
Date: Fri, 29 Jul 2022 16:24:54 +0800
Message-ID: <20220729082457.22253-16-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
References: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_012552_048004_E54DAD4D 
X-CRM114-Status: GOOD (  15.29  )
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
---
 drivers/clk/mediatek/Makefile          |   3 +-
 drivers/clk/mediatek/clk-mt8188-vpp0.c | 117 +++++++++++++++++++++++++
 2 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vpp0.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 691bacf55759..33b9405ccd57 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -80,7 +80,8 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
 				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
 				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
-				   clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o
+				   clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o \
+				   clk-mt8188-vpp0.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-vpp0.c b/drivers/clk/mediatek/clk-mt8188-vpp0.c
new file mode 100644
index 000000000000..809b9192a873
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-vpp0.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Garmin Chang <garmin.chang@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mt8188-clk.h>
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
+static const struct of_device_id of_match_clk_mt8188_vpp0[] = {
+	{
+		.compatible = "mediatek,mt8188-vppsys0",
+		.data = &vpp0_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8188_vpp0_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-vpp0",
+		.of_match_table = of_match_clk_mt8188_vpp0,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_vpp0_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


