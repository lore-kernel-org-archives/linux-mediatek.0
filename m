Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D739CC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 14:53:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2E9A610CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 14:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2E9A610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPminBXR8nrwyPCzn/eDi73jmsR3wibbX+HaB8dDl0o=; b=Ly2TQtKkif3RmB
	ijr9aut46TF6vtMadg1Cm0UTQp97IlcUouYQeNTFtpPWy7EEcwLXTIncr+K+bEMeqgwHDUofYoIn1
	+cMyYreD64lm1PYHSE0Sko+3DIYu+4HLMPSwzsMJHsfxzoK29v/AlHxx1R9V+VBL0dDJoKSdGD7wR
	uid7mj9cxNtI1YEO6jIvjsiWvieVgEwymFsigMVt767Q/m7ObCAgJxlDIOb9V4oQV1eKEKW3EUzM9
	e84EDu7GC3wDg4paGAoXdrNvjMdFus6ScMa6tuLXyNdWVb0pMBn+pHttsvER3tlRioMM2mxEMsXQn
	T1fuiDwkSU1BOBPbUCZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIuH0-007LEY-JI; Wed, 25 Aug 2021 14:53:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIuCv-007J8J-TA; Wed, 25 Aug 2021 14:48:55 +0000
X-UUID: e4529571061f447390545f1648767e8f-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KxXVZwDhkOYDaQAdToODOzyfoXIvKFo1BNHAaib/U4M=; 
 b=CjOkI3JROaI1MzslYfLg4+teETXtoRfFaBjwSoiPpRAiPXSUSdVJpv+mYMQc8wIOr6cpxkTb0o2Ph0glwdCyGLbPeYjosI7k8VSlThEnj8bBtkDg3x9CDkQq4CJGnyPzbT2x8YqY1LegZsr+BuHLwx+DoG3FeckJBb+/Ag0HAIA=;
X-UUID: e4529571061f447390545f1648767e8f-20210825
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 796560183; Wed, 25 Aug 2021 07:48:39 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 07:48:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 22:48:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 22:48:36 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Frank Wunderlich
 <frank-w@public-files.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 11/14] drm/mediatek: adjust to the alphabetic order for
 mediatek-drm
Date: Wed, 25 Aug 2021 22:48:30 +0800
Message-ID: <20210825144833.7757-12-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_074850_087725_52786C75 
X-CRM114-Status: GOOD (  16.46  )
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
rebase on [1] series
[1] drm/mediatek: Separate aal module
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=516463
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 108 ++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  22 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  80 +++++++--------
 3 files changed, 104 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 0b5ca9025b3a..ef0d2066fae1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -20,36 +20,34 @@
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
 
 #define DISP_REG_DITHER_EN			0x0000
 #define DITHER_EN				BIT(0)
 #define DISP_REG_DITHER_CFG			0x0020
 #define DITHER_RELAY_MODE			BIT(0)
 #define DITHER_ENGINE_EN			BIT(1)
-#define DISP_REG_DITHER_SIZE			0x0030
-
-#define OD_RELAYMODE				BIT(0)
-
-#define UFO_BYPASS				BIT(2)
-
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
@@ -141,65 +139,65 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 	}
 }
 
-static void mtk_dither_set(struct device *dev, unsigned int bpc,
-		    unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
+static void mtk_dither_config(struct device *dev, unsigned int w,
+			      unsigned int h, unsigned int vrefresh,
+			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, cfg,
-			      DISP_DITHERING, cmdq_pkt);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_DITHER_CFG);
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
+			      DITHER_ENGINE_EN, cmdq_pkt);
 }
 
-static void mtk_od_config(struct device *dev, unsigned int w,
-			  unsigned int h, unsigned int vrefresh,
-			  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+static void mtk_dither_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_OD_SIZE);
-	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_REG_OD_CFG);
-	mtk_dither_set(dev, bpc, DISP_REG_OD_CFG, cmdq_pkt);
+	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
 }
 
-static void mtk_od_start(struct device *dev)
+static void mtk_dither_stop(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(1, priv->regs + DISP_REG_OD_EN);
+	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
 }
 
-static void mtk_ufoe_start(struct device *dev)
+static void mtk_dither_set(struct device *dev, unsigned int bpc,
+			   unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, cfg,
+			      DISP_DITHERING, cmdq_pkt);
 }
 
-static void mtk_dither_config(struct device *dev, unsigned int w,
-			      unsigned int h, unsigned int vrefresh,
-			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+static void mtk_od_config(struct device *dev, unsigned int w,
+			  unsigned int h, unsigned int vrefresh,
+			  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
-		      DISP_REG_DITHER_CFG);
-	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
-			      DITHER_ENGINE_EN, cmdq_pkt);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_OD_SIZE);
+	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_REG_OD_CFG);
+	mtk_dither_set(dev, bpc, DISP_REG_OD_CFG, cmdq_pkt);
 }
 
-static void mtk_dither_start(struct device *dev)
+static void mtk_od_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
+	writel(1, priv->regs + DISP_REG_OD_EN);
 }
 
-static void mtk_dither_stop(struct device *dev)
+static void mtk_ufoe_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
+	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
 static const struct mtk_ddp_comp_funcs ddp_aal = {
@@ -296,22 +294,22 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
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
@@ -466,12 +464,12 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
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
index 143ba247c627..22d8f13080f2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -396,52 +396,22 @@ static const struct component_master_ops mtk_drm_ops = {
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
+	{ .compatible = "mediatek,mt8183-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8183-disp-ccorr",
 	  .data = (void *)MTK_DISP_CCORR },
 	{ .compatible = "mediatek,mt2701-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
-	{ .compatible = "mediatek,mt8173-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
-	{ .compatible = "mediatek,mt8183-disp-aal",
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
@@ -450,12 +420,42 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
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
 
@@ -545,8 +545,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
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
