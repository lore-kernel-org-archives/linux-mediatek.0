Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C5FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:24:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43CE864DDA
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43CE864DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jwPjbxXljzt9rFy6Gfq47+wplpxml+0jh7Wm4ArWP9Q=; b=D66lhJawMmIKrQcELfL7mp+jx
	wpLdbRpS8K9OrloeAiWA5gtJZnN3kH44I8AQggrNSgYuT5l/KrK9yeVGcJh1VVWoczFMCpI0VkPPi
	NlLW2UOMnQgE0rNsH1ubLze227n5i39PePc+0NQhFdGbQ0Ao367hi9E86IMPYiSn9on74Xmo3UEdr
	k4UQOAlVuRwRZjcj9cZBwFzqKYcvRpSE7GyMoh/VO0PRemqSKkmoUOaAMtVT78l/4+zE6Qo9yKC3R
	nsBP8+3Qt1T/Mp7CoZMzcnxTHfTDA0T/T0IpMHgU5OVvXuhamAYBwyniabm7nl9F6OujQrqZ25V/s
	SZHT0iXLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l55PF-0000ii-9a; Thu, 28 Jan 2021 11:24:09 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l55Oe-0000UO-0n
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 11:23:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id w14so3798593pfi.2
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 03:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOsNEvP4ihNSxMlpNLLMS1lFGHuB2TSFi1nkUvCjsOs=;
 b=U5TAxR/1nOx4KASSIn/3DLCVr9KmITzotEndsGlh5JWXD8g7cXOsNwZ6R5Q3acM0N9
 SvLbKbXX+JumyId/Bv7podLs7XQm6cyQC8Qgz8YkPxJcbITekBk7vqR/u7EVZba/UwKM
 s40qmVvMX88o9RFPvdWTvR0aQZDudYwGcW5x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOsNEvP4ihNSxMlpNLLMS1lFGHuB2TSFi1nkUvCjsOs=;
 b=oXOGTFhObq5ZkL4JJM0l4Cm6FLSYJC+9+pCD2sMJFuLfw7H1KV8CdpU9P3+52hqyEr
 hxk+1p4YINhS42YkALYCKSYIdlPdIlIn31Ql9AlN1i3QrwsTb6tYWlvzk0dImZ6242Ed
 jc4baVxTsWlKnsO+pKI0c61lQ0s6/iLCO+2I9T14El/cPws1RJajW8mhe1bNFcifcAOO
 1HUGQ2dNvJuycOlPX8hiByHDe9HzVt7qCK+TxMzAZHrSPBxHj+tTLamEhyC3amXmyFw3
 jNu5VHMdJuUzPgAyEf5aPLp9faPS8i1gwJMI7EEuS5uGrGD4Us5/WeY0qLhrj6W/QFQt
 ZuYQ==
X-Gm-Message-State: AOAM531KGMxV/gjGoyXSdUUbvjx6UXe8wvI6M0kmPmkhNPSog3lrXzYM
 UqV1NQVgCTow6G1TTUUHYXpBTw==
X-Google-Smtp-Source: ABdhPJz+wKP5GAICmK1FwS/mjAJ6Y4UeySYFA0fr24oySbettw/RI6nH+NyiN03FM8EwoXaIUOoEdg==
X-Received: by 2002:a62:e515:0:b029:1b9:2dc3:a0da with SMTP id
 n21-20020a62e5150000b02901b92dc3a0damr15251834pff.9.1611833010056; 
 Thu, 28 Jan 2021 03:23:30 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id j198sm3138315pfd.71.2021.01.28.03.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:23:29 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v12 4/8] drm/mediatek: separate gamma module
Date: Thu, 28 Jan 2021 19:23:10 +0800
Message-Id: <20210128112314.1304160-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128112314.1304160-1-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_062332_394886_3E8FA6B4 
X-CRM114-Status: GOOD (  27.13  )
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
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

mt8183 gamma module will different with mt8173
separate gamma for add private data

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  10 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 191 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  71 ++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 6 files changed, 217 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 01d06332f7679..b64674b944860 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 mediatek-drm-y := mtk_disp_color.o \
+		  mtk_disp_gamma.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 9e5537f76b22a..02191010699f8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -27,6 +27,16 @@ void mtk_dpi_stop(struct device *dev);
 void mtk_dsi_ddp_start(struct device *dev);
 void mtk_dsi_ddp_stop(struct device *dev);
 
