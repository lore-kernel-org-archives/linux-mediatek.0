Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B548C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NToaMtJqzuvq9vtuizgP/BsY3UGLd2GMxJVw+tUkuU=; b=XpCSCzWfkNXwREXlu2Xy3QMxaj
	Xz+AECLxPxRX2fozt76qikrgWAI298fCZ9DYfeY2vy5h8ijG3dcM9/jVLH49KK95HGR5udNlf78e6
	BmkiL8E+P7dG+GfPaT9L3fV5gHa+ROkH2lYLhxu0r1XJ5Bnrw9fRaQLyGxCfi0RZbfcD2VYZ594rH
	z9dJQPhd2/xHb+QMMqirTzjjHTgW1B3Z5bD5GvWorCJy8CsC3aQnjnZREB5S5/S5uT+5ZkH0yViJF
	ld/gs0qs16YyuGZvY+Tb1siqJ1usWQCT/lOAPHl1XlCR8mdTA9KLJGFurChHacQ301BGX8MOr7jiE
	YgBEGKQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01sn-009Our-Pc; Tue, 29 Nov 2022 14:46:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01sN-009OfV-Sc; Tue, 29 Nov 2022 14:46:25 +0000
X-UUID: b7260a8fbc4b4205aab1de17637dcf74-20221129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/NToaMtJqzuvq9vtuizgP/BsY3UGLd2GMxJVw+tUkuU=;
	b=S6HtS+MvXk10QpIUTf52OfljgY1NYlZE/oLqOFFc9QL1YtEbxrvcJV8ScDs1urKplHQ1Bwmbje8DQyGcIst3IlZmg4PxJWxswla6v+WMShp21aCdubeTHPixafTlzHk9hts3ffCc/k3BoMNTE13/NT4i/oS2q04TLpAqpB4cngU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:484fc38d-8b85-4041-885d-3da3b5ccfcd5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:c12ea31e-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b7260a8fbc4b4205aab1de17637dcf74-20221129
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1224566039; Tue, 29 Nov 2022 07:46:19 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 29 Nov 2022 22:35:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 29 Nov 2022 22:35:15 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <lancelot.wu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, amy zhang
	<Amy.Zhang@mediatek.com>
