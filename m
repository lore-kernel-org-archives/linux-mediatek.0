Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D80C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efDcRuAfRX0zHPb71hYMEmmPhzWJyP3vCrUml5d9bXY=; b=bMS3xuGrz+k+SfDav9RG9eQNwf
	kTUk141yykIv46kYq645AYKL9u/pK/iKeqEq/aEbULLhcOCQP1QMO5+QfA+DQ3pnUF4I0sX6PfW+G
	zqiVkooZGaa/Ei3TTjQ6iz8fRqcZSAN+D6lGxZ1p102bpOBS4Pr0uXpY1SGBrzrm+xVtrwEuYrAnW
	lAAuK+MjWGBvZoB4KN0k5Oa3IeD4xEKvpQb6YxfONDS1cbsjiw9rrtL4gl4p9BbxMMl4LTpIaFBym
	ggGrhYp7cNLVUlFtPvDEGP2PAq61vlqHDYhKs2In/RU8r4+U2eKdpLTRa/taAuetUaZijeocwgJqY
	Vre1cXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLZa-003PDd-Dq; Fri, 29 Jul 2022 08:42:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLKu-003EKD-Lj; Fri, 29 Jul 2022 08:27:12 +0000
X-UUID: ba04c8b5d718482ba6e30efab6b16bd6-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:438c326b-0453-44da-af5f-3e3d8a75e729,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:8176bdcf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ba04c8b5d718482ba6e30efab6b16bd6-20220729
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1742288649; Fri, 29 Jul 2022 01:27:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 16:25:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 16:25:20 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Garmin Chang <garmin.chang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH 12/18] clk: mediatek: Add MT8188 vdosys0 clock support
Date: Fri, 29 Jul 2022 16:24:51 +0800
Message-ID: <20220729082457.22253-13-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
References: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_012708_790937_573B5717 
X-CRM114-Status: GOOD (  17.21  )
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

Add MT8188 vdosys0 clock controller which provides clock gate
control in video system. This is integrated with mtk-mmsys
driver which will populate device by platform_device_register_data
to start vdosys clock driver.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile          |   3 +-
 drivers/clk/mediatek/clk-mt8188-vdo0.c | 129 +++++++++++++++++++++++++
 2 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdo0.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index fc13bef12ab0..97bfe61cc1f9 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -79,7 +79,8 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
 				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
