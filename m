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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D765C48BE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C64D261027
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C64D261027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzlhSIrwyNRGSIRWE8fMHaTEgmmrkAjJFvHflIvJydE=; b=qPzJ//8uFUvE3y
	ZRyBd10bRbEfNI4xdXHShtHnOj42qg4e+f16Q/eP4w8HnPia3xnlKAD3PQAugoHoFzpD2otOmp2yf
	Fc9XF1QpwnD5nTGAjAAaMg8CLgHFO7fGaQr5oWnvFmjl+4bnwMcFmX98HD6mdJUuHb6mBHR/Wm8xC
	QfbWBBkDb0WM6Pkmb2dmuVEGRtqPJUNpUHUo2QF3qZAU0YdQbvn6qM1UYOMUOlXnwfeZ/YIMVIlIs
	ftjf8uzDEIltYn0r6CjDXhT7aLf9Z9AVeMfPdwG+GIWbC7Orzh1pTLMHtQpRCkBUKmr7LbRWpet+n
	uv4Ef3yj4srjUqTybe0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteYl-007z2b-IF; Wed, 16 Jun 2021 23:02:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteVQ-007xLj-DK; Wed, 16 Jun 2021 22:59:34 +0000
X-UUID: e8ede972842442c981b1cedca6db7d9a-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WEpT4lb7sEvnglxMaAPWfetaZ1r9hsQbcOQ9wKz9LdQ=; 
 b=At9paX3NLQvu2Ruz+20YP2V9GlvMT5Acsu0yXxvVXgKJVIk9oh6jgZorN1CADuPT1tND13cqWUk95jVkiAUbhomwxNR/R/MJVGG5SlWZ2HjFBxeAJv8dK+/KurrsDD3eqD61RcUV78+W6uoYvn/Ir7nRpIjmuf/ohhSF0q5+OtE=;
X-UUID: e8ede972842442c981b1cedca6db7d9a-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1878505105; Wed, 16 Jun 2021 15:59:29 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:50:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:50:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 06:50:24 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH 16/22] clk: mediatek: Add MT8195 vdosys1 clock support
Date: Thu, 17 Jun 2021 06:47:37 +0800
Message-ID: <20210616224743.5109-17-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_155932_505167_F514D6AA 
X-CRM114-Status: GOOD (  16.45  )
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

Add MT8195 vdosys1 clock provider

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |   6 ++
 drivers/clk/mediatek/Makefile          |   1 +
 drivers/clk/mediatek/clk-mt8195-vdo1.c | 131 +++++++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vdo1.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 6602f9ba13c7..1e89c68f6c6c 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -654,6 +654,12 @@ config COMMON_CLK_MT8195_VDOSYS0
 	help
 	  This driver supports MediaTek MT8195 vdosys0 clocks.
 
+config COMMON_CLK_MT8195_VDOSYS1
+	bool "Clock driver for MediaTek MT8195 vdosys1"
+	depends on COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 vdosys1 clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 6aa1ba00342a..76c0fa837cb0 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -92,5 +92,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_SCP_ADSP) += clk-mt8195-scp_adsp.o
 obj-$(CONFIG_COMMON_CLK_MT8195_NNASYS) += clk-mt8195-nna.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS0) += clk-mt8195-vdo0.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS1) += clk-mt8195-vdo1.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
