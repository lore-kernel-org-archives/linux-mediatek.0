Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16996C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 08:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Y/ssTZCatbFkqonB/lXB6mT83IKvwj/Ybm+4YQHRs0=; b=wl2EuQgWfr2Cal
	OhrV5YZE6vUoW4TR+YZDEsvAFIDI7cyLK67IxduLWEou5xe1FphXrJgVPIJQzKyFYIwhXTrqiaei/
	4YbSBa9Iy5xHG6Q8QqS1npKXHbNM4v2b4fkTlb+uX6Px5pAvmqXq0h8LeLSOTellcqvZKAlxOP0SA
	9Pj+tGdgK5ON99b6leJ9P9DzOyj2bGIPfkcinGGlQaEND05R4555i8peTZQwKzpPTA7xB6FcIFFi+
	y9Qih9xkMg4/09wLoT6STn4iP2U+KKsFGx/t4iQhInbyNXiXWFdBaU+5GKKvKImg97YiQF4tntAL+
	G4Ju7Km6/DTjLEiMax+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myVEU-00DGcU-3p; Sat, 18 Dec 2021 08:38:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myVEI-00DGai-52; Sat, 18 Dec 2021 08:38:11 +0000
X-UUID: d893c9a57a514d42b28c9ec55989e8c5-20211218
X-UUID: d893c9a57a514d42b28c9ec55989e8c5-20211218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 914881434; Sat, 18 Dec 2021 01:38:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Dec 2021 00:28:05 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 18 Dec 2021 16:28:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 18 Dec 2021 16:28:03 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v2 3/5] phy: mediatek: add helpers to update bits of registers
Date: Sat, 18 Dec 2021 16:28:00 +0800
Message-ID: <20211218082802.5256-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218082802.5256-1-chunfeng.yun@mediatek.com>
References: <20211218082802.5256-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_003810_226561_ECB69418 
X-CRM114-Status: GOOD (  10.45  )
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

Add three helpers mtk_phy_clear/set/update_bits() for registers operation

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch, add register access helpers,
    Add updatel() macro suggested by Vinod, here add more ones instead.
---
 drivers/phy/mediatek/phy-mtk-io.h | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-io.h

diff --git a/drivers/phy/mediatek/phy-mtk-io.h b/drivers/phy/mediatek/phy-mtk-io.h
new file mode 100644
index 000000000000..500fcdab165d
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-io.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
+ */
+
+#ifndef __PHY_MTK_H__
+#define __PHY_MTK_H__
+
+#include <linux/io.h>
+
+static inline void mtk_phy_clear_bits(void __iomem *reg, u32 bits)
+{
+	u32 tmp = readl(reg);
+
+	tmp &= ~bits;
+	writel(tmp, reg);
+}
+
+static inline void mtk_phy_set_bits(void __iomem *reg, u32 bits)
+{
+	u32 tmp = readl(reg);
+
+	tmp |= bits;
+	writel(tmp, reg);
+}
+
+static inline void mtk_phy_update_bits(void __iomem *reg, u32 mask, u32 val)
+{
+	u32 tmp = readl(reg);
+
+	tmp &= ~mask;
+	tmp |= val & mask;
+	writel(tmp, reg);
+}
+
+#endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
