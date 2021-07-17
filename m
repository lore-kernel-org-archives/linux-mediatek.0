Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CF1C636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:08:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD647613C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD647613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NG/G0bKmMZwWFeBI8jMsMvVMjbWbbjBgTS2Ql9FGwqw=; b=boFVL+AGQtVbAc
	GXA3VRPyU4Wg5zIkU7HdhiTwvzjDIZ86EXLuxjoaZh5+W7w7M/ygpkg4Fswo5l4DwHalcROqkff1k
	hpiJ1y6jBHmiWWVztpxWraNnhlgwRkKBClR2Y8+qTiy691+mri7zHn3qeCMyxG8JPWU6U0u6AtBgf
	6I/6PnSLQ32uxonCTcaow/obWNd4oO5yNkdFzFujlrlAo6G46N0q4eBG7i16rHgY/I8arAg4Auumn
	Vr7B5m8roUSr6dYqSpbwZ+ES4nWuGWeKGZiL7vBJz/s+0SJPAm1uRmLjfeEEgnkZiRsYNtC90pvvn
	P8pTYdedYldgUa09cTgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4gJG-006Ig5-6B; Sat, 17 Jul 2021 09:08:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4gFX-006Gq8-RJ; Sat, 17 Jul 2021 09:04:45 +0000
X-UUID: 0b5c584bbff24a62a9992dd73e292fff-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=I/gzexAKtuMlBfxrgsBHytXxXlzhsbmqb8zdIeFST2Y=; 
 b=BsH4naXKMvbygV5opyUeRtB4yJvnX2yuYsggsPtDcH1n1LvQjb7l1yOeShck2TrEIqY8Pg94hjvcAcOCXX/ofEp9mD0B3yn7GawIiwYoGxeXBqL90CYjDeBxRXdPMKsJwtyrZFsUct9MYc2cnGAvctVK7HYgbxJMoBPbCQP5Jgk=;
X-UUID: 0b5c584bbff24a62a9992dd73e292fff-20210717
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 233700909; Sat, 17 Jul 2021 02:04:39 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 02:04:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:30 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v1 08/10] drm/mediatek: add merge vblank support for MT8195
Date: Sat, 17 Jul 2021 17:04:06 +0800
Message-ID: <20210717090408.28283-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_020443_940760_E2C0D307 
X-CRM114-Status: GOOD (  23.32  )
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

