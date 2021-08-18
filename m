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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240CBC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 09:33:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01AE60462
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 09:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E01AE60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SoEJ6ijnqbxDo0F5kj7RSAu4ho9YkhFS7maaUki3SU=; b=vdaOLIG+AUc5p2
	ok3zBzGn7mBsalis7prdY2ZfNjKKp543I7/ZRKKboymYkGVDDJr0RRl0kn0G2yPGj7gRCgeWuXdKR
	IAzhgAZgIpJrxhPrUNAj4+iYWN+/gL5RUxq+ZlYvr+7hrH9XIgUi5sbH96XSEOqdXuSsDgEj4dWQA
	ssN+XAbisvhqQqbXKEIJWzwDq22Qjfn/hZq6MDFcXoRNo25c3U1TroTdtuiC+nyUvai4/Sao0s0UH
	wl2f944PTvSF4rEMi6awHqMhN4kxYnco4evukSPjblOrLwSN0LnV6eqGNyUj8c7tbqBRudoCVod29
	gjmYY/LJFJuJ3f+mRHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGHwo-004vYS-87; Wed, 18 Aug 2021 09:33:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGHjD-004pUk-CQ; Wed, 18 Aug 2021 09:19:21 +0000
X-UUID: ead3326f43be4d2f9974f2c468f5646c-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AvSg9+PAXKyT/E/gvyO49yBHwXkOX54wJVc8LqORiM8=; 
 b=DKiNeqxJ+Oq8GcDFsGJxLJPlALevgWwjUl0Xo/cJ68yyayUsb5kZ41bVcrRMDi56njiFzcG56Jum4f9v49jnKvwFCEBAmx7iimJF8c0FH5SS+PpmeX+MFO569Wi37oWgrf/n8lLMM3HkuvqxuctSuAA1IQHoK7NAbVO4qdCHx6c=;
X-UUID: ead3326f43be4d2f9974f2c468f5646c-20210818
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 835588638; Wed, 18 Aug 2021 02:18:55 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 02:18:54 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v3 14/15] drm/mediatek: add ETHDR support for MT8195
Date: Wed, 18 Aug 2021 17:18:46 +0800
Message-ID: <20210818091847.8060-15-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210818091847.8060-1-nancy.lin@mediatek.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_021919_492449_C5B39964 
X-CRM114-Status: GOOD (  25.08  )
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

ETHDR is a part of ovl_adaptor.
ETHDR is designed for HDR video and graphics conversion in the external
display path. It handles multiple HDR input types and performs tone
mapping, color space/color format conversion, and then combine
different layers, output the required HDR or SDR signal to the
subsequent display path.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile       |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  16 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   3 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c    | 440 ++++++++++++++++++++++++
 5 files changed, 462 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index f04ac86c9593..c42d0623e629 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -14,7 +14,8 @@ mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
 		  mtk_mdp_rdma.o \
-		  mtk_disp_ovl_adaptor.o
+		  mtk_disp_ovl_adaptor.o \
+		  mtk_ethdr.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 7129ba061ecb..964d0ad2b81d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -98,6 +98,22 @@ void mtk_rdma_enable_vblank(struct device *dev,
 			    void *vblank_cb_data);
 void mtk_rdma_disable_vblank(struct device *dev);
 
+int mtk_ethdr_clk_enable(struct device *dev);
+void mtk_ethdr_clk_disable(struct device *dev);
+void mtk_ethdr_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
+			    struct mtk_plane_state *state,
+			    struct cmdq_pkt *cmdq_pkt);
+void mtk_ethdr_enable_vblank(struct device *dev,
+			     void (*vblank_cb)(void *),
+			     void *vblank_cb_data);
+void mtk_ethdr_disable_vblank(struct device *dev);
+void mtk_ethdr_start(struct device *dev);
+void mtk_ethdr_stop(struct device *dev);
+unsigned int mtk_ethdr_layer_nr(struct device *dev);
+
 void mtk_mdp_rdma_start(void __iomem *base,
 			struct cmdq_pkt *cmdq_pkt,
 			struct cmdq_client_reg *cmdq_base);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9aebf73144c6..6a18c12fe04e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -452,6 +452,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
 	  .data = (void *)MTK_DISP_OVL_2L },
