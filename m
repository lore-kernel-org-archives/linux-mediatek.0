Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED82C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A61C61027
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A61C61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqtF/FSYMHr+09AwDea4U3CGu9H6uKalKbV+gDeU5QA=; b=A0aah3fzFE89UU
	Rgx12pPDem2XfF8Hi8spol8HNqE0pylckXCGVnsFAz6zJHs/L+d0ezxEC3b74+6XPN7Ei2Fye2y1w
	S07tEyYzGNKhcTOOuqhPBfc/a36ZRv9IH0z3RuRO9URU3l+aTvnnaE+bC4EHAJJXYHs/60/qypk7k
	736HNlH7Lm54c4R/mji5hy/nt3gkGzbcqcO43mNQknuziJVpHqYreaQTfAf0y3XAJ+KbhUIKmLZKI
	DY+Tp+l1v4A9YaDRx+n9mep/ma4jiFYUcGPclzRgdXmr5AWXz/JF4Hu/KTSAAnss3SbYHbUGMDM1C
	XYneEWe6eL6899VUPGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltefy-0082Qh-2Y; Wed, 16 Jun 2021 23:10:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteVw-007xVi-IE; Wed, 16 Jun 2021 23:00:06 +0000
X-UUID: d343449fcc62488382d26196c12ff183-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WjqpQpuRcJi36ZJ9mCbiC/DPBmMV/9CkiQoorbYFY/k=; 
 b=kTPsMDubfPGE1aO94J9MLhu9wpglKOp3N3DNEN71PKgX/KdIvkHiQguEi3IMzwPFHrQL6bhfDE9CaqHVie8eFhdyQQ90wIi1bU6Qc5+jNMmsp8aMMlY6KDWV/4Kuo1eHaU1SrTp9Gttcb3p+O9VqUQLFFQ8+vaGpOMKVLGJrmNE=;