+int mtk_gamma_clk_enable(struct device *dev);
+void mtk_gamma_clk_disable(struct device *dev);
+void mtk_gamma_config(struct device *dev, unsigned int w,
+                      unsigned int h, unsigned int vrefresh,
+                      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
+void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
+void mtk_gamma_start(struct device *dev);
+void mtk_gamma_stop(struct device *dev);
+
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
 void mtk_ovl_bypass_shadow(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
new file mode 100644
index 0000000000000..6b520807921e3
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -0,0 +1,191 @@
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
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_disp_drv.h"
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+
+#define DISP_GAMMA_EN				0x0000
+#define GAMMA_EN					BIT(0)
+#define DISP_GAMMA_CFG				0x0020
+#define GAMMA_LUT_EN					BIT(1)
+#define GAMMA_DITHERING				BIT(2)
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
+	struct clk *clk;
+	void __iomem *regs;
+	struct cmdq_client_reg cmdq_reg;
+	const struct mtk_disp_gamma_data *data;
+};
+
+int mtk_gamma_clk_enable(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(gamma->clk);
+}
+
+void mtk_gamma_clk_disable(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(gamma->clk);
+}
+
+void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state)
+{
+	unsigned int i, reg;
+	struct drm_color_lut *lut;
+	void __iomem *lut_base;
+	u32 word;
+
+	if (state->gamma_lut) {
+		reg = readl(regs + DISP_GAMMA_CFG);
+		reg = reg | GAMMA_LUT_EN;
+		writel(reg, regs + DISP_GAMMA_CFG);
+		lut_base = regs + DISP_GAMMA_LUT;
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
+void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	mtk_gamma_set_common(gamma->regs, state);
+}
+
+void mtk_gamma_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
+		      DISP_GAMMA_SIZE);
+	mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG,
+			      GAMMA_DITHERING, cmdq_pkt);
+}
+
+void mtk_gamma_start(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	writel(GAMMA_EN, gamma->regs + DISP_GAMMA_EN);
+}
+
+void mtk_gamma_stop(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, gamma->regs + DISP_GAMMA_EN);
+}
+
+static int mtk_disp_gamma_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_gamma_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
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
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get gamma clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap gamma\n");
+		return PTR_ERR(priv->regs);
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
+	priv->data = of_device_get_match_data(dev);
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
index 07804ab16f44d..ac2cb25620357 100644
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
@@ -151,7 +143,6 @@ static void mtk_ddp_clk_disable(struct device *dev)
 	clk_disable_unprepare(priv->clk);
 }
 
-
 void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 			   unsigned int bpc, unsigned int cfg,
 			   unsigned int dither_en, struct cmdq_pkt *cmdq_pkt)
@@ -221,6 +212,13 @@ static void mtk_aal_config(struct device *dev, unsigned int w,
 	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
 }
 
+static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+        mtk_gamma_set_common(priv->regs, state);
+}
+
 static void mtk_aal_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
@@ -335,58 +333,10 @@ static void mtk_dither_stop(struct device *dev)
 	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
 }
 
-static void mtk_gamma_config(struct device *dev, unsigned int w,
-			     unsigned int h, unsigned int vrefresh,
-			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_GAMMA_SIZE);
-	mtk_dither_set(dev, bpc, DISP_GAMMA_CFG, cmdq_pkt);
-}
-
-static void mtk_gamma_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(GAMMA_EN, priv->regs  + DISP_GAMMA_EN);
-}
-
-static void mtk_gamma_stop(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel_relaxed(0x0, priv->regs  + DISP_GAMMA_EN);
-}
-
-static void mtk_gamma_set(struct device *dev,
-			  struct drm_crtc_state *state)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-	unsigned int i, reg;
-	struct drm_color_lut *lut;
-	void __iomem *lut_base;
-	u32 word;
-
-	if (state->gamma_lut) {
-		reg = readl(priv->regs + DISP_GAMMA_CFG);
-		reg = reg | GAMMA_LUT_EN;
-		writel(reg, priv->regs + DISP_GAMMA_CFG);
-		lut_base = priv->regs + DISP_GAMMA_LUT;
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
 	.clk_enable = mtk_ddp_clk_enable,
 	.clk_disable = mtk_ddp_clk_disable,
-	.gamma_set = mtk_gamma_set,
+	.gamma_set = mtk_aal_gamma_set,
 	.config = mtk_aal_config,
 	.start = mtk_aal_start,
 	.stop = mtk_aal_stop,
@@ -427,8 +377,8 @@ static const struct mtk_ddp_comp_funcs ddp_dsi = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
-	.clk_enable = mtk_ddp_clk_enable,
-	.clk_disable = mtk_ddp_clk_disable,
+	.clk_enable = mtk_gamma_clk_enable,
+	.clk_disable = mtk_gamma_clk_disable,
 	.gamma_set = mtk_gamma_set,
 	.config = mtk_gamma_config,
 	.start = mtk_gamma_start,
@@ -644,6 +594,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 
 	if (type == MTK_DISP_BLS ||
 	    type == MTK_DISP_COLOR ||
+	    type == MTK_DISP_GAMMA ||
 	    type == MTK_DPI ||
 	    type == MTK_DSI ||
 	    type == MTK_DISP_OVL ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5d39dd54255d1..279d3e6f11563 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -486,11 +486,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
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
@@ -589,6 +590,7 @@ static struct platform_driver mtk_drm_platform_driver = {
 
 static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_color_driver,
+	&mtk_disp_gamma_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
 	&mtk_dpi_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index e8238fa4aa2ac..0e54e3d51014a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -47,6 +47,7 @@ struct mtk_drm_private {
 };
 
 extern struct platform_driver mtk_disp_color_driver;
+extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
 extern struct platform_driver mtk_dpi_driver;
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
