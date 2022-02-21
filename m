Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 02:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYQQREtF6eAkp6eVZjdPft9Z4UAYAZNG1OtA3TSBL6Q=; b=HvxOluFtGl8nap
	Vr3HH2k6P+jOEk80KMOBhgRQlFlbRkft/2fy/aOcHJyJn3Gxr7gur7wwJdZrc98Td455YdsU00UsG
	3addT/grknntU7SDlR6SzRmavxckTGXxd4XoX4m7J/8AfN3iGJIGGRhgaeRnpLJbTbf+6o30GIFnt
	KDOigSEGsZLuy7AVVEwu2s9mtbOC1D9QMMIk+cnxpFpBMWzrP5sT7sgXqhSZXk8iMKwWupCjPEBi5
	Vv3TNHBH0GoT+lc7gybMouFFOg1ubwPOqyrKSq+crzBR4aRFFzqCybQl5a6IQkJ7GC977Fnk8Mbep
	K3XQ1BWcH/H3/yByb7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLy1V-002tCp-1Q; Mon, 21 Feb 2022 02:01:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLy0n-002ssU-Ft; Mon, 21 Feb 2022 02:01:15 +0000
X-UUID: 78f42da346944528a52fd1b7129ad99b-20220220
X-UUID: 78f42da346944528a52fd1b7129ad99b-20220220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 204887379; Sun, 20 Feb 2022 19:01:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 17:59:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 21 Feb 2022 09:59:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Feb 2022 09:59:31 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v2 15/15] clk: mediatek: Add MT8186 ipesys clock support
Date: Mon, 21 Feb 2022 09:52:58 +0800
Message-ID: <20220221015258.913-16-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220221015258.913-1-chun-jie.chen@mediatek.com>
References: <20220221015258.913-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_180113_548382_14091793 
X-CRM114-Status: GOOD (  16.80  )
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

Add MT8186 ipesys clock controller which provides clock gate
control for Image Process Engine.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Makefile         |  2 +-
 drivers/clk/mediatek/clk-mt8186-ipe.c | 55 +++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-ipe.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 6902da61e150..caf2ce93d666 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -75,7 +75,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 				   clk-mt8186-apmixedsys.o clk-mt8186-imp_iic_wrap.o \
 				   clk-mt8186-mfg.o clk-mt8186-mm.o clk-mt8186-wpe.o \
 				   clk-mt8186-img.o clk-mt8186-vdec.o clk-mt8186-venc.o \
-				   clk-mt8186-cam.o clk-mt8186-mdp.o
+				   clk-mt8186-cam.o clk-mt8186-mdp.o clk-mt8186-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-ipe.c b/drivers/clk/mediatek/clk-mt8186-ipe.c
new file mode 100644
index 000000000000..a1cb56532da0
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-ipe.c
@@ -0,0 +1,55 @@
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
+static const struct mtk_gate_regs ipe_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IPE(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &ipe_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate ipe_clks[] = {
+	GATE_IPE(CLK_IPE_LARB19, "ipe_larb19", "top_ipe", 0),
+	GATE_IPE(CLK_IPE_LARB20, "ipe_larb20", "top_ipe", 1),
+	GATE_IPE(CLK_IPE_SMI_SUBCOM, "ipe_smi_subcom", "top_ipe", 2),
+	GATE_IPE(CLK_IPE_FD, "ipe_fd", "top_ipe", 3),
+	GATE_IPE(CLK_IPE_FE, "ipe_fe", "top_ipe", 4),
+	GATE_IPE(CLK_IPE_RSC, "ipe_rsc", "top_ipe", 5),
+	GATE_IPE(CLK_IPE_DPE, "ipe_dpe", "top_ipe", 6),
+	GATE_IPE(CLK_IPE_GALS_IPE, "ipe_gals_ipe", "top_img1", 8),
+};
+
+static const struct mtk_clk_desc ipe_desc = {
+	.clks = ipe_clks,
+	.num_clks = ARRAY_SIZE(ipe_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8186_ipe[] = {
+	{
+		.compatible = "mediatek,mt8186-ipesys",
+		.data = &ipe_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8186_ipe_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8186-ipe",
+		.of_match_table = of_match_clk_mt8186_ipe,
+	},
+};
+builtin_platform_driver(clk_mt8186_ipe_drv);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
