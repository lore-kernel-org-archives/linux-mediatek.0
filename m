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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC412C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:00:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830F5613CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830F5613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NHhwvBeN63PS+pcKE1HinGUQWuNKKaPMwu66Eu7818=; b=XO9rYQjhPCFOYM
	A9P/YIqepLTyxF8FnESKb1U9jDayWloErPL/XNdkUqAWI+DdnxQ6/lRDhKtw2e6kL9wFtsHRqiVMl
	ir6RPYfPxmoabwAyTr5D8fYnwlse6z5uW1sS7oQgMOnycs2L/AuXVL+2qMeolJG1zIm6g8Vd4q/kR
	1n/Qe8DcZRYq6fPuPFxE7CASqpt6/nbR3e5a9QXuN6yt1KaFcinWIiU6le7qvv93eSDFR8vLoAwGE
	ZourhTchrvyCs48l8w58+uB1L6qsxZ1R9eh9CJhDTm8PTsEEBVAebbc7oTZZTGi+Dh127xBGgHmi3
	auKkNg+nS5LJP5bFJu9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteVt-007xVA-W2; Wed, 16 Jun 2021 23:00:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteVG-007xHE-Tg; Wed, 16 Jun 2021 22:59:24 +0000
X-UUID: 2918da0429234c5eac85d4ff876e5739-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wTWI6ftXMctPCnY3lsaRG8dw+p9FZyT03Spuc+ZSaIc=; 
 b=nvO7jrOLUaSUBvxVL9t9tgEMydkGTkba7w9cILoNEY65QGU3sltUtgMbmLwd1JQQ3RkWDD8NgyiWpyoVH7vt/ZGlfacDuiboZsElaZfIuPXaVs+ljnQBddXggHMg8QSJroRomGu8U0JtxB5859JUtKpgRy0+cxDreSLG1lPrfs0=;
X-UUID: 2918da0429234c5eac85d4ff876e5739-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 823169773; Wed, 16 Jun 2021 15:59:19 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:50:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:50:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 06:50:39 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH 19/22] clk: mediatek: Add MT8195 vppsys1 clock support
Date: Thu, 17 Jun 2021 06:47:40 +0800
Message-ID: <20210616224743.5109-20-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_155923_008364_A657F28B 
X-CRM114-Status: GOOD (  16.41  )
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

Add MT8195 vppsys1 clock provider

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |   6 ++
 drivers/clk/mediatek/Makefile          |   1 +
 drivers/clk/mediatek/clk-mt8195-vpp1.c | 110 +++++++++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vpp1.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2deef026fbb4..91b1c19da1ab 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -672,6 +672,12 @@ config COMMON_CLK_MT8195_VPPSYS0
 	help
 	  This driver supports MediaTek MT8195 vppsys0 clocks.
 
