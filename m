Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13F3C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1CEyBYlUl+CcqMyJHHvPLY8oNBEctUNsd1/iKm7Shw=; b=iuNeBKm55793xjjFrZW+Qm4ibB
	bLM4F/mTQy0wYpbrNXR6ZKl/YNZseR6lBEWmW/Vi58AyqMCUZGMbI3BV7FcWvk7LOyOXLKpR02FoA
	hB5jgSBWZ9u9YOGy+k+Xd9NbXk+ubIR1RaqctrQSjwKWYBZ0O0se48f5jmFy4VSUxslArjsXQyJZI
	ptnygOUrLA/r8Tg0vP2i8vkkidW6EPBnjl7Tkv2dnHEfD1CFN8abdph5lGKwA+/MPwe6Zg8WNNSyN
	agsCweU7LXXAYlKHxh7psI2sONNH/fLr3EwOZjVDGTFsDziLYpJjgmcDv7s2ay1kGnM7L1MEQUSsq
	IT4dajvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIURV-004uDD-Mi; Thu, 19 Jan 2023 12:54:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMT-004rlf-Lg; Thu, 19 Jan 2023 12:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=w1CEyBYlUl+CcqMyJHHvPLY8oNBEctUNsd1/iKm7Shw=; b=RQd3IOiFJa1bPtaTbTgm55OvLq
	cdApc6W22+MU0jGAOVQY8dpJHYW8VEdYsqYNKb0IRMbWyOP7s0LUYciFgT6ooHaCKzrGZWSBT41Hs
	tvlw5Vk8OfvEBG7jkBp34BmUVB6jalLIzniuX6ncGJZSL6TPGYr57osjmLMy9LBXQL337Oc7N1kDk
	Y3ji6nduSObpzkyGUX6OtMunJBfugfi2j3fo8rbyoEhKERnrajLd1ZkJHpTig0PnYosiQUM/G4i8m
	aN+5IxdQeqIZl6fsQPDut91o2Hy6rSRhRCY9eL7es37iBDs+FRow4hCXsBSZwhMmpQkQi+lKe06Y2
	vhVB0f9A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIULw-000IOy-0D;
	Thu, 19 Jan 2023 12:49:15 +0000
X-UUID: a5b942a897f711edbbe3f76fe852e059-20230119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w1CEyBYlUl+CcqMyJHHvPLY8oNBEctUNsd1/iKm7Shw=;
	b=p/44jNrmOHhMYJTjpaEHVU664lUYJhCzVf9KrqLEnEbtETfUU4JqkMKjXe1ZFKWTxteacybOpjEV7HdDQPJCZTFW6Uy0nXcWrMXaWVjpexYu0EoAPZH68tl+z+FKk5rPBB2TpyC7xJpN6GsnXlin5vmi1oDyeuaLKBoWVaivtX0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:832468a2-8473-4140-a858-2a568fae07a7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.18,REQID:832468a2-8473-4140-a858-2a568fae07a7,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:3ca2d6b,CLOUDID:e8ba1f55-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230119204903G2C2ZB0M,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:43,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: a5b942a897f711edbbe3f76fe852e059-20230119
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 397607182; Thu, 19 Jan 2023 05:49:01 -0700
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
Subject: [PATCH v5 18/19] clk: mediatek: Add MT8188 imp i2c wrapper clock support
Date: Thu, 19 Jan 2023 20:48:47 +0800
Message-ID: <20230119124848.26364-19-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_124912_606863_C36775A2 
X-CRM114-Status: GOOD (  15.97  )
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


