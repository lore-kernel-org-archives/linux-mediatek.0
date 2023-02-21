Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043CEC6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 12:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bk95CJF0m6OcWNfX/qPHBHZcbzcXowTBKXplHjKkPHo=; b=QlWGP6RW5I+Mw6H0gVkVxn9D7w
	GPFM1eELvLaTZemIVaRVUy4aOYswo28VbuSeEGyMaRJlOLjGys69bTLAnBV9NVL89o0ROdMaJ9GwB
	echhETC0RQVJHiefTlKBX3XHjNYF0j6J+TA4hLozc3DbEh/1YOLHAcx4erddBpZjavlgno/978Nvy
	mrHAnMrThAJm6iSpzqi0/Tn076z32C5hbAKTFfCtAZqvJ7D1Picds5MPgIezkngHE2f3F86DMaU18
	iyZdw6CCCiwXk+n+QF355JoYnVbr/AeRhuZ42Xew7UtGp2qmWcWjYtHkDSE2HOBE64FGlTzPgIu/o
	uS7+7dYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURtB-0084Ho-Qg; Tue, 21 Feb 2023 12:36:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURGY-007kAg-Fi; Tue, 21 Feb 2023 11:57:04 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E89A366021EA;
	Tue, 21 Feb 2023 11:56:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676980621;
	bh=t0BhqFhgFrOhfZhgO4PCkH5Vfx6Hcb7s3uSV/Xzx0PA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uq1D8AjF0R92Lpg2+1h0QjoRN2yER3k0vjfMyghk5+lcZVRKlmTd6XNNiLwc3Ehir
	 9mz3k/mkFEptoCTnk/Y1tFDG5RlBiepg8V7ImXwTqwFGn0vt+wAhKkTXGPAW8Aj0q/
	 IlA4MCLMnPkZ5m2igRV+a711m9TdbUlTVhamsAtHap1kdxjVox42n3O6kel5+733t8
	 uuF7YGzoGIHzgpKdDQvMl4ZXyhaEiAB4Z8LKpC+5STYPz6dQywiT7Lq3vVpOQZLc5u
	 bKpeyRF+Qo/QpRTRVQKAJiD1d6/QTVnhipedzuiSnX12l9Z2+YziQJpsifC+XFShpd
	 Fmz6V/Ysyewag==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 50/54] clk: mediatek: mt8135: Move apmixedsys to its own file
Date: Tue, 21 Feb 2023 12:55:45 +0100
Message-Id: <20230221115549.360132-51-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
References: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_035702_832516_D9DF9BD1 
X-CRM114-Status: GOOD (  15.18  )
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

In preparation for migrating mt8135 clocks to the common simple
probe mechanism, move the apmixedsys clocks to a different file.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Makefile                |  2 +-
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 62 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mt8135.c            | 46 ---------------
 3 files changed, 63 insertions(+), 47 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8135-apmixedsys.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 5facbe93141e..228cb3e3a4c4 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -62,7 +62,7 @@ obj-$(CONFIG_COMMON_CLK_MT7986) += clk-mt7986-apmixed.o
 obj-$(CONFIG_COMMON_CLK_MT7986) += clk-mt7986-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT7986) += clk-mt7986-infracfg.o
 obj-$(CONFIG_COMMON_CLK_MT7986_ETHSYS) += clk-mt7986-eth.o
-obj-$(CONFIG_COMMON_CLK_MT8135) += clk-mt8135.o
+obj-$(CONFIG_COMMON_CLK_MT8135) += clk-mt8135-apmixedsys.o clk-mt8135.o
 obj-$(CONFIG_COMMON_CLK_MT8167) += clk-mt8167.o clk-mt8167-apmixedsys.o
 obj-$(CONFIG_COMMON_CLK_MT8167_AUDSYS) += clk-mt8167-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8167_IMGSYS) += clk-mt8167-img.o
diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
new file mode 100644
index 000000000000..2b4d379300fc
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ *               James Liao <jamesjj.liao@mediatek.com>
+ * Copyright (c) 2023 Collabora, Ltd.
+ *               AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <dt-bindings/clock/mt8135-clk.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-pll.h"
+
+#define MT8135_PLL_FMAX		(2000 * MHZ)
+#define CON0_MT8135_RST_BAR	BIT(27)
+
+#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits, _pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift) { \
+		.id = _id,						\
+		.name = _name,						\
+		.reg = _reg,						\
+		.pwr_reg = _pwr_reg,					\
+		.en_mask = _en_mask,					\
+		.flags = _flags,					\
+		.rst_bar_mask = CON0_MT8135_RST_BAR,			\
+		.fmax = MT8135_PLL_FMAX,				\
+		.pcwbits = _pcwbits,					\
+		.pd_reg = _pd_reg,					\
+		.pd_shift = _pd_shift,					\
+		.tuner_reg = _tuner_reg,				\
+		.pcw_reg = _pcw_reg,					\
+		.pcw_shift = _pcw_shift,				\
+	}
+
+static const struct mtk_pll_data plls[] = {
+	PLL(CLK_APMIXED_ARMPLL1, "armpll1", 0x200, 0x218, 0x80000000, 0, 21, 0x204, 24, 0x0, 0x204, 0),
+	PLL(CLK_APMIXED_ARMPLL2, "armpll2", 0x2cc, 0x2e4, 0x80000000, 0, 21, 0x2d0, 24, 0x0, 0x2d0, 0),
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x21c, 0x234, 0xf0000000, HAVE_RST_BAR, 21, 0x21c, 6, 0x0, 0x220, 0),
+	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x238, 0x250, 0xf3000000, HAVE_RST_BAR, 7, 0x238, 6, 0x0, 0x238, 9),
+	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x254, 0x26c, 0xf0000000, HAVE_RST_BAR, 21, 0x254, 6, 0x0, 0x258, 0),
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x278, 0x290, 0x80000000, 0, 21, 0x278, 6, 0x0, 0x27c, 0),
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x294, 0x2ac, 0x80000000, 0, 31, 0x294, 6, 0x0, 0x298, 0),
+	PLL(CLK_APMIXED_LVDSPLL, "lvdspll", 0x2b0, 0x2c8, 0x80000000, 0, 21, 0x2b0, 6, 0x0, 0x2b4, 0),
+	PLL(CLK_APMIXED_AUDPLL, "audpll", 0x2e8, 0x300, 0x80000000, 0, 31, 0x2e8, 6, 0x2f8, 0x2ec, 0),
+	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x304, 0x31c, 0x80000000, 0, 21, 0x2b0, 6, 0x0, 0x308, 0),
+};
+
+static void __init mtk_apmixedsys_init(struct device_node *node)
+{
+	struct clk_hw_onecell_data *clk_data;
+
+	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return;
+
+	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+}
+CLK_OF_DECLARE(mtk_apmixedsys, "mediatek,mt8135-apmixedsys",
+		mtk_apmixedsys_init);
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 98165b1f7c97..2a9405b552c6 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -592,50 +592,4 @@ static void __init mtk_pericfg_init(struct device_node *node)
 	mtk_register_reset_controller(node, &clk_rst_desc[1]);
 }
 CLK_OF_DECLARE(mtk_pericfg, "mediatek,mt8135-pericfg", mtk_pericfg_init);
-
-#define MT8135_PLL_FMAX		(2000 * MHZ)
-#define CON0_MT8135_RST_BAR	BIT(27)
-
-#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits, _pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift) { \
-		.id = _id,						\
-		.name = _name,						\
-		.reg = _reg,						\
-		.pwr_reg = _pwr_reg,					\
-		.en_mask = _en_mask,					\
-		.flags = _flags,					\
-		.rst_bar_mask = CON0_MT8135_RST_BAR,			\
-		.fmax = MT8135_PLL_FMAX,				\
-		.pcwbits = _pcwbits,					\
-		.pd_reg = _pd_reg,					\
-		.pd_shift = _pd_shift,					\
-		.tuner_reg = _tuner_reg,				\
-		.pcw_reg = _pcw_reg,					\
-		.pcw_shift = _pcw_shift,				\
-	}
-
-static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_ARMPLL1, "armpll1", 0x200, 0x218, 0x80000000, 0, 21, 0x204, 24, 0x0, 0x204, 0),
-	PLL(CLK_APMIXED_ARMPLL2, "armpll2", 0x2cc, 0x2e4, 0x80000000, 0, 21, 0x2d0, 24, 0x0, 0x2d0, 0),
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x21c, 0x234, 0xf0000000, HAVE_RST_BAR, 21, 0x21c, 6, 0x0, 0x220, 0),
-	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x238, 0x250, 0xf3000000, HAVE_RST_BAR, 7, 0x238, 6, 0x0, 0x238, 9),
-	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x254, 0x26c, 0xf0000000, HAVE_RST_BAR, 21, 0x254, 6, 0x0, 0x258, 0),
-	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x278, 0x290, 0x80000000, 0, 21, 0x278, 6, 0x0, 0x27c, 0),
-	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x294, 0x2ac, 0x80000000, 0, 31, 0x294, 6, 0x0, 0x298, 0),
-	PLL(CLK_APMIXED_LVDSPLL, "lvdspll", 0x2b0, 0x2c8, 0x80000000, 0, 21, 0x2b0, 6, 0x0, 0x2b4, 0),
-	PLL(CLK_APMIXED_AUDPLL, "audpll", 0x2e8, 0x300, 0x80000000, 0, 31, 0x2e8, 6, 0x2f8, 0x2ec, 0),
-	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x304, 0x31c, 0x80000000, 0, 21, 0x2b0, 6, 0x0, 0x308, 0),
-};
-
-static void __init mtk_apmixedsys_init(struct device_node *node)
-{
-	struct clk_hw_onecell_data *clk_data;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return;
-
-	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
-}
-CLK_OF_DECLARE(mtk_apmixedsys, "mediatek,mt8135-apmixedsys",
-		mtk_apmixedsys_init);
 MODULE_LICENSE("GPL");
-- 
2.39.1


