Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5360C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 22:59:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 975CF613C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 22:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 975CF613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9T3LDfmtR/tJ0fsBCj6i4rNo36aK2recb/cMVY2thg=; b=0bS+wzE7ZRlge7
	coR+wQ5CxfVLVAnEbBNIGfm6CrBQOIT0uB/ITRtnVzptEJBt5Yhhp1qomJvBAIfhidDNnaK1uINSW
	Aqf18SnjAKIV0otcNkw7AIsXIjH7bs0U1POkZ5Ol4VBd63W24opl71EsfwVxrItxONgPGTF6ygYrB
	tbzzmPuNxatzayucUB2T2Z9lwwa+Y8KtCWV46dbVTfsRIQ2y53GR4GkWhHfx6hK7HiNWPCOBEs1aZ
	Dz04+wGUdtUJMUonDgm/txHAsxWbFvIxq5CWnJ1K5vNWur+ProfOPTXy35Vbo/z4XemCCplLLpdHU
	AeyC1xhjG5oIR7CGTttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteVI-007xIl-DY; Wed, 16 Jun 2021 22:59:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteVE-007xGv-Lu; Wed, 16 Jun 2021 22:59:22 +0000
X-UUID: 450374106b324c99815b8838f13296b8-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=h5HvuN1N5Vyi/+NaJ98gWwL1raHF/34VKMUDd42j4m0=; 
 b=kRgl9LVrxEuq1aiPg8jVJX9gImGVic2s+x59P85XOr8qyHRJER/IxluyA3uKPCkxdjgyk2RJHSjSttEXV1gMjNBrRoNOEEqHMj/b2gI8BuHXFJlysQ2z47/s+IljdTQL2X1Y1rNXXO1e007rmKq/gMZQoFnxYbVOKMdrq1jB1VQ=;
X-UUID: 450374106b324c99815b8838f13296b8-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 314006750; Wed, 16 Jun 2021 15:59:19 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:50:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:50:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 06:50:49 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH 21/22] clk: mediatek: Add MT8195 imp i2c wrapper clock support
Date: Thu, 17 Jun 2021 06:47:42 +0800
Message-ID: <20210616224743.5109-22-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_155920_772607_9335C2D6 
X-CRM114-Status: GOOD (  16.59  )
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

Add MT8195 imp i2c wrapper clock providers

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig                  |  6 ++
 drivers/clk/mediatek/Makefile                 |  1 +
 .../clk/mediatek/clk-mt8195-imp_iic_wrap.c    | 68 +++++++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 5089bacdf0a5..ade85a52b7ed 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -684,6 +684,12 @@ config COMMON_CLK_MT8195_WPESYS
 	help
 	  This driver supports MediaTek MT8195 wpesys clocks.
 
+config COMMON_CLK_MT8195_IMP_IIC_WRAP
+	bool "Clock driver for MediaTek MT8195 imp_iic_wrap"
+	depends on COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 imp_iic_wrap clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 32cfb0030d92..b10c6267ba98 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -97,5 +97,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS0) += clk-mt8195-vpp0.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS1) += clk-mt8195-vpp1.o
 obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
+obj-$(CONFIG_COMMON_CLK_MT8195_IMP_IIC_WRAP) += clk-mt8195-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
new file mode 100644
index 000000000000..efb62f484bbe
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
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
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C5, "imp_iic_wrap_s_i2c5", "i2c_sel", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C6, "imp_iic_wrap_s_i2c6", "i2c_sel", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C7, "imp_iic_wrap_s_i2c7", "i2c_sel", 2),
+};
+
+static const struct mtk_gate imp_iic_wrap_w_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C0, "imp_iic_wrap_w_i2c0", "i2c_sel", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C1, "imp_iic_wrap_w_i2c1", "i2c_sel", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C2, "imp_iic_wrap_w_i2c2", "i2c_sel", 2),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C3, "imp_iic_wrap_w_i2c3", "i2c_sel", 3),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C4, "imp_iic_wrap_w_i2c4", "i2c_sel", 4),
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
+
+builtin_platform_driver(clk_mt8195_imp_iic_wrap_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
