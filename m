Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F0FC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB37B61051
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB37B61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1Q7UqCixH11u//pOl+IIysOGcZZJEAmjMh14bLy4EE=; b=1RoYs5TZM8FdIG
	Q7sm3W3AiAeI/h/vg63+xCBq1oLGl+IaPqdtPCljEd9Ao/Rvhl2Bv6N3/3CuFVNSHJej3HYOzFkDc
	WKmpHGn9CcW42A/USeFzkROevMl2nHzHPV5u3n2TsmPSxVO/XCaJRry+/+b3hiMrdubCrARPADdvc
	0Dd415pfOeQueQs/VqFheeztyUo6YlLzEykCy4w6xvDv2FkvYq3Usy5T6gGaIlyZbGfgL/0F9yL5k
	uo29DYeKRjajz/PCQpLf5wd7dBcTPU5ZmAmrwPZwg+a9zmmd6s/K0tVSx0zgG6adaWLzba6vbHGiO
	QGtBEp4uNBFHtcDzxTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2lx-00Aswh-EY; Fri, 20 Aug 2021 11:33:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2X5-00AmMb-Ci; Fri, 20 Aug 2021 11:18:03 +0000
X-UUID: a57e3b8c724040609bc51b0367de0fdc-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lyOo8EaFj26gwtiSl0uin4oUXhZWVoMweKTsnEVSXns=; 
 b=pO2qSTjXmg+lT3UnfWXKonHwu2L+O3sz7yR/f6tA4baZawpGyUXsISuQylBHi5hucnJY6yXENPgFhZ+2p2FnAKQVp555cjhFvl+M4cvGxXAk/4qpgdPb1h+6hynuQvXyt09FUNZF6wfX/SsF4ss0ymPLz/Tncb8bxZQgjbYnruQ=;
X-UUID: a57e3b8c724040609bc51b0367de0fdc-20210820
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1998001422; Fri, 20 Aug 2021 04:17:51 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 04:17:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 19:17:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Aug 2021 19:17:47 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v2 20/24] clk: mediatek: Add MT8195 vppsys0 clock support
Date: Fri, 20 Aug 2021 19:15:00 +0800
Message-ID: <20210820111504.350-21-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210820111504.350-1-chun-jie.chen@mediatek.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_041755_524642_D0854F8C 
X-CRM114-Status: GOOD (  16.15  )
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

Add MT8195 vppsys0 clock controller which provides clock gate
controller for Video Processor Pipe.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Makefile          |   2 +-
 drivers/clk/mediatek/clk-mt8195-vpp0.c | 110 +++++++++++++++++++++++++
 2 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vpp0.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 82ffcc4f2c52..8694f070e2d0 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -82,6 +82,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
 					clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
