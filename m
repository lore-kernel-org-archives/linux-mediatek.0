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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6D4C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:03:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3E261027
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A3E261027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cw/TylfLxT43/xNRaBNH2yaU9M2Q9Rxf67VdwfAEkCw=; b=x+eLsX6yr6DX1Z
	pMHqRFKbZtyEF9qMSjB+Db6IB7Xhw5XzeJckAJK5xnTxwXsTH2wFm2LP4Y2Sk0D/sxgiJr8wPQLaj
	o3Vbwas3lpv3OWyXht8jctppNhUCh359CdLR53KGgC6gbxsJ9XXKKykaJKkCA/hpoUV8F6zHpI46m
	sTO6lpzWUDuSQWCitFxtse9rk4Gfbs7pQ/TEellSKHnvsB/0H+z0Gkq55+hpbiIgyUYNmrJtewHmP
	SdEUkO4dpuVabctkiF/2wovlbyl0M6Y8sF/px5RYpFX92EeWUVLJc2XXdTEOcI3++CUAeKfvAsuvz
	dAVj8ZaPfEPx37pWOsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteZO-007zO6-AS; Wed, 16 Jun 2021 23:03:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteVR-007xLK-5Y; Wed, 16 Jun 2021 22:59:35 +0000
X-UUID: cd34aa093ac343da9887cdaf9f599815-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uFs6DBPdlhzaIZizo/jQ45YrogZQNcjlynaX3UQwB8M=; 
 b=UfHsv3UMbOwtLc3AQ/+SooFX0t9qaYyXtHGDdKIn+fei9+BznzsDrfNj37qCSsWPLJlQIsca6gFnlfPA2b6+BrgztuoGwPpuJA0ZBdQ2od1s/ZIbIr/BXwRkIcUB39JnDOuxRIMxj++ZWR1z6zuYA1H5v5XCztAWqww1BlfowiE=;
X-UUID: cd34aa093ac343da9887cdaf9f599815-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1166207303; Wed, 16 Jun 2021 15:59:29 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:50:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:50:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 06:50:20 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH 15/22] clk: mediatek: Add MT8195 vdosys0 clock support
Date: Thu, 17 Jun 2021 06:47:36 +0800
Message-ID: <20210616224743.5109-16-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_155933_291422_9D78CCA6 
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

Add MT8195 vdosys0 clock provider

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |   6 ++
 drivers/clk/mediatek/Makefile          |   1 +
 drivers/clk/mediatek/clk-mt8195-vdo0.c | 114 +++++++++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vdo0.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index b7881b8ebb23..6602f9ba13c7 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -648,6 +648,12 @@ config COMMON_CLK_MT8195_VDECSYS
 	help
 	  This driver supports MediaTek MT8195 vdecsys clocks.
 
+config COMMON_CLK_MT8195_VDOSYS0
+	bool "Clock driver for MediaTek MT8195 vdosys0"
+	depends on COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 vdosys0 clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 9acfa705f1de..6aa1ba00342a 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -91,5 +91,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_MFGCFG) += clk-mt8195-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8195_SCP_ADSP) += clk-mt8195-scp_adsp.o
 obj-$(CONFIG_COMMON_CLK_MT8195_NNASYS) += clk-mt8195-nna.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS0) += clk-mt8195-vdo0.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
