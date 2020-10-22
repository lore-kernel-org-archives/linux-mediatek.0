Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E6EC388F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:53:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EAD022267
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L4A8JvUh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LTmafrxZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EAD022267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XwVRCe55OwFifug6IbVa7A8yAN78vUWsh0xjK4/RyMM=; b=L4A8JvUh21IRYROnPgHbB16Pn
	B3rybRXQJcsc7ZAN/hzEjoDv0ayYv+S3yMxYA05nKNaqi8Huv/oSHVGAoYx7mSPHITSYkk8Vy1Nx8
	6jZQkxeixhlN8DT2yBjrFTbCFFs+hyU5UwD737frUvU9cSeRS+sDLNi0HakEAmDBZIUXfcAZXRTxL
	7fWuFOLphe5s2R6h9BjEej7maJ9TJbHta6SpAi6V7zp4s1sTYHbcl5tgwD5I1J906/kDxvhFOkCS1
	NB1fnNQ/Q7B6HZh0nogEreyP6L9QBpC/h7dlIWPRS3W5U+u04nT5GmUEw22najS0IZsX945ZVzfVI
	qqDyKhphg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVa5p-0001KY-Kk; Thu, 22 Oct 2020 12:53:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa0q-0007Ce-7a; Thu, 22 Oct 2020 12:48:16 +0000
X-UUID: ee39fbb177274d049d4647faa7db8458-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2EHjMnXHk99N/kTVT5U3zLxaMSlvFJbeciwRaPo0mzw=; 
 b=LTmafrxZlngGlUfCsnicdHi+xEMcKnDbdbgLYq+B/Wtnc6vYkSIlYo2hbd7+lkDl5oj/Y3llQblWiW8M69zPJSqOK9jfdD2G/z7dD4LwykrLC+aFzhyTA6+IFP48FBbp2xeeHPKUQ4OwkI+wjigWuEz748ArJk/9FKr84gn/r44=;
X-UUID: ee39fbb177274d049d4647faa7db8458-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1122062136; Thu, 22 Oct 2020 04:47:56 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:38:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:57 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 33/34] clk: mediatek: Add MT8192 vdecsys soc clock support
Date: Thu, 22 Oct 2020 20:37:26 +0800
Message-ID: <1603370247-30437-34-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084812_452160_5FD1D9BF 
X-CRM114-Status: GOOD (  18.54  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 vdecsys soc clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig               |  6 +++
 drivers/clk/mediatek/Makefile              |  1 +
 drivers/clk/mediatek/clk-mt8192-vdec_soc.c | 82 ++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec_soc.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index e8383e17..74f4f00 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -575,6 +575,12 @@ config COMMON_CLK_MT8192_VDECSYS
 	help
 	  This driver supports MediaTek MT8192 vdecsys clocks.
 
+config COMMON_CLK_MT8192_VDECSYS_SOC
+	bool "Clock driver for MediaTek MT8192 vdecsys_soc"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 vdecsys_soc clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 04bce21..289b7e6 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -83,5 +83,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MSDC_TOP) += clk-mt8192-msdc_top.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
 obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS_SOC) += clk-mt8192-vdec_soc.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-vdec_soc.c b/drivers/clk/mediatek/clk-mt8192-vdec_soc.c
new file mode 100644
index 0000000..2f615a8
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-vdec_soc.c
@@ -0,0 +1,82 @@
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
+static const struct mtk_gate_regs vdec_soc0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vdec_soc1_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vdec_soc2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDEC_SOC0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec_soc0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC_SOC1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec_soc1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC_SOC2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec_soc2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vdec_soc_clks[] = {
+	/* VDEC_SOC0 */
+	GATE_VDEC_SOC0(CLK_VDEC_SOC_VDEC, "vdec_soc_vdec", "vdec_sel", 0),
+	GATE_VDEC_SOC0(CLK_VDEC_SOC_VDEC_ACTIVE, "vdec_soc_vdec_active", "vdec_sel", 4),
+	/* VDEC_SOC1 */
+	GATE_VDEC_SOC1(CLK_VDEC_SOC_LAT, "vdec_soc_lat", "vdec_sel", 0),
+	GATE_VDEC_SOC1(CLK_VDEC_SOC_LAT_ACTIVE, "vdec_soc_lat_active", "vdec_sel", 4),
+	/* VDEC_SOC2 */
+	GATE_VDEC_SOC2(CLK_VDEC_SOC_LARB1, "vdec_soc_larb1", "vdec_sel", 0),
+};
+
+static int clk_mt8192_vdec_soc_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_VDEC_SOC_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, vdec_soc_clks, ARRAY_SIZE(vdec_soc_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_vdec_soc[] = {
+	{ .compatible = "mediatek,mt8192-vdecsys_soc", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_vdec_soc_drv = {
+	.probe = clk_mt8192_vdec_soc_probe,
+	.driver = {
+		.name = "clk-mt8192-vdec_soc",
+		.of_match_table = of_match_clk_mt8192_vdec_soc,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_vdec_soc_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
