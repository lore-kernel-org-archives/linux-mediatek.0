Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5586DC00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 12:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtBuexgRSh0fDOhKlmGS+ISY3IrE5IH9rhU+oMjF19A=; b=iQ8236isY8QNHCP+b+ncyGmJ1+
	JejQ4376Bq8wINnJVHPfYoVMrhDtrKLhmt8k/B0XDlhY9eKrDy2Ri9CkE/tBp2hLVeHIuscnFGFnY
	BrGrtOxIf+U7uMVxjNAjjHXRMSaJyPfMjk280RC8igY4nSBtSDDdoGZQwU0dqkKPw3rENLoDOq0ik
	qpNy9IkVo6fxgzexdIX6jpig4z9txwgMR8mXs/STevmtCuoxdXnmX51eeFaYPUUXtrlJaWdBvA6ou
	0xykmVQdhu2nbd3UydZAdBijpYPkib/CPF/ZKSbHJUUDR6A9A9UkdOGGC17JxAOfu0+Ll9sUabJW9
	XGOU2D8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIURQ-004uA4-Lg; Thu, 19 Jan 2023 12:54:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMT-004rla-Ir; Thu, 19 Jan 2023 12:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jtBuexgRSh0fDOhKlmGS+ISY3IrE5IH9rhU+oMjF19A=; b=IkcFZYcG5wIOXzyFsUQSQadlXY
	ebzSCkhdEbU0Zge8+2BbJxD/vkKkEr0aVr5HZ/J3daOLGwlLil8pnM5Fj24HwaHdCkeg30pR7468T
	InyLQbMuMWqRuyljRmyz7DWpdLx6ql4sIGxrhzJttNnfDI8UhsFpbulWdToU+Vj+q2Elj9Oq0n9aP
	YppPrjCaY30cNapYOrNCcggCXISnep0V+bUlkGOZD12q7iCg68B4KEx9Sok2oaGWYak47DAhCUJyE
	mQGUCIW1ewqh0+fPWwixj3uBRkgvNCQDyqvAwPvXVorwqQstAvA5z4YeCXfd+mavNutBgMby93Kcc
	nDbHUAcQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIULu-000IPJ-1C;
	Thu, 19 Jan 2023 12:49:15 +0000
X-UUID: a54d178697f711edbbe3f76fe852e059-20230119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jtBuexgRSh0fDOhKlmGS+ISY3IrE5IH9rhU+oMjF19A=;
	b=I5yX0GjgwaDX6ZoYhZmjrXBrxZ9aCPYDnrnR1gLC9Hagirwzwp+rudNQb3gzx1PoDsl0dXcCl04u+RvN6M58DOBU0D9nzxoCynGYV/7MCnZgajEeju5y1xaicrGIfMCWbYOmWlPz+tehTW3AiZapmCj+4xOGEzswoewCR6qrD+0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:39cb86e0-116d-4f2a-ba37-ec950c7c1ae3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.18,REQID:39cb86e0-116d-4f2a-ba37-ec950c7c1ae3,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:3ca2d6b,CLOUDID:79a4ba8c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230119204903G2C2ZB0M,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: a54d178697f711edbbe3f76fe852e059-20230119
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1916616862; Thu, 19 Jan 2023 05:49:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 19 Jan 2023 20:48:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 19 Jan 2023 20:48:57 +0800
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
Subject: [PATCH v5 14/19] clk: mediatek: Add MT8188 vencsys clock support
Date: Thu, 19 Jan 2023 20:48:43 +0800
Message-ID: <20230119124848.26364-15-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_124911_622446_86CB21A7 
X-CRM114-Status: GOOD (  15.87  )
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


