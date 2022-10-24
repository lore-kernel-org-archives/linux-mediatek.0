Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAACDC38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nuHfblYZpOFBdDU4FHoqbRoryfaELXQy0yqeg6LojU=; b=x0/WGLlEJuvGj1f1b6U7dr5hp3
	pOsohEDdZjWsvq11jS+JSwWknaTupxFo+vDCF8SJYqhwkwC2QVUqgl05mssJrR2YXc+CfgcIIM7ui
	OsTV4jlICWfOFcA1bEnBgD/KbeW3RiOukynxnL60z6q3k9JK2IXeHVzzOds98duifGcSp/H1Y4QV6
	vmvvaETthdbzyAX7qg9SP4HAHjrPApO3LRldutS15tNyUEA5yqOb2GERj0vrCz6a/oO6vlFxtmUzz
	NP6HrTTFX0seHWAlj87yJJ3M7RyL/bN+WMuXq72fMFKGmZ86cORiydJ3Ae5sr3rlOIdqt/sdRa7+4
	2CCe9vWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omu29-000TJO-Uu; Mon, 24 Oct 2022 09:46:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omu0S-000SQK-Sk; Mon, 24 Oct 2022 09:44:32 +0000
X-UUID: 46abd9e94a46448ab0f04fa9490626d7-20221024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2nuHfblYZpOFBdDU4FHoqbRoryfaELXQy0yqeg6LojU=;
	b=cbGtpcaU7KbgwWTHzmZ+g/KAV0jGcgtjYVldXIG+wMi83kWkzjg2oh47JPcTySlB5KmXElEPmKbuS4uUaGqfls7suT8KE3al7ERcQBfNYFhSFcsNGLHH4Jc0d1yRbbt14Q1+eR+RZnvysSVSdSxK814IkI+rBod90LM2KXFNFtA=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:a6a1cec8-a939-4799-810b-ec3aee05c40f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.12,REQID:a6a1cec8-a939-4799-810b-ec3aee05c40f,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:62cd327,CLOUDID:fe657fc8-03ab-4171-989e-341ab5339257,B
	ulkID:221024174423Q6AQ46IL,BulkQuantity:1,Recheck:0,SF:38|28|16|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:43,QS:nil,BEC:nil,COL:0
X-UUID: 46abd9e94a46448ab0f04fa9490626d7-20221024
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 731518369; Mon, 24 Oct 2022 02:44:20 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 24 Oct 2022 17:43:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 24 Oct 2022 17:43:17 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH v2 13/19] clk: mediatek: Add MT8188 vdosys1 clock support
Date: Mon, 24 Oct 2022 17:42:48 +0800
Message-ID: <20221024094254.29218-14-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221024094254.29218-1-Garmin.Chang@mediatek.com>
References: <20221024094254.29218-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_024428_977350_FA4E0663 
X-CRM114-Status: GOOD (  18.14  )
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

Add MT8188 vdosys1 clock controller which provides clock gate
control in video system. This is integrated with mtk-mmsys
driver which will populate device by platform_device_register_data
to start vdosys clock driver.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile          |   2 +-
 drivers/clk/mediatek/clk-mt8188-vdo1.c | 177 +++++++++++++++++++++++++
 2 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdo1.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index c8fcf105e92c..6ce00011cc60 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -86,7 +86,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
 				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
 				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
