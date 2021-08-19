Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEF8C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 02:33:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B36610FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 02:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9B36610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1G8gZvyWhydXIgJdw5C30V73zWOArO6yA8E7P/BASL4=; b=QYRCql3pFPScHC
	tVBOJ59ADfGG6CNGlzRruihJMPc97JTDywhruPrKhFImLme4EDajFlwUObEKf/dAWF3iNUJxUDdT4
	cHDhdsIScCJTbrvz3nHgdacdxyRMcG2TDe809aW6nF73idHlI/Z8RG077uvknSwwsvn4+Qba6i7XK
	/XGu/lzJwjjPvpqjX+KfYi3XDy9uWOYJPeLfJ4tULcA/IHed1GkbpmoHZnHUA51NOn7qTvCPjawBV
	OPNrfIlkYLJL48OovSOGDnAMww2Dpg7eXfU69FYnt2Bl9iTUUkWkovAu8JhTdkdvmR/oVs844eviX
	hKLK8TVGI2EcL8onKMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGXsA-0074EP-7O; Thu, 19 Aug 2021 02:33:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGXiz-006zri-9O; Thu, 19 Aug 2021 02:24:12 +0000
X-UUID: 66388732c3dc4038b06574ac7aa2c491-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bmI8e+2B5IYReFJrKYDgtdskHTgGDuAlTIFP/B7FmPA=; 
 b=d3wc2KRwTQgiL4/7c6grohXatWxuC+SEIth+ZQWeca/8XevGDCcjHdP4cXjmPlM273CUliqGiP+Sk+n9MV9ZNMlmclfOfDGlIIn/NF6IKLKCWv9vn19F72vxFLe7nn76815IMzh12A8N53d10vkUzYprMpSOJ8UhCkj3HwYlCzM=;
X-UUID: 66388732c3dc4038b06574ac7aa2c491-20210818
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 915833171; Wed, 18 Aug 2021 19:23:50 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 19:23:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 10:23:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 10:23:46 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 <fshao@chromium.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>,
 <hsinyi@chromium.org>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 10/13] drm/mediatek: adjust to the alphabetic order for
 mediatek-drm
Date: Thu, 19 Aug 2021 10:23:24 +0800
Message-ID: <20210819022327.13040-11-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_192409_401525_8DB9F285 
X-CRM114-Status: GOOD (  16.89  )
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

Adjust to the alphabetic order for the define, function, struct
and array in mediatek-drm driver

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 133 ++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  22 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  76 +++++------
 3 files changed, 115 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 93beb980414f..28bc42fd0b8a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -20,17 +20,9 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_crtc.h"
 
-#define DISP_REG_OD_EN				0x0000
-#define DISP_REG_OD_CFG				0x0020
-#define DISP_REG_OD_SIZE			0x0030
-#define DISP_REG_DITHER_5			0x0114
-#define DISP_REG_DITHER_7			0x011c
-#define DISP_REG_DITHER_15			0x013c
-#define DISP_REG_DITHER_16			0x0140
-
-#define DISP_REG_UFO_START			0x0000
 
 #define DISP_REG_AAL_EN				0x0000
+#define AAL_EN					BIT(0)
 #define DISP_REG_AAL_SIZE			0x0030
 
 #define DISP_REG_DITHER_EN			0x0000
@@ -38,23 +30,29 @@
 #define DISP_REG_DITHER_CFG			0x0020
 #define DITHER_RELAY_MODE			BIT(0)
 #define DITHER_ENGINE_EN			BIT(1)
-#define DISP_REG_DITHER_SIZE			0x0030
-
-#define OD_RELAYMODE				BIT(0)
-
-#define UFO_BYPASS				BIT(2)
-
-#define AAL_EN					BIT(0)
 
 #define DISP_DITHERING				BIT(2)
+#define DISP_REG_DITHER_SIZE			0x0030
+#define DISP_REG_DITHER_5			0x0114
+#define DISP_REG_DITHER_7			0x011c
+#define DISP_REG_DITHER_15			0x013c
 #define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
 #define DITHER_ADD_LSHIFT_R(x)			(((x) & 0x7) << 20)
 #define DITHER_NEW_BIT_MODE			BIT(0)
