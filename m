Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4A7C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 16:32:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D582023D57
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 16:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D582023D57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUZ0wkVDRwd6BHbsxGcbVnAsmAbFOqQf3b/Ai06E+hE=; b=yVzZyY+hTOgPCKY/EQ2pu2qIj2
	ZRPpMUzt1FSuCANli+DvX47M76Gizvxc1GZ9Z71mmUizWJelbqNvlrboqNAD+r43eEqXYXSIO8vXG
	QOXamzeHgOfoPkZ58tQyeQRUMhW8/Qhf3mfmzEpi+G9OlQIfg/dvv4nZlJdq7OXcQyFn6ZNwCchYm
	ZTa2jHW5l5JuZt6wM9PrHaGZtxiUbDbyOGJmPZnKiNYJB66xiKwUReuuAr/RnbHlln95f6bibUnSn
	czYIR9XFUh/Dq4+jqJ0xPEn4LCUOC8euTNeFtO87vORugj3RwBuH34ae58moZy11/H5hF/IBaV15I
	el65pEVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knOrm-0001gV-99; Thu, 10 Dec 2020 16:32:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knOri-0001P4-Nc
 for linux-mediatek@merlin.infradead.org; Thu, 10 Dec 2020 16:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kTHeoGB9s2ad4tX3BSdxH2Fvq/asDusUp4nyRYlYQmM=; b=S849lrr/TFRwltFd0Iw5M4OaP0
 WIgp6PAFqqZlVGXMQtYg1SswCOb+6peV3hTBflnF6W6WCmik672V0PP5C5dHEdUFgOK8lEJNL8eSq
 VQOVEJ4VOZHyqi8HYBPyVR9VK5cHgUKgyNwr2/+u4aWF1APLsmIZNSZ5qb4yLwp/HwHngX4bGuH5d
 xrFcCULJ20Khmi7zmSki4Mh2X6f/iJBBO3rCOc67wODZnTzOdFzqTrEnY6/Tk4Qhi7UR4aF7VnTsx
 +lVN2CaKSPxlSIn/CNQdA2uZMYJdBnWF4LKEGjh73m020h3GqL3Bv1MfOwXmrxpBVgLuZcNkf8AS7
 +fjGRy1w==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knOgx-00038Y-9Y
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 16:21:23 +0000
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 08/12] drm/mediatek: Move cmdq_reg info from struct
 mtk_ddp_comp to sub driver private data
Date: Fri, 11 Dec 2020 00:10:46 +0800
Message-Id: <20201210161050.8460-9-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210161050.8460-1-chunkuang.hu@kernel.org>
References: <20201210161050.8460-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_162120_031920_D1021FBE 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

Some ddp component exist in both display path and other path, so data
belonged to sub driver should be moved into sub driver private data so it
could be used for multiple path. cmdq_reg info is one of sub driver data,
so move it.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c   | 10 ++-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 34 ++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 30 +++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 67 +++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  7 +--
 5 files changed, 84 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 93863dbfb761..929379c9c233 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -40,6 +40,7 @@ struct mtk_disp_color {
 	struct drm_crtc				*crtc;
 	struct clk				*clk;
 	void __iomem				*regs;
+	struct cmdq_client_reg			cmdq_reg;
 	const struct mtk_disp_color_data	*data;
 };
 
@@ -68,8 +69,8 @@ static void mtk_color_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_disp_color *color = comp_to_color(comp);
 
-	mtk_ddp_write(cmdq_pkt, w, comp, color->regs, DISP_COLOR_WIDTH(color));
-	mtk_ddp_write(cmdq_pkt, h, comp, color->regs, DISP_COLOR_HEIGHT(color));
+	mtk_ddp_write(cmdq_pkt, w, &color->cmdq_reg, color->regs, DISP_COLOR_WIDTH(color));
+	mtk_ddp_write(cmdq_pkt, h, &color->cmdq_reg, color->regs, DISP_COLOR_HEIGHT(color));
 }
 
 static void mtk_color_start(struct mtk_ddp_comp *comp)
@@ -143,6 +144,11 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to ioremap color\n");
 		return PTR_ERR(priv->regs);
 	}
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
 
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_COLOR);
 	if (comp_id < 0) {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 90a78db0e96b..0e59b360104a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -74,6 +74,7 @@ struct mtk_disp_ovl {
 	struct drm_crtc			*crtc;
 	struct clk			*clk;
 	void __iomem			*regs;
+	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_ovl_data	*data;
 };
 
@@ -151,12 +152,12 @@ static void mtk_ovl_config(struct mtk_ddp_comp *comp, unsigned int w,
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
 
 	if (w != 0 && h != 0)
-		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, comp, ovl->regs,
+		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, &ovl->cmdq_reg, ovl->regs,
 				      DISP_REG_OVL_ROI_SIZE);
-	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, comp, ovl->regs, DISP_REG_OVL_ROI_BGCLR);
+	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_ROI_BGCLR);
 
