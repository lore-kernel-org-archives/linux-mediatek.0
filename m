Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F27C0018C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 16:33:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0215F23D57
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 16:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0215F23D57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8n6nJ8ZEecZHMmRwkZyV1/ELijcgtrvzZcdmn0gQRM=; b=xuE495ohNAuXqu5AbfTMlNL4rc
	Sbt2useSgc+spx9AD4el3dBKpUllQml4cbwZAg7FTltgqUdOG6gU637iEKQp4TuvPd+UM2+ZKbijT
	Q004xYUou5NqFGR3DAHhGeLmq/+L+sLifqT5QTvWoYiDN+jACCumncicouk0oM/yjrTc55nLFI2vY
	wj+LvJ2/fDSBTYjno7+2NOvDgDZ5BvuL4t2yW01MoI10+L2nYb7ziYuukcO7+FIwtn02007fl521N
	DZow0af+NvXnJc3yFjvSsup37VOLxmv7op6RxabJwcoVFz0Pc44kkqKGD3GPTZl9aqqX72z2PXJmv
	ku3WG/3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knOs4-0001pw-D9; Thu, 10 Dec 2020 16:32:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knOrz-0001P4-4T
 for linux-mediatek@merlin.infradead.org; Thu, 10 Dec 2020 16:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Xzih1T+jaI4iMaBgOn/uiazyhlEGMoucV21evM40zs0=; b=If7gEwjNPOmJIUll5J3328d7zA
 9ozsAl5ZlvN440PXHkFHDbDG58Y853NeSjHWdeOSGomfg3vme/1o+lvVGNuSArqO2RJZsIsHiq5Wr
 ecjge2oRgDilsIwiX9SAEVoYe7/bCjltLuKX0L2gi0wKJsgPZysViiAXhGHx0dVTqZwRbUk5xCbFO
 gq7JQ9/NlVmhUiJin5BRqq+mEcmygn7lLNHgAVDz4aYsachw1ARprHV5hO9BbGX8t21OiyNyQMV1U
 54P7iOV3Z1UIh89mdUoYW6Ins6UzVUb66o/GSTAZgb1AA9HCU/pLRtDHRETpRXnA+rL9/QrtLGYvg
 5VWT3e0w==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knOcA-0002YO-1Y
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 16:16:30 +0000
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 10/12] drm/mediatek: Register vblank callback function
Date: Fri, 11 Dec 2020 00:10:48 +0800
Message-Id: <20201210161050.8460-11-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210161050.8460-1-chunkuang.hu@kernel.org>
References: <20201210161050.8460-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_161623_002530_2E4D1196 
X-CRM114-Status: GOOD (  14.95  )
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

Some ddp component exist in both display path and other path, so
sub driver should not directly call crtc function. crtc register
callback function to sub driver to prevent sub driver directly
call crtc function.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 16 +++--
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 17 +++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 67 +++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 ++-
 5 files changed, 60 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 172d2c9cb988..3c1c1dde6fba 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -76,30 +76,33 @@ struct mtk_disp_ovl {
 	void __iomem			*regs;
 	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_ovl_data	*data;
+	void				(*vblank_cb)(void *data);
+	void				*vblank_cb_data;
 };
 
 static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_ovl *priv = dev_id;
-	struct mtk_ddp_comp *ovl = &priv->ddp_comp;
 
 	/* Clear frame completion interrupt */
 	writel(0x0, priv->regs + DISP_REG_OVL_INTSTA);
 
-	if (!priv->crtc)
+	if (!priv->vblank_cb)
 		return IRQ_NONE;
 
-	mtk_crtc_ddp_irq(priv->crtc, ovl);
+	priv->vblank_cb(priv->vblank_cb_data);
 
 	return IRQ_HANDLED;
 }
 
 static void mtk_ovl_enable_vblank(struct device *dev,
-				  struct drm_crtc *crtc)
+				  void (*vblank_cb)(void *),
+				  void *vblank_cb_data)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
-	ovl->crtc = crtc;
+	ovl->vblank_cb = vblank_cb;
+	ovl->vblank_cb_data = vblank_cb_data;
 	writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
 	writel_relaxed(OVL_FME_CPL_INT, ovl->regs + DISP_REG_OVL_INTEN);
 }
