Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A4FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQxKnZbPQXaIvDiiAWDMRwUFM4bjS2KxhXWPLE8usMs=; b=3rzlh1tFHLW5Gs
	jwXKwl4SDS02ucIzFLM9OMa/g0ORdpCi0gSj826qjKItcEIzUyNX3ctkbssmDL8VdThruU6AQo5jJ
	wFRwvf4qV5SNdfWibOulPDAIcqzyXb+jCis+ubaoLilE2njLSCfylKIK1X8YEcEutefliZ0G1DzE0
	lhrFkfjrY2+yENjGaanCNOtM0WpUMksPVTXrFOGy2H6OhjAkJv7z9NBR4rdbCf/O+NDAQq4j+O+AK
	gDNqSiK5cUjChr/+MXI4qvMKA5VKvlH9tLXO6grtpL/yDY7yZf/Kh1Wub1U8SpK0ZrX3hCPXymlKO
	0RL+vqwZjSJkqLd+HsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9LB1-00Dat9-RD; Mon, 17 Jan 2022 06:07:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L6y-00DYVR-7c; Mon, 17 Jan 2022 06:03:30 +0000
X-UUID: 1fca916eb6604caa83e88fa6d907588a-20220116
X-UUID: 1fca916eb6604caa83e88fa6d907588a-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1368360435; Sun, 16 Jan 2022 23:03:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 17 Jan 2022 13:53:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 13:53:08 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 08/14] media: platform: mtk-mdp3: Add engine setting for
 MT8195