X-UUID: d343449fcc62488382d26196c12ff183-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2132140848; Wed, 16 Jun 2021 15:59:58 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:50:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:50:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 06:50:34 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH 18/22] clk: mediatek: Add MT8195 vppsys0 clock support
Date: Thu, 17 Jun 2021 06:47:39 +0800
Message-ID: <20210616224743.5109-19-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_160004_675098_4AEC5A0A 
X-CRM114-Status: GOOD (  16.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8195 vppsys0 clock provider

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |   6 ++
 drivers/clk/mediatek/Makefile          |   1 +
 drivers/clk/mediatek/clk-mt8195-vpp0.c | 112 +++++++++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vpp0.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 3352686d98cf..2deef026fbb4 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -666,6 +666,12 @@ config COMMON_CLK_MT8195_VENCSYS
 	help
 	  This driver supports MediaTek MT8195 vencsys clocks.
 
+config COMMON_CLK_MT8195_VPPSYS0
+	bool "Clock driver for MediaTek MT8195 vppsys0"
+	depends on COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 vppsys0 clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 76a6b404e34b..34cd7f2c71ac 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -94,5 +94,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS0) += clk-mt8195-vdo0.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS1) += clk-mt8195-vdo1.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS0) += clk-mt8195-vpp0.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
new file mode 100644
index 000000000000..cecd8fab7b7e
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8195-clk.h>
+
+static const struct mtk_gate_regs vpp00_cg_regs = {
+	.set_ofs = 0x24,
+	.clr_ofs = 0x28,
+	.sta_ofs = 0x20,
+};
+
+static const struct mtk_gate_regs vpp01_cg_regs = {
+	.set_ofs = 0x30,
+	.clr_ofs = 0x34,
+	.sta_ofs = 0x2c,
+};
+
+static const struct mtk_gate_regs vpp02_cg_regs = {
+	.set_ofs = 0x3c,
+	.clr_ofs = 0x40,
+	.sta_ofs = 0x38,
+};
+
+#define GATE_VPP00(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vpp00_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VPP01(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vpp01_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VPP02(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vpp02_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate vpp0_clks[] = {
+	/* VPP00 */
+	GATE_VPP00(CLK_VPP0_MDP_FG, "vpp0_mdp_fg", "vpp_sel", 1),
+	GATE_VPP00(CLK_VPP0_STITCH, "vpp0_stitch", "vpp_sel", 2),
+	GATE_VPP00(CLK_VPP0_PADDING, "vpp0_padding", "vpp_sel", 7),
+	GATE_VPP00(CLK_VPP0_MDP_TCC, "vpp0_mdp_tcc", "vpp_sel", 8),
+	GATE_VPP00(CLK_VPP0_WARP0_ASYNC_TX, "vpp0_warp0_async_tx", "vpp_sel", 10),
+	GATE_VPP00(CLK_VPP0_WARP1_ASYNC_TX, "vpp0_warp1_async_tx", "vpp_sel", 11),
+	GATE_VPP00(CLK_VPP0_MUTEX, "vpp0_mutex", "vpp_sel", 13),
+	GATE_VPP00(CLK_VPP0_VPP02VPP1_RELAY, "vpp0_vpp02vpp1_relay", "vpp_sel", 14),
+	GATE_VPP00(CLK_VPP0_VPP12VPP0_ASYNC, "vpp0_vpp12vpp0_async", "vpp_sel", 15),
+	GATE_VPP00(CLK_VPP0_MMSYSRAM_TOP, "vpp0_mmsysram_top", "vpp_sel", 16),
+	GATE_VPP00(CLK_VPP0_MDP_AAL, "vpp0_mdp_aal", "vpp_sel", 17),
+	GATE_VPP00(CLK_VPP0_MDP_RSZ, "vpp0_mdp_rsz", "vpp_sel", 18),
+	/* VPP01 */
+	GATE_VPP01(CLK_VPP0_SMI_COMMON, "vpp0_smi_common", "vpp_sel", 0),
+	GATE_VPP01(CLK_VPP0_GALS_VDO0_LARB0, "vpp0_gals_vdo0_larb0", "vpp_sel", 1),
+	GATE_VPP01(CLK_VPP0_GALS_VDO0_LARB1, "vpp0_gals_vdo0_larb1", "vpp_sel", 2),
+	GATE_VPP01(CLK_VPP0_GALS_VENCSYS, "vpp0_gals_vencsys", "vpp_sel", 3),
+	GATE_VPP01(CLK_VPP0_GALS_VENCSYS_CORE1, "vpp0_gals_vencsys_core1", "vpp_sel", 4),
+	GATE_VPP01(CLK_VPP0_GALS_INFRA, "vpp0_gals_infra", "vpp_sel", 5),
+	GATE_VPP01(CLK_VPP0_GALS_CAMSYS, "vpp0_gals_camsys", "vpp_sel", 6),
+	GATE_VPP01(CLK_VPP0_GALS_VPP1_LARB5, "vpp0_gals_vpp1_larb5", "vpp_sel", 7),
+	GATE_VPP01(CLK_VPP0_GALS_VPP1_LARB6, "vpp0_gals_vpp1_larb6", "vpp_sel", 8),
+	GATE_VPP01(CLK_VPP0_SMI_REORDER, "vpp0_smi_reorder", "vpp_sel", 9),
+	GATE_VPP01(CLK_VPP0_SMI_IOMMU, "vpp0_smi_iommu", "vpp_sel", 10),
+	GATE_VPP01(CLK_VPP0_GALS_IMGSYS_CAMSYS, "vpp0_gals_imgsys_camsys", "vpp_sel", 11),
+	GATE_VPP01(CLK_VPP0_MDP_RDMA, "vpp0_mdp_rdma", "vpp_sel", 12),
+	GATE_VPP01(CLK_VPP0_MDP_WROT, "vpp0_mdp_wrot", "vpp_sel", 13),
+	GATE_VPP01(CLK_VPP0_GALS_EMI0_EMI1, "vpp0_gals_emi0_emi1", "vpp_sel", 16),
+	GATE_VPP01(CLK_VPP0_SMI_SUB_COMMON_REORDER, "vpp0_smi_sub_common_reorder", "vpp_sel", 17),
+	GATE_VPP01(CLK_VPP0_SMI_RSI, "vpp0_smi_rsi", "vpp_sel", 18),
+	GATE_VPP01(CLK_VPP0_SMI_COMMON_LARB4, "vpp0_smi_common_larb4", "vpp_sel", 19),
+	GATE_VPP01(CLK_VPP0_GALS_VDEC_VDEC_CORE1, "vpp0_gals_vdec_vdec_core1", "vpp_sel", 20),
+	GATE_VPP01(CLK_VPP0_GALS_VPP1_WPE, "vpp0_gals_vpp1_wpe", "vpp_sel", 21),
+	GATE_VPP01(CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1, "vpp0_gals_vdo0_vdo1_vencsys_core1",
+		"vpp_sel", 22),
+	GATE_VPP01(CLK_VPP0_FAKE_ENG, "vpp0_fake_eng", "vpp_sel", 23),
+	GATE_VPP01(CLK_VPP0_MDP_HDR, "vpp0_mdp_hdr", "vpp_sel", 24),
+	GATE_VPP01(CLK_VPP0_MDP_TDSHP, "vpp0_mdp_tdshp", "vpp_sel", 25),
+	GATE_VPP01(CLK_VPP0_MDP_COLOR, "vpp0_mdp_color", "vpp_sel", 26),
+	GATE_VPP01(CLK_VPP0_MDP_OVL, "vpp0_mdp_ovl", "vpp_sel", 27),
+	/* VPP02 */
+	GATE_VPP02(CLK_VPP0_WARP0_RELAY, "vpp0_warp0_relay", "wpe_vpp_sel", 0),
+	GATE_VPP02(CLK_VPP0_WARP0_MDP_DL_ASYNC, "vpp0_warp0_mdp_dl_async", "wpe_vpp_sel", 1),
+	GATE_VPP02(CLK_VPP0_WARP1_RELAY, "vpp0_warp1_relay", "wpe_vpp_sel", 2),
+	GATE_VPP02(CLK_VPP0_WARP1_MDP_DL_ASYNC, "vpp0_warp1_mdp_dl_async", "wpe_vpp_sel", 3),
+};
+
+static const struct mtk_clk_desc vpp0_desc = {
+	.clks = vpp0_clks,
+	.num_clks = ARRAY_SIZE(vpp0_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8195_vpp0[] = {
+	{
+		.compatible = "mediatek,mt8195-vppsys0",
+		.data = &vpp0_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8195_vpp0_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8195-vpp0",
+		.of_match_table = of_match_clk_mt8195_vpp0,
+	},
+};
+
+builtin_platform_driver(clk_mt8195_vpp0_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
