Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCDDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 03:38:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5087461074
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 03:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5087461074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cse6MOqdHPWhhzzb+f+NeQHw3xg/+ueZ2NDFzmptyCc=; b=N9XXQjP0DFQ8Zs
	67r2rnoMZCt3ai9U+aSZUIxiLpeSHppi907ClOvkrmvz9XQEM3n/cCv1MMaVF6N1S23dRLpHhs5DQ
	FEzEzZPLmgoJ/m+dTnMeQrYG+SSFuUBsuvNn7qb5PoFMXeDUvd/Grx03P8GVIGkTWxGqkQuBuYlUg
	O8ytSrj96ULjCh0yjIMfdSf2UA4/2Xcy6DBySSjTZFeoSuNBED9MONj0TI/BhgrlxFFPQXjTkyfQe
	UOxYCeuzGhIeEK5ym/l46l6zd/a5CPa9XIwDMdOFKY5qOXsL/T5OsumYIWUZFaIlIEvxZQfICEUIP
	LyLq6dyQHxikVEHJSnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR4hK-00D9A0-OL; Fri, 17 Sep 2021 03:37:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR4hD-00D985-Up
 for linux-mediatek@lists.infradead.org; Fri, 17 Sep 2021 03:37:56 +0000
X-UUID: ff7c0fa7d68c4935b698026d2febda08-20210916
X-UUID: ff7c0fa7d68c4935b698026d2febda08-20210916
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 302024723; Thu, 16 Sep 2021 20:37:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 20:27:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 17 Sep 2021 11:27:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 17 Sep 2021 11:27:45 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: "river . cheng" <river.cheng@mediatek.com>
CC: <linux-mediatek@lists.infradead.org>, Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Subject: [PATCH v1 8/9] media: platform: mtk-mdp3: support mt8195
Date: Fri, 17 Sep 2021 11:27:27 +0800
Message-ID: <20210917032728.22367-9-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
References: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
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

Add mt8195 driver

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h |   24 +
 .../media/platform/mtk-mdp3/mdp_reg_color.h   |   29 +
 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h  |   23 +
 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h |   31 +
 .../media/platform/mtk-mdp3/mdp_reg_merge.h   |   23 +
 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h |   24 +
 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h |   20 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   31 +
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |    2 +
 .../media/platform/mtk-mdp3/mdp_reg_tdshp.h   |  114 ++
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   18 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  215 ++-
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  484 ++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1173 ++++++++++++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |   83 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  707 +++++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   25 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |    4 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  115 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |    2 +
 20 files changed, 2999 insertions(+), 148 deletions(-)
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
index 000000000000..22a3a3bac9d0
--- /dev/null
+++ b/drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h
@@ -0,0 +1,114 @@
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
diff --git a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
index f8560dad87da..469f54d0565f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
@@ -42,14 +42,14 @@ struct img_sw_addr {
 
 struct img_plane_format {
 	u32 size;
-	u16 stride;
+	u32 stride;
 } __packed;
 
 struct img_pix_format {
-	u16 width;
-	u16 height;
+	u32 width;
+	u32 height;
 	u32 colorformat; /* enum mdp_color */
-	u16 ycbcr_prof; /* enum mdp_ycbcr_profile */
+	u32 ycbcr_prof; /* enum mdp_ycbcr_profile */
 	struct img_plane_format plane_fmt[IMG_MAX_PLANES];
 } __packed;
 
@@ -63,10 +63,10 @@ struct img_image_buffer {
 #define IMG_SUBPIXEL_SHIFT	20
 
 struct img_crop {
-	s16 left;
-	s16 top;
-	u16 width;
-	u16 height;
+	s32 left;
+	s32 top;
+	u32 width;
+	u32 height;
 	u32 left_subpix;
 	u32 top_subpix;
 	u32 width_subpix;
@@ -78,27 +78,29 @@ struct img_crop {
 #define IMG_CTRL_FLAG_SHARPNESS	BIT(4)
 #define IMG_CTRL_FLAG_HDR	BIT(5)
 #define IMG_CTRL_FLAG_DRE	BIT(6)
+#define IMG_CTRL_FLAG_RSZ	BIT(7)
 
 struct img_input {
 	struct img_image_buffer buffer;
-	u16 flags; /* HDR, DRE, dither */
+	u32 flags; /* HDR, DRE, dither */
 } __packed;
 
 struct img_output {
 	struct img_image_buffer buffer;
 	struct img_crop crop;
-	s16 rotation;
-	u16 flags; /* H-flip, sharpness, dither */
+	s32 rotation;
+	u32 flags; /* H-flip, sharpness, dither */
+	u64 pqid;
 } __packed;
 
 struct img_ipi_frameparam {
 	u32 index;
 	u32 frame_no;
 	u64 timestamp;
-	u8 type; /* enum mdp_stream_type */
-	u8 state;
-	u8 num_inputs;
-	u8 num_outputs;
+	u32 type; /* enum mdp_stream_type */
+	u32 state;
+	u32 num_inputs;
+	u32 num_outputs;
 	u64 drv_data;
 	struct img_input inputs[IMG_MAX_HW_INPUTS];
 	struct img_output outputs[IMG_MAX_HW_OUTPUTS];
@@ -106,6 +108,7 @@ struct img_ipi_frameparam {
 	struct img_addr subfrm_data;
 	struct img_sw_addr config_data;
 	struct img_sw_addr self_data;
+	u32 frame_change;
 } __packed;
 
 struct img_sw_buffer {
@@ -114,7 +117,7 @@ struct img_sw_buffer {
 } __packed;
 
 struct img_ipi_param {
-	u8 usage;
+	u32 usage;
 	struct img_sw_buffer frm_param;
 } __packed;
 
@@ -126,39 +129,39 @@ struct img_frameparam {
 /* ISP-MDP generic output information */
 
 struct img_comp_frame {
-	u32 output_disable:1;
-	u32 bypass:1;
-	u16 in_width;
-	u16 in_height;
-	u16 out_width;
-	u16 out_height;
+	u32 output_disable;
+	u32 bypass;
+	u32 in_width;
+	u32 in_height;
+	u32 out_width;
+	u32 out_height;
 	struct img_crop crop;
-	u16 in_total_width;
-	u16 out_total_width;
+	u32 in_total_width;
+	u32 out_total_width;
 } __packed;
 
 struct img_region {
-	s16 left;
-	s16 right;
-	s16 top;
-	s16 bottom;
+	s32 left;
+	s32 right;
+	s32 top;
+	s32 bottom;
 } __packed;
 
 struct img_offset {
-	s16 left;
-	s16 top;
+	s32 left;
+	s32 top;
 	u32 left_subpix;
 	u32 top_subpix;
 } __packed;
 
 struct img_comp_subfrm {
-	u32 tile_disable:1;
+	u32 tile_disable;
 	struct img_region in;
 	struct img_region out;
 	struct img_offset luma;
 	struct img_offset chroma;
-	s16 out_vertical; /* Output vertical index */
-	s16 out_horizontal; /* Output horizontal index */
+	s32 out_vertical; /* Output vertical index */
+	s32 out_horizontal; /* Output horizontal index */
 } __packed;
 
 #define IMG_MAX_SUBFRAMES	14
@@ -169,10 +172,13 @@ struct mdp_rdma_subfrm {
 	u32 src;
 	u32 clip;
 	u32 clip_ofst;
+	u32 in_tile_xleft;
+	u32 in_tile_ytop;
 } __packed;
 
 struct mdp_rdma_data {
 	u32 src_ctrl;
+	u32 comp_ctrl;
 	u32 control;
 	u32 iova[IMG_MAX_PLANES];
 	u32 iova_end[IMG_MAX_PLANES];
@@ -182,13 +188,72 @@ struct mdp_rdma_data {
 	u32 ufo_dec_y;
 	u32 ufo_dec_c;
 	u32 transform;
+	u32 dmabuf_con0;
+	u32 ultra_th_high_con0;
+	u32 ultra_th_low_con0;
+	u32 dmabuf_con1;
+	u32 ultra_th_high_con1;
+	u32 ultra_th_low_con1;
+	u32 dmabuf_con2;
+	u32 ultra_th_high_con2;
+	u32 ultra_th_low_con2;
+	u32 dmabuf_con3;
 	struct mdp_rdma_subfrm subfrms[IMG_MAX_SUBFRAMES];
 } __packed;
 
+struct mdp_fg_subfrm {
+	u32 info_0;
+	u32 info_1;
+} __packed;
+
+struct mdp_fg_data {
+	u32 ctrl_0;
+	u32 ck_en;
+	struct mdp_fg_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_hdr_subfrm {
+	u32 win_size;
+	u32 src;
+	u32 clip_ofst0;
+	u32 clip_ofst1;
+	u32 hist_ctrl_0;
+	u32 hist_ctrl_1;
+	u32 hdr_top;
+	u32 hist_addr;
+} __packed;
+
+struct mdp_hdr_data {
+	u32 top;
+	u32 relay;
+	struct mdp_hdr_subfrm   subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_aal_subfrm {
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+} __packed;
+
+struct mdp_aal_data {
+	u32 cfg_main;
+	u32 cfg;
+	struct mdp_aal_subfrm   subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
 struct mdp_rsz_subfrm {
 	u32 control2;
 	u32 src;
 	u32 clip;
+	u32 hdmirx_en;
+	u32 luma_h_int_ofst;
+	u32 luma_h_sub_ofst;
+	u32 luma_v_int_ofst;
+	u32 luma_v_sub_ofst;
+	u32 chroma_h_int_ofst;
+	u32 chroma_h_sub_ofst;
+	u32 rsz_switch;
+	u32 merge_cfg;
 } __packed;
 
 struct mdp_rsz_data {
@@ -196,9 +261,70 @@ struct mdp_rsz_data {
 	u32 coeff_step_y;
 	u32 control1;
 	u32 control2;
+	u32 etc_control;
+	u32 prz_enable;
+	u32 ibse_softclip;
+	u32 tap_adapt;
+	u32 ibse_gaincontrol1;
+	u32 ibse_gaincontrol2;
+	u32 ibse_ylevel_1;
+	u32 ibse_ylevel_2;
+	u32 ibse_ylevel_3;
+	u32 ibse_ylevel_4;
+	u32 ibse_ylevel_5;
 	struct mdp_rsz_subfrm subfrms[IMG_MAX_SUBFRAMES];
 } __packed;
 
+struct mdp_tdshp_subfrm {
+	u32 src;
+	u32 clip;
+	u32 clip_ofst;
+	u32 hist_cfg_0;
+	u32 hist_cfg_1;
+} __packed;
+
+struct mdp_tdshp_data {
+	u32 cfg;
+	struct mdp_tdshp_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_color_subfrm {
+	u32 in_hsize;
+	u32 in_vsize;
+} __packed;
+
+struct mdp_color_data {
+	u32 start;
+	struct mdp_color_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_ovl_subfrm {
+	u32 L0_src_size;
+	u32 roi_size;
+} __packed;
+
+struct mdp_ovl_data {
+	u32 L0_con;
+	u32 src_con;
+	struct mdp_ovl_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_pad_subfrm {
+	u32 pic_size;
+} __packed;
+
+struct mdp_pad_data {
+	struct mdp_pad_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
+struct mdp_tcc_subfrm {
+	u32 pic_size;
+} __packed;
+
+struct mdp_tcc_data {
+	struct mdp_tcc_subfrm subfrms[IMG_MAX_SUBFRAMES];
+} __packed;
+
 struct mdp_wrot_subfrm {
 	u32 offset[IMG_MAX_PLANES];
 	u32 src;
@@ -214,6 +340,14 @@ struct mdp_wrot_data {
 	u32 mat_ctrl;
 	u32 fifo_test;
 	u32 filter;
+	u32 pre_ultra;
+	u32 framesize;
+	u32 afbc_yuvtrans;
+	u32 scan_10bit;
+	u32 pending_zero;
+	u32 bit_number;
+	u32 pvric;
+	u32 vpp02vpp1;
 	struct mdp_wrot_subfrm subfrms[IMG_MAX_SUBFRAMES];
 } __packed;
 
@@ -241,8 +375,8 @@ struct isp_data {
 } __packed;
 
 struct img_compparam {
-	u16 type; /* enum mdp_comp_type */
-	u16 id; /* enum mtk_mdp_comp_id */
+	u32 type; /* enum mdp_comp_id */
+	u32 id; /* engine alias_id */
 	u32 input;
 	u32 outputs[IMG_MAX_HW_OUTPUTS];
 	u32 num_outputs;
@@ -251,7 +385,15 @@ struct img_compparam {
 	u32 num_subfrms;
 	union {
 		struct mdp_rdma_data rdma;
+		struct mdp_fg_data fg;
+		struct mdp_hdr_data hdr;
+		struct mdp_aal_data aal;
 		struct mdp_rsz_data rsz;
+		struct mdp_tdshp_data tdshp;
+		struct mdp_color_data color;
+		struct mdp_ovl_data ovl;
+		struct mdp_pad_data pad;
+		struct mdp_tcc_data tcc;
 		struct mdp_wrot_data wrot;
 		struct mdp_wdma_data wdma;
 		struct isp_data isp;
@@ -263,7 +405,8 @@ struct img_compparam {
 struct img_mux {
 	u32 reg;
 	u32 value;
-};
+	u32 vpp_id;
+} __packed;
 
 struct img_mmsys_ctrl {
 	struct img_mux sets[IMG_MAX_COMPONENTS * 2];
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index 8972cb8de755..e34c2347707e 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -27,11 +27,21 @@ struct mdp_path {
 #define call_op(ctx, op, ...) \
 	(has_op(ctx, op) ? (ctx)->comp->ops->op(ctx, ##__VA_ARGS__) : 0)
 
+#define is_dummy_engine(mdp, id) \
+	((mdp)->mdp_data->comp_data[id].match.type == MDP_COMP_TYPE_DUMMY)
+
 struct mdp_path_subfrm {
 	s32	mutex_id;
 	u32	mutex_mod;
+	u32	mutex_mod2;
 	s32	sofs[MDP_PATH_MAX_COMPS];
 	u32	num_sofs;
+
+	s32	mutex2_id;
+	u32	mutex2_mod;
+	u32	mutex2_mod2;
+	s32	sof2s[MDP_PATH_MAX_COMPS];
+	u32	num_sof2s;
 };
 
 static bool is_output_disable(const struct img_compparam *param, u32 count)
@@ -75,8 +85,11 @@ static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
 	struct device *dev = &path->mdp_dev->pdev->dev;
 	struct mtk_mutex **mutex = path->mdp_dev->mdp_mutex;
+	struct mtk_mutex **mutex2 = path->mdp_dev->mdp_mutex2;
 	s32 mutex_id = -1;
+	s32 mutex2_id = -1;
 	u32 mutex_sof = 0;
+	u32 mutex2_sof = 0;
 	int index, j;
 	enum mtk_mdp_comp_id mtk_comp_id = MDP_COMP_NONE;
 
@@ -84,57 +97,225 @@ static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 	memset(subfrm, 0, sizeof(*subfrm));
 
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(path->mdp_dev, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		if (is_output_disable(ctx->param, count))
 			continue;
 
 		mtk_comp_id = data->comp_data[ctx->comp->id].match.public_id;
 		switch (mtk_comp_id) {
-		case MDP_COMP_AAL0:
+		case MDP_COMP_ISP_IMGI:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_IMGI);
+			mutex_id = data->pipe_info[j].mutex_id;
+			break;
+		case MDP_COMP_WPEI:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI);
+			mutex_id = data->pipe_info[j].mutex_id;
 			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			break;
-		case MDP_COMP_CCORR0:
+		case MDP_COMP_WPEI2:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI2);
+			mutex_id = data->pipe_info[j].mutex_id;
 			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			break;
-		case MDP_COMP_WDMA:
+		case MDP_COMP_RDMA0:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA0);
+			mutex_id = data->pipe_info[j].mutex_id;
 			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
-			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WDMA;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RDMA0;
 			break;
-		case MDP_COMP_WROT0:
+		case MDP_COMP_VPP1_SOUT:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_VPP1_SOUT);
+			mutex_id = data->pipe_info[j].mutex_id;
 			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
-			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WROT0;
+			subfrm->mutex2_mod2 |= data->comp_data[ctx->comp->id].mutex.mod2;
 			break;
-		case MDP_COMP_TDSHP0:
+		case MDP_COMP_FG0:
 			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
-			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_TDSHP0;
 			break;
-		case MDP_COMP_RSZ1:
+		case MDP_COMP_STITCH:
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_HDR0:
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_AAL0:
 			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
-			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ1;
 			break;
 		case MDP_COMP_RSZ0:
 			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ0;
 			break;
-		case MDP_COMP_RDMA0:
-			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA0);
-			mutex_id = data->pipe_info[j].mutex_id;
+		case MDP_COMP_TDSHP0:
 			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
-			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RDMA0;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_TDSHP0;
 			break;
-		case MDP_COMP_ISP_IMGI:
-			j = mdp_get_mutex_idx(data, MDP_PIPE_IMGI);
-			mutex_id = data->pipe_info[j].mutex_id;
+		case MDP_COMP_COLOR0:
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			break;
-		case MDP_COMP_WPEI:
-			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI);
-			mutex_id = data->pipe_info[j].mutex_id;
+		case MDP_COMP_OVL0:
 			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			break;
-		case MDP_COMP_WPEI2:
-			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI2);
-			mutex_id = data->pipe_info[j].mutex_id;
+		case MDP_COMP_PAD0:
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_TCC0:
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_CCORR0:
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_WDMA:
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WDMA;
+			break;
+		case MDP_COMP_WROT0:
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WROT0;
+			break;
+		case MDP_COMP_SPLIT:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_SPLIT);
+			mutex2_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_SPLIT;
+			mutex2_sof = data->pipe_info[j].sof;
+			break;
+		case MDP_COMP_SPLIT2:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_SPLIT2);
+			mutex2_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_SPLIT2;
+			mutex2_sof = data->pipe_info[j].sof;
+			break;
+		case MDP_COMP_RDMA1:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA1);
+			mutex2_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RDMA1;
+			break;
+		case MDP_COMP_RDMA2:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA2);
+			mutex2_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RDMA2;
+			break;
+		case MDP_COMP_RDMA3:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA3);
+			mutex2_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RDMA3;
+			break;
+		case MDP_COMP_VPP0_SOUT:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_VPP0_SOUT);
+			mutex2_id = data->pipe_info[j].mutex_id;
 			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->mutex2_mod2 |= data->comp_data[ctx->comp->id].mutex.mod2;
+			break;
+		case MDP_COMP_TCC1:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_FG1:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_FG2:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_FG3:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_HDR1:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_HDR2:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_HDR3:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_AAL1:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_AAL2:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_AAL3:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_RSZ1:
+			if (data->comp_data[ctx->comp->id].mutex.mmsys_id) {
+				subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+				subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RSZ1;
+			} else {
+				subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+				subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ1;
+			}
+			break;
+		case MDP_COMP_RSZ2:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RSZ2;
+			break;
+		case MDP_COMP_RSZ3:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RSZ3;
+			break;
+		case MDP_COMP_TDSHP1:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_TDSHP1;
+			break;
+		case MDP_COMP_TDSHP2:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_TDSHP2;
+			break;
+		case MDP_COMP_TDSHP3:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_TDSHP3;
+			break;
+		case MDP_COMP_COLOR1:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_COLOR2:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_COLOR3:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_OVL1:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_PAD1:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_PAD2:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_PAD3:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			break;
+		case MDP_COMP_WROT1:
+			subfrm->mutex2_mod |= data->comp_data[ctx->comp->id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_WROT1;
+			break;
+		case MDP_COMP_WROT2:
+			subfrm->mutex2_mod2 |= data->comp_data[ctx->comp->id].mutex.mod2;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_WROT2;
+			break;
+		case MDP_COMP_WROT3:
+			subfrm->mutex2_mod2 |= data->comp_data[ctx->comp->id].mutex.mod2;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_WROT3;
+			break;
+		case MDP_COMP_VDO0DL0:
+			subfrm->mutex2_mod2 |= data->comp_data[ctx->comp->id].mutex.mod2;
+			break;
+		case MDP_COMP_VDO1DL0:
+			subfrm->mutex2_mod2 |= data->comp_data[ctx->comp->id].mutex.mod2;
+			break;
+		case MDP_COMP_VDO0DL1:
+			subfrm->mutex2_mod2 |= data->comp_data[ctx->comp->id].mutex.mod2;
+			break;
+		case MDP_COMP_VDO1DL1:
+			subfrm->mutex2_mod2 |= data->comp_data[ctx->comp->id].mutex.mod2;
 			break;
 		default:
 			break;
@@ -142,17 +323,23 @@ static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 	}
 
 	subfrm->mutex_id = mutex_id;
-	if (-1 == mutex_id) {
+	subfrm->mutex2_id = mutex2_id;
+
+	if ((-1 == mutex_id) && (-1 == mutex2_id)) {
 		dev_err(dev, "No mutex assigned");
 		return -EINVAL;
 	}
 
 	/* Set mutex modules */
-	if (subfrm->mutex_mod) {
+	if (subfrm->mutex_mod || subfrm->mutex_mod2) {
 		mtk_mutex_add_mdp_mod(mutex[mutex_id], subfrm->mutex_mod,
-				      0, mutex_sof, cmd);
+				      subfrm->mutex_mod2, mutex_sof, cmd);
 	}
 
+	if (subfrm->mutex2_mod || subfrm->mutex2_mod2) {
+		mtk_mutex_add_mdp_mod(mutex2[mutex2_id], subfrm->mutex2_mod,
+				      subfrm->mutex2_mod2, mutex2_sof, cmd);
+	}
 	return 0;
 }
 
@@ -162,14 +349,16 @@ static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
 {
 	struct device *dev = &path->mdp_dev->pdev->dev;
 	struct mtk_mutex **mutex = path->mdp_dev->mdp_mutex;
+	struct mtk_mutex **mutex2 = path->mdp_dev->mdp_mutex2;
 	s32 mutex_id = subfrm->mutex_id;
+	s32 mutex2_id = subfrm->mutex2_id;
 
-	if (-1 == mutex_id) {
+	if ((-1 == mutex_id) && (-1 == mutex2_id)) {
 		dev_err(dev, "Incorrect mutex id");
 		return -EINVAL;
 	}
 
-	if (subfrm->mutex_mod) {
+	if (subfrm->mutex_mod || subfrm->mutex_mod2) {
 		int index, evt;
 
 		/* Wait WROT SRAM shared to DISP RDMA */
@@ -234,6 +423,71 @@ static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
 				MM_REG_WAIT(cmd, evt);
 		}
 	}
+
+	if (subfrm->mutex2_mod || subfrm->mutex2_mod2) {
+		int index, evt;
+
+		/* Clear SOF event for each engine */
+		for (index = 0; index < subfrm->num_sof2s; index++) {
+			switch (subfrm->sof2s[index]) {
+			case MDP_COMP_RDMA1:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA1_SOF);
+				break;
+			case MDP_COMP_RDMA2:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA2_SOF);
+				break;
+			case MDP_COMP_RDMA3:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA3_SOF);
+				break;
+			case MDP_COMP_WROT1:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT1_SOF);
+				break;
+			case MDP_COMP_WROT2:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT2_SOF);
+				break;
+			case MDP_COMP_WROT3:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT3_SOF);
+				break;
+			default:
+				evt = -1;
+				break;
+			}
+			if (evt > 0)
+				MM_REG_CLEAR(cmd, evt);
+		}
+
+		/* Enable the mutex */
+		mtk_mutex_enable_by_cmdq(mutex2[mutex2_id], cmd);
+
+		/* Wait SOF events and clear mutex modules (optional) */
+		for (index = 0; index < subfrm->num_sof2s; index++) {
+			switch (subfrm->sof2s[index]) {
+			case MDP_COMP_RDMA1:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA1_SOF);
+				break;
+			case MDP_COMP_RDMA2:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA2_SOF);
+				break;
+			case MDP_COMP_RDMA3:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA3_SOF);
+				break;
+			case MDP_COMP_WROT1:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT1_SOF);
+				break;
+			case MDP_COMP_WROT2:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT2_SOF);
+				break;
+			case MDP_COMP_WROT3:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT3_SOF);
+				break;
+			default:
+				evt = -1;
+				break;
+			}
+			if (evt > 0)
+				MM_REG_WAIT(cmd, evt);
+		}
+	}
 	return 0;
 }
 
@@ -246,9 +500,12 @@ static int mdp_path_ctx_init(struct mdp_dev *mdp, struct mdp_path *path)
 		return -EINVAL;
 
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(mdp, config->components[index].type))
+			continue;
+
 		ret = mdp_comp_ctx_init(mdp, &path->comps[index],
-					&config->components[index],
-					path->param);
+								&config->components[index],
+								path->param);
 		if (ret)
 			return ret;
 	}