+#define DISP_REG_DITHER_16			0x0140
 #define DITHER_LSB_ERR_SHIFT_B(x)		(((x) & 0x7) << 28)
 #define DITHER_ADD_LSHIFT_B(x)			(((x) & 0x7) << 20)
 #define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
 #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
 
+#define DISP_REG_OD_EN				0x0000
+#define DISP_REG_OD_CFG				0x0020
+#define OD_RELAYMODE				BIT(0)
+#define DISP_REG_OD_SIZE			0x0030
+
+#define DISP_REG_UFO_START			0x0000
+#define UFO_BYPASS				BIT(2)
+
 struct mtk_ddp_comp_dev {
 	struct clk *clk;
 	void __iomem *regs;
@@ -106,20 +104,6 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 #endif
 }
 
-static int mtk_ddp_clk_enable(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	return clk_prepare_enable(priv->clk);
-}
-
-static void mtk_ddp_clk_disable(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	clk_disable_unprepare(priv->clk);
-}
-
 void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 			   unsigned int bpc, unsigned int cfg,
 			   unsigned int dither_en, struct cmdq_pkt *cmdq_pkt)
@@ -146,38 +130,19 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 	}
 }
 
-static void mtk_dither_set(struct device *dev, unsigned int bpc,
-		    unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, cfg,
-			      DISP_DITHERING, cmdq_pkt);
-}
-
-static void mtk_od_config(struct device *dev, unsigned int w,
-			  unsigned int h, unsigned int vrefresh,
-			  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_OD_SIZE);
-	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_REG_OD_CFG);
-	mtk_dither_set(dev, bpc, DISP_REG_OD_CFG, cmdq_pkt);
-}
 
-static void mtk_od_start(struct device *dev)
+static int mtk_ddp_clk_enable(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(1, priv->regs + DISP_REG_OD_EN);
+	return clk_prepare_enable(priv->clk);
 }
 
-static void mtk_ufoe_start(struct device *dev)
+static void mtk_ddp_clk_disable(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
+	clk_disable_unprepare(priv->clk);
 }
 
 static void mtk_aal_config(struct device *dev, unsigned int w,
@@ -237,6 +202,40 @@ static void mtk_dither_stop(struct device *dev)
 	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
 }
 
+static void mtk_dither_set(struct device *dev, unsigned int bpc,
+			   unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, cfg,
+			      DISP_DITHERING, cmdq_pkt);
+}
+
+static void mtk_od_config(struct device *dev, unsigned int w,
+			  unsigned int h, unsigned int vrefresh,
+			  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_OD_SIZE);
+	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_REG_OD_CFG);
+	mtk_dither_set(dev, bpc, DISP_REG_OD_CFG, cmdq_pkt);
+}
+
+static void mtk_od_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(1, priv->regs + DISP_REG_OD_EN);
+}
+
+static void mtk_ufoe_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
+}
+
 static const struct mtk_ddp_comp_funcs ddp_aal = {
 	.clk_enable = mtk_ddp_clk_enable,
 	.clk_disable = mtk_ddp_clk_disable,
@@ -331,22 +330,22 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 };
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
+	[MTK_DISP_AAL] = "aal",
+	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_CCORR] = "ccorr",
+	[MTK_DISP_COLOR] = "color",
+	[MTK_DISP_DITHER] = "dither",
+	[MTK_DISP_GAMMA] = "gamma",
+	[MTK_DISP_MUTEX] = "mutex",
+	[MTK_DISP_OD] = "od",
 	[MTK_DISP_OVL] = "ovl",
 	[MTK_DISP_OVL_2L] = "ovl-2l",
+	[MTK_DISP_PWM] = "pwm",
 	[MTK_DISP_RDMA] = "rdma",
-	[MTK_DISP_WDMA] = "wdma",
-	[MTK_DISP_COLOR] = "color",
-	[MTK_DISP_CCORR] = "ccorr",
-	[MTK_DISP_AAL] = "aal",
-	[MTK_DISP_GAMMA] = "gamma",
-	[MTK_DISP_DITHER] = "dither",
 	[MTK_DISP_UFOE] = "ufoe",
-	[MTK_DSI] = "dsi",
+	[MTK_DISP_WDMA] = "wdma",
 	[MTK_DPI] = "dpi",
