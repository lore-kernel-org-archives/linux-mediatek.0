Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE800C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSQNkTgINoMHo8RZfEb9Qgbl6Y5b01eOzD+iNSBTo8k=; b=LKvWvEtX4Ic5YZ5awI00mDOgXo
	dgouzWhgLwmjyhDYzmVtRDUdxXF7uEgUmI9QlEIgwlShhQB3UeZhMiNMlfVHquF43tD4C8xt2gDbt
	+rY6yZoqZlj9uik1BVCluOpM0hXnHQBBc7Q3ONPuAV/9vWesMy44clPpL1IPgxmGm3gpsH5z72m5u
	qvkL+HeDC3mGWkuXN7kEEMPAJgRhECCUKdJl4klKHEHoXIzP4SsXJ1ss9R1aSKXb0xpcQxPoS6aRN
	1u2k2t8Kr//hohMVCqCJ4vayDMyH63GsgCWhAdnCQX1p6qG9Q3Q7QJ/YrTgEmlWI37WzsX7j7Zpwe
	3FAyhSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piE04-007JPv-2S;
	Fri, 31 Mar 2023 12:37:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piDze-007JAw-0T;
	Fri, 31 Mar 2023 12:36:36 +0000
X-UUID: a8babff8cfc011ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iSQNkTgINoMHo8RZfEb9Qgbl6Y5b01eOzD+iNSBTo8k=;
	b=dM9eLlCG+Z+/6dr04ibOCXEzaoZimCIEBFYTTCMPWx4uZ72Nd2g5c2F7Fkp0O9Vfr85glu/1lDZkDn18XPyfBbzQVstgTkuf6HS+GQelHQKV3xvf7CBB+rDWto847JS7KL6uBCK8khpM95PvPAExrieWC4sEt2BpdsVvBwDFiNE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:86727582-1135-4257-8faa-fef065cc7fc7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:86e2fab4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: a8babff8cfc011ed8687db9d93187ff1-20230331
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1755527387; Fri, 31 Mar 2023 05:36:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 20:36:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 20:36:27 +0800
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
Subject: [PATCH v8 19/19] clk: mediatek: Add MT8188 adsp clock support
Date: Fri, 31 Mar 2023 20:36:21 +0800
Message-ID: <20230331123621.16167-20-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_053634_300585_1103CCC9 
X-CRM114-Status: GOOD (  17.41  )
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

Add MT8188 adsp clock controller which provides clock gate
control for Audio DSP.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig                  |  7 +++
 drivers/clk/mediatek/Makefile                 |  1 +
 .../clk/mediatek/clk-mt8188-adsp_audio26m.c   | 48 +++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index afabdffded50..99e67c07e638 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -692,6 +692,13 @@ config COMMON_CLK_MT8188
 	help
           This driver supports MediaTek MT8188 clocks.
 
+config COMMON_CLK_MT8188_ADSP_AUDIO26M
+	tristate "Clock driver for MediaTek MT8188 adsp audio26m"
+	depends on COMMON_CLK_MT8188
+	default COMMON_CLK_MT8188
+	help
+	  This driver supports MediaTek MT8188 adsp audio26m clocks.
+
 config COMMON_CLK_MT8188_CAMSYS
 	tristate "Clock driver for MediaTek MT8188 camsys"
 	depends on COMMON_CLK_MT8188_VPPSYS
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 7ef67ac366d8..dbeaa5b41177 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186_VENCSYS) += clk-mt8186-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8186_WPESYS) += clk-mt8186-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8188_ADSP_AUDIO26M) += clk-mt8188-adsp_audio26m.o
 obj-$(CONFIG_COMMON_CLK_MT8188_CAMSYS) += clk-mt8188-cam.o clk-mt8188-ccu.o
 obj-$(CONFIG_COMMON_CLK_MT8188_IMGSYS) += clk-mt8188-img.o
 obj-$(CONFIG_COMMON_CLK_MT8188_IMP_IIC_WRAP) += clk-mt8188-imp_iic_wrap.o
diff --git a/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
new file mode 100644
index 000000000000..b3c31ffff931
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
@@ -0,0 +1,48 @@
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
+static const struct mtk_gate_regs adsp_audio26m_cg_regs = {
+	.set_ofs = 0x80,
+	.clr_ofs = 0x80,
+	.sta_ofs = 0x80,
+};
+
+#define GATE_ADSP_FLAGS(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &adsp_audio26m_cg_regs, _shift,		\
+		&mtk_clk_gate_ops_no_setclr)
+
+static const struct mtk_gate adsp_audio26m_clks[] = {
+	GATE_ADSP_FLAGS(CLK_AUDIODSP_AUDIO26M, "audiodsp_audio26m", "clk26m", 3),
+};
+
+static const struct mtk_clk_desc adsp_audio26m_desc = {
+	.clks = adsp_audio26m_clks,
+	.num_clks = ARRAY_SIZE(adsp_audio26m_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_adsp_audio26m[] = {
+	{ .compatible = "mediatek,mt8188-adsp-audio26m", .data = &adsp_audio26m_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, of_match_clk_mt8188_adsp_audio26m);
+
+static struct platform_driver clk_mt8188_adsp_audio26m_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-adsp_audio26m",
+		.of_match_table = of_match_clk_mt8188_adsp_audio26m,
+	},
+};
+module_platform_driver(clk_mt8188_adsp_audio26m_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


