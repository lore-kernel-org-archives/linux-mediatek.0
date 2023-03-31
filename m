Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66451C761AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNGDRL0lSvQ48nYqYIBjGbuKuWmSX82LwlFyhp9Kn+8=; b=X7K3dAEBRw/k1YfKafsmw8qusN
	w9/ZvbrEWCXYIV5X+10h5rBli1Y6TPYyy7VMEVUidrt9tJRh6vWQxqN2l1B+G29tE/qWmi2btgNTt
	x8Tmop3xjE4nz4G7KCFxS8jKXPtDOuIG5/k3s8CNoBtpoWml6dyZLTG8JwO94DGvzGGHRhAAF/0th
	8aYjx/Vay7U5iOAxHnwYvhuQYt4xw8KnxqaRuiOWLO5FO0ekEPIDYsNzJNGzapeB2vC4aOdyXRttv
	dbSAjYrO4WNQ6lBt0s0+3lkdHzXFt0gXmulGGMmATIx4D1zSE/L91tvHh1rB2fAenq5TrAyHxPsvo
	gRoe8fdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piDzk-007JFp-0U;
	Fri, 31 Mar 2023 12:36:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piDzc-007J8B-0C;
	Fri, 31 Mar 2023 12:36:34 +0000
X-UUID: a8167c18cfc011ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZNGDRL0lSvQ48nYqYIBjGbuKuWmSX82LwlFyhp9Kn+8=;
	b=F2rOevqFlSYovjn/ushg1Y+GzIPe5K38GMdS/+HfhC6rCGti2oB+aMTU13oAuJyK/NSoa453ILfWDx8bXBEmh+pJuKQmfGq4OwAfyyCRsc441na1m6HSW1tkqrYwCt18V90RxU0IWdPIeVtsaZnoC/iXS6XbhmV3pKZQ13QvqqE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:27a71ef0-eee9-43db-b0bb-ee1843f3d091,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:27a71ef0-eee9-43db-b0bb-ee1843f3d091,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:02c2192a-564d-42d9-9875-7c868ee415ec,B
	ulkID:230331203631Q85IRFP0,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: a8167c18cfc011ed8687db9d93187ff1-20230331
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2121722152; Fri, 31 Mar 2023 05:36:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 20:36:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 20:36:26 +0800
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
Subject: [PATCH v8 11/19] clk: mediatek: Add MT8188 vdecsys clock support
Date: Fri, 31 Mar 2023 20:36:13 +0800
Message-ID: <20230331123621.16167-12-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_053632_176100_0163DC6E 
X-CRM114-Status: GOOD (  17.51  )
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

Add MT8188 vdec clock controllers which provide clock gate
control for video decoder.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig           |  7 ++
 drivers/clk/mediatek/Makefile          |  1 +
 drivers/clk/mediatek/clk-mt8188-vdec.c | 92 ++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdec.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index d1239c7ac9f4..8470684daa46 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -720,6 +720,13 @@ config COMMON_CLK_MT8188_MFGCFG
 	help
 	  This driver supports MediaTek MT8188 mfgcfg clocks.
 
+config COMMON_CLK_MT8188_VDECSYS
+	tristate "Clock driver for MediaTek MT8188 vdecsys"
+	depends on COMMON_CLK_MT8188_VPPSYS
+	default COMMON_CLK_MT8188_VPPSYS
+	help
+	  This driver supports MediaTek MT8188 vdecsys and vdecsys_soc clocks.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 16ba3c97c4e8..b63d38804809 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_CAMSYS) += clk-mt8188-cam.o clk-mt8188-ccu.o
 obj-$(CONFIG_COMMON_CLK_MT8188_IMGSYS) += clk-mt8188-img.o
 obj-$(CONFIG_COMMON_CLK_MT8188_IPESYS) += clk-mt8188-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8188_MFGCFG) += clk-mt8188-mfg.o
+obj-$(CONFIG_COMMON_CLK_MT8188_VDECSYS) += clk-mt8188-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-vdec.c b/drivers/clk/mediatek/clk-mt8188-vdec.c
new file mode 100644
index 000000000000..8c3d76531753
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-vdec.c
@@ -0,0 +1,92 @@
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
+static const struct mtk_gate_regs vdec0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vdec1_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vdec2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDEC0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdec2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vdec1_clks[] = {
+	/* VDEC1_0 */
+	GATE_VDEC0(CLK_VDEC1_SOC_VDEC, "vdec1_soc_vdec", "top_vdec", 0),
+	GATE_VDEC0(CLK_VDEC1_SOC_VDEC_ACTIVE, "vdec1_soc_vdec_active", "top_vdec", 4),
+	GATE_VDEC0(CLK_VDEC1_SOC_VDEC_ENG, "vdec1_soc_vdec_eng", "top_vdec", 8),
+	/* VDEC1_1 */
+	GATE_VDEC1(CLK_VDEC1_SOC_LAT, "vdec1_soc_lat", "top_vdec", 0),
+	GATE_VDEC1(CLK_VDEC1_SOC_LAT_ACTIVE, "vdec1_soc_lat_active", "top_vdec", 4),
+	GATE_VDEC1(CLK_VDEC1_SOC_LAT_ENG, "vdec1_soc_lat_eng", "top_vdec", 8),
+	/* VDEC1_2 */
+	GATE_VDEC2(CLK_VDEC1_SOC_LARB1, "vdec1_soc_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_gate vdec2_clks[] = {
+	/* VDEC2_0 */
+	GATE_VDEC0(CLK_VDEC2_VDEC, "vdec2_vdec", "top_vdec", 0),
+	GATE_VDEC0(CLK_VDEC2_VDEC_ACTIVE, "vdec2_vdec_active", "top_vdec", 4),
+	GATE_VDEC0(CLK_VDEC2_VDEC_ENG, "vdec2_vdec_eng", "top_vdec", 8),
+	/* VDEC2_1 */
+	GATE_VDEC1(CLK_VDEC2_LAT, "vdec2_lat", "top_vdec", 0),
+	/* VDEC2_2 */
+	GATE_VDEC2(CLK_VDEC2_LARB1, "vdec2_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_clk_desc vdec1_desc = {
+	.clks = vdec1_clks,
+	.num_clks = ARRAY_SIZE(vdec1_clks),
+};
+
+static const struct mtk_clk_desc vdec2_desc = {
+	.clks = vdec2_clks,
+	.num_clks = ARRAY_SIZE(vdec2_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_vdec[] = {
+	{ .compatible = "mediatek,mt8188-vdecsys-soc", .data = &vdec1_desc },
+	{ .compatible = "mediatek,mt8188-vdecsys", .data = &vdec2_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_vdec);
+
+static struct platform_driver clk_mt8188_vdec_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-vdec",
+		.of_match_table = of_match_clk_mt8188_vdec,
+	},
+};
+
+module_platform_driver(clk_mt8188_vdec_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


