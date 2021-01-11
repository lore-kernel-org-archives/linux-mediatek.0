Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5351C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 07:54:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 469C122482
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 07:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 469C122482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tFU7dq38ZJLYjqTNSOIq2GzFXe78p8h32ZmkYkwpuCc=; b=ax774m5Iv6gvA8KXEapDiInPO
	dc/wD6eokRaG2gH4x0mYQNM3/ZB1Vlvc1L9AFNIDYjcJiB0ho3YqOT5Tm234NoqJeGJrptgZDW4la
	AM1ur48JfBtTUXrx2tzF1aDjiLoeng9mRcP+UrC1oDY6ldHtDWMwAwDOUWcda9sioxxSaptkv7jsv
	SNTGXqD2dHqGWmGQdyCLz1JCAx7eu59GB2d65tY2MbFqCDaTqQYMC9R2DjXY+s2Lgbi6Gd67SS58T
	qmmoK9MNvO4TT9zqLIHzSIoZTyzc4dQ2I9kGx4nH9oXVXBOHbpN8g3LLkZr7HZ8nhjIT/xM0ODYKe
	jddb4Z6jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kys24-0006MM-90; Mon, 11 Jan 2021 07:54:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kys1q-0006DR-Bn; Mon, 11 Jan 2021 07:54:21 +0000
X-UUID: c397ff6ac93a43f0ad2bafd2ae23ed2a-20210110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5PicCLRX1Nz7vIAqFZBWvGQ4+nnxcsTdc9pGIGL23DQ=; 
 b=ZWm0d0OtUBQoBPLpbWlGYit8qodW/Xl3GbjmXWemi2m1PHmBUfvqrhxsvBFGX3TDpivDw+vogx619UVfLoQfc8dikxfDJcpgvOiEOFpwH0Pq20YCjfml5ugpNKpnqEOIhrHRkt4O4EZiduWWFVMBmYap52QYRtFHnw4EZX7CCHg=;
