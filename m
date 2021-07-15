Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B78BC636C8
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:50:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 167B661285
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 17:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 167B661285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTktWB2sg78DIbkhYSpyGpUgmmot77Bxf1wKyrCP9B8=; b=Mzni/7NHAMxODx
	fa0aH8ZxfIyeRxamP11lFP0vg/XyR/4DGh4wk0V2MLmWOhTTlBkjcYH0tPdBw0EPIteK3AMQNUcZt
	JOU7fS7ix1RLXI2df887AbqcuPRMvyAZd5GSQ4Ib0SSaTGo5MyMYMm0IuPwQP2lRMRzOghuJ2RG5y
	q5LOL8JaUmVi9w2QQOpQcKpfzO2DPxMp/ouzuUw+luf69kGPpcO8WAgs7qjW48M22mcHkXaPHCmdL
	NRPrkyL9IQykAKtADCE7u4CF6bWPZ4uCmNjg9FHHQGbrYTwz1R7a6NwHBgvqWYS1yMMUoFeb+pW31
	IpMAYJ+j+C/TklcSKhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m45Ud-001riX-4p; Thu, 15 Jul 2021 17:49:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m45TA-001r7F-PZ; Thu, 15 Jul 2021 17:48:24 +0000
X-UUID: 1612400428314f468ce0a4b19702b7f1-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=td5Mhx1FrxytkXDDNdoIcscG6nchcVkqh6GR/WdzvIU=; 
 b=CyISsBbMmLrl4snmKFgJOmRwZ3EJXIE4zud9lbGdAGGMzkT7p1/OK4Ns2zkeBq9INEndkNyNjp6LmjDgkkTtswfk4BA488DrGCAL4RmDrNe0IdpEf4RLmtkfUskiROEsSWY23YNBuG7FAsKHrUlo+dm+hkRsS2ZafR63ZmCVAuA=;
X-UUID: 1612400428314f468ce0a4b19702b7f1-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1242681123; Thu, 15 Jul 2021 10:48:11 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 10:38:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:37:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Jul 2021 01:37:54 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 11/12] drm/mediatek: add DSC support for MT8195
Date: Fri, 16 Jul 2021 01:37:49 +0800
Message-ID: <20210715173750.10852-12-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_104820_919179_07812352 
X-CRM114-Status: GOOD (  24.05  )
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

Add DSC module file:
  DSC is designed for real-time systems with real-time compression,
  transmission, decompression and display.
  The DSC standard is a specification of the algorithms used for
  compressing and decompressing image display streams, including
  the specification of the syntax and semantics of the compressed
  video bit stream.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_dsc.c     | 161 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  19 ++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 7 files changed, 194 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index dc54a7a69005..44948e221fd3 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -2,6 +2,7 @@
 
 mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_disp_color.o \
+		  mtk_disp_dsc.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_rdma.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index cafd9df2d63b..c7e9bd370acd 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -33,6 +33,14 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 void mtk_dpi_start(struct device *dev);
 void mtk_dpi_stop(struct device *dev);
 
