Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8232CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 02:05:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4542861037
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 02:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4542861037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWpM6eJpvkKfTfnPy6TjK0paha/EPa9683JiasGPDxQ=; b=wm0syYDbLf7JYN
	6vfYnQn3WmEMceeQa2gswJ4q7q1BVu2OqsnUdwcLdEZH85LHwQbci122t3Y6KVmPCJF8lRHszoSKT
	lc1rkddJlNg/f//xXTr85PpgdZw7q7a84AwsiJ3HTTSot2P1C7VxMrNnVLteqAx11J7q2NyeLjN9F
	y1eF9++ARszFYmzViMajN73ZWvDzx9ZTKE+qbHAQ8nwmmhOnuI54Eb3EvbuPpg1XtSOeoPmVjfVQx
	KEHPn/zYOfzMYZ6lYY8cp/+qyTo86Ue8hT2yh7kqC6uNwhA+1xqtDf+JETXaUgpzpvU8COAy7l2w+
	JGMUT6/jG4IdmIaK3bow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYfGH-001FzB-37; Fri, 08 Oct 2021 02:05:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYfG3-001Ftw-3C; Fri, 08 Oct 2021 02:05:12 +0000
X-UUID: 4d806955caf749a2a7670cb9baf8742c-20211007
X-UUID: 4d806955caf749a2a7670cb9baf8742c-20211007
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1548060204; Thu, 07 Oct 2021 19:05:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Oct 2021 19:05:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Oct 2021 10:05:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Oct 2021 10:05:05 +0800
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
 <hsinyi@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v11, 2/2] soc: mediatek: mmsys: Add mt8192 mmsys routing table
Date: Fri, 8 Oct 2021 10:05:04 +0800
Message-ID: <20211008020504.1678-3-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008020504.1678-1-yongqiang.niu@mediatek.com>
References: <20211008020504.1678-1-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_190511_177382_0941A3F0 
X-CRM114-Status: GOOD (  14.48  )
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

mt8192 has different routing registers than mt8183

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/soc/mediatek/mt8192-mmsys.h | 77 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    | 11 +++++
 2 files changed, 88 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h

diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/mt8192-mmsys.h
new file mode 100644
index 000000000000..7ea1531ee8af
--- /dev/null
+++ b/drivers/soc/mediatek/mt8192-mmsys.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8192_MMSYS_H
+#define __SOC_MEDIATEK_MT8192_MMSYS_H
+
+#define MT8192_MMSYS_OVL_MOUT_EN		0xf04
+#define MT8192_DISP_OVL1_2L_MOUT_EN		0xf08
+#define MT8192_DISP_OVL0_2L_MOUT_EN		0xf18
+#define MT8192_DISP_OVL0_MOUT_EN		0xf1c
+#define MT8192_DISP_RDMA0_SEL_IN		0xf2c
+#define MT8192_DISP_RDMA0_SOUT_SEL		0xf30
+#define MT8192_DISP_CCORR0_SOUT_SEL		0xf34
+#define MT8192_DISP_AAL0_SEL_IN			0xf38
+#define MT8192_DISP_DITHER0_MOUT_EN		0xf3c
+#define MT8192_DISP_DSI0_SEL_IN			0xf40
+#define MT8192_DISP_OVL2_2L_MOUT_EN		0xf4c
+
+#define MT8192_DISP_OVL0_GO_BLEND			BIT(0)
+#define MT8192_DITHER0_MOUT_IN_DSI0			BIT(0)
+#define MT8192_OVL0_MOUT_EN_DISP_RDMA0			BIT(0)
+#define MT8192_OVL2_2L_MOUT_EN_RDMA4			BIT(0)
+#define MT8192_DISP_OVL0_GO_BG				BIT(1)
+#define MT8192_DISP_OVL0_2L_GO_BLEND			BIT(2)
+#define MT8192_DISP_OVL0_2L_GO_BG			BIT(3)
+#define MT8192_OVL1_2L_MOUT_EN_RDMA1			BIT(4)
+#define MT8192_OVL0_MOUT_EN_OVL0_2L			BIT(4)
+#define MT8192_RDMA0_SEL_IN_OVL0_2L			0x3
+#define MT8192_RDMA0_SOUT_COLOR0			0x1
+#define MT8192_CCORR0_SOUT_AAL0				0x1
+#define MT8192_AAL0_SEL_IN_CCORR0			0x1
+#define MT8192_DSI0_SEL_IN_DITHER0			0x1
+
+static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,
+		MT8192_OVL0_MOUT_EN_DISP_RDMA0
+	}, {
+		DDP_COMPONENT_OVL_2L2, DDP_COMPONENT_RDMA4,
+		MT8192_DISP_OVL2_2L_MOUT_EN, MT8192_OVL2_2L_MOUT_EN_RDMA4,
+		MT8192_OVL2_2L_MOUT_EN_RDMA4
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8192_DISP_DITHER0_MOUT_EN, MT8192_DITHER0_MOUT_IN_DSI0,
+		MT8192_DITHER0_MOUT_IN_DSI0
+	}, {
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_RDMA0_SEL_IN, MT8192_RDMA0_SEL_IN_OVL0_2L,
+		MT8192_RDMA0_SEL_IN_OVL0_2L
+	}, {
+		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
+		MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0,
+		MT8192_AAL0_SEL_IN_CCORR0
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
+		MT8192_DSI0_SEL_IN_DITHER0
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0,
+		MT8192_RDMA0_SOUT_COLOR0
+	}, {
+		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
+		MT8192_DISP_CCORR0_SOUT_SEL, MT8192_CCORR0_SOUT_AAL0,
+		MT8192_CCORR0_SOUT_AAL0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
+		MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_GO_BG,
+		MT8192_DISP_OVL0_GO_BG,
+	}, {
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_2L_GO_BLEND,
+		MT8192_DISP_OVL0_2L_GO_BLEND,
+	}
+};
+
+#endif /* __SOC_MEDIATEK_MT8192_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index a78e88f27b62..5ecfe09a5751 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -13,6 +13,7 @@
 #include "mtk-mmsys.h"
 #include "mt8167-mmsys.h"
 #include "mt8183-mmsys.h"
+#include "mt8192-mmsys.h"
 #include "mt8365-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
@@ -53,6 +54,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
+	.clk_driver = "clk-mt8192-mm",
+	.routes = mmsys_mt8192_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 	.clk_driver = "clk-mt8365-mm",
 	.routes = mt8365_mmsys_routing_table,
@@ -167,6 +174,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8183-mmsys",
 		.data = &mt8183_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8192-mmsys",
+		.data = &mt8192_mmsys_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt8365-mmsys",
 		.data = &mt8365_mmsys_driver_data,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
