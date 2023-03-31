Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D04FC77B6C
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8zbZN4o504oUg4BP4fmw2CpoitA9pwTv7aOU5OaWoo=; b=xpuYh3TiEug0BZMOwm4DiOPqH7
	zOgyE01YzbdYqs7yhV8xdzaRH/2+txWYEOVeeSF+jmyB5PUFDH3UGukGc9vX6DcslLrh1u3illCuY
	jrHduLfQ8fUa50Gwa0MvxfImVvB7sVH7c8e39s5WqqIxapXnGOX8xsJE7t9QvXtOB4hkgbVjE/yMG
	rigZtS2dEew64rCxbucF1dnAvBhiV5bB+BGE5Q06B3yzlrbK+JLSdAu/cZil2rBqk1kxQkYXmTKYT
	3QnGUyzqBtPnfthm3+K2yy5YBY6TrFB4AhrsECdjLlqf5zsb7AucPlmBbqIsMySlPg/I7X78/U2J/
	+zdDCDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piE1L-007KBt-0B;
	Fri, 31 Mar 2023 12:38:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piDzg-007JAJ-0F;
	Fri, 31 Mar 2023 12:36:39 +0000
X-UUID: a83d37aecfc011ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E8zbZN4o504oUg4BP4fmw2CpoitA9pwTv7aOU5OaWoo=;
	b=AWmIqD4mLITSUO0Q6qCa4aVVkahJifuWVnrcWZY33RFowlusjFDX+NoPzZH7W3FJugSFGyfV7pdqeKBZAIFLD94nJE47BhYke+kyOO0qfL386BFA+RKrJqJPlZQ0fewwUJ9PzX4Qqn3gLmLTfFO4QVcm4Aj1MyQVvObavUEkN/c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:de80fcb9-9fba-429c-a96a-6d92bdbf3bdb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:de80fcb9-9fba-429c-a96a-6d92bdbf3bdb,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:eb9b88f7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230331203630F0NH1BZ2,BulkQuantity:2,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:43,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: a83d37aecfc011ed8687db9d93187ff1-20230331
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2128856981; Fri, 31 Mar 2023 05:36:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
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
Subject: [PATCH v8 14/19] clk: mediatek: Add MT8188 vencsys clock support
Date: Fri, 31 Mar 2023 20:36:16 +0800
Message-ID: <20230331123621.16167-15-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_053636_209171_F1FB16EE 
X-CRM114-Status: GOOD (  17.36  )
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

Add MT8188 vencsys clock controllers which provide clock gate
control for video encoder.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig           |  7 ++++
 drivers/clk/mediatek/Makefile          |  1 +
 drivers/clk/mediatek/clk-mt8188-venc.c | 54 ++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-venc.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index d39fa2b1c572..87ac1df8e901 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -734,6 +734,13 @@ config COMMON_CLK_MT8188_VDOSYS
 	help
 	  This driver supports MediaTek MT8188 vdosys0/1 (multimedia) clocks.
 
+config COMMON_CLK_MT8188_VENCSYS
+	tristate "Clock driver for MediaTek MT8188 vencsys"
+	depends on COMMON_CLK_MT8188_VPPSYS
+	default COMMON_CLK_MT8188_VPPSYS
+	help
+	  This driver supports MediaTek MT8188 vencsys clocks.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index a6b80bb0b1bf..d56be5cb0534 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -108,6 +108,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_IPESYS) += clk-mt8188-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8188_MFGCFG) += clk-mt8188-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VDECSYS) += clk-mt8188-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
+obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-venc.c b/drivers/clk/mediatek/clk-mt8188-venc.c
new file mode 100644
index 000000000000..6f6589ccd5a0
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-venc.c
@@ -0,0 +1,54 @@
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
+static const struct mtk_gate_regs venc1_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_VENC1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &venc1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate venc1_clks[] = {
+	GATE_VENC1(CLK_VENC1_LARB, "venc1_larb", "top_venc", 0),
+	GATE_VENC1(CLK_VENC1_VENC, "venc1_venc", "top_venc", 4),
+	GATE_VENC1(CLK_VENC1_JPGENC, "venc1_jpgenc", "top_venc", 8),
+	GATE_VENC1(CLK_VENC1_JPGDEC, "venc1_jpgdec", "top_venc", 12),
+	GATE_VENC1(CLK_VENC1_JPGDEC_C1, "venc1_jpgdec_c1", "top_venc", 16),
+	GATE_VENC1(CLK_VENC1_GALS, "venc1_gals", "top_venc", 28),
+	GATE_VENC1(CLK_VENC1_GALS_SRAM, "venc1_gals_sram", "top_venc", 31),
+};
+
+static const struct mtk_clk_desc venc1_desc = {
+	.clks = venc1_clks,
+	.num_clks = ARRAY_SIZE(venc1_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_venc1[] = {
+	{ .compatible = "mediatek,mt8188-vencsys", .data = &venc1_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, of_match_clk_mt8188_venc1);
+
+static struct platform_driver clk_mt8188_venc1_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-venc1",
+		.of_match_table = of_match_clk_mt8188_venc1,
+	},
+};
+
+module_platform_driver(clk_mt8188_venc1_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