+config COMMON_CLK_MT8195_VPPSYS1
+	bool "Clock driver for MediaTek MT8195 vppsys1"
+	depends on COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 vppsys1 clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 34cd7f2c71ac..fbf57473bb91 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -95,5 +95,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS0) += clk-mt8195-vdo0.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS1) += clk-mt8195-vdo1.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS0) += clk-mt8195-vpp0.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS1) += clk-mt8195-vpp1.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
new file mode 100644
index 000000000000..0650ba86d5b6
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
@@ -0,0 +1,110 @@
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
+static const struct mtk_gate_regs vpp10_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs vpp11_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+#define GATE_VPP10(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vpp10_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VPP11(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vpp11_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate vpp1_clks[] = {
+	/* VPP10 */
+	GATE_VPP10(CLK_VPP1_SVPP1_MDP_OVL, "vpp1_svpp1_mdp_ovl", "vpp_sel", 0),
+	GATE_VPP10(CLK_VPP1_SVPP1_MDP_TCC, "vpp1_svpp1_mdp_tcc", "vpp_sel", 1),
+	GATE_VPP10(CLK_VPP1_SVPP1_MDP_WROT, "vpp1_svpp1_mdp_wrot", "vpp_sel", 2),
+	GATE_VPP10(CLK_VPP1_SVPP1_VPP_PAD, "vpp1_svpp1_vpp_pad", "vpp_sel", 3),
+	GATE_VPP10(CLK_VPP1_SVPP2_MDP_WROT, "vpp1_svpp2_mdp_wrot", "vpp_sel", 4),
+	GATE_VPP10(CLK_VPP1_SVPP2_VPP_PAD, "vpp1_svpp2_vpp_pad", "vpp_sel", 5),
+	GATE_VPP10(CLK_VPP1_SVPP3_MDP_WROT, "vpp1_svpp3_mdp_wrot", "vpp_sel", 6),
+	GATE_VPP10(CLK_VPP1_SVPP3_VPP_PAD, "vpp1_svpp3_vpp_pad", "vpp_sel", 7),
+	GATE_VPP10(CLK_VPP1_SVPP1_MDP_RDMA, "vpp1_svpp1_mdp_rdma", "vpp_sel", 8),
+	GATE_VPP10(CLK_VPP1_SVPP1_MDP_FG, "vpp1_svpp1_mdp_fg", "vpp_sel", 9),
+	GATE_VPP10(CLK_VPP1_SVPP2_MDP_RDMA, "vpp1_svpp2_mdp_rdma", "vpp_sel", 10),
+	GATE_VPP10(CLK_VPP1_SVPP2_MDP_FG, "vpp1_svpp2_mdp_fg", "vpp_sel", 11),
+	GATE_VPP10(CLK_VPP1_SVPP3_MDP_RDMA, "vpp1_svpp3_mdp_rdma", "vpp_sel", 12),
+	GATE_VPP10(CLK_VPP1_SVPP3_MDP_FG, "vpp1_svpp3_mdp_fg", "vpp_sel", 13),
+	GATE_VPP10(CLK_VPP1_VPP_SPLIT, "vpp1_vpp_split", "vpp_sel", 14),
+	GATE_VPP10(CLK_VPP1_SVPP2_VDO0_DL_RELAY, "vpp1_svpp2_vdo0_dl_relay", "vpp_sel", 15),
+	GATE_VPP10(CLK_VPP1_SVPP1_MDP_TDSHP, "vpp1_svpp1_mdp_tdshp", "vpp_sel", 16),
+	GATE_VPP10(CLK_VPP1_SVPP1_MDP_COLOR, "vpp1_svpp1_mdp_color", "vpp_sel", 17),
+	GATE_VPP10(CLK_VPP1_SVPP3_VDO1_DL_RELAY, "vpp1_svpp3_vdo1_dl_relay", "vpp_sel", 18),
+	GATE_VPP10(CLK_VPP1_SVPP2_VPP_MERGE, "vpp1_svpp2_vpp_merge", "vpp_sel", 19),
+	GATE_VPP10(CLK_VPP1_SVPP2_MDP_COLOR, "vpp1_svpp2_mdp_color", "vpp_sel", 20),
+	GATE_VPP10(CLK_VPP1_VPPSYS1_GALS, "vpp1_vppsys1_gals", "vpp_sel", 21),
+	GATE_VPP10(CLK_VPP1_SVPP3_VPP_MERGE, "vpp1_svpp3_vpp_merge", "vpp_sel", 22),
+	GATE_VPP10(CLK_VPP1_SVPP3_MDP_COLOR, "vpp1_svpp3_mdp_color", "vpp_sel", 23),
+	GATE_VPP10(CLK_VPP1_VPPSYS1_LARB, "vpp1_vppsys1_larb", "vpp_sel", 24),
+	GATE_VPP10(CLK_VPP1_SVPP1_MDP_RSZ, "vpp1_svpp1_mdp_rsz", "vpp_sel", 25),
+	GATE_VPP10(CLK_VPP1_SVPP1_MDP_HDR, "vpp1_svpp1_mdp_hdr", "vpp_sel", 26),
+	GATE_VPP10(CLK_VPP1_SVPP1_MDP_AAL, "vpp1_svpp1_mdp_aal", "vpp_sel", 27),
+	GATE_VPP10(CLK_VPP1_SVPP2_MDP_HDR, "vpp1_svpp2_mdp_hdr", "vpp_sel", 28),
+	GATE_VPP10(CLK_VPP1_SVPP2_MDP_AAL, "vpp1_svpp2_mdp_aal", "vpp_sel", 29),
+	GATE_VPP10(CLK_VPP1_DL_ASYNC, "vpp1_dl_async", "vpp_sel", 30),
+	GATE_VPP10(CLK_VPP1_LARB5_FAKE_ENG, "vpp1_larb5_fake_eng", "vpp_sel", 31),
+	/* VPP11 */
+	GATE_VPP11(CLK_VPP1_SVPP3_MDP_HDR, "vpp1_svpp3_mdp_hdr", "vpp_sel", 0),
+	GATE_VPP11(CLK_VPP1_SVPP3_MDP_AAL, "vpp1_svpp3_mdp_aal", "vpp_sel", 1),
+	GATE_VPP11(CLK_VPP1_SVPP2_VDO1_DL_RELAY, "vpp1_svpp2_vdo1_dl_relay", "vpp_sel", 2),
+	GATE_VPP11(CLK_VPP1_LARB6_FAKE_ENG, "vpp1_larb6_fake_eng", "vpp_sel", 3),
+	GATE_VPP11(CLK_VPP1_SVPP2_MDP_RSZ, "vpp1_svpp2_mdp_rsz", "vpp_sel", 4),
+	GATE_VPP11(CLK_VPP1_SVPP3_MDP_RSZ, "vpp1_svpp3_mdp_rsz", "vpp_sel", 5),
+	GATE_VPP11(CLK_VPP1_SVPP3_VDO0_DL_RELAY, "vpp1_svpp3_vdo0_dl_relay", "vpp_sel", 6),
+	GATE_VPP11(CLK_VPP1_DISP_MUTEX, "vpp1_disp_mutex", "vpp_sel", 7),
+	GATE_VPP11(CLK_VPP1_SVPP2_MDP_TDSHP, "vpp1_svpp2_mdp_tdshp", "vpp_sel", 8),
+	GATE_VPP11(CLK_VPP1_SVPP3_MDP_TDSHP, "vpp1_svpp3_mdp_tdshp", "vpp_sel", 9),
+	GATE_VPP11(CLK_VPP1_VPP0_DL1_RELAY, "vpp1_vpp0_dl1_relay", "vpp_sel", 10),
+	GATE_VPP11(CLK_VPP1_HDMI_META, "vpp1_hdmi_meta", "hdmirx_p", 11),
+	GATE_VPP11(CLK_VPP1_VPP_SPLIT_HDMI, "vpp1_vpp_split_hdmi", "hdmirx_p", 12),
+	GATE_VPP11(CLK_VPP1_DGI_IN, "vpp1_dgi_in", "in_dgi", 13),
+	GATE_VPP11(CLK_VPP1_DGI_OUT, "vpp1_dgi_out", "dgi_out_sel", 14),
+	GATE_VPP11(CLK_VPP1_VPP_SPLIT_DGI, "vpp1_vpp_split_dgi", "dgi_out_sel", 15),
+	GATE_VPP11(CLK_VPP1_VPP0_DL_ASYNC, "vpp1_vpp0_dl_async", "vpp_sel", 16),
+	GATE_VPP11(CLK_VPP1_VPP0_DL_RELAY, "vpp1_vpp0_dl_relay", "vpp_sel", 17),
+	GATE_VPP11(CLK_VPP1_VPP_SPLIT_26M, "vpp1_vpp_split_26m", "clk26m", 26),
+};
+
+static const struct mtk_clk_desc vpp1_desc = {
+	.clks = vpp1_clks,
+	.num_clks = ARRAY_SIZE(vpp1_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8195_vpp1[] = {
+	{
+		.compatible = "mediatek,mt8195-vppsys1",
+		.data = &vpp1_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8195_vpp1_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8195-vpp1",
+		.of_match_table = of_match_clk_mt8195_vpp1,
+	},
+};
+
+builtin_platform_driver(clk_mt8195_vpp1_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