Date: Mon, 17 Jan 2022 13:52:48 +0800
Message-ID: <20220117055254.9777-9-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220324_362243_65BB0AD3 
X-CRM114-Status: GOOD (  13.91  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add engine setting and related header files for MT8195

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h |  24 +
 .../media/platform/mtk-mdp3/mdp_reg_color.h   |  29 +
 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h  |  23 +
 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h |  31 +
 .../media/platform/mtk-mdp3/mdp_reg_merge.h   |  23 +
 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h |  24 +
 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h |  20 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |  31 +
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   2 +
 .../media/platform/mtk-mdp3/mdp_reg_tdshp.h   | 116 +++
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |  18 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 705 +++++++++++++++++-
 12 files changed, 1033 insertions(+), 13 deletions(-)
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_color.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_merge.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h

diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_aal.h b/drivers/media/platform/mtk-mdp3/mdp_reg_aal.h
new file mode 100644
index 000000000000..2275a06fbdf9
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_aal.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP_REG_AAL_H__
+#define __MDP_REG_AAL_H__
+
+#define MDP_AAL_EN                            (0x000)
+#define MDP_AAL_CFG                           (0x020)
+#define MDP_AAL_SIZE                          (0x030)
+#define MDP_AAL_OUTPUT_SIZE                   (0x034)
+#define MDP_AAL_OUTPUT_OFFSET                 (0x038)
+#define MDP_AAL_CFG_MAIN                      (0x200)
+
+#define MDP_AAL_EN_MASK                       (0x01)
+#define MDP_AAL_CFG_MASK                      (0x70FF00B3)
+#define MDP_AAL_SIZE_MASK                     (0x1FFF1FFF)
+#define MDP_AAL_OUTPUT_SIZE_MASK              (0x1FFF1FFF)
+#define MDP_AAL_OUTPUT_OFFSET_MASK            (0x0FF00FF)
+#define MDP_AAL_CFG_MAIN_MASK                 (0x0FE)
+
+#endif  // __MDP_REG_AAL_H__
diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_color.h b/drivers/media/platform/mtk-mdp3/mdp_reg_color.h
new file mode 100644
index 000000000000..54d917a20362
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_color.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP_REG_COLOR_H__
+#define __MDP_REG_COLOR_H__
+
+#define DISP_COLOR_WIN_X_MAIN                (0x40C)
+#define DISP_COLOR_WIN_Y_MAIN                (0x410)
+#define DISP_COLOR_START                     (0xC00)
+#define DISP_COLOR_INTEN                     (0xC04)
+#define DISP_COLOR_OUT_SEL                   (0xC0C)
+#define DISP_COLOR_INTERNAL_IP_WIDTH         (0xC50)
+#define DISP_COLOR_INTERNAL_IP_HEIGHT        (0xC54)
+#define DISP_COLOR_CM1_EN                    (0xC60)
+#define DISP_COLOR_CM2_EN                    (0xCA0)
+// MASK
+#define DISP_COLOR_WIN_X_MAIN_MASK           (0xFFFFFFFF)
+#define DISP_COLOR_WIN_Y_MAIN_MASK           (0xFFFFFFFF)
+#define DISP_COLOR_START_MASK                (0x0FF013F)
+#define DISP_COLOR_INTEN_MASK                (0x07)
+#define DISP_COLOR_OUT_SEL_MASK              (0x0777)
+#define DISP_COLOR_INTERNAL_IP_WIDTH_MASK    (0x03FFF)
+#define DISP_COLOR_INTERNAL_IP_HEIGHT_MASK   (0x03FFF)
+#define DISP_COLOR_CM1_EN_MASK               (0x03)
+#define DISP_COLOR_CM2_EN_MASK               (0x017)
+#endif  // __MDP_REG_COLOR_H__
diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_fg.h b/drivers/media/platform/mtk-mdp3/mdp_reg_fg.h
new file mode 100644
index 000000000000..34f68554c0bb
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_fg.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP_REG_FG_H__
+#define __MDP_REG_FG_H__
+
+#define MDP_FG_TRIGGER          (0x0)
+#define MDP_FG_FG_CTRL_0        (0x20)
+#define MDP_FG_FG_CK_EN         (0x24)
+#define MDP_FG_TILE_INFO_0      (0x418)
+#define MDP_FG_TILE_INFO_1      (0x41c)
+
+/* MASK */
+#define MDP_FG_TRIGGER_MASK          (0x00000007)
+#define MDP_FG_FG_CTRL_0_MASK        (0x00000033)
+#define MDP_FG_FG_CK_EN_MASK         (0x0000000F)
+#define MDP_FG_TILE_INFO_0_MASK      (0xFFFFFFFF)
+#define MDP_FG_TILE_INFO_1_MASK      (0xFFFFFFFF)
+
+#endif  //__MDP_REG_FG_H__
diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h b/drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h
new file mode 100644
index 000000000000..06d0d3a6a139
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP_REG_HDR_H__
+#define __MDP_REG_HDR_H__
+
+#define MDP_HDR_TOP                 (0x000)
+#define MDP_HDR_RELAY               (0x004)
+#define MDP_HDR_SIZE_0              (0x014)
+#define MDP_HDR_SIZE_1              (0x018)
+#define MDP_HDR_SIZE_2              (0x01C)
+#define MDP_HDR_HIST_CTRL_0         (0x020)
+#define MDP_HDR_HIST_CTRL_1         (0x024)
+#define MDP_HDR_HIST_ADDR           (0x0DC)
+#define MDP_HDR_TILE_POS            (0x118)
+
+// MASK
+#define MDP_HDR_RELAY_MASK          (0x01)
+#define MDP_HDR_TOP_MASK            (0xFF0FEB6D)
+#define MDP_HDR_SIZE_0_MASK         (0x1FFF1FFF)
+#define MDP_HDR_SIZE_1_MASK         (0x1FFF1FFF)
+#define MDP_HDR_SIZE_2_MASK         (0x1FFF1FFF)
+#define MDP_HDR_HIST_CTRL_0_MASK    (0x1FFF1FFF)
+#define MDP_HDR_HIST_CTRL_1_MASK    (0x1FFF1FFF)
+#define MDP_HDR_HIST_ADDR_MASK      (0xBF3F2F3F)
+#define MDP_HDR_TILE_POS_MASK       (0x1FFF1FFF)
+
+#endif // __MDP_REG_HDR_H__
diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_merge.h b/drivers/media/platform/mtk-mdp3/mdp_reg_merge.h
new file mode 100644
index 000000000000..d53d58d4ea05
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_merge.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP_REG_MERGE_H__
+#define __MDP_REG_MERGE_H__
+
+#define VPP_MERGE_ENABLE	(0x000)
+#define VPP_MERGE_CFG_0		(0x010)
+#define VPP_MERGE_CFG_4		(0x020)
+#define VPP_MERGE_CFG_12	(0x040)
+#define VPP_MERGE_CFG_24	(0x070)
+#define VPP_MERGE_CFG_25	(0x074)
+
+#define VPP_MERGE_ENABLE_MASK	(0xFFFFFFFF)
+#define VPP_MERGE_CFG_0_MASK	(0xFFFFFFFF)
+#define VPP_MERGE_CFG_4_MASK	(0xFFFFFFFF)
+#define VPP_MERGE_CFG_12_MASK	(0xFFFFFFFF)
+#define VPP_MERGE_CFG_24_MASK	(0xFFFFFFFF)
+#define VPP_MERGE_CFG_25_MASK	(0xFFFFFFFF)
+#endif
diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h b/drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h
new file mode 100644
index 000000000000..35aa10c763bd
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP_REG_OVL_H__
+#define __MDP_REG_OVL_H__
+
+#define OVL_EN                          (0x00c)
+#define OVL_ROI_SIZE                    (0x020)
+#define OVL_DATAPATH_CON                (0x024)
+#define OVL_SRC_CON                     (0x02c)
+#define OVL_L0_CON                      (0x030)
+#define OVL_L0_SRC_SIZE                 (0x038)
+
+#define OVL_DATAPATH_CON_MASK           (0x0FFFFFFF)
+#define OVL_EN_MASK                     (0xB07D07B1)
+#define OVL_L0_CON_MASK                 (0xFFFFFFFF)
+#define OVL_L0_SRC_SIZE_MASK            (0x1FFF1FFF)
+#define OVL_ROI_SIZE_MASK               (0x1FFF1FFF)
+#define OVL_SRC_CON_MASK                (0x0000031F)
+
+#endif  //__MDP_REG_OVL_H__
diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_pad.h b/drivers/media/platform/mtk-mdp3/mdp_reg_pad.h
new file mode 100644
index 000000000000..f4d6d06a74be
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_pad.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP_REG_PAD_H__
+#define __MDP_REG_PAD_H__
+
+#define VPP_PADDING0_PADDING_CON        (0x000)
+#define VPP_PADDING0_PADDING_PIC_SIZE   (0x004)
+#define VPP_PADDING0_W_PADDING_SIZE     (0x008)
+#define VPP_PADDING0_H_PADDING_SIZE     (0x00c)
+
+#define VPP_PADDING0_PADDING_CON_MASK      (0x00000007)
+#define VPP_PADDING0_PADDING_PIC_SIZE_MASK (0xFFFFFFFF)
+#define VPP_PADDING0_W_PADDING_SIZE_MASK   (0x1FFF1FFF)
+#define VPP_PADDING0_H_PADDING_SIZE_MASK   (0x1FFF1FFF)
+
+#endif  // __MDP_REG_PAD_H__
diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h b/drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
index 59d9aae40be6..06dea03ae029 100644
--- a/drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
@@ -12,12 +12,14 @@
 #define MDP_RDMA_CON                    0x020
 #define MDP_RDMA_GMCIF_CON              0x028
 #define MDP_RDMA_SRC_CON                0x030
+#define MDP_RDMA_COMP_CON               0x038
 #define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE   0x060
 #define MDP_RDMA_MF_BKGD_SIZE_IN_PXL    0x068
 #define MDP_RDMA_MF_SRC_SIZE            0x070
 #define MDP_RDMA_MF_CLIP_SIZE           0x078
 #define MDP_RDMA_MF_OFFSET_1            0x080
 #define MDP_RDMA_SF_BKGD_SIZE_IN_BYTE   0x090
+#define MDP_RDMA_MF_BKGD_H_SIZE_IN_PXL  0x098
 #define MDP_RDMA_SRC_END_0              0x100
 #define MDP_RDMA_SRC_END_1              0x108
 #define MDP_RDMA_SRC_END_2              0x110
@@ -25,7 +27,20 @@
 #define MDP_RDMA_SRC_OFFSET_1           0x120
 #define MDP_RDMA_SRC_OFFSET_2           0x128
 #define MDP_RDMA_SRC_OFFSET_0_P         0x148
+#define MDP_RDMA_SRC_OFFSET_HP          0x150
 #define MDP_RDMA_TRANSFORM_0            0x200
+#define MDP_RDMA_DMABUF_CON_0           0x240
+#define MDP_RDMA_ULTRA_TH_HIGH_CON_0    0x248
+#define MDP_RDMA_ULTRA_TH_LOW_CON_0     0x250
+#define MDP_RDMA_DMABUF_CON_1           0x258
+#define MDP_RDMA_ULTRA_TH_HIGH_CON_1    0x260
+#define MDP_RDMA_ULTRA_TH_LOW_CON_1     0x268
+#define MDP_RDMA_DMABUF_CON_2           0x270
+#define MDP_RDMA_ULTRA_TH_HIGH_CON_2    0x278
+#define MDP_RDMA_ULTRA_TH_LOW_CON_2     0x280
+#define MDP_RDMA_DMABUF_CON_3           0x288
+#define MDP_RDMA_ULTRA_TH_HIGH_CON_3    0x290
+#define MDP_RDMA_ULTRA_TH_LOW_CON_3     0x298
 #define MDP_RDMA_RESV_DUMMY_0           0x2a0
 #define MDP_RDMA_MON_STA_1              0x408
 #define MDP_RDMA_SRC_BASE_0             0xf00
@@ -40,12 +55,14 @@
 #define MDP_RDMA_CON_MASK                   0x00001110
 #define MDP_RDMA_GMCIF_CON_MASK             0xfffb3771
 #define MDP_RDMA_SRC_CON_MASK               0xf3ffffff
+#define MDP_RDMA_COMP_CON_MASK              0xffffc000
 #define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE_MASK  0x001fffff
 #define MDP_RDMA_MF_BKGD_SIZE_IN_PXL_MASK   0x001fffff
 #define MDP_RDMA_MF_SRC_SIZE_MASK           0x1fff1fff
 #define MDP_RDMA_MF_CLIP_SIZE_MASK          0x1fff1fff
 #define MDP_RDMA_MF_OFFSET_1_MASK           0x003f001f
 #define MDP_RDMA_SF_BKGD_SIZE_IN_BYTE_MASK  0x001fffff
+#define MDP_RDMA_MF_BKGD_H_SIZE_IN_PXL_MASK 0x007fffff
 #define MDP_RDMA_SRC_END_0_MASK             0xffffffff
 #define MDP_RDMA_SRC_END_1_MASK             0xffffffff
 #define MDP_RDMA_SRC_END_2_MASK             0xffffffff
@@ -53,7 +70,21 @@
 #define MDP_RDMA_SRC_OFFSET_1_MASK          0xffffffff
 #define MDP_RDMA_SRC_OFFSET_2_MASK          0xffffffff
 #define MDP_RDMA_SRC_OFFSET_0_P_MASK        0xffffffff
+#define MDP_RDMA_SRC_OFFSET_HP_MASK         0xffffffff
 #define MDP_RDMA_TRANSFORM_0_MASK           0xff110777
+#define MDP_RDMA_DMABUF_CON_0_MASK          0x0fff00ff
+#define MDP_RDMA_ULTRA_TH_HIGH_CON_0_MASK   0x3fffffff
+#define MDP_RDMA_ULTRA_TH_LOW_CON_0_MASK    0x3fffffff
+#define MDP_RDMA_DMABUF_CON_1_MASK          0x0f7f007f
+#define MDP_RDMA_ULTRA_TH_HIGH_CON_1_MASK   0x3fffffff
+#define MDP_RDMA_ULTRA_TH_LOW_CON_1_MASK    0x3fffffff
+#define MDP_RDMA_DMABUF_CON_2_MASK          0x0f3f003f
+#define MDP_RDMA_ULTRA_TH_HIGH_CON_2_MASK   0x3fffffff
+#define MDP_RDMA_ULTRA_TH_LOW_CON_2_MASK    0x3fffffff
+#define MDP_RDMA_DMABUF_CON_3_MASK          0x0f3f003f
+#define MDP_RDMA_ULTRA_TH_HIGH_CON_3_MASK   0x3fffffff
+#define MDP_RDMA_ULTRA_TH_LOW_CON_3_MASK    0x3fffffff
+
 #define MDP_RDMA_RESV_DUMMY_0_MASK          0xffffffff
 #define MDP_RDMA_MON_STA_1_MASK             0xffffffff
 #define MDP_RDMA_SRC_BASE_0_MASK            0xffffffff
diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h b/drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
index 051fdb020741..942fd4393eba 100644
--- a/drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
@@ -20,6 +20,7 @@
 #define PRZ_LUMA_VERTICAL_SUBPIXEL_OFFSET                 0x02c
 #define PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET              0x030
 #define PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET             0x034
+#define RSZ_ETC_CONTROL                                   0x22c
 
 /* MASK */
 #define PRZ_ENABLE_MASK                                   0x00010001
@@ -35,5 +36,6 @@
 #define PRZ_LUMA_VERTICAL_SUBPIXEL_OFFSET_MASK            0x001fffff
 #define PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET_MASK         0x0000ffff
 #define PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET_MASK        0x001fffff
+#define RSZ_ETC_CONTROL_MASK                              0xff770000
 
 #endif // __MDP_REG_RSZ_H__
diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h b/drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h
new file mode 100644
index 000000000000..7907266ac7c7
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP_REG_TDSHP_H__
+#define __MDP_REG_TDSHP_H__
+
+#define MDP_HIST_CFG_00              (0x064)
+#define MDP_HIST_CFG_01              (0x068)
+#define MDP_TDSHP_CTRL               (0x100)
+#define MDP_TDSHP_CFG                (0x110)
+#define MDP_TDSHP_INPUT_SIZE         (0x120)
+#define MDP_TDSHP_OUTPUT_OFFSET      (0x124)
+#define MDP_TDSHP_OUTPUT_SIZE        (0x128)
+#define MDP_LUMA_HIST_INIT_00        (0x200)
+#define MDP_LUMA_HIST_INIT_01        (0x204)
+#define MDP_LUMA_HIST_INIT_02        (0x208)
+#define MDP_LUMA_HIST_INIT_03        (0x20C)
+#define MDP_LUMA_HIST_INIT_04        (0x210)
+#define MDP_LUMA_HIST_INIT_05        (0x214)
+#define MDP_LUMA_HIST_INIT_06        (0x218)
+#define MDP_LUMA_HIST_INIT_07        (0x21C)
+#define MDP_LUMA_HIST_INIT_08        (0x220)
+#define MDP_LUMA_HIST_INIT_09        (0x224)
+#define MDP_LUMA_HIST_INIT_10        (0x228)
+#define MDP_LUMA_HIST_INIT_11        (0x22C)
+#define MDP_LUMA_HIST_INIT_12        (0x230)
+#define MDP_LUMA_HIST_INIT_13        (0x234)
+#define MDP_LUMA_HIST_INIT_14        (0x238)
+#define MDP_LUMA_HIST_INIT_15        (0x23C)
+#define MDP_LUMA_HIST_INIT_16        (0x240)
+#define MDP_LUMA_SUM_INIT            (0x244)
+#define MDP_DC_TWO_D_W1_RESULT_INIT  (0x260)
+#define MDP_CONTOUR_HIST_INIT_00     (0x398)
+#define MDP_CONTOUR_HIST_INIT_01     (0x39C)
+#define MDP_CONTOUR_HIST_INIT_02     (0x3A0)
+#define MDP_CONTOUR_HIST_INIT_03     (0x3A4)
+#define MDP_CONTOUR_HIST_INIT_04     (0x3A8)
+#define MDP_CONTOUR_HIST_INIT_05     (0x3AC)
+#define MDP_CONTOUR_HIST_INIT_06     (0x3B0)
+#define MDP_CONTOUR_HIST_INIT_07     (0x3B4)
+#define MDP_CONTOUR_HIST_INIT_08     (0x3B8)
+#define MDP_CONTOUR_HIST_INIT_09     (0x3BC)
+#define MDP_CONTOUR_HIST_INIT_10     (0x3C0)
+#define MDP_CONTOUR_HIST_INIT_11     (0x3C4)
+#define MDP_CONTOUR_HIST_INIT_12     (0x3C8)
+#define MDP_CONTOUR_HIST_INIT_13     (0x3CC)
+#define MDP_CONTOUR_HIST_INIT_14     (0x3D0)
+#define MDP_CONTOUR_HIST_INIT_15     (0x3D4)
+#define MDP_CONTOUR_HIST_INIT_16     (0x3D8)
+
+// MASK
+#define MDP_HIST_CFG_00_MASK            (0xFFFFFFFF)
+#define MDP_HIST_CFG_01_MASK            (0xFFFFFFFF)
+#define MDP_LUMA_HIST_00_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_01_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_02_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_03_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_04_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_05_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_06_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_07_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_08_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_09_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_10_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_11_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_12_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_13_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_14_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_15_MASK           (0x07FFFFFF)
+#define MDP_LUMA_HIST_16_MASK           (0x07FFFFFF)
+#define MDP_TDSHP_CTRL_MASK             (0x07)
+#define MDP_TDSHP_CFG_MASK              (0x03F7)
+#define MDP_TDSHP_INPUT_SIZE_MASK       (0x1FFF1FFF)
+#define MDP_TDSHP_OUTPUT_OFFSET_MASK    (0x0FF00FF)
+#define MDP_TDSHP_OUTPUT_SIZE_MASK      (0x1FFF1FFF)
+#define MDP_LUMA_HIST_INIT_00_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_01_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_02_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_03_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_04_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_05_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_06_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_07_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_08_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_09_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_10_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_11_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_12_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_13_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_14_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_15_MASK      (0x07FFFFFF)
+#define MDP_LUMA_HIST_INIT_16_MASK      (0x07FFFFFF)
+#define MDP_LUMA_SUM_INIT_MASK          (0xFFFFFFFF)
+#define MDP_DC_TWO_D_W1_RESULT_INIT_MASK   (0x007FFFFF)
+#define MDP_CONTOUR_HIST_INIT_00_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_01_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_02_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_03_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_04_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_05_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_06_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_07_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_08_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_09_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_10_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_11_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_12_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_13_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_14_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_15_MASK      (0x07FFFFFF)
+#define MDP_CONTOUR_HIST_INIT_16_MASK      (0x07FFFFFF)
+
+#endif  // __MDP_REG_TDSHP_H__
diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h b/drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
index 39b8785f89eb..81a7c46c1aef 100644
--- a/drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
@@ -11,23 +11,32 @@
 #define VIDO_MAIN_BUF_SIZE          0x008
 #define VIDO_SOFT_RST               0x010
 #define VIDO_SOFT_RST_STAT          0x014
+#define VIDO_INT                    0x01c
 #define VIDO_CROP_OFST              0x020
 #define VIDO_TAR_SIZE               0x024
+#define VIDO_FRAME_SIZE             0x028
 #define VIDO_OFST_ADDR              0x02c
 #define VIDO_STRIDE                 0x030
+#define VIDO_BKGD                   0x034
 #define VIDO_OFST_ADDR_C            0x038
 #define VIDO_STRIDE_C               0x03c
+#define VIDO_CTRL_2                 0x048
 #define VIDO_DITHER                 0x054
 #define VIDO_STRIDE_V               0x06c
 #define VIDO_OFST_ADDR_V            0x068
 #define VIDO_RSV_1                  0x070
+#define VIDO_DMA_PREULTRA           0x074
 #define VIDO_IN_SIZE                0x078
 #define VIDO_ROT_EN                 0x07c
 #define VIDO_FIFO_TEST              0x080
 #define VIDO_MAT_CTRL               0x084
+#define VIDO_PVRIC                  0x0d8
+#define VIDO_SCAN_10BIT             0x0dc
+#define VIDO_PENDING_ZERO           0x0e0
 #define VIDO_BASE_ADDR              0xf00
 #define VIDO_BASE_ADDR_C            0xf04
 #define VIDO_BASE_ADDR_V            0xf08
+#define VIDO_AFBC_YUVTRANS          0xf2c
 
 /* MASK */
 #define VIDO_CTRL_MASK                  0xf530711f
@@ -36,6 +45,7 @@
 #define VIDO_SOFT_RST_STAT_MASK         0x00000001
 #define VIDO_TAR_SIZE_MASK              0x1fff1fff
 #define VIDO_CROP_OFST_MASK             0x1fff1fff
+#define VIDO_INT_MASK                   0x00000007
 #define VIDO_OFST_ADDR_MASK             0x0fffffff
 #define VIDO_STRIDE_MASK                0x0000ffff
 #define VIDO_OFST_ADDR_C_MASK           0x0fffffff
@@ -51,5 +61,13 @@
 #define VIDO_BASE_ADDR_MASK             0xffffffff
 #define VIDO_BASE_ADDR_C_MASK           0xffffffff
 #define VIDO_BASE_ADDR_V_MASK           0xffffffff
+#define VIDO_DMA_PREULTRA_MASK          0x00ffffff
+#define VIDO_FRAME_SIZE_MASK            0xffffffff
+#define VIDO_BKGD_MASK                  0xffffffff
+#define VIDO_CTRL_2_MASK                0x0000000f
+#define VIDO_PVRIC_MASK                 0x00000003
+#define VIDO_SCAN_10BIT_MASK            0x0000000f
+#define VIDO_PENDING_ZERO_MASK          0x07ffffff
+#define VIDO_AFBC_YUVTRANS_MASK         0x00000001
 
 #endif  // __MDP_REG_WROT_H__
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index fdf072e48238..8ca9c7e325e1 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -15,6 +15,14 @@
 #include "mdp_reg_rdma.h"
 #include "mdp_reg_ccorr.h"
 #include "mdp_reg_rsz.h"
+#include "mdp_reg_fg.h"
+#include "mdp_reg_aal.h"
+#include "mdp_reg_tdshp.h"
+#include "mdp_reg_hdr.h"
+#include "mdp_reg_color.h"
+#include "mdp_reg_ovl.h"
+#include "mdp_reg_pad.h"
+#include "mdp_reg_merge.h"
 #include "mdp_reg_wrot.h"
 #include "mdp_reg_wdma.h"
 #include "mdp_reg_isp.h"
@@ -107,7 +115,10 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 {
 	const struct mdp_rdma_data *rdma = &ctx->param->rdma;
 	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
+	u32 width = ctx->input->buffer.format.width;
+	u32 height = ctx->input->buffer.format.height;
 	u32 colorformat = ctx->input->buffer.format.colorformat;
+	u32 write_mask = 0;
 	bool block10bit = MDP_COLOR_IS_10BIT_PACKED(colorformat);
 	bool en_ufo = MDP_COLOR_IS_UFP(colorformat);
 	phys_addr_t base = ctx->comp->reg_base;
@@ -132,7 +143,7 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_CON, rdma->src_ctrl,
 		     0x03C8FE0F);
 
-	if (mdp_cfg)
+	if (mdp_cfg) {
 		if (mdp_cfg->rdma_support_10bit && en_ufo) {
 			/* Setup source buffer base */
 			MM_REG_WRITE(cmd, subsys_id,
@@ -148,8 +159,47 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 					     rdma->mf_bkgd_in_pxl, 0x001FFFFF);
 		}
 
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_CON, rdma->control,
-		     0x1110);
+		if (mdp_cfg->rdma_support_extend_ufo)
+			write_mask |= 0xB0000000;
+
+		if (mdp_cfg->rdma_support_afbc)
+			write_mask |= 0x0603000;
+
+		if (mdp_cfg->rdma_support_hyfbc &&
+		    (MDP_COLOR_IS_HYFBC_COMPRESS(colorformat))) {
+			/* Setup source buffer base */
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_UFO_DEC_LENGTH_BASE_Y,
+				     rdma->ufo_dec_y, 0xFFFFFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_UFO_DEC_LENGTH_BASE_C,
+				     rdma->ufo_dec_c, 0xFFFFFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
+				     ((width + 31) >> 5) << 5, 0x1FFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_H_SIZE_IN_PXL,
+				     ((height + 7) >> 3) << 3, 0x1FFFFF);
+
+			/* Setup Compression Control */
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
+				     rdma->comp_ctrl, write_mask);
+		} else if (mdp_cfg->rdma_support_afbc &&
+		    (MDP_COLOR_IS_COMPRESS(colorformat))) {
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
+				     ((width + 31) >> 5) << 5, 0x1FFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_H_SIZE_IN_PXL,
+				     ((height + 7) >> 3) << 3, 0x1FFFFF);
+
+			/* Setup Compression Control */
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
+				     rdma->comp_ctrl, write_mask);
+		} else {
+			/* Setup Compression Control */
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
+				     rdma->comp_ctrl, write_mask);
+		}
+	}
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_CON,
+		     rdma->control, 0x1130);
+
 	/* Setup source buffer base */
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_0, rdma->iova[0],
 		     0xFFFFFFFF);
