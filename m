Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0CDC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 384C660527
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 384C660527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cw/FonqfQ4gbd7y0lrAzGxf/1qd3UGVxNScIXQNC+Dg=; b=WWP73FyR0Qc4/Z
	HBcQ9SWbinAG2iZNogZM6w24VSAhfYx5mSqqVWkCqt7AxaM/WFNtIVimuFE/ft3vi6da2cyLPmdCO
	mxb8DNpxWmwLWr2OL0x0gJcMBeoG7Ojd/bgViw14ryeLppbb2lznx1d22ZOAG8Mj9S1w/m+mYp0wD
	cHgPtd8DA/5BRIuh/TmEsMl0OzZ13p8t9e8DpSg/KE99eoGYgf/JyafX/s2lQ6OJ53puEst0uXkX+
	+wNzRTD3NfC5oiNPBlDKGIf49Aa1uwfQf+uEi+xz/TI85y+yGKreU5SC2gO8sUGHUMu9gR0JtsgLH
	VfPW4jReLrbBsPnyIgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfP6C-002Oo8-Qm; Tue, 26 Oct 2021 16:14:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfP0l-002LkM-FP; Tue, 26 Oct 2021 16:09:18 +0000
X-UUID: 32f1c45390354f4c801ea0f888e024f8-20211026
X-UUID: 32f1c45390354f4c801ea0f888e024f8-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 268650729; Tue, 26 Oct 2021 09:09:07 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 08:59:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 23:59:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Oct 2021 23:59:13 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <jason-jh.lin@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 09/16] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Date: Tue, 26 Oct 2021 23:59:04 +0800
Message-ID: <20211026155911.17651-10-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_090915_583252_01C684E2 
X-CRM114-Status: GOOD (  17.87  )
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

Add mt8195 vdosys0 clock driver name and routing table to
the driver data of mtk-mmsys.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
This patch is base on [1]
[1] soc: mediatek: mmsys: add mt8192 mmsys support
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=524857

The vdosys1 impelmentation patch [2]
[2] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
- https://patchwork.kernel.org/project/linux-mediatek/patch/20210906071539.12953-7-nancy.lin@mediatek.com/
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 220 +++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       |  11 ++
 include/linux/soc/mediatek/mtk-mmsys.h |   9 +
 3 files changed, 240 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
