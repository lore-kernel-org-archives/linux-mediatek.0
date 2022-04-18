Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A1FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/6wmbJ1fNhIeQui5pJ6cdtpjwGTIAQUozKbz0ZILyQ=; b=zxpBDXy3BfQ+dg
	zwJjl8wP93jzmG7/fku3XaFcUwnYdivPjmY1Stq/SSw3AUZQINHXUpacARurWopWaR6wsD5nORzV2
	kQQ13YeoQGSIV0qGyrHA8XSC6gjHJZvUbuREZIgBqQgUcg0I9jiT78hNGYvVRsV11Kg2z9gDFQaSa
	AOB6bnsacB5Na5vCqyltkw4c/0zLW2NfwkizNGJFanck665ajEP5wEiKnrNJvFK27uulUFG9YCbLv
	kloiEP/yZq/G9F6ITAHkAKp2PZ0H78EMyOd4uWByUZmhV5dBp2VMNrfrROsGxNoB106oeKciV6dNz
	WKP/lUJnSERL4cz/RvcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngRLF-00Gzyr-73; Mon, 18 Apr 2022 13:22:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngRKt-00Gzot-1x; Mon, 18 Apr 2022 13:22:36 +0000
X-UUID: 22c1e4ab6908465dbd83c230856f881d-20220418
X-UUID: 22c1e4ab6908465dbd83c230856f881d-20220418
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 572895170; Mon, 18 Apr 2022 06:22:25 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 06:22:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Apr 2022 21:22:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Apr 2022 21:22:23 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <yong.liang@mediatek.com>, <runyang.chen@mediatek.com>, 
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH 4/7] clk: mediatek: reset: Add reset.h
Date: Mon, 18 Apr 2022 21:21:51 +0800
Message-ID: <20220418132154.7401-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_062235_161307_07E16ACA 
X-CRM114-Status: GOOD (  15.30  )
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

Add a new file "reset.h" to place some definitions for clock reset.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.h | 10 +---------
 drivers/clk/mediatek/reset.h   | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 9 deletions(-)
 create mode 100644 drivers/clk/mediatek/reset.h

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index dafdf30fe94e..dfb0549ceb6c 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
+#include <reset.h>
 
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
@@ -178,12 +179,6 @@ struct mtk_clk_divider {
 		.div_width = _width,				\
 }
 
-enum mtk_reset_version {
-	MTK_RST_V1 = 0,
-	MTK_RST_V2,
-	MTK_RST_MAX,
-};
-
 int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 			      void __iomem *base, spinlock_t *lock,
 			      struct clk_onecell_data *clk_data);
@@ -196,9 +191,6 @@ void mtk_free_clk_data(struct clk_onecell_data *clk_data);
 struct clk *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg);
 
-int mtk_clk_register_rst_ctrl(struct device_node *np,
-			      u32 reg_num, u16 reg_ofs, u8 version);
-
 struct mtk_clk_desc {
 	const struct mtk_gate *clks;
 	size_t num_clks;
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
new file mode 100644
index 000000000000..0af77531b918
--- /dev/null
+++ b/drivers/clk/mediatek/reset.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __DRV_CLK_MTK_RESET_H
+#define __DRV_CLK_MTK_RESET_H
+
+#include <linux/types.h>
+
+enum mtk_reset_version {
+	MTK_RST_V1 = 0,
+	MTK_RST_V2,
+	MTK_RST_MAX,
+};
+
+int mtk_clk_register_rst_ctrl(struct device_node *np,
+			      u32 reg_num, u16 reg_ofs, u8 version);
+
+#endif /* __DRV_CLK_MTK_RESET_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
