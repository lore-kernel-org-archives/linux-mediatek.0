Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00321C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 13:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZvdAgfqzsWOb2CrvCitXroXne6n6eTjfYWBvACiRjI=; b=r3D0D9/hnNuYuqnnKfReRPRSom
	IC01ldDexKAv5FWYCkmY6mcasoc5eS3RACnVhrZOd2rrjJ8F6xIM+d6nI57mQChzD84/XkBACdEo9
	KA1fjyl2KflnZlvyiHNKzxrRY/J+x1GTS81219FdQ2+HTNSXoXjsZJOXLWClyTeCHX041fBRNQicN
	qEFRNNAa7gUxxn/9dz2TA50C2bYy3VBF0bd+iFgFqEHeZkHySQCgaMT1HgtntQrItzaAQ1ruJVcpm
	E6sXiW95WAubA8198cFQx9yfYxO15Dvk9/jPHhT/xVxWRAi6UEyX6v5evO+FgAcebkyEMrc78vugo
	FaRr4YOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGmF-00AGxE-7j; Thu, 09 Mar 2023 13:57:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGj7-00AEwr-BQ; Thu, 09 Mar 2023 13:54:43 +0000
X-UUID: ebce8b1cbe8111edbbe3f76fe852e059-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hZvdAgfqzsWOb2CrvCitXroXne6n6eTjfYWBvACiRjI=;
	b=o+MF9JF6PZh12Mn/V3jTGMEPyYYwYAbtqqTSASDiMpmE9MXVwZL9l+qzKb6ZlHQ4crK2rVMqr32dbHQFz2Yx3PHtj/rJvgRmP7Ywvddul4D7kEYRPgs2W7kJ8kbHchBF6q5Dot2F9Fsnt6PIyXel3QcwVNpHVZdJBKooy0L4SJA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:58a3f547-a8b8-492c-b3c0-3ce933582832,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:b7ecdc27-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: ebce8b1cbe8111edbbe3f76fe852e059-20230309
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 18351340; Thu, 09 Mar 2023 06:54:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 9 Mar 2023 21:54:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 9 Mar 2023 21:54:27 +0800
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
Subject: [PATCH v6 16/19] clk: mediatek: Add MT8188 vppsys1 clock support
Date: Thu, 9 Mar 2023 21:54:16 +0800
Message-ID: <20230309135419.30159-17-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230309135419.30159-1-Garmin.Chang@mediatek.com>
References: <20230309135419.30159-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_055437_509968_79690735 
X-CRM114-Status: GOOD (  18.25  )
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

Add MT8188 vppsys1 clock controller which provides clock gate
controller for Video Processor Pipe.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Makefile          |   2 +-
 drivers/clk/mediatek/clk-mt8188-vpp1.c | 139 +++++++++++++++++++++++++
 2 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vpp1.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index b32ccf53bf77..96628c87a5d4 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -96,7 +96,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
 				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
 				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
 				   clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o \