new file mode 100644
index 000000000000..e04cabdfa2dc
--- /dev/null
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -0,0 +1,220 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
+#define __SOC_MEDIATEK_MT8195_MMSYS_H
+
+#define MT8195_VDO0_OVL_MOUT_EN					0xf14
+/*
+ * MT8195_VDO0_OVL_MOUT[2:0]: DISP_OVL0
+ *   BIT(0) : DISP_RDMA0
+ *   BIT(1) : DISP_WDMA0
+ *   BIT(2): DISP_OVL1
+ */
+#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			BIT(0)
+#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			BIT(1)
+#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)
+/*
+ * MT8195_VDO0_OVL_MOUT[6:4]: DISP_OVL1
+ *   BIT(0) : DISP_RDMA1
+ *   BIT(1) : DISP_WDMA1
+ *   BIT(2): DISP_OVL0
+ */
+#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			BIT(4)
+#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			BIT(5)
+#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			BIT(6)
+
+#define MT8195_VDO0_SEL_IN					0xf34
+/*
+ * MT8195_VDO0_SEL_IN[1:0]: VPP_MERGE
+ *   0 : DSC_WRAP0_OUT
+ *   1 : DISP_DITHER1
+ *   2: VDO1_VIRTUAL0
+ */
+#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		0
+#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		BIT(0)
+#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		BIT(1)
+/*
+ * MT8195_VDO0_SEL_IN[4:4]: DSC_WRAP0_IN
+ *   0: DISP_DITHER0
+ *   1: VPP_MERGE
+ */
+#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		0
+#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		BIT(4)
+/*
+ * MT8195_VDO0_SEL_IN[5:5]: DSC_WRAP1_IN
+ *   0: DISP_DITHER1
+ *   1: VPP_MERGE
+ */
+#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		0
+#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE		BIT(5)
+/*
+ * MT8195_VDO0_SEL_IN[8:8]: SINA_VIRTUAL0
+ *   0: VPP_MERGE
+ *   1: DSC_WRAP1_OUT
+ */
+#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		0
+#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		BIT(8)
+/*
+ * MT8195_VDO0_SEL_IN[9:9]: SINB_VIRTUAL0
+ *   0: DSC_WRAP0_OUT
+ */
+#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		0
+/*
+ * MT8195_VDO0_SEL_IN[13:12]: DP_INTF0
+ *   0 : DSC_WRAP1_OUT
+ *   1 : VPP_MERGE
+ *   2: VDO1_VIRTUAL0
+ */
+#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		0
+#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			BIT(12)
+#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		BIT(13)
+/*
+ * MT8195_VDO0_SEL_IN[16:16]: DSI0
+ *   0 : DSC_WRAP0_OUT
+ *   1 : DISP_DITHER0
+ */
+#define MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT			0
+#define MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0			BIT(16)
+/*
+ * MT8195_VDO0_SEL_IN[17:17]: DSI1
+ *   0 : DSC_WRAP1_OUT
+ *   1 : VPP_MERGE
+ */
+#define MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT			0
+#define MT8195_SEL_IN_DSI1_FROM_VPP_MERGE			BIT(17)
+/*
+ * MT8195_VDO0_SEL_IN[20:20]: DISP_WDMA1
+ *   0 : DISP_OVL1
+ *   1 : VPP_MERGE
+ */
+#define MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1			0
+#define MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE			BIT(20)
+/*
+ * MT8195_VDO0_SEL_IN[21:21]: DSC_WRAP1_OUT
+ *   0 : DSC_WRAP1_IN
+ *   1 : DITHER1
+ */
+#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN		(0)
+#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1		BIT(21)
+/*
+ * MT8195_VDO0_SEL_IN[22:22]: DISP_WDMA0
+ *   0 : DISP_OVL0
+ */
+#define MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0			0
+
+#define MT8195_VDO0_SEL_OUT					0xf38
+/*
+ * MT8195_VDO0_SOUT[0:0]: DISP_DITHER0
+ *   0 : DSC_WRAP0_IN
+ *   1 : DSI0
+ */
+#define MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN		0
+#define MT8195_SOUT_DISP_DITHER0_TO_DSI0			BIT(0)
+/*
+ * MT8195_VDO0_SOUT[1:1]: DISP_DITHER1
+ *   0 : DSC_WRAP1_IN
+ *   1 : VPP_MERGE
+ *   2 : DSC_WRAP1_OUT
+ */
+#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN		0
+#define MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE			BIT(1)
+#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT		BIT(2)
+/*
+ * MT8195_VDO0_SOUT[4:4]: VDO1_VIRTUAL0
+ *   0 : VPP_MERGE
+ *   1 : DP_INTF0
+ */
+#define MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE			0
+#define MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0			BIT(4)
+/*
+ * MT8195_VDO0_SOUT[10:8]: VPP_MERGE
+ *   0 : DSI1
+ *   1 : DP_INTF0
+ *   2 : SINA_VIRTUAL0
+ *   3 : DISP_WDMA1
+ *   4 : DSC_WRAP0_IN
+ */
+#define MT8195_SOUT_VPP_MERGE_TO_DSI1				0
+#define MT8195_SOUT_VPP_MERGE_TO_DP_INTF0			BIT(8)
+#define MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0			BIT(9)
+#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1			(BIT(9) | BIT(8))
+#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN			BIT(10)
+/*
+ * MT8195_VDO0_SOUT[11:11]: VPP_MERGE
+ *  0 : DSC_WRAP1_IN
+ */
+#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN			0
+/*
+ * MT8195_VDO0_SOUT[13:12]: DSC_WRAP0_OUT
+ *  0 : DSI0
+ *  1 : SINB_VIRTUAL0
+ *  2 : VPP_MERGE
+ */
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0			0
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0		BIT(12)
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE			BIT(13)
+/*
+ * MT8195_VDO0_SOUT[17:16]: DSC_WRAP1_OUT
+ *  0 : DSI1
+ *  1 : DP_INTF0
+ *  2 : SINA_VIRTUAL0
+ *  3 : VPP_MERGE
+ */
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1			0
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0			BIT(16)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		BIT(17)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(BIT(17) | BIT(16))
+
+static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0,
+		MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1,
+		MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT,
+		MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE,
+		MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0,
+		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT,
+		MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0,
+		MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN,
+		MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
+	}, {
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_DSI0,
+		MT8195_SOUT_DISP_DITHER0_TO_DSI0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_DP_INTF0,
+		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
+	}
+};
+
+#endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 63fccdf3d491..8f5650f723ad 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -15,6 +15,7 @@
 #include "mt8183-mmsys.h"
 #include "mt8365-mmsys.h"
 #include "mt8192-mmsys.h"
+#include "mt8195-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
@@ -60,6 +61,12 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
+	.clk_driver = "clk-mt8195-vdo0",
+	.routes = mmsys_mt8195_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 	.clk_driver = "clk-mt8365-mm",
 	.routes = mt8365_mmsys_routing_table,
@@ -178,6 +185,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8192-mmsys",
 		.data = &mt8192_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-vdosys0",
+		.data = &mt8195_vdosys0_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt8365-mmsys",
 		.data = &mt8365_mmsys_driver_data,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4bba275e235a..64c77c4a6c56 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -17,13 +17,22 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DP_INTF0,
 	DDP_COMPONENT_DPI0,
 	DDP_COMPONENT_DPI1,
+	DDP_COMPONENT_DSC0,
+	DDP_COMPONENT_DSC1,
 	DDP_COMPONENT_DSI0,
 	DDP_COMPONENT_DSI1,
 	DDP_COMPONENT_DSI2,
 	DDP_COMPONENT_DSI3,
 	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_MERGE0,
+	DDP_COMPONENT_MERGE1,
+	DDP_COMPONENT_MERGE2,
+	DDP_COMPONENT_MERGE3,
+	DDP_COMPONENT_MERGE4,
+	DDP_COMPONENT_MERGE5,
 	DDP_COMPONENT_OD0,
 	DDP_COMPONENT_OD1,
 	DDP_COMPONENT_OVL0,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
