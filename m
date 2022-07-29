Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9670C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7If3YVDnqckWRjRjQ5EpKxMIbNkUPQb+jzxUK5QN78=; b=aKmr1yUgptgxZJmvnbzPnO0f+x
	34sLLKo5Db6XE6b1FjiOisypNFqOIzGrWHiU00g3H8MEHCLMFoMgmGNiGxnptJuVHGwu/j67cVZ3W
	/q4jh83zxAUvkws/4aY3H1sStG7kSvdLJ6nN2DCHf/BD9uC4kqCsLjheSraS4SOLhugzaqEsstIfV
	3uBevSTk54MZhI8TJGJuHVw1aR7mW1W+4zbxSdFjoSCvPdFFMoa+kXMlnpfMvs00xyINZGH/scfW2
	ypcNNmSC+VTc9spweddFrBs5pfxFQxdMksHiWsvmccVBMtq8z5Dg9WhoOOwbPNpAI6EW0koM68mzh
	A09R6qNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLXl-003Nvs-DJ; Fri, 29 Jul 2022 08:40:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLKu-003EIr-EN; Fri, 29 Jul 2022 08:27:11 +0000
X-UUID: e0c27ac986314a4090d32361545e3bf3-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f967c53d-76cf-4166-bbda-4860440b1d5d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:fcebadd0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e0c27ac986314a4090d32361545e3bf3-20220729
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1802558319; Fri, 29 Jul 2022 01:26:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 16:25:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 16:25:17 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Garmin Chang <garmin.chang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH 10/18] clk: mediatek: Add MT8188 mfgcfg clock support
Date: Fri, 29 Jul 2022 16:24:49 +0800
Message-ID: <20220729082457.22253-11-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
References: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_012708_527262_9EBEF52F 
X-CRM114-Status: GOOD (  15.21  )
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
 drivers/clk/mediatek/clk-mt8188-mfg.c | 50 +++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-mfg.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 7e902efda3df..0a72401adc5f 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -79,7 +79,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
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
index 000000000000..5dd9c3b0b86d
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-mfg.c
@@ -0,0 +1,50 @@
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
+static const struct mtk_gate_regs mfgcfg_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_MFGCFG(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &mfgcfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate mfgcfg_clks[] = {
+	GATE_MFGCFG(CLK_MFGCFG_BG3D, "mfgcfg_bg3d", "top_mfg_core_tmp", 0),
+};
+
+static const struct mtk_clk_desc mfgcfg_desc = {
+	.clks = mfgcfg_clks,
+	.num_clks = ARRAY_SIZE(mfgcfg_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_mfgcfg[] = {
+	{
+		.compatible = "mediatek,mt8188-mfgcfg",
+		.data = &mfgcfg_desc,
+	}, {
+		/* sentinel */
+	}
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


