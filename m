Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608AAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 01:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5LehTk0G3T0/cIStro3CvNRfeRe89E884o+E1FhOaQ=; b=S7yNn8h6uAOb3f
	EPX7nsQkDmk9zvuSutjVWjnFoAHi0BNdsYIBqqQoyzv71oIw1pdPYEt7LWeJM8lOSRaoPfrS7KSwz
	ZWyk1axXUWHLk8pThLFMFTnRoB2gT5uP1H1JxT9G5lDRQWtbNSyAk1J4EoufomPhkAMdf931m59Fo
	HmFobD5bbyfqPndWR+AEs8o35crdTPgdQo3NX6UyhfAs6huLmzi+mLDKSPrtH6aJQ7eNuUn3lLEmr
	t/Q94s/3XUOUFOxaNIPI2waG5VncRdAjTapElC2pnStlVUhRn97/KmVpPzy8r9ozXZ19FgnaPaZUp
	ABDEzRdhIYuzVOBwz0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLxzG-002rwi-Vt; Mon, 21 Feb 2022 01:59:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLxz4-002rsL-FJ; Mon, 21 Feb 2022 01:59:28 +0000
X-UUID: e981871779e8405cac98d72e73b6e34f-20220220
X-UUID: e981871779e8405cac98d72e73b6e34f-20220220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1007440333; Sun, 20 Feb 2022 18:59:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 17:59:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 21 Feb 2022 09:59:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Feb 2022 09:59:11 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v2 07/15] clk: mediatek: Add MT8186 mfgsys clock support
Date: Mon, 21 Feb 2022 09:52:50 +0800
Message-ID: <20220221015258.913-8-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220221015258.913-1-chun-jie.chen@mediatek.com>
References: <20220221015258.913-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_175926_537565_3051B999 
X-CRM114-Status: GOOD (  16.53  )
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

Add MT8186 mfg clock controller which provides clock gate
control for GPU.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Makefile         |  3 +-
 drivers/clk/mediatek/clk-mt8186-mfg.c | 48 +++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mfg.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 3510e8a0ecac..86e4f4d61688 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -72,7 +72,8 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o \
-				   clk-mt8186-apmixedsys.o clk-mt8186-imp_iic_wrap.o
+				   clk-mt8186-apmixedsys.o clk-mt8186-imp_iic_wrap.o \
+				   clk-mt8186-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-mfg.c b/drivers/clk/mediatek/clk-mt8186-mfg.c
new file mode 100644
index 000000000000..8ecb489a7fe0
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-mfg.c
@@ -0,0 +1,48 @@
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
+static const struct mtk_gate_regs mfg_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_MFG(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate mfg_clks[] = {
+	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "top_mfg", 0),
+};
+
+static const struct mtk_clk_desc mfg_desc = {
+	.clks = mfg_clks,
+	.num_clks = ARRAY_SIZE(mfg_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8186_mfg[] = {
+	{
+		.compatible = "mediatek,mt8186-mfgsys",
+		.data = &mfg_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8186_mfg_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8186-mfg",
+		.of_match_table = of_match_clk_mt8186_mfg,
+	},
+};
+builtin_platform_driver(clk_mt8186_mfg_drv);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