Add merge vblank support.
The vdosys1 go through the following component:
pseudo_ovl -> ethdr -> merge5 -> dp_intf1
The first comp is pseudo_ovl. This comp doesn't
have the whole CRTC timing vblank but only has vblank for each layer.
Merge5 comp gets all the mixed layers after the ETHDR module.
Use merge5 comp as the vblank source.
Change the mtk_drm_crtc_enable_vblank function: iterate over the path
comp from start to the end and find the first comp registered with vblank
function as the vblank source.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 56 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 19 +++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 14 ++++--
 5 files changed, 86 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index f5d35007b84d..7f99ba525556 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -61,6 +61,10 @@ void mtk_merge_config(struct device *dev, unsigned int width,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_merge_start(struct device *dev);
 void mtk_merge_stop(struct device *dev);
+void mtk_merge_enable_vblank(struct device *dev,
+			     void (*vblank_cb)(void *),
+			     void *vblank_cb_data);
+void mtk_merge_disable_vblank(struct device *dev);
 
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 768c282d2d63..6231087067e2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -76,6 +76,8 @@
 	REG_FLD_VAL(DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW, val)
 #define DISP_MERGE_CFG_41_VAL_PREULTRA_TH_HIGH(val) \
 	REG_FLD_VAL(DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH, val)
+#define DISP_MERGE_CFG2_0	0x160
+#define DISP_MERGE_CFG2_2	0x168
 
 struct mtk_merge_config_struct {
 	unsigned short width_right;
@@ -92,6 +94,9 @@ struct mtk_disp_merge {
 	void __iomem *regs;
 	struct cmdq_client_reg		cmdq_reg;
 	u32				fifo_en;
+	int irq;
+	void (*vblank_cb)(void *data);
+	void *vblank_cb_data;
 };
 
 void mtk_merge_start(struct device *dev)
@@ -272,6 +277,44 @@ void mtk_merge_clk_disable(struct device *dev)
 		clk_disable_unprepare(priv->clk);
 }
 
+void mtk_merge_enable_vblank(struct device *dev,
+			     void (*vblank_cb)(void *),
+			     void *vblank_cb_data)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+	int irq_frame_done_en = BIT(16);
+
+	priv->vblank_cb = vblank_cb;
+	priv->vblank_cb_data = vblank_cb_data;
+
+	writel(irq_frame_done_en, priv->regs + DISP_MERGE_CFG2_0);
+}
+
+void mtk_merge_disable_vblank(struct device *dev)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = NULL;
+	priv->vblank_cb_data = NULL;
+
+	writel(0x0, priv->regs + DISP_MERGE_CFG2_0);
+}
+
+static irqreturn_t mtk_disp_merge_irq_handler(int irq, void *dev_id)
+{
+	struct mtk_disp_merge *priv = dev_id;
+
+	writel(0x1, priv->regs + DISP_MERGE_CFG2_2);
+	writel(0x0, priv->regs + DISP_MERGE_CFG2_2);
+
+	if (!priv->vblank_cb)
+		return IRQ_NONE;
+
+	priv->vblank_cb(priv->vblank_cb_data);
+
+	return IRQ_HANDLED;
+}
+
 static int mtk_disp_merge_bind(struct device *dev, struct device *master,
 			       void *data)
 {
@@ -337,6 +380,19 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 	priv->fifo_en = of_property_read_bool(dev->of_node,
 		"mediatek,merge-fifo-en");
 
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		priv->irq = 0;
+
+	if (priv->irq) {
+		ret = devm_request_irq(dev, priv->irq, mtk_disp_merge_irq_handler,
+				       IRQF_TRIGGER_NONE, dev_name(dev), priv);
+		if (ret < 0) {
+			dev_err(dev, "Failed to request irq %d: %d\n", priv->irq, ret);
+			return ret;
+		}
+	}
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = component_add(dev, &mtk_disp_merge_component_ops);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 40df2c823187..f3addc200c97 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -501,19 +501,28 @@ static void mtk_crtc_ddp_irq(void *data)
 static int mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-
-	mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc->base);
+	struct mtk_ddp_comp *comp;
+	int i;
 
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		comp = mtk_crtc->ddp_comp[i];
+		if (mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc->base))
+			break;
+	}
 	return 0;
 }
 
 static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp;
+	int i;
 
-	mtk_ddp_comp_disable_vblank(comp);
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		comp = mtk_crtc->ddp_comp[i];
+		if (mtk_ddp_comp_disable_vblank(comp))
+			break;
+	}
 }
 
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 64cbb9e1cc83..5ecb16c2a8ad 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -347,6 +347,8 @@ static const struct mtk_ddp_comp_funcs ddp_merge = {
 	.start = mtk_merge_start,
 	.stop = mtk_merge_stop,
 	.config = mtk_merge_config,
+	.enable_vblank = mtk_merge_enable_vblank,
+	.disable_vblank = mtk_merge_disable_vblank,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ufoe = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index ec84dc258124..b2f01c93a268 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -114,18 +114,24 @@ static inline void mtk_ddp_comp_stop(struct mtk_ddp_comp *comp)
 		comp->funcs->stop(comp->dev);
 }
 
-static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
+static inline bool mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
 					      void (*vblank_cb)(void *),
 					      void *vblank_cb_data)
 {
-	if (comp->funcs && comp->funcs->enable_vblank)
+	if (comp->funcs && comp->funcs->enable_vblank) {
 		comp->funcs->enable_vblank(comp->dev, vblank_cb, vblank_cb_data);
+		return true;
+	}
+	return false;
 }
 
-static inline void mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp *comp)
+static inline bool mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp *comp)
 {
-	if (comp->funcs && comp->funcs->disable_vblank)
+	if (comp->funcs && comp->funcs->disable_vblank) {
 		comp->funcs->disable_vblank(comp->dev);
+		return true;
+	}
+	return false;
 }
 
 static inline
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
