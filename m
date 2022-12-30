Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AB1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 07:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Li01CMmpN2fnm9Fn+HCZl5UfJpp4ocXLI+nhOFMxqnw=; b=wMKM7Q6XqRoTQLFG8qQmvEPdaV
	QO+ZyX8tSjdfteXl7HRhXvOy2x/BXjFXsBJyxNugERNGgEjryKagWls+qDtBlk8nARpEbzz3IX9tl
	/wm9Y7zyzG7q6OjAnq9232KjcVE3h0nct3rEFtdy0nOKXWsPzWVfLfMNydpa31aXCLsSWDqZk1lhl
	dMJWBHPNrMaGp9ULV9jSev0ashclcz5kT/ImHAULoQkyfbPSkXz5n4t+4J9UOkU0DQO/CqAS1MuTc
	2ya2/nTXkM3RcaUQJ18M09SkxC8qfzhUvwfbc/0R+H4CQvGFIfa9LesnLZiZ4398yv9/wU+BnVhxi
	eHXDlK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBA3o-007039-9a; Fri, 30 Dec 2022 07:44:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB9ui-006ve3-Fz; Fri, 30 Dec 2022 07:34:54 +0000
X-UUID: f2bd5bb870914c7f9281d8b8e78059a2-20221230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Li01CMmpN2fnm9Fn+HCZl5UfJpp4ocXLI+nhOFMxqnw=;
	b=AKxzDqgD58lPKY7P7auhn0GukevUWEh+6qlyzzO3bDMcLJs4/QD6tIrannj7Z6Y1oH78vvaj+geYr6gI0dRRKo08NmdZD56bSEQlHtBLqWWVrMAF4wazs3OZ0/2TLJfqHkRyUBpu0+9SC389Z+H7XDkRAzsaxl+rjDo/qyIzgws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:65f13ad3-5594-4879-8e69-fcf2e0bb7202,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:09771b1,CLOUDID:9e173953-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: f2bd5bb870914c7f9281d8b8e78059a2-20221230
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 388957665; Fri, 30 Dec 2022 00:34:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Dec 2022 15:34:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Dec 2022 15:34:02 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v3 19/19] clk: mediatek: Add MT8188 adsp clock support
Date: Fri, 30 Dec 2022 15:33:57 +0800
Message-ID: <20221230073357.18503-20-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
References: <20221230073357.18503-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_233448_632987_460CB5F1 
X-CRM114-Status: GOOD (  15.60  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8188 adsp clock controller which provides clock gate
control for Audio DSP.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile                 |  2 +-
 .../clk/mediatek/clk-mt8188-adsp_audio26m.c   | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 8befaedfdd3d..b56ae9bee1d8 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -89,7 +89,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
 				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
 				   clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o \
 				   clk-mt8188-vpp0.o clk-mt8188-vpp1.o clk-mt8188-wpe.o \
-				   clk-mt8188-imp_iic_wrap.o
+				   clk-mt8188-imp_iic_wrap.o clk-mt8188-adsp_audio26m.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
new file mode 100644
index 000000000000..f91381a1316c
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Garmin Chang <garmin.chang@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs adsp_audio26m_cg_regs = {
+	.set_ofs = 0x80,
+	.clr_ofs = 0x80,
+	.sta_ofs = 0x80,
+};
+
+#define GATE_ADSP_FLAGS(_id, _name, _parent, _shift)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &adsp_audio26m_cg_regs, _shift,		\
+		&mtk_clk_gate_ops_no_setclr, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate adsp_audio26m_clks[] = {
+	GATE_ADSP_FLAGS(CLK_AUDIODSP_AUDIO26M, "audiodsp_audio26m", "clk26m", 3),
+};
+
+static const struct mtk_clk_desc adsp_audio26m_desc = {
+	.clks = adsp_audio26m_clks,
+	.num_clks = ARRAY_SIZE(adsp_audio26m_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_adsp_audio26m[] = {
+	{ .compatible = "mediatek,mt8188-adsp-audio26m", .data = &adsp_audio26m_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_adsp_audio26m_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-adsp_audio26m",
+		.of_match_table = of_match_clk_mt8188_adsp_audio26m,
+	},
+};
+builtin_platform_driver(clk_mt8188_adsp_audio26m_drv);
-- 
2.18.0