@@ -173,6 +223,29 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_TRANSFORM_0,
 		     rdma->transform, 0x0F110000);
 
+	if (mdp_cfg->rdma_esl_setting) {
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_0,
+			     rdma->dmabuf_con0, 0x0FFF00FF);
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_0,
+			     rdma->ultra_th_high_con0, 0x3FFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_0,
+			     rdma->ultra_th_low_con0, 0x3FFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_1,
+			     rdma->dmabuf_con1, 0x0F7F007F);
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_1,
+			     rdma->ultra_th_high_con1, 0x3FFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_1,
+			     rdma->ultra_th_low_con1, 0x3FFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_2,
+			     rdma->dmabuf_con2, 0x0F3F003F);
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_HIGH_CON_2,
+			     rdma->ultra_th_high_con2, 0x3FFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_ULTRA_TH_LOW_CON_2,
+			     rdma->ultra_th_low_con2, 0x3FFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_DMABUF_CON_3,
+			     rdma->dmabuf_con3, 0x0F3F003F);
+	}
+
 	return 0;
 }
 
@@ -189,7 +262,18 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 	u8 subsys_id = ctx->comp->subsys_id;
 
 	/* Enable RDMA */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, BIT(0), BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_EN, BIT(0), BIT(0));
+
+	if (mdp_cfg->rdma_support_afbc ||
+	    mdp_cfg->rdma_support_hyfbc) {
+		if (MDP_COLOR_IS_COMPRESS(colorformat) ||
+		    MDP_COLOR_IS_HYFBC_COMPRESS(colorformat)) {
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_0_P,
+				     subfrm->in_tile_xleft, 0xFFFFFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_HP,
+				     subfrm->in_tile_ytop, 0xFFFFFFFF);
+		}
+	}
 
 	/* Set Y pixel offset */
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_0,
@@ -234,15 +318,27 @@ static int wait_rdma_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	u8 subsys_id = ctx->comp->subsys_id;
 	int evt = -1;
 
