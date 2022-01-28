Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72609C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 12:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6L9NizbKRaPgD3kQ0RmdZZPNQZ9/lk3Q0+DAKCOb9F4=; b=eI7+m53SpikzNW
	fF2rwOF67jRCjaDOZqjqzIbUJST7X4ts1Xl3FCfrEXkRhWzef5uZxL88Wmdi4Lmn+0Dov4rqbo3dn
	I3h0ldOG551D7Osnxd5nzQjFvMu6VkC6u/YEuwzk/Yz2FmswjqLixpGuXyA1mdC/Z7bk40y/fM5pw
	Zwl9Onqt7LIrTxiv1aahSDLkiyrwmz7u6Z6iizFxrYZ7dBwA0pvbEYv7NWj0TEht8TeBTOI2MWXBZ
	b2nabTx84gAKvCw/f46gbL0tpuxd8qUjrABNw4W7t5VPEOzG1ARwP1sTy7ff8Yi7VAfgGwMnmqK03
	h8zfAmym4u2ZdLU3qTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDQ2Y-001p3e-B1; Fri, 28 Jan 2022 12:07:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDQ2K-001ow9-M1; Fri, 28 Jan 2022 12:07:30 +0000
X-UUID: 1c70facb2952421eb6ecd7529fd2bc9c-20220128
X-UUID: 1c70facb2952421eb6ecd7529fd2bc9c-20220128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1247258740; Fri, 28 Jan 2022 05:07:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Jan 2022 04:07:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 28 Jan 2022 20:07:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 20:07:20 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: [PATCH v1, 1/4] soc: mediatek: mmsys: Add mt8186 mmsys routing table
Date: Fri, 28 Jan 2022 20:07:15 +0800
Message-ID: <20220128120718.30545-2-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
References: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_040728_750021_4CAE0A38 
X-CRM114-Status: GOOD (  14.78  )
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

mt8186 routing registers is different with other Soc

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mt8186-mmsys.h | 113 ++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  11 +++
 2 files changed, 124 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h

diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
new file mode 100644
index 000000000000..7de329f2d729
--- /dev/null
+++ b/drivers/soc/mediatek/mt8186-mmsys.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
+#define __SOC_MEDIATEK_MT8186_MMSYS_H
+
+#define MT8186_MMSYS_OVL_CON			0xF04
+#define MT8186_MMSYS_OVL0_CON_MASK			0x3
+#define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
+#define MT8186_OVL0_GO_BLEND				BIT(0)
+#define MT8186_OVL0_GO_BG				BIT(1)
+#define MT8186_OVL0_2L_GO_BLEND				BIT(2)
+#define MT8186_OVL0_2L_GO_BG				BIT(3)
+#define MT8186_DISP_RDMA0_SOUT_SEL		0xF0C
+#define MT8186_RDMA0_SOUT_SEL_MASK			0xF
+#define MT8186_RDMA0_SOUT_TO_DSI0			(0)
+#define MT8186_RDMA0_SOUT_TO_COLOR0			(1)
+#define MT8186_RDMA0_SOUT_TO_DPI0			(2)
+#define MT8186_DISP_OVL0_2L_MOUT_EN		0xF14
+#define MT8186_OVL0_2L_MOUT_EN_MASK			0xF
+#define MT8186_OVL0_2L_MOUT_TO_RDMA0			BIT(0)
+#define MT8186_OVL0_2L_MOUT_TO_RDMA1			BIT(3)
+#define MT8186_DISP_OVL0_MOUT_EN		0xF18
+#define MT8186_OVL0_MOUT_EN_MASK			0xF
+#define MT8186_OVL0_MOUT_TO_RDMA0			BIT(0)
+#define MT8186_OVL0_MOUT_TO_RDMA1			BIT(3)
+#define MT8186_DISP_DITHER0_MOUT_EN		0xF20
+#define MT8186_DITHER0_MOUT_EN_MASK			0xF
+#define MT8186_DITHER0_MOUT_TO_DSI0			BIT(0)
+#define MT8186_DITHER0_MOUT_TO_RDMA1			BIT(2)
+#define MT8186_DITHER0_MOUT_TO_DPI0			BIT(3)
+#define MT8186_DISP_RDMA0_SEL_IN		0xF28
+#define MT8186_RDMA0_SEL_IN_MASK			0xF
+#define MT8186_RDMA0_FROM_OVL0				0
+#define MT8186_RDMA0_FROM_OVL0_2L			2
+#define MT8186_DISP_DSI0_SEL_IN			0xF30
+#define MT8186_DSI0_SEL_IN_MASK				0xF
+#define MT8186_DSI0_FROM_RDMA0				0
+#define MT8186_DSI0_FROM_DITHER0			1
+#define MT8186_DSI0_FROM_RDMA1				2
+#define MT8186_DISP_RDMA1_MOUT_EN		0xF3C
+#define MT8186_RDMA1_MOUT_EN_MASK			0xF
+#define MT8186_RDMA1_MOUT_TO_DPI0_SEL			BIT(0)
+#define MT8186_RDMA1_MOUT_TO_DSI0_SEL			BIT(2)
+#define MT8186_DISP_RDMA1_SEL_IN		0xF40
+#define MT8186_RDMA1_SEL_IN_MASK			0xF
+#define MT8186_RDMA1_FROM_OVL0				0
+#define MT8186_RDMA1_FROM_OVL0_2L			2
+#define MT8186_RDMA1_FROM_DITHER0			3
+#define MT8186_DISP_DPI0_SEL_IN			0xF44
+#define MT8186_DPI0_SEL_IN_MASK				0xF
+#define MT8186_DPI0_FROM_RDMA1				0
+#define MT8186_DPI0_FROM_DITHER0			1
+#define MT8186_DPI0_FROM_RDMA0				2
+
+static const struct mtk_mmsys_routes mmsys_mt8186_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8186_DISP_OVL0_MOUT_EN, MT8186_OVL0_MOUT_EN_MASK,
+		MT8186_OVL0_MOUT_TO_RDMA0
+	},
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8186_DISP_RDMA0_SEL_IN, MT8186_RDMA0_SEL_IN_MASK,
+		MT8186_RDMA0_FROM_OVL0
+	},
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8186_MMSYS_OVL_CON, MT8186_MMSYS_OVL0_CON_MASK,
+		MT8186_OVL0_GO_BLEND
+	},
+	{
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8186_DISP_RDMA0_SOUT_SEL, MT8186_RDMA0_SOUT_SEL_MASK,
+		MT8186_RDMA0_SOUT_TO_COLOR0
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8186_DISP_DITHER0_MOUT_EN, MT8186_DITHER0_MOUT_EN_MASK,
+		MT8186_DITHER0_MOUT_TO_DSI0,
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8186_DISP_DSI0_SEL_IN, MT8186_DSI0_SEL_IN_MASK,
+		MT8186_DSI0_FROM_DITHER0
+	},
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
+		MT8186_DISP_OVL0_2L_MOUT_EN, MT8186_OVL0_2L_MOUT_EN_MASK,
+		MT8186_OVL0_2L_MOUT_TO_RDMA1
+	},
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
+		MT8186_DISP_RDMA1_SEL_IN, MT8186_RDMA1_SEL_IN_MASK,
+		MT8186_RDMA1_FROM_OVL0_2L
+	},
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
+		MT8186_MMSYS_OVL_CON, MT8186_MMSYS_OVL0_2L_CON_MASK,
+		MT8186_OVL0_2L_GO_BLEND
+	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8186_DISP_RDMA1_MOUT_EN, MT8186_RDMA1_MOUT_EN_MASK,
+		MT8186_RDMA1_MOUT_TO_DPI0_SEL
+	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8186_DISP_DPI0_SEL_IN, MT8186_DPI0_SEL_IN_MASK,
+		MT8186_DPI0_FROM_RDMA1
+	},
+};
+
+#endif /* __SOC_MEDIATEK_MT8186_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1e448f1ffefb..0da25069ffb3 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -15,6 +15,7 @@
 #include "mtk-mmsys.h"
 #include "mt8167-mmsys.h"
 #include "mt8183-mmsys.h"
+#include "mt8186-mmsys.h"
 #include "mt8192-mmsys.h"
 #include "mt8365-mmsys.h"
 
@@ -56,6 +57,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
+	.clk_driver = "clk-mt8186-mm",
+	.routes = mmsys_mt8186_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
@@ -242,6 +249,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8183-mmsys",
 		.data = &mt8183_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8186-mmsys",
+		.data = &mt8186_mmsys_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt8192-mmsys",
 		.data = &mt8192_mmsys_driver_data,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
