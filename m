Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2E4C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:39:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1327B6120B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1327B6120B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IAMWUjueGa9f4py9924oA39paa8GKe9Y4sJ0fzMhjC4=; b=HJ+mNtXor+o7c0d+k1Y+Zm2jm
	uwEOsSiTi+AuhA/T49A64HyE6ngApcoBcbJmlhZGyDCwjvRGQF7K6HQTuV0qgylJYI/IOHKXFMQHs
	SvQAKv9jTLaUxygWKT5J8rXUPfYBbhzPINEaSguhbsIFk9S59J/Oj41VD31K7S+o+7/WPcXG2l4RG
	g6BZxqu1LkzUm+FqYglXDkjSpqa/NTtsK6R+txVCpfE5zOwfUSW4OWC8KxtIZSdS1fQ/Ss20xbH25
	oWtrLJWFqbJI23AEkNmFq070hO3bfmQ3SliuqIS0u2DDotiAw7NOew+PNgxTzC/IU0brA+aWnC86n
	5WZzjrlxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqDh-005phi-Th; Mon, 12 Apr 2021 06:38:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqDR-005pe4-R3; Mon, 12 Apr 2021 06:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=uizXh7rUGsIE23HFB8z9bsUO1S+dvH6qHX9bgIYHYXQ=; b=JxwDIoh+Nl/xQvrnXjLFgyto27
 5VjTYjRbIhw6k+CqVqErUkNxxZIiivlNqXtowBMliQoHbIfKcWIafU2tT4ES+EiWhM1NQXDgAserC
 J3F74rPdGrSr1+lMA/UiqKS9hmk1bJ0Jzepfblb7CYm6YVuvyig9J2O5udmHU9FAnuqiy+u0TrTcf
 1jCaVXKoLhIQ1W1G9kLWcxRXVEjXvDIzBFyrnFD68WFSDq3ia/1WlFElW6tP5gxNKtztUoJUtBoe/
 6FPtwtUS69QpbxSfINVVu6x/xNwhS7Gpfv2mfSoRSLmhbsL67iYtdzUVsOyampwiPEivV32O/SjJP
 CnFCeWpg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqDN-005uDt-2S; Mon, 12 Apr 2021 06:38:31 +0000
X-UUID: 186b0a0d3299479cac14825bebd7ed64-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uizXh7rUGsIE23HFB8z9bsUO1S+dvH6qHX9bgIYHYXQ=; 
 b=dF5tuAmbbfgHwLOvErrpgSqexx6s3e+CxxuOnPPz0vxuJyjz7hxXvZ+fVO5GVSb4bNT7BHYLDXyWTBs43MFELF6nvtVxNjNHh7JTzev6KVFq6QqtCu5tc1Lw0MpAUV7G6glI4zqwavuN3IuZfqC46Hmi/iA2aC1H2gPzm3S+58w=;
X-UUID: 186b0a0d3299479cac14825bebd7ed64-20210411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 45743899; Sun, 11 Apr 2021 23:38:28 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 23:36:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 14:35:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 14:35:50 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>
Subject: [PATCH v1, 1/3] drm/mediatek: Separate aal module
Date: Mon, 12 Apr 2021 14:35:45 +0800
Message-ID: <1618209347-10816-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618209347-10816-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618209347-10816-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F9D7266F07F7DD65855CD78CF7E816ED2615DDC88F30CFDEFB81F059CE2ACF452000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_233829_161868_1655444A 
X-CRM114-Status: GOOD (  25.20  )
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

mt8183 aal has no gamma function

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c     | 167 ++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   9 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  39 +------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 6 files changed, 187 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index dc54a7a..29098d7 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-mediatek-drm-y := mtk_disp_ccorr.o \
+mediatek-drm-y := mtk_disp_aal.o \
+		  mtk_disp_ccorr.o \
 		  mtk_disp_color.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_ovl.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