@@ -261,10 +518,12 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 {
 	struct mdp_path_subfrm subfrm;
 	const struct img_config *config = path->config;
-	struct device *mmsys_dev = path->mdp_dev->mdp_mmsys;
 	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
+	struct device *mmsys_dev = path->mdp_dev->mdp_mmsys;
+	struct device *mmsys2_dev = path->mdp_dev->mdp_mmsys2;
 	struct mdp_comp_ctx *ctx;
 	enum mdp_comp_id cur, next;
+	enum mtk_mdp_comp_id mtk_cur, mtk_next;
 	int index, ret;
 
 	/* Acquire components */
@@ -273,15 +532,29 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 		return ret;
 	/* Enable mux settings */
 	for (index = 0; index < (config->num_components - 1); index++) {
-		cur = path->comps[index].comp->id;
-		next = path->comps[index + 1].comp->id;
-		mtk_mmsys_mdp_connect(mmsys_dev, cmd,
-				data->comp_data[cur].match.public_id,
-				data->comp_data[next].match.public_id);
+		if (is_dummy_engine(path->mdp_dev, config->components[index].type))
+			cur = config->components[index].type;
+		else
+			cur = path->comps[index].comp->id;
+
+		if (is_dummy_engine(path->mdp_dev, config->components[index + 1].type))
+			next = config->components[index + 1].type;
+		else
+			next = path->comps[index + 1].comp->id;
+
+		mtk_cur = data->comp_data[cur].match.public_id;
+		mtk_next = data->comp_data[next].match.public_id;
+		if (data->comp_data[cur].mutex.mmsys_id != 0)
+			mtk_mmsys_mdp_connect(mmsys2_dev, cmd, mtk_cur, mtk_next);
+		else
+			mtk_mmsys_mdp_connect(mmsys_dev, cmd, mtk_cur, mtk_next);
 	}
 
 	/* Config sub-frame information */
 	for (index = (config->num_components - 1); index >= 0; index--) {
+		if (is_dummy_engine(path->mdp_dev, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		if (is_output_disable(ctx->param, count))
 			continue;
@@ -295,6 +568,9 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 		return ret;
 	/* Wait components done */
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(path->mdp_dev, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		if (is_output_disable(ctx->param, count))
 			continue;
@@ -304,6 +580,9 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 	}
 	/* Advance to the next sub-frame */
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(path->mdp_dev, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		ret = call_op(ctx, advance_subfrm, cmd, count);
 		if (ret)
@@ -311,11 +590,22 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 	}
 	/* Disable mux settings */
 	for (index = 0; index < (config->num_components - 1); index++) {
-		cur = path->comps[index].comp->id;
-		next = path->comps[index + 1].comp->id;
-		mtk_mmsys_mdp_disconnect(mmsys_dev, cmd,
-				data->comp_data[cur].match.public_id,
-				data->comp_data[next].match.public_id);
+		if (is_dummy_engine(path->mdp_dev, config->components[index].type))
+			cur = config->components[index].type;
+		else
+			cur = path->comps[index].comp->id;
+
+		if (is_dummy_engine(path->mdp_dev, config->components[index + 1].type))
+			next = config->components[index + 1].type;
+		else
+			next = path->comps[index + 1].comp->id;
+
+		mtk_cur = data->comp_data[cur].match.public_id;
+		mtk_next = data->comp_data[next].match.public_id;
+		if (data->comp_data[cur].mutex.mmsys_id != 0)
+			mtk_mmsys_mdp_disconnect(mmsys2_dev, cmd, mtk_cur, mtk_next);
+		else
+			mtk_mmsys_mdp_disconnect(mmsys_dev, cmd, mtk_cur, mtk_next);
 	}
 
 	return 0;
@@ -331,6 +621,9 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
 	/* Config path frame */
 	/* Reset components */
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(mdp, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		ret = call_op(ctx, init_comp, cmd);
 		if (ret)
@@ -341,6 +634,9 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
 		const struct v4l2_rect *compose =
 			path->composes[ctx->param->outputs[0]];
 
+		if (is_dummy_engine(mdp, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		ret = call_op(ctx, config_frame, cmd, compose);
 		if (ret)
@@ -355,6 +651,9 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
 	}
 	/* Post processing information */
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(mdp, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		ret = call_op(ctx, post_process, cmd);
 		if (ret)
@@ -363,6 +662,71 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
 	return 0;
 }
 
+static int mdp_hyfbc_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
+			    struct mdp_path *path, struct mdp_cmdq_param *param)
+{
+#define BYTE_PER_MB_Y				(4)
+#define BYTE_PER_MB_C				(2)
+
+#define CEIL(a, b) (((a) % (b) == 0) ? ((a) / (b)) : ((a) / (b) + 1))
+#define ALIGN_UP(val, a)						\
+({												\
+	typeof(val) _a = (a);						\
+	(_a == 0) ? val : ((val + (_a - 1)) / (_a) * (_a));	\
+})
+
+#define is_rdma(id) \
+	(mdp->mdp_data->comp_data[id].match.type == MDP_COMP_TYPE_RDMA)
+
+	const struct img_config *config = path->config;
+	struct mdp_m2m_ctx *ctx;
+	struct mdp_comp_ctx *comp_ctx = &path->comps[0];
+	const struct mdp_rdma_data *rdma = &comp_ctx->param->rdma;
+	struct hyfbc_patch_info hyfbc;
+	struct mdp_frame *frame;
+	enum mdp_comp_id wrot_id;
+	int ret = 0;
+
+	ctx = (struct mdp_m2m_ctx *)param->mdp_ctx;
+	frame = &ctx->curr_param.output;
+
+	if (!MDP_COLOR_IS_HYFBC_COMPRESS(frame->mdp_fmt->mdp_color) ||
+	    frame->format.fmt.pix_mp.width % 32 == 0)
+		goto EXIT;
+
+	// First engine should be rdma engine
+	if (!is_rdma(config->components[0].type)) {
+		pr_info("Not RDMA engine (id), end patch.", config->components[0].type);
+		goto EXIT;
+	}
+
+	wrot_id = config->components[(config->num_components - 1)].type;
+
+	hyfbc.is10b = (MDP_COLOR_IS_10BIT(frame->mdp_fmt->mdp_color));
+	hyfbc.width_in_mb = CEIL(frame->format.fmt.pix_mp.width, 16);
+	hyfbc.height_in_mb = CEIL(frame->format.fmt.pix_mp.height, 16);
+	hyfbc.w_stride_in_mb = CEIL(ALIGN_UP(frame->stride.width, 32), 16);
+	hyfbc.h_stride_in_mb = CEIL(ALIGN_UP(frame->stride.height, 32), 16);
+	hyfbc.byte_per_mb = BYTE_PER_MB_Y;
+	hyfbc.pa_base = rdma->ufo_dec_y;
+
+	ret = mdp_hyfbc_patch(mdp, cmd, &hyfbc, wrot_id);
+	if (ret) {
+		pr_info("mdp_hyfbc_patch: y patch fail.");
+		goto EXIT;
+	}
+
+	hyfbc.byte_per_mb = BYTE_PER_MB_C;
+	hyfbc.pa_base = rdma->ufo_dec_c;
+
+	ret = mdp_hyfbc_patch(mdp, cmd, &hyfbc, wrot_id);
+	if (ret)
+		pr_info("mdp_hyfbc_patch: c patch fail.");
+
+EXIT:
+	return ret;
+}
+
 static void mdp_auto_release_work(struct work_struct *work)
 {
 	struct mdp_cmdq_cb_param *cb_param;
@@ -375,6 +739,11 @@ static void mdp_auto_release_work(struct work_struct *work)
 
 	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
 	mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
+
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
+	if (i >= 0)
+		mtk_mutex_unprepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
+
 	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 			    cb_param->num_comps);
 
@@ -418,6 +787,11 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 		dev_err(dev, "%s:queue_work fail!\n", __func__);
 		i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
 		mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
+
+		i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
+		if (i >= 0)
+			mtk_mutex_unprepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
+
 		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 				    cb_param->num_comps);
 
@@ -474,8 +848,23 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
 	mtk_mutex_prepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 
-	for (i = 0; i < param->config->num_components; i++)
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
+	if (i >= 0)
+		mtk_mutex_prepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
+
+	for (i = 0; i < param->config->num_components; i++) {
+		if (is_dummy_engine(mdp, path.config->components[i].type))
+			continue;
+
 		mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
+	}
+
+	if (mdp->mdp_data->mdp_cfg->mdp_version_8195) {
+		/* HYFBC Patch */
+		ret = mdp_hyfbc_config(mdp, &cmd, &path, param);
+		if (ret)
+			pr_info("%s:mdp_hyfbc_config fail!\n", __func__);
+	}
 
 	ret = mdp_path_config(mdp, &cmd, &path);
 	if (ret) {
@@ -496,9 +885,13 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_destroy_pkt;
 	}
 
-	for (i = 0; i < param->config->num_components; i++)
+	for (i = 0; i < param->config->num_components; i++) {
+		if (is_dummy_engine(mdp, path.config->components[i].type))
+			continue;
+
 		memcpy(&comps[i], path.comps[i].comp,
 		       sizeof(struct mdp_comp));
+	}
 	cb_param->mdp = mdp;
 	cb_param->user_cmdq_cb = param->cmdq_cb;
 	cb_param->user_cb_data = param->cb_data;
@@ -520,6 +913,11 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 err_clock_off:
 	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
 	mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
+
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
+	if (i >= 0)
+		mtk_mutex_unprepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
+
 	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 			    cb_param->num_comps);
 err_destroy_pkt:
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index f690502ee42b..28c65e8d4eff 100644
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
@@ -76,7 +84,7 @@ static int init_rdma(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
 
-	if (mdp_cfg && mdp_cfg->rdma_support_10bit) {
+	if (mdp_cfg && mdp_cfg->rdma_rsz1_sram_sharing) {
 		struct mdp_comp *prz1 = ctx->comp->mdp_dev->comp[MDP_RSZ1];
 
 		/* Disable RSZ1 */
@@ -101,21 +109,25 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
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
 	u8 subsys_id = ctx->comp->subsys_id;
 
 	if (mdp_cfg && mdp_cfg->rdma_support_10bit) {
-		if (block10bit)
+		if (block10bit) {
 			MM_REG_WRITE(cmd, subsys_id, base,
 				     MDP_RDMA_RESV_DUMMY_0,
 				     0x00000007, 0x00000007);
-		else
+		} else {
 			MM_REG_WRITE(cmd, subsys_id, base,
 				     MDP_RDMA_RESV_DUMMY_0,
 				     0x00000000, 0x00000007);
+		}
 	}
 
 	/* Setup smi control */
@@ -129,7 +141,7 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_CON, rdma->src_ctrl,
 		     0x03C8FE0F);
 
-	if (mdp_cfg)
+	if (mdp_cfg) {
 		if (mdp_cfg->rdma_support_10bit && en_ufo) {
 			/* Setup source buffer base */
 			MM_REG_WRITE(cmd, subsys_id,
@@ -145,15 +157,51 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
 					     rdma->mf_bkgd_in_pxl, 0x001FFFFF);
 		}
 
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_CON, rdma->control,
-		     0x00001110);
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
+				     ((width + 31) >> 5) << 5, 0x001FFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_H_SIZE_IN_PXL,
+				     ((height + 7) >> 3) << 3, 0x001FFFFF);
+
+			/* Setup Compression Control */
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
+				     rdma->comp_ctrl, write_mask);
+		}
+
+		if (mdp_cfg->rdma_support_afbc &&
+		    (MDP_COLOR_IS_COMPRESS(colorformat))) {
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
+				     ((width + 31) >> 5) << 5, 0x001FFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_H_SIZE_IN_PXL,
+				     ((height + 7) >> 3) << 3, 0x001FFFFF);
+
+			/* Setup Compression Control */
+			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
+				     rdma->comp_ctrl, write_mask);
+		}
+	}
+
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_CON,
+		     rdma->control, 0x00001130);
 	/* Setup source buffer base */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_0, rdma->iova[0],
