Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7977BC07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 03:54:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A33861283
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 03:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A33861283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0HtG4EWjQTrDxrLCp6AqLQrRHPndPUQ7erPwKl7KeQ=; b=B2DVdP7UuSj8aH
	uagtpkYzX3vb2uIWA91SpHt5NcIgsXEj8CPebfjXU81bizwWbp4duIAcBqg0mO0LdYo7GmGW81XhF
	m4t9wI/B/N06Kav664yBk8vNCOBhiZ3Kc0dDoX1DwKV/r/yd6DPSIzHsjIMC2c/ghczzO9iuaxElD
	Uvqkm8I9jGmEU5S5i4O/IAYH68aVjyTbGQvtU5mghLBrecTXA40SHJ/YJmQo6ElPmB4/QVljvTEGa
	IaTnNPrGwcNHa1YMoS+lGckUDAawSFpkCO5rtqa+HTHDIL8R7OeMraSGY/3KbYUXq1UDxwyyoIH2i
	olKnai5Rm/vyyKXgQBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Fgj-007hCT-JY; Mon, 05 Jul 2021 03:54:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0FeH-007fsf-7O; Mon, 05 Jul 2021 03:51:59 +0000
X-UUID: 66f703d73db84e26aa178b1226f36fcc-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FFILOLdKhDXObzJzWZCc7GEo50F1S8kOmvasTHwTL58=; 
 b=jSgcvNRJBsEQ1/pVi1jmwZ+drOV0rD/qZkTVL13nztwqBWMC3P4dIHZcN7zMPSZr0HEGjEhM/lN4SkDn+J8zDTHmalwEmCKugJUYY506EuMyFtWjNlfzx+bfdrEakwSlO38NXKn3NzJG6nY7yC49awRHsNFlTxYzrHJysKyKh74=;
X-UUID: 66f703d73db84e26aa178b1226f36fcc-20210704
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1104441016; Sun, 04 Jul 2021 20:51:43 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 20:42:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 11:42:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 11:42:18 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [v12 19/20] clk: mediatek: Add MT8192 vdecsys clock support
Date: Mon, 5 Jul 2021 11:38:23 +0800
Message-ID: <20210705033824.1934-20-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
References: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_205157_358822_CDDE51FD 
X-CRM114-Status: GOOD (  16.07  )
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

Add MT8192 vdecsys and vdecsys soc clock providers

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |  6 ++
 drivers/clk/mediatek/Makefile          |  1 +
 drivers/clk/mediatek/clk-mt8192-vdec.c | 94 ++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index eb4aa29d8106..31779f2c5c83 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -568,6 +568,12 @@ config COMMON_CLK_MT8192_SCP_ADSP
 	help
 	  This driver supports MediaTek MT8192 scp_adsp clocks.
 
+config COMMON_CLK_MT8192_VDECSYS
+	bool "Clock driver for MediaTek MT8192 vdecsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 vdecsys and vdecsys_soc clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index a336fe753e9a..887dd6bcf7f2 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -78,5 +78,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MFGCFG) += clk-mt8192-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MMSYS) += clk-mt8192-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
 obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
+obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-vdec.c b/drivers/clk/mediatek/clk-mt8192-vdec.c
new file mode 100644
index 000000000000..b1d95cfbf22a
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-vdec.c
@@ -0,0 +1,94 @@
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
+static const struct mtk_gate_regs vdec0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vdec1_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vdec2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDEC0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vdec_clks[] = {
+	/* VDEC0 */
+	GATE_VDEC0(CLK_VDEC_VDEC, "vdec_vdec", "vdec_sel", 0),
+	GATE_VDEC0(CLK_VDEC_ACTIVE, "vdec_active", "vdec_sel", 4),
+	/* VDEC1 */
+	GATE_VDEC1(CLK_VDEC_LAT, "vdec_lat", "vdec_sel", 0),
+	GATE_VDEC1(CLK_VDEC_LAT_ACTIVE, "vdec_lat_active", "vdec_sel", 4),
+	/* VDEC2 */
+	GATE_VDEC2(CLK_VDEC_LARB1, "vdec_larb1", "vdec_sel", 0),
+};
+
+static const struct mtk_gate vdec_soc_clks[] = {
+	/* VDEC_SOC0 */
+	GATE_VDEC0(CLK_VDEC_SOC_VDEC, "vdec_soc_vdec", "vdec_sel", 0),
+	GATE_VDEC0(CLK_VDEC_SOC_VDEC_ACTIVE, "vdec_soc_vdec_active", "vdec_sel", 4),
+	/* VDEC_SOC1 */
+	GATE_VDEC1(CLK_VDEC_SOC_LAT, "vdec_soc_lat", "vdec_sel", 0),
+	GATE_VDEC1(CLK_VDEC_SOC_LAT_ACTIVE, "vdec_soc_lat_active", "vdec_sel", 4),
+	/* VDEC_SOC2 */
+	GATE_VDEC2(CLK_VDEC_SOC_LARB1, "vdec_soc_larb1", "vdec_sel", 0),
+};
+
+static const struct mtk_clk_desc vdec_desc = {
+	.clks = vdec_clks,
+	.num_clks = ARRAY_SIZE(vdec_clks),
+};
+
+static const struct mtk_clk_desc vdec_soc_desc = {
+	.clks = vdec_soc_clks,
+	.num_clks = ARRAY_SIZE(vdec_soc_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_vdec[] = {
+	{
+		.compatible = "mediatek,mt8192-vdecsys",
+		.data = &vdec_desc,
+	}, {
+		.compatible = "mediatek,mt8192-vdecsys_soc",
+		.data = &vdec_soc_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_vdec_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-vdec",
+		.of_match_table = of_match_clk_mt8192_vdec,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_vdec_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
