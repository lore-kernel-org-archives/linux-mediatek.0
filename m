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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBFEC48BE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 22:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 207AE613C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 22:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 207AE613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtOu9ldGlSU5k6hqc7ryetl1atYz1s88ZMKWwHBMDoY=; b=lVlWiGLJxPd2kS
	bcSXTwBxBSx+cOlvB993a21tEfzDS5Wj7fpzufj2yBurA9/V/SAvcx/yWsLYLwt2VEPf0TlFNWBjx
	FCVWb+R9HSprB+IqwQpVI/JS++7zx0jeaQ4R0AiGiu0zRxK+TuXL5QVuTJjQqhGjyka/ydfHuL7l1
	8ObEqJYXGM5srf6WGbDyPQHMoTekVYvGO+tKiaju824KmuEwuo/cOHxKb/VCljDbVBReVow8x5Vq3
	o1SCIYMgUJsbD5Ypx0/ZoPWi2aj+TKLiiv0xqxwC1PyDYABXaAUkb/6JSxylDRFcK00lV9e42gu9o
	Y4Vf0AFm3g0hNLVgwxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteVV-007xOp-AN; Wed, 16 Jun 2021 22:59:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteVF-007xHE-D0; Wed, 16 Jun 2021 22:59:22 +0000
X-UUID: 4177522bfcf24a8ebef1a2ff76e11216-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+/jRRMAIghYhl00xWWo2AnfF+M0yAWop+uUwu2oC5EI=; 
 b=QU/XM5ss5zouWS+gdZUC21q1qXWgWTBJoMMJ+fJrf13ToQfupNL2vJT2I9gmrnDReZuKCCu5kfhzT0WMVAkzuS++k0CwGu+6R/urpznznk+5mMIkpWf598xfS5+/6IUnrleBR+3mFmwqWOK8pgjbYYuGN/KRNblXko5DOl6xwVA=;
X-UUID: 4177522bfcf24a8ebef1a2ff76e11216-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 519930346; Wed, 16 Jun 2021 15:59:19 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:49:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:49:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 06:49:45 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH 08/22] clk: mediatek: Add MT8195 ccusys clock support
Date: Thu, 17 Jun 2021 06:47:29 +0800
Message-ID: <20210616224743.5109-9-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_155921_484492_B175C3AE 
X-CRM114-Status: GOOD (  16.39  )
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

Add MT8195 ccusys clock provider

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |  6 ++++
 drivers/clk/mediatek/Makefile         |  1 +
 drivers/clk/mediatek/clk-mt8195-ccu.c | 52 +++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-ccu.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 515155f3d185..6a6e496d08a4 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -606,6 +606,12 @@ config COMMON_CLK_MT8195_CAMSYS
 	help
 	  This driver supports MediaTek MT8195 camsys clocks.
 
+config COMMON_CLK_MT8195_CCUSYS
+	bool "Clock driver for MediaTek MT8195 ccusys"
+	depends on COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 ccusys clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 421064e7418c..bb8aac6f9185 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -84,5 +84,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195.o
 obj-$(CONFIG_COMMON_CLK_MT8195_AUDSYS) += clk-mt8195-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8195_AUDSYS_SRC) += clk-mt8195-aud_src.o
 obj-$(CONFIG_COMMON_CLK_MT8195_CAMSYS) += clk-mt8195-cam.o
+obj-$(CONFIG_COMMON_CLK_MT8195_CCUSYS) += clk-mt8195-ccu.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-ccu.c b/drivers/clk/mediatek/clk-mt8195-ccu.c
new file mode 100644
index 000000000000..6d8c657bedb3
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-ccu.c
@@ -0,0 +1,52 @@
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
+	GATE_CCU(CLK_CCU_LARB18, "ccu_larb18", "ccu_sel", 0),
+	GATE_CCU(CLK_CCU_AHB, "ccu_ahb", "ccu_sel", 1),
+	GATE_CCU(CLK_CCU_CCU0, "ccu_ccu0", "ccu_sel", 2),
+	GATE_CCU(CLK_CCU_CCU1, "ccu_ccu1", "ccu_sel", 3),
+};
+
+static const struct mtk_clk_desc ccu_desc = {
+	.clks = ccu_clks,
+	.num_clks = ARRAY_SIZE(ccu_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8195_ccu[] = {
+	{
+		.compatible = "mediatek,mt8195-ccusys",
+		.data = &ccu_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8195_ccu_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8195-ccu",
+		.of_match_table = of_match_clk_mt8195_ccu,
+	},
+};
+
+builtin_platform_driver(clk_mt8195_ccu_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
