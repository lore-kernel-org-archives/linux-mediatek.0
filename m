Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF3FC388F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:59:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0097C22267
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:59:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e4WFOLa4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hJc/h75p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0097C22267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nJhudtwnyBF1SW32xAh+JV5nd30NV926upes6KhE/ZI=; b=e4WFOLa4sXOduvOvNb3hDAtmF
	dfDwwWFCGfNU3bY6RO6v3peanwduYKxkdFPVJLfUrkMC755oqovQJB6Os5aL6agc9NKBhzymkYuZY
	giOGHyrBJCD00J9DIopg7a+x/hlENLmTaICRDixs6iV1jjtroyCgdm3rI74iMCRqt5De7/GyEzIBO
	I/dzqYenaYFU3yrONiWM1pP1m1lwgGu1tP0O3KPqnvkbFr+hn9pgTB7n4VSsd6fNGLW9S6w1l8O07
	2+sNxc9Y3HN/HNpGqD1NRFXx1btlerOAdsDE9cQeFiHcwBESu7j+Cxm/W7FcFEQxCVQ0PeBLFDrjW
	/H+MXICuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVaBS-0004IF-EA; Thu, 22 Oct 2020 12:59:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa10-0007Ce-HK; Thu, 22 Oct 2020 12:48:27 +0000
X-UUID: fd19785247cb473db58a7318b9c08098-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=umJ+B7G8uBrs1AH7lu+KiWUNLiA2sEVEMyWkU8lAiu0=; 
 b=hJc/h75pHpKJjxN84Zcwijt7yMXDaS9YfcUcBcLS8J0V9SrqZeKu8MAMlklG/zMVhRlqLxT94JyrTts1NwB/V0Xxy1IXJbAkOWgWhkItMqVmo2gOiUlraCD9edSSn2h/Hp+Em4wLXIJoG3c0pJT0BI9+BjWJWgorsJC6Yc/yCr4=;
X-UUID: fd19785247cb473db58a7318b9c08098-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 764205624; Thu, 22 Oct 2020 04:47:56 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:37:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:53 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 15/34] clk: mediatek: Add MT8192 camsys rawb clock support
Date: Thu, 22 Oct 2020 20:37:08 +0800
Message-ID: <1603370247-30437-16-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084822_747754_1D2FAC38 
X-CRM114-Status: GOOD (  17.97  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 camsys rawb clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig               |  6 +++
 drivers/clk/mediatek/Makefile              |  1 +
 drivers/clk/mediatek/clk-mt8192-cam_rawb.c | 59 ++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawb.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 230e3f7..34b3a52 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -467,6 +467,12 @@ config COMMON_CLK_MT8192_CAMSYS_RAWA
 	help
 	  This driver supports MediaTek MT8192 camsys_rawa clocks.
 
+config COMMON_CLK_MT8192_CAMSYS_RAWB
+	bool "Clock driver for MediaTek MT8192 camsys_rawb"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 camsys_rawb clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index cf1ec78..a0bcb00 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -65,5 +65,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWA) += clk-mt8192-cam_rawa.o
+obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWB) += clk-mt8192-cam_rawb.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-cam_rawb.c b/drivers/clk/mediatek/clk-mt8192-cam_rawb.c
new file mode 100644
index 0000000..b3855f7
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-cam_rawb.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs cam_rawb_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM_RAWB(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &cam_rawb_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate cam_rawb_clks[] = {
+	GATE_CAM_RAWB(CLK_CAM_RAWB_LARBX, "cam_rawb_larbx", "cam_sel", 0),
+	GATE_CAM_RAWB(CLK_CAM_RAWB_CAM, "cam_rawb_cam", "cam_sel", 1),
+	GATE_CAM_RAWB(CLK_CAM_RAWB_CAMTG, "cam_rawb_camtg", "cam_sel", 2),
+};
+
+static int clk_mt8192_cam_rawb_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_CAM_RAWB_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, cam_rawb_clks, ARRAY_SIZE(cam_rawb_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_cam_rawb[] = {
+	{ .compatible = "mediatek,mt8192-camsys_rawb", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_cam_rawb_drv = {
+	.probe = clk_mt8192_cam_rawb_probe,
+	.driver = {
+		.name = "clk-mt8192-cam_rawb",
+		.of_match_table = of_match_clk_mt8192_cam_rawb,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_cam_rawb_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
