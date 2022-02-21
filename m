Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FE3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 02:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ouD1CSKYF1QuMilyLVMUetFtLpKJWpz6GO9jJi1P58=; b=Q3iW0SeX70lmKy
	suymsI/646pg/xUANwXwtFwB+u+BKvRwCQJsxkKfOoxxxe7iJpE0jztZC6DVDI3VnLo/nXtaJ9++F
	dEe6L7n+b2bYSssleMUzkZ4JadQf4eEw1kI+yTIQ1SRMKyDJGmo/SbLWwQSkEwyPG/9XSsBFZhFp+
	H00Bp9p4Qj65izhc4JqhCs2ia0vU1WTbLViNC2isnL6E80/33ipmLLK/MYT3cLHoEwuT7pzrAxmhF
	kyncIPg+zFb9ABjCv3++KgmPLAJ4Q89576bfF5Adw0Aen1fLl3OHaDExmw0LISkML8I/p57zN47cX
	ZHnr8tcOgu677TM7GUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLy7X-002wKz-7s; Mon, 21 Feb 2022 02:08:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLy12-002sze-71; Mon, 21 Feb 2022 02:01:30 +0000
X-UUID: 9794df79947044ecb739a6898e6b5865-20220220
X-UUID: 9794df79947044ecb739a6898e6b5865-20220220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 622042521; Sun, 20 Feb 2022 19:01:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 17:59:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 21 Feb 2022 09:59:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Feb 2022 09:59:18 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v2 10/15] clk: mediatek: Add MT8186 imgsys clock support
Date: Mon, 21 Feb 2022 09:52:53 +0800
Message-ID: <20220221015258.913-11-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220221015258.913-1-chun-jie.chen@mediatek.com>
References: <20220221015258.913-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_180128_309253_7B55F62C 
X-CRM114-Status: GOOD (  16.08  )
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

Add MT8186 imgsys clock controllers which provide clock gate
control for image IP blocks.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Makefile         |  3 +-
 drivers/clk/mediatek/clk-mt8186-img.c | 68 +++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8186-img.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index cb1087737007..09ede533bb4e 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -73,7 +73,8 @@ obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt8186-infra_ao.o \
 				   clk-mt8186-apmixedsys.o clk-mt8186-imp_iic_wrap.o \
-				   clk-mt8186-mfg.o clk-mt8186-mm.o clk-mt8186-wpe.o
+				   clk-mt8186-mfg.o clk-mt8186-mm.o clk-mt8186-wpe.o \
+				   clk-mt8186-img.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8186-img.c b/drivers/clk/mediatek/clk-mt8186-img.c
new file mode 100644
index 000000000000..6f15ce66a918
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8186-img.c
@@ -0,0 +1,68 @@
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
+static const struct mtk_gate_regs img_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMG(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &img_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate img1_clks[] = {
+	GATE_IMG(CLK_IMG1_LARB9_IMG1, "img1_larb9_img1", "top_img1", 0),
+	GATE_IMG(CLK_IMG1_LARB10_IMG1, "img1_larb10_img1", "top_img1", 1),
+	GATE_IMG(CLK_IMG1_DIP, "img1_dip", "top_img1", 2),
+	GATE_IMG(CLK_IMG1_GALS_IMG1, "img1_gals_img1", "top_img1", 12),
+};
+
+static const struct mtk_gate img2_clks[] = {
+	GATE_IMG(CLK_IMG2_LARB9_IMG2, "img2_larb9_img2", "top_img1", 0),
+	GATE_IMG(CLK_IMG2_LARB10_IMG2, "img2_larb10_img2", "top_img1", 1),
+	GATE_IMG(CLK_IMG2_MFB, "img2_mfb", "top_img1", 6),
+	GATE_IMG(CLK_IMG2_WPE, "img2_wpe", "top_img1", 7),
+	GATE_IMG(CLK_IMG2_MSS, "img2_mss", "top_img1", 8),
+	GATE_IMG(CLK_IMG2_GALS_IMG2, "img2_gals_img2", "top_img1", 12),
+};
+
+static const struct mtk_clk_desc img1_desc = {
+	.clks = img1_clks,
+	.num_clks = ARRAY_SIZE(img1_clks),
+};
+
+static const struct mtk_clk_desc img2_desc = {
+	.clks = img2_clks,
+	.num_clks = ARRAY_SIZE(img2_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8186_img[] = {
+	{
+		.compatible = "mediatek,mt8186-imgsys1",
+		.data = &img1_desc,
+	}, {
+		.compatible = "mediatek,mt8186-imgsys2",
+		.data = &img2_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8186_img_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8186-img",
+		.of_match_table = of_match_clk_mt8186_img,
+	},
+};
+builtin_platform_driver(clk_mt8186_img_drv);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
