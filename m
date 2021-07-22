Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0502C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:58:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF7C061244
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF7C061244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEwoiBG8wDOUJWl5eY3XgvkZAa35uU1/mXRnQTY4hEI=; b=sIxLRXXDumSTGs
	0lmOXPY8ranNoUPDr9hTUnR5QxDvewb/LoLnNLMYfBxq7sExE4ztxoMpVP0P8fO0jz53Q3QJwspdl
	+5FXgUZRoJ/b47eTbQVj/EaI0+xdEw+NqFlav6IyJMUDpDCxFLkJnKR/7N5KZM7vdmJEccyrNtKoW
	Rx50nju/yoSpsAfSGrpKlRJzhY7diSSHvRYRKjQc+ukCHtVdRChUF3j8xnqs37G86DvtsCX0qDH7R
	YsZsYcqVN5z6KlYG61wU3fLTLFejFwCWZ6g5aDzZ18QAO+WeXD4uqQegH5eWYPkd83wb5MEt+Q0Xa
	H+bOA1/EGkZ6SNzZ+95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VSl-0013fP-F2; Thu, 22 Jul 2021 09:57:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VNL-0011F8-Qn; Thu, 22 Jul 2021 09:52:22 +0000
X-UUID: c60fedd3bf524ad88205699a14e21c8f-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x885xFtzKhBiwH9ht9nBE8e6Uoj2nWhP1P513HgiT1c=; 
 b=DBylCSxRPEDr0Fnluba27sHmQ77j2LlrjEYEn5UxRlwyVRlGaWeWKQtWTfmzUMUS/n8IRgH095/lWk/v1aqivncvsUY/T4G9fE+4LaL05YZkiGr/dLEkT70vBZ6/3GiYpHCBb76e5GefQkyV8nYfyFc2CZ5pp1A87tw71oiqW9g=;
X-UUID: c60fedd3bf524ad88205699a14e21c8f-20210722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 127450742; Thu, 22 Jul 2021 02:52:13 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 02:45:56 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:45:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:45:55 +0800
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
Subject: [PATCH v2 13/14] drm/mediatek: add ETHDR support for MT8195
Date: Thu, 22 Jul 2021 17:45:50 +0800
Message-ID: <20210722094551.15255-14-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722094551.15255-1-nancy.lin@mediatek.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_025219_962540_33351563 
X-CRM114-Status: GOOD (  23.70  )
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

Add ETHDR module files:
ETHDR is designed for HDR video and graphics conversion in the external
display path. It handles multiple HDR input types and performs tone
mapping, color space/color format conversion, and then combines
different layers, output the required HDR or SDR signal to the
subsequent display path.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile       |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  16 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   3 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c    | 413 ++++++++++++++++++++++++
 5 files changed, 435 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 31613564f499..b4b305d58b0f 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -15,7 +15,8 @@ mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
 		  mtk_disp_pseudo_ovl.o \
-		  mtk_mdp_rdma.o
+		  mtk_mdp_rdma.o \
+		  mtk_ethdr.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 3e27ce7fef57..464db52131db 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -105,4 +105,20 @@ void mtk_rdma_enable_vblank(struct device *dev,
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
 #endif
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 11c25daf05d8..58f9f9f06e94 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -480,6 +480,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt8195-disp-ethdr",
+	  .data = (void *)MTK_DISP_PSEUDO_OVL },
 	{ }
 };
 
@@ -676,6 +678,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_dpi_driver,
 	&mtk_drm_platform_driver,
 	&mtk_dsi_driver,
+	&mtk_ethdr_driver,
 };
 
 static int __init mtk_drm_init(void)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index c4d802a43531..c87ebb5309d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -55,5 +55,6 @@ extern struct platform_driver mtk_disp_dsc_driver;
 extern struct platform_driver mtk_disp_merge_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
+extern struct platform_driver mtk_ethdr_driver;
 
 #endif /* MTK_DRM_DRV_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