-	mtk_ddp_write(cmdq_pkt, 0x1, comp, ovl->regs, DISP_REG_OVL_RST);
-	mtk_ddp_write(cmdq_pkt, 0x0, comp, ovl->regs, DISP_REG_OVL_RST);
+	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
+	mtk_ddp_write(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
 }
 
 static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
@@ -208,7 +209,7 @@ static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx,
 	unsigned int gmc_value;
 	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
 
-	mtk_ddp_write(cmdq_pkt, 0x1, comp, ovl->regs,
+	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 	gmc_thrshd_l = GMC_THRESHOLD_LOW >>
 		      (GMC_THRESHOLD_BITS - ovl->data->gmc_bits);
@@ -220,8 +221,8 @@ static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx,
 		gmc_value = gmc_thrshd_l | gmc_thrshd_l << 8 |
 			    gmc_thrshd_h << 16 | gmc_thrshd_h << 24;
 	mtk_ddp_write(cmdq_pkt, gmc_value,
-		      comp, ovl->regs, DISP_REG_OVL_RDMA_GMC(idx));
-	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), comp, ovl->regs,
+		      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RDMA_GMC(idx));
+	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &ovl->cmdq_reg, ovl->regs,
 			   DISP_REG_OVL_SRC_CON, BIT(idx));
 }
 