+int mtk_dsc_clk_enable(struct device *dev);
+void mtk_dsc_clk_disable(struct device *dev);
+void mtk_dsc_config(struct device *dev, unsigned int width,
+		    unsigned int height, unsigned int vrefresh,
+		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_dsc_start(struct device *dev);
+void mtk_dsc_stop(struct device *dev);
+
 void mtk_dsi_ddp_start(struct device *dev);
 void mtk_dsi_ddp_stop(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_dsc.c b/drivers/gpu/drm/mediatek/mtk_disp_dsc.c
new file mode 100644
index 000000000000..6a196220c532
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_dsc.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
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
+#include "mtk_drm_gem.h"
+#include "mtk_disp_drv.h"
+
+#define DISP_REG_DSC_CON			0x0000
+#define DSC_EN					BIT(0)
+#define DSC_DUAL_INOUT				BIT(2)
+#define DSC_BYPASS				BIT(4)
+#define DSC_UFOE_SEL				BIT(16)
+
+/**
+ * struct mtk_disp_dsc - DISP_DSC driver structure
+ * @clk - clk of dsc hardware
+ * @regs - hardware register address of dsc
+ * @cmdq_reg - structure containing cmdq hardware resource
+ */
+struct mtk_disp_dsc {
+	struct clk *clk;
+	void __iomem *regs;
+	struct cmdq_client_reg		cmdq_reg;
+};
+
+void mtk_dsc_start(struct device *dev)
+{
+	struct mtk_disp_dsc *dsc = dev_get_drvdata(dev);
+	void __iomem *baddr = dsc->regs;
+
+	mtk_ddp_write_mask(NULL, DSC_EN, &dsc->cmdq_reg, baddr,
+			   DISP_REG_DSC_CON, DSC_EN);
+}
+
+void mtk_dsc_stop(struct device *dev)
+{
+	struct mtk_disp_dsc *dsc = dev_get_drvdata(dev);
+	void __iomem *baddr = dsc->regs;
+
+	mtk_ddp_write_mask(NULL, 0x0, &dsc->cmdq_reg, baddr,
+			   DISP_REG_DSC_CON, DSC_EN);
+}
+
+int mtk_dsc_clk_enable(struct device *dev)
+{
+	struct mtk_disp_dsc *dsc = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(dsc->clk);
+}
+
+void mtk_dsc_clk_disable(struct device *dev)
+{
+	struct mtk_disp_dsc *dsc = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(dsc->clk);
+}
+
+void mtk_dsc_config(struct device *dev, unsigned int w,
+		    unsigned int h, unsigned int vrefresh,
+		    unsigned int bpc, struct cmdq_pkt *handle)
+{
+	struct mtk_disp_dsc *dsc = dev_get_drvdata(dev);
+
+	/* dsc bypass mode */
+	mtk_ddp_write_mask(handle, DSC_BYPASS, &dsc->cmdq_reg, dsc->regs,
+			   DISP_REG_DSC_CON, DSC_BYPASS);
+	mtk_ddp_write_mask(handle, DSC_UFOE_SEL, &dsc->cmdq_reg, dsc->regs,
+			   DISP_REG_DSC_CON, DSC_UFOE_SEL);
+	mtk_ddp_write_mask(handle, DSC_DUAL_INOUT, &dsc->cmdq_reg, dsc->regs,
+			   DISP_REG_DSC_CON, DSC_DUAL_INOUT);
+}
+
+static int mtk_disp_dsc_bind(struct device *dev, struct device *master,
+			     void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_dsc_unbind(struct device *dev, struct device *master,
+				void *data)
+{
+}
+
+static const struct component_ops mtk_disp_dsc_component_ops = {
+	.bind = mtk_disp_dsc_bind,
+	.unbind = mtk_disp_dsc_unbind,
+};
+
+static int mtk_disp_dsc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct mtk_disp_dsc *priv;
+	int irq;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get dsc clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap dsc\n");
+		return PTR_ERR(priv->regs);
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_disp_dsc_component_ops);
+	if (ret != 0)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_dsc_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_dsc_component_ops);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_disp_dsc_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8195-disp-dsc", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_disp_dsc_driver_dt_match);
+
+struct platform_driver mtk_disp_dsc_driver = {
+	.probe = mtk_disp_dsc_probe,
+	.remove = mtk_disp_dsc_remove,
+	.driver = {
+		.name = "mediatek-disp-dsc",
+		.owner = THIS_MODULE,
+		.of_match_table = mtk_disp_dsc_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 75bc00e17fc4..ba3d7a1ce7ab 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -333,6 +333,14 @@ static const struct mtk_ddp_comp_funcs ddp_rdma = {
 	.layer_config = mtk_rdma_layer_config,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_dsc = {
+	.config = mtk_dsc_config,
+	.start = mtk_dsc_start,
+	.stop = mtk_dsc_stop,
+	.clk_enable = mtk_dsc_clk_enable,
+	.clk_disable = mtk_dsc_clk_disable,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 	.clk_enable = mtk_ddp_clk_enable,
 	.clk_disable = mtk_ddp_clk_disable,
@@ -356,6 +364,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_DSC] = "dsc",
 };
 
 struct mtk_ddp_comp_match {
@@ -374,6 +383,9 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
 	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi },
 	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi },
+	[DDP_COMPONENT_DSC0]	= { MTK_DISP_DSC,	0, &ddp_dsc },
+	[DDP_COMPONENT_DSC1]	= { MTK_DISP_DSC,	1, &ddp_dsc },
+	[DDP_COMPONENT_DSC1_VIRTUAL0]	= { MTK_DISP_DSC,	-1, &ddp_dsc },
 	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi },
 	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
 	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
@@ -508,13 +520,14 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	if (type == MTK_DISP_BLS ||
 	    type == MTK_DISP_CCORR ||
 	    type == MTK_DISP_COLOR ||
+	    type == MTK_DISP_DSC ||
 	    type == MTK_DISP_GAMMA ||
-	    type == MTK_DPI ||
-	    type == MTK_DSI ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
 	    type == MTK_DISP_PWM ||
-	    type == MTK_DISP_RDMA)
+	    type == MTK_DISP_RDMA ||
+	    type == MTK_DPI ||
+	    type == MTK_DSI)
 		return 0;
 
 	priv = devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index bb914d976cf5..661fb620e266 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -34,6 +34,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
 	MTK_DISP_BLS,
+	MTK_DISP_DSC,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d6f6d1bdad85..990a54049a7d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -446,6 +446,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-dither",
 	  .data = (void *)MTK_DISP_DITHER },
+	{ .compatible = "mediatek,mt8195-disp-dsc",
+	  .data = (void *)MTK_DISP_DSC },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt2701-dsi",
@@ -562,12 +564,13 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		 */
 		if (comp_type == MTK_DISP_CCORR ||
 		    comp_type == MTK_DISP_COLOR ||
+		    comp_type == MTK_DISP_DSC ||
 		    comp_type == MTK_DISP_GAMMA ||
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
 		    comp_type == MTK_DISP_RDMA ||
-		    comp_type == MTK_DSI ||
-		    comp_type == MTK_DPI) {
+		    comp_type == MTK_DPI ||
+		    comp_type == MTK_DSI) {
 			dev_info(dev, "Adding component match for %pOF\n",
 				 node);
 			drm_of_component_match_add(dev, &match, compare_of,
@@ -662,6 +665,7 @@ static struct platform_driver mtk_drm_platform_driver = {
 static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_ccorr_driver,
 	&mtk_disp_color_driver,
+	&mtk_disp_dsc_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 637f5669e895..8b722330ef7d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -51,6 +51,7 @@ extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
+extern struct platform_driver mtk_disp_dsc_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
