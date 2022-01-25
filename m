Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD9BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=718FDrU7qAVoK0oXhs9KAgZ5w5PltcX34bd+RkU0rw4=; b=RXZqSWJ0S1dX2P
	NdtUJZzb9teq6+qEieIHJMxz5+6bz+g6erjHR5ftDa4XM4Q7vhl6tgl8azi4dVzQ2PEAEXwc+aWnL
	746+phA6QYdOo4AR4hdQYBG+wGz9aGsKiyItt99StbQF3mC+sxCerVCXX7qqVLDt4OqEe3E3nOtNd
	ippx3qHA3z5kefji1DpncJ/Wxy/3568sbBJHcAw//VxeVm76PFomVOpKiTgl0D9vj0XT27bVBgomK
	LxAnp1liHgPLkUhQYNM8rZZmZrirobSxwSfRCT4owf4O4JtaRL76n8+tmMGl4cG/69jKCSHCdJWZY
	RWWkDpAycLNCbIF/IHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIUv-007I8V-SB; Tue, 25 Jan 2022 09:52:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCILZ-007EhC-Et; Tue, 25 Jan 2022 09:42:44 +0000
X-UUID: 00ee74f4a2d345de8504ecd833ffa24b-20220125
X-UUID: 00ee74f4a2d345de8504ecd833ffa24b-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 803491580; Tue, 25 Jan 2022 02:42:37 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 01:33:00 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 25 Jan 2022 17:32:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 17:32:57 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: mediatek: mt8186: Add binding for MM iommu
Date: Tue, 25 Jan 2022 17:32:43 +0800
Message-ID: <20220125093244.18230-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220125093244.18230-1-yong.wu@mediatek.com>
References: <20220125093244.18230-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_014241_567389_CFDAA7EB 
X-CRM114-Status: GOOD (  16.44  )
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

Add mt8186 iommu binding. "-mm" means the iommu is for Multimedia.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 .../bindings/iommu/mediatek,iommu.yaml        |   4 +
 .../dt-bindings/memory/mt8186-memory-port.h   | 217 ++++++++++++++++++
 2 files changed, 221 insertions(+)
 create mode 100644 include/dt-bindings/memory/mt8186-memory-port.h

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index c528a299afa9..6cc886eb55af 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -76,6 +76,7 @@ properties:
           - mediatek,mt8167-m4u  # generation two
           - mediatek,mt8173-m4u  # generation two
           - mediatek,mt8183-m4u  # generation two
+          - mediatek,mt8186-iommu-mm # generation two
           - mediatek,mt8192-m4u  # generation two
           - mediatek,mt8195-iommu-vdo        # generation two
           - mediatek,mt8195-iommu-vpp        # generation two
@@ -120,6 +121,7 @@ properties:
       dt-binding/memory/mt8167-larb-port.h for mt8167,
       dt-binding/memory/mt8173-larb-port.h for mt8173,
       dt-binding/memory/mt8183-larb-port.h for mt8183,
+      dt-binding/memory/mt8186-memory-port.h for mt8186,
       dt-binding/memory/mt8192-larb-port.h for mt8192.
       dt-binding/memory/mt8195-memory-port.h for mt8195.
 
@@ -141,6 +143,7 @@ allOf:
               - mediatek,mt2701-m4u
               - mediatek,mt2712-m4u
               - mediatek,mt8173-m4u
+              - mediatek,mt8186-iommu-mm
               - mediatek,mt8192-m4u
               - mediatek,mt8195-iommu-vdo
               - mediatek,mt8195-iommu-vpp
@@ -153,6 +156,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - mediatek,mt8186-iommu-mm
             - mediatek,mt8192-m4u
             - mediatek,mt8195-iommu-vdo
             - mediatek,mt8195-iommu-vpp