-	if (id == MDP_COMP_RDMA0)
+	switch (id) {
+	case MDP_COMP_RDMA0:
 		evt = mdp_get_event_idx(ctx->comp->mdp_dev, RDMA0_DONE);
-	else
-		dev_err(dev, "Do not support RDMA1_DONE event\n");
+		break;
+	case MDP_COMP_RDMA1:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, RDMA1_DONE);
+		break;
+	case MDP_COMP_RDMA2:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, RDMA2_DONE);
+		break;
+	case MDP_COMP_RDMA3:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, RDMA3_DONE);
+		break;
+	default:
+		dev_err(dev, "Invalid Engine!\n");
+	}
 
 	if (evt > 0)
 		MM_REG_WAIT(cmd, evt);
 	/* Disable RDMA */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, 0x0, BIT(0));
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_EN, 0x0, BIT(0));
 	return 0;
 }
 
@@ -256,6 +352,75 @@ static const struct mdp_comp_ops rdma_ops = {
 	.post_process = NULL,
 };
 
+static const struct mdp_comp_ops split_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = NULL,
+	.config_frame = NULL,
+	.config_subfrm = NULL,
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
+static const struct mdp_comp_ops stitch_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = NULL,
+	.config_frame = NULL,
+	.config_subfrm = NULL,
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
+static int init_fg(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TRIGGER,
+		     (0x00000001 << 2), 0x00000004);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TRIGGER,
+		     0x00000000, 0x00000004);
+
+	return 0;
+}
+
+static int config_fg_frame(struct mdp_comp_ctx *ctx,
+			   struct mmsys_cmdq_cmd *cmd,
+			   const struct v4l2_rect *compose)
+{
+	const struct mdp_fg_data *fg = &ctx->param->fg;
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_FG_CTRL_0, fg->ctrl_0, 0x1);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_FG_CK_EN, fg->ck_en, 0x7);
+	return 0;
+}
+
+static int config_fg_subfrm(struct mdp_comp_ctx *ctx,
+			    struct mmsys_cmdq_cmd *cmd, u32 index)
+{
+	const struct mdp_fg_subfrm *subfrm = &ctx->param->fg.subfrms[index];
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TILE_INFO_0, subfrm->info_0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_FG_TILE_INFO_1, subfrm->info_1, 0xFFFFFFFF);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops fg_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_fg,
+	.config_frame = config_fg_frame,
+	.config_subfrm = config_fg_subfrm,
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
 static int init_rsz(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
 	phys_addr_t base = ctx->comp->reg_base;
@@ -274,9 +439,13 @@ static int config_rsz_frame(struct mdp_comp_ctx *ctx,
 			    const struct v4l2_rect *compose)
 {
 	const struct mdp_rsz_data *rsz = &ctx->param->rsz;
+	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
 
+	if (mdp_cfg && mdp_cfg->rsz_etc_control)
+		MM_REG_WRITE(cmd, subsys_id, base, RSZ_ETC_CONTROL, 0x0, 0xFFFFFFFF);
+
 	if (ctx->param->frame.bypass) {
 		/* Disable RSZ */
 		MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x0, BIT(0));
@@ -363,6 +532,473 @@ static const struct mdp_comp_ops rsz_ops = {
 	.post_process = NULL,
 };
 
+static int init_aal(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	// Always set MDP_AAL enable to 1
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_EN, 0x1, 0x1);
+
+	return 0;
+}
+
+static int config_aal_frame(struct mdp_comp_ctx *ctx,
+			    struct mmsys_cmdq_cmd *cmd,
+			    const struct v4l2_rect *compose)
+{
+	const struct mdp_aal_data *aal = &ctx->param->aal;
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_CFG_MAIN, aal->cfg_main, 0x80);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_CFG, aal->cfg, 0x1);
+
+	return 0;
+}
+
+static int config_aal_subfrm(struct mdp_comp_ctx *ctx,
+			     struct mmsys_cmdq_cmd *cmd, u32 index)
+{
+	const struct mdp_aal_subfrm *subfrm = &ctx->param->aal.subfrms[index];
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_SIZE,
+		     subfrm->src, MDP_AAL_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_OUTPUT_OFFSET,
+		     subfrm->clip_ofst, 0x00FF00FF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_AAL_OUTPUT_SIZE,
+		     subfrm->clip, MDP_AAL_OUTPUT_SIZE_MASK);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops aal_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_aal,
+	.config_frame = config_aal_frame,
+	.config_subfrm = config_aal_subfrm,
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
+static int init_hdr(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	// Always set MDP_HDR enable to 1
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP, 1, 0x1);
+
+	return 0;
+}
+
+static int config_hdr_frame(struct mdp_comp_ctx *ctx,
+			    struct mmsys_cmdq_cmd *cmd,
+			    const struct v4l2_rect *compose)
+{
+	const struct mdp_hdr_data *hdr = &ctx->param->hdr;
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP,
+		     hdr->top, 0x30000000);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_RELAY,
+		     hdr->relay, 0x1);
+
+	return 0;
+}
+
+static int config_hdr_subfrm(struct mdp_comp_ctx *ctx,
+			     struct mmsys_cmdq_cmd *cmd, u32 index)
+{
+	const struct mdp_hdr_subfrm *subfrm = &ctx->param->hdr.subfrms[index];
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TILE_POS,
+		     subfrm->win_size, MDP_HDR_TILE_POS_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_0,
+		     subfrm->src, 0x1FFF1FFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_1,
+		     subfrm->clip_ofst0, 0x1FFF1FFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_SIZE_2,
+		     subfrm->clip_ofst1, 0x1FFF1FFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_CTRL_0,
+		     subfrm->hist_ctrl_0, 0x00003FFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_CTRL_1,
+		     subfrm->hist_ctrl_1, 0x00003FFF);
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_TOP,
+		     subfrm->hdr_top, 0x00000060);
+	// enable hist_clr_en
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HDR_HIST_ADDR,
+		     subfrm->hist_addr, 0x00000200);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops hdr_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_hdr,
+	.config_frame = config_hdr_frame,
+	.config_subfrm = config_hdr_subfrm,
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
+static void reset_luma_hist(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	// reset LUMA HIST
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_00, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_01, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_02, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_03, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_04, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_05, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_06, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_07, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_08, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_09, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_10, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_11, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_12, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_13, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_14, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_15, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_HIST_INIT_16, 0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     MDP_LUMA_SUM_INIT, 0, 0xFFFFFFFF);
+
+	if (mdp_cfg && mdp_cfg->tdshp_1_1) {
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_DC_TWO_D_W1_RESULT_INIT, 0, 0xFFFFFFFF);
+	}
+
+	if (mdp_cfg && mdp_cfg->tdshp_dyn_contrast_version == 2) {
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_00, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_01, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_02, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_03, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_04, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_05, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_06, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_07, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_08, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_09, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_10, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_11, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_12, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_13, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_14, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_15, 0, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_CONTOUR_HIST_INIT_16, 0, 0xFFFFFFFF);
+	}
+}
+
+static int init_tdshp(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CTRL, 0x00000001,
+		     0x00000001);
+	// Enable fifo
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CFG, 0x00000002,
+		     0x00000002);
+	reset_luma_hist(ctx, cmd);
+
+	return 0;
+}
+
+static int config_tdshp_frame(struct mdp_comp_ctx *ctx,
+			      struct mmsys_cmdq_cmd *cmd,
+			      const struct v4l2_rect *compose)
+{
+	const struct mdp_tdshp_data *tdshp = &ctx->param->tdshp;
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_CFG, tdshp->cfg, 0x00000001);
+
+	return 0;
+}
+
+static int config_tdshp_subfrm(struct mdp_comp_ctx *ctx,
+			       struct mmsys_cmdq_cmd *cmd, u32 index)
+{
+	const struct mdp_tdshp_subfrm *subfrm = &ctx->param->tdshp.subfrms[index];
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_INPUT_SIZE,
+		     subfrm->src, MDP_TDSHP_INPUT_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_OUTPUT_OFFSET,
+		     subfrm->clip_ofst, 0x00FF00FF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_TDSHP_OUTPUT_SIZE,
+		     subfrm->clip, MDP_TDSHP_OUTPUT_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HIST_CFG_00,
+		     subfrm->hist_cfg_0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_HIST_CFG_01,
+		     subfrm->hist_cfg_1, 0xFFFFFFFF);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops tdshp_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_tdshp,
+	.config_frame = config_tdshp_frame,
+	.config_subfrm = config_tdshp_subfrm,
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
+static int init_color(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     DISP_COLOR_START, 0x1, 0x3);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     DISP_COLOR_WIN_X_MAIN, 0xFFFF0000, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     DISP_COLOR_WIN_Y_MAIN, 0xFFFF0000, 0xFFFFFFFF);
+
+	// R2Y/Y2R are disabled in MDP
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     DISP_COLOR_CM1_EN, 0x0, 0x1);
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     DISP_COLOR_CM2_EN, 0x0, 0x1);
+
+	//enable interrupt
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     DISP_COLOR_INTEN, 0x00000007, 0x00000007);
+
+	//Set 10bit->8bit Rounding
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     DISP_COLOR_OUT_SEL, 0x333, 0x333);
+
+	return 0;
+}
+
+static int config_color_frame(struct mdp_comp_ctx *ctx,
+			      struct mmsys_cmdq_cmd *cmd,
+			      const struct v4l2_rect *compose)
+{
+	const struct mdp_color_data *color = &ctx->param->color;
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base,
+		     DISP_COLOR_START, color->start, DISP_COLOR_START_MASK);
+
+	return 0;
+}
+
+static int config_color_subfrm(struct mdp_comp_ctx *ctx,
+			       struct mmsys_cmdq_cmd *cmd, u32 index)
+{
+	const struct mdp_color_subfrm *subfrm = &ctx->param->color.subfrms[index];
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, DISP_COLOR_INTERNAL_IP_WIDTH,
+		     subfrm->in_hsize, 0x00003FFF);
+	MM_REG_WRITE(cmd, subsys_id, base, DISP_COLOR_INTERNAL_IP_HEIGHT,
+		     subfrm->in_vsize, 0x00003FFF);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops color_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_color,
+	.config_frame = config_color_frame,
+	.config_subfrm = config_color_subfrm,
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
+static int init_ovl(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, OVL_EN,
+		     0x1, OVL_EN_MASK);
+	//Relay Mode
+	MM_REG_WRITE(cmd, subsys_id, base, OVL_SRC_CON,
+		     0x200, OVL_SRC_CON_MASK);
+	//Connect OVL, enable smi_id mode
+	MM_REG_WRITE(cmd, subsys_id, base, OVL_DATAPATH_CON,
+		     0x1, OVL_DATAPATH_CON_MASK);
+
+	return 0;
+}
+
+static int config_ovl_frame(struct mdp_comp_ctx *ctx,
+			    struct mmsys_cmdq_cmd *cmd,
+			    const struct v4l2_rect *compose)
+{
+	const struct mdp_ovl_data *ovl = &ctx->param->ovl;
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	//Layer0 for PQ-direct-in
+	MM_REG_WRITE(cmd, subsys_id, base, OVL_L0_CON,
+		     ovl->L0_con, 0x30000000);
+	//Enable Layer0
+	MM_REG_WRITE(cmd, subsys_id, base, OVL_SRC_CON,
+		     ovl->src_con, 0x1);
+
+	return 0;
+}
+
+static int config_ovl_subfrm(struct mdp_comp_ctx *ctx,
+			     struct mmsys_cmdq_cmd *cmd, u32 index)
+{
+	const struct mdp_ovl_subfrm *subfrm = &ctx->param->ovl.subfrms[index];
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	//Setup Layer0 source size
+	MM_REG_WRITE(cmd, subsys_id, base, OVL_L0_SRC_SIZE,
+		     subfrm->L0_src_size, OVL_L0_SRC_SIZE_MASK);
+	//Setup ROI size (output size)
+	MM_REG_WRITE(cmd, subsys_id, base, OVL_ROI_SIZE,
+		     subfrm->roi_size, OVL_ROI_SIZE_MASK);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops ovl_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_ovl,
+	.config_frame = config_ovl_frame,
+	.config_subfrm = config_ovl_subfrm,
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
+static int init_pad(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, VPP_PADDING0_PADDING_CON,
+		     0x2, VPP_PADDING0_PADDING_CON_MASK);
+	//Clear padding area
+	MM_REG_WRITE(cmd, subsys_id, base, VPP_PADDING0_W_PADDING_SIZE,
+		     0x0, VPP_PADDING0_W_PADDING_SIZE_MASK);
+	MM_REG_WRITE(cmd, subsys_id, base, VPP_PADDING0_H_PADDING_SIZE,
+		     0x0, VPP_PADDING0_H_PADDING_SIZE_MASK);
+
+	return 0;
+}
+
+static int config_pad_frame(struct mdp_comp_ctx *ctx,
+			    struct mmsys_cmdq_cmd *cmd,
+			    const struct v4l2_rect *compose)
+{
+	return 0;
+}
+
+static int config_pad_subfrm(struct mdp_comp_ctx *ctx,
+			     struct mmsys_cmdq_cmd *cmd, u32 index)
+{
+	const struct mdp_pad_subfrm *subfrm = &ctx->param->pad.subfrms[index];
+	phys_addr_t base = ctx->comp->reg_base;
+	u16 subsys_id = ctx->comp->subsys_id;
+
+	MM_REG_WRITE(cmd, subsys_id, base, VPP_PADDING0_PADDING_PIC_SIZE,
+		     subfrm->pic_size, VPP_PADDING0_PADDING_CON_MASK);
+
+	return 0;
+}
+
+static const struct mdp_comp_ops pad_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_pad,
+	.config_frame = config_pad_frame,
+	.config_subfrm = config_pad_subfrm,
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
+static int init_tcc(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	return 0;
+}
+
+static int config_tcc_frame(struct mdp_comp_ctx *ctx,
+			    struct mmsys_cmdq_cmd *cmd,
+			    const struct v4l2_rect *compose)
+{
+	return 0;
+}
+
+static int config_tcc_subfrm(struct mdp_comp_ctx *ctx,
+			     struct mmsys_cmdq_cmd *cmd, u32 index)
+{
+	return 0;
+}
+
+static const struct mdp_comp_ops tcc_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_tcc,
+	.config_frame = config_tcc_frame,
+	.config_subfrm = config_tcc_subfrm,
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
 static int init_wrot(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
 	phys_addr_t base = ctx->comp->reg_base;
@@ -371,6 +1007,8 @@ static int init_wrot(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	/* Reset WROT */
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, BIT(0), BIT(0));
 	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, BIT(0), BIT(0));
