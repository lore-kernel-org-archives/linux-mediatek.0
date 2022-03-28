Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B6DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 13:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anw93g5bwVVCoFI8l2muY1oetmg9BiiJGtYK3fRFdrE=; b=vR4B1VGGs31a4A
	FPkA2MOH3Hn8J5cyh0IxTCItduGsUDoQYBRKsJ3Wm6wH2Jk9gRiBsQKI/edM9QAgWR3kMMlhqFLyY
	f1RLixj2Qol1IhtNN+Nxx6WtTG0xQ5i8/SovhHzntklCR/r0fryOkX04BXVTWoTLBnCEE0oDe9mXW
	TJZf0tfGcbZC63xDHmDwfipgNjLWRttXVJK80QaV6ndVDoCNRK8hLboL+8u9+a0UmW0SA7RvGM4vk
	1yDcmBbMd+39of+he/nMoB1qb48vOMC4Tcqa0YOFTZMKb8HftH5kTP+ZD0ClOwpnTtQ2ID0ekzG4t
	Q8AjRLHbIQBcYs9iMxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYp4f-008dh0-9y; Mon, 28 Mar 2022 13:06:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYp46-008dUA-SB; Mon, 28 Mar 2022 13:05:49 +0000
X-UUID: be60cb1cb04643ddae70799d46d4ca62-20220328
X-UUID: be60cb1cb04643ddae70799d46d4ca62-20220328
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 348171073; Mon, 28 Mar 2022 06:05:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 06:05:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 28 Mar 2022 21:05:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 28 Mar 2022 21:05:35 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v4 02/15] clk: mediatek: Add MT8186 mcusys clock support
Date: Mon, 28 Mar 2022 21:05:08 +0800
Message-ID: <20220328130521.24385-3-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220328130521.24385-1-chun-jie.chen@mediatek.com>
References: <20220328130521.24385-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_060546_968401_9AF60EFC 
X-CRM114-Status: GOOD (  20.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8186 mcusys clock controller which provides muxes
to select the clock source of APMCU.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |   8 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8186-mcu.c | 108 ++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mcu.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 01ef02c54725..d5936cfb3bee 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -512,6 +512,14 @@ config COMMON_CLK_MT8183_VENCSYS
 	help
 	  This driver supports MediaTek MT8183 vencsys clocks.
 
+config COMMON_CLK_MT8186
+	bool "Clock driver for MediaTek MT8186"
+	depends on ARM64 || COMPILE_TEST
+	select COMMON_CLK_MEDIATEK
+	default ARCH_MEDIATEK
+	help
+	  This driver supports MediaTek MT8186 clocks.
+
 config COMMON_CLK_MT8192
 	bool "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 7b0c2646ce4a..677fa4f0eea2 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MFGCFG) += clk-mt8183-mfgcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
+obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-mcu.c b/drivers/clk/mediatek/clk-mt8186-mcu.c
new file mode 100644
index 000000000000..80835960f528
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-mcu.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mt8186-clk.h>
+
+#include "clk-mtk.h"
+
+static const char * const mcu_armpll_ll_parents[] = {
+	"clk26m",
+	"armpll_ll",
+	"mainpll",
+	"univpll_d2"
+};
+
+static const char * const mcu_armpll_bl_parents[] = {
+	"clk26m",
+	"armpll_bl",
+	"mainpll",
+	"univpll_d2"
+};
+
+static const char * const mcu_armpll_bus_parents[] = {
+	"clk26m",
+	"ccipll",
+	"mainpll",
+	"univpll_d2"
+};
+
+/*
+ * We only configure the CPU muxes when adjust CPU frequency in MediaTek CPUFreq Driver.
+ * Other fields like divider always keep the same value. (set once in bootloader)
+ */
+static struct mtk_composite mcu_muxes[] = {
+	/* CPU_PLLDIV_CFG0 */
+	MUX(CLK_MCU_ARMPLL_LL_SEL, "mcu_armpll_ll_sel", mcu_armpll_ll_parents, 0x2A0, 9, 2),
+	/* CPU_PLLDIV_CFG1 */
+	MUX(CLK_MCU_ARMPLL_BL_SEL, "mcu_armpll_bl_sel", mcu_armpll_bl_parents, 0x2A4, 9, 2),
+	/* BUS_PLLDIV_CFG */
+	MUX(CLK_MCU_ARMPLL_BUS_SEL, "mcu_armpll_bus_sel", mcu_armpll_bus_parents, 0x2E0, 9, 2),
+};
+
+static const struct of_device_id of_match_clk_mt8186_mcu[] = {
+	{ .compatible = "mediatek,mt8186-mcusys", },
+	{}
+};
+
+static int clk_mt8186_mcu_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+	void __iomem *base;
+
+	clk_data = mtk_alloc_clk_data(CLK_MCU_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		r = PTR_ERR(base);
+		goto free_mcu_data;
+	}
+
+	r = mtk_clk_register_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), base,
+					NULL, clk_data);
+	if (r)
+		goto free_mcu_data;
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto unregister_composite_muxes;
+
+	platform_set_drvdata(pdev, clk_data);
+
+	return r;
+
+unregister_composite_muxes:
+	mtk_clk_unregister_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), clk_data);
+free_mcu_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static int clk_mt8186_mcu_remove(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
+static struct platform_driver clk_mt8186_mcu_drv = {
+	.probe = clk_mt8186_mcu_probe,
+	.remove = clk_mt8186_mcu_remove,
+	.driver = {
+		.name = "clk-mt8186-mcu",
+		.of_match_table = of_match_clk_mt8186_mcu,
+	},
+};
+builtin_platform_driver(clk_mt8186_mcu_drv);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