new file mode 100644
index 000000000000..4d16f2e9c03a
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -0,0 +1,131 @@
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
+static const struct mtk_gate_regs vdo10_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs vdo11_cg_regs = {
+	.set_ofs = 0x124,
+	.clr_ofs = 0x128,
+	.sta_ofs = 0x120,
+};
+
+static const struct mtk_gate_regs vdo12_cg_regs = {
+	.set_ofs = 0x134,
+	.clr_ofs = 0x138,
+	.sta_ofs = 0x130,
+};
+
+static const struct mtk_gate_regs vdo13_cg_regs = {
+	.set_ofs = 0x144,
+	.clr_ofs = 0x148,
+	.sta_ofs = 0x140,
+};
+
+#define GATE_VDO10(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo10_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO11(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo11_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO12(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo12_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO13(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo13_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate vdo1_clks[] = {
+	/* VDO10 */
+	GATE_VDO10(CLK_VDO1_SMI_LARB2, "vdo1_smi_larb2", "vpp_sel", 0),
+	GATE_VDO10(CLK_VDO1_SMI_LARB3, "vdo1_smi_larb3", "vpp_sel", 1),
+	GATE_VDO10(CLK_VDO1_GALS, "vdo1_gals", "vpp_sel", 2),
+	GATE_VDO10(CLK_VDO1_FAKE_ENG0, "vdo1_fake_eng0", "vpp_sel", 3),
+	GATE_VDO10(CLK_VDO1_FAKE_ENG, "vdo1_fake_eng", "vpp_sel", 4),
+	GATE_VDO10(CLK_VDO1_MDP_RDMA0, "vdo1_mdp_rdma0", "vpp_sel", 5),
+	GATE_VDO10(CLK_VDO1_MDP_RDMA1, "vdo1_mdp_rdma1", "vpp_sel", 6),
+	GATE_VDO10(CLK_VDO1_MDP_RDMA2, "vdo1_mdp_rdma2", "vpp_sel", 7),
+	GATE_VDO10(CLK_VDO1_MDP_RDMA3, "vdo1_mdp_rdma3", "vpp_sel", 8),
+	GATE_VDO10(CLK_VDO1_VPP_MERGE0, "vdo1_vpp_merge0", "vpp_sel", 9),
+	GATE_VDO10(CLK_VDO1_VPP_MERGE1, "vdo1_vpp_merge1", "vpp_sel", 10),
+	GATE_VDO10(CLK_VDO1_VPP_MERGE2, "vdo1_vpp_merge2", "vpp_sel", 11),
+	GATE_VDO10(CLK_VDO1_VPP_MERGE3, "vdo1_vpp_merge3", "vpp_sel", 12),
+	GATE_VDO10(CLK_VDO1_VPP_MERGE4, "vdo1_vpp_merge4", "vpp_sel", 13),
+	GATE_VDO10(CLK_VDO1_VPP2_TO_VDO1_DL_ASYNC, "vdo1_vpp2_to_vdo1_dl_async", "vpp_sel", 14),
+	GATE_VDO10(CLK_VDO1_VPP3_TO_VDO1_DL_ASYNC, "vdo1_vpp3_to_vdo1_dl_async", "vpp_sel", 15),
+	GATE_VDO10(CLK_VDO1_DISP_MUTEX, "vdo1_disp_mutex", "vpp_sel", 16),
+	GATE_VDO10(CLK_VDO1_MDP_RDMA4, "vdo1_mdp_rdma4", "vpp_sel", 17),
+	GATE_VDO10(CLK_VDO1_MDP_RDMA5, "vdo1_mdp_rdma5", "vpp_sel", 18),
+	GATE_VDO10(CLK_VDO1_MDP_RDMA6, "vdo1_mdp_rdma6", "vpp_sel", 19),
+	GATE_VDO10(CLK_VDO1_MDP_RDMA7, "vdo1_mdp_rdma7", "vpp_sel", 20),
+	GATE_VDO10(CLK_VDO1_DP_INTF0_MM, "vdo1_dp_intf0_mm", "vpp_sel", 21),
+	GATE_VDO10(CLK_VDO1_DPI0_MM, "vdo1_dpi0_mm", "vpp_sel", 22),
+	GATE_VDO10(CLK_VDO1_DPI1_MM, "vdo1_dpi1_mm", "vpp_sel", 23),
+	GATE_VDO10(CLK_VDO1_DISP_MONITOR, "vdo1_disp_monitor", "vpp_sel", 24),
+	GATE_VDO10(CLK_VDO1_MERGE0_DL_ASYNC, "vdo1_merge0_dl_async", "vpp_sel", 25),
+	GATE_VDO10(CLK_VDO1_MERGE1_DL_ASYNC, "vdo1_merge1_dl_async", "vpp_sel", 26),
+	GATE_VDO10(CLK_VDO1_MERGE2_DL_ASYNC, "vdo1_merge2_dl_async", "vpp_sel", 27),
+	GATE_VDO10(CLK_VDO1_MERGE3_DL_ASYNC, "vdo1_merge3_dl_async", "vpp_sel", 28),
+	GATE_VDO10(CLK_VDO1_MERGE4_DL_ASYNC, "vdo1_merge4_dl_async", "vpp_sel", 29),
+	GATE_VDO10(CLK_VDO1_VDO0_DSC_TO_VDO1_DL_ASYNC, "vdo1_vdo0_dsc_to_vdo1_dl_async",
+		"vpp_sel", 30),
+	GATE_VDO10(CLK_VDO1_VDO0_MERGE_TO_VDO1_DL_ASYNC, "vdo1_vdo0_merge_to_vdo1_dl_async",
+		"vpp_sel", 31),
+	/* VDO11 */
+	GATE_VDO11(CLK_VDO1_HDR_VDO_FE0, "vdo1_hdr_vdo_fe0", "vpp_sel", 0),
+	GATE_VDO11(CLK_VDO1_HDR_GFX_FE0, "vdo1_hdr_gfx_fe0", "vpp_sel", 1),
+	GATE_VDO11(CLK_VDO1_HDR_VDO_BE, "vdo1_hdr_vdo_be", "vpp_sel", 2),
+	GATE_VDO11(CLK_VDO1_HDR_VDO_FE1, "vdo1_hdr_vdo_fe1", "vpp_sel", 16),
+	GATE_VDO11(CLK_VDO1_HDR_GFX_FE1, "vdo1_hdr_gfx_fe1", "vpp_sel", 17),
+	GATE_VDO11(CLK_VDO1_DISP_MIXER, "vdo1_disp_mixer", "vpp_sel", 18),
+	GATE_VDO11(CLK_VDO1_HDR_VDO_FE0_DL_ASYNC, "vdo1_hdr_vdo_fe0_dl_async", "vpp_sel", 19),
+	GATE_VDO11(CLK_VDO1_HDR_VDO_FE1_DL_ASYNC, "vdo1_hdr_vdo_fe1_dl_async", "vpp_sel", 20),
+	GATE_VDO11(CLK_VDO1_HDR_GFX_FE0_DL_ASYNC, "vdo1_hdr_gfx_fe0_dl_async", "vpp_sel", 21),
+	GATE_VDO11(CLK_VDO1_HDR_GFX_FE1_DL_ASYNC, "vdo1_hdr_gfx_fe1_dl_async", "vpp_sel", 22),
+	GATE_VDO11(CLK_VDO1_HDR_VDO_BE_DL_ASYNC, "vdo1_hdr_vdo_be_dl_async", "vpp_sel", 23),
+	/* VDO12 */
+	GATE_VDO12(CLK_VDO1_DPI0, "vdo1_dpi0", "vpp_sel", 0),
+	GATE_VDO12(CLK_VDO1_DISP_MONITOR_DPI0, "vdo1_disp_monitor_dpi0", "vpp_sel", 1),
+	GATE_VDO12(CLK_VDO1_DPI1, "vdo1_dpi1", "vpp_sel", 8),
+	GATE_VDO12(CLK_VDO1_DISP_MONITOR_DPI1, "vdo1_disp_monitor_dpi1", "vpp_sel", 9),
+	GATE_VDO12(CLK_VDO1_DPINTF, "vdo1_dpintf", "vpp_sel", 16),
+	GATE_VDO12(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf", "vpp_sel", 17),
+	/* VDO13 */
+	GATE_VDO13(CLK_VDO1_26M_SLOW, "vdo1_26m_slow", "clk26m", 8),
+};
+
+static const struct mtk_clk_desc vdo1_desc = {
+	.clks = vdo1_clks,
+	.num_clks = ARRAY_SIZE(vdo1_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8195_vdo1[] = {
+	{
+		.compatible = "mediatek,mt8195-vdosys1",
+		.data = &vdo1_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8195_vdo1_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8195-vdo1",
+		.of_match_table = of_match_clk_mt8195_vdo1,
+	},
+};
+
+builtin_platform_driver(clk_mt8195_vdo1_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