+	/* Reset setting */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, 0x0, 0xFFFFFFFF);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, 0x0, BIT(0));
 	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x0, BIT(0));
 	return 0;
@@ -384,6 +1022,8 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	bool comp;
+	u32 colorformat = ctx->outputs[0]->buffer.format.colorformat;
 
 	/* Write frame base address */
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR, wrot->iova[0],
@@ -392,9 +1032,38 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 		     0xFFFFFFFF);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_V, wrot->iova[2],
 		     0xFFFFFFFF);
+
+	if (mdp_cfg) {
+		if (mdp_cfg->wrot_support_afbc) {
+			comp = MDP_COLOR_IS_COMPRESS(colorformat);
+			if (comp) {
+				MM_REG_WRITE(cmd, subsys_id, base, VIDO_FRAME_SIZE,
+					     wrot->framesize, 0xFFFFFFFF);
+				MM_REG_WRITE(cmd, subsys_id, base, VIDO_AFBC_YUVTRANS,
+					     wrot->afbc_yuvtrans, 0x1);
+			}
+			MM_REG_WRITE(cmd, subsys_id, base, VIDO_PVRIC,  wrot->pvric, 0x03);
+		}
+
+		if (mdp_cfg->wrot_support_10bit) {
+			MM_REG_WRITE(cmd, subsys_id, base, VIDO_SCAN_10BIT,
+				     wrot->scan_10bit, 0x0000000F);
+			MM_REG_WRITE(cmd, subsys_id, base, VIDO_PENDING_ZERO,
+				     wrot->pending_zero, 0x04000000);
+		}
+		if (mdp_cfg->mdp_version_6885)
+			MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL_2,
+				     wrot->bit_number, 0x00000007);
+	}
+
 	/* Write frame related registers */
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, wrot->control,
 		     0xF131510F);