-		     0xFFFFFFFF);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_1, rdma->iova[1],
-		     0xFFFFFFFF);
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_2, rdma->iova[2],
-		     0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_0,
+		     rdma->iova[0], 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_1,
+		     rdma->iova[1], 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_2,
+		     rdma->iova[2], 0xFFFFFFFF);
 	/* Setup source buffer end */
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_0,
 		     rdma->iova_end[0], 0xFFFFFFFF);
@@ -170,6 +218,29 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
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
 
@@ -186,19 +257,32 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 	u8 subsys_id = ctx->comp->subsys_id;
 
 	/* Enable RDMA */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, 0x00000001,
-		     0x00000001);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_EN,
+			  0x00000001, 0x00000001);
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
 		     subfrm->offset[0], 0xFFFFFFFF);
 
 	/* Set 10bit UFO mode */
-	if (mdp_cfg)
-		if (mdp_cfg->rdma_support_10bit && block10bit && en_ufo)
+	if (mdp_cfg) {
+		if (mdp_cfg->rdma_support_10bit && block10bit && en_ufo) {
 			MM_REG_WRITE(cmd, subsys_id, base,
 				     MDP_RDMA_SRC_OFFSET_0_P,
 				     subfrm->offset_0_p, 0xFFFFFFFF);
+		}
+	}
 
 	/* Set U pixel offset */
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_1,
@@ -216,11 +300,13 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_OFFSET_1,
 		     subfrm->clip_ofst, 0x003F001F);
 
-	if (mdp_cfg && mdp_cfg->rdma_upsample_repeat_only)
-		if ((csf->in.right - csf->in.left + 1) > 320)
+	if (mdp_cfg && mdp_cfg->rdma_upsample_repeat_only) {
+		if ((csf->in.right - csf->in.left + 1) > 320) {
 			MM_REG_WRITE(cmd, subsys_id, base,
 				     MDP_RDMA_RESV_DUMMY_0,
 				     0x00000004, 0x00000004);
+		}
+	}
 
 	return 0;
 }
@@ -231,16 +317,28 @@ static int wait_rdma_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	u8 subsys_id = ctx->comp->subsys_id;
 	int evt = -1;
 
-	if (ctx->comp->alias_id == 0)
+	switch (ctx->comp->alias_id) {
+	case 0:
 		evt = mdp_get_event_idx(ctx->comp->mdp_dev, RDMA0_DONE);
-	else
-		pr_err("Do not support RDMA1_DONE event\n");
+		break;
+	case 1:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, RDMA1_FRAME_DONE);
+		break;
+	case 2:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, RDMA2_FRAME_DONE);
+		break;
+	case 3:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, RDMA3_FRAME_DONE);
+		break;
+	default:
+		pr_err("Invalid Engine!\n");
+	}
 
 	if (evt > 0)
 		MM_REG_WAIT(cmd, evt);
 	/* Disable RDMA */
-	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, 0x00000000,
-		     0x00000001);
+	MM_REG_WRITE_MASK(cmd, subsys_id, base, MDP_RDMA_EN, 0x00000000,
+			  0x00000001);
 	return 0;
 }
 
@@ -256,10 +354,123 @@ static const struct mdp_comp_ops rdma_ops = {
 	.post_process = NULL,
 };
 
+static int init_split(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	return 0;
+}
+
+static int config_split_frame(struct mdp_comp_ctx *ctx,
+			      struct mmsys_cmdq_cmd *cmd,
+			      const struct v4l2_rect *compose)
+{
+	return 0;
+}
+
+static int config_split_subfrm(struct mdp_comp_ctx *ctx,
+			       struct mmsys_cmdq_cmd *cmd, u32 index)
+{
+	return 0;
+}
+
+static const struct mdp_comp_ops split_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_split,
+	.config_frame = config_split_frame,
+	.config_subfrm = config_split_subfrm,
+	/* .reconfig_frame = NULL, */
+	/* .reconfig_subfrms = NULL, */
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
+static int init_stitch(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
+{
+	return 0;
+}
+
+static int config_stitch_frame(struct mdp_comp_ctx *ctx,
+			       struct mmsys_cmdq_cmd *cmd,
+			       const struct v4l2_rect *compose)
+{
+	return 0;
+}
+
+static int config_stitch_subfrm(struct mdp_comp_ctx *ctx,
+				struct mmsys_cmdq_cmd *cmd, u32 index)
+{
+	return 0;
+}
+
+static const struct mdp_comp_ops stitch_ops = {
+	.get_comp_flag = get_comp_flag,
+	.init_comp = init_stitch,
+	.config_frame = config_stitch_frame,
+	.config_subfrm = config_stitch_subfrm,
+	/* .reconfig_frame = NULL, */
+	/* .reconfig_subfrms = NULL, */
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
+	/* .reconfig_frame = NULL, */
+	/* .reconfig_subfrms = NULL, */
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
 static int init_rsz(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
+	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	u32 value = 0, mask = 0, alias_id = 0;
 
 	/* Reset RSZ */
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x00010000,
@@ -269,6 +480,32 @@ static int init_rsz(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	/* Enable RSZ */
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x00000001,
 		     0x00000001);
+
+	if (mdp_cfg && mdp_cfg->mdp_version_8195) {
+		enum mdp_comp_id id = ctx->comp->id;
+		const struct mtk_mdp_driver_data *data = ctx->comp->mdp_dev->mdp_data;
+
+		value = (1 << 25);
+		mask = (1 << 25);
+		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_1ST_DIS0];
+		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2,
+				    cmd, alias_id, value, mask);
+
+		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_2ND_DIS0];
+		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2,
+				    cmd, alias_id, value, mask);
+
+		value = (1 << 4 | 1 << 5);
+		mask = (1 << 4 | 1 << 5);
+		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_1ST_DIS1];
+		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2,
+				    cmd, alias_id, value, mask);
+
+		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_2ND_DIS1];
+		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2,
+				    cmd, alias_id, value, mask);
+	}
+
 	return 0;
 }
 
