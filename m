Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50082C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 07:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1CEyBYlUl+CcqMyJHHvPLY8oNBEctUNsd1/iKm7Shw=; b=bG4VnecSpIxELznJZCTLjVmsJr
	gAElAPFeaXXNQvtr3a7mO78W8FSozrltgUxVRbhWTp9vOWR3XbdjODpy4fHN+hfF+fh7TgclMI6Tz
	LUffNeh5WedKiNwGpWNcTX/1iXFsVWbOdo92xlkpTi1mDzUuEsEtG0xx+E/HgKUYA1X06N7QFVJfb
	FeJycTs5vajxD+00PbOpynF+WazDO/u8wy1FP8UZEolASlXlhEq0EKDuvAF2jAa8sda2mg8vxKokz
	hIs73NOSusTRf2Vcp2DFyokro1GMzwFN2FfQzkV3GwByrMgeILjA2KnRwHD9jvV23Rvm4b1PU8Dzy
	XE+LYEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9zs-006yFV-7g; Fri, 30 Dec 2022 07:40:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9uf-006vhM-Gn; Fri, 30 Dec 2022 07:34:48 +0000
X-UUID: 75bcc7606f72410ba4e4f158cbbd2405-20221230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w1CEyBYlUl+CcqMyJHHvPLY8oNBEctUNsd1/iKm7Shw=;
	b=O6HcJlpJhsM7s3+ONq6SxgaDN5al3PMlXRRnTuEZ+PV+IWZRUfurCaJ2GoVLwGDZVH1GSAk0wNtQ19wB4ZduQ0v7stBI7lNNARPkS/kSopzgOeaUfTu8akf3r5CLXaBoJrCTJ81vT9poWdlRg/8eyyDfboOUGvNgn5s/qECTqFE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:f3636cf0-3cf2-4684-a93a-81bd515b788b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:09771b1,CLOUDID:63c762f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 75bcc7606f72410ba4e4f158cbbd2405-20221230
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2041370949; Fri, 30 Dec 2022 00:34:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Dec 2022 15:34:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Dec 2022 15:34:02 +0800
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
Subject: [PATCH v3 18/19] clk: mediatek: Add MT8188 imp i2c wrapper clock support
Date: Fri, 30 Dec 2022 15:33:56 +0800
Message-ID: <20221230073357.18503-19-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
References: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_233445_690150_0C2935D2 
X-CRM114-Status: GOOD (  15.62  )
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

Add MT8188 imp i2c wrapper clock controllers which provide clock gate
control in I2C IP blocks.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile                 |  3 +-
 .../clk/mediatek/clk-mt8188-imp_iic_wrap.c    | 78 +++++++++++++++++++
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index ed35546819a9..8befaedfdd3d 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -88,7 +88,8 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
 				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
 				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
 				   clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o \
-				   clk-mt8188-vpp0.o clk-mt8188-vpp1.o clk-mt8188-wpe.o
+				   clk-mt8188-vpp0.o clk-mt8188-vpp1.o clk-mt8188-wpe.o \
+				   clk-mt8188-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c
new file mode 100644
index 000000000000..e9b951f95fba
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c
@@ -0,0 +1,78 @@
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
+static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_cg_regs, _shift,			\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate imp_iic_wrap_c_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C0,
+			  "imp_iic_wrap_c_ap_clock_i2c0", "top_i2c", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C2,
+			  "imp_iic_wrap_c_ap_clock_i2c2", "top_i2c", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C3,
+			  "imp_iic_wrap_c_ap_clock_i2c3", "top_i2c", 2),
+};
+
+static const struct mtk_gate imp_iic_wrap_w_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C1,
+			  "imp_iic_wrap_w_ap_clock_i2c1", "top_i2c", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C4,
+			  "imp_iic_wrap_w_ap_clock_i2c4", "top_i2c", 1),
+};
+
+static const struct mtk_gate imp_iic_wrap_en_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C5,
+			  "imp_iic_wrap_en_ap_clock_i2c5", "top_i2c", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C6,
+			  "imp_iic_wrap_en_ap_clock_i2c6", "top_i2c", 1),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_c_desc = {
+	.clks = imp_iic_wrap_c_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_c_clks),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_w_desc = {
+	.clks = imp_iic_wrap_w_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_w_clks),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_en_desc = {
+	.clks = imp_iic_wrap_en_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_en_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_imp_iic_wrap[] = {
+	{ .compatible = "mediatek,mt8188-imp-iic-wrap-c", .data = &imp_iic_wrap_c_desc },
+	{ .compatible = "mediatek,mt8188-imp-iic-wrap-w", .data = &imp_iic_wrap_w_desc },
+	{ .compatible = "mediatek,mt8188-imp-iic-wrap-en", .data = &imp_iic_wrap_en_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_imp_iic_wrap_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-imp_iic_wrap",
+		.of_match_table = of_match_clk_mt8188_imp_iic_wrap,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_imp_iic_wrap_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


