Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13303C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfjTCYptep645E9PdhlrPFGtLuj5zqNpylFDPv50Pxc=; b=aYgdFcQIYPFuwR5x+SmnS+l7ku
	aqtiYAi9qJZfAH3tdLQoT5xR7lYo+AfanhiuKSMcsCvC+3+HKYkDzq88QEr18sm8cXJ8Us8teIY4m
	+4u7WJxexcmvRlrdPsq6H1ZtXj4gsksil6i9XdBSw7IUrETkMFuUpxpAtgte6nGOXCRld/gu2cWf6
	YwxASb19HdDcWix6Tcj1JbDDxekvo0KQJKgfXHdHT4AFPmoGjxQP7a6X2i7qu3buctA5ffBzH9Fup
	HWLHVfYgekdwgmxMl/dL5mk7AkXNx0fyEMh+nKqk80tYNJ0UMehAE4SRSrW3MNi3mi65RZoCWmf7O
	3KOoOS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMo-004rtF-4G; Thu, 19 Jan 2023 12:50:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMO-004rj1-7n; Thu, 19 Jan 2023 12:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JfjTCYptep645E9PdhlrPFGtLuj5zqNpylFDPv50Pxc=; b=AAk8eEn67MPN5uJm/aUegNmzy+
	WKzomzmkN4gEchin2GJv/t2hTHr3KXyBiyGHfvQEdbNdGNnDMl30ef5o0EODJsVYUD3rfMld+sPHk
	qawqmWe+RjCi0avVvMeXV8DeOj6V4Pup9OjS//yHisPd2MawTLC2zFFR4MyjvKIBWLkCN+nnO0vZ8
	X3kxWEV7TGSzRkGMSutNddqCCmDsExKWX8jNpE6Ld9MHih+k+Xb/GhpFtK6RgJkqJ47RpF596g/lR
	d2eKhhrHw4aIVugDD3rw1vOG5DAslz5rzWxdjreXOCfDBZ8Ohly3OS+CWZuo371CwfKjruYxp3AmP
	/vIBJC+g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIULl-000IOy-0f;
	Thu, 19 Jan 2023 12:49:08 +0000
X-UUID: a4cc7fe097f711edbbe3f76fe852e059-20230119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JfjTCYptep645E9PdhlrPFGtLuj5zqNpylFDPv50Pxc=;
	b=b0G7X6Vu8ZaKfxpKBsMF+EI9j3cUmBngpa1yr2j2r65i6jFXkFTh2WoonH3+KoZwbvDxAHOU3tVPHoa+8oPfktALg3nK1Fn6cMFvlMTNfj0tK0mShF4IYIYBcNGZHlFgJM32O9EuCRT4WsuxpV4o6zfy00/MI5olxJvaLjC7BxM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:56f08db2-80f0-4ed0-9d97-08ae669013d9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:bcba1f55-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: a4cc7fe097f711edbbe3f76fe852e059-20230119
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1779476947; Thu, 19 Jan 2023 05:48:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 19 Jan 2023 20:48:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 19 Jan 2023 20:48:56 +0800
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
Subject: [PATCH v5 07/19] clk: mediatek: Add MT8188 ccusys clock support
Date: Thu, 19 Jan 2023 20:48:36 +0800
Message-ID: <20230119124848.26364-8-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_124903_674948_8B61D451 
X-CRM114-Status: GOOD (  15.90  )
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
 drivers/clk/mediatek/clk-mt8188-ccu.c | 48 +++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-ccu.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index dc247bf67e8b..dbd140b81763 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -85,7 +85,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
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
index 000000000000..b7380060f906
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-ccu.c
@@ -0,0 +1,48 @@
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
+	{ .compatible = "mediatek,mt8188-ccusys", .data = &ccu_desc},
+	{ /* sentinel */ }
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


