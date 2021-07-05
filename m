Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF82DC07E95
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 03:43:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78FC961356
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 03:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78FC961356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DK9YUYyDscEN2V96lEEfI2CcT90mSI4bVWzsYzQMmco=; b=irVAP9slP+jl42
	CkZuivURB/h+NdmlAz8eua/6nIRjCoj52wWBmDiiFk3pBV1oZfMFXJXNOdz8zq34b0LDDKIK0Zl8M
	vxNt9/e1GRfjTsmtHg0Na6YiXUljTJcI7pG0R4hWnWC3VFywrzk/8e5zcFm+qOTAfjLERk1Jtq1OG
	s108sjOWjBVwBn96vr7b3h0ElWQQ/AhmczgH6lvtLBcGa+ltPkaJMre1VoOOPs0srCvNVBNLe1sdB
	SdDIJbiaWLjotCzZoyU2iTxDslCb6r+q9w+uDq2RpfaOOaeZ9sGSL/n8vip77HlkaI3TQ9qTk+5cE
	i6+sFg0HPCuG45vGo1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0FVY-007bf3-6l; Mon, 05 Jul 2021 03:42:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0FV6-007bTI-HO; Mon, 05 Jul 2021 03:42:30 +0000
X-UUID: ee7d05e9ca0d46e997fa558a247a871d-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mBc2ZZzE1FCcqKUb73ahuB/sNJfuGfvPS45sW68LvZI=; 
 b=okse+QGQR5sy3/S54SYN0u0CWUE0fLxGWIr3JMoPfQAehiBLRuRTD8yU2MgY8hr0YQJvIE8cyGthQ5kN4nN+n+Xz2OOtkKzQQoxh5algKURNUqDM9nndKSn9mPUVGeKFjm2otz9kH1kzLanCb/AKCcNI3QrXZ5ZoEdc3YksCcEY=;
X-UUID: ee7d05e9ca0d46e997fa558a247a871d-20210704
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1060561224; Sun, 04 Jul 2021 20:42:23 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 20:42:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 11:42:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 11:42:13 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [v12 17/20] clk: mediatek: Add MT8192 msdc clock support
Date: Mon, 5 Jul 2021 11:38:21 +0800
Message-ID: <20210705033824.1934-18-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
References: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_204228_627419_750C2CEF 
X-CRM114-Status: GOOD (  15.54  )
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

Add MT8192 msdc and msdc top clock providers

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |  6 ++
 drivers/clk/mediatek/Makefile          |  1 +
 drivers/clk/mediatek/clk-mt8192-msdc.c | 85 ++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 5b89a4dbe2b9..88b24f74aff2 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -556,6 +556,12 @@ config COMMON_CLK_MT8192_MMSYS
 	help
 	  This driver supports MediaTek MT8192 mmsys clocks.
 
+config COMMON_CLK_MT8192_MSDC
+	bool "Clock driver for MediaTek MT8192 msdc"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 msdc and msdc_top clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 838bb0131c97..8e4e343d4af4 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -76,5 +76,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_IPESYS) += clk-mt8192-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MDPSYS) += clk-mt8192-mdp.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MFGCFG) += clk-mt8192-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MMSYS) += clk-mt8192-mm.o
+obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-msdc.c b/drivers/clk/mediatek/clk-mt8192-msdc.c
new file mode 100644
index 000000000000..87c3b79b79cf
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-msdc.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs msdc_cg_regs = {
+	.set_ofs = 0xb4,
+	.clr_ofs = 0xb4,
+	.sta_ofs = 0xb4,
+};
+
+static const struct mtk_gate_regs msdc_top_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_MSDC(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &msdc_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+#define GATE_MSDC_TOP(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &msdc_top_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate msdc_clks[] = {
+	GATE_MSDC(CLK_MSDC_AXI_WRAP, "msdc_axi_wrap", "axi_sel", 22),
+};
+
+static const struct mtk_gate msdc_top_clks[] = {
+	GATE_MSDC_TOP(CLK_MSDC_TOP_AES_0P, "msdc_top_aes_0p", "aes_msdcfde_sel", 0),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_SRC_0P, "msdc_top_src_0p", "infra_msdc0_src", 1),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_SRC_1P, "msdc_top_src_1p", "infra_msdc1_src", 2),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_SRC_2P, "msdc_top_src_2p", "infra_msdc2_src", 3),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_P_MSDC0, "msdc_top_p_msdc0", "axi_sel", 4),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_P_MSDC1, "msdc_top_p_msdc1", "axi_sel", 5),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_P_MSDC2, "msdc_top_p_msdc2", "axi_sel", 6),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_P_CFG, "msdc_top_p_cfg", "axi_sel", 7),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_AXI, "msdc_top_axi", "axi_sel", 8),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_H_MST_0P, "msdc_top_h_mst_0p", "infra_msdc0", 9),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_H_MST_1P, "msdc_top_h_mst_1p", "infra_msdc1", 10),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_H_MST_2P, "msdc_top_h_mst_2p", "infra_msdc2", 11),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_MEM_OFF_DLY_26M, "msdc_top_mem_off_dly_26m", "clk26m", 12),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_32K, "msdc_top_32k", "clk32k", 13),
+	GATE_MSDC_TOP(CLK_MSDC_TOP_AHB2AXI_BRG_AXI, "msdc_top_ahb2axi_brg_axi", "axi_sel", 14),
+};
+
+static const struct mtk_clk_desc msdc_desc = {
+	.clks = msdc_clks,
+	.num_clks = ARRAY_SIZE(msdc_clks),
+};
+
+static const struct mtk_clk_desc msdc_top_desc = {
+	.clks = msdc_top_clks,
+	.num_clks = ARRAY_SIZE(msdc_top_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_msdc[] = {
+	{
+		.compatible = "mediatek,mt8192-msdc",
+		.data = &msdc_desc,
+	}, {
+		.compatible = "mediatek,mt8192-msdc_top",
+		.data = &msdc_top_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_msdc_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-msdc",
+		.of_match_table = of_match_clk_mt8192_msdc,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_msdc_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