@@ -277,9 +514,13 @@ static int config_rsz_frame(struct mdp_comp_ctx *ctx,
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
 		MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x00000000,
@@ -320,23 +561,58 @@ static int config_rsz_subfrm(struct mdp_comp_ctx *ctx,
 
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_HORIZONTAL_INTEGER_OFFSET,
 		     csf->luma.left, 0x0000FFFF);
-	MM_REG_WRITE(cmd, subsys_id,
-		     base, PRZ_LUMA_HORIZONTAL_SUBPIXEL_OFFSET,
+	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_HORIZONTAL_SUBPIXEL_OFFSET,
 		     csf->luma.left_subpix, 0x001FFFFF);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_INTEGER_OFFSET,
 		     csf->luma.top, 0x0000FFFF);
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_SUBPIXEL_OFFSET,
 		     csf->luma.top_subpix, 0x001FFFFF);
-	MM_REG_WRITE(cmd, subsys_id,
-		     base, PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET,
+	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET,
 		     csf->chroma.left, 0x0000FFFF);
-	MM_REG_WRITE(cmd, subsys_id,
-		     base, PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET,
+	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET,
 		     csf->chroma.left_subpix, 0x001FFFFF);
 
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_OUTPUT_IMAGE, subfrm->clip,
 		     0xFFFFFFFF);
 
+	if (mdp_cfg && mdp_cfg->mdp_version_8195) {
+		struct mdp_comp *merge;
+		const struct mtk_mdp_driver_data *data = ctx->comp->mdp_dev->mdp_data;
+		enum mtk_mdp_comp_id id = data->comp_data[ctx->comp->id].match.public_id;
+		u32 alias_id = 0;
+
+		if (id == MDP_COMP_RSZ2) {
+			merge = ctx->comp->mdp_dev->comp[MDP_MERGE2];
+
+			alias_id = data->config_table[CONFIG_SVPP2_BUF_BF_RSZ_SWITCH];
+			mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2, cmd,
+					    alias_id, subfrm->rsz_switch, 0xFFFFFFFF);
+		} else if (id == MDP_COMP_RSZ3) {
+			merge = ctx->comp->mdp_dev->comp[MDP_MERGE3];
+
+			alias_id = data->config_table[CONFIG_SVPP3_BUF_BF_RSZ_SWITCH];
+			mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2, cmd,
+					    alias_id, subfrm->rsz_switch, 0xFFFFFFFF);
+		} else {
+			goto subfrm_done;
+		}
+
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_CFG_0, subfrm->merge_cfg, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_CFG_4, subfrm->merge_cfg, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_CFG_24, subfrm->merge_cfg, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_CFG_25, subfrm->merge_cfg, 0xFFFFFFFF);
+
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_CFG_12, 0x1, 0xFFFFFFFF); // bypass mode
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_ENABLE, 0x1, 0xFFFFFFFF);
+	}
+
+subfrm_done:
 	return 0;
 }
 
@@ -370,6 +646,485 @@ static const struct mdp_comp_ops rsz_ops = {
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
+	/* .reconfig_frame = NULL, */
+	/* .reconfig_subfrms = NULL, */
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
+	/* .reconfig_frame = NULL, */
+	/* .reconfig_subfrms = NULL, */
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
+
+void reset_luma_hist(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
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
+
+	if (mdp_cfg && mdp_cfg->tdshp_1_1 == 2) {
+		MM_REG_WRITE(cmd, subsys_id, base,
+			     MDP_LUMA_SUM_INIT, 0, 0xFFFFFFFF);
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
+	/* .reconfig_frame = NULL, */
+	/* .reconfig_subfrms = NULL, */
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
+	/* .reconfig_frame = NULL, */
+	/* .reconfig_subfrms = NULL, */
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
+	/* .reconfig_frame = NULL, */
+	/* .reconfig_subfrms = NULL, */
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
+	/* .reconfig_frame = NULL, */
+	/* .reconfig_subfrms = NULL, */
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
+	/* .reconfig_frame = NULL, */
+	/* .reconfig_subfrms = NULL, */
+	.wait_comp_event = NULL,
+	.advance_subfrm = NULL,
+	.post_process = NULL,
+};
 static int init_wrot(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
 	phys_addr_t base = ctx->comp->reg_base;
@@ -379,6 +1134,8 @@ static int init_wrot(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, 0x01, 0x00000001);
 	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x01,
 		    0x00000001);
+	/* Reset setting */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, 0x0, 0xFFFFFFFF);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, 0x00, 0x00000001);
 	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x00,
 		    0x00000001);
@@ -391,8 +1148,12 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 {
 	const struct mdp_wrot_data *wrot = &ctx->param->wrot;
 	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
+	const struct mtk_mdp_driver_data *data = ctx->comp->mdp_dev->mdp_data;
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	bool comp = 0;
+	u32 colorformat = ctx->outputs[0]->buffer.format.colorformat;
+	u32 alias_id = 0;
 
 	/* Write frame base address */
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR, wrot->iova[0],
@@ -401,9 +1162,35 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 		     0xFFFFFFFF);
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_V, wrot->iova[2],
 		     0xFFFFFFFF);
+
+	if (mdp_cfg && mdp_cfg->wrot_support_afbc) {
+		comp = MDP_COLOR_IS_COMPRESS(colorformat);
+		if (comp) {
+			MM_REG_WRITE(cmd, subsys_id, base, VIDO_FRAME_SIZE,
+				     wrot->framesize, 0xFFFFFFFF);
+			MM_REG_WRITE(cmd, subsys_id, base, VIDO_AFBC_YUVTRANS,
+				     wrot->afbc_yuvtrans, 0x1);
+		}
+		MM_REG_WRITE(cmd, subsys_id, base, VIDO_PVRIC,  wrot->pvric, 0x03);
+	}
+
+	if (mdp_cfg && mdp_cfg->wrot_support_10bit) {
+		MM_REG_WRITE(cmd, subsys_id, base, VIDO_SCAN_10BIT,
+			     wrot->scan_10bit, 0x0000000F);
+		MM_REG_WRITE(cmd, subsys_id, base, VIDO_PENDING_ZERO,
+			     wrot->pending_zero, 0x04000000);
+	}
+	if (mdp_cfg && mdp_cfg->mdp_version_6885)
+		MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL_2, wrot->bit_number, 0x00000007);
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
@@ -431,6 +1218,25 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
 			     wrot->filter, 0x00000077);
 
+	/* Turn off WROT dma dcm */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN,
+		     (0x1 << 23) + (0x1 << 20), 0x00900000);
+
+	if (wrot->vpp02vpp1) {
+		// Disable DCM (VPP02VPP1_RELAY)
+		alias_id = data->config_table[CONFIG_VPP0_HW_DCM_1ST_DIS0];
+		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys, cmd,
+				    alias_id, 0x4000, 0xFFFFFFFF);
+		// Set default size
+		alias_id = data->config_table[CONFIG_VPP0_DL_IRELAY_WR];
+		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys2, cmd,
+				    alias_id, 0x0, 0xFFFFFFFF);
+	} else {
+		alias_id = data->config_table[CONFIG_VPP0_HW_DCM_1ST_DIS0];
+		mtk_mmsys_write_reg(ctx->comp->mdp_dev->mdp_mmsys, cmd,
+				    alias_id, 0x0, 0xFFFFFFFF);
+	}
+
 	return 0;
 }
 
@@ -459,6 +1265,9 @@ static int config_wrot_subfrm(struct mdp_comp_ctx *ctx,
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CROP_OFST, subfrm->clip_ofst,
 		     0x1FFF1FFF);
 
+	// Set wrot interrupt bit for debug, this bit will clear to 0 after wrot done.
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_INT, 0x1, VIDO_INT_MASK);
+
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
 		     subfrm->main_buf, 0x1FFF7F00);
 
@@ -475,11 +1284,22 @@ static int wait_wrot_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	u8 subsys_id = ctx->comp->subsys_id;
 	int evt = -1;
 
-	if (ctx->comp->alias_id == 0)
+	switch (ctx->comp->alias_id) {
+	case 0:
 		evt = mdp_get_event_idx(ctx->comp->mdp_dev, WROT0_DONE);
-	else
-		pr_err("Do not support WROT1_DONE event\n");
-
+		break;
+	case 1:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, WROT1_FRAME_DONE);
+		break;
+	case 2:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, WROT2_FRAME_DONE);
+		break;
+	case 3:
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, WROT3_FRAME_DONE);
+		break;
+	default:
+		pr_err("Invalid Engine!\n");
+	}
 	if (evt > 0)
 		MM_REG_WAIT(cmd, evt);
 
@@ -906,17 +1726,30 @@ static const struct mdp_comp_ops camin_ops = {
 };
 
 static const struct mdp_comp_ops *mdp_comp_ops[MDP_COMP_TYPE_COUNT] = {
-	[MDP_COMP_TYPE_RDMA] =		&rdma_ops,
-	[MDP_COMP_TYPE_RSZ] =		&rsz_ops,
-	[MDP_COMP_TYPE_WROT] =		&wrot_ops,
-	[MDP_COMP_TYPE_WDMA] =		&wdma_ops,
-	[MDP_COMP_TYPE_PATH1] =		NULL,
-	[MDP_COMP_TYPE_PATH2] =		NULL,
-	[MDP_COMP_TYPE_CCORR] =		&ccorr_ops,
-	[MDP_COMP_TYPE_IMGI] =		&imgi_ops,
-	[MDP_COMP_TYPE_EXTO] =		NULL,
-	[MDP_COMP_TYPE_DL_PATH1] =	&camin_ops,
-	[MDP_COMP_TYPE_DL_PATH2] =	&camin_ops,
+	[MDP_COMP_TYPE_WPEI]     = &camin_ops,
+	[MDP_COMP_TYPE_SPLIT]    = &split_ops,
+	[MDP_COMP_TYPE_STITCH]   = &stitch_ops,
+	[MDP_COMP_TYPE_RDMA]     = &rdma_ops,
+	[MDP_COMP_TYPE_FG]       = &fg_ops,
+	[MDP_COMP_TYPE_HDR]      = &hdr_ops,
+	[MDP_COMP_TYPE_AAL]      = &aal_ops,
+	[MDP_COMP_TYPE_RSZ]      = &rsz_ops,
+	[MDP_COMP_TYPE_TDSHP]    = &tdshp_ops,
+	[MDP_COMP_TYPE_COLOR]    = &color_ops,
+	[MDP_COMP_TYPE_OVL]      = &ovl_ops,
+	[MDP_COMP_TYPE_PAD]      = &pad_ops,
+	[MDP_COMP_TYPE_TCC]      = &tcc_ops,
+	[MDP_COMP_TYPE_WROT]     = &wrot_ops,
+	[MDP_COMP_TYPE_WDMA]     = &wdma_ops,
+	[MDP_COMP_TYPE_MERGE]    = NULL,
+	[MDP_COMP_TYPE_PATH1]    = NULL,
+	[MDP_COMP_TYPE_PATH2]    = NULL,
+	[MDP_COMP_TYPE_CCORR]    = &ccorr_ops,
+	[MDP_COMP_TYPE_IMGI]     = &imgi_ops,
+	[MDP_COMP_TYPE_EXTO]     = NULL,
+	[MDP_COMP_TYPE_DL_PATH1] = &camin_ops,
+	[MDP_COMP_TYPE_DL_PATH2] = &camin_ops,
+	[MDP_COMP_TYPE_DUMMY]    = NULL,
 };
 
 static const struct of_device_id mdp_comp_dt_ids[] = {
@@ -935,6 +1768,39 @@ static const struct of_device_id mdp_comp_dt_ids[] = {
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-wdma",
 		.data = (void *)MDP_COMP_TYPE_WDMA,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-split",
+		.data = (void *)MDP_COMP_TYPE_SPLIT,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-stitch",
+		.data = (void *)MDP_COMP_TYPE_STITCH,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-fg",
+		.data = (void *)MDP_COMP_TYPE_FG,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-hdr",
+		.data = (void *)MDP_COMP_TYPE_HDR,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-aal",
+		.data = (void *)MDP_COMP_TYPE_AAL,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-merge",
+		.data = (void *)MDP_COMP_TYPE_MERGE,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tdshp",
+		.data = (void *)MDP_COMP_TYPE_TDSHP,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-color",
+		.data = (void *)MDP_COMP_TYPE_COLOR,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-ovl",
+		.data = (void *)MDP_COMP_TYPE_OVL,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-pad",
+		.data = (void *)MDP_COMP_TYPE_PAD,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-tcc",
+		.data = (void *)MDP_COMP_TYPE_TCC,
 	},
 	{}
 };
@@ -952,12 +1818,36 @@ static const struct of_device_id mdp_sub_comp_dt_ids[] = {
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-exto",
 		.data = (void *)MDP_COMP_TYPE_EXTO,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-path1",
+		.data = (void *)MDP_COMP_TYPE_PATH1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-path2",
+		.data = (void *)MDP_COMP_TYPE_PATH2,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-dl1",
 		.data = (void *)MDP_COMP_TYPE_DL_PATH1,
 	}, {
 		.compatible = "mediatek,mt8183-mdp3-dl2",
 		.data = (void *)MDP_COMP_TYPE_DL_PATH2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-dl1",
+		.data = (void *)MDP_COMP_TYPE_DL_PATH1,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-dl2",
+		.data = (void *)MDP_COMP_TYPE_DL_PATH2,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-dl3",
+		.data = (void *)MDP_COMP_TYPE_DL_PATH3,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-dl4",
+		.data = (void *)MDP_COMP_TYPE_DL_PATH4,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-dl5",
+		.data = (void *)MDP_COMP_TYPE_DL_PATH5,
+	}, {
+		.compatible = "mediatek,mt8195-mdp3-dl6",
+		.data = (void *)MDP_COMP_TYPE_DL_PATH6,
 	},
 	{}
 };