-	[MTK_DISP_PWM] = "pwm",
-	[MTK_DISP_MUTEX] = "mutex",
-	[MTK_DISP_OD] = "od",
-	[MTK_DISP_BLS] = "bls",
+	[MTK_DSI] = "dsi",
 };
 
 struct mtk_ddp_comp_match {
@@ -500,12 +499,12 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_CCORR ||
 	    type == MTK_DISP_COLOR ||
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
index bb914d976cf5..d317b944df66 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -18,22 +18,22 @@ struct mtk_plane_state;
 struct drm_crtc_state;
 
 enum mtk_ddp_comp_type {
-	MTK_DISP_OVL,
-	MTK_DISP_OVL_2L,
-	MTK_DISP_RDMA,
-	MTK_DISP_WDMA,
-	MTK_DISP_COLOR,
+	MTK_DISP_AAL,
+	MTK_DISP_BLS,
 	MTK_DISP_CCORR,
+	MTK_DISP_COLOR,
 	MTK_DISP_DITHER,
-	MTK_DISP_AAL,
 	MTK_DISP_GAMMA,
-	MTK_DISP_UFOE,
-	MTK_DSI,
-	MTK_DPI,
-	MTK_DISP_PWM,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
-	MTK_DISP_BLS,
+	MTK_DISP_OVL,
+	MTK_DISP_OVL_2L,
+	MTK_DISP_PWM,
+	MTK_DISP_RDMA,
+	MTK_DISP_UFOE,
+	MTK_DISP_WDMA,
+	MTK_DPI,
+	MTK_DSI,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b46bdb8985da..a95dc1006b82 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -396,50 +396,20 @@ static const struct component_master_ops mtk_drm_ops = {
 };
 
 static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
-	{ .compatible = "mediatek,mt2701-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8173-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8183-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
-	  .data = (void *)MTK_DISP_OVL_2L },
-	{ .compatible = "mediatek,mt2701-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8173-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8183-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8173-disp-wdma",
-	  .data = (void *)MTK_DISP_WDMA },
+	{ .compatible = "mediatek,mt8173-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8183-disp-ccorr",
 	  .data = (void *)MTK_DISP_CCORR },
 	{ .compatible = "mediatek,mt2701-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
-	{ .compatible = "mediatek,mt8173-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8183-disp-dither",
+	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
-	{ .compatible = "mediatek,mt8183-disp-dither",
-	  .data = (void *)MTK_DISP_DITHER },
-	{ .compatible = "mediatek,mt8173-disp-ufoe",
-	  .data = (void *)MTK_DISP_UFOE },
-	{ .compatible = "mediatek,mt2701-dsi",
-	  .data = (void *)MTK_DSI },
-	{ .compatible = "mediatek,mt8173-dsi",
-	  .data = (void *)MTK_DSI },
-	{ .compatible = "mediatek,mt8183-dsi",
-	  .data = (void *)MTK_DSI },
-	{ .compatible = "mediatek,mt2701-dpi",
-	  .data = (void *)MTK_DPI },
-	{ .compatible = "mediatek,mt8173-dpi",
-	  .data = (void *)MTK_DPI },
-	{ .compatible = "mediatek,mt8183-dpi",
-	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2712-disp-mutex",
@@ -448,12 +418,42 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8183-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8173-disp-od",
+	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt2701-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8173-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8183-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
+	  .data = (void *)MTK_DISP_OVL_2L },
 	{ .compatible = "mediatek,mt2701-disp-pwm",
 	  .data = (void *)MTK_DISP_BLS },
 	{ .compatible = "mediatek,mt8173-disp-pwm",
 	  .data = (void *)MTK_DISP_PWM },
-	{ .compatible = "mediatek,mt8173-disp-od",
-	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt2701-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8173-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8183-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8173-disp-ufoe",
+	  .data = (void *)MTK_DISP_UFOE },
+	{ .compatible = "mediatek,mt8173-disp-wdma",
+	  .data = (void *)MTK_DISP_WDMA },
+	{ .compatible = "mediatek,mt2701-dpi",
+	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8173-dpi",
+	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8183-dpi",
+	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt2701-dsi",
+	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8173-dsi",
+	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8183-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
@@ -542,8 +542,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
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
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