-				   clk-mt8188-vpp0.o
+				   clk-mt8188-vpp0.o clk-mt8188-vpp1.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-vpp1.c b/drivers/clk/mediatek/clk-mt8188-vpp1.c
new file mode 100644
index 000000000000..78064b7a6f96
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-vpp1.c
@@ -0,0 +1,139 @@
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
+static const struct mtk_gate_regs vpp1_0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs vpp1_1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+#define GATE_VPP1_0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vpp1_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VPP1_1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vpp1_1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate vpp1_clks[] = {
+	/* VPP1_0 */
+	GATE_VPP1_0(CLK_VPP1_SVPP1_MDP_OVL, "vpp1_svpp1_mdp_ovl", "top_vpp", 0),
+	GATE_VPP1_0(CLK_VPP1_SVPP1_MDP_TCC, "vpp1_svpp1_mdp_tcc", "top_vpp", 1),
+	GATE_VPP1_0(CLK_VPP1_SVPP1_MDP_WROT, "vpp1_svpp1_mdp_wrot", "top_vpp", 2),
+	GATE_VPP1_0(CLK_VPP1_SVPP1_VPP_PAD, "vpp1_svpp1_vpp_pad", "top_vpp", 3),
+	GATE_VPP1_0(CLK_VPP1_SVPP2_MDP_WROT, "vpp1_svpp2_mdp_wrot", "top_vpp", 4),
+	GATE_VPP1_0(CLK_VPP1_SVPP2_VPP_PAD, "vpp1_svpp2_vpp_pad", "top_vpp", 5),
+	GATE_VPP1_0(CLK_VPP1_SVPP3_MDP_WROT, "vpp1_svpp3_mdp_wrot", "top_vpp", 6),
+	GATE_VPP1_0(CLK_VPP1_SVPP3_VPP_PAD, "vpp1_svpp3_vpp_pad", "top_vpp", 7),
+	GATE_VPP1_0(CLK_VPP1_SVPP1_MDP_RDMA, "vpp1_svpp1_mdp_rdma", "top_vpp", 8),
+	GATE_VPP1_0(CLK_VPP1_SVPP1_MDP_FG, "vpp1_svpp1_mdp_fg", "top_vpp", 9),
+	GATE_VPP1_0(CLK_VPP1_SVPP2_MDP_RDMA, "vpp1_svpp2_mdp_rdma", "top_vpp", 10),
+	GATE_VPP1_0(CLK_VPP1_SVPP2_MDP_FG, "vpp1_svpp2_mdp_fg", "top_vpp", 11),
+	GATE_VPP1_0(CLK_VPP1_SVPP3_MDP_RDMA, "vpp1_svpp3_mdp_rdma", "top_vpp", 12),
+	GATE_VPP1_0(CLK_VPP1_SVPP3_MDP_FG, "vpp1_svpp3_mdp_fg", "top_vpp", 13),
+	GATE_VPP1_0(CLK_VPP1_VPP_SPLIT, "vpp1_vpp_split", "top_vpp", 14),
+	GATE_VPP1_0(CLK_VPP1_SVPP2_VDO0_DL_RELAY, "vpp1_svpp2_vdo0_dl_relay", "top_vpp", 15),
+	GATE_VPP1_0(CLK_VPP1_SVPP1_MDP_RSZ, "vpp1_svpp1_mdp_rsz", "top_vpp", 16),
+	GATE_VPP1_0(CLK_VPP1_SVPP1_MDP_TDSHP, "vpp1_svpp1_mdp_tdshp", "top_vpp", 17),
+	GATE_VPP1_0(CLK_VPP1_SVPP1_MDP_COLOR, "vpp1_svpp1_mdp_color", "top_vpp", 18),
+	GATE_VPP1_0(CLK_VPP1_SVPP3_VDO1_DL_RELAY, "vpp1_svpp3_vdo1_dl_relay", "top_vpp", 19),
+	GATE_VPP1_0(CLK_VPP1_SVPP2_MDP_RSZ, "vpp1_svpp2_mdp_rsz", "top_vpp", 20),
+	GATE_VPP1_0(CLK_VPP1_SVPP2_VPP_MERGE, "vpp1_svpp2_vpp_merge", "top_vpp", 21),
+	GATE_VPP1_0(CLK_VPP1_SVPP2_MDP_TDSHP, "vpp1_svpp2_mdp_tdshp", "top_vpp", 22),
+	GATE_VPP1_0(CLK_VPP1_SVPP2_MDP_COLOR, "vpp1_svpp2_mdp_color", "top_vpp", 23),
+	GATE_VPP1_0(CLK_VPP1_SVPP3_MDP_RSZ, "vpp1_svpp3_mdp_rsz", "top_vpp", 24),
+	GATE_VPP1_0(CLK_VPP1_SVPP3_VPP_MERGE, "vpp1_svpp3_vpp_merge", "top_vpp", 25),
+	GATE_VPP1_0(CLK_VPP1_SVPP3_MDP_TDSHP, "vpp1_svpp3_mdp_tdshp", "top_vpp", 26),
+	GATE_VPP1_0(CLK_VPP1_SVPP3_MDP_COLOR, "vpp1_svpp3_mdp_color", "top_vpp", 27),
+	GATE_VPP1_0(CLK_VPP1_GALS5, "vpp1_gals5", "top_vpp", 28),
+	GATE_VPP1_0(CLK_VPP1_GALS6, "vpp1_gals6", "top_vpp", 29),
+	GATE_VPP1_0(CLK_VPP1_LARB5, "vpp1_larb5", "top_vpp", 30),
+	GATE_VPP1_0(CLK_VPP1_LARB6, "vpp1_larb6", "top_vpp", 31),
+	/* VPP1_1 */
+	GATE_VPP1_1(CLK_VPP1_SVPP1_MDP_HDR, "vpp1_svpp1_mdp_hdr", "top_vpp", 0),
+	GATE_VPP1_1(CLK_VPP1_SVPP1_MDP_AAL, "vpp1_svpp1_mdp_aal", "top_vpp", 1),
+	GATE_VPP1_1(CLK_VPP1_SVPP2_MDP_HDR, "vpp1_svpp2_mdp_hdr", "top_vpp", 2),
+	GATE_VPP1_1(CLK_VPP1_SVPP2_MDP_AAL, "vpp1_svpp2_mdp_aal", "top_vpp", 3),
+	GATE_VPP1_1(CLK_VPP1_SVPP3_MDP_HDR, "vpp1_svpp3_mdp_hdr", "top_vpp", 4),
+	GATE_VPP1_1(CLK_VPP1_SVPP3_MDP_AAL, "vpp1_svpp3_mdp_aal", "top_vpp", 5),
+	GATE_VPP1_1(CLK_VPP1_DISP_MUTEX, "vpp1_disp_mutex", "top_vpp", 7),
+	GATE_VPP1_1(CLK_VPP1_SVPP2_VDO1_DL_RELAY, "vpp1_svpp2_vdo1_dl_relay", "top_vpp", 8),
+	GATE_VPP1_1(CLK_VPP1_SVPP3_VDO0_DL_RELAY, "vpp1_svpp3_vdo0_dl_relay", "top_vpp", 9),
+	GATE_VPP1_1(CLK_VPP1_VPP0_DL_ASYNC, "vpp1_vpp0_dl_async", "top_vpp", 10),
+	GATE_VPP1_1(CLK_VPP1_VPP0_DL1_RELAY, "vpp1_vpp0_dl1_relay", "top_vpp", 11),
+	GATE_VPP1_1(CLK_VPP1_LARB5_FAKE_ENG, "vpp1_larb5_fake_eng", "top_vpp", 12),
+	GATE_VPP1_1(CLK_VPP1_LARB6_FAKE_ENG, "vpp1_larb6_fake_eng", "top_vpp", 13),
+	GATE_VPP1_1(CLK_VPP1_HDMI_META, "vpp1_hdmi_meta", "top_vpp", 16),
+	GATE_VPP1_1(CLK_VPP1_VPP_SPLIT_HDMI, "vpp1_vpp_split_hdmi", "top_vpp", 17),
+	GATE_VPP1_1(CLK_VPP1_DGI_IN, "vpp1_dgi_in", "top_vpp", 18),
+	GATE_VPP1_1(CLK_VPP1_DGI_OUT, "vpp1_dgi_out", "top_vpp", 19),
+	GATE_VPP1_1(CLK_VPP1_VPP_SPLIT_DGI, "vpp1_vpp_split_dgi", "top_vpp", 20),
+	GATE_VPP1_1(CLK_VPP1_DL_CON_OCC, "vpp1_dl_con_occ", "top_vpp", 21),
+	GATE_VPP1_1(CLK_VPP1_VPP_SPLIT_26M, "vpp1_vpp_split_26m", "top_vpp", 26),
+};
+
+static int clk_mt8188_vpp1_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_hw_onecell_data *clk_data;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_VPP1_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(&pdev->dev, node, vpp1_clks,
+				   ARRAY_SIZE(vpp1_clks), clk_data);
+	if (r)
+		goto free_vpp1_data;
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
+	mtk_clk_unregister_gates(vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
+free_vpp1_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static int clk_mt8188_vpp1_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
+static struct platform_driver clk_mt8188_vpp1_drv = {
+	.probe = clk_mt8188_vpp1_probe,
+	.remove = clk_mt8188_vpp1_remove,
+	.driver = {
+		.name = "clk-mt8188-vpp1",
+	},
+};
+builtin_platform_driver(clk_mt8188_vpp1_drv);
-- 
2.18.0


