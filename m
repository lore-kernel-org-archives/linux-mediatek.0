Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2666C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XC9bSg5M87ztAg4t8A7uE6mEDNFtI+Ie8aw52FNy9+s=; b=vSDAxLl8cDkDjqInxQcPP8HX3k
	+8M02HtOUfhnXN/+Od1ddivryDGiIM2lpmcDTx3FDtQlBYUTZqlQodEpqSxdt08cZiivJQqo9rxNb
	BTHbt3GhxEWI0qv91GbRF5OUPTaaiOteW42Yl82hho/F0QUxOCU+L7oYANAZbIuhsI+8a+4CM7Ctp
	X2y2izH/hciOJMd5JyQOj9OI5ItijGK3DQSRkf8nIrNveG2PUwepFE4lO9FBua7J7vtZKI+J2afFc
	Y2CcS6GRjdzxnrv5JEQ8rhRKocoPCOpSbXlQoVEsP2/d42IMi3SNngRQkgudRTo8RVaCxoUmtJFsW
	xQcwcYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGjc-00AFCi-3b; Thu, 09 Mar 2023 13:55:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGj5-00AEvQ-0t; Thu, 09 Mar 2023 13:54:37 +0000
X-UUID: eaba79a2be8111edbbe3f76fe852e059-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XC9bSg5M87ztAg4t8A7uE6mEDNFtI+Ie8aw52FNy9+s=;
	b=i6gN1IjCY2QNugrgpsGxId2L485ZSyANrcLWpzZCNNHqQwi1NGtq6fJZc7h5mwTJWmL4oq36LR+qCXxzzvKnpXRQg+nxpAVvxy2s+cgFYiJf9kwb1lYbr41BidqVgL9Z0+qcAxzv4uIJl4SPYC4d/HxS6Ix2+IKLn1s2pnDejY8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:5a3668f2-7622-4c52-9471-136e472073bb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:60a4bdb2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: eaba79a2be8111edbbe3f76fe852e059-20230309
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1052167118; Thu, 09 Mar 2023 06:54:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 9 Mar 2023 21:54:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 9 Mar 2023 21:54:26 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v6 11/19] clk: mediatek: Add MT8188 vdecsys clock support
Date: Thu, 9 Mar 2023 21:54:11 +0800
Message-ID: <20230309135419.30159-12-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230309135419.30159-1-Garmin.Chang@mediatek.com>
References: <20230309135419.30159-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_055435_145536_883A34CA 
X-CRM114-Status: GOOD (  16.17  )
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
 drivers/clk/mediatek/clk-mt8188-vdec.c | 90 ++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdec.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index dfe2c74c422c..bf8e50b54bb4 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -94,7 +94,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
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
index 000000000000..4dc6f9e18f19
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-vdec.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Garmin Chang <garmin.chang@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
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
+#define GATE_VDEC0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdec2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vdec1_clks[] = {
+	/* VDEC1_0 */
+	GATE_VDEC0(CLK_VDEC1_SOC_VDEC, "vdec1_soc_vdec", "top_vdec", 0),
+	GATE_VDEC0(CLK_VDEC1_SOC_VDEC_ACTIVE, "vdec1_soc_vdec_active", "top_vdec", 4),
+	GATE_VDEC0(CLK_VDEC1_SOC_VDEC_ENG, "vdec1_soc_vdec_eng", "top_vdec", 8),
+	/* VDEC1_1 */
+	GATE_VDEC1(CLK_VDEC1_SOC_LAT, "vdec1_soc_lat", "top_vdec", 0),
+	GATE_VDEC1(CLK_VDEC1_SOC_LAT_ACTIVE, "vdec1_soc_lat_active", "top_vdec", 4),
+	GATE_VDEC1(CLK_VDEC1_SOC_LAT_ENG, "vdec1_soc_lat_eng", "top_vdec", 8),
+	/* VDEC1_2 */
+	GATE_VDEC2(CLK_VDEC1_SOC_LARB1, "vdec1_soc_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_gate vdec2_clks[] = {
+	/* VDEC2_0 */
+	GATE_VDEC0(CLK_VDEC2_VDEC, "vdec2_vdec", "top_vdec", 0),
+	GATE_VDEC0(CLK_VDEC2_VDEC_ACTIVE, "vdec2_vdec_active", "top_vdec", 4),
+	GATE_VDEC0(CLK_VDEC2_VDEC_ENG, "vdec2_vdec_eng", "top_vdec", 8),
+	/* VDEC2_1 */
+	GATE_VDEC1(CLK_VDEC2_LAT, "vdec2_lat", "top_vdec", 0),
+	/* VDEC2_2 */
+	GATE_VDEC2(CLK_VDEC2_LARB1, "vdec2_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_clk_desc vdec1_desc = {
+	.clks = vdec1_clks,
+	.num_clks = ARRAY_SIZE(vdec1_clks),
+};
+
+static const struct mtk_clk_desc vdec2_desc = {
+	.clks = vdec2_clks,
+	.num_clks = ARRAY_SIZE(vdec2_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_vdec[] = {
+	{ .compatible = "mediatek,mt8188-vdecsys-soc", .data = &vdec1_desc },
+	{ .compatible = "mediatek,mt8188-vdecsys", .data = &vdec2_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_vdec_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-vdec",
+		.of_match_table = of_match_clk_mt8188_vdec,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_vdec_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


