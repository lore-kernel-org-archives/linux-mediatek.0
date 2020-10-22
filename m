Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A43EC388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:51:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD91922267
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:51:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QDyNnr7g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ohlgz9mz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD91922267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BCQMs8ii2MTWj0EgNeZR6n1/vGi9uyXKSQCtsYhCsMc=; b=QDyNnr7ghlH/AX6JDCHrtLOJC
	o25BycH7I/J/h6AlSZ26TCCIBlh9hQ/BIPTbl6vFzO4Pmk96z9EvDC2DX9W9kC6Bg7se8hPYYXd4s
	CI4DQZC4nGajf38hCy+hhqkdyK8q5uc+pbkPgJ3B6hw2OYQt/zaFQ1+zJzw4Z7I58JoKN3EZOAJSm
	wUc3h3RCnzXR9HiGJcP97Gl1UGDXUgINMvSKlnUiYqcTt3P94yzL6xfj+bfW8Yt37Bbb+hU0SVKRD
	uv6zK3gojU9YmShaFSSYXWBQJEvUGd2lhkdR4iujzmfaP0YBsF/xDclR3mDH8E4V7ONOfkXueZe6i
	AmrIxwtdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVa3X-0008Ov-Ec; Thu, 22 Oct 2020 12:50:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa0h-0007Ce-3h; Thu, 22 Oct 2020 12:48:07 +0000
X-UUID: b614b950fff4488ba0661d0854d849d5-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Rd/rgu71cjk7BJg3fJ7fmfL9SL7aLAs1L3NOIrXhYCY=; 
 b=ohlgz9mzruJr4w4xNIoIGEWOnp3icxIpp18/FG/zfPlM8oSnuDQg3kjAK8ZpYFM0ejE6x5kDeXuQGCPgFKK0oqA/vgRNy7rT+6CltN4KF0P/P2eFFAwbpjMlAb4xzGOABdiTc+a6nYJegmw0Sutc/6O1V3yGJDJk7Jaw7cTk4z0=;
X-UUID: b614b950fff4488ba0661d0854d849d5-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2082770092; Thu, 22 Oct 2020 04:47:56 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:37:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:55 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 25/34] clk: mediatek: Add MT8192 ipesys clock support
Date: Thu, 22 Oct 2020 20:37:18 +0800
Message-ID: <1603370247-30437-26-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084803_379233_DA7DFF47 
X-CRM114-Status: GOOD (  17.99  )
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

Add MT8192 ipesys clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |  6 ++++
 drivers/clk/mediatek/Makefile         |  1 +
 drivers/clk/mediatek/clk-mt8192-ipe.c | 64 +++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-ipe.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 037f74f2..df75a09 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -527,6 +527,12 @@ config COMMON_CLK_MT8192_IMP_IIC_WRAP_WS
 	help
 	  This driver supports MediaTek MT8192 imp_iic_wrap_ws clocks.
 
+config COMMON_CLK_MT8192_IPESYS
+	bool "Clock driver for MediaTek MT8192 ipesys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 ipesys clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 4faa9ad..5fe21f9 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -75,5 +75,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_N) += clk-mt8192-imp_iic_wrap_n.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_S) += clk-mt8192-imp_iic_wrap_s.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_W) += clk-mt8192-imp_iic_wrap_w.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_WS) += clk-mt8192-imp_iic_wrap_ws.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IPESYS) += clk-mt8192-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-ipe.c b/drivers/clk/mediatek/clk-mt8192-ipe.c
new file mode 100644
index 0000000..304dca4
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-ipe.c
@@ -0,0 +1,64 @@
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
+static const struct mtk_gate_regs ipe_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IPE(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &ipe_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate ipe_clks[] = {
+	GATE_IPE(CLK_IPE_LARB19, "ipe_larb19", "ipe_sel", 0),
+	GATE_IPE(CLK_IPE_LARB20, "ipe_larb20", "ipe_sel", 1),
+	GATE_IPE(CLK_IPE_SMI_SUBCOM, "ipe_smi_subcom", "ipe_sel", 2),
+	GATE_IPE(CLK_IPE_FD, "ipe_fd", "ipe_sel", 3),
+	GATE_IPE(CLK_IPE_FE, "ipe_fe", "ipe_sel", 4),
+	GATE_IPE(CLK_IPE_RSC, "ipe_rsc", "ipe_sel", 5),
+	GATE_IPE(CLK_IPE_DPE, "ipe_dpe", "ipe_sel", 6),
+	GATE_IPE(CLK_IPE_GALS, "ipe_gals", "ipe_sel", 8),
+};
+
+static int clk_mt8192_ipe_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IPE_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, ipe_clks, ARRAY_SIZE(ipe_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_ipe[] = {
+	{ .compatible = "mediatek,mt8192-ipesys", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_ipe_drv = {
+	.probe = clk_mt8192_ipe_probe,
+	.driver = {
+		.name = "clk-mt8192-ipe",
+		.of_match_table = of_match_clk_mt8192_ipe,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_ipe_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