diff --git a/include/dt-bindings/memory/mt8186-memory-port.h b/include/dt-bindings/memory/mt8186-memory-port.h
new file mode 100644
index 000000000000..bda265725870
--- /dev/null
+++ b/include/dt-bindings/memory/mt8186-memory-port.h
@@ -0,0 +1,217 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ *
+ * Author: Anan Sun <anan.sun@mediatek.com>
+ * Author: Yong Wu <yong.wu@mediatek.com>
+ */
+#ifndef _DT_BINDINGS_MEMORY_MT8186_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT8186_LARB_PORT_H_
+
+#include <dt-bindings/memory/mtk-memory-port.h>
+
+/*
+ * MM IOMMU supports 16GB dma address. We separate it to four ranges:
+ * 0 ~ 4G; 4G ~ 8G; 8G ~ 12G; 12G ~ 16G, we could adjust these masters
+ * locate in anyone bank. BUT:
+ * a) Make sure all the ports inside a larb are in one range.
+ * b) The iova of any master can NOT cross the 4G/8G/12G boundary.
+ *
+ * This is the suggested mapping in this SoC:
+ *
+ * modules    dma-address-region	larbs-ports
+ * disp         0 ~ 4G                  larb0/1/2
+ * vcodec      4G ~ 8G                  larb4/7
+ * cam/mdp     8G ~ 12G                 the other larbs.
+ * N/A         12G ~ 16G
+ * CCU0   0x24000_0000 ~ 0x243ff_ffff   larb13: port 9/10
+ * CCU1   0x24400_0000 ~ 0x247ff_ffff   larb14: port 4/5
+ */
+
+/* MM IOMMU ports */
+/* LARB 0 -- MMSYS */
+#define IOMMU_PORT_L0_DISP_POSTMASK0	MTK_M4U_ID(0, 0)
+#define IOMMU_PORT_L0_REVERSED		MTK_M4U_ID(0, 1)
+#define IOMMU_PORT_L0_OVL_RDMA0		MTK_M4U_ID(0, 2)
+#define IOMMU_PORT_L0_DISP_FAKE0	MTK_M4U_ID(0, 3)
+
+/* LARB 1 -- MMSYS */
+#define IOMMU_PORT_L1_DISP_RDMA1	MTK_M4U_ID(1, 0)
+#define IOMMU_PORT_L1_OVL_2L_RDMA0	MTK_M4U_ID(1, 1)
+#define IOMMU_PORT_L1_DISP_RDMA0	MTK_M4U_ID(1, 2)
+#define IOMMU_PORT_L1_DISP_WDMA0	MTK_M4U_ID(1, 3)
+#define IOMMU_PORT_L1_DISP_FAKE1	MTK_M4U_ID(1, 4)
+
+/* LARB 2 -- MMSYS */
+#define IOMMU_PORT_L2_MDP_RDMA0		MTK_M4U_ID(2, 0)
+#define IOMMU_PORT_L2_MDP_RDMA1		MTK_M4U_ID(2, 1)
+#define IOMMU_PORT_L2_MDP_WROT0		MTK_M4U_ID(2, 2)
+#define IOMMU_PORT_L2_MDP_WROT1		MTK_M4U_ID(2, 3)
+#define IOMMU_PORT_L2_DISP_FAKE0	MTK_M4U_ID(2, 4)
+
+/* LARB 4 -- VDEC */
+#define IOMMU_PORT_L4_HW_VDEC_MC_EXT		MTK_M4U_ID(4, 0)
+#define IOMMU_PORT_L4_HW_VDEC_UFO_EXT		MTK_M4U_ID(4, 1)
+#define IOMMU_PORT_L4_HW_VDEC_PP_EXT		MTK_M4U_ID(4, 2)
+#define IOMMU_PORT_L4_HW_VDEC_PRED_RD_EXT	MTK_M4U_ID(4, 3)
+#define IOMMU_PORT_L4_HW_VDEC_PRED_WR_EXT	MTK_M4U_ID(4, 4)
+#define IOMMU_PORT_L4_HW_VDEC_PPWRAP_EXT	MTK_M4U_ID(4, 5)
+#define IOMMU_PORT_L4_HW_VDEC_TILE_EXT		MTK_M4U_ID(4, 6)
+#define IOMMU_PORT_L4_HW_VDEC_VLD_EXT		MTK_M4U_ID(4, 7)
+#define IOMMU_PORT_L4_HW_VDEC_VLD2_EXT		MTK_M4U_ID(4, 8)
+#define IOMMU_PORT_L4_HW_VDEC_AVC_MV_EXT	MTK_M4U_ID(4, 9)
+#define IOMMU_PORT_L4_HW_VDEC_UFO_ENC_EXT	MTK_M4U_ID(4, 10)
+#define IOMMU_PORT_L4_HW_VDEC_RG_CTRL_DMA_EXT	MTK_M4U_ID(4, 11)
+#define IOMMU_PORT_L4_HW_MINI_MDP_R0_EXT	MTK_M4U_ID(4, 12)
+#define IOMMU_PORT_L4_HW_MINI_MDP_W0_EXT	MTK_M4U_ID(4, 13)
+
+/* LARB 7 -- VENC */
+#define IOMMU_PORT_L7_VENC_RCPU		MTK_M4U_ID(7, 0)
+#define IOMMU_PORT_L7_VENC_REC		MTK_M4U_ID(7, 1)
+#define IOMMU_PORT_L7_VENC_BSDMA	MTK_M4U_ID(7, 2)
+#define IOMMU_PORT_L7_VENC_SV_COMV	MTK_M4U_ID(7, 3)
+#define IOMMU_PORT_L7_VENC_RD_COMV	MTK_M4U_ID(7, 4)
+#define IOMMU_PORT_L7_VENC_CUR_LUMA	MTK_M4U_ID(7, 5)
+#define IOMMU_PORT_L7_VENC_CUR_CHROMA	MTK_M4U_ID(7, 6)
+#define IOMMU_PORT_L7_VENC_REF_LUMA	MTK_M4U_ID(7, 7)
+#define IOMMU_PORT_L7_VENC_REF_CHROMA	MTK_M4U_ID(7, 8)
+#define IOMMU_PORT_L7_JPGENC_Y_RDMA	MTK_M4U_ID(7, 9)
+#define IOMMU_PORT_L7_JPGENC_C_RDMA	MTK_M4U_ID(7, 10)
+#define IOMMU_PORT_L7_JPGENC_Q_TABLE	MTK_M4U_ID(7, 11)
+#define IOMMU_PORT_L7_JPGENC_BSDMA	MTK_M4U_ID(7, 12)
+
+/* LARB 8 -- WPE */
+#define IOMMU_PORT_L8_WPE_RDMA_0	MTK_M4U_ID(8, 0)
+#define IOMMU_PORT_L8_WPE_RDMA_1	MTK_M4U_ID(8, 1)
+#define IOMMU_PORT_L8_WPE_WDMA_0	MTK_M4U_ID(8, 2)
+
+/* LARB 9 -- IMG-1 */
+#define IOMMU_PORT_L9_IMG_IMGI_D1	MTK_M4U_ID(9, 0)
+#define IOMMU_PORT_L9_IMG_IMGBI_D1	MTK_M4U_ID(9, 1)
+#define IOMMU_PORT_L9_IMG_DMGI_D1	MTK_M4U_ID(9, 2)
+#define IOMMU_PORT_L9_IMG_DEPI_D1	MTK_M4U_ID(9, 3)
+#define IOMMU_PORT_L9_IMG_LCE_D1	MTK_M4U_ID(9, 4)
+#define IOMMU_PORT_L9_IMG_SMTI_D1	MTK_M4U_ID(9, 5)
+#define IOMMU_PORT_L9_IMG_SMTO_D2	MTK_M4U_ID(9, 6)
+#define IOMMU_PORT_L9_IMG_SMTO_D1	MTK_M4U_ID(9, 7)
+#define IOMMU_PORT_L9_IMG_CRZO_D1	MTK_M4U_ID(9, 8)
+#define IOMMU_PORT_L9_IMG_IMG3O_D1	MTK_M4U_ID(9, 9)
+#define IOMMU_PORT_L9_IMG_VIPI_D1	MTK_M4U_ID(9, 10)
+#define IOMMU_PORT_L9_IMG_SMTI_D5	MTK_M4U_ID(9, 11)
+#define IOMMU_PORT_L9_IMG_TIMGO_D1	MTK_M4U_ID(9, 12)
+#define IOMMU_PORT_L9_IMG_UFBC_W0	MTK_M4U_ID(9, 13)
+#define IOMMU_PORT_L9_IMG_UFBC_R0	MTK_M4U_ID(9, 14)
+#define IOMMU_PORT_L9_IMG_WPE_RDMA1	MTK_M4U_ID(9, 15)
+#define IOMMU_PORT_L9_IMG_WPE_RDMA0	MTK_M4U_ID(9, 16)
+#define IOMMU_PORT_L9_IMG_WPE_WDMA	MTK_M4U_ID(9, 17)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA0	MTK_M4U_ID(9, 18)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA1	MTK_M4U_ID(9, 19)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA2	MTK_M4U_ID(9, 20)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA3	MTK_M4U_ID(9, 21)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA4	MTK_M4U_ID(9, 22)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA5	MTK_M4U_ID(9, 23)
+#define IOMMU_PORT_L9_IMG_MFB_WDMA0	MTK_M4U_ID(9, 24)
+#define IOMMU_PORT_L9_IMG_MFB_WDMA1	MTK_M4U_ID(9, 25)
+#define IOMMU_PORT_L9_IMG_RESERVE6	MTK_M4U_ID(9, 26)
+#define IOMMU_PORT_L9_IMG_RESERVE7	MTK_M4U_ID(9, 27)
+#define IOMMU_PORT_L9_IMG_RESERVE8	MTK_M4U_ID(9, 28)
+
+/* LARB 11 -- IMG-2 */
+#define IOMMU_PORT_L11_IMG_IMGI_D1	MTK_M4U_ID(11, 0)
+#define IOMMU_PORT_L11_IMG_IMGBI_D1	MTK_M4U_ID(11, 1)
+#define IOMMU_PORT_L11_IMG_DMGI_D1	MTK_M4U_ID(11, 2)
+#define IOMMU_PORT_L11_IMG_DEPI_D1	MTK_M4U_ID(11, 3)
+#define IOMMU_PORT_L11_IMG_LCE_D1	MTK_M4U_ID(11, 4)
+#define IOMMU_PORT_L11_IMG_SMTI_D1	MTK_M4U_ID(11, 5)
+#define IOMMU_PORT_L11_IMG_SMTO_D2	MTK_M4U_ID(11, 6)
+#define IOMMU_PORT_L11_IMG_SMTO_D1	MTK_M4U_ID(11, 7)
+#define IOMMU_PORT_L11_IMG_CRZO_D1	MTK_M4U_ID(11, 8)
+#define IOMMU_PORT_L11_IMG_IMG3O_D1	MTK_M4U_ID(11, 9)
+#define IOMMU_PORT_L11_IMG_VIPI_D1	MTK_M4U_ID(11, 10)
+#define IOMMU_PORT_L11_IMG_SMTI_D5	MTK_M4U_ID(11, 11)
+#define IOMMU_PORT_L11_IMG_TIMGO_D1	MTK_M4U_ID(11, 12)
+#define IOMMU_PORT_L11_IMG_UFBC_W0	MTK_M4U_ID(11, 13)
+#define IOMMU_PORT_L11_IMG_UFBC_R0	MTK_M4U_ID(11, 14)
+#define IOMMU_PORT_L11_IMG_WPE_RDMA1	MTK_M4U_ID(11, 15)
+#define IOMMU_PORT_L11_IMG_WPE_RDMA0	MTK_M4U_ID(11, 16)
+#define IOMMU_PORT_L11_IMG_WPE_WDMA	MTK_M4U_ID(11, 17)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA0	MTK_M4U_ID(11, 18)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA1	MTK_M4U_ID(11, 19)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA2	MTK_M4U_ID(11, 20)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA3	MTK_M4U_ID(11, 21)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA4	MTK_M4U_ID(11, 22)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA5	MTK_M4U_ID(11, 23)
+#define IOMMU_PORT_L11_IMG_MFB_WDMA0	MTK_M4U_ID(11, 24)
+#define IOMMU_PORT_L11_IMG_MFB_WDMA1	MTK_M4U_ID(11, 25)
+#define IOMMU_PORT_L11_IMG_RESERVE6	MTK_M4U_ID(11, 26)
+#define IOMMU_PORT_L11_IMG_RESERVE7	MTK_M4U_ID(11, 27)
+#define IOMMU_PORT_L11_IMG_RESERVE8	MTK_M4U_ID(11, 28)
+
+/* LARB 13 -- CAM */
+#define IOMMU_PORT_L13_CAM_MRAWI	MTK_M4U_ID(13, 0)
+#define IOMMU_PORT_L13_CAM_MRAWO_0	MTK_M4U_ID(13, 1)
+#define IOMMU_PORT_L13_CAM_MRAWO_1	MTK_M4U_ID(13, 2)
+#define IOMMU_PORT_L13_CAM_CAMSV_4	MTK_M4U_ID(13, 6)
+#define IOMMU_PORT_L13_CAM_CAMSV_5	MTK_M4U_ID(13, 7)
+#define IOMMU_PORT_L13_CAM_CAMSV_6	MTK_M4U_ID(13, 8)
+#define IOMMU_PORT_L13_CAM_CCUI		MTK_M4U_ID(13, 9)
+#define IOMMU_PORT_L13_CAM_CCUO		MTK_M4U_ID(13, 10)
+#define IOMMU_PORT_L13_CAM_FAKE		MTK_M4U_ID(13, 11)
+
+/* LARB 14 -- CAM */
+#define IOMMU_PORT_L14_CAM_CCUI		MTK_M4U_ID(14, 4)
+#define IOMMU_PORT_L14_CAM_CCUO		MTK_M4U_ID(14, 5)
+
+/* LARB 16 -- RAW-A */
+#define IOMMU_PORT_L16_CAM_IMGO_R1_A	MTK_M4U_ID(16, 0)
+#define IOMMU_PORT_L16_CAM_RRZO_R1_A	MTK_M4U_ID(16, 1)
+#define IOMMU_PORT_L16_CAM_CQI_R1_A	MTK_M4U_ID(16, 2)
+#define IOMMU_PORT_L16_CAM_BPCI_R1_A	MTK_M4U_ID(16, 3)
+#define IOMMU_PORT_L16_CAM_YUVO_R1_A	MTK_M4U_ID(16, 4)
+#define IOMMU_PORT_L16_CAM_UFDI_R2_A	MTK_M4U_ID(16, 5)
+#define IOMMU_PORT_L16_CAM_RAWI_R2_A	MTK_M4U_ID(16, 6)
+#define IOMMU_PORT_L16_CAM_RAWI_R3_A	MTK_M4U_ID(16, 7)
+#define IOMMU_PORT_L16_CAM_AAO_R1_A	MTK_M4U_ID(16, 8)
+#define IOMMU_PORT_L16_CAM_AFO_R1_A	MTK_M4U_ID(16, 9)
+#define IOMMU_PORT_L16_CAM_FLKO_R1_A	MTK_M4U_ID(16, 10)
+#define IOMMU_PORT_L16_CAM_LCESO_R1_A	MTK_M4U_ID(16, 11)
+#define IOMMU_PORT_L16_CAM_CRZO_R1_A	MTK_M4U_ID(16, 12)
+#define IOMMU_PORT_L16_CAM_LTMSO_R1_A	MTK_M4U_ID(16, 13)
+#define IOMMU_PORT_L16_CAM_RSSO_R1_A	MTK_M4U_ID(16, 14)
+#define IOMMU_PORT_L16_CAM_AAHO_R1_A	MTK_M4U_ID(16, 15)
+#define IOMMU_PORT_L16_CAM_LSCI_R1_A	MTK_M4U_ID(16, 16)
+
+/* LARB 17 -- RAW-B */
+#define IOMMU_PORT_L17_CAM_IMGO_R1_B	MTK_M4U_ID(17, 0)
+#define IOMMU_PORT_L17_CAM_RRZO_R1_B	MTK_M4U_ID(17, 1)
+#define IOMMU_PORT_L17_CAM_CQI_R1_B	MTK_M4U_ID(17, 2)
+#define IOMMU_PORT_L17_CAM_BPCI_R1_B	MTK_M4U_ID(17, 3)
+#define IOMMU_PORT_L17_CAM_YUVO_R1_B	MTK_M4U_ID(17, 4)
+#define IOMMU_PORT_L17_CAM_UFDI_R2_B	MTK_M4U_ID(17, 5)
+#define IOMMU_PORT_L17_CAM_RAWI_R2_B	MTK_M4U_ID(17, 6)
+#define IOMMU_PORT_L17_CAM_RAWI_R3_B	MTK_M4U_ID(17, 7)
+#define IOMMU_PORT_L17_CAM_AAO_R1_B	MTK_M4U_ID(17, 8)
+#define IOMMU_PORT_L17_CAM_AFO_R1_B	MTK_M4U_ID(17, 9)
+#define IOMMU_PORT_L17_CAM_FLKO_R1_B	MTK_M4U_ID(17, 10)
+#define IOMMU_PORT_L17_CAM_LCESO_R1_B	MTK_M4U_ID(17, 11)
+#define IOMMU_PORT_L17_CAM_CRZO_R1_B	MTK_M4U_ID(17, 12)
+#define IOMMU_PORT_L17_CAM_LTMSO_R1_B	MTK_M4U_ID(17, 13)
+#define IOMMU_PORT_L17_CAM_RSSO_R1_B	MTK_M4U_ID(17, 14)
+#define IOMMU_PORT_L17_CAM_AAHO_R1_B	MTK_M4U_ID(17, 15)
+#define IOMMU_PORT_L17_CAM_LSCI_R1_B	MTK_M4U_ID(17, 16)
+
+/* LARB 19 -- IPE */
+#define IOMMU_PORT_L19_IPE_DVS_RDMA	MTK_M4U_ID(19, 0)
+#define IOMMU_PORT_L19_IPE_DVS_WDMA	MTK_M4U_ID(19, 1)
+#define IOMMU_PORT_L19_IPE_DVP_RDMA	MTK_M4U_ID(19, 2)
+#define IOMMU_PORT_L19_IPE_DVP_WDMA	MTK_M4U_ID(19, 3)
+
+/* LARB 20 -- IPE */
+#define IOMMU_PORT_L20_IPE_FDVT_RDA	MTK_M4U_ID(20, 0)
+#define IOMMU_PORT_L20_IPE_FDVT_RDB	MTK_M4U_ID(20, 1)
+#define IOMMU_PORT_L20_IPE_FDVT_WRA	MTK_M4U_ID(20, 2)
+#define IOMMU_PORT_L20_IPE_FDVT_WRB	MTK_M4U_ID(20, 3)
+#define IOMMU_PORT_L20_IPE_RSC_RDMA0	MTK_M4U_ID(20, 4)
+#define IOMMU_PORT_L20_IPE_RSC_WDMA	MTK_M4U_ID(20, 5)
+
+#endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