X-UUID: c397ff6ac93a43f0ad2bafd2ae23ed2a-20210110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 442611478; Sun, 10 Jan 2021 23:54:10 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Jan 2021 23:44:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 15:44:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 15:44:05 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 12/15] drm/mediatek: separate ccorr module
Date: Mon, 11 Jan 2021 15:43:48 +0800
Message-ID: <1610351031-21133-13-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_025418_637009_4FB935C4 
X-CRM114-Status: GOOD (  27.38  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

ccorr ctm matrix bits will be different in mt8192

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c   | 222 ++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  92 +-----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 5 files changed, 231 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index ce5ad59..a02f534 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-mediatek-drm-y := mtk_disp_color.o \
+mediatek-drm-y := mtk_disp_ccorr.o \
+		  mtk_disp_color.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_postmask.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
new file mode 100644
index 0000000..63b3ef6
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -0,0 +1,222 @@
+/*
+ * SPDX-License-Identifier:
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+
+#define DISP_CCORR_EN				0x0000
+#define CCORR_EN					BIT(0)
+#define DISP_CCORR_CFG				0x0020
+#define CCORR_RELAY_MODE				BIT(0)
+#define CCORR_ENGINE_EN					BIT(1)
+#define CCORR_GAMMA_OFF					BIT(2)
+#define CCORR_WGAMUT_SRC_CLIP				BIT(3)
+#define DISP_CCORR_SIZE				0x0030
+#define DISP_CCORR_COEF_0			0x0080
+#define DISP_CCORR_COEF_1			0x0084
+#define DISP_CCORR_COEF_2			0x0088
+#define DISP_CCORR_COEF_3			0x008C
+#define DISP_CCORR_COEF_4			0x0090
+
+struct mtk_disp_ccorr_data {
+	u32 reserved;
+};
+
+/**
+ * struct mtk_disp_ccorr - DISP_CCORR driver structure
+ * @ddp_comp - structure containing type enum and hardware resources
+ * @crtc - associated crtc to report irq events to
+ */
+struct mtk_disp_ccorr {
+	struct mtk_ddp_comp			ddp_comp;
+	const struct mtk_disp_ccorr_data	*data;
+};
+
+static inline struct mtk_disp_ccorr *comp_to_ccorr(struct mtk_ddp_comp *comp)
+{
+	return container_of(comp, struct mtk_disp_ccorr, ddp_comp);
+}
+
+static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, DISP_CCORR_SIZE);
+	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, DISP_CCORR_CFG);
+}
+
+static void mtk_ccorr_start(struct mtk_ddp_comp *comp)
+{
+	writel(CCORR_EN, comp->regs + DISP_CCORR_EN);
+}
+
+static void mtk_ccorr_stop(struct mtk_ddp_comp *comp)
+{
+	writel_relaxed(0x0, comp->regs + DISP_CCORR_EN);
+}
+
+/* Converts a DRM S31.32 value to the HW S1.10 format. */
+static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
+{
+	u16 r;
+
+	/* Sign bit. */
+	r = in & BIT_ULL(63) ? BIT(11) : 0;
+
+	if ((in & GENMASK_ULL(62, 33)) > 0) {
+		/* identity value 0x100000000 -> 0x400, */
+		/* if bigger this, set it to max 0x7ff. */
+		r |= GENMASK(10, 0);
+	} else {
+		/* take the 11 most important bits. */
+		r |= (in >> 22) & GENMASK(10, 0);
+	}
+
+	return r;
+}
+
+static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
+			      struct drm_crtc_state *state)
+{
+	struct drm_property_blob *blob = state->ctm;
+	struct drm_color_ctm *ctm;
+	const u64 *input;
+	uint16_t coeffs[9] = { 0 };
+	int i;
+	struct cmdq_pkt *cmdq_pkt = NULL;
+
+	if (!blob)
+		return;
+
+	ctm = (struct drm_color_ctm *)blob->data;
+	input = ctm->matrix;
+
+	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
+		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
+
+	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
+		      comp, DISP_CCORR_COEF_0);
+	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
+		      comp, DISP_CCORR_COEF_1);
+	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
+		      comp, DISP_CCORR_COEF_2);
+	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
+		      comp, DISP_CCORR_COEF_3);
+	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
+		      comp, DISP_CCORR_COEF_4);
+}
+
+static const struct mtk_ddp_comp_funcs mtk_disp_ccorr_funcs = {
+	.config = mtk_ccorr_config,
+	.start = mtk_ccorr_start,
+	.stop = mtk_ccorr_stop,
+	.ctm_set = mtk_ccorr_ctm_set,
+};
+
+static int mtk_disp_ccorr_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	struct mtk_disp_ccorr *priv = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	int ret;
+
+	ret = mtk_ddp_comp_register(drm_dev, &priv->ddp_comp);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register component %pOF: %d\n",
+			dev->of_node, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_disp_ccorr_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+	struct mtk_disp_ccorr *priv = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+
+	mtk_ddp_comp_unregister(drm_dev, &priv->ddp_comp);
+}
+
+static const struct component_ops mtk_disp_ccorr_component_ops = {
+	.bind	= mtk_disp_ccorr_bind,
+	.unbind	= mtk_disp_ccorr_unbind,
+};
+
+static int mtk_disp_ccorr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_ccorr *priv;
+	int comp_id;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_CCORR);
+	if (comp_id < 0) {
+		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
+		return comp_id;
+	}
+
+	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
+				&mtk_disp_ccorr_funcs);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to initialize component: %d\n",
+				ret);
+
+		return ret;
+	}
+
+	priv->data = of_device_get_match_data(dev);
+
+	platform_set_drvdata(pdev, priv);
+
+	pm_runtime_enable(dev);
+
+	ret = component_add(dev, &mtk_disp_ccorr_component_ops);
+	if (ret)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_ccorr_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	component_del(&pdev->dev, &mtk_disp_ccorr_component_ops);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8183-disp-ccorr"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
+
+struct platform_driver mtk_disp_ccorr_driver = {
+	.probe		= mtk_disp_ccorr_probe,
+	.remove		= mtk_disp_ccorr_remove,
+	.driver		= {
+		.name	= "mediatek-disp-ccorr",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_ccorr_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 6081800..bb7893d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -35,20 +35,6 @@
 #define DISP_AAL_EN				0x0000
 #define DISP_AAL_SIZE				0x0030
 
-#define DISP_CCORR_EN				0x0000
-#define CCORR_EN				BIT(0)
-#define DISP_CCORR_CFG				0x0020
-#define CCORR_RELAY_MODE			BIT(0)
-#define CCORR_ENGINE_EN				BIT(1)
-#define CCORR_GAMMA_OFF				BIT(2)
-#define CCORR_WGAMUT_SRC_CLIP			BIT(3)
-#define DISP_CCORR_SIZE				0x0030
-#define DISP_CCORR_COEF_0			0x0080
-#define DISP_CCORR_COEF_1			0x0084
-#define DISP_CCORR_COEF_2			0x0088
-#define DISP_CCORR_COEF_3			0x008C
-#define DISP_CCORR_COEF_4			0x0090
-
 #define DISP_DITHER_EN				0x0000
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
@@ -187,75 +173,6 @@ static void mtk_aal_stop(struct mtk_ddp_comp *comp)
 	writel_relaxed(0x0, comp->regs + DISP_AAL_EN);
 }
 
-static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
-			     unsigned int h, unsigned int vrefresh,
-			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_CCORR_SIZE);
-	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, DISP_CCORR_CFG);
-}
-
-static void mtk_ccorr_start(struct mtk_ddp_comp *comp)
-{
-	writel(CCORR_EN, comp->regs + DISP_CCORR_EN);
-}
-
-static void mtk_ccorr_stop(struct mtk_ddp_comp *comp)
-{
-	writel_relaxed(0x0, comp->regs + DISP_CCORR_EN);
-}
-
-/* Converts a DRM S31.32 value to the HW S1.10 format. */
-static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
-{
-	u16 r;
-
-	/* Sign bit. */
-	r = in & BIT_ULL(63) ? BIT(11) : 0;
-
-	if ((in & GENMASK_ULL(62, 33)) > 0) {
-		/* identity value 0x100000000 -> 0x400, */
-		/* if bigger this, set it to max 0x7ff. */
-		r |= GENMASK(10, 0);
-	} else {
-		/* take the 11 most important bits. */
-		r |= (in >> 22) & GENMASK(10, 0);
-	}
-
-	return r;
-}
-
-static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
-			      struct drm_crtc_state *state)
-{
-	struct drm_property_blob *blob = state->ctm;
-	struct drm_color_ctm *ctm;
-	const u64 *input;
-	uint16_t coeffs[9] = { 0 };
-	int i;
-	struct cmdq_pkt *cmdq_pkt = NULL;
-
-	if (!blob)
-		return;
-
-	ctm = (struct drm_color_ctm *)blob->data;
-	input = ctm->matrix;
-
-	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
-		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
-
-	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
-		      comp, DISP_CCORR_COEF_0);
-	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
-		      comp, DISP_CCORR_COEF_1);
-	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
-		      comp, DISP_CCORR_COEF_2);
-	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
-		      comp, DISP_CCORR_COEF_3);
-	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
-		      comp, DISP_CCORR_COEF_4);
-}
-
 static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
 			      unsigned int h, unsigned int vrefresh,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -315,13 +232,6 @@ static void mtk_dither_stop(struct mtk_ddp_comp *comp)
 	.stop = mtk_aal_stop,
 };
 
