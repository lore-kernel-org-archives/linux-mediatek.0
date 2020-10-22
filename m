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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30157C388F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:52:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2B2E20FC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xspujj+c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZFsiy4K4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2B2E20FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=efs/PsTo98p9BePQjSKiHTsJxjKdzR/5X//m7DSNfkg=; b=Xspujj+cNSyBl3Oizg3d1DsVU
	Z20CuV96JT10ASn9zJ6cmZSEuwe3HNiYA04Ibl6WLlqCXlhLdQaQWtyjrRQXdYxwdkAI6s0dayS6u
	KgBmzOMXbvLqsAx3/Pg2bUruJH7pQT73QCufozHarhhoAYpFSjPW4CEnKO1z7VmnLaWp2te2l1G28
	enpOwahg+VB4CKGJaEbabbQVSK2LxxuIttsnj2R20lxup+VA5mI6yowSnuByP96yZ4QMS2CRGDR+C
	bfOGxVz1i+5mHCCVIFMcupScfZzQ7Rs6Kc9EsDo8DJI6EKb1XVpcaWlL17jHpW/BcyEbo+R7Pm6ao
	s/2vvj9tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVa4g-0000ZZ-Qz; Thu, 22 Oct 2020 12:52:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa0k-0007Bs-SE; Thu, 22 Oct 2020 12:48:10 +0000
X-UUID: 18357cf7b5874f0d92122ee7c9378ab1-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZMPcWi0+CUwGocrX5m4/D3sGTbKA+NU7kJfSH85Yv6w=; 
 b=ZFsiy4K4/9hCaqHyIi7B5pR82yUhQjpahX4AHmqO3uyWAty4AdV6bGbDVxT5Uy1vPOIz7VF6mOrokRnncB3IvQqNDL5xHAxqAH+pUiSb0RcYEDaZ0SS032QnSpFrJ2Ji7FY0oDAQjjp1NWxvTKKfDgzgi6xPXlobWNS6GR/ooQs=;
X-UUID: 18357cf7b5874f0d92122ee7c9378ab1-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1521066823; Thu, 22 Oct 2020 04:47:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:37:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:53 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 18/34] clk: mediatek: Add MT8192 imgsys2 clock support
Date: Thu, 22 Oct 2020 20:37:11 +0800
Message-ID: <1603370247-30437-19-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084807_091406_455F1BC0 
X-CRM114-Status: GOOD (  18.17  )
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

Add MT8192 imgsys2 clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |  6 ++++
 drivers/clk/mediatek/Makefile          |  1 +
 drivers/clk/mediatek/clk-mt8192-img2.c | 62 ++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-img2.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index afd028b..99b0168 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -485,6 +485,12 @@ config COMMON_CLK_MT8192_IMGSYS
 	help
 	  This driver supports MediaTek MT8192 imgsys clocks.
 
+config COMMON_CLK_MT8192_IMGSYS2
+	bool "Clock driver for MediaTek MT8192 imgsys2"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imgsys2 clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 1f87bec..012a01a 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -68,5 +68,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWA) += clk-mt8192-cam_rawa.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWB) += clk-mt8192-cam_rawb.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS_RAWC) += clk-mt8192-cam_rawc.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS) += clk-mt8192-img.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS2) += clk-mt8192-img2.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-img2.c b/drivers/clk/mediatek/clk-mt8192-img2.c
new file mode 100644
index 0000000..76f9e32
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-img2.c
@@ -0,0 +1,62 @@
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
+static const struct mtk_gate_regs img2_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMG2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &img2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate img2_clks[] = {
+	GATE_IMG2(CLK_IMG2_LARB11, "img2_larb11", "img1_sel", 0),
+	GATE_IMG2(CLK_IMG2_LARB12, "img2_larb12", "img1_sel", 1),
+	GATE_IMG2(CLK_IMG2_MFB, "img2_mfb", "img1_sel", 6),
+	GATE_IMG2(CLK_IMG2_WPE, "img2_wpe", "img1_sel", 7),
+	GATE_IMG2(CLK_IMG2_MSS, "img2_mss", "img1_sel", 8),
+	GATE_IMG2(CLK_IMG2_GALS, "img2_gals", "img1_sel", 12),
+};
+
+static int clk_mt8192_img2_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMG2_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, img2_clks, ARRAY_SIZE(img2_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_img2[] = {
+	{ .compatible = "mediatek,mt8192-imgsys2", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_img2_drv = {
+	.probe = clk_mt8192_img2_probe,
+	.driver = {
+		.name = "clk-mt8192-img2",
+		.of_match_table = of_match_clk_mt8192_img2,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_img2_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
