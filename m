Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38702C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 10:24:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 579BD61222
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 10:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 579BD61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t8Eb6T35Ztjv5UjhoKvUVOxi7zz7xkZtj5qee6TwvME=; b=ICUdcgfUyxaZscs5ur+mzIq5G
	ATJWKXD6T+VfGuzr4NutpIqnd5PWHJdOU65ZzwEJ4noM9cJAR+r4G83+/Pm2LnKuOTGlquV14DiI7
	FiaGU+st0TVDCqwLkCand9zFRhqI37HuhbAxreEF3QE8dFZO8BjKD69ypQ4hlEnAlev7Xq3oaQJNW
	hSL2ehKyrAGsG3flLd3xHf/SvB482vRdyc/dk9oweOPvYR2Dl5MIzNT0HsobKPkq71kkmTaFq/Vtq
	JVsQ69ND5yvFI1gFXYCkQEDJOwO6XAD7XSyTnAko2oA08IfjtQE8LP1bhK4StP/4VzNYrfexd+fQZ
	CEWTwqy+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leEhD-000vPu-B7; Wed, 05 May 2021 10:23:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leEh6-000vMJ-39; Wed, 05 May 2021 10:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=qkXYxufxBFG+Vf3i5+EzqkEnsWaT7quI5cqkxNqZhjE=; b=MAr98OoiZqU0DVt04jQrcJfvrO
 e2sIEvWuZA7j/bcw8X4mqSOTv8n9UsQ0hQNgsLdBOwmjZbAuStWTn1TZxxpR4ipkxRpDaZjtV804M
 l+3hA+mD3DJ0s/GcMv00EwVsS/vTC0uq+2i4Q5LrNRzRbQ0vm3PHFDAYuxpMaTfgpVLqak5xkSMDp
 uz32SOQ6YqSnqwaeW5m7ozpNmrTsQ1Fv3YjBpSOEQjKBkScU/ZEBk3zzNkhu5y5WJauhvJ2qCbyHE
 O8kpYQGktjd69uw+4WeEIe+KqPcJZ0mXlGGk2BOBm8blv1YQ5OfIOTzkR49Oo7pSfL6y/uHQOP0Xb
 hkH/1gnQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leEh3-004fQz-6a; Wed, 05 May 2021 10:23:50 +0000
X-UUID: bba960d3abb6419686ea6b521c6f3d60-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qkXYxufxBFG+Vf3i5+EzqkEnsWaT7quI5cqkxNqZhjE=; 
 b=hguzwy9+YWbWl2NGscohceEcaMeVc9oy6b60KP3HHe2csi1zCAgMDky7CnVmM0MsppVBpTgyvkSA2rqQp09tu1OutHE1cmHisBeSG05ekT7UssElTcg82NmNqbJqtT0esJEt+b/w1mIwUypjEzp0mm29V5RGTtL7ITp5b9do+sc=;
X-UUID: bba960d3abb6419686ea6b521c6f3d60-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2007759508; Wed, 05 May 2021 03:23:46 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 03:13:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 18:13:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 May 2021 18:13:42 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 "Rob Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v8 18/22] clk: mediatek: Add MT8192 mmsys clock support
Date: Wed, 5 May 2021 18:07:10 +0800
Message-ID: <20210505100714.3582-19-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210505100714.3582-1-chun-jie.chen@mediatek.com>
References: <20210505100714.3582-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_032349_273883_D5226528 
X-CRM114-Status: GOOD (  17.58  )
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

Add MT8192 mmsys clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig         |   6 ++
 drivers/clk/mediatek/Makefile        |   1 +
 drivers/clk/mediatek/clk-mt8192-mm.c | 108 +++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index e212f3416855..5b89a4dbe2b9 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -550,6 +550,12 @@ config COMMON_CLK_MT8192_MFGCFG
 	help
 	  This driver supports MediaTek MT8192 mfgcfg clocks.
 
