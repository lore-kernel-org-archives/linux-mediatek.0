Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C02C54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPUSoPDu5i0jbOtt/MmddOTPCrDjJXOro6qMAU1Xv9E=; b=GvwwZxYr/Wa7lvmlGdWLbbcIfT
	V5ojUOpeiMNpxcoWwzLLY2PyqS9DVDn62QKmBzi5oBTVsvoPG6iqq++V57mj+0wKc889nPYqCHGnJ
	i+tXWIf6Lp2wyeW8OTqopseKfQV0LxFX6Mys36jnB9tQun8+jTgZnVqXEo+kr2mWZq3yd8tPJzu+B
	F8o/Zm9J1c31VFDJ+NIlMAcgc5A7TedagTnft2jNOTvrjBp0Ejn8h34QvsG+8DOxevgArDzo8Vwf5
	83AaX9oiFigJmpdoA7ShL7oIMOpAG9p66SPujZghOzq/QiqFTQE47i75RUZ7TF0hWE5cFakTjplRr
	ZdAfTPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEryh-001UDA-NR; Mon, 09 Jan 2023 13:14:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEryU-001U8v-Na; Mon, 09 Jan 2023 13:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oPUSoPDu5i0jbOtt/MmddOTPCrDjJXOro6qMAU1Xv9E=; b=gkvELAOx4pkMpxrwfVzsAGd3AC
	XCHyni1qe3L22W12oUMePt8JCETSU3KAzkVYynnRPjj9t/8hP08+85bwGbjegTW5CbuEJhUhJ+XQW
	3t/VFRwU+xEok+I3ejS2fmZVP3ySV4wFPEtSRX1NVVBRTAyRdphgEAYOMCJsJF7dsWSSJ1C11Iutr
	6d+1AjhUJLyd15IguwY5rVoYkB14iPkdbCwP/sGKxQwT1AvuSlNowITBOiMykWSE7c6R5TSXpqPy8
	jEYJdjojqADVAYUVNa/1zqf+FnyL9vVwtZqzfkIfVuBXEf1Y1KCGerCNX0ea8eDUQN7oUoQcjuMWq
	jPOAImUg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pErgT-002jLN-19;
	Mon, 09 Jan 2023 12:55:28 +0000
X-UUID: d0896b9343d94930a0dae851635cc699-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oPUSoPDu5i0jbOtt/MmddOTPCrDjJXOro6qMAU1Xv9E=;
	b=JFbfZsc30q+HjTu4q0JbUzIBp8nMmKf/nDK/5C7BUS7t5/5iAkOZ16uv2exoueJStgwL5OPrRhetSxuXkKnSCrNlNpGlwwa/7Eu9P/cQ/Hoa85rayfkEF8C5aC9ruI7JALiMpOty0FAX8NOX3D3leiIGZqQa5wvDY8xxnVg8kP4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:4c48ab13-0046-4519-a38e-8721fcebfab2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:af4f47f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: d0896b9343d94930a0dae851635cc699-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1866654981; Mon, 09 Jan 2023 05:55:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 Jan 2023 20:45:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Jan 2023 20:45:21 +0800
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
Subject: [PATCH v4 10/19] clk: mediatek: Add MT8188 mfgcfg clock support
Date: Mon, 9 Jan 2023 20:45:07 +0800
Message-ID: <20230109124516.31425-11-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
References: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_125526_161892_80B3947D 
X-CRM114-Status: GOOD (  15.86  )
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

Add MT8188 mfg clock controller which provides clock gate
control for GPU.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile         |  2 +-
 drivers/clk/mediatek/clk-mt8188-mfg.c | 47 +++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-mfg.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 4a599122f761..a0fd87a882b5 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -86,7 +86,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
 				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
-				   clk-mt8188-ipe.o
+				   clk-mt8188-ipe.o clk-mt8188-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-mfg.c b/drivers/clk/mediatek/clk-mt8188-mfg.c
new file mode 100644
index 000000000000..57b0afb5f4df
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-mfg.c
@@ -0,0 +1,47 @@
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
+static const struct mtk_gate_regs mfgcfg_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_MFG(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfgcfg_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_SET_RATE_PARENT)
+
+static const struct mtk_gate mfgcfg_clks[] = {
+	GATE_MFG(CLK_MFGCFG_BG3D, "mfgcfg_bg3d", "top_mfg_core_tmp", 0),
+};
+
+static const struct mtk_clk_desc mfgcfg_desc = {
+	.clks = mfgcfg_clks,
+	.num_clks = ARRAY_SIZE(mfgcfg_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_mfgcfg[] = {
+	{ .compatible = "mediatek,mt8188-mfgcfg", .data = &mfgcfg_desc, },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_mfgcfg_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-mfgcfg",
+		.of_match_table = of_match_clk_mt8188_mfgcfg,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_mfgcfg_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


