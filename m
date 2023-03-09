Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1965EC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdVWrlXDGE0VAAHmraFhkUwohNsQgDAzIsBbk8XZS9w=; b=YwIQv9o0B8xFyGZ8J1qPtjOrS6
	O5w4Y5RWvpwr6K+VN+GTYDCbQcHNOcBDa61jytgL05/bnjOiozsY5vTBHVJZyb1WCqmVTavNk+4aI
	EKXh68ZEfzClFzickxAoIMXiNX93lTqXpOJ4Yc7Qry5IQMyk0wEtCzL8Hh+CTIsaixX2oli194YSP
	tgU0XvOVI6EFj8bR/uaNy+8wEgW8uRK5dNiqvFVX5AeBAOI5csbwOKMNFOHElc64RQ6HoJ2Qokzn+
	LDudLTC7Mqn8+f9YD6qghRDjW5to7NLXS/V4J/cBVYfwsaRn1P9JHcaKFKnWhDDZ1upIIIMSAgLn3
	JtdQw0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGke-00AFr9-Lr; Thu, 09 Mar 2023 13:56:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGj5-00AEyI-OT; Thu, 09 Mar 2023 13:54:40 +0000
X-UUID: eb111e06be8111edbbe3f76fe852e059-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KdVWrlXDGE0VAAHmraFhkUwohNsQgDAzIsBbk8XZS9w=;
	b=f64Xn6Nb4KROKuHwWPTpX/nhkAlo5lOsdMOE9xe/JpjSxo8J41wsRLHEfOgpqP26IeSHHTS8lvxnBrv1xLNX7ZJ1T4VqSrXm8PWoqOTjXwLlrRmegOamt3buy66sW14ZDFE9IgDG60RTM174znxzc4aj8T1xGC65DLVXTLSPAuw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:ddcb1ba5-4eda-4a55-a444-93868b544f91,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.20,REQID:ddcb1ba5-4eda-4a55-a444-93868b544f91,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:25b5999,CLOUDID:5fa4bdb2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:230309215430FQ6XG8HP,BulkQuantity:6,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: eb111e06be8111edbbe3f76fe852e059-20230309
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2006026082; Thu, 09 Mar 2023 06:54:32 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 9 Mar 2023 21:54:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 9 Mar 2023 21:54:27 +0800
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
Subject: [PATCH v6 14/19] clk: mediatek: Add MT8188 vencsys clock support
Date: Thu, 9 Mar 2023 21:54:14 +0800
Message-ID: <20230309135419.30159-15-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230309135419.30159-1-Garmin.Chang@mediatek.com>
References: <20230309135419.30159-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_055435_838340_4919E580 
X-CRM114-Status: GOOD (  15.82  )
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
index 78885318e026..4e5c15cb93ad 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -95,7 +95,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
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
index 000000000000..8bb1384fbd20
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
+static const struct mtk_gate_regs venc1_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_VENC1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &venc1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate venc1_clks[] = {
+	GATE_VENC1(CLK_VENC1_LARB, "venc1_larb", "top_venc", 0),
+	GATE_VENC1(CLK_VENC1_VENC, "venc1_venc", "top_venc", 4),
+	GATE_VENC1(CLK_VENC1_JPGENC, "venc1_jpgenc", "top_venc", 8),
+	GATE_VENC1(CLK_VENC1_JPGDEC, "venc1_jpgdec", "top_venc", 12),
+	GATE_VENC1(CLK_VENC1_JPGDEC_C1, "venc1_jpgdec_c1", "top_venc", 16),
+	GATE_VENC1(CLK_VENC1_GALS, "venc1_gals", "top_venc", 28),
+	GATE_VENC1(CLK_VENC1_GALS_SRAM, "venc1_gals_sram", "top_venc", 31),
+};
+
+static const struct mtk_clk_desc venc1_desc = {
+	.clks = venc1_clks,
+	.num_clks = ARRAY_SIZE(venc1_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_venc1[] = {
+	{ .compatible = "mediatek,mt8188-vencsys", .data = &venc1_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_venc1_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-venc1",
+		.of_match_table = of_match_clk_mt8188_venc1,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_venc1_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