@@ -1304,3 +2194,198 @@ int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 		ctx->outputs[i] = &frame->outputs[param->outputs[i]];
 	return 0;
 }
+
+int mdp_hyfbc_patch(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
+		    struct hyfbc_patch_info *hyfbc, enum mdp_comp_id wrot)
+{
+#define is_wrot(id) \
+	((mdp)->mdp_data->comp_data[id].match.type == MDP_COMP_TYPE_WROT)
+
+#define byte2pixel(byte) ((byte) / 2)
+
+	struct mtk_mutex **mutex = mdp->mdp_mutex;
+	struct mtk_mutex **mutex2 = mdp->mdp_mutex2;
+	enum mtk_mdp_comp_id mtk_wrot = MDP_COMP_NONE;
+	phys_addr_t base;
+	u16 subsys_id;
+	u32 offset;
+	u32 mutex_id;
+	u32 mutex2_id;
+	u32 alias_id;
+	int evt;
+
+	if (!is_wrot(wrot)) {
+		pr_info("Invalid wrot id %d", wrot);
+		return -EINVAL;
+	}
+
+	base = mdp->comp[wrot]->reg_base;
+	subsys_id = mdp->comp[wrot]->subsys_id;
+	offset = hyfbc->width_in_mb * hyfbc->byte_per_mb;
+
+	/* Reset WROT */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST,
+		     0x01, 0x00000001);
+	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT,
+		    0x01, 0x00000001);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST,
+		     0x00, 0x00000001);
+	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT,
+		    0x00, 0x00000001);
+
+	/* Write frame base address */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR,
+		     (hyfbc->pa_base + offset), 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_C,
+		     0x0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_V,
+		     0x0, 0xFFFFFFFF);
+
+	/* Write frame related registers */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL,
+		     0x5020, 0xF131512F);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BKGD,
+		     ((hyfbc->is10b) ? 0xC8E438 : 0x18f4f8), 0xFFFFFFFF);
+
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SCAN_10BIT,
+		     0x0, 0x0000000F);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_PENDING_ZERO,
+		     0x0, 0x04000000);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL_2,
+		     0x0, 0x00000007);
+
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_PVRIC,
+		     0x0, 0x03);
+	/* Write pre-ultra threshold */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_DMA_PREULTRA,
+		     0x8804c, 0x00FFFFFF);
+	/* Write frame Y pitch */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE,
+		     (hyfbc->w_stride_in_mb * hyfbc->byte_per_mb), 0x0000FFFF);
+	/* Write frame UV pitch */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE_C,
+		     0x0, 0x0000FFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE_V,
+		     0x0, 0x0000FFFF);
+	/* Write matrix control */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAT_CTRL,
+		     0x60, 0x000000F3);
+
+	/* Set the fixed ALPHA as 0xFF */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_DITHER,
+		     0xFF000000, 0xFF000000);
+	/* Set VIDO_EOL_SEL */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_RSV_1,
+		     0x80000000, 0x80000000);
+	/* Set VIDO_FIFO_TEST */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_FIFO_TEST,
+		     0x200, 0x00000FFF);
+
+	/* Filter enable */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
+		     0x0, 0x00000077);
+
+	/* Turn off WROT dma dcm */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN,
+		     (0x1 << 23) + (0x1 << 20), 0x00900000);
+
+	alias_id = mdp->mdp_data->config_table[CONFIG_VPP0_HW_DCM_1ST_DIS0];
+	mtk_mmsys_write_reg(mdp->mdp_mmsys, cmd,
+			    alias_id, 0x0, 0xFFFFFFFF);
+
+	mtk_wrot = mdp->mdp_data->comp_data[wrot].match.public_id;
+	/* Set mutex modules */
+	switch (mtk_wrot) {
+	case MDP_COMP_WROT0:
+		mutex_id = 2;
+		mtk_mutex_add_mdp_mod(mutex[mutex_id],
+				      0x800, 0x0, 0x0, cmd);
+		break;
+	case MDP_COMP_WROT1:
+		mutex2_id = 1;
+		mtk_mutex_add_mdp_mod(mutex2[mutex2_id],
+				      0x80000000, 0x0, 0x0, cmd);
+		break;
+	case MDP_COMP_WROT2:
+		mutex2_id = 2;
+		mtk_mutex_add_mdp_mod(mutex2[mutex2_id],
+				      0x0, 0x1, 0x0, cmd);
+		break;
+	case MDP_COMP_WROT3:
+		mutex2_id = 3;
+		mtk_mutex_add_mdp_mod(mutex2[mutex2_id],
+				      0x0, 0x2, 0x0, cmd);
+		break;
+	default:
+		break;
+	}
+
+	/* Write Y pixel offset */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR,
+		     0x0, 0x0FFFFFFF);
+	/* Write U pixel offset */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR_C,
+		     0x0, 0x0FFFFFFF);
+	/* Write V pixel offset */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR_V,
+		     0x0, 0x0FFFFFFF);
+	/* Write source size */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_IN_SIZE,
+		     (hyfbc->height_in_mb << 16) | byte2pixel(hyfbc->byte_per_mb), 0xFFFFFFFF);
+	/* Write target size */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_TAR_SIZE,
+		     (hyfbc->height_in_mb << 16) | byte2pixel(hyfbc->byte_per_mb), 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CROP_OFST, 0x0,
+		     0xFFFFFFFF);
+
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
+		     ((byte2pixel(hyfbc->byte_per_mb) << 16) | 0x400), 0xFFFF7F00);
+
+	// Set wrot interrupt bit for debug, this bit will clear to 0 after wrot done.
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_INT, 0x1, VIDO_INT_MASK);
+
+	/* Enable WROT */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN, 0x01, 0x00000001);
+
+	switch (mtk_wrot) {
+	case MDP_COMP_WROT0:
+		evt = mdp_get_event_idx(mdp, WROT0_SOF);
+		MM_REG_CLEAR(cmd, evt);
+		mtk_mutex_enable_by_cmdq(mutex[mutex_id], cmd);
+		MM_REG_WAIT(cmd, evt);
+		evt = mdp_get_event_idx(mdp, WROT0_DONE);
+		MM_REG_WAIT(cmd, evt);
+		break;
+	case MDP_COMP_WROT1:
+		evt = mdp_get_event_idx(mdp, WROT1_SOF);
+		MM_REG_CLEAR(cmd, evt);
+		mtk_mutex_enable_by_cmdq(mutex2[mutex2_id], cmd);
+		MM_REG_WAIT(cmd, evt);
+		evt = mdp_get_event_idx(mdp, WROT1_FRAME_DONE);
+		MM_REG_WAIT(cmd, evt);
+		break;
+	case MDP_COMP_WROT2:
+		evt = mdp_get_event_idx(mdp, WROT2_SOF);
+		MM_REG_CLEAR(cmd, evt);
+		mtk_mutex_enable_by_cmdq(mutex2[mutex2_id], cmd);
+		MM_REG_WAIT(cmd, evt);
+		evt = mdp_get_event_idx(mdp, WROT2_FRAME_DONE);
+		MM_REG_WAIT(cmd, evt);
+		break;
+	case MDP_COMP_WROT3:
+		evt = mdp_get_event_idx(mdp, WROT3_SOF);
+		MM_REG_CLEAR(cmd, evt);
+		mtk_mutex_enable_by_cmdq(mutex2[mutex2_id], cmd);
+		MM_REG_WAIT(cmd, evt);
+		evt = mdp_get_event_idx(mdp, WROT3_FRAME_DONE);
+		MM_REG_WAIT(cmd, evt);
+		break;
+	default:
+		break;
+	}
+
+	/* Disable WROT */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN, 0x00, 0x00000001);
+
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index 02957abd12d0..41833ecd6752 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -123,6 +123,76 @@ enum mdp_comp_id {
 	MT8183_MDP_COMP_WROT1,          /* 25 */
 	MT8183_MDP_MAX_COMP_COUNT,
 
+	/* MT8195 Comp id */
+	/* ISP */
+	MT8195_MDP_COMP_WPEI = 0,
+	MT8195_MDP_COMP_WPEO,           /* 1 */
+	MT8195_MDP_COMP_WPEI2,          /* 2 */
+	MT8195_MDP_COMP_WPEO2,          /* 3 */
+
+	/* MDP */
+	MT8195_MDP_COMP_CAMIN,          /* 4 */
+	MT8195_MDP_COMP_CAMIN2,         /* 5 */
+	MT8195_MDP_COMP_SPLIT,          /* 6 */
+	MT8195_MDP_COMP_SPLIT2,         /* 7 */
+	MT8195_MDP_COMP_RDMA0,          /* 8 */
+	MT8195_MDP_COMP_RDMA1,          /* 9 */
+	MT8195_MDP_COMP_RDMA2,          /* 10 */
+	MT8195_MDP_COMP_RDMA3,          /* 11 */
+	MT8195_MDP_COMP_STITCH,         /* 12 */
+	MT8195_MDP_COMP_FG0,            /* 13 */
+	MT8195_MDP_COMP_FG1,            /* 14 */
+	MT8195_MDP_COMP_FG2,            /* 15 */
+	MT8195_MDP_COMP_FG3,            /* 16 */
+	MT8195_MDP_COMP_TO_SVPP2MOUT,   /* 17 */
+	MT8195_MDP_COMP_TO_SVPP3MOUT,   /* 18 */
+	MT8195_MDP_COMP_TO_WARP0MOUT,   /* 19 */
+	MT8195_MDP_COMP_TO_WARP1MOUT,   /* 20 */
+	MT8195_MDP_COMP_VPP0_SOUT,      /* 21 */
+	MT8195_MDP_COMP_VPP1_SOUT,      /* 22 */
+	MT8195_MDP_COMP_PQ0_SOUT,       /* 23 */
+	MT8195_MDP_COMP_PQ1_SOUT,       /* 24 */
+	MT8195_MDP_COMP_HDR0,           /* 25 */
+	MT8195_MDP_COMP_HDR1,           /* 26 */
+	MT8195_MDP_COMP_HDR2,           /* 27 */
+	MT8195_MDP_COMP_HDR3,           /* 28 */
+	MT8195_MDP_COMP_AAL0,           /* 29 */
+	MT8195_MDP_COMP_AAL1,           /* 30 */
+	MT8195_MDP_COMP_AAL2,           /* 31 */
+	MT8195_MDP_COMP_AAL3,           /* 32 */
+	MT8195_MDP_COMP_RSZ0,           /* 33 */
+	MT8195_MDP_COMP_RSZ1,           /* 34 */
+	MT8195_MDP_COMP_RSZ2,           /* 35 */
+	MT8195_MDP_COMP_RSZ3,           /* 36 */
+	MT8195_MDP_COMP_TDSHP0,         /* 37 */
+	MT8195_MDP_COMP_TDSHP1,         /* 38 */
+	MT8195_MDP_COMP_TDSHP2,         /* 39 */
+	MT8195_MDP_COMP_TDSHP3,         /* 40 */
+	MT8195_MDP_COMP_COLOR0,         /* 41 */
+	MT8195_MDP_COMP_COLOR1,         /* 42 */
+	MT8195_MDP_COMP_COLOR2,         /* 43 */
+	MT8195_MDP_COMP_COLOR3,         /* 44 */
+	MT8195_MDP_COMP_OVL0,           /* 45 */
+	MT8195_MDP_COMP_OVL1,           /* 46 */
+	MT8195_MDP_COMP_PAD0,           /* 47 */
+	MT8195_MDP_COMP_PAD1,           /* 48 */
+	MT8195_MDP_COMP_PAD2,           /* 49 */
+	MT8195_MDP_COMP_PAD3,           /* 50 */
+	MT8195_MDP_COMP_TCC0,           /* 51 */
+	MT8195_MDP_COMP_TCC1,           /* 52 */
+	MT8195_MDP_COMP_WROT0,          /* 53 */
+	MT8195_MDP_COMP_WROT1,          /* 54 */
+	MT8195_MDP_COMP_WROT2,          /* 55 */
+	MT8195_MDP_COMP_WROT3,          /* 56 */
+	MT8195_MDP_COMP_MERGE2,         /* 57 */
+	MT8195_MDP_COMP_MERGE3,         /* 58 */
+
+	MT8195_MDP_COMP_VDO0DL0,        /* 59 */
+	MT8195_MDP_COMP_VDO1DL0,        /* 60 */
+	MT8195_MDP_COMP_VDO0DL1,        /* 61 */
+	MT8195_MDP_COMP_VDO1DL1,        /* 62 */
+	MT8195_MDP_MAX_COMP_COUNT,
+
 	MDP_MAX_COMP      /* ALWAYS keep at the end */
 };
 
@@ -269,6 +339,16 @@ struct mdp_comp_info {
 	u32	dts_reg_ofst;
 };
 
+struct hyfbc_patch_info {
+	bool is10b;
+	u32 width_in_mb;
+	u32 height_in_mb;
+	u32 w_stride_in_mb;
+	u32 h_stride_in_mb;
+	u32 byte_per_mb;
+	u32 pa_base;
+};
+
 struct mdp_comp_ops;
 
 struct mdp_comp {
@@ -328,7 +408,8 @@ void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num);
 int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 		      const struct img_compparam *param,
 	const struct img_ipi_frameparam *frame);
