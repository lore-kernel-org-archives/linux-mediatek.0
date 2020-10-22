Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0011C388F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:49:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67A292419B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jyP6TE+s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k/H4bVoY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67A292419B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zrStfZ+bSHpZJl1JWxKQ7CZr1Gkxnx4lxMZj4NJMtS4=; b=jyP6TE+sqBCUgU7Op18XzYLYU
	RIgcGhHc3tY++Rz5+kkYjnriZsXLlJQZoadYZBJeEqpUZZj3UgRFTVik0cw8IhQLE6kntXbqyx3G2
	TYZ9wxdvy1JQKaCvRQuHRFwiBP6jtUFCsjAvkQ+sDJSQg2P4SjJ/JAbIlyzgQZvRhOTFkyOyqfod6
	NYkZJWX9zKSakKuL2em5P+bcRO9wDsn+QYohBpzUTMBUPKU0t6C2mah5/t/WraJTqexkQhFX18hJv
	M44LgxEWnAIYgWWMbxFyoYlpMYPKwBAyJ1raQmUx2+OKTiHQFBgjD1xtXEa9MFuK995VNkX/nsK7c
	DIuWKBtWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVa1S-0007W9-8R; Thu, 22 Oct 2020 12:48:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa0d-0007BO-QU; Thu, 22 Oct 2020 12:48:01 +0000
X-UUID: b05d430ddefc4a1bade77982d3958f58-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=94ERqEezAl61WLflohrVVCYOOOkHB1z2OaNseGbFxoA=; 
 b=k/H4bVoYIknNx4i9TnKNeoS4pcGeRN+UHubq1ZEzhLgRmZhilGytG7lu1p/kx7wVF2Zx9SFILhAYv9LcsVAlyKqOL9zpDI21JlcoVpu/Gs/3LsyVxlvVNbcYczLGppTFhkwRfeacy5tQmds2ubALa9SIk7t+q0P4csOOhG7bySs=;
X-UUID: b05d430ddefc4a1bade77982d3958f58-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1492104777; Thu, 22 Oct 2020 04:47:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:37:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:53 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 16/34] clk: mediatek: Add MT8192 camsys rawc clock support
Date: Thu, 22 Oct 2020 20:37:09 +0800
Message-ID: <1603370247-30437-17-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084800_015735_175BCF61 
X-CRM114-Status: GOOD (  18.65  )
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

Add MT8192 camsys rawc clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig               |  6 +++
 drivers/clk/mediatek/Makefile              |  1 +
 drivers/clk/mediatek/clk-mt8192-cam_rawc.c | 59 ++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawc.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 34b3a52..4c18a08 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -473,6 +473,12 @@ config COMMON_CLK_MT8192_CAMSYS_RAWB
 	help
 	  This driver supports MediaTek MT8192 camsys_rawb clocks.
 
+config COMMON_CLK_MT8192_CAMSYS_RAWC
+	bool "Clock driver for MediaTek MT8192 camsys_rawc"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 camsys_rawc clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index a0bcb00..07aa2bd 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -66,5 +66,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWA) += clk-mt8192-cam_rawa.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWB) += clk-mt8192-cam_rawb.o
+obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWC) += clk-mt8192-cam_rawc.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-cam_rawc.c b/drivers/clk/mediatek/clk-mt8192-cam_rawc.c
new file mode 100644
index 0000000..054361d
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-cam_rawc.c
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
+static const struct mtk_gate_regs cam_rawc_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM_RAWC(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &cam_rawc_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate cam_rawc_clks[] = {
+	GATE_CAM_RAWC(CLK_CAM_RAWC_LARBX, "cam_rawc_larbx", "cam_sel", 0),
+	GATE_CAM_RAWC(CLK_CAM_RAWC_CAM, "cam_rawc_cam", "cam_sel", 1),
+	GATE_CAM_RAWC(CLK_CAM_RAWC_CAMTG, "cam_rawc_camtg", "cam_sel", 2),
+};
+
+static int clk_mt8192_cam_rawc_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_CAM_RAWC_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, cam_rawc_clks, ARRAY_SIZE(cam_rawc_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_cam_rawc[] = {
+	{ .compatible = "mediatek,mt8192-camsys_rawc", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_cam_rawc_drv = {
+	.probe = clk_mt8192_cam_rawc_probe,
+	.driver = {
+		.name = "clk-mt8192-cam_rawc",
+		.of_match_table = of_match_clk_mt8192_cam_rawc,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_cam_rawc_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
