Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0A8C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:05:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 555B2206C1
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DU+ggOKP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xol94HKk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 555B2206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kAyrkWVV6mzv1IR8duOFhWTcLyjxNZ+Tzlq1wrAMTv8=; b=DU+ggOKP33qS753aJC81R/KFR
	wU14ldTw+GLI1neWT0eX7c72BqpbAKku9k9dpv2v8wUB1Qy3f16dzSdFwek61uTl+uBbtqNeEphuG
	SDyzVRhA5dJPE2+LrczkBNZrjUVLqAXNylmjMzUi1+gNuyi5VqeaF7lk0ai74zg9iEHdpugN2zQVz
	LsPCNSYP4Sj1uV7iDnDvj+Li/qeb9Ycr0z7JJUobKDExhd+xraMQApm+1m4QfuGsHDNoylmxQeD+3
	0Okb1KG77BF8CYacFK0dsyxBZ94Nh/7C5uD3a5efiYWqkfwVWchu5u392WUpfuEuPPosPtGSDn4/R
	Sf/EfhJeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwYQ-00030Y-PK; Mon, 09 Nov 2020 02:05:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwXK-0002QA-3l; Mon, 09 Nov 2020 02:04:08 +0000
X-UUID: c1e06812680c4275830dca9246369561-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VbSNsYzPSAaIGUHvrRw7InXMKM+kkHhpHFMVDJSEKAA=; 
 b=Xol94HKkdkTu5dq0B3RFzcAv2Ma+ElgB0GwdcOt4sc9gCzjV6bcNYGfQyHO2vNQOw8d97sA7ZpyX48MpNTp/PwWbYPSZhTXi2FrVjPY85dY6EBmrcndoGEoHjfa8QOhARaIzJoLcphiAx+Wc2+48Jur7Zk/sl6vvhQWOnvwcjs0=;
X-UUID: c1e06812680c4275830dca9246369561-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 685302098; Sun, 08 Nov 2020 18:03:56 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:03:54 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:03:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:03:53 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v5 14/24] clk: mediatek: Add MT8192 imp i2c wrapper clock
 support
Date: Mon, 9 Nov 2020 10:03:39 +0800
Message-ID: <1604887429-29445-15-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_210402_530747_5C5C0889 
X-CRM114-Status: GOOD (  17.95  )
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
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 imp i2c wrapper clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig                   |   6 ++
 drivers/clk/mediatek/Makefile                  |   1 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c | 119 +++++++++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index eb549f8..8acc7d6 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -515,6 +515,12 @@ config COMMON_CLK_MT8192_IMGSYS
 	help
 	  This driver supports MediaTek MT8192 imgsys and imgsys2 clocks.
 
+config COMMON_CLK_MT8192_IMP_IIC_WRAP
+	bool "Clock driver for MediaTek MT8192 imp_iic_wrap"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imp_iic_wrap clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 91392cb..3798162 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -71,5 +71,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS) += clk-mt8192-img.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP) += clk-mt8192-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
new file mode 100644
index 0000000..7acb903
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
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
+static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)			\
+	GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate imp_iic_wrap_c_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_I2C10, "imp_iic_wrap_c_i2c10", "infra_i2c0", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_I2C11, "imp_iic_wrap_c_i2c11", "infra_i2c0", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_I2C12, "imp_iic_wrap_c_i2c12", "infra_i2c0", 2),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_I2C13, "imp_iic_wrap_c_i2c13", "infra_i2c0", 3),
+};
+
+static const struct mtk_gate imp_iic_wrap_e_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_E_I2C3, "imp_iic_wrap_e_i2c3", "infra_i2c0", 0),
+};
+
+static const struct mtk_gate imp_iic_wrap_n_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_N_I2C0, "imp_iic_wrap_n_i2c0", "infra_i2c0", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_N_I2C6, "imp_iic_wrap_n_i2c6", "infra_i2c0", 1),
+};
+
+static const struct mtk_gate imp_iic_wrap_s_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C7, "imp_iic_wrap_s_i2c7", "infra_i2c0", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C8, "imp_iic_wrap_s_i2c8", "infra_i2c0", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C9, "imp_iic_wrap_s_i2c9", "infra_i2c0", 2),
+};
+
+static const struct mtk_gate imp_iic_wrap_w_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C5, "imp_iic_wrap_w_i2c5", "infra_i2c0", 0),
+};
+
+static const struct mtk_gate imp_iic_wrap_ws_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_WS_I2C1, "imp_iic_wrap_ws_i2c1", "infra_i2c0", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_WS_I2C2, "imp_iic_wrap_ws_i2c2", "infra_i2c0", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_WS_I2C4, "imp_iic_wrap_ws_i2c4", "infra_i2c0", 2),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_c_desc = {
+	.clks = imp_iic_wrap_c_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_c_clks),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_e_desc = {
+	.clks = imp_iic_wrap_e_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_e_clks),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_n_desc = {
+	.clks = imp_iic_wrap_n_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_n_clks),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_s_desc = {
+	.clks = imp_iic_wrap_s_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_s_clks),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_w_desc = {
+	.clks = imp_iic_wrap_w_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_w_clks),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_ws_desc = {
+	.clks = imp_iic_wrap_ws_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_ws_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_imp_iic_wrap[] = {
+	{
+		.compatible = "mediatek,mt8192-imp_iic_wrap_c",
+		.data = &imp_iic_wrap_c_desc,
+	}, {
+		.compatible = "mediatek,mt8192-imp_iic_wrap_e",
+		.data = &imp_iic_wrap_e_desc,
+	}, {
+		.compatible = "mediatek,mt8192-imp_iic_wrap_n",
+		.data = &imp_iic_wrap_n_desc,
+	}, {
+		.compatible = "mediatek,mt8192-imp_iic_wrap_s",
+		.data = &imp_iic_wrap_s_desc,
+	}, {
+		.compatible = "mediatek,mt8192-imp_iic_wrap_w",
+		.data = &imp_iic_wrap_w_desc,
+	}, {
+		.compatible = "mediatek,mt8192-imp_iic_wrap_ws",
+		.data = &imp_iic_wrap_ws_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_imp_iic_wrap_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-imp_iic_wrap",
+		.of_match_table = of_match_clk_mt8192_imp_iic_wrap,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_imp_iic_wrap_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
