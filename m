Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CF6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 02:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwWkks3xWmUaXk8om1XpH0D0k2Pw1txzmXqH3/aTpgc=; b=KobRREYqz4Obfa
	nqoQT4h4BgKCgIufItayWpg5+oSf178SZT1Ui3LrFXtu9vYbvMoVdZ+0BUKguEK+vfFmFXHsmzV77
	xxQ1LcFE9i48eyJDPx/n6LaFRVDU/YpE6BQI+Mr6XOew4+waqr/fjxOVv5W24Q66crpXC5p5W7XZ9
	mzIuJN73CInkutpZw3lLgVUksp+kEH5u6Ee/4AdZ+9jjDYEM69lw5g8uNKXQ8panEiVokTHZrHAOc
	YJZfcx0gmA4jm5jbr8Guf8YLMAxpWILw44plDoQAKMnPj+qRBd3cNdrHtZQ8NkRor+Kwlg4MNgsQX
	pgWx5p1PCO2NQiVHYkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLy19-002t57-FH; Mon, 21 Feb 2022 02:01:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLy0m-002srj-Fx; Mon, 21 Feb 2022 02:01:14 +0000
X-UUID: 7920e93df61b4a9bbcba7755a1de70cb-20220220
X-UUID: 7920e93df61b4a9bbcba7755a1de70cb-20220220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2066494686; Sun, 20 Feb 2022 19:01:09 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 17:59:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 21 Feb 2022 09:59:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Feb 2022 09:59:08 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v2 06/15] clk: mediatek: Add MT8186 imp i2c wrapper clock
 support
Date: Mon, 21 Feb 2022 09:52:49 +0800
Message-ID: <20220221015258.913-7-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220221015258.913-1-chun-jie.chen@mediatek.com>
References: <20220221015258.913-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_180112_561040_2E8F8E86 
X-CRM114-Status: GOOD (  16.40  )
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

Add MT8186 imp i2c wrapper clock controllers which provide clock gate
control in i2c IP blocks.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Makefile                 |  2 +-
 .../clk/mediatek/clk-mt8186-imp_iic_wrap.c    | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 54ef957389ef..3510e8a0ecac 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -72,7 +72,7 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o \
-				   clk-mt8186-apmixedsys.o
+				   clk-mt8186-apmixedsys.o clk-mt8186-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
new file mode 100644
index 000000000000..927cbd6508a6
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mt8186-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &imp_iic_wrap_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate imp_iic_wrap_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C0,
+		"imp_iic_wrap_ap_clock_i2c0", "infra_ao_i2c_ap", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C1,
+		"imp_iic_wrap_ap_clock_i2c1", "infra_ao_i2c_ap", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C2,
+		"imp_iic_wrap_ap_clock_i2c2", "infra_ao_i2c_ap", 2),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C3,
+		"imp_iic_wrap_ap_clock_i2c3", "infra_ao_i2c_ap", 3),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C4,
+		"imp_iic_wrap_ap_clock_i2c4", "infra_ao_i2c_ap", 4),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C5,
+		"imp_iic_wrap_ap_clock_i2c5", "infra_ao_i2c_ap", 5),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C6,
+		"imp_iic_wrap_ap_clock_i2c6", "infra_ao_i2c_ap", 6),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C7,
+		"imp_iic_wrap_ap_clock_i2c7", "infra_ao_i2c_ap", 7),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C8,
+		"imp_iic_wrap_ap_clock_i2c8", "infra_ao_i2c_ap", 8),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C9,
+		"imp_iic_wrap_ap_clock_i2c9", "infra_ao_i2c_ap", 9),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_desc = {
+	.clks = imp_iic_wrap_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8186_imp_iic_wrap[] = {
+	{
+		.compatible = "mediatek,mt8186-imp_iic_wrap",
+		.data = &imp_iic_wrap_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8186_imp_iic_wrap_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8186-imp_iic_wrap",
+		.of_match_table = of_match_clk_mt8186_imp_iic_wrap,
+	},
+};
+builtin_platform_driver(clk_mt8186_imp_iic_wrap_drv);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
