Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CED5C43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 11:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYMF4+gkKQQ7QnoFCbXLM8eRLV9DzD/iNw3FcFLcbl8=; b=pOWnc1lRpGj0y0
	8VNy6RO+fAvpM6ZFldeinOoKuN3UPEBfPcI4eoe0SEWZtWY6Y8HKKdDG0UsuEJnI/mK3R2Jfy2Hu2
	U7L80o7YMG0kT7Bt8sA0o8jUovF4W1miD8ahaECDbC9C2QNswWehXRitMcwdS767RFSHfO1BJazoA
	uw5WnDRULjb5nOfJFWX6nfvF3LP6b8k9hUmH5kyHEG9NffDtD0bbQq893k/KCTGXobDmMhEgCArL3
	rQeX7ZuolKfo62DIlo1tQieTvIoZO63P6T10WRfw42u9rQOoNxSg/XsXccUUWTs+mgn2MNZAUX1u7
	qrPE2eTBsADSsakwn+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSdgC-00GCvb-Tr; Fri, 11 Mar 2022 11:43:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSdfz-00GCrK-N9; Fri, 11 Mar 2022 11:43:21 +0000
X-UUID: 1e169c120b72491ca87975c36541579c-20220311
X-UUID: 1e169c120b72491ca87975c36541579c-20220311
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 243585244; Fri, 11 Mar 2022 04:43:14 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Mar 2022 03:43:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 11 Mar 2022 19:43:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Mar 2022 19:43:01 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v3 02/15] clk: mediatek: Add MT8186 mcusys clock support
Date: Fri, 11 Mar 2022 19:42:16 +0800
Message-ID: <20220311114229.32504-3-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220311114229.32504-1-chun-jie.chen@mediatek.com>
References: <20220311114229.32504-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_034319_774439_0E9C1FCD 
X-CRM114-Status: GOOD (  19.71  )
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
---
 drivers/clk/mediatek/Kconfig          |   8 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8186-mcu.c | 106 ++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)
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
index 000000000000..6d82c5de16c1
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-mcu.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mt8186-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+static DEFINE_SPINLOCK(mt8186_clk_lock);
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
+					&mt8186_clk_lock, clk_data);
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
