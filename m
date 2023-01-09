Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99674C54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 12:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtBuexgRSh0fDOhKlmGS+ISY3IrE5IH9rhU+oMjF19A=; b=RvcJZxbytYMaP6WZkpKRD9B9P+
	ganaom7z6TJRYXHXd9FntAuFGMJ7l0DdPiBtZtri4/HYsLONb7uL/WmTbGRWC/K3+1xBct5oTnHmk
	JD9ChrOmhdbI8RrnnHp6NwPpWKjT825B2dk+wytzwAg65NVY2nUKOrqO/shIS9I+X0DAREMZJPNMe
	GVWMQYz4O/E3J65q94i9rKgM/dlRCCFy3HbBP8ALr+1MCSHnpU9HHAeqrI+q8HrljVRajTxUISv9p
	MX30N/gwmPHqBNXwjRVEoa0hofkV/cb4KRKAf03Kia+4dyha9J4ByLGBFZKdh3MmyFyJ/CXzTexks
	9N+8mvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErhC-001MpE-Gv; Mon, 09 Jan 2023 12:56:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErh7-001Mlz-4a; Mon, 09 Jan 2023 12:56:07 +0000
X-UUID: 1aa7b717a7b04b11a86208ab17087116-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jtBuexgRSh0fDOhKlmGS+ISY3IrE5IH9rhU+oMjF19A=;
	b=W3sX3ifPCjtt3BevRTTOeaRVPsceyKPr8YfvvcOST0L/N3ln0FA1sqMY1Mbe9/m4qMihD0jcniD3zLhs6iobD3dR8wrzem2S2TWnklyVOh/Ro2z2nBpYfYPaSDIycmxw9pcvsuYIgtZUMs4i4QscOeBqO0j6c8JPoHEGRg0chZY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:0538eb02-cc4a-45ec-8833-1baa5200c1c3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:485147f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 1aa7b717a7b04b11a86208ab17087116-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1056943816; Mon, 09 Jan 2023 05:55:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 Jan 2023 20:45:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Jan 2023 20:45:22 +0800
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
Subject: [PATCH v4 14/19] clk: mediatek: Add MT8188 vencsys clock support
Date: Mon, 9 Jan 2023 20:45:11 +0800
Message-ID: <20230109124516.31425-15-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
References: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_045605_351094_29354519 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8188 vencsys clock controllers which provide clock gate
control for video encoder.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile          |  2 +-
 drivers/clk/mediatek/clk-mt8188-venc.c | 52 ++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-venc.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index c654f4288e09..22a3840160fc 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -87,7 +87,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
 				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
 				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
-				   clk-mt8188-vdo0.o clk-mt8188-vdo1.o
+				   clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-venc.c b/drivers/clk/mediatek/clk-mt8188-venc.c
new file mode 100644
index 000000000000..375ef99e2349
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-venc.c
@@ -0,0 +1,52 @@
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
+static const struct mtk_gate_regs ven1_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_VEN1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &ven1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate ven1_clks[] = {
+	GATE_VEN1(CLK_VEN1_CKE0_LARB, "ven1_cke0_larb", "top_venc", 0),
+	GATE_VEN1(CLK_VEN1_CKE1_VENC, "ven1_cke1_venc", "top_venc", 4),
+	GATE_VEN1(CLK_VEN1_CKE2_JPGENC, "ven1_cke2_jpgenc", "top_venc", 8),
+	GATE_VEN1(CLK_VEN1_CKE3_JPGDEC, "ven1_cke3_jpgdec", "top_venc", 12),
+	GATE_VEN1(CLK_VEN1_CKE4_JPGDEC_C1, "ven1_cke4_jpgdec_c1", "top_venc", 16),
+	GATE_VEN1(CLK_VEN1_CKE5_GALS, "ven1_cke5_gals", "top_venc", 28),
+	GATE_VEN1(CLK_VEN1_CKE6_GALS_SRAM, "ven1_cke6_gals_sram", "top_venc", 31),
+};
+
+static const struct mtk_clk_desc ven1_desc = {
+	.clks = ven1_clks,
+	.num_clks = ARRAY_SIZE(ven1_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_ven1[] = {
+	{ .compatible = "mediatek,mt8188-vencsys", .data = &ven1_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_ven1_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-ven1",
+		.of_match_table = of_match_clk_mt8188_ven1,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_ven1_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


