Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E552C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 12:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4faT+i10T2zf/BKG23lUe8KApVTLmzTXyYgHEizBCEA=; b=FUf0PrBPbE3ximSxtFIyIUWTQv
	dNHhmqX6rmN/3FH37VdDixlJOul+trqEbq0j3UZIMVEVQbwNIOHs0xRrAuHdHNilZO7zVBoSH+4XY
	y1Ez8mcFL6qy3ZIFDB/29uleX6UmMDXoEoZ3NE/qMTmx/2liyBwwex9+y+Qv4xpENL7QNTLrffj6f
	5pI1r1dcS5G5umk7NLyz6C4tiNxLlB5upXuGs0wiFdj2Vp8KuUo+ZGZFJAeBsdECbcKx2gNJi6rKB
	WMNUIxXL8vIuD9fC1H0N4KaqLt2MImj4XBSl9BMGLZNR9mdhPZ98MkFrbHWqoh7V8BYe9TFIZHEIL
	4bkFnndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIURe-004uIN-3K; Thu, 19 Jan 2023 12:55:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMT-004rlg-OB; Thu, 19 Jan 2023 12:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4faT+i10T2zf/BKG23lUe8KApVTLmzTXyYgHEizBCEA=; b=bQvXkcW+Elq9D3r/1Ey0U0PvFo
	aPz2ByVv3qK+ZlEFGy76M3hdT/w6ehxXC5vNb+EwA9dytCZAI12haAtHjs0LizsJuNyVaxKrriIDO
	kq29ej6R9s5h6SB9FgUodWe1vk2uimRNSMSIFhUqG9b58omoZi1bbZMZZM1hG+AqCMJRSC7ShF2zQ
	GMF1vjDRsC46Fb5r5hAh5MmiWPZ4f28/0QzqQHpcJaq60f6wpy8q0Rr97XWFy5qm1P3jeKlhaY73a
	+7/FXKVGpKFzwyl/DRE3i7hTgQz/H0He+OJu1VuJ0sDFenHpisfo9U5dnaZ67ZJDT3zksMu+gee1K
	3vcBiZ8Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIULw-000IP7-2Y;
	Thu, 19 Jan 2023 12:49:16 +0000
X-UUID: b76d23e897f711edbbe3f76fe852e059-20230119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4faT+i10T2zf/BKG23lUe8KApVTLmzTXyYgHEizBCEA=;
	b=RLTVgGGPD+nErOfpZYBUjxP7lWsefQWXMm5oD4C2vH5K6QOev21AgcrIbMrB8v8/03Soee2zBxY0XkG9xs96pyw7LQwTyP5il5b4Y5KgU5OX/T6kOJ7gh5NcrKiBnuLTDVo5yRwVa48TOp9k3ghL+8FNvuZKoTS6YycuBO5F9Ck=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:97b18ed6-1fde-4a34-a38d-d3b87731fbe7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:aca5ba8c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: b76d23e897f711edbbe3f76fe852e059-20230119
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1737249562; Thu, 19 Jan 2023 05:49:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 19 Jan 2023 20:48:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 19 Jan 2023 20:48:56 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v5 08/19] clk: mediatek: Add MT8188 imgsys clock support
Date: Thu, 19 Jan 2023 20:48:37 +0800
Message-ID: <20230119124848.26364-9-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_124913_261455_D2704223 
X-CRM114-Status: GOOD (  16.05  )
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

Add MT8188 imgsys clock controllers which provide clock gate
control for image IP blocks.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile         |   2 +-
 drivers/clk/mediatek/clk-mt8188-img.c | 110 ++++++++++++++++++++++++++
 2 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-img.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index dbd140b81763..be835d5e179d 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -85,7 +85,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 				   clk-mt8186-cam.o clk-mt8186-mdp.o clk-mt8186-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