-static const struct mtk_ddp_comp_funcs ddp_ccorr = {
-	.config = mtk_ccorr_config,
-	.start = mtk_ccorr_start,
-	.stop = mtk_ccorr_stop,
-	.ctm_set = mtk_ccorr_ctm_set,
-};
-
 static const struct mtk_ddp_comp_funcs ddp_dither = {
 	.config = mtk_dither_config,
 	.start = mtk_dither_start,
@@ -367,7 +277,7 @@ struct mtk_ddp_comp_match {
 	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal },
 	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
 	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
-	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
+	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, NULL },
 	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, NULL },
 	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, NULL },
 	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index bc205e9..79e86f7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -533,11 +533,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
-		 * Currently only the COLOR, GAMMA, OVL, POSTMASK, RDMA, DSI, and DPI blocks have
-		 * separate component platform drivers and initialize their own
+		 * Currently only the CCORR, COLOR, GAMMA, OVL, POSTMASK, RDMA, DSI, and DPI
+		 * blocks have separate component platform drivers and initialize their own
 		 * DDP component structure. The others are initialized here.
 		 */
-		if (comp_type == MTK_DISP_COLOR ||
+		if (comp_type == MTK_DISP_CCORR ||
+		    comp_type == MTK_DISP_COLOR ||
 		    comp_type == MTK_DISP_GAMMA ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
@@ -652,6 +653,7 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
 
 static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_ddp_driver,
+	&mtk_disp_ccorr_driver,
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_ovl_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 8a9544b..e20a0e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -47,6 +47,7 @@ struct mtk_drm_private {
 };
 
 extern struct platform_driver mtk_ddp_driver;
+extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
