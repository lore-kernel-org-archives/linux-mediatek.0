Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976CBC761AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krJ06bsBdnpzVcos2UsY2YeQFHo3UM36phq6Y4l50zE=; b=eAS6RlGMucEqYxbLutw1hAwfjW
	vRtVimw4l2rKeZmcsniysNL6w5JmphbqzUhZsoL2Cl9if4oVbjfbIFESP5554G0Ub0PqgaM+2QdX/
	Ifx0DsEzdkrrkO4DMhORjs6rmarYjmaPSygeCxkj2SGl2QmFpmoSWa9y9OetSt3IrnuzecGjalEzo
	GZCrvt/mnY3dNGtciVsC/K7NjFGhW2NaNBbJjqNJnyUHacTojFRsSHF8ORJr9jggQEKtTOrwyKtme
	udA/5ebxMvwyF/S1xVWQF/vrGiR7lObGOAXNhgEZPN8WtyN4ViycbwCrvvNbXhpUbbSmTaW3pmUEj
	iOfZjeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piE04-007JPS-0F;
	Fri, 31 Mar 2023 12:37:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piDze-007J8B-0t;
	Fri, 31 Mar 2023 12:36:36 +0000
X-UUID: a8f59524cfc011ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=krJ06bsBdnpzVcos2UsY2YeQFHo3UM36phq6Y4l50zE=;
	b=r62uS4ibpSvsQxw0c/b2TMpMeRAkyz9s5cMMUP6CHz4wL661xdXMS1p7AklGCeq9NAjEpWxMt+BMvNOU/Bvt5shXoyOkUYocX2ybFQmG6jSiQoVVNv2ynpkPP/7SsRHXDdfqR7q02euIKmIrYT+VtnZXG8ZN4JhxgD3GEaPDgEI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:a711ad6a-0995-485c-bb3e-04baa02f945b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:ea9b88f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: a8f59524cfc011ed8687db9d93187ff1-20230331
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 959453324; Fri, 31 Mar 2023 05:36:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 20:36:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 20:36:25 +0800
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
Subject: [PATCH v8 08/19] clk: mediatek: Add MT8188 imgsys clock support
Date: Fri, 31 Mar 2023 20:36:10 +0800
Message-ID: <20230331123621.16167-9-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_053634_353685_AE23CBE0 
X-CRM114-Status: GOOD (  16.96  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig          |   7 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8188-img.c | 112 ++++++++++++++++++++++++++
 3 files changed, 120 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-img.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 9170f76a8ee7..74f7d4540718 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -699,6 +699,13 @@ config COMMON_CLK_MT8188_CAMSYS
 	help
 	  This driver supports MediaTek MT8188 camsys and camsys_raw clocks.
 
+config COMMON_CLK_MT8188_IMGSYS
+	tristate "Clock driver for MediaTek MT8188 imgsys"
+	depends on COMMON_CLK_MT8188_VPPSYS
+	default COMMON_CLK_MT8188_VPPSYS
+	help
+	  This driver supports MediaTek MT8188 imgsys and imgsys2 clocks.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index fc4faee04636..6e72ff79b800 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186_WPESYS) += clk-mt8186-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8188_CAMSYS) += clk-mt8188-cam.o clk-mt8188-ccu.o
+obj-$(CONFIG_COMMON_CLK_MT8188_IMGSYS) += clk-mt8188-img.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-img.c b/drivers/clk/mediatek/clk-mt8188-img.c
new file mode 100644
index 000000000000..b4622875e14c
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-img.c
@@ -0,0 +1,112 @@
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
+	{ .compatible = "mediatek,mt8188-imgsys", .data = &imgsys_main_desc },
+	{ .compatible = "mediatek,mt8188-imgsys-wpe1", .data = &imgsys_wpe1_desc },
+	{ .compatible = "mediatek,mt8188-imgsys-wpe2", .data = &imgsys_wpe2_desc },
+	{ .compatible = "mediatek,mt8188-imgsys-wpe3", .data = &imgsys_wpe3_desc },
+	{ .compatible = "mediatek,mt8188-imgsys1-dip-top", .data = &imgsys1_dip_top_desc },
+	{ .compatible = "mediatek,mt8188-imgsys1-dip-nr", .data = &imgsys1_dip_nr_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_imgsys_main);
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
+module_platform_driver(clk_mt8188_imgsys_main_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


