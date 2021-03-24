Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9F7C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 10:43:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D6D461A06
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 10:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D6D461A06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A9EdoEeprc6MHokiJmaL1upAbNXtEU9DkhRqVHQDpLg=; b=WDsXy3wPdcwgVFlAKwz5iG6Cr
	mCy/5tAB2+4VjawKihrDIFdiu9Bu2iXyzOKf5l3LaYElqXX37Wztxuz018DAGMuYHp9tEhQGTBNWK
	DRFHGMWzCK8SL3liXVX2thse66irBvADMu31Zyg6Nztos9w6x6l3ivo3vy1KDM6k5m0zVPEZDNIfq
	pEo8dZHitGsDEQGHUzrqXuTBtzZcLstAdBprc/8KRczqubqt7/d02NPnz/yEja6weqO8r5gMuULVN
	xO6oY6io5FTkrF2YYlOvjt2eu7kn1+qI4ZLmihN/xbN/Wt6BwzAYXA/oVwZ6Ktq5zPQ1PdDpg8s/x
	v/1Rl5OSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP0yW-00Gs2R-PF; Wed, 24 Mar 2021 10:42:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP0xJ-00Grac-Qc; Wed, 24 Mar 2021 10:41:45 +0000
X-UUID: 30f83f839ae048559a51a2c0db133137-20210324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oahL73qbenAUWudlUY1MQm+jWSPELhvs76nSyszVTZs=; 
 b=lwlCJdXWBQr/SvbooiTvCRzoLfciJSAFWnlVLYN98nFq1P7wDbQPj8clUxA2eoprQcEmwKwdu1VLum7MAXyH7fI645xh/8d9BpqgoNeTceuaTl+xMBcXzAkvfuY569jGN7H3Bq/URl3keKmn4Du4P9zzYW7JgM5AP/XetG5Ylqo=;
X-UUID: 30f83f839ae048559a51a2c0db133137-20210324
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 310928949; Wed, 24 Mar 2021 02:41:28 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 03:41:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 18:41:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 24 Mar 2021 18:41:26 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [RESEND PATCH v7 12/22] clk: mediatek: Add MT8192 camsys clock support
Date: Wed, 24 Mar 2021 18:41:00 +0800
Message-ID: <20210324104110.13383-13-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210324104110.13383-1-chun-jie.chen@mediatek.com>
References: <20210324104110.13383-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_104142_775177_6564844B 
X-CRM114-Status: GOOD (  16.91  )
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

Add MT8192 camsys and camsys raw clock providers

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |   6 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8192-cam.c | 107 ++++++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-cam.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 909f423d7c4c..a39a4c201c9e 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -514,6 +514,12 @@ config COMMON_CLK_MT8192_AUDSYS
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
index 1d0f2e8e9661..94bf7a03fd88 100644
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
index 000000000000..549ea8e9ef44
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