-
+int mdp_hyfbc_patch(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
+		    struct hyfbc_patch_info *hyfbc, enum mdp_comp_id wrot);
 int mdp_get_event_idx(struct mdp_dev *mdp, enum mdp_comp_event event);
 
 #endif  /* __MTK_MDP3_COMP_H__ */
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index 4f7d8bc1bf24..b167cec05815 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -18,12 +18,30 @@
 /* MDP debug log level (0-3). 3 shows all the logs. */
 
 static const struct mdp_platform_config mt8183_plat_cfg = {
-	.rdma_support_10bit		= true,
-	.rdma_rsz1_sram_sharing		= true,
-	.rdma_upsample_repeat_only	= true,
-	.rsz_disable_dcm_small_sample	= false,
-	.wrot_filter_constraint		= false,
-	.gce_event_offset		= 0,
+	.rdma_support_10bit             = true,
+	.rdma_rsz1_sram_sharing         = true,
+	.rdma_upsample_repeat_only      = true,
+	.rsz_disable_dcm_small_sample   = false,
+	.wrot_filter_constraint         = false,
+	.gce_event_offset               = 0,
+};
+
+static const struct mdp_platform_config mt8195_plat_cfg = {
+	.rdma_support_10bit             = true,
+	.rdma_support_extend_ufo        = true,
+	.rdma_support_hyfbc             = true,
+	.rdma_support_afbc              = true,
+	.rdma_esl_setting               = true,
+	.rdma_rsz1_sram_sharing         = false,
+	.rdma_upsample_repeat_only      = true,
+	.rsz_disable_dcm_small_sample   = false,
+	.rsz_etc_control                = true,
+	.wrot_filter_constraint         = false,
+	.tdshp_1_1                      = true,
+	.tdshp_dyn_contrast_version     = 2,
+	.mdp_version_8195               = true,
+	.mdp_version_6885               = true,
+	.gce_event_offset               = 0,
 };
 
 static const struct mdp_comp_list mt8183_comp_list = {
@@ -88,6 +106,68 @@ static const struct mdp_comp_list mt8183_comp_list = {
 	.path1_sout	= MT8183_MDP_COMP_PATH1_SOUT,
 };
 
+static const struct mdp_comp_list mt8195_comp_list = {
+	.wpei		= MT8195_MDP_COMP_WPEI,
+	.wpeo		= MT8195_MDP_COMP_WPEO,
+	.wpei2		= MT8195_MDP_COMP_WPEI2,
+	.wpeo2		= MT8195_MDP_COMP_WPEO2,
+	.camin		= MT8195_MDP_COMP_CAMIN,
+	.camin2		= MT8195_MDP_COMP_CAMIN2,
+	.split		= MT8195_MDP_COMP_SPLIT,
+	.split2		= MT8195_MDP_COMP_SPLIT2,
+	.rdma0		= MT8195_MDP_COMP_RDMA0,
+	.rdma1		= MT8195_MDP_COMP_RDMA1,
+	.rdma2		= MT8195_MDP_COMP_RDMA2,
+	.rdma3		= MT8195_MDP_COMP_RDMA3,
+	.stitch		= MT8195_MDP_COMP_STITCH,
+	.fg0		= MT8195_MDP_COMP_FG0,
+	.fg1		= MT8195_MDP_COMP_FG1,
+	.fg2		= MT8195_MDP_COMP_FG2,
+	.fg3		= MT8195_MDP_COMP_FG3,
+	.hdr0		= MT8195_MDP_COMP_HDR0,
+	.hdr1		= MT8195_MDP_COMP_HDR1,
+	.hdr2		= MT8195_MDP_COMP_HDR2,
+	.hdr3		= MT8195_MDP_COMP_HDR3,
+	.aal0		= MT8195_MDP_COMP_AAL0,
+	.aal1		= MT8195_MDP_COMP_AAL1,
+	.aal2		= MT8195_MDP_COMP_AAL2,
+	.aal3		= MT8195_MDP_COMP_AAL3,
+	.rsz0		= MT8195_MDP_COMP_RSZ0,
+	.rsz1		= MT8195_MDP_COMP_RSZ1,
+	.rsz2		= MT8195_MDP_COMP_RSZ2,
+	.rsz3		= MT8195_MDP_COMP_RSZ3,
+	.tdshp0		= MT8195_MDP_COMP_TDSHP0,
+	.tdshp1		= MT8195_MDP_COMP_TDSHP1,
+	.tdshp2		= MT8195_MDP_COMP_TDSHP2,
+	.tdshp3		= MT8195_MDP_COMP_TDSHP3,
+	.color0		= MT8195_MDP_COMP_COLOR0,
+	.color1		= MT8195_MDP_COMP_COLOR1,
+	.color2		= MT8195_MDP_COMP_COLOR2,
+	.color3		= MT8195_MDP_COMP_COLOR3,
+	.ccorr0		= MDP_COMP_INVALID,
+	.ovl0		= MT8195_MDP_COMP_OVL0,
+	.ovl1		= MT8195_MDP_COMP_OVL1,
+	.pad0		= MT8195_MDP_COMP_PAD0,
+	.pad1		= MT8195_MDP_COMP_PAD1,
+	.pad2		= MT8195_MDP_COMP_PAD2,
+	.pad3		= MT8195_MDP_COMP_PAD3,
+	.tcc0		= MT8195_MDP_COMP_TCC0,
+	.tcc1		= MT8195_MDP_COMP_TCC1,
+	.wrot0		= MT8195_MDP_COMP_WROT0,
+	.wrot1		= MT8195_MDP_COMP_WROT1,
+	.wrot2		= MT8195_MDP_COMP_WROT2,
+	.wrot3		= MT8195_MDP_COMP_WROT3,
+	.merge2		= MT8195_MDP_COMP_MERGE2,
+	.merge3		= MT8195_MDP_COMP_MERGE3,
+	.wdma		= MDP_COMP_INVALID,
+	.vdo0dl0	= MT8195_MDP_COMP_VDO0DL0,
+	.vdo1dl0	= MT8195_MDP_COMP_VDO1DL0,
+	.vdo0dl1	= MT8195_MDP_COMP_VDO0DL1,
+	.vdo1dl1	= MT8195_MDP_COMP_VDO1DL1,
+	.path0_sout	= MDP_COMP_INVALID,
+	.path1_sout	= MDP_COMP_INVALID,
+};
+
 static const struct mdp_comp_data mt8183_mdp_comp_data[MT8183_MDP_MAX_COMP_COUNT] = {
 	[MT8183_MDP_COMP_WPEI] = { {MDP_COMP_TYPE_WPEI, 0, MDP_COMP_WPEI}, {0, 0, 0} },
 	[MT8183_MDP_COMP_WPEO] = { {MDP_COMP_TYPE_EXTO, 2, MDP_COMP_WPEO}, {0, 0, 0} },
@@ -111,6 +191,261 @@ static const struct mdp_comp_data mt8183_mdp_comp_data[MT8183_MDP_MAX_COMP_COUNT
 	[MT8183_MDP_COMP_WDMA] = { {MDP_COMP_TYPE_WDMA, 0, MDP_COMP_WDMA}, {0, BIT(8), 0} },
 };
 
+static const struct mdp_comp_data mt8195_mdp_comp_data[MT8195_MDP_MAX_COMP_COUNT] = {
+	[MT8195_MDP_COMP_WPEI] = {
+		{MDP_COMP_TYPE_WPEI, 0, MDP_COMP_WPEI},
+		{0, BIT(13), 0}
+	},
+	[MT8195_MDP_COMP_WPEO] = {
+		{MDP_COMP_TYPE_EXTO, 2, MDP_COMP_WPEO},
+		{0, 0, 0}
+	},
+	[MT8195_MDP_COMP_WPEI2] = {
+		{MDP_COMP_TYPE_WPEI, 1, MDP_COMP_WPEI2},
+		{0, BIT(14), 0}
+	},
+	[MT8195_MDP_COMP_WPEO2] = {
+		{MDP_COMP_TYPE_EXTO, 3, MDP_COMP_WPEO2},
+		{0, 0, 0}
+	},
+	[MT8195_MDP_COMP_CAMIN] = {
+		{MDP_COMP_TYPE_DL_PATH1, 0, MDP_COMP_CAMIN},
+		{0, 0, 0}
+	},
+	[MT8195_MDP_COMP_CAMIN2] = {
+		{MDP_COMP_TYPE_DL_PATH2, 1, MDP_COMP_CAMIN2},
+		{0, 0, 0}
+	},
+	[MT8195_MDP_COMP_SPLIT] = {
+		{MDP_COMP_TYPE_SPLIT, 0, MDP_COMP_SPLIT},
+		{1, 0, BIT(2)}
+	},
+	[MT8195_MDP_COMP_SPLIT2] = {
+		{MDP_COMP_TYPE_SPLIT, 1, MDP_COMP_SPLIT2},
+		{1, BIT(2), 0}
+	},
+	[MT8195_MDP_COMP_RDMA0] = {
+		{MDP_COMP_TYPE_RDMA, 0, MDP_COMP_RDMA0},
+		{0, BIT(0), 0}
+	},
+	[MT8195_MDP_COMP_RDMA1] = {
+		{MDP_COMP_TYPE_RDMA, 1, MDP_COMP_RDMA1},
+		{1, BIT(4), 0}
+	},
+	[MT8195_MDP_COMP_RDMA2] = {
+		{MDP_COMP_TYPE_RDMA, 2, MDP_COMP_RDMA2},
+		{1, BIT(5), 0}
+	},
+	[MT8195_MDP_COMP_RDMA3] = {
+		{MDP_COMP_TYPE_RDMA, 3, MDP_COMP_RDMA3},
+		{1, BIT(6), 0}
+	},
+	[MT8195_MDP_COMP_STITCH] = {
+		{MDP_COMP_TYPE_STITCH, 0, MDP_COMP_STITCH},
+		{0, BIT(2), 0}
+	},
+	[MT8195_MDP_COMP_FG0] = {
+		{MDP_COMP_TYPE_FG, 0, MDP_COMP_FG0},
+		{0, BIT(1), 0}
+	},
+	[MT8195_MDP_COMP_FG1] = {
+		{MDP_COMP_TYPE_FG, 1, MDP_COMP_FG1},
+		{1, BIT(7), 0}
+	},
+	[MT8195_MDP_COMP_FG2] = {
+		{MDP_COMP_TYPE_FG, 2, MDP_COMP_FG2},
+		{1, BIT(8), 0}
+	},
+	[MT8195_MDP_COMP_FG3] = {
+		{MDP_COMP_TYPE_FG, 3, MDP_COMP_FG3},
+		{1, BIT(9), 0}
+	},
+	[MT8195_MDP_COMP_HDR0] = {
+		{MDP_COMP_TYPE_HDR, 0, MDP_COMP_HDR0},
+		{0, BIT(3), 0}
+	},
+	[MT8195_MDP_COMP_HDR1] = {
+		{MDP_COMP_TYPE_HDR, 1, MDP_COMP_HDR1},
+		{1, BIT(10), 0}
+	},
+	[MT8195_MDP_COMP_HDR2] = {
+		{MDP_COMP_TYPE_HDR, 2, MDP_COMP_HDR2},
+		{1, BIT(11), 0}
+	},
+	[MT8195_MDP_COMP_HDR3] = {
+		{MDP_COMP_TYPE_HDR, 3, MDP_COMP_HDR3},
+		{1, BIT(12), 0}
+	},
+	[MT8195_MDP_COMP_AAL0] = {
+		{MDP_COMP_TYPE_AAL, 0, MDP_COMP_AAL0},
+		{0, BIT(4), 0}
+	},
+	[MT8195_MDP_COMP_AAL1] = {
+		{MDP_COMP_TYPE_AAL, 1, MDP_COMP_AAL1},
+		{1, BIT(13), 0}
+	},
+	[MT8195_MDP_COMP_AAL2] = {
+		{MDP_COMP_TYPE_AAL, 2, MDP_COMP_AAL2},
+		{1, BIT(14), 0}
+	},
+	[MT8195_MDP_COMP_AAL3] = {
+		{MDP_COMP_TYPE_AAL, 3, MDP_COMP_AAL3},
+		{1, BIT(15), 0}
+	},
+	[MT8195_MDP_COMP_RSZ0] = {
+		{MDP_COMP_TYPE_RSZ, 0, MDP_COMP_RSZ0},
+		{0, BIT(5), 0}
+	},
+	[MT8195_MDP_COMP_RSZ1] = {
+		{MDP_COMP_TYPE_RSZ, 1, MDP_COMP_RSZ1},
+		{1, BIT(16), 0}
+	},
+	[MT8195_MDP_COMP_RSZ2] = {
+		{MDP_COMP_TYPE_RSZ, 2, MDP_COMP_RSZ2},
+		{1, BIT(17) | BIT(22), 0}
+	},
+	[MT8195_MDP_COMP_RSZ3] = {
+		{MDP_COMP_TYPE_RSZ, 3, MDP_COMP_RSZ3},
+		{1, BIT(18) | BIT(23), 0}
+	},
+	[MT8195_MDP_COMP_TDSHP0] = {
+		{MDP_COMP_TYPE_TDSHP, 0, MDP_COMP_TDSHP0},
+		{0, BIT(6), 0}
+	},
+	[MT8195_MDP_COMP_TDSHP1] = {
+		{MDP_COMP_TYPE_TDSHP, 1, MDP_COMP_TDSHP1},
+		{1, BIT(19), 0}
+	},
+	[MT8195_MDP_COMP_TDSHP2] = {
+		{MDP_COMP_TYPE_TDSHP, 2, MDP_COMP_TDSHP2},
+		{1, BIT(20), 0}
+	},
+	[MT8195_MDP_COMP_TDSHP3] = {
+		{MDP_COMP_TYPE_TDSHP, 3, MDP_COMP_TDSHP3},
+		{1, BIT(21), 0}
+	},
+	[MT8195_MDP_COMP_COLOR0] = {
+		{MDP_COMP_TYPE_COLOR, 0, MDP_COMP_COLOR0},
+		{0, BIT(7), 0}
+	},
+	[MT8195_MDP_COMP_COLOR1] = {
+		{MDP_COMP_TYPE_COLOR, 1, MDP_COMP_COLOR1},
+		{1, BIT(24), 0}
+	},
+	[MT8195_MDP_COMP_COLOR2] = {
+		{MDP_COMP_TYPE_COLOR, 2, MDP_COMP_COLOR2},
+		{1, BIT(25), 0}
+	},
+	[MT8195_MDP_COMP_COLOR3] = {
+		{MDP_COMP_TYPE_COLOR, 3, MDP_COMP_COLOR3},
+		{1, BIT(26), 0}
+	},
+	[MT8195_MDP_COMP_OVL0] = {
+		{MDP_COMP_TYPE_OVL, 0, MDP_COMP_OVL0},
+		{0, BIT(8), 0}
+	},
+	[MT8195_MDP_COMP_OVL1] = {
+		{MDP_COMP_TYPE_OVL, 1, MDP_COMP_OVL1},
+		{1, BIT(27), 0}
+	},
+	[MT8195_MDP_COMP_PAD0] = {
+		{MDP_COMP_TYPE_PAD, 0, MDP_COMP_PAD0},
+		{0, BIT(9), 0}
+	},
+	[MT8195_MDP_COMP_PAD1] = {
+		{MDP_COMP_TYPE_PAD, 1, MDP_COMP_PAD1},
+		{1, BIT(28), 0}
+	},
+	[MT8195_MDP_COMP_PAD2] = {
+		{MDP_COMP_TYPE_PAD, 2, MDP_COMP_PAD2},
+		{1, BIT(29), 0}
+	},
+	[MT8195_MDP_COMP_PAD3] = {
+		{MDP_COMP_TYPE_PAD, 3, MDP_COMP_PAD3},
+		{1, BIT(30), 0}
+	},
+	[MT8195_MDP_COMP_TCC0] = {
+		{MDP_COMP_TYPE_TCC, 0, MDP_COMP_TCC0},
+		{0, BIT(10), 0}
+	},
+	[MT8195_MDP_COMP_TCC1] = {
+		{MDP_COMP_TYPE_TCC, 1, MDP_COMP_TCC1},
+		{1, BIT(3), 0}
+	},
+	[MT8195_MDP_COMP_WROT0] = {
+		{MDP_COMP_TYPE_WROT, 0, MDP_COMP_WROT0},
+		{0, BIT(11), 0}
+	},
+	[MT8195_MDP_COMP_WROT1] = {
+		{MDP_COMP_TYPE_WROT, 1, MDP_COMP_WROT1},
+		{1, BIT(31), 0}
+	},
+	[MT8195_MDP_COMP_WROT2] = {
+		{MDP_COMP_TYPE_WROT, 2, MDP_COMP_WROT2},
+		{1, 0, BIT(0)}
+	},
+	[MT8195_MDP_COMP_WROT3] = {
+		{MDP_COMP_TYPE_WROT, 3, MDP_COMP_WROT3},
+		{1, 0, BIT(1)}
+	},
+	[MT8195_MDP_COMP_MERGE2] = {
+		{MDP_COMP_TYPE_MERGE, 2, MDP_COMP_MERGE2},
+		{1, 0, 0}
+	},
+	[MT8195_MDP_COMP_MERGE3] = {
+		{MDP_COMP_TYPE_MERGE, 3, MDP_COMP_MERGE2},
+		{1, 0, 0}
+	},
+	[MT8195_MDP_COMP_PQ0_SOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 0, MDP_COMP_PQ0_SOUT},
+		{0, 0, 0}
+	},
+	[MT8195_MDP_COMP_PQ1_SOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 1, MDP_COMP_PQ1_SOUT},
+		{1, 0, 0}
+	},
+	[MT8195_MDP_COMP_TO_WARP0MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 2, MDP_COMP_TO_WARP0MOUT},
+		{0, 0, 0}
+	},
+	[MT8195_MDP_COMP_TO_WARP1MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 3, MDP_COMP_TO_WARP1MOUT},
+		{0, 0, 0}
+	},
+	[MT8195_MDP_COMP_TO_SVPP2MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 4, MDP_COMP_TO_SVPP2MOUT},
+		{1, 0, 0}
+	},
+	[MT8195_MDP_COMP_TO_SVPP3MOUT] = {
+		{MDP_COMP_TYPE_DUMMY, 5, MDP_COMP_TO_SVPP3MOUT},
+		{1, 0, 0}
+	},
+	[MT8195_MDP_COMP_VPP0_SOUT] = {
+		{MDP_COMP_TYPE_PATH1, 0, MDP_COMP_VPP0_SOUT},
+		{0, BIT(15), BIT(2)}
+	},
+	[MT8195_MDP_COMP_VPP1_SOUT] = {
+		{MDP_COMP_TYPE_PATH2, 1, MDP_COMP_VPP1_SOUT},
+		{1, BIT(16), BIT(3)}
+	},
+	[MT8195_MDP_COMP_VDO0DL0] = {
+		{MDP_COMP_TYPE_DL_PATH3, 0, MDP_COMP_VDO0DL0},
+		{1, 0, BIT(4)}
+	},
+	[MT8195_MDP_COMP_VDO1DL0] = {
+		{MDP_COMP_TYPE_DL_PATH4, 0, MDP_COMP_VDO1DL0},
+		{1, 0, BIT(6)}
+	},
+	[MT8195_MDP_COMP_VDO0DL1] = {
+		{MDP_COMP_TYPE_DL_PATH5, 0, MDP_COMP_VDO0DL1},
+		{1, 0, BIT(5)}
+	},
+	[MT8195_MDP_COMP_VDO1DL1] = {
+		{MDP_COMP_TYPE_DL_PATH6, 0, MDP_COMP_VDO1DL1},
+		{1, 0, BIT(7)}
+	},
+};
+
 static const enum mdp_comp_event mt8183_mdp_event[] = {
 	RDMA0_SOF,
 	RDMA0_DONE,
@@ -140,6 +475,25 @@ static const enum mdp_comp_event mt8183_mdp_event[] = {
 	WPE_B_DONE
 };
 
+static const enum mdp_comp_event mt8195_mdp_event[] = {
+	RDMA0_SOF,
+	WROT0_SOF,
+	RDMA0_DONE,
+	WROT0_DONE,
+	RDMA1_SOF,
+	RDMA2_SOF,
+	RDMA3_SOF,
+	WROT1_SOF,
+	WROT2_SOF,
+	WROT3_SOF,
+	RDMA1_FRAME_DONE,
+	RDMA2_FRAME_DONE,
+	RDMA3_FRAME_DONE,
+	WROT1_FRAME_DONE,
+	WROT2_FRAME_DONE,
+	WROT3_FRAME_DONE
+};
+
 static const struct mdp_comp_info mt8183_comp_dt_info[] = {
 	[MDP_COMP_TYPE_RDMA]		= {2, 0, 0},
 	[MDP_COMP_TYPE_RSZ]			= {1, 0, 0},
@@ -154,6 +508,31 @@ static const struct mdp_comp_info mt8183_comp_dt_info[] = {
 	[MDP_COMP_TYPE_DL_PATH2]	= {2, 4, 1},
 };
 
+static const struct mdp_comp_info mt8195_comp_dt_info[] = {
+	[MDP_COMP_TYPE_SPLIT]		= {7, 0, 0},
+	[MDP_COMP_TYPE_STITCH]		= {1, 0, 0},
+	[MDP_COMP_TYPE_RDMA]		= {3, 0, 0},
+	[MDP_COMP_TYPE_FG]			= {1, 0, 0},
+	[MDP_COMP_TYPE_HDR]			= {1, 0, 0},
+	[MDP_COMP_TYPE_AAL]			= {1, 0, 0},
+	[MDP_COMP_TYPE_RSZ]			= {2, 0, 0},
+	[MDP_COMP_TYPE_TDSHP]		= {1, 0, 0},
+	[MDP_COMP_TYPE_COLOR]		= {1, 0, 0},
+	[MDP_COMP_TYPE_OVL]			= {1, 0, 0},
+	[MDP_COMP_TYPE_PAD]			= {1, 0, 0},
+	[MDP_COMP_TYPE_TCC]			= {1, 0, 0},
+	[MDP_COMP_TYPE_WROT]		= {1, 0, 0},
+	[MDP_COMP_TYPE_MERGE]		= {1, 0, 0},
+	[MDP_COMP_TYPE_PATH1]		= {4, 9, 0},
+	[MDP_COMP_TYPE_PATH2]		= {2, 13, 0},
+	[MDP_COMP_TYPE_DL_PATH1]	= {3, 3, 0},
+	[MDP_COMP_TYPE_DL_PATH2]	= {3, 6, 0},
+	[MDP_COMP_TYPE_DL_PATH3]	= {1, 15, 0},
+	[MDP_COMP_TYPE_DL_PATH4]	= {1, 16, 0},
+	[MDP_COMP_TYPE_DL_PATH5]	= {1, 17, 0},
+	[MDP_COMP_TYPE_DL_PATH6]	= {1, 18, 0},
+};
+
 static const struct mdp_pipe_info mt8183_pipe_info[] = {
 	{MDP_PIPE_IMGI, 0, 0},
 	{MDP_PIPE_RDMA0, 0, 1},
@@ -161,6 +540,19 @@ static const struct mdp_pipe_info mt8183_pipe_info[] = {
 	{MDP_PIPE_WPEI2, 0, 3}
 };
 
+static const struct mdp_pipe_info mt8195_pipe_info[] = {
+	{MDP_PIPE_WPEI, 0, 0},
+	{MDP_PIPE_WPEI2, 0, 1},
+	{MDP_PIPE_RDMA0, 0, 2},
+	{MDP_PIPE_VPP1_SOUT, 0, 3},
+	{MDP_PIPE_SPLIT, 1, 2, 0x387},
+	{MDP_PIPE_SPLIT2, 1, 3, 0x387},
+	{MDP_PIPE_RDMA1, 1, 1},
+	{MDP_PIPE_RDMA2, 1, 2},
+	{MDP_PIPE_RDMA3, 1, 3},
+	{MDP_PIPE_VPP0_SOUT, 1, 4},
+};
+
 static const struct mdp_format mt8183_formats[] = {
 	{
 		.pixelformat	= V4L2_PIX_FMT_GREY,
@@ -382,6 +774,238 @@ static const struct mdp_format mt8183_formats[] = {
 	}
 };
 
+static const struct mdp_format mt8195_formats[] = {
+	{
+		.pixelformat	= V4L2_PIX_FMT_GREY,
+		.mdp_color	= MDP_COLOR_GREY,
+		.depth		= { 8 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB565X,
+		.mdp_color	= MDP_COLOR_RGB565,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB565,
+		.mdp_color	= MDP_COLOR_BGR565,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB24,
+		.mdp_color	= MDP_COLOR_RGB888,
+		.depth		= { 24 },
+		.row_depth	= { 24 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_BGR24,
+		.mdp_color	= MDP_COLOR_BGR888,
+		.depth		= { 24 },
+		.row_depth	= { 24 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_ABGR32,
+		.mdp_color	= MDP_COLOR_BGRA8888,
+		.depth		= { 32 },
+		.row_depth	= { 32 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_ARGB32,
+		.mdp_color	= MDP_COLOR_ARGB8888,
+		.depth		= { 32 },
+		.row_depth	= { 32 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_UYVY,
+		.mdp_color	= MDP_COLOR_UYVY,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_VYUY,
+		.mdp_color	= MDP_COLOR_VYUY,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUYV,
+		.mdp_color	= MDP_COLOR_YUYV,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVYU,
+		.mdp_color	= MDP_COLOR_YVYU,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV420,
+		.mdp_color	= MDP_COLOR_I420,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU420,
+		.mdp_color	= MDP_COLOR_YV12,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV12,
+		.mdp_color	= MDP_COLOR_NV12,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV21,
+		.mdp_color	= MDP_COLOR_NV21,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV16,
+		.mdp_color	= MDP_COLOR_NV16,
+		.depth		= { 16 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV61,
+		.mdp_color	= MDP_COLOR_NV61,
+		.depth		= { 16 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV24,
+		.mdp_color	= MDP_COLOR_NV24,
+		.depth		= { 24 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV42,
+		.mdp_color	= MDP_COLOR_NV42,
+		.depth		= { 24 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_MT21C,
+		.mdp_color	= MDP_COLOR_NV12_HYFBC,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 1,
+		.walign		= 4,
+		.halign		= 4,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_MM21,
+		.mdp_color	= MDP_COLOR_420_BLKP,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 4,
+		.halign		= 5,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV12M,
+		.mdp_color	= MDP_COLOR_NV12,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV21M,
+		.mdp_color	= MDP_COLOR_NV21,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV16M,
+		.mdp_color	= MDP_COLOR_NV16,
+		.depth		= { 8, 8 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV61M,
+		.mdp_color	= MDP_COLOR_NV61,
+		.depth		= { 8, 8 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV420M,
+		.mdp_color	= MDP_COLOR_I420,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU420M,
+		.mdp_color	= MDP_COLOR_YV12,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}
+};
+
+static const u32 mt8195_mdp_mmsys_config_table[] = {
+	[CONFIG_VPP0_HW_DCM_1ST_DIS0]    = 0,
+	[CONFIG_VPP0_DL_IRELAY_WR]       = 1,
+	[CONFIG_VPP1_HW_DCM_1ST_DIS0]    = 2,
+	[CONFIG_VPP1_HW_DCM_1ST_DIS1]    = 3,
+	[CONFIG_VPP1_HW_DCM_2ND_DIS0]    = 4,
+	[CONFIG_VPP1_HW_DCM_2ND_DIS1]    = 5,
+	[CONFIG_SVPP2_BUF_BF_RSZ_SWITCH] = 6,
+	[CONFIG_SVPP3_BUF_BF_RSZ_SWITCH] = 7,
+};
+
 static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_cfg = &mt8183_plat_cfg,
 	.event = mt8183_mdp_event,
@@ -397,10 +1021,29 @@ static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.format_len = ARRAY_SIZE(mt8183_formats),
 };
 
+static const struct mtk_mdp_driver_data mt8195_mdp_driver_data = {
+	.mdp_cfg = &mt8195_plat_cfg,
+	.event = mt8195_mdp_event,
+	.event_len = ARRAY_SIZE(mt8195_mdp_event),
+	.comp_list = &mt8195_comp_list,
+	.comp_data = mt8195_mdp_comp_data,
+	.comp_data_len = ARRAY_SIZE(mt8195_mdp_comp_data),
+	.comp_info = mt8195_comp_dt_info,
+	.comp_info_len = ARRAY_SIZE(mt8195_comp_dt_info),
+	.pipe_info = mt8195_pipe_info,
+	.pipe_info_len = ARRAY_SIZE(mt8195_pipe_info),
+	.format = mt8195_formats,
+	.format_len = ARRAY_SIZE(mt8195_formats),
+	.config_table = mt8195_mdp_mmsys_config_table,
+};
+
 static const struct of_device_id mdp_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-mdp3",
 	  .data = &mt8183_mdp_driver_data,
 	},
+	{ .compatible = "mediatek,mt8195-mdp3",
+	  .data = &mt8195_mdp_driver_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mdp_of_ids);
@@ -484,8 +1127,8 @@ static int mdp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mdp_dev *mdp;
 	struct device_node *mdp_node;
-	struct platform_device *mm_pdev;
-	u32 i, event_ofst;
+	struct platform_device *mm_pdev, *mm_pdev2;
+	u32 event_ofst;
 	int ret, i, mutex_id;
 
 	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
@@ -503,6 +1146,12 @@ static int mdp_probe(struct platform_device *pdev)
 	}
 	mdp->mdp_mmsys = &mm_pdev->dev;
 
+	mm_pdev2 = __get_pdev_by_name(pdev, "mediatek,mmsys2");
+	if (!mm_pdev2)
+		dev_err(dev, "Failed to get mdp mmsys2\n");
+	else
+		mdp->mdp_mmsys2 = &mm_pdev2->dev;
+
 	mdp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,mm-mutex", 0);
 	if (!mdp_node) {
 		ret = -ENODEV;
@@ -534,17 +1183,43 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_return;
 	}
 
+	mdp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,mm-mutex2", 0);
+	if (!mdp_node) {
+		dev_err(dev, "Failed to get mdp mm-mutex2\n");
+	} else {
+		mm_pdev2 = of_find_device_by_node(mdp_node);
+		of_node_put(mdp_node);
+		if (WARN_ON(!mm_pdev2)) {
+			ret = -ENODEV;
+			goto err_return;
+		}
+	}
+
 	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
 		mutex_id = mdp->mdp_data->pipe_info[i].mutex_id;
-		if (mdp->mdp_mutex[mutex_id])
-			continue;
-
-		mdp->mdp_mutex[mutex_id] =
-			mtk_mutex_mdp_get(&mm_pdev->dev, mdp->mdp_data->pipe_info[i].pipe_id);
 
-		if (!mdp->mdp_mutex[mutex_id]) {
-			ret = -ENODEV;
-			goto err_return;
+		if (mdp->mdp_data->pipe_info[i].mmsys_id != 0) {
+			if (mdp->mdp_mutex2[mutex_id])
+				continue;
+			mdp->mdp_mutex2[mutex_id] =
+				mtk_mutex_mdp_get(&mm_pdev2->dev,
+						  mdp->mdp_data->pipe_info[i].pipe_id);
+
+			if (!mdp->mdp_mutex2[mutex_id]) {
+				ret = -ENODEV;
+				goto err_return;
+			}
+		} else {
+			if (mdp->mdp_mutex[mutex_id])
+				continue;
+			mdp->mdp_mutex[mutex_id] =
+				mtk_mutex_mdp_get(&mm_pdev->dev,
+						  mdp->mdp_data->pipe_info[i].pipe_id);
+
+			if (!mdp->mdp_mutex[mutex_id]) {
+				ret = -ENODEV;
+				goto err_return;
+			}
 		}
 	}
 
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index f6d70af80b3e..0b072c33e4e8 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -25,12 +25,23 @@ enum mdp_buffer_usage {
 };
 
 struct mdp_platform_config {
-	bool	rdma_support_10bit;
-	bool	rdma_rsz1_sram_sharing;
-	bool	rdma_upsample_repeat_only;
-	bool	rsz_disable_dcm_small_sample;
-	bool	wrot_filter_constraint;
-	u32	gce_event_offset;
+	bool rdma_support_10bit;
+	bool rdma_rsz1_sram_sharing;
+	bool rdma_upsample_repeat_only;
+	bool rdma_support_extend_ufo;
+	bool rdma_support_hyfbc;
+	bool rdma_support_afbc;
+	bool rdma_esl_setting;
+	bool rsz_disable_dcm_small_sample;
+	bool rsz_etc_control;
+	bool tdshp_1_1;
+	bool wrot_filter_constraint;
+	bool wrot_support_afbc;
+	bool wrot_support_10bit;
+	bool mdp_version_6885;
+	bool mdp_version_8195;
+	u8 tdshp_dyn_contrast_version;
+	u32 gce_event_offset;
 };
 
 struct mtk_mdp_driver_data {
@@ -52,7 +63,9 @@ struct mtk_mdp_driver_data {
 struct mdp_dev {
 	struct platform_device			*pdev;
 	struct device				*mdp_mmsys;
+	struct device				*mdp_mmsys2;
 	struct mtk_mutex			*mdp_mutex[MDP_PIPE_MAX];
+	struct mtk_mutex			*mdp_mutex2[MDP_PIPE_MAX];
 	struct mdp_comp				*comp[MDP_MAX_COMP_COUNT];
 	const struct mtk_mdp_driver_data	*mdp_data;
 	s32					event[MDP_MAX_EVENT_COUNT];
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index 2a8bb05226a0..cbea2ef67625 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -111,6 +111,7 @@ static void mdp_m2m_worker(struct work_struct *work)
 	param.type = ctx->curr_param.type;
 	param.num_inputs = 1;
 	param.num_outputs = 1;
+	param.frame_change = (ctx->frame_count == 0) ? true : false;
 
 	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	src_vb = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
@@ -351,6 +352,9 @@ static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 		ctx->curr_param.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
 		ctx->curr_param.quant = f->fmt.pix_mp.quantization;
 		ctx->curr_param.xfer_func = f->fmt.pix_mp.xfer_func;
+
+		frame->stride.width = ((f->fmt.pix_mp.width + 63) >> 6) << 6;
+		frame->stride.height = ((f->fmt.pix_mp.height + 31) >> 5) << 5;
 	} else {
 		capture->compose.left = 0;
 		capture->compose.top = 0;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index d5bdba00b946..91a35f8974f3 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -150,6 +150,45 @@ int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f)
 	return 0;
 }
 
+static u32 mdp_fmt_get_hyfbc_plane_size(u32 width, u32 height, u32 color)
+{
+	u32 y_data_size = 0;
+	u32 c_data_size = 0;
+	u32 y_header_size = 0;
+	u32 c_header_size = 0;
+	u32 y_data_ofst = 0;
+	u32 y_header_ofst = 0;
+	u32 c_data_ofst = 0;
+	u32 c_header_ofst = 0;
+
+	y_data_size = (((width + 63) >> 6) << 6) * (((height + 63) >> 6) << 6);
+	y_header_size = y_data_size >> 6;
+	if (MDP_COLOR_IS_10BIT_PACKED(color))
+		y_data_size = (y_data_size * 6) >> 2;
+
+	c_data_size = y_data_size >> 1;
+	c_header_size = (((y_header_size >> 1) + 63) >> 6) << 6;
+
+	// Setup source buffer base
+	y_data_ofst = ((y_header_size + 4095) >> 12) << 12; // align 4k
+	y_header_ofst = y_data_ofst - y_header_size;
+	c_data_ofst = ((y_data_ofst + y_data_size + c_header_size + 4095) >> 12) << 12; // align 4k
+	c_header_ofst = c_data_ofst - c_header_size;
+
+	return (c_data_ofst + c_data_size);
+}
+
+static u32 mdp_fmt_get_afbc_plane_size(u32 width, u32 height, u32 color)
+{
+	u32 align_w = ((width + 31) >> 5) << 5;
+	u32 align_h = ((height + 31) >> 5) << 5;
+
+	if (MDP_COLOR_IS_10BIT_PACKED(color))
+		return ((align_w >> 4) * (align_h >> 4) * (16 + 512));
+	else
+		return ((align_w >> 4) * (align_h >> 4) * (16 + 384));
+}
+
 const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
 					    struct mdp_frameparam *param,
 					    u32 ctx_id)
@@ -159,6 +198,8 @@ const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
 	const struct mdp_pix_limit *pix_limit;
 	u32 wmin, wmax, hmin, hmax, org_w, org_h;
 	unsigned int i;
+	u32 ysize;
+	u32 exsize;
 
 	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
 		return NULL;
@@ -216,6 +257,26 @@ const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
 			bpl = min_bpl;
 		si = (bpl * pix_mp->height * fmt->depth[i]) / fmt->row_depth[i];
 
+		if (MDP_COLOR_IS_HYFBC_COMPRESS(fmt->mdp_color)) {
+			si = mdp_fmt_get_hyfbc_plane_size(pix_mp->width,
+							  pix_mp->height, fmt->mdp_color);
+		} else if (MDP_COLOR_IS_COMPRESS(fmt->mdp_color)) {
+			si = mdp_fmt_get_afbc_plane_size(pix_mp->width,
+							 pix_mp->height, fmt->mdp_color);
+		} else if (MDP_COLOR_IS_UFP(fmt->mdp_color)) {
+			if (i == 0)
+				ysize = si;
+
+			exsize = (((ysize + 255) >> 8) + 128);
+			exsize = ((exsize + 63) >> 6) << 6;
+
+			if (i == 1) {
+				exsize = exsize / 2 + 128;
+				exsize = ((exsize + 15) >> 4) << 4;
+			}
+			si += exsize;
+		}
+
 		pix_mp->plane_fmt[i].bytesperline = bpl;
 		if (pix_mp->plane_fmt[i].sizeimage < si)
 			pix_mp->plane_fmt[i].sizeimage = si;
@@ -331,8 +392,14 @@ static u32 mdp_fmt_get_stride(const struct mdp_format *fmt,
 	enum mdp_color c = fmt->mdp_color;
 	u32 stride;
 
-	stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
-		/ fmt->row_depth[0];
+	if (MDP_COLOR_IS_COMPRESS(c)) {
+		bytesperline = ((bytesperline + 31) >> 5) << 5;
+		stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
+			/ fmt->row_depth[0];
+	} else {
+		stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
+			/ fmt->row_depth[0];
+	}
 	if (plane == 0)
 		return stride;
 	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
@@ -386,6 +453,7 @@ static void mdp_prepare_buffer(struct img_image_buffer *b,
 {
 	struct v4l2_pix_format_mplane *pix_mp = &frame->format.fmt.pix_mp;
 	unsigned int i;
+	u32 exsize;
 
 	b->format.colorformat = frame->mdp_fmt->mdp_color;
 	b->format.ycbcr_prof = frame->ycbcr_prof;
@@ -405,6 +473,28 @@ static void mdp_prepare_buffer(struct img_image_buffer *b,
 			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
 					       pix_mp->height, i) -
 					       vb->planes[i].data_offset;
+
+		if (MDP_COLOR_IS_HYFBC_COMPRESS(b->format.colorformat)) {
+			b->format.plane_fmt[i].size =
+				mdp_fmt_get_hyfbc_plane_size(pix_mp->width,
+							     pix_mp->height,
+							     b->format.colorformat);
+		} else if (MDP_COLOR_IS_COMPRESS(b->format.colorformat)) {
+			b->format.plane_fmt[i].size =
+				mdp_fmt_get_afbc_plane_size(pix_mp->width,
+							    pix_mp->height,
+							    b->format.colorformat);
+		} else if (MDP_COLOR_IS_UFP(b->format.colorformat)) {
+			exsize = (((b->format.plane_fmt[0].size + 255) >> 8) + 128);
+			exsize = ((exsize + 63) >> 6) << 6;
+
+			if (i == 1) {
+				exsize = exsize / 2 + 128;
+				exsize = ((exsize + 15) >> 4) << 4;
+			}
+			b->format.plane_fmt[i].size += exsize;
+		}
+
 		b->iova[i] = vb2_dma_contig_plane_dma_addr(vb, i) +
 			     vb->planes[i].data_offset;
 	}
@@ -416,6 +506,27 @@ static void mdp_prepare_buffer(struct img_image_buffer *b,
 		b->format.plane_fmt[i].size =
 			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
 					       pix_mp->height, i);
+
+		if (MDP_COLOR_IS_HYFBC_COMPRESS(b->format.colorformat)) {
+			b->format.plane_fmt[i].size =
+				mdp_fmt_get_hyfbc_plane_size(pix_mp->width,
+							     pix_mp->height,
+							     b->format.colorformat);
+		} else if (MDP_COLOR_IS_COMPRESS(b->format.colorformat)) {
+			b->format.plane_fmt[i].size =
+				mdp_fmt_get_afbc_plane_size(pix_mp->width,
+							    pix_mp->height,
+							    b->format.colorformat);
+		} else if (MDP_COLOR_IS_UFP(b->format.colorformat)) {
+			exsize = (((b->format.plane_fmt[0].size + 255) >> 8) + 128);
+			exsize = ((exsize + 63) >> 6) << 6;
+
+			if (i == 1) {
+				exsize = exsize / 2 + 128;
+				exsize = ((exsize + 15) >> 4) << 4;
+			}
+			b->format.plane_fmt[i].size += exsize;
+		}
 		b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i - 1].size;
 	}
 	b->usage = frame->usage;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
index 3eb294bd9516..a82516152a60 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
@@ -288,6 +288,8 @@ struct mdp_frame {
 	u32			dre:1;
 	u32			sharpness:1;
 	u32			dither:1;
+	/* H and V stride, only for HYFBC format */
+	struct v4l2_rect	stride;
 };
 
 static inline bool mdp_target_is_crop(u32 target)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
