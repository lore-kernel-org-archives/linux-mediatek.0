Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EA8C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 03:12:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F2E2229C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 03:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F2E2229C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D2+r/tPz1484Rn5ev4qidq7KJRzHjQc8fFkL7p+vR28=; b=x0/mTM+ZFoBxbxS1tVQFSYtJi
	akT/cSxsNv71ro8pvCR7CQgdg9uvtnmZUB8T+eGleGdP+5e9XmSMJGDn+9L7SqNvWw8vMKz+Gw63x
	c747mR8SQtxmF5NDSMHwR4G4nUlvDu8m/FIZIwOVQU1S3xmSoB/xcDWK8fQ/DXsEUUWeNDN3M66vu
	cuSpzreQnr09fQExbQDkteyXbO1W9jy4/PzVfDXmDH8HTVLFlpEJ1/eHr35KWOZdQNZZEc+rY9CkV
	yB87unPjvFOJBT7JU++K/EUSfpvdUrzBd85AqkQuXBXxh11bU172h7jHYv9lhgF3QKHBvT0IzYp/J
	eR/loJblQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxLj1-0005VC-BT; Thu, 07 Jan 2021 03:12:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxLi9-0004sf-CX; Thu, 07 Jan 2021 03:11:46 +0000
X-UUID: 75c0834786a64ae09e97226b9bd8f4be-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JBFIlPXNBVLLie8TSV83nUr1N8cRw/83A8sB6/DnFOo=; 
 b=pAJAjAYkOiHbv7cGRVBrMdIR/3UTR94AXTy/uHiofQkqzgbRDDfV1cP+BzirRIVwAmGbNSkL82clrB9uIaYjl1HVqJMrUoOE0g2wBGLranPcXd9HyY01xterMs9RHh5AsDYPdNvTrOB2RaVtwJxGW5Xx+jHMmH3/MmDwPEc2wE0=;
X-UUID: 75c0834786a64ae09e97226b9bd8f4be-20210106
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1322637100; Wed, 06 Jan 2021 19:11:33 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 19:11:32 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 11:11:31 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jan 2021 11:11:30 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v9, 07/11] drm/mediatek: separate gamma module
Date: Thu, 7 Jan 2021 11:11:17 +0800
Message-ID: <1609989081-29353-8-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_221141_761176_79717DF8 
X-CRM114-Status: GOOD (  26.25  )
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

