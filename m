Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6D4C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:52:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8597620FC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q0kkRgPa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EZzCeaMF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8597620FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vnyK2/GzkHLFhosN6VdNQFY25lzl6EVV8MIXjKbLn7U=; b=Q0kkRgPam03RJ7IC+PG7wQwcv
	BUu7QCLjjx71qh8qvqRmoLRauVJGQK91fQyxhUoft+2Z/FSAZ4N3V1klcXUPU65LiBOPMfmH+H76h
	aZ8xDPwRFCTzm7FhCNHSnr48edxjdl1AyYKa2bZeWwiPO+3oM7olXLVeYtSRNoKEv6jZGVWjI1EJN
	o+KEY648Pn3NbhbM/CO+I3arowFidD1m2yCe0ORBqmirXZGLayI1W0aa3p5fkdu1M7xrNwm2hyh1g
	auFPURvsPkeNU6mJ3GXHikGp0fNYklaMvcYIMCXV7zqoLUWgKLn5vxIZ0v+6sZ09/um5yh1jGL6gU
	L5w0cw+jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVa54-0000pN-RC; Thu, 22 Oct 2020 12:52:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa0m-0007BO-8S; Thu, 22 Oct 2020 12:48:11 +0000
X-UUID: f8066c29deb74b88ba93029c2e014e04-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=suctow7OnROATkYCQN1YTqk9AdATYyE1DHxLKwC/LTQ=; 
 b=EZzCeaMFM9C4/SsoIK6ZpCQK3UviVrb8gTKqfRC4HmmSsgklUb0y//lh9IsiuzGtB+UkkExZ4vokbogCOh7I9gw0UdOhzRarFz61iXKxJmEdwSZHxbcbPlPvuPwcpkN+HQNeaqFKRfzMv4tJxi5f2nRYnQ5DjgF6OnrDTLFkrzE=;
X-UUID: f8066c29deb74b88ba93029c2e014e04-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 494482204; Thu, 22 Oct 2020 04:47:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:37:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:37:55 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v4 22/34] clk: mediatek: Add MT8192 imp i2c wrapper s clock
 support
Date: Thu, 22 Oct 2020 20:37:15 +0800
Message-ID: <1603370247-30437-23-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084808_522922_696703D5 
X-CRM114-Status: GOOD (  18.58  )
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

Add MT8192 imp i2c wrapper s clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig                     |  6 +++
 drivers/clk/mediatek/Makefile                    |  1 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c | 61 ++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index c9d167b..e16b8b2 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -509,6 +509,12 @@ config COMMON_CLK_MT8192_IMP_IIC_WRAP_N
 	help
 	  This driver supports MediaTek MT8192 imp_iic_wrap_n clocks.
 
+config COMMON_CLK_MT8192_IMP_IIC_WRAP_S
+	bool "Clock driver for MediaTek MT8192 imp_iic_wrap_s"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imp_iic_wrap_s clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 9d4d0a7..719505d 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -72,5 +72,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS2) += clk-mt8192-img2.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_C) += clk-mt8192-imp_iic_wrap_c.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_E) += clk-mt8192-imp_iic_wrap_e.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_N) += clk-mt8192-imp_iic_wrap_n.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP_S) += clk-mt8192-imp_iic_wrap_s.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c
new file mode 100644
index 0000000..1f9c5ad
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c
@@ -0,0 +1,61 @@
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
+static const struct mtk_gate_regs imp_iic_wrap_s_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP_S(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_s_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate imp_iic_wrap_s_clks[] = {
+	GATE_IMP_IIC_WRAP_S(CLK_IMP_IIC_WRAP_S_I2C7, "imp_iic_wrap_s_i2c7", "infra_i2c0", 0),
+	GATE_IMP_IIC_WRAP_S(CLK_IMP_IIC_WRAP_S_I2C8, "imp_iic_wrap_s_i2c8", "infra_i2c0", 1),
+	GATE_IMP_IIC_WRAP_S(CLK_IMP_IIC_WRAP_S_I2C9, "imp_iic_wrap_s_i2c9", "infra_i2c0", 2),
+};
+
+static int clk_mt8192_imp_iic_wrap_s_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_IMP_IIC_WRAP_S_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, imp_iic_wrap_s_clks, ARRAY_SIZE(imp_iic_wrap_s_clks),
+			clk_data);
+	if (r)
+		return r;
+
+	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap_s[] = {
+	{ .compatible = "mediatek,mt8192-imp_iic_wrap_s", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_imp_iic_wrap_s_drv = {
+	.probe = clk_mt8192_imp_iic_wrap_s_probe,
+	.driver = {
+		.name = "clk-mt8192-imp_iic_wrap_s",
+		.of_match_table = of_match_clk_mt8192_imp_iic_wrap_s,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_imp_iic_wrap_s_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