Subject: [PATCH v3 4/6] soc: mediatek: add mtk-mmsys support for mt8188 vdosys0
Date: Tue, 29 Nov 2022 22:35:01 +0800
Message-ID: <20221129143503.16638-5-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221129143503.16638-1-nathan.lu@mediatek.com>
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_064623_964006_91E5A7D6 
X-CRM114-Status: GOOD (  15.94  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Nathan Lu <nathan.lu@mediatek.com>

1. add mt8188 mmsys
2. add mt8188 vdosys0 routing table settings

Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
---
 drivers/soc/mediatek/mt8188-mmsys.h | 149 ++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  11 ++
 2 files changed, 160 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8188-mmsys.h

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
new file mode 100644
index 000000000000..e1ab318c9192
--- /dev/null
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8188_MMSYS_H
+#define __SOC_MEDIATEK_MT8188_MMSYS_H
+
+#define MT8188_VDO0_OVL_MOUT_EN				0xf14
+#define MT8188_MOUT_DISP_OVL0_TO_DISP_RDMA0		BIT(0)
+#define MT8188_MOUT_DISP_OVL0_TO_DISP_WDMA0		BIT(1)
+#define MT8188_MOUT_DISP_OVL0_TO_DISP_OVL1		BIT(2)
+#define MT8188_MOUT_DISP_OVL1_TO_DISP_RDMA1		BIT(4)
+#define MT8188_MOUT_DISP_OVL1_TO_DISP_WDMA1		BIT(5)
+#define MT8188_MOUT_DISP_OVL1_TO_DISP_OVL0		BIT(6)
+
+#define MT8188_VDO0_SEL_IN				0xf34
+#define MT8188_VDO0_SEL_OUT				0xf38
+
+#define MT8188_VDO0_DISP_RDMA_SEL			0xf40
+#define MT8188_SOUT_DISP_RDMA0_TO_MASK			GENMASK(2, 0)
+#define MT8188_SOUT_DISP_RDMA0_TO_DISP_COLOR0		(0 << 0)
+#define MT8188_SOUT_DISP_RDMA0_TO_DISP_DSI0		(1 << 0)
+#define MT8188_SOUT_DISP_RDMA0_TO_DISP_DP_INTF0		(5 << 0)
+#define MT8188_SEL_IN_DISP_RDMA0_FROM_MASK		GENMASK(8, 8)
+#define MT8188_SEL_IN_DISP_RDMA0_FROM_DISP_OVL0		(0 << 8)
+#define MT8188_SEL_IN_DISP_RDMA0_FROM_DISP_RSZ0		(1 << 8)
+
+
+#define MT8188_VDO0_DSI0_SEL_IN				0xf44
+#define MT8188_SEL_IN_DSI0_FROM_MASK			GENMASK(16, 16)
+#define MT8188_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT		(0 << 16)
+#define MT8188_SEL_IN_DSI0_FROM_DISP_DITHER0		(1 << 16)
+
+#define MT8188_VDO0_DP_INTF0_SEL_IN			0xf4C
+#define MT8188_SEL_IN_DP_INTF0_FROM_MASK		GENMASK(2, 0)
+#define MT8188_SEL_IN_DP_INTF0_FROM_DSC_WRAP0C1_OUT	(0 << 0)
+#define MT8188_SEL_IN_DP_INTF0_FROM_VPP_MERGE		(1 << 0)
+#define MT8188_SEL_IN_DP_INTF0_FROM_DISP_DITHER0	(3 << 0)
+
+#define MT8188_VDO0_DISP_DITHER0_SEL_OUT		0xf58
+#define MT8188_SOUT_DISP_DITHER0_TO_MASK		BIT(0)
+#define MT8188_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN	(0 << 0)
+#define MT8188_SOUT_DISP_DITHER0_TO_DSI0		(1 << 0)
+#define MT8188_SOUT_DISP_DITHER0_TO_VPP_MERGE0		(6 << 0)
+#define MT8188_SOUT_DISP_DITHER0_TO_DP_INTF0		(7 << 0)
+
+#define MT8188_VDO0_VPP_MERGE_SEL			0xf60
+#define MT8188_SEL_IN_VPP_MERGE_FROM_MASK		GENMASK(1, 0)
+#define MT8188_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT	(0 << 0)
+#define MT8188_SEL_IN_VPP_MERGE_FROM_DITHER0_OUT	(3 << 0)
+
+#define MT8188_SOUT_VPP_MERGE_TO_MASK			GENMASK(6, 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DSI1			(0 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DP_INTF0		(1 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0		(2 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DISP_WDMA1		(3 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN		(4 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DISP_WDMA0		(5 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN_MASK	GENMASK(11, 11)
+#define MT8188_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN		(0 << 11)
+
+#define MT8188_VDO0_DSC_WARP_SEL			0xf64
+#define MT8188_SEL_IN_DSC_WRAP0C0_IN_FROM_MASK		GENMASK(0, 0)
+#define MT8188_SEL_IN_DSC_WRAP0C0_IN_FROM_DISP_DITHER0	(0 << 0)
+#define MT8188_SEL_IN_DSC_WRAP0C0_IN_FROM_VPP_MERGE	(1 << 0)
+#define MT8188_SOUT_DSC_WRAP0_OUT_TO_MASK		GENMASK(19, 16)
+#define MT8188_SOUT_DSC_WRAP0_OUT_TO_DSI0		BIT(16)
+#define MT8188_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0	BIT(17)
+#define MT8188_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE		BIT(18)
+#define MT8188_SOUT_DSC_WRAP0_OUT_TO_DISP_WDMA0		BIT(19)
+
+static const struct mtk_mmsys_routes mmsys_mt8188_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8188_VDO0_OVL_MOUT_EN, MT8188_MOUT_DISP_OVL0_TO_DISP_RDMA0,
+		MT8188_MOUT_DISP_OVL0_TO_DISP_RDMA0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_WDMA0,
+		MT8188_VDO0_OVL_MOUT_EN, MT8188_MOUT_DISP_OVL0_TO_DISP_WDMA0,
+		MT8188_MOUT_DISP_OVL0_TO_DISP_WDMA0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8188_VDO0_DISP_RDMA_SEL, MT8188_SEL_IN_DISP_RDMA0_FROM_MASK,
+		MT8188_SEL_IN_DISP_RDMA0_FROM_DISP_OVL0
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
+		MT8188_VDO0_DSI0_SEL_IN, MT8188_SEL_IN_DSI0_FROM_MASK,
+		MT8188_SEL_IN_DSI0_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_MERGE0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SEL_IN_VPP_MERGE_FROM_MASK,
+		MT8188_SEL_IN_VPP_MERGE_FROM_DITHER0_OUT
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSC0,
+		MT8188_VDO0_DSC_WARP_SEL,
+		MT8188_SEL_IN_DSC_WRAP0C0_IN_FROM_MASK,
+		MT8188_SEL_IN_DSC_WRAP0C0_IN_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DP_INTF0,
+		MT8188_VDO0_DP_INTF0_SEL_IN, MT8188_SEL_IN_DP_INTF0_FROM_MASK,
+		MT8188_SEL_IN_DP_INTF0_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SEL_IN_VPP_MERGE_FROM_MASK,
+		MT8188_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
+		MT8188_VDO0_DSI0_SEL_IN, MT8188_SEL_IN_DSI0_FROM_MASK,
+		MT8188_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8188_VDO0_DISP_RDMA_SEL, MT8188_SOUT_DISP_RDMA0_TO_MASK,
+		MT8188_SOUT_DISP_RDMA0_TO_DISP_COLOR0
+	},  {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
+		MT8188_VDO0_DISP_DITHER0_SEL_OUT,
+		MT8188_SOUT_DISP_DITHER0_TO_MASK,
+		MT8188_SOUT_DISP_DITHER0_TO_DSI0
+	},  {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DP_INTF0,
+		MT8188_VDO0_DISP_DITHER0_SEL_OUT,
+		MT8188_SOUT_DISP_DITHER0_TO_MASK,
+		MT8188_SOUT_DISP_DITHER0_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SOUT_VPP_MERGE_TO_MASK,
+		MT8188_SOUT_VPP_MERGE_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SOUT_VPP_MERGE_TO_MASK,
+		MT8188_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_WDMA0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SOUT_VPP_MERGE_TO_MASK,
+		MT8188_SOUT_VPP_MERGE_TO_DISP_WDMA0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SOUT_VPP_MERGE_TO_MASK,
+		MT8188_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
+		MT8188_VDO0_DSC_WARP_SEL, MT8188_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8188_SOUT_DSC_WRAP0_OUT_TO_DSI0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
+		MT8188_VDO0_DSC_WARP_SEL, MT8188_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8188_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
+	},
+};
+
+#endif /* __SOC_MEDIATEK_MT8188_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index f3431448e843..9974b5199377 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -16,6 +16,7 @@
 #include "mt8167-mmsys.h"
 #include "mt8183-mmsys.h"
 #include "mt8186-mmsys.h"
+#include "mt8188-mmsys.h"
 #include "mt8192-mmsys.h"
 #include "mt8195-mmsys.h"
 #include "mt8365-mmsys.h"
@@ -67,6 +68,12 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
+	.clk_driver = "clk-mt8188-vdo0",
+	.routes = mmsys_mt8188_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
@@ -299,6 +306,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8186-mmsys",
 		.data = &mt8186_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8188-vdosys0",
+		.data = &mt8188_vdosys0_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt8192-mmsys",
 		.data = &mt8192_mmsys_driver_data,
-- 
2.18.0


