Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A70C04A68
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7t4EHGAZ2Uqu+cxJTIEo70lv8SbgITsGcYlTyqVKdI=; b=qWwNYST8drZ16EImP49uhmTYS4
	vTLQfdSbjdJFW2/fHRErSJqQ+lHzoqInLI5ppGdbm0Kw+eqwhIaD0/l/T/XCxiyEiFa7f5Z458Bkm
	erzviJhSGLw2lYrOUvPRMG5pAOJV9rEdjlxGii224f0yI0gCLnooogiroolyMXRkNjkAxigraKCRM
	dpE9KY39fjGRTxi9zo0f3SwYuAyU9VwyQFEnqKNxgaaLhpyw3aeeX1c72trA+3N30oJOTvJi53KsW
	WNYLAFPmaYdb0+mMvoKQsspXm6iDMqeyOM6KaHe2IMRQyJwUpHHr+9G2tr6dYP6iTOWinV3c9NYNq
	vP2vW9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLXk-003NvM-Ax; Fri, 29 Jul 2022 08:40:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLKu-003EKz-G4; Fri, 29 Jul 2022 08:27:11 +0000
X-UUID: 647b9e42af79495bb21243187294d06c-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:2c1534f1-721b-4994-918c-2c2b933ddb8d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:c007b724-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 647b9e42af79495bb21243187294d06c-20220729
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1174000513; Fri, 29 Jul 2022 01:27:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 16:25:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 16:25:27 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Garmin Chang <garmin.chang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH 18/18] clk: mediatek: Add MT8188 imp i2c wrapper clock support
Date: Fri, 29 Jul 2022 16:24:57 +0800
Message-ID: <20220729082457.22253-19-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
References: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_012708_578183_8A107F33 
X-CRM114-Status: GOOD (  14.99  )
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
 .../clk/mediatek/clk-mt8188-imp_iic_wrap.c    | 85 +++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index af0f1d767ced..a1ac70b84417 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -81,7 +81,8 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
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
index 000000000000..1d54d9c5cfee
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c
@@ -0,0 +1,85 @@
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
+static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &imp_iic_wrap_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
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
+	{
+		.compatible = "mediatek,mt8188-imp_iic_wrap_c",
+		.data = &imp_iic_wrap_c_desc,
+	}, {
+		.compatible = "mediatek,mt8188-imp_iic_wrap_w",
+		.data = &imp_iic_wrap_w_desc,
+	}, {
+		.compatible = "mediatek,mt8188-imp_iic_wrap_en",
+		.data = &imp_iic_wrap_en_desc,
+	}, {
+		/* sentinel */
+	}
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