-				   clk-mt8188-cam.o clk-mt8188-ccu.o
+				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-img.c b/drivers/clk/mediatek/clk-mt8188-img.c
new file mode 100644
index 000000000000..b6ac0a9a2446
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-img.c
@@ -0,0 +1,110 @@
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
+static const struct mtk_gate_regs imgsys_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMGSYS(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &imgsys_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate imgsys_main_clks[] = {
+	GATE_IMGSYS(CLK_IMGSYS_MAIN_LARB9, "imgsys_main_larb9", "top_img", 0),
+	GATE_IMGSYS(CLK_IMGSYS_MAIN_TRAW0, "imgsys_main_traw0", "top_img", 1),
+	GATE_IMGSYS(CLK_IMGSYS_MAIN_TRAW1, "imgsys_main_traw1", "top_img", 2),
+	GATE_IMGSYS(CLK_IMGSYS_MAIN_VCORE_GALS, "imgsys_main_vcore_gals", "top_img", 3),
+	GATE_IMGSYS(CLK_IMGSYS_MAIN_DIP0, "imgsys_main_dip0", "top_img", 8),
+	GATE_IMGSYS(CLK_IMGSYS_MAIN_WPE0, "imgsys_main_wpe0", "top_img", 9),
+	GATE_IMGSYS(CLK_IMGSYS_MAIN_IPE, "imgsys_main_ipe", "top_img", 10),
+	GATE_IMGSYS(CLK_IMGSYS_MAIN_WPE1, "imgsys_main_wpe1", "top_img", 12),
+	GATE_IMGSYS(CLK_IMGSYS_MAIN_WPE2, "imgsys_main_wpe2", "top_img", 13),
+	GATE_IMGSYS(CLK_IMGSYS_MAIN_GALS, "imgsys_main_gals", "top_img", 31),
+};
+
+static const struct mtk_gate imgsys_wpe1_clks[] = {
+	GATE_IMGSYS(CLK_IMGSYS_WPE1_LARB11, "imgsys_wpe1_larb11", "top_img", 0),
+	GATE_IMGSYS(CLK_IMGSYS_WPE1, "imgsys_wpe1", "top_img", 1),
+};
+
+static const struct mtk_gate imgsys_wpe2_clks[] = {
+	GATE_IMGSYS(CLK_IMGSYS_WPE2_LARB11, "imgsys_wpe2_larb11", "top_img", 0),
+	GATE_IMGSYS(CLK_IMGSYS_WPE2, "imgsys_wpe2", "top_img", 1),
+};
+
+static const struct mtk_gate imgsys_wpe3_clks[] = {
+	GATE_IMGSYS(CLK_IMGSYS_WPE3_LARB11, "imgsys_wpe3_larb11", "top_img", 0),
+	GATE_IMGSYS(CLK_IMGSYS_WPE3, "imgsys_wpe3", "top_img", 1),
+};
+
+static const struct mtk_gate imgsys1_dip_top_clks[] = {
+	GATE_IMGSYS(CLK_IMGSYS1_DIP_TOP_LARB10, "imgsys1_dip_larb10", "top_img", 0),
+	GATE_IMGSYS(CLK_IMGSYS1_DIP_TOP_DIP_TOP, "imgsys1_dip_dip_top", "top_img", 1),
+};
+
+static const struct mtk_gate imgsys1_dip_nr_clks[] = {
+	GATE_IMGSYS(CLK_IMGSYS1_DIP_NR_LARB15, "imgsys1_dip_nr_larb15", "top_img", 0),
+	GATE_IMGSYS(CLK_IMGSYS1_DIP_NR_DIP_NR, "imgsys1_dip_nr_dip_nr", "top_img", 1),
+};
+
+static const struct mtk_clk_desc imgsys_main_desc = {
+	.clks = imgsys_main_clks,
+	.num_clks = ARRAY_SIZE(imgsys_main_clks),
+};
+
+static const struct mtk_clk_desc imgsys_wpe1_desc = {
+	.clks = imgsys_wpe1_clks,
+	.num_clks = ARRAY_SIZE(imgsys_wpe1_clks),
+};
+
+static const struct mtk_clk_desc imgsys_wpe2_desc = {
+	.clks = imgsys_wpe2_clks,
+	.num_clks = ARRAY_SIZE(imgsys_wpe2_clks),
+};
+
+static const struct mtk_clk_desc imgsys_wpe3_desc = {
+	.clks = imgsys_wpe3_clks,
+	.num_clks = ARRAY_SIZE(imgsys_wpe3_clks),
+};
+
+static const struct mtk_clk_desc imgsys1_dip_top_desc = {
+	.clks = imgsys1_dip_top_clks,
+	.num_clks = ARRAY_SIZE(imgsys1_dip_top_clks),
+};
+
+static const struct mtk_clk_desc imgsys1_dip_nr_desc = {
+	.clks = imgsys1_dip_nr_clks,
+	.num_clks = ARRAY_SIZE(imgsys1_dip_nr_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_imgsys_main[] = {
+	{ .compatible = "mediatek,mt8188-imgsys", .data = &imgsys_main_desc,},
+	{ .compatible = "mediatek,mt8188-imgsys-wpe1", .data = &imgsys_wpe1_desc },
+	{ .compatible = "mediatek,mt8188-imgsys-wpe2", .data = &imgsys_wpe2_desc },
+	{ .compatible = "mediatek,mt8188-imgsys-wpe3", .data = &imgsys_wpe3_desc },
+	{ .compatible = "mediatek,mt8188-imgsys1-dip-top", .data = &imgsys1_dip_top_desc},
+	{ .compatible = "mediatek,mt8188-imgsys1-dip-nr", .data = &imgsys1_dip_nr_desc},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_imgsys_main_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-imgsys_main",
+		.of_match_table = of_match_clk_mt8188_imgsys_main,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_imgsys_main_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


