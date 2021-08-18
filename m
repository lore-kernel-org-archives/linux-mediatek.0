Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972F9C4320A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 09:32:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F7C60551
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 09:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67F7C60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBP38LPXXDQ2+NSfJiNBCeHmenF/pGGucnEEBbl0LKQ=; b=2eEZUuYjmjCu3i
	LuZsuDo61S93itL22xYZ0k7+lnyayA+zQB7pWpP8PbErMUOPBdTAT/Je3xQFwVGl2P41jJPkLuuxu
	7PtYfWQ8T6/3oREBjaFdFiRcibWDnibRQTOzJR8ahsZml3OTVadOh5VgrrKHDNUZjeIIWpuGT68zr
	mFR/NbD7jat9Z+ddzNtqDs3/z9RFwt2StXUQ6FjngRjIAf9FWTZh6Uxepqlq1PD/6bCtp983S/e7U
	CR6NnKPzcvdtJ/Z0q6u2p1i8dw/j6P0dB8PQgBexcwbp9T4p52RLvBZAWZT+iqHQbAIDphusjzuaP
	gvAh09mZPf9ckZOsHvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGHvN-004uzu-Ch; Wed, 18 Aug 2021 09:31:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGHj9-004pUk-6n; Wed, 18 Aug 2021 09:19:19 +0000
X-UUID: cefa1f2b1c0a40c7a7ed550550dc23b9-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cO9+70TvLwDS6HtEzgAE5wj3hhj4CV8sl4i0KzAnzso=; 
 b=jm29IJNZLSFavL27UH7MKmOpeT4TAXpBPE1CGq+lznShNIEGusAx8S08TOdCt8HGi33GKLqLI2CJ07+NUNUh0yBCo+1A2jfPfJUx4cpWjPtung8WGyUKLNuChfWl2yLOXvAxHACznXPXtfr72yftt/OWn+ZUlcmCK+VWMKZ7pu8=;
X-UUID: cefa1f2b1c0a40c7a7ed550550dc23b9-20210818
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1082750707; Wed, 18 Aug 2021 02:18:53 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 02:18:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 17:18:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 17:18:51 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v3 12/15] drm/mediatek: add display MDP RDMA support for MT8195
Date: Wed, 18 Aug 2021 17:18:44 +0800
Message-ID: <20210818091847.8060-13-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210818091847.8060-1-nancy.lin@mediatek.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_021915_368293_6CB41AD0 
X-CRM114-Status: GOOD (  20.01  )
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

Add MDP_RDMA driver for MT8195. MDP_RDMA is the DMA engine of
the ovl_adaptor component.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile       |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  12 ++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 275 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h |  39 ++++
 4 files changed, 328 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 538e0087a44c..38ec2354a894 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -12,7 +12,8 @@ mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_drm_gem.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
-		  mtk_dpi.o
+		  mtk_dpi.o \
+		  mtk_mdp_rdma.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index f407cd9d873e..7129ba061ecb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -8,6 +8,7 @@
 
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include "mtk_drm_plane.h"
+#include "mtk_mdp_rdma.h"
 
 void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state);
 int mtk_ccorr_clk_enable(struct device *dev);
@@ -97,4 +98,15 @@ void mtk_rdma_enable_vblank(struct device *dev,
 			    void *vblank_cb_data);
 void mtk_rdma_disable_vblank(struct device *dev);
 