new file mode 100644
index 0000000..64b4528
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
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
+#define DISP_AAL_EN				0x0000
+#define AAL_EN						BIT(0)
+#define DISP_AAL_SIZE				0x0030
+
+
+struct mtk_disp_aal_data {
+	bool has_gamma;
+};
+
+/**
+ * struct mtk_disp_aal - DISP_AAL driver structure
+ * @ddp_comp - structure containing type enum and hardware resources
+ * @crtc - associated crtc to report irq events to
+ */
+struct mtk_disp_aal {
+	struct clk *clk;
+	void __iomem *regs;
+	struct cmdq_client_reg cmdq_reg;
+	const struct mtk_disp_aal_data *data;
+};
+
+int mtk_aal_clk_enable(struct device *dev)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(aal->clk);
+}
+
+void mtk_aal_clk_disable(struct device *dev)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(aal->clk);
+}
+
+void mtk_aal_config(struct device *dev, unsigned int w,
+			   unsigned int h, unsigned int vrefresh,
+			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_SIZE);
+}
+
+void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	if (aal->data && aal->data->has_gamma)
+		mtk_gamma_set_common(aal->regs, state);
+}
+
+void mtk_aal_start(struct device *dev)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	writel(AAL_EN, aal->regs + DISP_AAL_EN);
+}
+
+void mtk_aal_stop(struct device *dev)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, aal->regs + DISP_AAL_EN);
+}
+
+static int mtk_disp_aal_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_aal_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+}
+
+static const struct component_ops mtk_disp_aal_component_ops = {
+	.bind	= mtk_disp_aal_bind,
+	.unbind = mtk_disp_aal_unbind,
+};
+
+static int mtk_disp_aal_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_aal *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get aal clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap aal\n");
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
+	ret = component_add(dev, &mtk_disp_aal_component_ops);
+	if (ret)
+		dev_err(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static int mtk_disp_aal_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_aal_component_ops);
+
+	return 0;
+}
+
+static const struct mtk_disp_aal_data mt8173_aal_driver_data = {
+	.has_gamma = true,
+};
+
+static const struct of_device_id mtk_disp_aal_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8173-disp-aal",
+	  .data = &mt8173_aal_driver_data},
+	{ .compatible = "mediatek,mt8183-disp-aal"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_aal_driver_dt_match);
+
+struct platform_driver mtk_disp_aal_driver = {
+	.probe		= mtk_disp_aal_probe,
+	.remove		= mtk_disp_aal_remove,
+	.driver		= {
+		.name	= "mediatek-disp-aal",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_aal_driver_dt_match,
+	},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index cafd9df..86c3068 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -9,6 +9,15 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include "mtk_drm_plane.h"
 
+int mtk_aal_clk_enable(struct device *dev);
+void mtk_aal_clk_disable(struct device *dev);
+void mtk_aal_config(struct device *dev, unsigned int w,
+		    unsigned int h, unsigned int vrefresh,
+		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state);
+void mtk_aal_start(struct device *dev);
+void mtk_aal_stop(struct device *dev);
+
 void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state);
 int mtk_ccorr_clk_enable(struct device *dev);
 void mtk_ccorr_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 75bc00e..f367142 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -32,9 +32,6 @@
 
 #define DISP_REG_UFO_START			0x0000
 
-#define DISP_AAL_EN				0x0000
-#define DISP_AAL_SIZE				0x0030
-
 #define DISP_DITHER_EN				0x0000
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
@@ -48,8 +45,6 @@
 
 #define UFO_BYPASS				BIT(2)
 
-#define AAL_EN					BIT(0)
-
 #define DISP_DITHERING				BIT(2)
 #define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
 #define DITHER_OVFLW_BIT_R(x)			(((x) & 0x7) << 24)
@@ -190,36 +185,6 @@ static void mtk_ufoe_start(struct device *dev)
 	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
-static void mtk_aal_config(struct device *dev, unsigned int w,
-			   unsigned int h, unsigned int vrefresh,
-			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
-}
-
-static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_gamma_set_common(priv->regs, state);
-}
-
-static void mtk_aal_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(AAL_EN, priv->regs + DISP_AAL_EN);
-}
-
-static void mtk_aal_stop(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel_relaxed(0x0, priv->regs + DISP_AAL_EN);
-}
-
 static void mtk_dither_config(struct device *dev, unsigned int w,
 			      unsigned int h, unsigned int vrefresh,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -247,8 +212,8 @@ static void mtk_dither_stop(struct device *dev)
 }
 
 static const struct mtk_ddp_comp_funcs ddp_aal = {
-	.clk_enable = mtk_ddp_clk_enable,
-	.clk_disable = mtk_ddp_clk_disable,
+	.clk_enable = mtk_aal_clk_enable,
+	.clk_disable = mtk_aal_clk_disable,
 	.gamma_set = mtk_aal_gamma_set,
 	.config = mtk_aal_config,
 	.start = mtk_aal_start,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b013d56..ae8b69d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -420,6 +420,8 @@ static void mtk_drm_unbind(struct device *dev)
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-aal",
 	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8183-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
@@ -531,11 +533,12 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		private->comp_node[comp_id] = of_node_get(node);
 
 		/*
-		 * Currently only the CCORR, COLOR, GAMMA, OVL, RDMA, DSI, and DPI
+		 * Currently only the AAL, CCORR, COLOR, GAMMA, OVL, RDMA, DSI, and DPI
 		 * blocks have separate component platform drivers and initialize their own
 		 * DDP component structure. The others are initialized here.
 		 */
-		if (comp_type == MTK_DISP_CCORR ||
+		if (comp_type == MTK_DISP_AAL ||
+		    comp_type == MTK_DISP_CCORR ||
 		    comp_type == MTK_DISP_COLOR ||
 		    comp_type == MTK_DISP_GAMMA ||
 		    comp_type == MTK_DISP_OVL ||
@@ -635,6 +638,7 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
 };
 
 static struct platform_driver * const mtk_drm_drivers[] = {
+	&mtk_disp_aal_driver,
 	&mtk_disp_ccorr_driver,
 	&mtk_disp_color_driver,
 	&mtk_disp_gamma_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 637f566..3e7d1e6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -46,6 +46,7 @@ struct mtk_drm_private {
 	struct drm_atomic_state *suspend_state;
 };
 
+extern struct platform_driver mtk_disp_aal_driver;
 extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