@@ -230,9 +231,9 @@ static void mtk_ovl_layer_off(struct mtk_ddp_comp *comp, unsigned int idx,
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write_mask(cmdq_pkt, 0, comp, ovl->regs,
+	mtk_ddp_write_mask(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
 			   DISP_REG_OVL_SRC_CON, BIT(idx));
-	mtk_ddp_write(cmdq_pkt, 0, comp, ovl->regs,
+	mtk_ddp_write(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
@@ -304,15 +305,15 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 		addr += pending->pitch - 1;
 	}
 
-	mtk_ddp_write_relaxed(cmdq_pkt, con, comp, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_CON(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, pitch, comp, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, pitch, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_PITCH(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, src_size, comp, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_SRC_SIZE(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, offset, comp, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_OFFSET(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, addr, comp, ovl->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_ADDR(ovl, idx));
 
 	mtk_ovl_layer_on(comp, idx, cmdq_pkt);
@@ -414,6 +415,11 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to ioremap ovl\n");
 		return PTR_ERR(priv->regs);
 	}
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
 
 	priv->data = of_device_get_match_data(dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 1057c7a42ff2..d6d6c76526bb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -65,6 +65,7 @@ struct mtk_disp_rdma {
 	struct drm_crtc			*crtc;
 	struct clk			*clk;
 	void __iomem			*regs;
+	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_rdma_data	*data;
 };
 
@@ -150,9 +151,9 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	unsigned int reg;
 	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
 
-	mtk_ddp_write_mask(cmdq_pkt, width, comp, rdma->regs,
+	mtk_ddp_write_mask(cmdq_pkt, width, &rdma->cmdq_reg, rdma->regs,
 			   DISP_REG_RDMA_SIZE_CON_0, 0xfff);
-	mtk_ddp_write_mask(cmdq_pkt, height, comp, rdma->regs,
+	mtk_ddp_write_mask(cmdq_pkt, height, &rdma->cmdq_reg, rdma->regs,
 			   DISP_REG_RDMA_SIZE_CON_1, 0xfffff);
 
 	/*
@@ -165,7 +166,7 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	reg = RDMA_FIFO_UNDERFLOW_EN |
 	      RDMA_FIFO_PSEUDO_SIZE(RDMA_FIFO_SIZE(rdma)) |
 	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
-	mtk_ddp_write(cmdq_pkt, reg, comp, rdma->regs, DISP_REG_RDMA_FIFO_CON);
+	mtk_ddp_write(cmdq_pkt, reg, &rdma->cmdq_reg, rdma->regs, DISP_REG_RDMA_FIFO_CON);
 }
 
 static unsigned int rdma_fmt_convert(struct mtk_disp_rdma *rdma,
@@ -222,25 +223,27 @@ static void mtk_rdma_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	unsigned int con;
 
 	con = rdma_fmt_convert(rdma, fmt);
-	mtk_ddp_write_relaxed(cmdq_pkt, con, comp, rdma->regs, DISP_RDMA_MEM_CON);
+	mtk_ddp_write_relaxed(cmdq_pkt, con, &rdma->cmdq_reg, rdma->regs, DISP_RDMA_MEM_CON);
 
 	if (fmt == DRM_FORMAT_UYVY || fmt == DRM_FORMAT_YUYV) {
-		mtk_ddp_write_mask(cmdq_pkt, RDMA_MATRIX_ENABLE, comp, rdma->regs,
+		mtk_ddp_write_mask(cmdq_pkt, RDMA_MATRIX_ENABLE, &rdma->cmdq_reg, rdma->regs,
 				   DISP_REG_RDMA_SIZE_CON_0,
 				   RDMA_MATRIX_ENABLE);
 		mtk_ddp_write_mask(cmdq_pkt, RDMA_MATRIX_INT_MTX_BT601_to_RGB,
-				   comp, rdma->regs, DISP_REG_RDMA_SIZE_CON_0,
+				   &rdma->cmdq_reg, rdma->regs, DISP_REG_RDMA_SIZE_CON_0,
 				   RDMA_MATRIX_INT_MTX_SEL);
 	} else {
-		mtk_ddp_write_mask(cmdq_pkt, 0, comp, rdma->regs,
+		mtk_ddp_write_mask(cmdq_pkt, 0, &rdma->cmdq_reg, rdma->regs,
 				   DISP_REG_RDMA_SIZE_CON_0,
 				   RDMA_MATRIX_ENABLE);
 	}
-	mtk_ddp_write_relaxed(cmdq_pkt, addr, comp, rdma->regs, DISP_RDMA_MEM_START_ADDR);
-	mtk_ddp_write_relaxed(cmdq_pkt, pitch, comp, rdma->regs, DISP_RDMA_MEM_SRC_PITCH);
-	mtk_ddp_write(cmdq_pkt, RDMA_MEM_GMC, comp, rdma->regs,
+	mtk_ddp_write_relaxed(cmdq_pkt, addr, &rdma->cmdq_reg, rdma->regs,
+			      DISP_RDMA_MEM_START_ADDR);
+	mtk_ddp_write_relaxed(cmdq_pkt, pitch, &rdma->cmdq_reg, rdma->regs,
+			      DISP_RDMA_MEM_SRC_PITCH);
+	mtk_ddp_write(cmdq_pkt, RDMA_MEM_GMC, &rdma->cmdq_reg, rdma->regs,
 		      DISP_RDMA_MEM_GMC_SETTING_0);
-	mtk_ddp_write_mask(cmdq_pkt, RDMA_MODE_MEMORY, comp, rdma->regs,
+	mtk_ddp_write_mask(cmdq_pkt, RDMA_MODE_MEMORY, &rdma->cmdq_reg, rdma->regs,
 			   DISP_REG_RDMA_GLOBAL_CON, RDMA_MODE_MEMORY);
 
 }
@@ -318,6 +321,11 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to ioremap rdma\n");
 		return PTR_ERR(priv->regs);
 	}
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
 
 	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_RDMA);
 	if (comp_id < 0) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 14371d5863ae..5da57ea6d06e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -88,42 +88,43 @@
 struct mtk_ddp_comp_dev {
 	struct clk *clk;
 	void __iomem *regs;
+	struct cmdq_client_reg cmdq_reg;
 };
 
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-		   struct mtk_ddp_comp *comp, void __iomem *regs,
+		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 		   unsigned int offset)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, comp->cmdq_reg.subsys,
-			       comp->cmdq_reg.offset + offset, value);
+		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
+			       cmdq_reg->offset + offset, value);
 	else
 #endif
 		writel(value, regs + offset);
 }
 
 void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			   struct mtk_ddp_comp *comp, void __iomem *regs,
+			   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			   unsigned int offset)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, comp->cmdq_reg.subsys,
-			       comp->cmdq_reg.offset + offset, value);
+		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
+			       cmdq_reg->offset + offset, value);
 	else
 #endif
 		writel_relaxed(value, regs + offset);
 }
 
 void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			struct mtk_ddp_comp *comp, void __iomem *regs,
+			struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			unsigned int offset, unsigned int mask)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt) {
-		cmdq_pkt_write_mask(cmdq_pkt, comp->cmdq_reg.subsys,
-				    comp->cmdq_reg.offset + offset, value, mask);
+		cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys,
+				    cmdq_reg->offset + offset, value, mask);
 	} else {
 #endif
 		u32 tmp = readl(regs + offset);
@@ -159,20 +160,20 @@ void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 		return;
 
 	if (bpc >= MTK_MIN_BPC) {
-		mtk_ddp_write(cmdq_pkt, 0, comp, priv->regs, DISP_DITHER_5);
-		mtk_ddp_write(cmdq_pkt, 0, comp, priv->regs, DISP_DITHER_7);
+		mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_5);
+		mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_7);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_NEW_BIT_MODE,
-			      comp, priv->regs, DISP_DITHER_15);
+			      &priv->cmdq_reg, priv->regs, DISP_DITHER_15);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
-			      comp, priv->regs, DISP_DITHER_16);
-		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, comp, priv->regs, CFG);
+			      &priv->cmdq_reg, priv->regs, DISP_DITHER_16);
+		mtk_ddp_write(cmdq_pkt, DISP_DITHERING, &priv->cmdq_reg, priv->regs, CFG);
 	}
 }
 
@@ -182,8 +183,8 @@ static void mtk_od_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, priv->regs, DISP_OD_SIZE);
-	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, comp, priv->regs, DISP_OD_CFG);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_OD_SIZE);
+	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_OD_CFG);
 	mtk_dither_set(comp, bpc, DISP_OD_CFG, cmdq_pkt);
 }
 
@@ -207,7 +208,7 @@ static void mtk_aal_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_AAL_SIZE);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_AAL_SIZE);
 }
 
 static void mtk_aal_start(struct mtk_ddp_comp *comp)
@@ -230,8 +231,8 @@ static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_CCORR_SIZE);
-	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, priv->regs, DISP_CCORR_CFG);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_CCORR_SIZE);
+	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &priv->cmdq_reg, priv->regs, DISP_CCORR_CFG);
 }
 
 static void mtk_ccorr_start(struct mtk_ddp_comp *comp)
@@ -289,15 +290,15 @@ static void mtk_ccorr_ctm_set(struct mtk_ddp_comp *comp,
 		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
 
 	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
-		      comp, priv->regs, DISP_CCORR_COEF_0);
+		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_0);
 	mtk_ddp_write(cmdq_pkt, coeffs[2] << 16 | coeffs[3],
-		      comp, priv->regs, DISP_CCORR_COEF_1);
+		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_1);
 	mtk_ddp_write(cmdq_pkt, coeffs[4] << 16 | coeffs[5],
-		      comp, priv->regs, DISP_CCORR_COEF_2);
+		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_2);
 	mtk_ddp_write(cmdq_pkt, coeffs[6] << 16 | coeffs[7],
-		      comp, priv->regs, DISP_CCORR_COEF_3);
+		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_3);
 	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
-		      comp, priv->regs, DISP_CCORR_COEF_4);
+		      &priv->cmdq_reg, priv->regs, DISP_CCORR_COEF_4);
 }
 
 static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
@@ -306,8 +307,8 @@ static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, comp, priv->regs, DISP_DITHER_CFG);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
 }
 
 static void mtk_dither_start(struct mtk_ddp_comp *comp)
@@ -330,7 +331,7 @@ static void mtk_gamma_config(struct mtk_ddp_comp *comp, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, priv->regs, DISP_GAMMA_SIZE);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_GAMMA_SIZE);
 	mtk_dither_set(comp, bpc, DISP_GAMMA_CFG, cmdq_pkt);
 }
 
@@ -586,12 +587,6 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	}
 	comp->dev = &comp_pdev->dev;
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	ret = cmdq_dev_get_client_reg(comp->dev, &comp->cmdq_reg, 0);
-	if (ret)
-		dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
-#endif
-
 	/* Only DMA capable components need the LARB property */
 	if (type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
@@ -617,6 +612,12 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(comp->dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+
 	platform_set_drvdata(comp_pdev, priv);
 
 	return 0;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 621b07ef807e..d73f5cf2181f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -103,7 +103,6 @@ struct mtk_ddp_comp {
 	struct device *larb_dev;
 	enum mtk_ddp_comp_id id;
 	const struct mtk_ddp_comp_funcs *funcs;
-	struct cmdq_client_reg cmdq_reg;
 };
 
 static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)
@@ -227,12 +226,12 @@ void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
 		    unsigned int CFG, struct cmdq_pkt *cmdq_pkt);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(enum mtk_ddp_comp_id comp_id);
 void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-		   struct mtk_ddp_comp *comp, void __iomem *regs,
+		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 		   unsigned int offset);
 void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			   struct mtk_ddp_comp *comp, void __iomem *regs,
+			   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			   unsigned int offset);
 void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
-			struct mtk_ddp_comp *comp, void __iomem *regs,
+			struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			unsigned int offset, unsigned int mask);
 #endif /* MTK_DRM_DDP_COMP_H */
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