mt8183 gamma module will different with mt8173
separate gamma for add private data

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 185 ++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  58 +--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 6 files changed, 192 insertions(+), 58 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index a892ede..17a08e2 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 mediatek-drm-y := mtk_disp_color.o \
+		  mtk_disp_gamma.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
new file mode 100644
index 0000000..8501821
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -0,0 +1,185 @@
+/*
+ * SPDX-License-Identifier:
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+
+#define DISP_GAMMA_EN				0x0000
+#define GAMMA_EN					BIT(0)
+#define DISP_GAMMA_CFG				0x0020
+#define GAMMA_LUT_EN					BIT(1)
+#define DISP_GAMMA_SIZE				0x0030
+#define DISP_GAMMA_LUT				0x0700
+
+#define LUT_10BIT_MASK				0x03ff
+
+struct mtk_disp_gamma_data {
+	u32 reserved;
+};
+
+/**
+ * struct mtk_disp_gamma - DISP_GAMMA driver structure
+ * @ddp_comp - structure containing type enum and hardware resources
+ * @crtc - associated crtc to report irq events to
+ */
+struct mtk_disp_gamma {
+	struct mtk_ddp_comp			ddp_comp;
+	const struct mtk_disp_gamma_data	*data;
+};
+
+static inline struct mtk_disp_gamma *comp_to_gamma(struct mtk_ddp_comp *comp)
+{
+	return container_of(comp, struct mtk_disp_gamma, ddp_comp);
+}
+
+void mtk_gamma_set(struct mtk_ddp_comp *comp, struct drm_crtc_state *state)
+{
+	unsigned int i, reg;
+	struct drm_color_lut *lut;
+	void __iomem *lut_base;
+	u32 word;
+
+	if (state->gamma_lut) {
+		reg = readl(comp->regs + DISP_GAMMA_CFG);
+		reg = reg | GAMMA_LUT_EN;
+		writel(reg, comp->regs + DISP_GAMMA_CFG);
+		lut_base = comp->regs + DISP_GAMMA_LUT;
+		lut = (struct drm_color_lut *)state->gamma_lut->data;
+		for (i = 0; i < MTK_LUT_SIZE; i++) {
+			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
+				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
+				((lut[i].blue >> 6) & LUT_10BIT_MASK);
+			writel(word, (lut_base + i * 4));
+		}
+	}
+}
+
+static void mtk_gamma_config(struct mtk_ddp_comp *comp, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_gamma *gamma = comp_to_gamma(comp);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_GAMMA_SIZE);
+
+	mtk_dither_set(comp, bpc, DISP_GAMMA_CFG, cmdq_pkt);
+}
+
+static void mtk_gamma_start(struct mtk_ddp_comp *comp)
+{
+	writel(GAMMA_EN, comp->regs  + DISP_GAMMA_EN);
+}
+
+static void mtk_gamma_stop(struct mtk_ddp_comp *comp)
+{
+	writel_relaxed(0x0, comp->regs + DISP_GAMMA_EN);
+}
+
+static const struct mtk_ddp_comp_funcs mtk_disp_gamma_funcs = {
+	.gamma_set = mtk_gamma_set,
+	.config = mtk_gamma_config,
+	.start = mtk_gamma_start,
+	.stop = mtk_gamma_stop,
+};
+
+static int mtk_disp_gamma_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	struct mtk_disp_gamma *priv = dev_get_drvdata(dev);
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
+static void mtk_disp_gamma_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+	struct mtk_disp_gamma *priv = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+
+	mtk_ddp_comp_unregister(drm_dev, &priv->ddp_comp);
+}
+
+static const struct component_ops mtk_disp_gamma_component_ops = {
+	.bind	= mtk_disp_gamma_bind,
+	.unbind = mtk_disp_gamma_unbind,
+};
+
+static int mtk_disp_gamma_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_gamma *priv;
+	int comp_id;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_GAMMA);
+	if (comp_id < 0) {
+		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
+		return comp_id;
+	}
+
+	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
+				&mtk_disp_gamma_funcs);
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
+	ret = component_add(dev, &mtk_disp_gamma_component_ops);
+	if (ret)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_gamma_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_gamma_component_ops);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8173-disp-gamma"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
+
+struct platform_driver mtk_disp_gamma_driver = {
+	.probe		= mtk_disp_gamma_probe,
+	.remove		= mtk_disp_gamma_remove,
+	.driver		= {
+		.name	= "mediatek-disp-gamma",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_gamma_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 3064eac..03589c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -55,11 +55,6 @@
 #define DITHER_RELAY_MODE			BIT(0)
 #define DISP_DITHER_SIZE			0x0030
 
-#define DISP_GAMMA_EN				0x0000
-#define DISP_GAMMA_CFG				0x0020
-#define DISP_GAMMA_SIZE				0x0030
-#define DISP_GAMMA_LUT				0x0700
-
 #define LUT_10BIT_MASK				0x03ff
 
 #define OD_RELAYMODE				BIT(0)
@@ -68,9 +63,6 @@
 
 #define AAL_EN					BIT(0)
 
-#define GAMMA_EN				BIT(0)
-#define GAMMA_LUT_EN				BIT(1)
-
 #define DISP_DITHERING				BIT(2)
 #define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
 #define DITHER_OVFLW_BIT_R(x)			(((x) & 0x7) << 24)
@@ -280,47 +272,6 @@ static void mtk_dither_stop(struct mtk_ddp_comp *comp)
 	writel_relaxed(0x0, comp->regs + DISP_DITHER_EN);
 }
 
-static void mtk_gamma_config(struct mtk_ddp_comp *comp, unsigned int w,
-			     unsigned int h, unsigned int vrefresh,
-			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_GAMMA_SIZE);
-	mtk_dither_set(comp, bpc, DISP_GAMMA_CFG, cmdq_pkt);
-}
-
-static void mtk_gamma_start(struct mtk_ddp_comp *comp)
-{
-	writel(GAMMA_EN, comp->regs  + DISP_GAMMA_EN);
-}
-
-static void mtk_gamma_stop(struct mtk_ddp_comp *comp)
-{
-	writel_relaxed(0x0, comp->regs  + DISP_GAMMA_EN);
-}
-
-static void mtk_gamma_set(struct mtk_ddp_comp *comp,
-			  struct drm_crtc_state *state)
-{
-	unsigned int i, reg;
-	struct drm_color_lut *lut;
-	void __iomem *lut_base;
-	u32 word;
-
-	if (state->gamma_lut) {
-		reg = readl(comp->regs + DISP_GAMMA_CFG);
-		reg = reg | GAMMA_LUT_EN;
-		writel(reg, comp->regs + DISP_GAMMA_CFG);
-		lut_base = comp->regs + DISP_GAMMA_LUT;
-		lut = (struct drm_color_lut *)state->gamma_lut->data;
-		for (i = 0; i < MTK_LUT_SIZE; i++) {
-			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
-				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
-				((lut[i].blue >> 6) & LUT_10BIT_MASK);
-			writel(word, (lut_base + i * 4));
-		}
-	}
-}
-
 static const struct mtk_ddp_comp_funcs ddp_aal = {
 	.gamma_set = mtk_gamma_set,
 	.config = mtk_aal_config,
@@ -341,13 +292,6 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
 	.stop = mtk_dither_stop,
 };
 
-static const struct mtk_ddp_comp_funcs ddp_gamma = {
-	.gamma_set = mtk_gamma_set,
-	.config = mtk_gamma_config,
-	.start = mtk_gamma_start,
-	.stop = mtk_gamma_stop,
-};
-
 static const struct mtk_ddp_comp_funcs ddp_od = {
 	.config = mtk_od_config,
 	.start = mtk_od_start,
@@ -396,7 +340,7 @@ struct mtk_ddp_comp_match {
 	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, NULL },
 	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, NULL },
 	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, NULL },
-	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
+	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, NULL },
 	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
 	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
 	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, NULL },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 5aa52b7..178fae9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -179,6 +179,7 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
 void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp);
 void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt);
+void mtk_gamma_set(struct mtk_ddp_comp *comp, struct drm_crtc_state *state);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 		   struct mtk_ddp_comp *comp, unsigned int offset);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 2f717df..37fec25 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -488,11 +488,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
-		 * Currently only the COLOR, OVL, RDMA, DSI, and DPI blocks have
+		 * Currently only the COLOR, GAMMA, OVL, RDMA, DSI, and DPI blocks have
 		 * separate component platform drivers and initialize their own
 		 * DDP component structure. The others are initialized here.
 		 */
 		if (comp_type == MTK_DISP_COLOR ||
+		    comp_type == MTK_DISP_GAMMA ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
 		    comp_type == MTK_DISP_RDMA ||
@@ -606,6 +607,7 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
 static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_ddp_driver,
 	&mtk_disp_color_driver,
+	&mtk_disp_gamma_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 5d771cf..bbd362b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -48,6 +48,7 @@ struct mtk_drm_private {
 
 extern struct platform_driver mtk_ddp_driver;
 extern struct platform_driver mtk_disp_color_driver;
+extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
