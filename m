Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5698C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=577Z68yzcRDtcdajSv8/87uadmJ+S5I2PHdVMM9kHLc=; b=DmJZG9HiA9eixhE8qS0HMtGVKs
	SfsYtb4wzwhJmCohfLtm9vCSJYfiCjIydJQs7l4JGytBjMk2We+fuU3Dc/1Ha5lWXXcBmyAHaKJIj
	G2MPNWgRbG/tF6fJVjupRol/jO2mFIkd5fdh4PSUsvFOKReomiH7KmAxS3kBf0V68kH7FvpnqbF7s
	0N25NlYhhsYhVMB3zcxqktozrKkHNRTq/bxVY6yjsOha8S81vp13xZRxp6rLA8+CdRbDcwFFdbzXH
	0tjq3sxuVPDzGRg78SUIVvYGpu2OAMXIvSXyii4n7k2F7wSFfcYF3DPNqncQ1vrDS3RImkJkRQSh3
	vrWzhOHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLfw-003T6k-3C; Fri, 29 Jul 2022 08:48:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLL3-003ERZ-JF; Fri, 29 Jul 2022 08:27:21 +0000
X-UUID: ea72d73069d149bab9b558cd9400e0fd-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a1446827-a66d-44c1-a665-ad574b60496b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:72edadd0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ea72d73069d149bab9b558cd9400e0fd-20220729
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1980265365; Fri, 29 Jul 2022 01:27:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 16:25:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 16:25:13 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Garmin Chang <garmin.chang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH 07/18] clk: mediatek: Add MT8188 ccusys clock support
Date: Fri, 29 Jul 2022 16:24:46 +0800
Message-ID: <20220729082457.22253-8-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
References: <20220729082457.22253-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_012717_738878_2C0A58F4 
X-CRM114-Status: GOOD (  15.68  )
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

Add MT8188 ccusys clock controller which provides clock gate
control in Camera Computing Unit.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile         |  2 +-
 drivers/clk/mediatek/clk-mt8188-ccu.c | 52 +++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-ccu.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index df80e19bac0c..c28c801284a1 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 				   clk-mt8186-cam.o clk-mt8186-mdp.o clk-mt8186-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
-				   clk-mt8188-cam.o
+				   clk-mt8188-cam.o clk-mt8188-ccu.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-ccu.c b/drivers/clk/mediatek/clk-mt8188-ccu.c
new file mode 100644
index 000000000000..167efd973195
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-ccu.c
@@ -0,0 +1,52 @@
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
+static const struct mtk_gate_regs ccu_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CCU(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &ccu_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate ccu_clks[] = {
+	GATE_CCU(CLK_CCU_LARB27, "ccu_larb27", "top_ccu", 0),
+	GATE_CCU(CLK_CCU_AHB, "ccu_ahb", "top_ccu", 1),
+	GATE_CCU(CLK_CCU_CCU0, "ccu_ccu0", "top_ccu", 2),
+};
+
+static const struct mtk_clk_desc ccu_desc = {
+	.clks = ccu_clks,
+	.num_clks = ARRAY_SIZE(ccu_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_ccu[] = {
+	{
+		.compatible = "mediatek,mt8188-ccusys",
+		.data = &ccu_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8188_ccu_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-ccu",
+		.of_match_table = of_match_clk_mt8188_ccu,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_ccu_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


