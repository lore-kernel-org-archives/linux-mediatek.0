Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6FDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:04:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62AD2603E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 16:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62AD2603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eD/gGZ33qgu9VfHdGz4HKDgAiTTcrMNvQarjuKhvXU=; b=q6yGQwh4TpfOel
	O+g5fb1EzBo9YweKvHGFYvZ5lyA25e5aByy5KXnmveThmC30GWzJWKsz5JSvqDLGoUn7lYTpEbzVG
	kmg2lzPblXQjFCy0j0MBCCVRsNqMOKYbS/Om9XC3IRVOvjiR2Kh+gyCfNxyTEQPZ8gIlbZKyJ1Om4
	WdBqruZk9C+scV+06Mngi6eT//zoNLFTyxbNGEvcnZxxSRpTYNjh4GaEuVoGUx/kOY4jBFvAdHCgi
	y6VCGb44iQsdB+HLQnOSyXFelTKe/l9P2KplAqA5y+GFE9676z1yxan2wUik3jR00pShFf1n9R6bP
	ZAMEm5lUprZmHfTOI4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfOvl-002Jm6-6T; Tue, 26 Oct 2021 16:04:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfOrK-002HYH-NL; Tue, 26 Oct 2021 15:59:33 +0000
X-UUID: 6b5dcef83c304d81ab44adc50736695e-20211026
X-UUID: 6b5dcef83c304d81ab44adc50736695e-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2023868746; Tue, 26 Oct 2021 08:59:27 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 08:59:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Oct 2021 23:59:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Oct 2021 23:59:14 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <jason-jh.lin@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 13/16] drm/mediatek: adjust to the alphabetic order for
 mediatek-drm
Date: Tue, 26 Oct 2021 23:59:08 +0800
Message-ID: <20211026155911.17651-14-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_085930_835992_2FD11BE7 
X-CRM114-Status: GOOD (  16.76  )
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
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
rebase on series [1]

[1] drm/mediatek: add support for mediatek SOC MT8192
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 126 ++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  24 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 120 +++++++++----------
 3 files changed, 134 insertions(+), 136 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b46bc0f5d1a5..23c03e550658 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -20,26 +20,30 @@
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
+#define DISP_DITHERING				BIT(2)
 #define DISP_REG_DITHER_SIZE			0x0030
+#define DISP_REG_DITHER_5			0x0114
+#define DISP_REG_DITHER_7			0x011c
+#define DISP_REG_DITHER_15			0x013c
+#define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
+#define DITHER_ADD_LSHIFT_R(x)			(((x) & 0x7) << 20)
+#define DITHER_NEW_BIT_MODE			BIT(0)
+#define DISP_REG_DITHER_16			0x0140
+#define DITHER_LSB_ERR_SHIFT_B(x)		(((x) & 0x7) << 28)
+#define DITHER_ADD_LSHIFT_B(x)			(((x) & 0x7) << 20)
+#define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
+#define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
 
+#define DISP_REG_OD_EN				0x0000
+#define DISP_REG_OD_CFG				0x0020
 #define OD_RELAYMODE				BIT(0)
-
-#define UFO_BYPASS				BIT(2)
+#define DISP_REG_OD_SIZE			0x0030
 
 #define DISP_REG_POSTMASK_EN			0x0000
 #define POSTMASK_EN				BIT(0)
@@ -47,14 +51,8 @@
 #define POSTMASK_RELAY_MODE			BIT(0)
 #define DISP_REG_POSTMASK_SIZE			0x0030
 
-#define DISP_DITHERING				BIT(2)
-#define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
-#define DITHER_ADD_LSHIFT_R(x)			(((x) & 0x7) << 20)
-#define DITHER_NEW_BIT_MODE			BIT(0)
-#define DITHER_LSB_ERR_SHIFT_B(x)		(((x) & 0x7) << 28)
-#define DITHER_ADD_LSHIFT_B(x)			(((x) & 0x7) << 20)
-#define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
-#define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
+#define DISP_REG_UFO_START			0x0000
+#define UFO_BYPASS				BIT(2)
 
 struct mtk_ddp_comp_dev {
 	struct clk *clk;
@@ -147,8 +145,35 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 	}
 }
 
+static void mtk_dither_config(struct device *dev, unsigned int w,
+			      unsigned int h, unsigned int vrefresh,
+			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_DITHER_CFG);
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
+			      DITHER_ENGINE_EN, cmdq_pkt);
+}
+
+static void mtk_dither_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
+}
+
+static void mtk_dither_stop(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
+}
+
 static void mtk_dither_set(struct device *dev, unsigned int bpc,
-		    unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
+			   unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
@@ -174,13 +199,6 @@ static void mtk_od_start(struct device *dev)
 	writel(1, priv->regs + DISP_REG_OD_EN);
 }
 
-static void mtk_ufoe_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
-}
-
 static void mtk_postmask_config(struct device *dev, unsigned int w,
 			unsigned int h, unsigned int vrefresh,
 			unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -207,31 +225,11 @@ static void mtk_postmask_stop(struct device *dev)
 	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
 }
 