-				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o
+				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
+				   clk-mt8188-vdo0.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-vdo0.c b/drivers/clk/mediatek/clk-mt8188-vdo0.c
new file mode 100644
index 000000000000..716e5c11150b
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-vdo0.c
@@ -0,0 +1,129 @@
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
+static const struct mtk_gate_regs vdo0_0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs vdo0_1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs vdo0_2_cg_regs = {
+	.set_ofs = 0x124,
+	.clr_ofs = 0x128,
+	.sta_ofs = 0x120,
+};
+
+#define GATE_VDO0_0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo0_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO0_1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo0_1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO0_2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo0_2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate vdo0_clks[] = {
+	/* VDO0_0 */
+	GATE_VDO0_0(CLK_VDO0_DISP_OVL0, "vdo0_disp_ovl0", "top_vpp", 0),
+	GATE_VDO0_0(CLK_VDO0_FAKE_ENG0, "vdo0_fake_eng0", "top_vpp", 2),
+	GATE_VDO0_0(CLK_VDO0_DISP_CCORR0, "vdo0_disp_ccorr0", "top_vpp", 4),
+	GATE_VDO0_0(CLK_VDO0_DISP_MUTEX0, "vdo0_disp_mutex0", "top_vpp", 6),
+	GATE_VDO0_0(CLK_VDO0_DISP_GAMMA0, "vdo0_disp_gamma0", "top_vpp", 8),
+	GATE_VDO0_0(CLK_VDO0_DISP_DITHER0, "vdo0_disp_dither0", "top_vpp", 10),
+	GATE_VDO0_0(CLK_VDO0_DISP_WDMA0, "vdo0_disp_wdma0", "top_vpp", 17),
+	GATE_VDO0_0(CLK_VDO0_DISP_RDMA0, "vdo0_disp_rdma0", "top_vpp", 19),
+	GATE_VDO0_0(CLK_VDO0_DSI0, "vdo0_dsi0", "top_vpp", 21),
+	GATE_VDO0_0(CLK_VDO0_DSI1, "vdo0_dsi1", "top_vpp", 22),
+	GATE_VDO0_0(CLK_VDO0_DSC_WRAP0, "vdo0_dsc_wrap0", "top_vpp", 23),
+	GATE_VDO0_0(CLK_VDO0_VPP_MERGE0, "vdo0_vpp_merge0", "top_vpp", 24),
+	GATE_VDO0_0(CLK_VDO0_DP_INTF0, "vdo0_dp_intf0", "top_vpp", 25),
+	GATE_VDO0_0(CLK_VDO0_DISP_AAL0, "vdo0_disp_aal0", "top_vpp", 26),
+	GATE_VDO0_0(CLK_VDO0_INLINEROT0, "vdo0_inlinerot0", "top_vpp", 27),
+	GATE_VDO0_0(CLK_VDO0_APB_BUS, "vdo0_apb_bus", "top_vpp", 28),
+	GATE_VDO0_0(CLK_VDO0_DISP_COLOR0, "vdo0_disp_color0", "top_vpp", 29),
+	GATE_VDO0_0(CLK_VDO0_MDP_WROT0, "vdo0_mdp_wrot0", "top_vpp", 30),
+	GATE_VDO0_0(CLK_VDO0_DISP_RSZ0, "vdo0_disp_rsz0", "top_vpp", 31),
+	/* VDO0_1 */
+	GATE_VDO0_1(CLK_VDO0_DISP_POSTMASK0, "vdo0_disp_postmask0", "top_vpp", 0),
+	GATE_VDO0_1(CLK_VDO0_FAKE_ENG1, "vdo0_fake_eng1", "top_vpp", 1),
+	GATE_VDO0_1(CLK_VDO0_DL_ASYNC2, "vdo0_dl_async2", "top_vpp", 5),
+	GATE_VDO0_1(CLK_VDO0_DL_RELAY3, "vdo0_dl_relay3", "top_vpp", 6),
+	GATE_VDO0_1(CLK_VDO0_DL_RELAY4, "vdo0_dl_relay4", "top_vpp", 7),
+	GATE_VDO0_1(CLK_VDO0_SMI_GALS, "vdo0_smi_gals", "top_vpp", 10),
+	GATE_VDO0_1(CLK_VDO0_SMI_COMMON, "vdo0_smi_common", "top_vpp", 11),
+	GATE_VDO0_1(CLK_VDO0_SMI_EMI, "vdo0_smi_emi", "top_vpp", 12),
+	GATE_VDO0_1(CLK_VDO0_SMI_IOMMU, "vdo0_smi_iommu", "top_vpp", 13),
+	GATE_VDO0_1(CLK_VDO0_SMI_LARB, "vdo0_smi_larb", "top_vpp", 14),
+	GATE_VDO0_1(CLK_VDO0_SMI_RSI, "vdo0_smi_rsi", "top_vpp", 15),
+	/* VDO0_2 */
+	GATE_VDO0_2(CLK_VDO0_DSI0_DSI, "vdo0_dsi0_dsi", "top_dsi_occ", 0),
+	GATE_VDO0_2(CLK_VDO0_DSI1_DSI, "vdo0_dsi1_dsi", "top_dsi_occ", 8),
+	GATE_VDO0_2(CLK_VDO0_DP_INTF0_DP_INTF, "vdo0_dp_intf0_dp_intf", "top_edp", 16),
+};
+
+static int clk_mt8188_vdo0_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_hw_onecell_data *clk_data;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_VDO0_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
+	if (r)
+		goto free_vdo0_data;
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
+	mtk_clk_unregister_gates(vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
+free_vdo0_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static int clk_mt8188_vdo0_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
+static struct platform_driver clk_mt8188_vdo0_drv = {
+	.probe = clk_mt8188_vdo0_probe,
+	.remove = clk_mt8188_vdo0_remove,
+	.driver = {
+		.name = "clk-mt8188-vdo0",
+	},
+};
+builtin_platform_driver(clk_mt8188_vdo0_drv);
-- 
2.18.0


