Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E39C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2ZNOtJ0lqwGXwZM/IpTY9F02R7oBtX3wFYEPCQ0UpA=; b=oaDMeCpB2tO0F+Sh9TrehHCLjJ
	iFyg3BLQwIfloSkYIgs/IMR96yEQlLFqRAJQANWhJCfkdIS9R6E9B+t5zH94MgtHUoJ7CebnFj467
	XXaqexEHK09Ai3rA2TytuYEqOW32aumPNJzLt+Wy5jVdxVmzimMJj/2SpL3fghHJT+AXWt1wWyb1Y
	f3jnBIuYlqDoaSV3zYZYl1IhoXvUjr0jrvZ1xkmkpFaK9xqS3C/Ysm1Mk3T6ovfNqhZlGTDCWwXid
	ySKimaxCQG8F9nzcTwzx3Clb5nCMKuzWPzSduIEILWfG4Zh/gLWUth9YPgMFwP9AitqnYREvhKV1f
	3ZcW1C1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piA1R-006KwX-0i;
	Fri, 31 Mar 2023 08:22:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piA1O-006Kvh-2g;
	Fri, 31 Mar 2023 08:22:08 +0000
X-UUID: 1cf1f59acf9d11ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=S2ZNOtJ0lqwGXwZM/IpTY9F02R7oBtX3wFYEPCQ0UpA=;
	b=Sv2r+kSF1d1BYCsZN+LQxIDt1jIVPBUGGc4KZTbqhujjYJHWBLdq0c2FdzmN+t5BLn8cniUTujn6zrsh59I9fPNDnwpQwEUQB5MS2tUdi0JtQb9n2qIqedpPrrnMZDj4OKTsFSEZl6oP2TcLqfBPC71J51eIeUWXhsbfq10eDTU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:3d4fb6ba-1702-4264-ad98-80a6a6e3556c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:bcbcf4b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 1cf1f59acf9d11ed8687db9d93187ff1-20230331
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 497077965; Fri, 31 Mar 2023 01:22:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 16:21:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 16:21:40 +0800
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
Subject: [PATCH v7 18/19] clk: mediatek: Add MT8188 imp i2c wrapper clock support
Date: Fri, 31 Mar 2023 16:21:30 +0800
Message-ID: <20230331082131.12517-19-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_012206_880145_7E01A6A1 
X-CRM114-Status: GOOD (  17.08  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig                  |  7 ++
 drivers/clk/mediatek/Makefile                 |  1 +
 .../clk/mediatek/clk-mt8188-imp_iic_wrap.c    | 80 +++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 998cf4f559ea..afabdffded50 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -706,6 +706,13 @@ config COMMON_CLK_MT8188_IMGSYS
 	help
 	  This driver supports MediaTek MT8188 imgsys and imgsys2 clocks.
 
+config COMMON_CLK_MT8188_IMP_IIC_WRAP
+	tristate "Clock driver for MediaTek MT8188 imp_iic_wrap"
+	depends on COMMON_CLK_MT8188
+	default COMMON_CLK_MT8188
+	help
+	  This driver supports MediaTek MT8188 I2C/I3C clocks.
+
 config COMMON_CLK_MT8188_IPESYS
 	tristate "Clock driver for MediaTek MT8188 ipesys"
 	depends on COMMON_CLK_MT8188_IMGSYS
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index df4e2da1ca49..7ef67ac366d8 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -104,6 +104,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8188_CAMSYS) += clk-mt8188-cam.o clk-mt8188-ccu.o
 obj-$(CONFIG_COMMON_CLK_MT8188_IMGSYS) += clk-mt8188-img.o
+obj-$(CONFIG_COMMON_CLK_MT8188_IMP_IIC_WRAP) += clk-mt8188-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8188_IPESYS) += clk-mt8188-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8188_MFGCFG) += clk-mt8188-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VDECSYS) += clk-mt8188-vdec.o
diff --git a/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c
new file mode 100644
index 000000000000..2238d2984320
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Garmin Chang <garmin.chang@mediatek.com>
+ */
+
+#include <dt-bindings/clock/mediatek,mt8188-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
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
+MODULE_DEVICE_TABLE(platform, of_match_clk_mt8188_imp_iic_wrap);
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
+module_platform_driver(clk_mt8188_imp_iic_wrap_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


