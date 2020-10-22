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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F83C388F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:56:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E06F223FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:56:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="04R/Hnbm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IshULhF4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E06F223FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1FgjT0Ky+Rc0TL0ETPpodScjirVWnkrCsYrK4Oyf5Bc=; b=04R/HnbmwcQ600nzKp0DmXP8M
	NZ/4wsT3GWW1mhy0h4YW0COMaCgNy41hWGTuweNbx4VJJbNjZwmTGIf9SLNKy+JobnjAHnEvgVVdq
	4k6SzXodSCdiSuOSoPmMdI/Sh0RLGTx9KMqPjinZVbXZXoabSIDhpO+Zd1PU+plmI1r//KPrAF/5d
	iBiyenhgASNdFjWN3m7lIWOlsRMoJ1+1VHgp6uUupZQYz3LEuqQIOqOtp7q/FIdPhHhCRmHoxKoVw
	7GReyK1mj34TZvurxf+16MZjbKGpiWckl3+LbG91+XUglgn6AQzsKaWZBoJoeGcrEpleR+XzdeGZ+
	QlcD8OqBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVa8Y-0002rh-AT; Thu, 22 Oct 2020 12:56:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa0u-0007Bw-Py; Thu, 22 Oct 2020 12:48:21 +0000
X-UUID: 7070bb638a49488b8c2474bcbbebd66b-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Jha2F1QI7KSVraGo9Mnho2It6P0BwdjzTvDojZsu+f8=; 
 b=IshULhF4GQQf3XpUDX7eGGJSwm3LRs5NAAS9Q55b0CvUaDwcJZYePKFHWxGRQvrx0dbF0pRML1v+45CdsiVAS5RdE5wevxQEh4ob/1G4HXqK0qyJWQgxAoPvnQrerAEtpEy2e1yHq1rpQAYjrJ+24roEm+U3ntl7AVQyXsv/zmw=;
X-UUID: 7070bb638a49488b8c2474bcbbebd66b-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1208728523; Thu, 22 Oct 2020 04:47:56 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:37:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:55 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 23/34] clk: mediatek: Add MT8192 imp i2c wrapper w clock
 support
Date: Thu, 22 Oct 2020 20:37:16 +0800
Message-ID: <1603370247-30437-24-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084817_043607_4D8DF903 
X-CRM114-Status: GOOD (  18.10  )
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

Add MT8192 imp i2c wrapper w clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig                     |  6 +++
 drivers/clk/mediatek/Makefile                    |  1 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c | 59 ++++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index e16b8b2..8a9d9f6 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -515,6 +515,12 @@ config COMMON_CLK_MT8192_IMP_IIC_WRAP_S
 	help
 	  This driver supports MediaTek MT8192 imp_iic_wrap_s clocks.
 
+config COMMON_CLK_MT8192_IMP_IIC_WRAP_W
+	bool "Clock driver for MediaTek MT8192 imp_iic_wrap_w"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imp_iic_wrap_w clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 719505d..1d3598a 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -73,5 +73,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_C) += clk-mt8192-imp_iic_wrap_c.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_E) += clk-mt8192-imp_iic_wrap_e.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_N) += clk-mt8192-imp_iic_wrap_n.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_S) += clk-mt8192-imp_iic_wrap_s.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_W) += clk-mt8192-imp_iic_wrap_w.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c
new file mode 100644
index 0000000..7e125ec
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c
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
+static const struct mtk_gate_regs imp_iic_wrap_w_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP_W(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_w_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate imp_iic_wrap_w_clks[] = {
+	GATE_IMP_IIC_WRAP_W(CLK_IMP_IIC_WRAP_W_I2C5, "imp_iic_wrap_w_i2c5", "infra_i2c0", 0),
+};
+
+static int clk_mt8192_imp_iic_wrap_w_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMP_IIC_WRAP_W_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, imp_iic_wrap_w_clks, ARRAY_SIZE(imp_iic_wrap_w_clks),
+			clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap_w[] = {
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_w", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_imp_iic_wrap_w_drv = {
+	.probe = clk_mt8192_imp_iic_wrap_w_probe,
+	.driver = {
+		.name = "clk-mt8192-imp_iic_wrap_w",
+		.of_match_table = of_match_clk_mt8192_imp_iic_wrap_w,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_imp_iic_wrap_w_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
