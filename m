Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F16C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 02:27:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 179F960F44
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 02:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 179F960F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJVLP3OMoEz64cAh4a8982veQ2pxV/EE2P57rg1ZlQ4=; b=cQ51aHRp5N8Y6z
	38TVD+PkhCfEy4Pkv3NZ4AF6Gv2cIHicOGoDVP2USJNhjntzQ/Kt+e3Rdc8rmesL/cOgloZDoW+rs
	WL0PPW2GZ8Elcos+LExQGXeRNFGDy0XdOaW51sAAKcf3aMaWcoSS3jNeHJgwme+44c6+6niggY1oz
	TnFq3uVV0MRNJWE1LBrjZGCQDp1w0rSXMmtVT+gVruoo4w+s+yLgAA9HoVHR//IaR6XysXHqxxjHa
	i/thow6gy28CZdRp34uY0NlHlJJwBtwFhnYU+vl2lS0s2enFn3exVtqTfVakv4gCOdVLo+02XWRl7
	EIlJGzE/ggkeJZDeYOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPyAA-003qnU-CE; Tue, 14 Sep 2021 02:27:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPy9u-003qfn-68; Tue, 14 Sep 2021 02:26:55 +0000
X-UUID: 505ccabb1a5e4eebae2934f338f7f104-20210913
X-UUID: 505ccabb1a5e4eebae2934f338f7f104-20210913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 98143727; Mon, 13 Sep 2021 19:26:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Sep 2021 19:17:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 10:17:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 14 Sep 2021 10:17:44 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v3 23/24] clk: mediatek: Add MT8195 imp i2c wrapper clock support
Date: Tue, 14 Sep 2021 10:16:32 +0800
Message-ID: <20210914021633.26377-24-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_192654_274703_4B59DAEB 
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

Add MT8195 imp i2c wrapper clock controllers which provide clock gate
control in I2C IP blocks.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Makefile                 |  2 +-
 .../clk/mediatek/clk-mt8195-imp_iic_wrap.c    | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index b539cc4ef16f..3c602af49c0a 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -86,6 +86,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o
 				   clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
 				   clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o \
 				   clk-mt8195-venc.o clk-mt8195-vpp0.o clk-mt8195-vpp1.o \
-				   clk-mt8195-wpe.o
+				   clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
new file mode 100644
index 000000000000..0e2ac0a30aa0
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mt8195-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/mt8195-clk.h>
+
+static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate imp_iic_wrap_s_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C5, "imp_iic_wrap_s_i2c5", "top_i2c", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C6, "imp_iic_wrap_s_i2c6", "top_i2c", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C7, "imp_iic_wrap_s_i2c7", "top_i2c", 2),
+};
+
+static const struct mtk_gate imp_iic_wrap_w_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C0, "imp_iic_wrap_w_i2c0", "top_i2c", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C1, "imp_iic_wrap_w_i2c1", "top_i2c", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C2, "imp_iic_wrap_w_i2c2", "top_i2c", 2),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C3, "imp_iic_wrap_w_i2c3", "top_i2c", 3),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C4, "imp_iic_wrap_w_i2c4", "top_i2c", 4),
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
+static const struct of_device_id of_match_clk_mt8195_imp_iic_wrap[] = {
+	{
+		.compatible = "mediatek,mt8195-imp_iic_wrap_s",
+		.data = &imp_iic_wrap_s_desc,
+	}, {
+		.compatible = "mediatek,mt8195-imp_iic_wrap_w",
+		.data = &imp_iic_wrap_w_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8195_imp_iic_wrap_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8195-imp_iic_wrap",
+		.of_match_table = of_match_clk_mt8195_imp_iic_wrap,
+	},
+};
+builtin_platform_driver(clk_mt8195_imp_iic_wrap_drv);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