-				   clk-mt8188-vdo0.o
+				   clk-mt8188-vdo0.o clk-mt8188-vdo1.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-vdo1.c b/drivers/clk/mediatek/clk-mt8188-vdo1.c
new file mode 100644
index 000000000000..7e45046ede0d
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-vdo1.c
@@ -0,0 +1,177 @@
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
+static const struct mtk_gate_regs vdo1_0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs vdo1_1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs vdo1_2_cg_regs = {
+	.set_ofs = 0x124,
+	.clr_ofs = 0x128,
+	.sta_ofs = 0x120,
+};
+
+static const struct mtk_gate_regs vdo1_3_cg_regs = {
+	.set_ofs = 0x134,
+	.clr_ofs = 0x138,
+	.sta_ofs = 0x130,
+};
+
+static const struct mtk_gate_regs vdo1_4_cg_regs = {
+	.set_ofs = 0x144,
+	.clr_ofs = 0x148,
+	.sta_ofs = 0x140,
+};
+
+#define GATE_VDO1_0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO1_1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO1_2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO1_3(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_3_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO1_4(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_4_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate vdo1_clks[] = {
+	/* VDO1_0 */
+	GATE_VDO1_0(CLK_VDO1_SMI_LARB2, "vdo1_smi_larb2", "top_vpp", 0),
+	GATE_VDO1_0(CLK_VDO1_SMI_LARB3, "vdo1_smi_larb3", "top_vpp", 1),
+	GATE_VDO1_0(CLK_VDO1_GALS, "vdo1_gals", "top_vpp", 2),
+	GATE_VDO1_0(CLK_VDO1_FAKE_ENG0, "vdo1_fake_eng0", "top_vpp", 3),
+	GATE_VDO1_0(CLK_VDO1_FAKE_ENG1, "vdo1_fake_eng1", "top_vpp", 4),
+	GATE_VDO1_0(CLK_VDO1_MDP_RDMA0, "vdo1_mdp_rdma0", "top_vpp", 5),
+	GATE_VDO1_0(CLK_VDO1_MDP_RDMA1, "vdo1_mdp_rdma1", "top_vpp", 6),
+	GATE_VDO1_0(CLK_VDO1_MDP_RDMA2, "vdo1_mdp_rdma2", "top_vpp", 7),
+	GATE_VDO1_0(CLK_VDO1_MDP_RDMA3, "vdo1_mdp_rdma3", "top_vpp", 8),
+	GATE_VDO1_0(CLK_VDO1_VPP_MERGE0, "vdo1_vpp_merge0", "top_vpp", 9),
+	GATE_VDO1_0(CLK_VDO1_VPP_MERGE1, "vdo1_vpp_merge1", "top_vpp", 10),
+	GATE_VDO1_0(CLK_VDO1_VPP_MERGE2, "vdo1_vpp_merge2", "top_vpp", 11),
+	/* VDO1_1 */
+	GATE_VDO1_1(CLK_VDO1_VPP_MERGE3, "vdo1_vpp_merge3", "top_vpp", 0),
+	GATE_VDO1_1(CLK_VDO1_VPP_MERGE4, "vdo1_vpp_merge4", "top_vpp", 1),
+	GATE_VDO1_1(CLK_VDO1_VPP2_TO_VDO1_DL_ASYNC, "vdo1_vpp2_to_vdo1_dl_async", "top_vpp", 2),
+	GATE_VDO1_1(CLK_VDO1_VPP3_TO_VDO1_DL_ASYNC, "vdo1_vpp3_to_vdo1_dl_async", "top_vpp", 3),
+	GATE_VDO1_1(CLK_VDO1_DISP_MUTEX, "vdo1_disp_mutex", "top_vpp", 4),
+	GATE_VDO1_1(CLK_VDO1_MDP_RDMA4, "vdo1_mdp_rdma4", "top_vpp", 5),
+	GATE_VDO1_1(CLK_VDO1_MDP_RDMA5, "vdo1_mdp_rdma5", "top_vpp", 6),
+	GATE_VDO1_1(CLK_VDO1_MDP_RDMA6, "vdo1_mdp_rdma6", "top_vpp", 7),
+	GATE_VDO1_1(CLK_VDO1_MDP_RDMA7, "vdo1_mdp_rdma7", "top_vpp", 8),
+	GATE_VDO1_1(CLK_VDO1_DP_INTF0_MMCK, "vdo1_dp_intf0_mmck", "top_vpp", 9),
+	GATE_VDO1_1(CLK_VDO1_DPI0_MM, "vdo1_dpi0_mm_ck", "top_vpp", 10),
+	GATE_VDO1_1(CLK_VDO1_DPI1_MM, "vdo1_dpi1_mm_ck", "top_vpp", 11),
+	GATE_VDO1_1(CLK_VDO1_MERGE0_DL_ASYNC, "vdo1_merge0_dl_async", "top_vpp", 13),
+	GATE_VDO1_1(CLK_VDO1_MERGE1_DL_ASYNC, "vdo1_merge1_dl_async", "top_vpp", 14),
+	GATE_VDO1_1(CLK_VDO1_MERGE2_DL_ASYNC, "vdo1_merge2_dl_async", "top_vpp", 15),
+	GATE_VDO1_1(CLK_VDO1_MERGE3_DL_ASYNC, "vdo1_merge3_dl_async", "top_vpp", 16),
+	GATE_VDO1_1(CLK_VDO1_MERGE4_DL_ASYNC, "vdo1_merge4_dl_async", "top_vpp", 17),
+	GATE_VDO1_1(CLK_VDO1_DSC_VDO1_DL_ASYNC, "vdo1_dsc_vdo1_dl_async", "top_vpp", 18),
+	GATE_VDO1_1(CLK_VDO1_MERGE_VDO1_DL_ASYNC, "vdo1_merge_vdo1_dl_async", "top_vpp", 19),
+	GATE_VDO1_1(CLK_VDO1_PADDING0, "vdo1_padding0", "top_vpp", 20),
+	GATE_VDO1_1(CLK_VDO1_PADDING1, "vdo1_padding1", "top_vpp", 21),
+	GATE_VDO1_1(CLK_VDO1_PADDING2, "vdo1_padding2", "top_vpp", 22),
+	GATE_VDO1_1(CLK_VDO1_PADDING3, "vdo1_padding3", "top_vpp", 23),
+	GATE_VDO1_1(CLK_VDO1_PADDING4, "vdo1_padding4", "top_vpp", 24),
+	GATE_VDO1_1(CLK_VDO1_PADDING5, "vdo1_padding5", "top_vpp", 25),
+	GATE_VDO1_1(CLK_VDO1_PADDING6, "vdo1_padding6", "top_vpp", 26),
+	GATE_VDO1_1(CLK_VDO1_PADDING7, "vdo1_padding7", "top_vpp", 27),
+	GATE_VDO1_1(CLK_VDO1_DISP_RSZ0, "vdo1_disp_rsz0", "top_vpp", 28),
+	GATE_VDO1_1(CLK_VDO1_DISP_RSZ1, "vdo1_disp_rsz1", "top_vpp", 29),
+	GATE_VDO1_1(CLK_VDO1_DISP_RSZ2, "vdo1_disp_rsz2", "top_vpp", 30),
+	GATE_VDO1_1(CLK_VDO1_DISP_RSZ3, "vdo1_disp_rsz3", "top_vpp", 31),
+	/* VDO1_2 */
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE0, "vdo1_hdr_vdo_fe0", "top_vpp", 0),
+	GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE0, "vdo1_hdr_gfx_fe0", "top_vpp", 1),
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_BE, "vdo1_hdr_vdo_be", "top_vpp", 2),
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE1, "vdo1_hdr_vdo_fe1", "top_vpp", 16),
+	GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE1, "vdo1_hdr_gfx_fe1", "top_vpp", 17),
+	GATE_VDO1_2(CLK_VDO1_DISP_MIXER, "vdo1_disp_mixer", "top_vpp", 18),
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE0_DL_ASYNC, "vdo1_hdr_vdo_fe0_dl_async", "top_vpp", 19),
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE1_DL_ASYNC, "vdo1_hdr_vdo_fe1_dl_async", "top_vpp", 20),
+	GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE0_DL_ASYNC, "vdo1_hdr_gfx_fe0_dl_async", "top_vpp", 21),
+	GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE1_DL_ASYNC, "vdo1_hdr_gfx_fe1_dl_async", "top_vpp", 22),
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_BE_DL_ASYNC, "vdo1_hdr_vdo_be_dl_async", "top_vpp", 23),
+	/* VDO1_3 */
+	GATE_VDO1_3(CLK_VDO1_DPI0, "vdo1_dpi0_ck", "top_vpp", 0),
+	GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPI0, "vdo1_disp_monitor_dpi0_ck", "top_vpp", 1),
+	GATE_VDO1_3(CLK_VDO1_DPI1, "vdo1_dpi1_ck", "top_vpp", 8),
+	GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPI1, "vdo1_disp_monitor_dpi1_ck", "top_vpp", 9),
+	GATE_VDO1_3(CLK_VDO1_DPINTF, "vdo1_dpintf_ck", "top_vpp", 16),
+	GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf_ck", "top_vpp", 17),
+	/* VDO1_4 */
+	GATE_VDO1_4(CLK_VDO1_26M_SLOW, "vdo1_26m_slow_ck", "clk26m", 8),
+};
+
+static int clk_mt8188_vdo1_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_hw_onecell_data *clk_data;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_VDO1_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
+	if (r)
+		goto free_vdo1_data;
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
+	mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
+free_vdo1_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static int clk_mt8188_vdo1_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
+static struct platform_driver clk_mt8188_vdo1_drv = {
+	.probe = clk_mt8188_vdo1_probe,
+	.remove = clk_mt8188_vdo1_remove,
+	.driver = {
+		.name = "clk-mt8188-vdo1",
+	},
+};
+builtin_platform_driver(clk_mt8188_vdo1_drv);
-- 
2.18.0


