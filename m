Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119DBC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 13:13:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF10D2312E
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 13:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF10D2312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mpG6oELV/pJi5GDkvaVDtP9fWvGEfF5DJL2esckpHqY=; b=ZbDbqhXVUQpD9ZP75ebi+5gSK
	mNDBVdaXd76xhifOWG49Ia32m8PyRyi4l/lIohPyJY4FH741ltAWT7N3fCiGTetzG5NbzFENe7MAv
	Ks12+tOdn+pyLt+TLi8Sr5NNzsp41X1CoCq9aFmu5ZIaaVs/cg0GPg9cJVP/scaRE0Jg3hr8F1EI/
	yPNzan/Q1u2ma8+UJUPd/vSD2SLqjhY+MvtgBKnaPi39hKgShhj/EzgztZ/WIkX+vMDlDb9U0KyTM
	heZD8uTQf+O09DBDrD6Uez2GfuCLgbmFNexJjOw1E8bJNgobwaTak0Q79CWHXvzlOVFPSXAymITCU
	KNFgRrdEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krhT7-00031r-Uh; Tue, 22 Dec 2020 13:12:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krhQu-0001mV-Qv; Tue, 22 Dec 2020 13:10:34 +0000
X-UUID: 97498630d4b94ce7bfc3f552e273d0cf-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rqzjSrs16WT8Fy2dnILPvvmpIilJnPqv6SaHqtUyJBQ=; 
 b=pTxFRycDbBejGJOoNhwTJsVEe5FrGrt3Wwx4tKo7exXqKhFrqDS8xC84ak2NekP2viDrV0GKWDAK5Mk3ByQqoMqAyPAe79b4hlg3zUp3cz8EOYqOsHXQZvfp+eq0WCfYu2IHFdW9sGllRyGr3QUuX4KoTtOlfdyploBaRoXFT7U=;
X-UUID: 97498630d4b94ce7bfc3f552e273d0cf-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1399939859; Tue, 22 Dec 2020 05:10:03 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 05:09:56 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 21:09:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Dec 2020 21:09:50 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v6 12/22] clk: mediatek: Add MT8192 camsys clock support
Date: Tue, 22 Dec 2020 21:09:37 +0800
Message-ID: <1608642587-15634-13-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_081033_070151_6010A4D4 
X-CRM114-Status: GOOD (  16.95  )
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
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 camsys and camsys raw clock providers

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |   6 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8192-cam.c | 107 ++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 1a8b0c1..a75b7ec 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -503,6 +503,12 @@ config COMMON_CLK_MT8192_AUDSYS
 	help
 	  This driver supports MediaTek MT8192 audsys clocks.
 
+config COMMON_CLK_MT8192_CAMSYS
+	bool "Clock driver for MediaTek MT8192 camsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 camsys and camsys_raw clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 1d0f2e8..94bf7a0 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -69,5 +69,6 @@ obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
+obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-cam.c b/drivers/clk/mediatek/clk-mt8192-cam.c
new file mode 100644
index 0000000..549ea8e
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-cam.c
@@ -0,0 +1,107 @@
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
+static const struct mtk_gate_regs cam_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_CAM(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &cam_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate cam_clks[] = {
+	GATE_CAM(CLK_CAM_LARB13, "cam_larb13", "cam_sel", 0),
+	GATE_CAM(CLK_CAM_DFP_VAD, "cam_dfp_vad", "cam_sel", 1),
+	GATE_CAM(CLK_CAM_LARB14, "cam_larb14", "cam_sel", 2),
+	GATE_CAM(CLK_CAM_CAM, "cam_cam", "cam_sel", 6),
+	GATE_CAM(CLK_CAM_CAMTG, "cam_camtg", "cam_sel", 7),
+	GATE_CAM(CLK_CAM_SENINF, "cam_seninf", "cam_sel", 8),
+	GATE_CAM(CLK_CAM_CAMSV0, "cam_camsv0", "cam_sel", 9),
+	GATE_CAM(CLK_CAM_CAMSV1, "cam_camsv1", "cam_sel", 10),
+	GATE_CAM(CLK_CAM_CAMSV2, "cam_camsv2", "cam_sel", 11),
+	GATE_CAM(CLK_CAM_CAMSV3, "cam_camsv3", "cam_sel", 12),
+	GATE_CAM(CLK_CAM_CCU0, "cam_ccu0", "cam_sel", 13),
+	GATE_CAM(CLK_CAM_CCU1, "cam_ccu1", "cam_sel", 14),
+	GATE_CAM(CLK_CAM_MRAW0, "cam_mraw0", "cam_sel", 15),
+	GATE_CAM(CLK_CAM_FAKE_ENG, "cam_fake_eng", "cam_sel", 17),
+	GATE_CAM(CLK_CAM_CCU_GALS, "cam_ccu_gals", "cam_sel", 18),
+	GATE_CAM(CLK_CAM_CAM2MM_GALS, "cam2mm_gals", "cam_sel", 19),
+};
+
+static const struct mtk_gate cam_rawa_clks[] = {
+	GATE_CAM(CLK_CAM_RAWA_LARBX, "cam_rawa_larbx", "cam_sel", 0),
+	GATE_CAM(CLK_CAM_RAWA_CAM, "cam_rawa_cam", "cam_sel", 1),
+	GATE_CAM(CLK_CAM_RAWA_CAMTG, "cam_rawa_camtg", "cam_sel", 2),
+};
+
+static const struct mtk_gate cam_rawb_clks[] = {
+	GATE_CAM(CLK_CAM_RAWB_LARBX, "cam_rawb_larbx", "cam_sel", 0),
+	GATE_CAM(CLK_CAM_RAWB_CAM, "cam_rawb_cam", "cam_sel", 1),
+	GATE_CAM(CLK_CAM_RAWB_CAMTG, "cam_rawb_camtg", "cam_sel", 2),
+};
+
+static const struct mtk_gate cam_rawc_clks[] = {
+	GATE_CAM(CLK_CAM_RAWC_LARBX, "cam_rawc_larbx", "cam_sel", 0),
+	GATE_CAM(CLK_CAM_RAWC_CAM, "cam_rawc_cam", "cam_sel", 1),
+	GATE_CAM(CLK_CAM_RAWC_CAMTG, "cam_rawc_camtg", "cam_sel", 2),
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
+static const struct mtk_clk_desc cam_rawc_desc = {
+	.clks = cam_rawc_clks,
+	.num_clks = ARRAY_SIZE(cam_rawc_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_cam[] = {
+	{
+		.compatible = "mediatek,mt8192-camsys",
+		.data = &cam_desc,
+	}, {
+		.compatible = "mediatek,mt8192-camsys_rawa",
+		.data = &cam_rawa_desc,
+	}, {
+		.compatible = "mediatek,mt8192-camsys_rawb",
+		.data = &cam_rawb_desc,
+	}, {
+		.compatible = "mediatek,mt8192-camsys_rawc",
+		.data = &cam_rawc_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_cam_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-cam",
+		.of_match_table = of_match_clk_mt8192_cam,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_cam_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
