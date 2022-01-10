Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3026BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+wnN3wQ0fXDP1Mf2DzsJ0G0RtXrLky2AsitB4j6TYw=; b=uJgGvhsSDp9FvD
	rgatVqs9D0pyXJUrP2hguRbHrfP7F2K+IXoBBhMZtKu/Ew8CeD5xGM9I763xAjlohYEAwwQspEXmK
	xlEM355/locGo6tNo7tyTbxsiv482udOv3hQ5voAKVulowQZUbcg3w1zuVGBrcmcpsgwSlu9lL/uY
	t+TrZkOlZbUMeF593Acd2+1PyZzibxwKozGzTcuauY5MuLA6yhIY3MeuFiFmWSrhiSFb06/eR8DtV
	cTNy0DM083FJx3f++XSczNr3wUJ9s3Sj538Ua1XILXcVlUMIHBZuFfo6dmQd6wwapDPOBGRutBAqf
	K0DvvHbygtKRu5mnt8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6v8R-00Bf7d-1c; Mon, 10 Jan 2022 13:54:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6v85-00Bf1K-KK; Mon, 10 Jan 2022 13:54:35 +0000
X-UUID: 644bc1dfd91f443298f2bf3ea553e339-20220110
X-UUID: 644bc1dfd91f443298f2bf3ea553e339-20220110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 820523366; Mon, 10 Jan 2022 06:54:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 05:45:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 10 Jan 2022 21:45:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 21:45:00 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v1 14/16] clk: mediatek: Add MT8186 camsys clock support
Date: Mon, 10 Jan 2022 21:44:14 +0800
Message-ID: <20220110134416.5191-15-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_055433_695220_7D2EBB98 
X-CRM114-Status: GOOD (  16.15  )
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

Add MT8186 camsys clock controllers which provide clock gate
control for camera IP blocks.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Makefile         |  3 +-
 drivers/clk/mediatek/clk-mt8186-cam.c | 89 +++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-cam.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index c5d5a10734d0..9190e17602eb 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -70,7 +70,8 @@ obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o \
 				   clk-mt8186-apmixedsys.o clk-mt8186-imp_iic_wrap.o \
 				   clk-mt8186-mfg.o clk-mt8186-mm.o clk-mt8186-wpe.o \
-				   clk-mt8186-img.o clk-mt8186-vdec.o clk-mt8186-venc.o
+				   clk-mt8186-img.o clk-mt8186-vdec.o clk-mt8186-venc.o \
+				   clk-mt8186-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-cam.c b/drivers/clk/mediatek/clk-mt8186-cam.c
new file mode 100644
index 000000000000..5552fe5d428f
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-cam.c
@@ -0,0 +1,89 @@
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
+static const struct mtk_gate_regs cam_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &cam_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate cam_clks[] = {
+	GATE_CAM(CLK_CAM_LARB13, "cam_larb13", "top_cam", 0),
+	GATE_CAM(CLK_CAM_DFP_VAD, "cam_dfp_vad", "top_cam", 1),
+	GATE_CAM(CLK_CAM_LARB14, "cam_larb14", "top_cam", 2),
+	GATE_CAM(CLK_CAM, "cam", "top_cam", 6),
+	GATE_CAM(CLK_CAMTG, "camtg", "top_cam", 7),
+	GATE_CAM(CLK_CAM_SENINF, "cam_seninf", "top_cam", 8),
+	GATE_CAM(CLK_CAMSV1, "camsv1", "top_cam", 10),
+	GATE_CAM(CLK_CAMSV2, "camsv2", "top_cam", 11),
+	GATE_CAM(CLK_CAMSV3, "camsv3", "top_cam", 12),
+	GATE_CAM(CLK_CAM_CCU0, "cam_ccu0", "top_cam", 13),
+	GATE_CAM(CLK_CAM_CCU1, "cam_ccu1", "top_cam", 14),
+	GATE_CAM(CLK_CAM_MRAW0, "cam_mraw0", "top_cam", 15),
+	GATE_CAM(CLK_CAM_FAKE_ENG, "cam_fake_eng", "top_cam", 17),
+	GATE_CAM(CLK_CAM_CCU_GALS, "cam_ccu_gals", "top_cam", 18),
+	GATE_CAM(CLK_CAM2MM_GALS, "cam2mm_gals", "top_cam", 19),
+};
+
+static const struct mtk_gate cam_rawa_clks[] = {
+	GATE_CAM(CLK_CAM_RAWA_LARBX_RAWA, "cam_rawa_larbx_rawa", "top_cam", 0),
+	GATE_CAM(CLK_CAM_RAWA, "cam_rawa", "top_cam", 1),
+	GATE_CAM(CLK_CAM_RAWA_CAMTG_RAWA, "cam_rawa_camtg_rawa", "top_cam", 2),
+};
+
+static const struct mtk_gate cam_rawb_clks[] = {
+	GATE_CAM(CLK_CAM_RAWB_LARBX_RAWB, "cam_rawb_larbx_rawb", "top_cam", 0),
+	GATE_CAM(CLK_CAM_RAWB, "cam_rawb", "top_cam", 1),
+	GATE_CAM(CLK_CAM_RAWB_CAMTG_RAWB, "cam_rawb_camtg_rawb", "top_cam", 2),
+};
+
+static const struct mtk_clk_desc cam_desc = {
+	.clks = cam_clks,
+	.num_clks = ARRAY_SIZE(cam_clks),
+};
+
+static const struct mtk_clk_desc cam_rawa_desc = {
+	.clks = cam_rawa_clks,
+	.num_clks = ARRAY_SIZE(cam_rawa_clks),
+};
+
+static const struct mtk_clk_desc cam_rawb_desc = {
+	.clks = cam_rawb_clks,
+	.num_clks = ARRAY_SIZE(cam_rawb_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8186_cam[] = {
+	{
+		.compatible = "mediatek,mt8186-camsys",
+		.data = &cam_desc,
+	}, {
+		.compatible = "mediatek,mt8186-camsys_rawa",
+		.data = &cam_rawa_desc,
+	}, {
+		.compatible = "mediatek,mt8186-camsys_rawb",
+		.data = &cam_rawb_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8186_cam_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8186-cam",
+		.of_match_table = of_match_clk_mt8186_cam,
+	},
+};
+builtin_platform_driver(clk_mt8186_cam_drv);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