+
+	/* Write pre-ultra threshold */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_DMA_PREULTRA, wrot->pre_ultra,
+		     0x00FFFFFF);
+
 	/* Write frame Y pitch */
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE, wrot->stride[0],
 		     0x0000FFFF);
@@ -447,7 +1116,6 @@ static int config_wrot_subfrm(struct mdp_comp_ctx *ctx,
 		     0x1FFF1FFF);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CROP_OFST, subfrm->clip_ofst,
 		     0x1FFF1FFF);
-
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
 		     subfrm->main_buf, 0x1FFF7F00);
 
@@ -466,11 +1134,22 @@ static int wait_wrot_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	u8 subsys_id = ctx->comp->subsys_id;
 	int evt = -1;
 
-	if (id == MDP_COMP_WROT0)
+	switch (id) {
+	case MDP_COMP_WROT0:
 		evt = mdp_get_event_idx(ctx->comp->mdp_dev, WROT0_DONE);
-	else
-		dev_err(dev, "Do not support WROT1_DONE event\n");
-
+		break;
+	case MDP_COMP_WROT1:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, WROT1_DONE);
+		break;
+	case MDP_COMP_WROT2:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, WROT2_DONE);
+		break;
+	case MDP_COMP_WROT3:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, WROT3_DONE);
+		break;
+	default:
+		dev_err(dev, "Invalid Engine!\n");
+	}
 	if (evt > 0)
 		MM_REG_WAIT(cmd, evt);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
