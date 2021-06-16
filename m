Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB782C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:00:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE838613CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE838613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzP438D+C7xzubFY8WlaNptLmhI08kJcd100lKaS6ZE=; b=2tsb39WM89snXE
	6IGqJCd5qgHRtoIAzvW9AyBrR+mHhsvIpgqJhW1qCTL2I+cLntprqT0cS/uZm2JUf6yWy9oT2IOOa
	6A7WpUkfKlkYeVp9I5hm0wEzqbRteGJtFQu/6FrN9oDXrXqZc/Ge9Q8C45eISIbXbYS4JgtkUzaRH
	ahgBH5QkYK7Rwmfx34Wi4o/i8sCKLNs63Cm9x6WR6IuRbNOwf1fbMTJlXjCgIfEJGvjBNdIMpSGL1
	x7A0FwttUXqRbO1ekyZ4zos5CJS7HxD9rzfi2hMGa1voIdgSuv+jGMQXj7+dAETvGkSDbqL/86Del
	ho+jBjgwyVzlNIhAmiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteWE-007xgA-Ao; Wed, 16 Jun 2021 23:00:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteVI-007xHE-NV; Wed, 16 Jun 2021 22:59:26 +0000
X-UUID: 39e7ce46b1d9489c9e18e5b92e2a31c7-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XxUr1L5qU8zQ044QCovTLpCVbX8rnYswlAj8PJ00vd4=; 
 b=Nh5nTPsJvMz4kQ+oS28Bdar0C3v3rQmQIpD5QjIa3febwdN3VSDI7w6ng5nEf1uY3c1z++aodVCX+/2KWCZDxJmNHJN6fy5rF80zq+Ur9iBgFPNseClAkbPJfkioniEfWQhv/EuI9uFZHztWQ5L7SeyIdnQP4t3ZdlaAoNfLw7s=;
X-UUID: 39e7ce46b1d9489c9e18e5b92e2a31c7-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 486449426; Wed, 16 Jun 2021 15:59:19 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:50:57 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:50:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 06:50:55 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH 22/22] clk: mediatek: Add MT8195 apusys clock support
Date: Thu, 17 Jun 2021 06:47:43 +0800
Message-ID: <20210616224743.5109-23-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_155924_796297_44A6332B 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8195 apusys clock provider

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig                 |  6 ++
 drivers/clk/mediatek/Makefile                |  1 +
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 84 ++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-apusys_pll.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index ade85a52b7ed..9bd1ebff61f2 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -690,6 +690,12 @@ config COMMON_CLK_MT8195_IMP_IIC_WRAP
 	help
 	  This driver supports MediaTek MT8195 imp_iic_wrap clocks.
 
+config COMMON_CLK_MT8195_APUSYS_PLL
+	bool "Clock driver for MediaTek MT8195 apusys_pll"
+	depends on COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 apusys_pll clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index b10c6267ba98..676ed7d665b7 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -98,5 +98,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS0) += clk-mt8195-vpp0.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS1) += clk-mt8195-vpp1.o
 obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8195_IMP_IIC_WRAP) += clk-mt8195-imp_iic_wrap.o
+obj-$(CONFIG_COMMON_CLK_MT8195_APUSYS_PLL) += clk-mt8195-apusys_pll.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
new file mode 100644
index 000000000000..d9b49cf71281
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8195-clk.h>
+
+#define MT8195_PLL_FMAX		(3800UL * MHZ)
+#define MT8195_PLL_FMIN		(1500UL * MHZ)
+#define MT8195_INTEGER_BITS	8
+
+#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,	\
+			_rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,	\
+			_tuner_reg, _tuner_en_reg, _tuner_en_bit,	\
+			_pcw_reg, _pcw_shift, _pcw_chg_reg,				\
+			_en_reg, _pll_en_bit) {					\
+		.id = _id,						\
+		.name = _name,						\
+		.reg = _reg,						\
+		.pwr_reg = _pwr_reg,					\
+		.en_mask = _en_mask,					\
+		.flags = _flags,					\
+		.rst_bar_mask = _rst_bar_mask,				\
+		.fmax = MT8195_PLL_FMAX,				\
+		.fmin = MT8195_PLL_FMIN,				\
+		.pcwbits = _pcwbits,					\
+		.pcwibits = MT8195_INTEGER_BITS,			\
+		.pd_reg = _pd_reg,					\
+		.pd_shift = _pd_shift,					\
+		.tuner_reg = _tuner_reg,				\
+		.tuner_en_reg = _tuner_en_reg,				\
+		.tuner_en_bit = _tuner_en_bit,				\
+		.pcw_reg = _pcw_reg,					\
+		.pcw_shift = _pcw_shift,				\
+		.pcw_chg_reg = _pcw_chg_reg,				\
+		.en_reg = _en_reg,					\
+		.pll_en_bit = _pll_en_bit,				\
+	}
+
+static const struct mtk_pll_data apusys_plls[] = {
+	PLL(CLK_APUSYS_PLL_APUPLL, "apusys_pll_apupll", 0x008, 0x014, 0,
+		0, 0, 22, 0x00c, 24, 0, 0, 0, 0x00c, 0, 0, 0, 0),
+	PLL(CLK_APUSYS_PLL_NPUPLL, "apusys_pll_npupll", 0x018, 0x024, 0,
+		0, 0, 22, 0x01c, 24, 0, 0, 0, 0x01c, 0, 0, 0, 0),
+	PLL(CLK_APUSYS_PLL_APUPLL1, "apusys_pll_apupll1", 0x028, 0x034, 0,
+		0, 0, 22, 0x02c, 24, 0, 0, 0, 0x02c, 0, 0, 0, 0),
+	PLL(CLK_APUSYS_PLL_APUPLL2, "apusys_pll_apupll2", 0x038, 0x044, 0,
+		0, 0, 22, 0x03c, 24, 0, 0, 0, 0x03c, 0, 0, 0, 0),
+};
+
+static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+
+	clk_data = mtk_alloc_clk_data(CLK_APUSYS_PLL_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
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
+
+builtin_platform_driver(clk_mt8195_apusys_pll_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