@@ -108,7 +111,8 @@ static void mtk_ovl_disable_vblank(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
-	ovl->crtc = NULL;
+	ovl->vblank_cb = NULL;
+	ovl->vblank_cb_data = NULL;
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 6e6cf039e1da..f4b3a32eb456 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -62,25 +62,25 @@ struct mtk_disp_rdma_data {
  */
 struct mtk_disp_rdma {
 	struct mtk_ddp_comp		ddp_comp;
-	struct drm_crtc			*crtc;
 	struct clk			*clk;
 	void __iomem			*regs;
 	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_rdma_data	*data;
+	void				(*vblank_cb)(void *data);
+	void				*vblank_cb_data;
 };
 
 static irqreturn_t mtk_disp_rdma_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_rdma *priv = dev_id;
-	struct mtk_ddp_comp *rdma = &priv->ddp_comp;
 
 	/* Clear frame completion interrupt */
 	writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
 
-	if (!priv->crtc)
+	if (!priv->vblank_cb)
 		return IRQ_NONE;
 
-	mtk_crtc_ddp_irq(priv->crtc, rdma);
+	priv->vblank_cb(priv->vblank_cb_data);
 
 	return IRQ_HANDLED;
 }
@@ -96,11 +96,13 @@ static void rdma_update_bits(struct device *dev, unsigned int reg,
 }
 
 static void mtk_rdma_enable_vblank(struct device *dev,
-				   struct drm_crtc *crtc)
+				   void (*vblank_cb)(void *),
+				   void *vblank_cb_data)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
-	rdma->crtc = crtc;
+	rdma->vblank_cb = vblank_cb;
+	rdma->vblank_cb_data = vblank_cb_data;
 	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT,
 			 RDMA_FRAME_END_INT);
 }
@@ -109,7 +111,8 @@ static void mtk_rdma_disable_vblank(struct device *dev)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
-	rdma->crtc = NULL;
+	rdma->vblank_cb = NULL;
+	rdma->vblank_cb_data = NULL;
 	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index f1dd5943ba0c..01c35786be49 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -166,24 +166,6 @@ static void mtk_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	state->pending_config = true;
 }
 
-static int mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
-{
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-
-	mtk_ddp_comp_enable_vblank(comp, &mtk_crtc->base);
-
-	return 0;
-}
-
-static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
-{
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-
-	mtk_ddp_comp_disable_vblank(comp);
-}
-
 static int mtk_crtc_ddp_clk_enable(struct mtk_drm_crtc *mtk_crtc)
 {
 	int ret;
@@ -490,6 +472,40 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 	mutex_unlock(&mtk_crtc->hw_lock);
 }
 
+static void mtk_crtc_ddp_irq(void *data)
+{
+	struct drm_crtc *crtc = data;
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_drm_private *priv = crtc->dev->dev_private;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
+#else
+	if (!priv->data->shadow_register)
+#endif
+		mtk_crtc_ddp_config(crtc, NULL);
+
+	mtk_drm_finish_page_flip(mtk_crtc);
+}
+
+static int mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+
+	mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc->base);
+
+	return 0;
+}
+
+static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+
+	mtk_ddp_comp_disable_vblank(comp);
+}
+
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state)
 {
@@ -657,21 +673,6 @@ static int mtk_drm_crtc_init(struct drm_device *drm,
 	return ret;
 }
 
-void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
-{
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_drm_private *priv = crtc->dev->dev_private;
-
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
-#else
-	if (!priv->data->shadow_register)
-#endif
-		mtk_crtc_ddp_config(crtc, NULL);
-
-	mtk_drm_finish_page_flip(mtk_crtc);
-}
-
 static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
 					int comp_idx)
 {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index a2b4677a451c..45cfd0a032de 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -15,7 +15,6 @@
 #define MTK_MIN_BPC	3
 
 void mtk_drm_crtc_commit(struct drm_crtc *crtc);
-void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const enum mtk_ddp_comp_id *path,
 			unsigned int path_len);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index ce598122bb78..56fbd5d2f650 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -79,7 +79,9 @@ struct mtk_ddp_comp_funcs {
 		       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 	void (*start)(struct device *dev);
 	void (*stop)(struct device *dev);
-	void (*enable_vblank)(struct device *dev, struct drm_crtc *crtc);
+	void (*enable_vblank)(struct device *dev,
+			      void (*vblank_cb)(void *),
+			      void *vblank_cb_data);
 	void (*disable_vblank)(struct device *dev);
 	unsigned int (*supported_rotations)(struct device *dev);
 	unsigned int (*layer_nr)(struct device *dev);
@@ -141,10 +143,11 @@ static inline void mtk_ddp_comp_stop(struct mtk_ddp_comp *comp)
 }
 
 static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
-					      struct drm_crtc *crtc)
+					      void (*vblank_cb)(void *),
+					      void *vblank_cb_data)
 {
 	if (comp->funcs && comp->funcs->enable_vblank)
-		comp->funcs->enable_vblank(comp->dev, crtc);
+		comp->funcs->enable_vblank(comp->dev, vblank_cb, vblank_cb_data);
 }
 
 static inline void mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp *comp)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