+config COMMON_CLK_MT8192_MMSYS
+	bool "Clock driver for MediaTek MT8192 mmsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 mmsys clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 024841a79f1c..838bb0131c97 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -75,5 +75,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP) += clk-mt8192-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IPESYS) += clk-mt8192-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MDPSYS) += clk-mt8192-mdp.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MFGCFG) += clk-mt8192-mfg.o
+obj-$(CONFIG_COMMON_CLK_MT8192_MMSYS) += clk-mt8192-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-mm.c b/drivers/clk/mediatek/clk-mt8192-mm.c
new file mode 100644
index 000000000000..dfdfb21669be
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-mm.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs mm0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mm1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs mm2_cg_regs = {
+	.set_ofs = 0x1a4,
+	.clr_ofs = 0x1a8,
+	.sta_ofs = 0x1a0,
+};
+
+#define GATE_MM0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mm0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MM1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mm1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MM2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mm2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate mm_clks[] = {
+	/* MM0 */
+	GATE_MM0(CLK_MM_DISP_MUTEX0, "mm_disp_mutex0", "disp_sel", 0),
+	GATE_MM0(CLK_MM_DISP_CONFIG, "mm_disp_config", "disp_sel", 1),
+	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "disp_sel", 2),
+	GATE_MM0(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "disp_sel", 3),
+	GATE_MM0(CLK_MM_DISP_OVL0_2L, "mm_disp_ovl0_2l", "disp_sel", 4),
+	GATE_MM0(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "disp_sel", 5),
+	GATE_MM0(CLK_MM_DISP_UFBC_WDMA0, "mm_disp_ufbc_wdma0", "disp_sel", 6),
+	GATE_MM0(CLK_MM_DISP_RSZ0, "mm_disp_rsz0", "disp_sel", 7),
+	GATE_MM0(CLK_MM_DISP_AAL0, "mm_disp_aal0", "disp_sel", 8),
+	GATE_MM0(CLK_MM_DISP_CCORR0, "mm_disp_ccorr0", "disp_sel", 9),
+	GATE_MM0(CLK_MM_DISP_DITHER0, "mm_disp_dither0", "disp_sel", 10),
+	GATE_MM0(CLK_MM_SMI_INFRA, "mm_smi_infra", "disp_sel", 11),
+	GATE_MM0(CLK_MM_DISP_GAMMA0, "mm_disp_gamma0", "disp_sel", 12),
+	GATE_MM0(CLK_MM_DISP_POSTMASK0, "mm_disp_postmask0", "disp_sel", 13),
+	GATE_MM0(CLK_MM_DISP_DSC_WRAP0, "mm_disp_dsc_wrap0", "disp_sel", 14),
+	GATE_MM0(CLK_MM_DSI0, "mm_dsi0", "disp_sel", 15),
+	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "disp_sel", 16),
+	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "disp_sel", 17),
+	GATE_MM0(CLK_MM_DISP_FAKE_ENG0, "mm_disp_fake_eng0", "disp_sel", 18),
+	GATE_MM0(CLK_MM_DISP_FAKE_ENG1, "mm_disp_fake_eng1", "disp_sel", 19),
+	GATE_MM0(CLK_MM_MDP_TDSHP4, "mm_mdp_tdshp4", "disp_sel", 20),
+	GATE_MM0(CLK_MM_MDP_RSZ4, "mm_mdp_rsz4", "disp_sel", 21),
+	GATE_MM0(CLK_MM_MDP_AAL4, "mm_mdp_aal4", "disp_sel", 22),
+	GATE_MM0(CLK_MM_MDP_HDR4, "mm_mdp_hdr4", "disp_sel", 23),
+	GATE_MM0(CLK_MM_MDP_RDMA4, "mm_mdp_rdma4", "disp_sel", 24),
+	GATE_MM0(CLK_MM_MDP_COLOR4, "mm_mdp_color4", "disp_sel", 25),
+	GATE_MM0(CLK_MM_DISP_Y2R0, "mm_disp_y2r0", "disp_sel", 26),
+	GATE_MM0(CLK_MM_SMI_GALS, "mm_smi_gals", "disp_sel", 27),
+	GATE_MM0(CLK_MM_DISP_OVL2_2L, "mm_disp_ovl2_2l", "disp_sel", 28),
+	GATE_MM0(CLK_MM_DISP_RDMA4, "mm_disp_rdma4", "disp_sel", 29),
+	GATE_MM0(CLK_MM_DISP_DPI0, "mm_disp_dpi0", "disp_sel", 30),
+	/* MM1 */
+	GATE_MM1(CLK_MM_SMI_IOMMU, "mm_smi_iommu", "disp_sel", 0),
+	/* MM2 */
+	GATE_MM2(CLK_MM_DSI_DSI0, "mm_dsi_dsi0", "disp_sel", 0),
+	GATE_MM2(CLK_MM_DPI_DPI0, "mm_dpi_dpi0", "dpi_sel", 8),
+	GATE_MM2(CLK_MM_26MHZ, "mm_26mhz", "clk26m", 24),
+	GATE_MM2(CLK_MM_32KHZ, "mm_32khz", "clk32k", 25),
+};
+
+static int clk_mt8192_mm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_onecell_data *clk_data;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static struct platform_driver clk_mt8192_mm_drv = {
+	.probe = clk_mt8192_mm_probe,
+	.driver = {
+		.name = "clk-mt8192-mm",
+	},
+};
+
+builtin_platform_driver(clk_mt8192_mm_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
