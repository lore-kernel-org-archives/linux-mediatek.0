Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57554C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 11:12:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 226D560241
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 11:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 226D560241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ueY64VqF6xYdD9OwVeTmEqN+kCaz8zFvVJzGeh7KhY=; b=OE5FmQ+P5f3/l0
	Q06zLsL3eOc8gPThwB1sRsY6WBIS66nAiglKey/9aEkzmswqgUt6knPa9Z9yivrSS7R+8Q78bbDXb
	ZdooiRu3sEFNQA4i4//y7/XXKw37BhZM7UGUsCMVBNviiWOGBQNw6DRohkaO64tjia9c33CYeQL5W
	wMpcecXrmucar/9U6e3om13yrRVKKc0m4UoVburHs0Y0rVG9NXqh51UXURvrl6nXL8HNiuY3m7Bpu
	7qskzgqzkx3gVR5s62iGS1E0aYD6H4Pet8uEKEbG4EQsTMOrzfgP16d3KBk/AbhThj0UZn0tUM/zB
	uf1ygh4Nlr5hVs3XtJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7yXO-00Avl8-B9; Mon, 26 Jul 2021 11:12:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7ySt-00AtfA-NK; Mon, 26 Jul 2021 11:08:09 +0000
X-UUID: 757ad6566eb34c71a5e48dd5f4fed27b-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xNudl8DH8DLWjS43ELxK+tiWjHTOhvvrhHy//CgpjvA=; 
 b=Ru9YX9I/WQT6wBffiE3/KmXl5HG7XzRS7NbNBX6uqEMAvkc4kpynU+SKCGuEgMvxifmeviRmRLUq6Yn7tovF0RId91heKyk28aERZzRMu73gHP+Qs+K5TUxJPIHXHRmVq/qga8LqdJQ7IIBfPWT0ECwUoLlR63UhlGINLX4HxhY=;
X-UUID: 757ad6566eb34c71a5e48dd5f4fed27b-20210726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1765881291; Mon, 26 Jul 2021 04:08:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 03:58:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 18:58:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 26 Jul 2021 18:58:10 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [v14 12/21] clk: mediatek: Add MT8192 imgsys clock support
Date: Mon, 26 Jul 2021 18:57:10 +0800
Message-ID: <20210726105719.15793-13-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_040807_815671_C06D8341 
X-CRM114-Status: GOOD (  16.58  )
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

Add MT8192 imgsys and imgsys2 clock providers

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |  6 +++
 drivers/clk/mediatek/Makefile         |  1 +
 drivers/clk/mediatek/clk-mt8192-img.c | 70 +++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-img.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index a39a4c201c9e..38011dccfe47 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -520,6 +520,12 @@ config COMMON_CLK_MT8192_CAMSYS
 	help
 	  This driver supports MediaTek MT8192 camsys and camsys_raw clocks.
 
+config COMMON_CLK_MT8192_IMGSYS
+	bool "Clock driver for MediaTek MT8192 imgsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imgsys and imgsys2 clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 94bf7a03fd88..91392cb333fd 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -70,5 +70,6 @@ obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS) += clk-mt8192-img.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-img.c b/drivers/clk/mediatek/clk-mt8192-img.c
new file mode 100644
index 000000000000..7ce3abe42577
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-img.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs img_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMG(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &img_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate img_clks[] = {
+	GATE_IMG(CLK_IMG_LARB9, "img_larb9", "img1_sel", 0),
+	GATE_IMG(CLK_IMG_LARB10, "img_larb10", "img1_sel", 1),
+	GATE_IMG(CLK_IMG_DIP, "img_dip", "img1_sel", 2),
+	GATE_IMG(CLK_IMG_GALS, "img_gals", "img1_sel", 12),
+};
+
+static const struct mtk_gate img2_clks[] = {
+	GATE_IMG(CLK_IMG2_LARB11, "img2_larb11", "img1_sel", 0),
+	GATE_IMG(CLK_IMG2_LARB12, "img2_larb12", "img1_sel", 1),
+	GATE_IMG(CLK_IMG2_MFB, "img2_mfb", "img1_sel", 6),
+	GATE_IMG(CLK_IMG2_WPE, "img2_wpe", "img1_sel", 7),
+	GATE_IMG(CLK_IMG2_MSS, "img2_mss", "img1_sel", 8),
+	GATE_IMG(CLK_IMG2_GALS, "img2_gals", "img1_sel", 12),
+};
+
+static const struct mtk_clk_desc img_desc = {
+	.clks = img_clks,
+	.num_clks = ARRAY_SIZE(img_clks),
+};
+
+static const struct mtk_clk_desc img2_desc = {
+	.clks = img2_clks,
+	.num_clks = ARRAY_SIZE(img2_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_img[] = {
+	{
+		.compatible = "mediatek,mt8192-imgsys",
+		.data = &img_desc,
+	}, {
+		.compatible = "mediatek,mt8192-imgsys2",
+		.data = &img2_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_img_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-img",
+		.of_match_table = of_match_clk_mt8192_img,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_img_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
