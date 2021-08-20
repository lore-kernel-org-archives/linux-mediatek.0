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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D79BC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:30:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2578C61051
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2578C61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCLPOm0yMDTZoAODjKuAcTwAM3VV5Nw7ch18kcL/eM0=; b=bmtneILWEm+Hzt
	OXxdV8an0/5NtGlTlIJ0RiiNNLJb8SVstZQMthofrevEN+tfqLR3pP1W47M67hVnyQNDYP2yqoPP/
	rVMbF5fPUKjzhlUXfi8x0nGyLQIh3s8cRhqotfVbrL+1Q8bwmd/hSFj9tljhVBbW7yaqKwAF6BT74
	g2phlOlp8rymP6KNsHtxdVyyhW666UCaj4IB/RO87hNiaYv5CLQoa9/EqcqenrgG9OAxXlvyofCNH
	ipG9juwH0cz0l/itl/55WCE+F1+Bj0/rDYmRCH5TADW9kcK4Q6h0MWmC3BmDChuqEIjQ/KW7ozB6e
	9AxunDvKEHC6DpXUiY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2io-00Argv-ER; Fri, 20 Aug 2021 11:30:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2Wv-00AmH3-RC; Fri, 20 Aug 2021 11:17:49 +0000
X-UUID: 0d4eb64ebc7442a187673767a50e51d9-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VkkrmwC777anfrxYEd7g93Zjlp14wx6UL5NkgPNKUJ0=; 
 b=hyb94INj0pYY2HcoZYLhoRGTsgsUZZxP1G1Ik4h2az35mRb4v6/VLHgOqo+FoXSSDkJCfft/OnNyCznbwODNG0tMqOyAyhELu1B1dxYWo2b6WiGYXNDMHmBgFH8VMZA58mqilWpJOpYRN5TOWvo2ymUc5vPtNX/cKhufxM9gwGg=;
X-UUID: 0d4eb64ebc7442a187673767a50e51d9-20210820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 541863884; Fri, 20 Aug 2021 04:17:42 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 04:17:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 19:17:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Aug 2021 19:17:39 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v2 17/24] clk: mediatek: Add MT8195 vdosys0 clock support
Date: Fri, 20 Aug 2021 19:14:57 +0800
Message-ID: <20210820111504.350-18-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210820111504.350-1-chun-jie.chen@mediatek.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_041745_949832_1D4404C8 
X-CRM114-Status: GOOD (  18.08  )
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

Add MT8195 vdosys0 clock controller which providers clock gate
control in video system.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
Integrate with mtk-mmsys driver which will pupulate device by
platform_device_register_data to start vdosys clock driver
---
 drivers/clk/mediatek/Makefile          |   2 +-
 drivers/clk/mediatek/clk-mt8195-vdo0.c | 123 +++++++++++++++++++++++++
 2 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vdo0.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index ac269f6d39e3..d22731316b7c 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -82,6 +82,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
 					clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
