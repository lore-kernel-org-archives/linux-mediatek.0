Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9275C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/CjiACNDY7iCMJ6HroeX4oXzZMy0RPZ5ik1hQTDMSo=; b=B1buZy7aW4kVk8
	yZssUNoLlWijmJTqWICrYG1gKqo4E2I9RPeWEJG9PhiRUCueB93UjMzPtf+uTG+ZcYKwgdkqNg223
	mA/812dBzhQAzzeno9/bW5ABG7HyrEdHGqKi/kK5BZdvT1Z1BODaPzYg7skMxWQoyi3Inu5235N0l
	XlRm8jV71K0DkIz/7JD3RKYKhDyzG7oRBaRI9Y+gqkHQejXABLtJDAwwclA7AC+1t7WQ+j+wC5qTo
	w86yYX7zE5h+yEjC7g3G2x47jsxGVtDIKn5ConUxa4aq2YbcV7TgJ5BaH/hgD8CFaKR/oH2NUTFyT
	Fo5IXf1PjfKhXIybMDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYp9l-008fvl-3q; Mon, 28 Mar 2022 13:11:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYp8x-008fgg-Gn; Mon, 28 Mar 2022 13:10:49 +0000
X-UUID: e6f54d80e9a94c50b09a4ae567751565-20220328
X-UUID: e6f54d80e9a94c50b09a4ae567751565-20220328
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 229494095; Mon, 28 Mar 2022 06:10:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 06:05:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 28 Mar 2022 21:05:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 28 Mar 2022 21:05:57 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v4 14/15] clk: mediatek: Add MT8186 mdpsys clock support
Date: Mon, 28 Mar 2022 21:05:20 +0800
Message-ID: <20220328130521.24385-15-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220328130521.24385-1-chun-jie.chen@mediatek.com>
References: <20220328130521.24385-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_061047_584616_848A2BEF 
X-CRM114-Status: GOOD (  15.58  )
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

Add MT8186 mdpsys clock controller which provides clock gate
control in Multimedia Data Path.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/Makefile         |  2 +-
 drivers/clk/mediatek/clk-mt8186-mdp.c | 80 +++++++++++++++++++++++++++
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mdp.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 3ad27f94eeef..6902da61e150 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -75,7 +75,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 				   clk-mt8186-apmixedsys.o clk-mt8186-imp_iic_wrap.o \
 				   clk-mt8186-mfg.o clk-mt8186-mm.o clk-mt8186-wpe.o \
 				   clk-mt8186-img.o clk-mt8186-vdec.o clk-mt8186-venc.o \
-				   clk-mt8186-cam.o
+				   clk-mt8186-cam.o clk-mt8186-mdp.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-mdp.c b/drivers/clk/mediatek/clk-mt8186-mdp.c
new file mode 100644
index 000000000000..05174088ef20
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-mdp.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mt8186-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs mdp0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mdp2_cg_regs = {
+	.set_ofs = 0x124,
+	.clr_ofs = 0x128,
+	.sta_ofs = 0x120,
+};
+
+#define GATE_MDP0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &mdp0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MDP2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &mdp2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate mdp_clks[] = {
+	/* MDP0 */
+	GATE_MDP0(CLK_MDP_RDMA0, "mdp_rdma0", "top_mdp", 0),
+	GATE_MDP0(CLK_MDP_TDSHP0, "mdp_tdshp0", "top_mdp", 1),
+	GATE_MDP0(CLK_MDP_IMG_DL_ASYNC0, "mdp_img_dl_async0", "top_mdp", 2),
+	GATE_MDP0(CLK_MDP_IMG_DL_ASYNC1, "mdp_img_dl_async1", "top_mdp", 3),
+	GATE_MDP0(CLK_MDP_DISP_RDMA, "mdp_disp_rdma", "top_mdp", 4),
+	GATE_MDP0(CLK_MDP_HMS, "mdp_hms", "top_mdp", 5),
+	GATE_MDP0(CLK_MDP_SMI0, "mdp_smi0", "top_mdp", 6),
+	GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "top_mdp", 7),
+	GATE_MDP0(CLK_MDP_WROT0, "mdp_wrot0", "top_mdp", 8),
+	GATE_MDP0(CLK_MDP_RSZ0, "mdp_rsz0", "top_mdp", 9),
+	GATE_MDP0(CLK_MDP_HDR0, "mdp_hdr0", "top_mdp", 10),
+	GATE_MDP0(CLK_MDP_MUTEX0, "mdp_mutex0", "top_mdp", 11),
+	GATE_MDP0(CLK_MDP_WROT1, "mdp_wrot1", "top_mdp", 12),
+	GATE_MDP0(CLK_MDP_RSZ1, "mdp_rsz1", "top_mdp", 13),
+	GATE_MDP0(CLK_MDP_FAKE_ENG0, "mdp_fake_eng0", "top_mdp", 14),
+	GATE_MDP0(CLK_MDP_AAL0, "mdp_aal0", "top_mdp", 15),
+	GATE_MDP0(CLK_MDP_DISP_WDMA, "mdp_disp_wdma", "top_mdp", 16),
+	GATE_MDP0(CLK_MDP_COLOR, "mdp_color", "top_mdp", 17),
+	GATE_MDP0(CLK_MDP_IMG_DL_ASYNC2, "mdp_img_dl_async2", "top_mdp", 18),
+	/* MDP2 */
+	GATE_MDP2(CLK_MDP_IMG_DL_RELAY0_ASYNC0, "mdp_img_dl_rel0_as0", "top_mdp", 0),
+	GATE_MDP2(CLK_MDP_IMG_DL_RELAY1_ASYNC1, "mdp_img_dl_rel1_as1", "top_mdp", 8),
+	GATE_MDP2(CLK_MDP_IMG_DL_RELAY2_ASYNC2, "mdp_img_dl_rel2_as2", "top_mdp", 24),
+};
+
+static const struct mtk_clk_desc mdp_desc = {
+	.clks = mdp_clks,
+	.num_clks = ARRAY_SIZE(mdp_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8186_mdp[] = {
+	{
+		.compatible = "mediatek,mt8186-mdpsys",
+		.data = &mdp_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8186_mdp_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8186-mdp",
+		.of_match_table = of_match_clk_mt8186_mdp,
+	},
+};
+builtin_platform_driver(clk_mt8186_mdp_drv);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