-static void mtk_dither_config(struct device *dev, unsigned int w,
-			      unsigned int h, unsigned int vrefresh,
-			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
-		      DISP_REG_DITHER_CFG);
-	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
-			      DITHER_ENGINE_EN, cmdq_pkt);
-}
-
-static void mtk_dither_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
-}
-
-static void mtk_dither_stop(struct device *dev)
+static void mtk_ufoe_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
+	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
 static const struct mtk_ddp_comp_funcs ddp_aal = {
@@ -336,23 +334,23 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 };
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
-	[MTK_DISP_OVL] = "ovl",
-	[MTK_DISP_OVL_2L] = "ovl-2l",
-	[MTK_DISP_RDMA] = "rdma",
-	[MTK_DISP_WDMA] = "wdma",
-	[MTK_DISP_COLOR] = "color",
-	[MTK_DISP_CCORR] = "ccorr",
 	[MTK_DISP_AAL] = "aal",
-	[MTK_DISP_GAMMA] = "gamma",
+	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_CCORR] = "ccorr",
+	[MTK_DISP_COLOR] = "color",
 	[MTK_DISP_DITHER] = "dither",
-	[MTK_DISP_UFOE] = "ufoe",
-	[MTK_DSI] = "dsi",
-	[MTK_DPI] = "dpi",
-	[MTK_DISP_PWM] = "pwm",
+	[MTK_DISP_GAMMA] = "gamma",
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
-	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_OVL] = "ovl",
+	[MTK_DISP_OVL_2L] = "ovl-2l",
 	[MTK_DISP_POSTMASK] = "postmask",
+	[MTK_DISP_PWM] = "pwm",
+	[MTK_DISP_RDMA] = "rdma",
+	[MTK_DISP_UFOE] = "ufoe",
+	[MTK_DISP_WDMA] = "wdma",
+	[MTK_DPI] = "dpi",
+	[MTK_DSI] = "dsi",
 };
 
 struct mtk_ddp_comp_match {
@@ -510,12 +508,12 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
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
index cd1dec6b4cdf..4c6a98662305 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -18,23 +18,23 @@ struct mtk_plane_state;
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
-	MTK_DISP_POSTMASK,
-	MTK_DISP_PWM,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
-	MTK_DISP_BLS,
+	MTK_DISP_OVL,
+	MTK_DISP_OVL_2L,
+	MTK_DISP_POSTMASK,
+	MTK_DISP_PWM,
+	MTK_DISP_RDMA,
+	MTK_DISP_UFOE,
+	MTK_DISP_WDMA,
+	MTK_DPI,
+	MTK_DSI,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index fa86485b4b9a..56ff8c57ef8f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -423,32 +423,14 @@ static const struct component_master_ops mtk_drm_ops = {
 };
 
 static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
-	{ .compatible = "mediatek,mt2701-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8167-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8173-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8183-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
-	  .data = (void *)MTK_DISP_OVL_2L },
-	{ .compatible = "mediatek,mt8192-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
-	  .data = (void *)MTK_DISP_OVL_2L },
-	{ .compatible = "mediatek,mt2701-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8167-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8173-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8183-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8192-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8173-disp-wdma",
-	  .data = (void *)MTK_DISP_WDMA },
+	{ .compatible = "mediatek,mt8167-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8173-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8183-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8192-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8167-disp-ccorr",
 	  .data = (void *)MTK_DISP_CCORR },
 	{ .compatible = "mediatek,mt8183-disp-ccorr",
@@ -461,40 +443,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
-	{ .compatible = "mediatek,mt8167-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
-	{ .compatible = "mediatek,mt8173-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
-	{ .compatible = "mediatek,mt8183-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
-	{ .compatible = "mediatek,mt8192-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8167-disp-dither",
+	  .data = (void *)MTK_DISP_DITHER },
+	{ .compatible = "mediatek,mt8183-disp-dither",
+	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8167-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
-	{ .compatible = "mediatek,mt8167-disp-dither",
-	  .data = (void *)MTK_DISP_DITHER },
-	{ .compatible = "mediatek,mt8183-disp-dither",
-	  .data = (void *)MTK_DISP_DITHER },
-	{ .compatible = "mediatek,mt8173-disp-ufoe",
-	  .data = (void *)MTK_DISP_UFOE },
-	{ .compatible = "mediatek,mt2701-dsi",
-	  .data = (void *)MTK_DSI },
-	{ .compatible = "mediatek,mt8167-dsi",
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
@@ -507,16 +465,58 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8173-disp-od",
+	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt2701-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8167-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8173-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8183-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8192-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
+	  .data = (void *)MTK_DISP_OVL_2L },
+	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
+	  .data = (void *)MTK_DISP_OVL_2L },
+	{ .compatible = "mediatek,mt8192-disp-postmask",
+	  .data = (void *)MTK_DISP_POSTMASK },
 	{ .compatible = "mediatek,mt2701-disp-pwm",
 	  .data = (void *)MTK_DISP_BLS },
 	{ .compatible = "mediatek,mt8167-disp-pwm",
 	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-pwm",
 	  .data = (void *)MTK_DISP_PWM },
-	{ .compatible = "mediatek,mt8173-disp-od",
-	  .data = (void *)MTK_DISP_OD },
-	{ .compatible = "mediatek,mt8192-disp-postmask",
-	  .data = (void *)MTK_DISP_POSTMASK },
+	{ .compatible = "mediatek,mt2701-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8167-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8173-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8183-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8192-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8173-disp-ufoe",
+	  .data = (void *)MTK_DISP_UFOE },
+	{ .compatible = "mediatek,mt8173-disp-wdma",
+	  .data = (void *)MTK_DISP_WDMA },
+	{ .compatible = "mediatek,mt2701-dpi",
+	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8167-dsi",
+	  .data = (void *)MTK_DSI },
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
 
@@ -610,8 +610,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
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