new file mode 100644
index 000000000000..4a34ccb0beed
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
@@ -0,0 +1,114 @@
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
+static const struct mtk_gate_regs vdo00_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs vdo01_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs vdo02_cg_regs = {
+	.set_ofs = 0x124,
+	.clr_ofs = 0x128,
+	.sta_ofs = 0x120,
+};
+
+#define GATE_VDO00(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo00_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO01(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo01_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO02(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo02_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate vdo0_clks[] = {
+	/* VDO00 */
+	GATE_VDO00(CLK_VDO0_DISP_OVL0, "vdo0_disp_ovl0", "vpp_sel", 0),
+	GATE_VDO00(CLK_VDO0_DISP_COLOR0, "vdo0_disp_color0", "vpp_sel", 2),
+	GATE_VDO00(CLK_VDO0_DISP_COLOR1, "vdo0_disp_color1", "vpp_sel", 3),
+	GATE_VDO00(CLK_VDO0_DISP_CCORR0, "vdo0_disp_ccorr0", "vpp_sel", 4),
+	GATE_VDO00(CLK_VDO0_DISP_CCORR1, "vdo0_disp_ccorr1", "vpp_sel", 5),
+	GATE_VDO00(CLK_VDO0_DISP_AAL0, "vdo0_disp_aal0", "vpp_sel", 6),
+	GATE_VDO00(CLK_VDO0_DISP_AAL1, "vdo0_disp_aal1", "vpp_sel", 7),
+	GATE_VDO00(CLK_VDO0_DISP_GAMMA0, "vdo0_disp_gamma0", "vpp_sel", 8),
+	GATE_VDO00(CLK_VDO0_DISP_GAMMA1, "vdo0_disp_gamma1", "vpp_sel", 9),
+	GATE_VDO00(CLK_VDO0_DISP_DITHER0, "vdo0_disp_dither0", "vpp_sel", 10),
+	GATE_VDO00(CLK_VDO0_DISP_DITHER1, "vdo0_disp_dither1", "vpp_sel", 11),
+	GATE_VDO00(CLK_VDO0_DISP_OVL1, "vdo0_disp_ovl1", "vpp_sel", 16),
+	GATE_VDO00(CLK_VDO0_DISP_WDMA0, "vdo0_disp_wdma0", "vpp_sel", 17),
+	GATE_VDO00(CLK_VDO0_DISP_WDMA1, "vdo0_disp_wdma1", "vpp_sel", 18),
+	GATE_VDO00(CLK_VDO0_DISP_RDMA0, "vdo0_disp_rdma0", "vpp_sel", 19),
+	GATE_VDO00(CLK_VDO0_DISP_RDMA1, "vdo0_disp_rdma1", "vpp_sel", 20),
+	GATE_VDO00(CLK_VDO0_DSI0, "vdo0_dsi0", "vpp_sel", 21),
+	GATE_VDO00(CLK_VDO0_DSI1, "vdo0_dsi1", "vpp_sel", 22),
+	GATE_VDO00(CLK_VDO0_DSC_WRAP0, "vdo0_dsc_wrap0", "vpp_sel", 23),
+	GATE_VDO00(CLK_VDO0_VPP_MERGE0, "vdo0_vpp_merge0", "vpp_sel", 24),
+	GATE_VDO00(CLK_VDO0_DP_INTF0, "vdo0_dp_intf0", "vpp_sel", 25),
+	GATE_VDO00(CLK_VDO0_DISP_MUTEX0, "vdo0_disp_mutex0", "vpp_sel", 26),
+	GATE_VDO00(CLK_VDO0_DISP_IL_ROT0, "vdo0_disp_il_rot0", "vpp_sel", 27),
+	GATE_VDO00(CLK_VDO0_APB_BUS, "vdo0_apb_bus", "vpp_sel", 28),
+	GATE_VDO00(CLK_VDO0_FAKE_ENG0, "vdo0_fake_eng0", "vpp_sel", 29),
+	GATE_VDO00(CLK_VDO0_FAKE_ENG1, "vdo0_fake_eng1", "vpp_sel", 30),
+	/* VDO01 */
+	GATE_VDO01(CLK_VDO0_DL_ASYNC0, "vdo0_dl_async0", "vpp_sel", 0),
+	GATE_VDO01(CLK_VDO0_DL_ASYNC1, "vdo0_dl_async1", "vpp_sel", 1),
+	GATE_VDO01(CLK_VDO0_DL_ASYNC2, "vdo0_dl_async2", "vpp_sel", 2),
+	GATE_VDO01(CLK_VDO0_DL_ASYNC3, "vdo0_dl_async3", "vpp_sel", 3),
+	GATE_VDO01(CLK_VDO0_DL_ASYNC4, "vdo0_dl_async4", "vpp_sel", 4),
+	GATE_VDO01(CLK_VDO0_DISP_MONITOR0, "vdo0_disp_monitor0", "vpp_sel", 5),
+	GATE_VDO01(CLK_VDO0_DISP_MONITOR1, "vdo0_disp_monitor1", "vpp_sel", 6),
+	GATE_VDO01(CLK_VDO0_DISP_MONITOR2, "vdo0_disp_monitor2", "vpp_sel", 7),
+	GATE_VDO01(CLK_VDO0_DISP_MONITOR3, "vdo0_disp_monitor3", "vpp_sel", 8),
+	GATE_VDO01(CLK_VDO0_DISP_MONITOR4, "vdo0_disp_monitor4", "vpp_sel", 9),
+	GATE_VDO01(CLK_VDO0_SMI_GALS, "vdo0_smi_gals", "vpp_sel", 10),
+	GATE_VDO01(CLK_VDO0_SMI_COMMON, "vdo0_smi_common", "vpp_sel", 11),
+	GATE_VDO01(CLK_VDO0_SMI_EMI, "vdo0_smi_emi", "vpp_sel", 12),
+	GATE_VDO01(CLK_VDO0_SMI_IOMMU, "vdo0_smi_iommu", "vpp_sel", 13),
+	GATE_VDO01(CLK_VDO0_SMI_LARB, "vdo0_smi_larb", "vpp_sel", 14),
+	GATE_VDO01(CLK_VDO0_SMI_RSI, "vdo0_smi_rsi", "vpp_sel", 15),
+	/* VDO02 */
+	GATE_VDO02(CLK_VDO0_DSI0_DSI, "vdo0_dsi0_dsi", "dsi_occ_sel", 0),
+	GATE_VDO02(CLK_VDO0_DSI1_DSI, "vdo0_dsi1_dsi", "dsi_occ_sel", 8),
+	GATE_VDO02(CLK_VDO0_DP_INTF0_DP_INTF, "vdo0_dp_intf0_dp_intf", "edp_sel", 16),
+};
+
+static const struct mtk_clk_desc vdo0_desc = {
+	.clks = vdo0_clks,
+	.num_clks = ARRAY_SIZE(vdo0_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8195_vdo0[] = {
+	{
+		.compatible = "mediatek,mt8195-vdosys0",
+		.data = &vdo0_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8195_vdo0_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8195-vdo0",
+		.of_match_table = of_match_clk_mt8195_vdo0,
+	},
+};
+
+builtin_platform_driver(clk_mt8195_vdo0_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
