Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34331C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 10:17:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FE3261222
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 10:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FE3261222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NFD4UvRQnDVBRP2PR/VZaJXu8skHaQBdbysslepG7do=; b=pn/lsf9Tia9zUcPvMxWhQQWhB
	4rzfL6NF+k5gY+8Mjti7e3Aw8XTXIV6rirupEnOcilHrQpTfEiM11BFYTWUiSgqQERKLjcI7ZuaZk
	wd+95Ld6sYi+Gu9YcQHx1IUWxaoWLM3xy0K/WG1WO9A3kt00B4+ojOi8bB+mp5fMfmUESEcq3RvPw
	9XJBysInZ3QNv07kXF61QajjOnXx9jZ6tR8V90RJqK14ZmJU8/9nF5BLcdwbu1IizbqcCFW8Yx1mF
	yGPtR+3Ut3l/y02MAclUqX0vNqmZnyJNDVolD/Umsw8eYUxN79D/1cUYiTi1DmtVaUHICGNK2i0wN
	y6XUNUG2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leEaf-000so0-P2; Wed, 05 May 2021 10:17:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leEXT-000rPF-QR; Wed, 05 May 2021 10:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=65TzO4B3Lyw7xKP2kuTPN358Azva5PvIYjTfwmEVUGQ=; b=Om0cJE3Y1fOHNqnhFu1aDTQopt
 dltY96TN7WAdu9A3a05IfFmLdnkhO1LXMj9iM+BXpJ8a4cHYSDcDmpxL4zxHddPH0OTbUDTnMCIUq
 uPKu7ji18SYYrQ/Cn3Pyb4Np0vhwxfLGcc/wKg6E5wBB5noEIxqhIgXivXkudox80+JLpG9oKoW5K
 cxN4siMdbCkmF0fKwrhFSPR3ZFrTCv1MYxmUmPYwRD1oG8pLhiqvvoAw6t80UECaVuHadpMmspbLS
 9B67VVZMFZoYcqSXkz5en0U2znrOPyQ4El1OIwm9n2b+IxZ5GYyYWX2k4XrPMpFsSXAlhHvdtl4w/
 yp7kBsQg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leEXR-004ehs-6e; Wed, 05 May 2021 10:13:54 +0000
X-UUID: 5d5d03c2a72045a198fa55a643b25a09-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=65TzO4B3Lyw7xKP2kuTPN358Azva5PvIYjTfwmEVUGQ=; 
 b=gC58xt2e/3HFEci8yZfVn85xDlrOkrGoi13rA3hUUV65Cz+KkAl9x8IDJsaRiBe9p9jku0qGacNn5oYOADEQqKV7i+jTtJZFu/mdsASwE+Pap1QwirF57VVqqmMAbZ68BJyUzBmf+b0qYp5sSdf47GkZAwDKoJaRhlGc8yW1kZA=;
X-UUID: 5d5d03c2a72045a198fa55a643b25a09-20210505
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 360410359; Wed, 05 May 2021 03:13:45 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 03:13:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 18:13:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 May 2021 18:13:41 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 "Rob Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v8 13/22] clk: mediatek: Add MT8192 imgsys clock support
Date: Wed, 5 May 2021 18:07:05 +0800
Message-ID: <20210505100714.3582-14-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210505100714.3582-1-chun-jie.chen@mediatek.com>
References: <20210505100714.3582-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6BB85515628A31A58250CD16CC416F8F86A9FEEE0DF82243F40111E0D322E3172000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_031353_277156_3D4873A3 
X-CRM114-Status: GOOD (  16.65  )
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

Add MT8192 imgsys and imgsys2 clock providers

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |  6 +++
 drivers/clk/mediatek/Makefile         |  1 +
 drivers/clk/mediatek/clk-mt8192-img.c | 70 +++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-img.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index a39a4c201c9e..38011dccfe47 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -520,6 +520,12 @@ config COMMON_CLK_MT8192_CAMSYS
 	help
 	  This driver supports MediaTek MT8192 camsys and camsys_raw clocks.
 
+config COMMON_CLK_MT8192_IMGSYS
+	bool "Clock driver for MediaTek MT8192 imgsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 imgsys and imgsys2 clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 94bf7a03fd88..91392cb333fd 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -70,5 +70,6 @@ obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
+obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS) += clk-mt8192-img.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-img.c b/drivers/clk/mediatek/clk-mt8192-img.c
new file mode 100644
index 000000000000..24b414386369
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-img.c
@@ -0,0 +1,70 @@
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
+static const struct mtk_gate_regs img_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMG(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &img_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate img_clks[] = {
+	GATE_IMG(CLK_IMG_LARB9, "img_larb9", "img1_sel", 0),
+	GATE_IMG(CLK_IMG_LARB10, "img_larb10", "img1_sel", 1),
+	GATE_IMG(CLK_IMG_DIP, "img_dip", "img1_sel", 2),
+	GATE_IMG(CLK_IMG_GALS, "img_gals", "img1_sel", 12),
+};
+
+static const struct mtk_gate img2_clks[] = {
+	GATE_IMG(CLK_IMG2_LARB11, "img2_larb11", "img1_sel", 0),
+	GATE_IMG(CLK_IMG2_LARB12, "img2_larb12", "img1_sel", 1),
+	GATE_IMG(CLK_IMG2_MFB, "img2_mfb", "img1_sel", 6),
+	GATE_IMG(CLK_IMG2_WPE, "img2_wpe", "img1_sel", 7),
+	GATE_IMG(CLK_IMG2_MSS, "img2_mss", "img1_sel", 8),
+	GATE_IMG(CLK_IMG2_GALS, "img2_gals", "img1_sel", 12),
+};
+
+static const struct mtk_clk_desc img_desc = {
+	.clks = img_clks,
+	.num_clks = ARRAY_SIZE(img_clks),
+};
+
+static const struct mtk_clk_desc img2_desc = {
+	.clks = img2_clks,
+	.num_clks = ARRAY_SIZE(img2_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_img[] = {
+	{
+		.compatible = "mediatek,mt8192-imgsys",
+		.data = &img_desc,
+	}, {
+		.compatible = "mediatek,mt8192-imgsys2",
+		.data = &img2_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_img_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-img",
+		.of_match_table = of_match_clk_mt8192_img,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_img_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
