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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9B6C388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 22:37:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84BDB21D43
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 22:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ysm5gytV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XeDmU3bo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84BDB21D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bRgmA4YSys8OkPflbwB0Ka48r0iIeRle8uv4T4F25YI=; b=ysm5gytVISxEscve2txlOuLa5
	XMsT+WYfvuhvKJr/HzcEgkI7y0BgWmKs0Ra0UBOiuUBIcRlV1QqdlvGFKTMX4dGOsZZN9oN30wJp5
	MKrEEo5focLBu5bHlRbETU0Q6886zXZQkdvTqVBD5UCnBV9LDhOZQGb21uSZROyiwaEIEXzH7ZVOt
	T3I425SwpVu37tcD/8Bt6zEnYSp4uQN/qy8/neMfq9Z8AoFNIGOuIWAO0iZrFdKN0lWajgQY+cMOX
	1PS4bxfaqG/X4oIru3F/MK6dj3HQkhsII5h6VeM8yNDZYJSUhTvY/o3i8e4oS+JAfVzUQX/iDr2PU
	vxoHjVfGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVjDR-0002u3-Bo; Thu, 22 Oct 2020 22:37:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa14-0007BO-9y; Thu, 22 Oct 2020 12:48:30 +0000
X-UUID: 2685f18860fe450d94b82c5e2a79915a-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UvmuHyXMIzk6YC53NsSnOcfDqYgzE3L3Z4nQ/Gc4Pdg=; 
 b=XeDmU3bopaO6q3bq4MGBvTGTA14Yr445E3kXRhbDw+NnviDRlu1PsJ3kqwFefiT/HPIXSaFdrX2Acc3hfR+3RzfX/VZnRrz6LvRi9UZw1/d/1HvLgwm+Xn0qBPjNneCTVMTnO6J2uOl3w0sGvt/pNo1vOtBVMSccNZoPCdeNSNk=;
X-UUID: 2685f18860fe450d94b82c5e2a79915a-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1613857061; Thu, 22 Oct 2020 04:47:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:38:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:56 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 30/34] clk: mediatek: Add MT8192 msdc clock support
Date: Thu, 22 Oct 2020 20:37:23 +0800
Message-ID: <1603370247-30437-31-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084826_520416_B721E55E 
X-CRM114-Status: GOOD (  18.06  )
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

Add MT8192 msdc clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |  6 ++++
 drivers/clk/mediatek/Makefile          |  1 +
 drivers/clk/mediatek/clk-mt8192-msdc.c | 57 ++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 01a76ae..4b8cae6 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -557,6 +557,12 @@ config COMMON_CLK_MT8192_MSDC_TOP
 	help
 	  This driver supports MediaTek MT8192 msdc_top clocks.
 
+config COMMON_CLK_MT8192_MSDC
+	bool "Clock driver for MediaTek MT8192 msdc"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 msdc clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 4a30269..31e134b 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -80,5 +80,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MDPSYS) += clk-mt8192-mdp.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MFGCFG) += clk-mt8192-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MMSYS) += clk-mt8192-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MSDC_TOP) += clk-mt8192-msdc_top.o
+obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-msdc.c b/drivers/clk/mediatek/clk-mt8192-msdc.c
new file mode 100644
index 0000000..9d2b168
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-msdc.c
@@ -0,0 +1,57 @@
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
+static const struct mtk_gate_regs msdc_cg_regs = {
+	.set_ofs = 0xb4,
+	.clr_ofs = 0xb4,
+	.sta_ofs = 0xb4,
+};
+
+#define GATE_MSDC(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &msdc_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate msdc_clks[] = {
+	GATE_MSDC(CLK_MSDC_AXI_WRAP, "msdc_axi_wrap", "axi_sel", 22),
+};
+
+static int clk_mt8192_msdc_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_MSDC_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, msdc_clks, ARRAY_SIZE(msdc_clks), clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_msdc[] = {
+	{ .compatible = "mediatek,mt8192-msdc", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_msdc_drv = {
+	.probe = clk_mt8192_msdc_probe,
+	.driver = {
+		.name = "clk-mt8192-msdc",
+		.of_match_table = of_match_clk_mt8192_msdc,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_msdc_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