-					clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o clk-mt8195-venc.o
+					clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o clk-mt8195-venc.o clk-mt8195-vpp0.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
new file mode 100644
index 000000000000..736bf0948540
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mt8195-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
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
+	GATE_VPP0_0(CLK_VPP0_VPP02VPP1_RELAY, "vpp0_vpp02vpp1_relay", "top_vpp", 14),
+	GATE_VPP0_0(CLK_VPP0_VPP12VPP0_ASYNC, "vpp0_vpp12vpp0_async", "top_vpp", 15),
+	GATE_VPP0_0(CLK_VPP0_MMSYSRAM_TOP, "vpp0_mmsysram_top", "top_vpp", 16),
+	GATE_VPP0_0(CLK_VPP0_MDP_AAL, "vpp0_mdp_aal", "top_vpp", 17),
+	GATE_VPP0_0(CLK_VPP0_MDP_RSZ, "vpp0_mdp_rsz", "top_vpp", 18),
+	/* VPP0_1 */
+	GATE_VPP0_1(CLK_VPP0_SMI_COMMON, "vpp0_smi_common", "top_vpp", 0),
+	GATE_VPP0_1(CLK_VPP0_GALS_VDO0_LARB0, "vpp0_gals_vdo0_larb0", "top_vpp", 1),
+	GATE_VPP0_1(CLK_VPP0_GALS_VDO0_LARB1, "vpp0_gals_vdo0_larb1", "top_vpp", 2),
+	GATE_VPP0_1(CLK_VPP0_GALS_VENCSYS, "vpp0_gals_vencsys", "top_vpp", 3),
+	GATE_VPP0_1(CLK_VPP0_GALS_VENCSYS_CORE1, "vpp0_gals_vencsys_core1", "top_vpp", 4),
+	GATE_VPP0_1(CLK_VPP0_GALS_INFRA, "vpp0_gals_infra", "top_vpp", 5),
+	GATE_VPP0_1(CLK_VPP0_GALS_CAMSYS, "vpp0_gals_camsys", "top_vpp", 6),
+	GATE_VPP0_1(CLK_VPP0_GALS_VPP1_LARB5, "vpp0_gals_vpp1_larb5", "top_vpp", 7),
+	GATE_VPP0_1(CLK_VPP0_GALS_VPP1_LARB6, "vpp0_gals_vpp1_larb6", "top_vpp", 8),
+	GATE_VPP0_1(CLK_VPP0_SMI_REORDER, "vpp0_smi_reorder", "top_vpp", 9),
+	GATE_VPP0_1(CLK_VPP0_SMI_IOMMU, "vpp0_smi_iommu", "top_vpp", 10),
+	GATE_VPP0_1(CLK_VPP0_GALS_IMGSYS_CAMSYS, "vpp0_gals_imgsys_camsys", "top_vpp", 11),
+	GATE_VPP0_1(CLK_VPP0_MDP_RDMA, "vpp0_mdp_rdma", "top_vpp", 12),
+	GATE_VPP0_1(CLK_VPP0_MDP_WROT, "vpp0_mdp_wrot", "top_vpp", 13),
+	GATE_VPP0_1(CLK_VPP0_GALS_EMI0_EMI1, "vpp0_gals_emi0_emi1", "top_vpp", 16),
+	GATE_VPP0_1(CLK_VPP0_SMI_SUB_COMMON_REORDER, "vpp0_smi_sub_common_reorder", "top_vpp", 17),
+	GATE_VPP0_1(CLK_VPP0_SMI_RSI, "vpp0_smi_rsi", "top_vpp", 18),
+	GATE_VPP0_1(CLK_VPP0_SMI_COMMON_LARB4, "vpp0_smi_common_larb4", "top_vpp", 19),
+	GATE_VPP0_1(CLK_VPP0_GALS_VDEC_VDEC_CORE1, "vpp0_gals_vdec_vdec_core1", "top_vpp", 20),
+	GATE_VPP0_1(CLK_VPP0_GALS_VPP1_WPE, "vpp0_gals_vpp1_wpe", "top_vpp", 21),
+	GATE_VPP0_1(CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1, "vpp0_gals_vdo0_vdo1_vencsys_core1",
+		    "top_vpp", 22),
+	GATE_VPP0_1(CLK_VPP0_FAKE_ENG, "vpp0_fake_eng", "top_vpp", 23),
+	GATE_VPP0_1(CLK_VPP0_MDP_HDR, "vpp0_mdp_hdr", "top_vpp", 24),
+	GATE_VPP0_1(CLK_VPP0_MDP_TDSHP, "vpp0_mdp_tdshp", "top_vpp", 25),
+	GATE_VPP0_1(CLK_VPP0_MDP_COLOR, "vpp0_mdp_color", "top_vpp", 26),
+	GATE_VPP0_1(CLK_VPP0_MDP_OVL, "vpp0_mdp_ovl", "top_vpp", 27),
+	/* VPP0_2 */
+	GATE_VPP0_2(CLK_VPP0_WARP0_RELAY, "vpp0_warp0_relay", "top_wpe_vpp", 0),
+	GATE_VPP0_2(CLK_VPP0_WARP0_MDP_DL_ASYNC, "vpp0_warp0_mdp_dl_async", "top_wpe_vpp", 1),
+	GATE_VPP0_2(CLK_VPP0_WARP1_RELAY, "vpp0_warp1_relay", "top_wpe_vpp", 2),
+	GATE_VPP0_2(CLK_VPP0_WARP1_MDP_DL_ASYNC, "vpp0_warp1_mdp_dl_async", "top_wpe_vpp", 3),
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
+builtin_platform_driver(clk_mt8195_vpp0_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