+void mtk_mdp_rdma_start(void __iomem *base,
+			struct cmdq_pkt *cmdq_pkt,
+			struct cmdq_client_reg *cmdq_base);
+void mtk_mdp_rdma_stop(void __iomem *base,
+		       struct cmdq_pkt *cmdq_pkt,
+		       struct cmdq_client_reg *cmdq_base);
+void mtk_mdp_rdma_config(void __iomem *base,
+			 struct mtk_mdp_rdma_cfg *cfg,
+			 struct cmdq_pkt *cmdq_pkt,
+			 struct cmdq_client_reg *cmdq_base);
+
 #endif
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
new file mode 100644
index 000000000000..95e762eda4a8
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include "mtk_drm_drv.h"
+#include "mtk_mdp_rdma.h"
+
+#define REG_FLD(width, shift) \
+	((unsigned int)((((width) & 0xff) << 16) | ((shift) & 0xff)))
+
+#define REG_FLD_WIDTH(field) ((unsigned int)(((field) >> 16) & 0xff))
+
+#define REG_FLD_SHIFT(field) ((unsigned int)((field) & 0xff))
+
+#define REG_FLD_MASK(field) \
+	((unsigned int)((1ULL << REG_FLD_WIDTH(field)) - 1) \
+	 << REG_FLD_SHIFT(field))
+
+#define REG_FLD_VAL(field, val) \
+	(((val) << REG_FLD_SHIFT(field)) & REG_FLD_MASK(field))
+
+#define MDP_RDMA_EN                                            0x000
+#define FLD_ROT_ENABLE                            REG_FLD(1, 0)
+
+#define MDP_RDMA_RESET                                         0x008
+
+#define MDP_RDMA_CON                                           0x020
+#define FLD_OUTPUT_10B                            REG_FLD(1, 5)
+#define FLD_SIMPLE_MODE                           REG_FLD(1, 4)
+
+#define MDP_RDMA_GMCIF_CON                                     0x028
+#define FLD_EXT_ULTRA_EN                          REG_FLD(1, 18)
+#define FLD_PRE_ULTRA_EN                          REG_FLD(2, 16)
+#define FLD_ULTRA_EN                              REG_FLD(2, 12)
+#define FLD_RD_REQ_TYPE                           REG_FLD(4, 4)
+#define VAL_RD_REQ_TYPE_BURST_8_ACCESS       7
+#define FLD_EXT_PREULTRA_EN                       REG_FLD(1, 3)
+#define FLD_COMMAND_DIV                           REG_FLD(1, 0)
+
+#define MDP_RDMA_SRC_CON                                       0x030
+#define FLD_OUTPUT_ARGB                           REG_FLD(1, 25)
+#define FLD_BIT_NUMBER                            REG_FLD(2, 18)
+#define FLD_UNIFORM_CONFIG                        REG_FLD(1, 17)
+#define FLD_SWAP                                  REG_FLD(1, 14)
+#define FLD_SRC_FORMAT                            REG_FLD(4, 0)
+
+#define MDP_RDMA_COMP_CON                                      0x038
+#define FLD_AFBC_EN                               REG_FLD(1, 22)
+#define FLD_AFBC_YUV_TRANSFORM                    REG_FLD(1, 21)
+#define FLD_UFBDC_EN                              REG_FLD(1, 12)
+
+#define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE                          0x060
+#define FLD_MF_BKGD_WB                            REG_FLD(23, 0)
+
+#define MDP_RDMA_MF_BKGD_SIZE_IN_PIXEL                         0x068
+#define FLD_MF_BKGD_WP                            REG_FLD(23, 0)
+
+#define MDP_RDMA_MF_SRC_SIZE                                   0x070
+#define FLD_MF_SRC_H                              REG_FLD(15, 16)
+#define FLD_MF_SRC_W                              REG_FLD(15, 0)
+
+#define MDP_RDMA_MF_CLIP_SIZE                                  0x078
+#define FLD_MF_CLIP_H                             REG_FLD(15, 16)
+#define FLD_MF_CLIP_W                             REG_FLD(15, 0)
+
+#define MDP_RDMA_TARGET_LINE                                   0x0a0
+#define FLD_LINE_THRESHOLD                        REG_FLD(15, 17)
+#define FLD_TARGET_LINE_EN                        REG_FLD(1, 16)
+
+#define MDP_RDMA_SRC_OFFSET_0                                  0x118
+#define FLD_SRC_OFFSET_0                          REG_FLD(32, 0)
+
+#define MDP_RDMA_TRANSFORM_0                                   0x200
+#define FLD_INT_MATRIX_SEL                        REG_FLD(5, 23)
+#define FLD_TRANS_EN                              REG_FLD(1, 16)
+
+#define MDP_RDMA_UTRA_H_CON_0                                  0x248
+#define FLD_PREUTRA_H_OFS_0                       REG_FLD(10, 10)
+
+#define MDP_RDMA_UTRA_L_CON_0                                  0x250
+#define FLD_PREUTRA_L_OFS_0                       REG_FLD(10, 10)
+
+#define MDP_RDMA_SRC_BASE_0                                    0xf00
+#define FLD_SRC_BASE_0                            REG_FLD(32, 0)
+
+#define RDMA_INPUT_SWAP		BIT(14)
+#define RDMA_INPUT_10BIT	BIT(18)
+
+enum rdma_format {
+	RDMA_INPUT_FORMAT_RGB565 = 0,
+	RDMA_INPUT_FORMAT_RGB888 = 1,
+	RDMA_INPUT_FORMAT_RGBA8888 = 2,
+	RDMA_INPUT_FORMAT_ARGB8888 = 3,
+	RDMA_INPUT_FORMAT_UYVY = 4,
+	RDMA_INPUT_FORMAT_YUY2 = 5,
+	RDMA_INPUT_FORMAT_Y8 = 7,
+	RDMA_INPUT_FORMAT_YV12 = 8,
+	RDMA_INPUT_FORMAT_UYVY_3PL = 9,
+	RDMA_INPUT_FORMAT_NV12 = 12,
+	RDMA_INPUT_FORMAT_UYVY_2PL = 13,
+	RDMA_INPUT_FORMAT_Y410 = 14
+};
+
+static unsigned int rdma_fmt_convert(unsigned int fmt)
+{
+	switch (fmt) {
+	default:
+	case DRM_FORMAT_RGB565:
+		return RDMA_INPUT_FORMAT_RGB565;
+	case DRM_FORMAT_BGR565:
+		return RDMA_INPUT_FORMAT_RGB565 | RDMA_INPUT_SWAP;
+	case DRM_FORMAT_RGB888:
+		return RDMA_INPUT_FORMAT_RGB888;
+	case DRM_FORMAT_BGR888:
+		return RDMA_INPUT_FORMAT_RGB888 | RDMA_INPUT_SWAP;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+		return RDMA_INPUT_FORMAT_ARGB8888;
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+		return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_SWAP;
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+		return RDMA_INPUT_FORMAT_RGBA8888;
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_SWAP;
+	case DRM_FORMAT_ABGR2101010:
+		return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_SWAP |
+				RDMA_INPUT_10BIT;
+	case DRM_FORMAT_ARGB2101010:
+		return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_10BIT;
+	case DRM_FORMAT_RGBA1010102:
+		return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_SWAP |
+				RDMA_INPUT_10BIT;
+	case DRM_FORMAT_BGRA1010102:
+		return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_10BIT;
+	case DRM_FORMAT_UYVY:
+		return RDMA_INPUT_FORMAT_UYVY;
+	case DRM_FORMAT_YUYV:
+		return RDMA_INPUT_FORMAT_YUY2;
+	}
+}
+
+static void mtk_mdp_rdma_fifo_config(void __iomem *base, struct cmdq_pkt *cmdq_pkt,
+				     struct cmdq_client_reg *cmdq_base)
+{
+	unsigned int pre_ultra_h = 156;
+	unsigned int pre_ultra_l = 104;
+	unsigned int reg_mask;
+	unsigned int reg_val;
+	unsigned int reg;
+
+	reg = MDP_RDMA_GMCIF_CON;
+	reg_val = REG_FLD_VAL(FLD_RD_REQ_TYPE, VAL_RD_REQ_TYPE_BURST_8_ACCESS) |
+		  REG_FLD_VAL(FLD_COMMAND_DIV, 1) |
+		  REG_FLD_VAL(FLD_EXT_PREULTRA_EN, 1) |
+		  REG_FLD_VAL(FLD_ULTRA_EN, 0) |
+		  REG_FLD_VAL(FLD_PRE_ULTRA_EN, 1) |
+		  REG_FLD_VAL(FLD_EXT_ULTRA_EN, 1);
+	reg_mask = REG_FLD_MASK(FLD_RD_REQ_TYPE) |
+		   REG_FLD_MASK(FLD_COMMAND_DIV) |
+		   REG_FLD_MASK(FLD_EXT_PREULTRA_EN) |
+		   REG_FLD_MASK(FLD_ULTRA_EN) |
+		   REG_FLD_MASK(FLD_PRE_ULTRA_EN) |
+		   REG_FLD_MASK(FLD_EXT_ULTRA_EN);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_UTRA_H_CON_0;
+	reg_val = REG_FLD_VAL(FLD_PREUTRA_H_OFS_0, pre_ultra_h);
+	reg_mask = REG_FLD_MASK(FLD_PREUTRA_H_OFS_0);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+
+	reg = MDP_RDMA_UTRA_L_CON_0;
+	reg_val = REG_FLD_VAL(FLD_PREUTRA_L_OFS_0, pre_ultra_l);
+	reg_mask = REG_FLD_MASK(FLD_PREUTRA_L_OFS_0);
+	mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_mask);
+}
+
+void mtk_mdp_rdma_start(void __iomem *base, struct cmdq_pkt *cmdq_pkt,
+			struct cmdq_client_reg *cmdq_base)
+{
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_ROT_ENABLE, 1), cmdq_base,
+			   base, MDP_RDMA_EN, REG_FLD_MASK(FLD_ROT_ENABLE));
+}
+
+void mtk_mdp_rdma_stop(void __iomem *base, struct cmdq_pkt *cmdq_pkt,
+		       struct cmdq_client_reg *cmdq_base)
+{
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_ROT_ENABLE, 0), cmdq_base,
+			   base, MDP_RDMA_EN, REG_FLD_MASK(FLD_ROT_ENABLE));
+	mtk_ddp_write(cmdq_pkt, 1, cmdq_base, base, MDP_RDMA_RESET);
+	mtk_ddp_write(cmdq_pkt, 0, cmdq_base, base, MDP_RDMA_RESET);
+}
+
+void mtk_mdp_rdma_config(void __iomem *base, struct mtk_mdp_rdma_cfg *cfg,
+			 struct cmdq_pkt *cmdq_pkt,
+			 struct cmdq_client_reg *cmdq_base)
+{
+	const struct drm_format_info *fmt_info = drm_format_info(cfg->fmt);
+	unsigned int src_pitch_y = cfg->pitch;
+	unsigned int bpp_y = fmt_info->cpp[0] * 8;
+	unsigned int offset_y = 0;
+
+	mtk_mdp_rdma_fifo_config(base, cmdq_pkt, cmdq_base);
+
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_UNIFORM_CONFIG, 1),
+			   cmdq_base, base, MDP_RDMA_SRC_CON,
+			   REG_FLD_MASK(FLD_UNIFORM_CONFIG));
+	mtk_ddp_write_mask(cmdq_pkt, rdma_fmt_convert(cfg->fmt), cmdq_base,
+			   base, MDP_RDMA_SRC_CON, REG_FLD_MASK(FLD_SWAP) |
+			   REG_FLD_MASK(FLD_SRC_FORMAT) |
+			   REG_FLD_MASK(FLD_BIT_NUMBER));
+
+	if (!cfg->csc_enable && fmt_info->has_alpha)
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_OUTPUT_ARGB, 1),
+				   cmdq_base, base, MDP_RDMA_SRC_CON,
+				   REG_FLD_MASK(FLD_OUTPUT_ARGB));
+	else
+		mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_OUTPUT_ARGB, 0),
+				   cmdq_base, base, MDP_RDMA_SRC_CON,
+				   REG_FLD_MASK(FLD_OUTPUT_ARGB));
+
+	mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, cmdq_base, base,
+			   MDP_RDMA_SRC_BASE_0, REG_FLD_MASK(FLD_SRC_BASE_0));
+
+	mtk_ddp_write_mask(cmdq_pkt, src_pitch_y, cmdq_base, base,
+			   MDP_RDMA_MF_BKGD_SIZE_IN_BYTE,
+			   REG_FLD_MASK(FLD_MF_BKGD_WB));
+
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_AFBC_YUV_TRANSFORM, 0),
+			   cmdq_base, base, MDP_RDMA_COMP_CON,
+			   REG_FLD_MASK(FLD_AFBC_YUV_TRANSFORM));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_UFBDC_EN, 0), cmdq_base,
+			   base, MDP_RDMA_COMP_CON, REG_FLD_MASK(FLD_UFBDC_EN));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_AFBC_EN, 0), cmdq_base,
+			   base, MDP_RDMA_COMP_CON, REG_FLD_MASK(FLD_AFBC_EN));
+
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_OUTPUT_10B, 1), cmdq_base,
+			   base, MDP_RDMA_CON, REG_FLD_MASK(FLD_OUTPUT_10B));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SIMPLE_MODE, 1), cmdq_base,
+			   base, MDP_RDMA_CON, REG_FLD_MASK(FLD_SIMPLE_MODE));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_TRANS_EN, cfg->csc_enable),
+			   cmdq_base, base, MDP_RDMA_TRANSFORM_0,
+			   REG_FLD_MASK(FLD_TRANS_EN));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_INT_MATRIX_SEL, cfg->profile),
+			   cmdq_base, base, MDP_RDMA_TRANSFORM_0,
+			   REG_FLD_MASK(FLD_INT_MATRIX_SEL));
+
+	offset_y  = (cfg->x_left * bpp_y >> 3) + cfg->y_top * src_pitch_y;
+
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_0, offset_y),
+			   cmdq_base, base, MDP_RDMA_SRC_OFFSET_0,
+			   REG_FLD_MASK(FLD_SRC_OFFSET_0));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_SRC_W, cfg->width),
+			   cmdq_base, base, MDP_RDMA_MF_SRC_SIZE,
+			   REG_FLD_MASK(FLD_MF_SRC_W));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_SRC_H, cfg->height),
+			   cmdq_base, base, MDP_RDMA_MF_SRC_SIZE,
+			   REG_FLD_MASK(FLD_MF_SRC_H));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_CLIP_W, cfg->width),
+			   cmdq_base, base, MDP_RDMA_MF_CLIP_SIZE,
+			   REG_FLD_MASK(FLD_MF_CLIP_W));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_CLIP_H, cfg->height),
+			   cmdq_base, base, MDP_RDMA_MF_CLIP_SIZE,
+			   REG_FLD_MASK(FLD_MF_CLIP_H));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_LINE_THRESHOLD, cfg->height),
+			   cmdq_base, base, MDP_RDMA_TARGET_LINE,
+			   REG_FLD_MASK(FLD_LINE_THRESHOLD));
+	mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_TARGET_LINE_EN, 1),
+			   cmdq_base, base, MDP_RDMA_TARGET_LINE,
+			   REG_FLD_MASK(FLD_TARGET_LINE_EN));
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
new file mode 100644
index 000000000000..50fa6e18d244
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_MDP_RDMA_H__
+#define __MTK_MDP_RDMA_H__
+
+enum mtk_mdp_rdma_profile {
+	RDMA_CSC_RGB_TO_JPEG = 0,
+	RDMA_CSC_RGB_TO_FULL709 = 1,
+	RDMA_CSC_RGB_TO_BT601 = 2,
+	RDMA_CSC_RGB_TO_BT709 = 3,
+	RDMA_CSC_JPEG_TO_RGB = 4,
+	RDMA_CSC_FULL709_TO_RGB = 5,
+	RDMA_CSC_BT601_TO_RGB = 6,
+	RDMA_CSC_BT709_TO_RGB = 7,
+	RDMA_CSC_JPEG_TO_BT601 = 8,
+	RDMA_CSC_JPEG_TO_BT709 = 9,
+	RDMA_CSC_BT601_TO_JPEG = 10,
+	RDMA_CSC_BT709_TO_BT601 = 11,
+	RDMA_CSC_BT601_TO_BT709 = 12
+};
+
+struct mtk_mdp_rdma_cfg {
+	enum mtk_mdp_rdma_profile profile;
+	unsigned int source_width;
+	unsigned int pitch;
+	unsigned int addr0;
+	unsigned int width;
+	unsigned int height;
+	unsigned int x_left;
+	unsigned int y_top;
+	bool csc_enable;
+	int fmt;
+};
+
+#endif // __MTK_MDP_RDMA_H__
+
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