+	{ .compatible = "mediatek,mt8195-disp-ethdr",
+	  .data = (void *)MTK_DISP_OVL_ADAPTOR },
 	{ .compatible = "mediatek,mt2701-disp-pwm",
 	  .data = (void *)MTK_DISP_BLS },
 	{ .compatible = "mediatek,mt8173-disp-pwm",
@@ -674,6 +676,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_dpi_driver,
 	&mtk_drm_platform_driver,
 	&mtk_dsi_driver,
+	&mtk_ethdr_driver,
 };
 
 static int __init mtk_drm_init(void)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 0fa417219a69..7b09fe6db067 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -54,5 +54,6 @@ extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
+extern struct platform_driver mtk_ethdr_driver;
 
 #endif /* MTK_DRM_DRV_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
new file mode 100644
index 000000000000..05035b6015d8
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/pm_runtime.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
+
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
+#include "mtk_disp_ovl_adaptor.h"
+
+#define MIX_INTEN		0x4
+	#define MIX_FME_CPL_INTEN	BIT(1)
+#define MIX_INTSTA		0x8
+#define MIX_EN			0xc
+#define MIX_RST			0x14
+#define MIX_ROI_SIZE		0x18
+#define MIX_DATAPATH_CON	0x1c
+	#define OUTPUT_NO_RND	BIT(3)
+	#define SOURCE_RGB_SEL	BIT(7)
+	#define BACKGROUND_RELAY	(4 << 9)
+#define MIX_ROI_BGCLR		0x20
+	#define BGCLR_BLACK	0xff000000
+#define MIX_SRC_CON		0x24
+	#define MIX_SRC_L0_EN	BIT(0)
+#define MIX_L_SRC_CON(n)	(0x28 + 0x18 * (n))
+	#define NON_PREMULTI_SOURCE (2 << 12)
+#define MIX_L_SRC_SIZE(n)	(0x30 + 0x18 * (n))
+#define MIX_L_SRC_OFFSET(n)	(0x34 + 0x18 * (n))
+#define MIX_FUNC_DCM0		0x120
+#define MIX_FUNC_DCM1		0x124
+	#define MIX_FUNC_DCM_ENABLE 0xffffffff
+
+#define HDR_VDO_FE_0804_HDR_DM_FE	0x804
+	#define HDR_VDO_FE_0804_BYPASS_ALL	0xfd
+#define HDR_GFX_FE_0204_GFX_HDR_FE	0x204
+	#define HDR_GFX_FE_0204_BYPASS_ALL	0xfd
+#define HDR_VDO_BE_0204_VDO_DM_BE	0x204
+	#define HDR_VDO_BE_0204_BYPASS_ALL	0x7e
+
+#define MIXER_INx_MODE_BYPASS 0
+#define MIXER_INx_MODE_EVEN_EXTEND 1
+#define MIXER_INx_MODE_ODD_EXTEND 2
+#define DEFAULT_9BIT_ALPHA	0x100
+#define	MIXER_ALPHA_AEN		BIT(8)
+#define	MIXER_ALPHA		0xff
+#define ETHDR_CLK_NUM		13
+
+enum mtk_ethdr_comp_id {
+	ETHDR_MIXER,
+	ETHDR_VDO_FE0,
+	ETHDR_VDO_FE1,
+	ETHDR_GFX_FE0,
+	ETHDR_GFX_FE1,
+	ETHDR_VDO_BE,
+	ETHDR_ADL_DS,
+	ETHDR_ID_MAX
+};
+
+struct mtk_ethdr_comp {
+	struct device *dev;
+	void __iomem *regs;
+	struct cmdq_client_reg cmdq_base;
+};
+
+struct mtk_ethdr {
+	struct mtk_ethdr_comp ethdr_comp[ETHDR_ID_MAX];
+	struct clk_bulk_data ethdr_clk[ETHDR_CLK_NUM];
+	struct device *ovl_adaptor_dev;
+	struct device *mmsys_dev;
+	spinlock_t lock; /* protects vblank_cb and vblank_cb_data */
+	void (*vblank_cb)(void *data);
+	void *vblank_cb_data;
+	int irq;
+};
+
+static const char * const ethdr_comp_str[] = {
+	"ETHDR_MIXER",
+	"ETHDR_VDO_FE0",
+	"ETHDR_VDO_FE1",
+	"ETHDR_GFX_FE0",
+	"ETHDR_GFX_FE1",
+	"ETHDR_VDO_BE",
+	"ETHDR_ADL_DS",
+	"ETHDR_ID_MAX"
+};
+
+static const char * const ethdr_clk_str[] = {
+	"ethdr_top",
+	"mixer",
+	"vdo_fe0",
+	"vdo_fe1",
+	"gfx_fe0",
+	"gfx_fe1",
+	"vdo_be",
+	"adl_ds",
+	"vdo_fe0_async",
+	"vdo_fe1_async",
+	"gfx_fe0_async",
+	"gfx_fe1_async",
+	"vdo_be_async",
+};
+
+void mtk_ethdr_enable_vblank(struct device *dev,
+			     void (*vblank_cb)(void *),
+			     void *vblank_cb_data)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	priv->vblank_cb = vblank_cb;
+	priv->vblank_cb_data = vblank_cb_data;
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	writel(MIX_FME_CPL_INTEN, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTEN);
+}
+
+void mtk_ethdr_disable_vblank(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	priv->vblank_cb = NULL;
+	priv->vblank_cb_data = NULL;
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTEN);
+}
+
+static irqreturn_t mtk_ethdr_irq_handler(int irq, void *dev_id)
+{
+	struct mtk_ethdr *priv = dev_id;
+	unsigned long flags;
+
+	writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTSTA);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	if (!priv->vblank_cb) {
+		spin_unlock_irqrestore(&priv->lock, flags);
+		return IRQ_NONE;
+	}
+
+	priv->vblank_cb(priv->vblank_cb_data);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return IRQ_HANDLED;
+}
+
+void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
+			    struct mtk_plane_state *state,
+			    struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+	struct mtk_plane_pending_state *pending = &state->pending;
+	unsigned int offset = (pending->y << 16) | pending->x;
+	unsigned int mixer_pad_mode = MIXER_INx_MODE_BYPASS;
+	unsigned int alpha_con = 0;
+	unsigned int fmt = 0;
+	unsigned int src_size;
+	bool x_offset_odd = false;
+
+	dev_dbg(dev, "%s+ idx:%d", __func__, idx);
+
+	if (idx >= 4)
+		return;
+
+	/* ETHDR is in 1T2P domain, width needs to be 2 pixels align */
+	pending->width = ALIGN_DOWN(pending->width, 2);
+	src_size = (pending->height << 16) | pending->width;
+
+	mtk_ovl_adaptor_layer_config(priv->ovl_adaptor_dev, idx, state, cmdq_pkt);
+
+	if (!pending->enable) {
+		mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_MODE,
+				     idx + 1, MIXER_INx_MODE_BYPASS, cmdq_pkt);
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_BIWIDTH,
+				     idx + 1, 0, cmdq_pkt);
+		return;
+	}
+
+	if (pending->x % 2) {
+		x_offset_odd = true;
+		mixer_pad_mode = MIXER_INx_MODE_EVEN_EXTEND;
+	}
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_MODE,
+			     idx + 1, mixer_pad_mode, cmdq_pkt);
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_BIWIDTH,
+			     idx + 1, pending->width / 2 - 1, cmdq_pkt);
+
+	if (state->base.fb && state->base.fb->format->has_alpha) {
+		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_ALPHA_SEL,
+				     idx + 1, 0, cmdq_pkt);
+	} else {
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_ALPHA_SEL,
+				     idx + 1, 1, cmdq_pkt);
+	}
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, idx + 1,
+			     DEFAULT_9BIT_ALPHA, cmdq_pkt);
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, idx + 1,
+			     DEFAULT_9BIT_ALPHA, cmdq_pkt);
+
+	mtk_ddp_write(cmdq_pkt, src_size, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
+	mtk_ddp_write(cmdq_pkt, (x_offset_odd << 31) | offset, &mixer->cmdq_base,
+		      mixer->regs, MIX_L_SRC_OFFSET(idx));
+	mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_CON(idx),
+			   0x1ff);
+	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer->cmdq_base, mixer->regs, MIX_SRC_CON,
+			   BIT(idx));
+}
+
+void mtk_ethdr_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *vdo_fe0 = &priv->ethdr_comp[ETHDR_VDO_FE0];
+	struct mtk_ethdr_comp *vdo_fe1 = &priv->ethdr_comp[ETHDR_VDO_FE1];
+	struct mtk_ethdr_comp *gfx_fe0 = &priv->ethdr_comp[ETHDR_GFX_FE0];
+	struct mtk_ethdr_comp *gfx_fe1 = &priv->ethdr_comp[ETHDR_GFX_FE1];
+	struct mtk_ethdr_comp *vdo_be = &priv->ethdr_comp[ETHDR_VDO_BE];
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
+
+	mtk_ddp_write(cmdq_pkt, HDR_VDO_FE_0804_BYPASS_ALL, &vdo_fe0->cmdq_base,
+		      vdo_fe0->regs, HDR_VDO_FE_0804_HDR_DM_FE);
+
+	mtk_ddp_write(cmdq_pkt, HDR_VDO_FE_0804_BYPASS_ALL, &vdo_fe1->cmdq_base,
+		      vdo_fe1->regs, HDR_VDO_FE_0804_HDR_DM_FE);
+
+	mtk_ddp_write(cmdq_pkt, HDR_GFX_FE_0204_BYPASS_ALL, &gfx_fe0->cmdq_base,
+		      gfx_fe0->regs, HDR_GFX_FE_0204_GFX_HDR_FE);
+
+	mtk_ddp_write(cmdq_pkt, HDR_GFX_FE_0204_BYPASS_ALL, &gfx_fe1->cmdq_base,
+		      gfx_fe1->regs, HDR_GFX_FE_0204_GFX_HDR_FE);
+
+	mtk_ddp_write(cmdq_pkt, HDR_VDO_BE_0204_BYPASS_ALL, &vdo_be->cmdq_base,
+		      vdo_be->regs, HDR_VDO_BE_0204_VDO_DM_BE);
+
+	mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE, &mixer->cmdq_base, mixer->regs, MIX_FUNC_DCM0);
+	mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE, &mixer->cmdq_base, mixer->regs, MIX_FUNC_DCM1);
+	mtk_ddp_write(cmdq_pkt, (h << 16 | w), &mixer->cmdq_base, mixer->regs, MIX_ROI_SIZE);
+	mtk_ddp_write(cmdq_pkt, BGCLR_BLACK, &mixer->cmdq_base, mixer->regs, MIX_ROI_BGCLR);
+	mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, mixer->regs,
+		      MIX_L_SRC_CON(0));
+	mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, mixer->regs,
+		      MIX_L_SRC_CON(1));
+	mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, mixer->regs,
+		      MIX_L_SRC_CON(2));
+	mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, mixer->regs,
+		      MIX_L_SRC_CON(3));
+	mtk_ddp_write(cmdq_pkt, 0x0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(0));
+	mtk_ddp_write(cmdq_pkt, OUTPUT_NO_RND | SOURCE_RGB_SEL | BACKGROUND_RELAY,
+		      &mixer->cmdq_base, mixer->regs, MIX_DATAPATH_CON);
+	mtk_ddp_write_mask(cmdq_pkt, MIX_SRC_L0_EN, &mixer->cmdq_base, mixer->regs,
+			   MIX_SRC_CON, MIX_SRC_L0_EN);
+
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH, 0,
+			     w / 2, cmdq_pkt);
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT, 0,
+			     h, cmdq_pkt);
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_CH_SWAP, 4, 0, cmdq_pkt);
+}
+
+void mtk_ethdr_start(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	writel(1, mixer->regs + MIX_EN);
+}
+
+void mtk_ethdr_stop(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	mtk_ovl_adaptor_stop(priv->ovl_adaptor_dev);
+
+	writel(0, mixer->regs + MIX_EN);
+	writel(1, mixer->regs + MIX_RST);
+	reset_control_reset(devm_reset_control_array_get(dev, true, true));
+	writel(0, mixer->regs + MIX_RST);
+}
+
+int mtk_ethdr_clk_enable(struct device *dev)
+{
+	int ret;
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	mtk_ovl_adaptor_clk_enable(priv->ovl_adaptor_dev);
+
+	ret = clk_bulk_prepare_enable(ETHDR_CLK_NUM, priv->ethdr_clk);
+	if (ret)
+		dev_err(dev,
+			"ethdr_clk prepare enable failed\n");
+	return ret;
+}
+
+void mtk_ethdr_clk_disable(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	mtk_ovl_adaptor_clk_disable(priv->ovl_adaptor_dev);
+
+	clk_bulk_disable_unprepare(ETHDR_CLK_NUM, priv->ethdr_clk);
+}
+
+unsigned int mtk_ethdr_layer_nr(struct device *dev)
+{
+	return 4;
+}
+
+static int mtk_ethdr_bind(struct device *dev, struct device *master,
+			  void *data)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct platform_device *ovl_adaptor;
+	struct drm_device *drm_dev = data;
+	struct mtk_drm_private *drm_private = drm_dev->dev_private;
+
+	priv->mmsys_dev = drm_private->mmsys_dev;
+
+	/* Bring up ovl adaptor rdma and merge */
+	ovl_adaptor = platform_device_register_data(dev, "mediatek-disp-ovl-adaptor",
+						    PLATFORM_DEVID_AUTO, (void *)priv->mmsys_dev,
+						    sizeof(*priv->mmsys_dev));
+	if (IS_ERR(ovl_adaptor))
+		return PTR_ERR(ovl_adaptor);
+
+	priv->ovl_adaptor_dev = &ovl_adaptor->dev;
+
+	return 0;
+}
+
+static void mtk_ethdr_unbind(struct device *dev, struct device *master, void *data)
+{
+}
+
+static const struct component_ops mtk_ethdr_component_ops = {
+	.bind	= mtk_ethdr_bind,
+	.unbind = mtk_ethdr_unbind,
+};
+
+static int mtk_ethdr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_ethdr *priv;
+	int ret;
+	int i;
+
+	dev_info(dev, "%s+\n", __func__);
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	for (i = 0; i < ETHDR_ID_MAX; i++) {
+		priv->ethdr_comp[i].dev = dev;
+		priv->ethdr_comp[i].regs = of_iomap(dev->of_node, i);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+		ret = cmdq_dev_get_client_reg(dev,
+					      &priv->ethdr_comp[i].cmdq_base, i);
+		if (ret)
+			dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+		dev_info(dev, "[DRM]regs:0x%x, node:%s\n",
+			 priv->ethdr_comp[i].regs, ethdr_comp_str[i]);
+	}
+
+	for (i = 0; i < ETHDR_CLK_NUM; i++)
+		priv->ethdr_clk[i].id = ethdr_clk_str[i];
+	ret = devm_clk_bulk_get_optional(dev, ETHDR_CLK_NUM, priv->ethdr_clk);
+	if (ret)
+		return ret;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		priv->irq = 0;
+
+	if (priv->irq) {
+		ret = devm_request_irq(dev, priv->irq, mtk_ethdr_irq_handler,
+				       IRQF_TRIGGER_NONE, dev_name(dev), priv);
+		if (ret < 0) {
+			dev_err(dev, "Failed to request irq %d: %d\n", priv->irq, ret);
+			return ret;
+		}
+	}
+
+	spin_lock_init(&priv->lock);
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_ethdr_component_ops);
+	if (ret)
+		dev_notice(dev, "Failed to add component: %d\n", ret);
+
+	dev_info(dev, "%s-\n", __func__);
+	pm_runtime_enable(dev);
+
+	return ret;
+}
+
+static int mtk_ethdr_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_ethdr_component_ops);
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
+static const struct of_device_id mtk_ethdr_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8195-disp-ethdr"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_ethdr_driver_dt_match);
+
+struct platform_driver mtk_ethdr_driver = {
+	.probe = mtk_ethdr_probe,
+	.remove = mtk_ethdr_remove,
+	.driver = {
+			.name = "mediatek-disp-ethdr",
+			.owner = THIS_MODULE,
+			.of_match_table = mtk_ethdr_driver_dt_match,
+		},
+};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