-					clk-mt8195-vdec.o
+					clk-mt8195-vdec.o clk-mt8195-vdo0.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
new file mode 100644
index 000000000000..5d8facac3a2b
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
@@ -0,0 +1,123 @@
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
+	GATE_VDO0_0(CLK_VDO0_DISP_COLOR0, "vdo0_disp_color0", "top_vpp", 2),
+	GATE_VDO0_0(CLK_VDO0_DISP_COLOR1, "vdo0_disp_color1", "top_vpp", 3),
+	GATE_VDO0_0(CLK_VDO0_DISP_CCORR0, "vdo0_disp_ccorr0", "top_vpp", 4),
+	GATE_VDO0_0(CLK_VDO0_DISP_CCORR1, "vdo0_disp_ccorr1", "top_vpp", 5),
+	GATE_VDO0_0(CLK_VDO0_DISP_AAL0, "vdo0_disp_aal0", "top_vpp", 6),
+	GATE_VDO0_0(CLK_VDO0_DISP_AAL1, "vdo0_disp_aal1", "top_vpp", 7),
+	GATE_VDO0_0(CLK_VDO0_DISP_GAMMA0, "vdo0_disp_gamma0", "top_vpp", 8),
+	GATE_VDO0_0(CLK_VDO0_DISP_GAMMA1, "vdo0_disp_gamma1", "top_vpp", 9),
+	GATE_VDO0_0(CLK_VDO0_DISP_DITHER0, "vdo0_disp_dither0", "top_vpp", 10),
+	GATE_VDO0_0(CLK_VDO0_DISP_DITHER1, "vdo0_disp_dither1", "top_vpp", 11),
+	GATE_VDO0_0(CLK_VDO0_DISP_OVL1, "vdo0_disp_ovl1", "top_vpp", 16),
+	GATE_VDO0_0(CLK_VDO0_DISP_WDMA0, "vdo0_disp_wdma0", "top_vpp", 17),
+	GATE_VDO0_0(CLK_VDO0_DISP_WDMA1, "vdo0_disp_wdma1", "top_vpp", 18),
+	GATE_VDO0_0(CLK_VDO0_DISP_RDMA0, "vdo0_disp_rdma0", "top_vpp", 19),
+	GATE_VDO0_0(CLK_VDO0_DISP_RDMA1, "vdo0_disp_rdma1", "top_vpp", 20),
+	GATE_VDO0_0(CLK_VDO0_DSI0, "vdo0_dsi0", "top_vpp", 21),
+	GATE_VDO0_0(CLK_VDO0_DSI1, "vdo0_dsi1", "top_vpp", 22),
+	GATE_VDO0_0(CLK_VDO0_DSC_WRAP0, "vdo0_dsc_wrap0", "top_vpp", 23),
+	GATE_VDO0_0(CLK_VDO0_VPP_MERGE0, "vdo0_vpp_merge0", "top_vpp", 24),
+	GATE_VDO0_0(CLK_VDO0_DP_INTF0, "vdo0_dp_intf0", "top_vpp", 25),
+	GATE_VDO0_0(CLK_VDO0_DISP_MUTEX0, "vdo0_disp_mutex0", "top_vpp", 26),
+	GATE_VDO0_0(CLK_VDO0_DISP_IL_ROT0, "vdo0_disp_il_rot0", "top_vpp", 27),
+	GATE_VDO0_0(CLK_VDO0_APB_BUS, "vdo0_apb_bus", "top_vpp", 28),
+	GATE_VDO0_0(CLK_VDO0_FAKE_ENG0, "vdo0_fake_eng0", "top_vpp", 29),
+	GATE_VDO0_0(CLK_VDO0_FAKE_ENG1, "vdo0_fake_eng1", "top_vpp", 30),
+	/* VDO0_1 */
+	GATE_VDO0_1(CLK_VDO0_DL_ASYNC0, "vdo0_dl_async0", "top_vpp", 0),
+	GATE_VDO0_1(CLK_VDO0_DL_ASYNC1, "vdo0_dl_async1", "top_vpp", 1),
+	GATE_VDO0_1(CLK_VDO0_DL_ASYNC2, "vdo0_dl_async2", "top_vpp", 2),
+	GATE_VDO0_1(CLK_VDO0_DL_ASYNC3, "vdo0_dl_async3", "top_vpp", 3),
+	GATE_VDO0_1(CLK_VDO0_DL_ASYNC4, "vdo0_dl_async4", "top_vpp", 4),
+	GATE_VDO0_1(CLK_VDO0_DISP_MONITOR0, "vdo0_disp_monitor0", "top_vpp", 5),
+	GATE_VDO0_1(CLK_VDO0_DISP_MONITOR1, "vdo0_disp_monitor1", "top_vpp", 6),
+	GATE_VDO0_1(CLK_VDO0_DISP_MONITOR2, "vdo0_disp_monitor2", "top_vpp", 7),
+	GATE_VDO0_1(CLK_VDO0_DISP_MONITOR3, "vdo0_disp_monitor3", "top_vpp", 8),
+	GATE_VDO0_1(CLK_VDO0_DISP_MONITOR4, "vdo0_disp_monitor4", "top_vpp", 9),
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
+static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_onecell_data *clk_data;
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
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto free_vdo0_data;
+
+	return r;
+
+free_vdo0_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static struct platform_driver clk_mt8195_vdo0_drv = {
+	.probe = clk_mt8195_vdo0_probe,
+	.driver = {
+		.name = "clk-mt8195-vdo0",
+	},
+};
+builtin_platform_driver(clk_mt8195_vdo0_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
