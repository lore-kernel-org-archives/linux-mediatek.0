Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0C4C4742C
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 00:35:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B55B72225E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 00:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CJfnw8ZE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHJaoKdv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B55B72225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWn1dWi3zzN76BU4VNSdecMGy7fzwXqBpGqVbWp6bgw=; b=CJfnw8ZErqLt3ng2+vnL1gawnG
	Y0KfRoalgPChg/TPkozL1Yk+5XVG1tlpSYwW+UwVrh34cF97YWkgsXkhBUeNW1DDN54OAxP4gCMnF
	pOO+Yg3IsM6Lk7xU1qpyCjc1oK1cTKqyLZpzIj0fAAwb0aXnj3xWz2fVCNXqFjzgxMemES0zwC7yj
	XpTT/v9/uwJTiwAo8jpc4R9UXjMx8UryjR278/opOxtLny8VR+XLReAunOMe/1DfymBYMbCUsd1lW
	mE8LFV9F75BgQVW+V3B983b9uyCyzqGHBYCU/ivw/JyWHNOfTS0KpseRv69DpCCUGiIIVQ2uUGsHx
	f3Y5RUcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZkIM-0001Pf-2q; Tue, 03 Nov 2020 00:35:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZkHt-0001AX-1M
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 00:35:09 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DD8B22275;
 Tue,  3 Nov 2020 00:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363700;
 bh=/Ao7zf4Hcpjq2qXkkmGDzloEK4JLhVkJD/xywTY+naw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fHJaoKdvK4wwwRrgyfF5scVxeegaomJ7PD7d4brPzO7/bTJyjJybcSO/VfL1Kj44P
 lcl/MzyiyrtH2x8KDNcZrT5QLD8VKfUg4NpOo8ZVIOwBZ3ShMqWksZDihcgIwYom1q
 J1oRa2R6gODq8c+oIDy3jmVz9QSAOgOeCL/7o3WY=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 09/11] drm/mediatek: Register vblank callback function
Date: Tue,  3 Nov 2020 08:34:20 +0800
Message-Id: <20201103003422.17838-10-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103003422.17838-1-chunkuang.hu@kernel.org>
References: <20201103003422.17838-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_193501_376837_B4C8178A 
X-CRM114-Status: GOOD (  19.54  )
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
index ab56054b0934..e07611edf5f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -75,30 +75,33 @@ struct mtk_disp_ovl {
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
@@ -107,7 +110,8 @@ static void mtk_ovl_disable_vblank(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
-	ovl->crtc = NULL;
+	ovl->vblank_cb = NULL;
+	ovl->vblank_cb_data = NULL;
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 1976769ae4e3..edffe25f14b4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -61,25 +61,25 @@ struct mtk_disp_rdma_data {
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
@@ -95,11 +95,13 @@ static void rdma_update_bits(struct device *dev, unsigned int reg,
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
@@ -108,7 +110,8 @@ static void mtk_rdma_disable_vblank(struct device *dev)
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
