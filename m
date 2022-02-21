Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD4DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 02:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usYTUtbGg29WiWiuWCi74Mq+mXCKRtWWHvXdKvKLqnQ=; b=cLR4pqVX7+XU1g
	JrLdE8C0HTnbdlK8juZ1lXQM7FqgWKKRYSDcOxkRa8TBquiIW4aMjTgjC4W1Pz3C/SahTuvdnxnDw
	muKoQFzPIJKnQSWxLeQM67zFeTYpXzyyK2hb9NcEZIZAtnUZAWmPVgVpOhr9pjzvLbT2MhbuEn0cG
	m4p5rIkZ8qlq67CUX96zf55pLOZuyyDlDGgwu6WhIZZtZAHNXBt1n3ZFLIWeaaUIKOw4HvUMBm0fH
	tYNMfl0naXzIw/AqMPY0nTapwfiUXk5+OCsqBuNXeUNOEi0Vd8Tulh66x4lwB4oLHHt/zCU4twCSd
	6WzSDmw7DnaP1tx9kjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLy7U-002wJc-5q; Mon, 21 Feb 2022 02:08:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLy11-002sz0-Vp; Mon, 21 Feb 2022 02:01:30 +0000
X-UUID: fc127fd5eb974ff1bba9ac32b48d4648-20220220
X-UUID: fc127fd5eb974ff1bba9ac32b48d4648-20220220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 140428054; Sun, 20 Feb 2022 19:01:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 17:59:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 21 Feb 2022 09:59:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Feb 2022 09:59:06 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v2 05/15] clk: mediatek: Add MT8186 apmixedsys clock support
Date: Mon, 21 Feb 2022 09:52:48 +0800
Message-ID: <20220221015258.913-6-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220221015258.913-1-chun-jie.chen@mediatek.com>
References: <20220221015258.913-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_180128_058747_A6284126 
X-CRM114-Status: GOOD (  18.88  )
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

Add MT8186 apmixedsys clock controller which provides Plls
generated from SoC.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Makefile                |   3 +-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c | 133 +++++++++++++++++++
 2 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-apmixedsys.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 657d43e33d3c..54ef957389ef 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -71,7 +71,8 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MFGCFG) += clk-mt8183-mfgcfg.o
 obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
-obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o \
+				   clk-mt8186-apmixedsys.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
new file mode 100644
index 000000000000..f07d464f908b
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include "clk-mtk.h"
+#include "clk-pll.h"
+
+#include <dt-bindings/clock/mt8186-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#define MT8186_PLL_FMAX		(3800UL * MHZ)
+#define MT8186_PLL_FMIN		(1500UL * MHZ)
+#define MT8186_INTEGER_BITS	(8)
+
+#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,		\
+	    _rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,		\
+	    _tuner_reg, _tuner_en_reg, _tuner_en_bit,			\
+	    _pcw_reg) {							\
+		.id = _id,						\
+		.name = _name,						\
+		.reg = _reg,						\
+		.pwr_reg = _pwr_reg,					\
+		.en_mask = _en_mask,					\
+		.flags = _flags,					\
+		.rst_bar_mask = _rst_bar_mask,				\
+		.fmax = MT8186_PLL_FMAX,				\
+		.fmin = MT8186_PLL_FMIN,				\
+		.pcwbits = _pcwbits,					\
+		.pcwibits = MT8186_INTEGER_BITS,			\
+		.pd_reg = _pd_reg,					\
+		.pd_shift = _pd_shift,					\
+		.tuner_reg = _tuner_reg,				\
+		.tuner_en_reg = _tuner_en_reg,				\
+		.tuner_en_bit = _tuner_en_bit,				\
+		.pcw_reg = _pcw_reg,					\
+		.pcw_shift = 0,						\
+		.pcw_chg_reg = 0,					\
+		.en_reg = 0,						\
+		.pll_en_bit = 0,					\
+	}
+
+static const struct mtk_pll_data plls[] = {
+	/*
+	 * armpll_ll/armpll_bl/ccipll are main clock source of AP MCU,
+	 * should not be closed in Linux world.
+	 */
+	PLL(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x0204, 0x0210, 0,
+	    PLL_AO, 0, 22, 0x0208, 24, 0, 0, 0, 0x0208),
+	PLL(CLK_APMIXED_ARMPLL_BL, "armpll_bl", 0x0214, 0x0220, 0,
+	    PLL_AO, 0, 22, 0x0218, 24, 0, 0, 0, 0x0218),
+	PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x0224, 0x0230, 0,
+	    PLL_AO, 0, 22, 0x0228, 24, 0, 0, 0, 0x0228),
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0244, 0x0250, 0xff000000,
+	    HAVE_RST_BAR, BIT(23), 22, 0x0248, 24, 0, 0, 0, 0x0248),
+	PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0324, 0x0330, 0xff000000,
+	    HAVE_RST_BAR, BIT(23), 22, 0x0328, 24, 0, 0, 0, 0x0328),
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x038C, 0x0398, 0,
+	    0, 0, 22, 0x0390, 24, 0, 0, 0, 0x0390),
+	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0254, 0x0260, 0,
+	    0, 0, 22, 0x0258, 24, 0, 0, 0, 0x0258),
+	PLL(CLK_APMIXED_NNAPLL, "nnapll", 0x035C, 0x0368, 0,
+	    0, 0, 22, 0x0360, 24, 0, 0, 0, 0x0360),
+	PLL(CLK_APMIXED_NNA2PLL, "nna2pll", 0x036C, 0x0378, 0,
+	    0, 0, 22, 0x0370, 24, 0, 0, 0, 0x0370),
+	PLL(CLK_APMIXED_ADSPPLL, "adsppll", 0x0304, 0x0310, 0,
+	    0, 0, 22, 0x0308, 24, 0, 0, 0, 0x0308),
+	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x0314, 0x0320, 0,
+	    0, 0, 22, 0x0318, 24, 0, 0, 0, 0x0318),
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0264, 0x0270, 0,
+	    0, 0, 22, 0x0268, 24, 0, 0, 0, 0x0268),
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x0334, 0x0344, 0,
+	    0, 0, 32, 0x0338, 24, 0x0040, 0x000C, 0, 0x033C),
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x0348, 0x0358, 0,
+	    0, 0, 32, 0x034C, 24, 0x0044, 0x000C, 5, 0x0350),
+};
+
+static const struct of_device_id of_match_clk_mt8186_apmixed[] = {
+	{ .compatible = "mediatek,mt8186-apmixedsys", },
+	{}
+};
+
+static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	if (r)
+		goto free_apmixed_data;
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto unregister_plls;
+
+	platform_set_drvdata(pdev, clk_data);
+
+	return r;
+
+unregister_plls:
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+free_apmixed_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static int clk_mt8186_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
+static struct platform_driver clk_mt8186_apmixed_drv = {
+	.probe = clk_mt8186_apmixed_probe,
+	.remove = clk_mt8186_apmixed_remove,
+	.driver = {
+		.name = "clk-mt8186-apmixed",
+		.of_match_table = of_match_clk_mt8186_apmixed,
+	},
+};
+builtin_platform_driver(clk_mt8186_apmixed_drv);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
