Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F13C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lDkloRBg/1GERo3w8oJMdfb8a2oI8swcSu3sEThlgA=; b=Rl/G3pKqdKaRa4CYMXwJHM888Y
	phRCA0YHRTQQ1GUrmQjNeWUGO8RQRKefATv/8I98EtPtBZEktV6n9qyBxfiXP4/sxCGM5bxdehC8j
	k8g5DMrr4X+0AmYj/m22jG+RpPuJ04emeOsqtc5gLZRpf3ukakccZTRLEhOPN8bTruKmNQg12B9xP
	rk2GWsiGu1wAAB0I/29zel9nfavXbbrFLxkWb0O39SVXsBgSPiUtpubQIHQYjw4ahi7lLjmE2Vjd+
	gm76kl3Z4Mc8Rkd3MRGduRp0h9wU9oKie/G61cPF0ImuW4lT/GTjGOEpTsJDxiY664HAKO5+D6klQ
	cy9qE/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLUc-003MDU-52; Fri, 29 Jul 2022 08:37:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLJf-003DMk-Hr; Fri, 29 Jul 2022 08:25:53 +0000
X-UUID: a3038e8809764ba5913ffc19fbb1cd4e-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:839a5934-9dd5-4d7c-ae73-9f1d9116f2a0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:8ce1add0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a3038e8809764ba5913ffc19fbb1cd4e-20220729
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 241154633; Fri, 29 Jul 2022 01:25:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 29 Jul 2022 16:25:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 16:25:18 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Garmin Chang <garmin.chang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH 11/18] clk: mediatek: Add MT8188 vdecsys clock support
Date: Fri, 29 Jul 2022 16:24:50 +0800
Message-ID: <20220729082457.22253-12-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
References: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_012551_663960_9DDB7F0D 
X-CRM114-Status: GOOD (  15.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8188 vdec clock controllers which provide clock gate
control for video decoder.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile          |  2 +-
 drivers/clk/mediatek/clk-mt8188-vdec.c | 96 ++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdec.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 0a72401adc5f..fc13bef12ab0 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -79,7 +79,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
 				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
-				   clk-mt8188-ipe.o clk-mt8188-mfg.o
+				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-vdec.c b/drivers/clk/mediatek/clk-mt8188-vdec.c
new file mode 100644
index 000000000000..ee973c0dceba
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-vdec.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Garmin Chang <garmin.chang@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mt8188-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs vde0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vde1_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vde2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDE0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vde0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDE1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vde1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDE2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vde2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vde1_clks[] = {
+	/* VDE1_0 */
+	GATE_VDE0(CLK_VDE1_SOC_VDEC, "vde1_soc_vdec", "top_vdec", 0),
+	GATE_VDE0(CLK_VDE1_SOC_VDEC_ACTIVE, "vde1_soc_vdec_active", "top_vdec", 4),
+	GATE_VDE0(CLK_VDE1_SOC_VDEC_ENG, "vde1_soc_vdec_eng", "top_vdec", 8),
+	/* VDE1_1 */
+	GATE_VDE1(CLK_VDE1_SOC_LAT, "vde1_soc_lat", "top_vdec", 0),
+	GATE_VDE1(CLK_VDE1_SOC_LAT_ACTIVE, "vde1_soc_lat_active", "top_vdec", 4),
+	GATE_VDE1(CLK_VDE1_SOC_LAT_ENG, "vde1_soc_lat_eng", "top_vdec", 8),
+	/* VDE12 */
+	GATE_VDE2(CLK_VDE1_SOC_LARB1, "vde1_soc_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_gate vde2_clks[] = {
+	/* VDE2_0 */
+	GATE_VDE0(CLK_VDE2_VDEC, "vde2_vdec", "top_vdec", 0),
+	GATE_VDE0(CLK_VDE2_VDEC_ACTIVE, "vde2_vdec_active", "top_vdec", 4),
+	GATE_VDE0(CLK_VDE2_VDEC_ENG, "vde2_vdec_eng", "top_vdec", 8),
+	/* VDE2_1 */
+	GATE_VDE1(CLK_VDE2_LAT, "vde2_lat", "top_vdec", 0),
+	/* VDE2_2 */
+	GATE_VDE2(CLK_VDE2_LARB1, "vde2_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_clk_desc vde1_desc = {
+	.clks = vde1_clks,
+	.num_clks = ARRAY_SIZE(vde1_clks),
+};
+
+static const struct mtk_clk_desc vde2_desc = {
+	.clks = vde2_clks,
+	.num_clks = ARRAY_SIZE(vde2_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_vde[] = {
+	{
+		.compatible = "mediatek,mt8188-vdecsys_soc",
+		.data = &vde1_desc,
+	}, {
+		.compatible = "mediatek,mt8188-vdecsys",
+		.data = &vde2_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8188_vde_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-vde",
+		.of_match_table = of_match_clk_mt8188_vde,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_vde_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