new file mode 100644
index 000000000000..26e079323de0
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -0,0 +1,413 @@
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
+#include "mtk_disp_pseudo_ovl.h"
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
+	struct device *pseudo_ovl_dev;
+	struct device *mmsys_dev;
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
+
+	priv->vblank_cb = vblank_cb;
+	priv->vblank_cb_data = vblank_cb_data;
+
+	writel(MIX_FME_CPL_INTEN, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTEN);
+}
+
+void mtk_ethdr_disable_vblank(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = NULL;
+	priv->vblank_cb_data = NULL;
+
+	writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTEN);
+}
+
+static irqreturn_t mtk_ethdr_irq_handler(int irq, void *dev_id)
+{
+	struct mtk_ethdr *priv = dev_id;
+
+	writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTSTA);
+
+	if (!priv->vblank_cb)
+		return IRQ_NONE;
+
+	priv->vblank_cb(priv->vblank_cb_data);
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
+	unsigned int src_size = (pending->height << 16) | pending->width;
+	unsigned int offset = (pending->y << 16) | pending->x;
+	unsigned int alpha_con = 0;
+	unsigned int fmt = 0;
+
+	dev_dbg(dev, "%s+ idx:%d", __func__, idx);
+
+	if (idx >= 4)
+		return;
+
+	mtk_pseudo_ovl_layer_config(priv->pseudo_ovl_dev, idx, state, cmdq_pkt);
+
+	if (!pending->enable) {
+		mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
+		return;
+	}
+
+	if (state->base.fb && state->base.fb->format->has_alpha) {
+		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_ALPHA_SEL,
+				     idx + 1, 0, cmdq_pkt);
+	} else {
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_ALPHA_SEL,
+				     idx + 1, 1, cmdq_pkt);
+	}
+
+	mtk_ddp_write(cmdq_pkt, src_size, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
+	mtk_ddp_write(cmdq_pkt, offset, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_OFFSET(idx));
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
+	int i;
+
+	dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
+
+	mtk_pseudo_ovl_config(priv->pseudo_ovl_dev, w, h, vrefresh, bpc, cmdq_pkt);
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
+			     (w / 2), cmdq_pkt);
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT, 0,
+			     h, cmdq_pkt);
+	mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_CH_SWAP, 4, 0, cmdq_pkt);
+
+	for (i = 1; i <= 4; i++) {
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, i,
+				     DEFAULT_9BIT_ALPHA, cmdq_pkt);
+		mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, i,
+				     DEFAULT_9BIT_ALPHA, cmdq_pkt);
+	}
+}
+
+void mtk_ethdr_start(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	mtk_pseudo_ovl_start(priv->pseudo_ovl_dev);
+
+	mtk_ddp_write(NULL, 1, &mixer->cmdq_base, mixer->regs, MIX_EN);
+}
+
+void mtk_ethdr_stop(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	mtk_pseudo_ovl_stop(priv->pseudo_ovl_dev);
+
+	mtk_ddp_write(NULL, 0, &mixer->cmdq_base, mixer->regs, MIX_EN);
+	mtk_ddp_write(NULL, 1, &mixer->cmdq_base, mixer->regs, MIX_RST);
+	reset_control_reset(devm_reset_control_array_get(dev, true, true));
+	mtk_ddp_write(NULL, 0, &mixer->cmdq_base, mixer->regs, MIX_RST);
+}
+
+int mtk_ethdr_clk_enable(struct device *dev)
+{
+	int i, ret;
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	mtk_pseudo_ovl_clk_enable(priv->pseudo_ovl_dev);
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
+	int i;
+
+	mtk_pseudo_ovl_clk_disable(priv->pseudo_ovl_dev);
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
+	struct platform_device *pseudo_ovl;
+	struct drm_device *drm_dev = data;
+	struct mtk_drm_private *drm_private = drm_dev->dev_private;
+
+	priv->mmsys_dev = drm_private->mmsys_dev;
+
+	/* Bring up pseudo ovl rdma and merge */
+	pseudo_ovl = platform_device_register_data(dev, "mediatek-disp-pseudo-ovl",
+						   PLATFORM_DEVID_AUTO, (void *)priv->mmsys_dev,
+						   sizeof(*priv->mmsys_dev));
+	if (IS_ERR(pseudo_ovl))
+		return PTR_ERR(pseudo_ovl);
+
+	priv->pseudo_ovl_dev = &pseudo_ovl->dev;
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
