Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DACC4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:04:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6B6F206C1
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMFiQ4nX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZMOYBcLE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6B6F206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j1vOlsZ91ocHqKSwv+xlQSk5f/hUm/JXk2iYiP6LgAM=; b=qMFiQ4nXJA72+L+xYPFPMmgT2
	ww9rWVw+0SXCP5A/crYtAiVDAffYt4ucPAcxNhymRwZN0jNfpq9NRd/sOTbKTK4leg2lBroVaoqti
	i4esoiyWfncQCh3X+zws9AWq7L2uvb7pOOSPGD0UGDb23RBnkLA12IAAXDNhhvZuxBc2NUJhN4FLa
	+TSSt1cvHMaDVFKbFlOhSSUq24y1uYvarlMc6E1yNcjqIWcKmU9khZD60DU2CFOLdWQJqmrAVSro/
	CMVRH5qVFUS38p+fOwNed2u6HPAqqmATKAwBIqgOHO09yke5/4lkJ+CcEWswsYqvKcENN3GNsBlqs
	fap++Mucw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwXk-0002cA-8n; Mon, 09 Nov 2020 02:04:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwXI-0002Px-Nt; Mon, 09 Nov 2020 02:04:01 +0000
X-UUID: a51706a3eaff4681b8adac364ddc1d58-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Fr/oAjVsUXoh2uMqZgXoIP07p10O74AAWu3DUCs8Ooc=; 
 b=ZMOYBcLE1pvquTTtlgNErmcqPYLpQTsY0V3LTdkfCfc+kSRG6LL7uOiJicNY85zYnWhQu27MYJW+ML1N5dsT5CqUJ+lPAgKME0aR9s7p8A3Uh1qnJcb4ukbU4cdFeOrvnv12aqqjQPUxAam+995hY6hKYcTenpcVlQebVYtKjsk=;
X-UUID: a51706a3eaff4681b8adac364ddc1d58-20201108
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1672863365; Sun, 08 Nov 2020 18:03:56 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:03:55 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:03:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:03:53 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v5 13/24] clk: mediatek: Add MT8192 imgsys clock support
Date: Mon, 9 Nov 2020 10:03:38 +0800
Message-ID: <1604887429-29445-14-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_210400_953814_2603F86B 
X-CRM114-Status: GOOD (  17.82  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 imgsys and imgsys2 clock providers

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |  6 +++
 drivers/clk/mediatek/Makefile         |  1 +
 drivers/clk/mediatek/clk-mt8192-img.c | 70 +++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-img.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index a75b7ec..eb549f8 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -509,6 +509,12 @@ config COMMON_CLK_MT8192_CAMSYS
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
index 94bf7a0..91392cb 100644
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
index 0000000..24b4143
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
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
