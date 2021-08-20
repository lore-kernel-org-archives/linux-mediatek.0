Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8111DC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:37:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D0E361037
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D0E361037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/F0xIuSSx9x81glcbn0ZKAR0poj5JPTUa3N0uSKNzH4=; b=Uos/GIVb2MrNPg
	quYdDOnoOeS8Axj8I4q7R/gTJrajwDqgwaLiBLIhIq5NrlWkXkcDidETo5sTt+XKjBCZ5y9f/Wfj9
	XYIwxggb00JqCSED5IWVz1bug6TYURiUgBpPeOuV8HaJtmhcMQhkekAbdcZ1bRpQj4u3uBPebvtx5
	U5n0kJHyRLW0JPGRSUC/0tu6INhCqzR0QHjMfFq4M62YQIkGdKcKEEJYlioMgxhu933g2ak/quq3+
	bZKxD4mZUXned0FpFcHQH58RIfcWUwTOGvLjEGXIfATIVmBslx1Z0JkvXnH+n8y6HrQEIYu6o5GKP
	t3L7YMsZJkCbw20Cq9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2pc-00AuSP-JD; Fri, 20 Aug 2021 11:37:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2XG-00AmSx-0v; Fri, 20 Aug 2021 11:18:09 +0000
X-UUID: 42cc415d11cd40fd96453a5865718695-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VZPLl5pijE8gQohFsPtne8Ch5Ykj5Exp1nC1H2fEnSY=; 
 b=sshUalXfU/ey4hX+Y7XwyY2Jw+YrfxrcNnPs2se8DbnMqh3mwOd72Al0uWsmtgdLqBS4izGZpVJlTUVeV+bh+VkZZn6qhnVGnOVglEqxhVGDJBkReJNPwpBu0Zw475xdSRgi+Z41+ivtv6LKfwBhyI86JFAjRMpJ190aLeTIkZk=;
X-UUID: 42cc415d11cd40fd96453a5865718695-20210820
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 525629596; Fri, 20 Aug 2021 04:18:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 04:18:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 19:17:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Aug 2021 19:17:58 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v2 24/24] clk: mediatek: Add MT8195 apusys clock support
Date: Fri, 20 Aug 2021 19:15:04 +0800
Message-ID: <20210820111504.350-25-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210820111504.350-1-chun-jie.chen@mediatek.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_041806_181312_3B3BF8B9 
X-CRM114-Status: GOOD (  17.49  )
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

Add MT8195 apusys clock controller which provides PLLs
in AI processor Unit.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Makefile                |  2 +-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 92 ++++++++++++++++++++
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-apusys_pll.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 4288ad39ba41..e10b1d6b0cf4 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -83,6 +83,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
 					clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
 					clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o clk-mt8195-venc.o clk-mt8195-vpp0.o \
-					clk-mt8195-vpp1.o clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o
+					clk-mt8195-vpp1.o clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o clk-mt8195-apusys_pll.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
new file mode 100644
index 000000000000..6868c9ff3e18
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mt8195-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#define MT8195_PLL_FMAX		(3800UL * MHZ)
+#define MT8195_PLL_FMIN		(1500UL * MHZ)
+#define MT8195_INTEGER_BITS	(8)
+#define MT8195_PCW_BITS		(22)
+#define MT8195_POSDIV_SHIFT	(24)
+#define MT8195_PLL_EN_BIT	(0)
+#define MT8195_PCW_SHIFT	(0)
+
+/*
+ * The "en_reg" and "pcw_chg_reg" fields are standard offset register compared
+ * with "reg" field, so set zero to imply it.
+ * No tuner control in apu pll, so set "tuner_XXX" as zero to imply it.
+ * No rst or post divider enable in apu pll, so set "rst_bar_mask" and "en_mask"
+ * as zero to imply it.
+ */
+#define PLL(_id, _name, _reg, _pwr_reg, _pd_reg, _pcw_reg) {		\
+		.id = _id,						\
+		.name = _name,						\
+		.reg = _reg,						\
+		.pwr_reg = _pwr_reg,					\
+		.en_mask = 0,						\
+		.flags = 0,						\
+		.rst_bar_mask = 0,					\
+		.fmax = MT8195_PLL_FMAX,				\
+		.fmin = MT8195_PLL_FMIN,				\
+		.pcwbits = MT8195_PCW_BITS,				\
+		.pcwibits = MT8195_INTEGER_BITS,			\
+		.pd_reg = _pd_reg,					\
+		.pd_shift = MT8195_POSDIV_SHIFT,			\
+		.tuner_reg = 0,						\
+		.tuner_en_reg = 0,					\
+		.tuner_en_bit = 0,					\
+		.pcw_reg = _pcw_reg,					\
+		.pcw_shift = MT8195_PCW_SHIFT,				\
+		.pcw_chg_reg = 0,					\
+		.en_reg = 0,						\
+		.pll_en_bit = MT8195_PLL_EN_BIT,			\
+	}
+
+static const struct mtk_pll_data apusys_plls[] = {
+	PLL(CLK_APUSYS_PLL_APUPLL, "apusys_pll_apupll", 0x008, 0x014, 0x00c, 0x00c),
+	PLL(CLK_APUSYS_PLL_NPUPLL, "apusys_pll_npupll", 0x018, 0x024, 0x01c, 0x01c),
+	PLL(CLK_APUSYS_PLL_APUPLL1, "apusys_pll_apupll1", 0x028, 0x034, 0x02c, 0x02c),
+	PLL(CLK_APUSYS_PLL_APUPLL2, "apusys_pll_apupll2", 0x038, 0x044, 0x03c, 0x03c),
+};
+
+static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_APUSYS_PLL_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto free_apusys_pll_data;
+
+	return r;
+
+free_apusys_pll_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
+	{ .compatible = "mediatek,mt8195-apusys_pll", },
+	{}
+};
+
+static struct platform_driver clk_mt8195_apusys_pll_drv = {
+	.probe = clk_mt8195_apusys_pll_probe,
+	.driver = {
+		.name = "clk-mt8195-apusys_pll",
+		.of_match_table = of_match_clk_mt8195_apusys_pll,
+	},
+};
+builtin_platform_driver(clk_mt8195_apusys_pll_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
