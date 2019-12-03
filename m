Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661FEC432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:13:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E7320726
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:13:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e/8Xq0gx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XA+IIVQ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E7320726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NtRMKMMvjbP2zJfA7gmZhYqy/TJ3ugkaIc1ijBQbrpU=; b=e/8Xq0gxG/e9VQ
	pZn/uQiETVRzB7kCOxjyUDf2N48thQdzrha61i4IUyByMizrq1eebf1qQZeVh5pHAKXecMEQRXw3W
	PsPfi30ftM1z77cTX34MHYcfl9+W4eEbqH25XzEdd9VVwuztBL3PB2Hm26SfM6Bxi17QytVGlJRFW
	kUsxyLWG0oWg1DSUuKaaZJ8p7zR8B/FqkvKrofGunfDlJojdFRYvj8kThxJjYIc8wQbWYBz4UOVDc
	UOO17cFDfjA0rEwFvNVO8/HkL+By/tTILoiOtgWXVLEMdyOjSMyDfV5l6AiyufGfkVxYWBGk86G9a
	kaeVnaBZMg3JDGl3xKEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic2Ml-00070P-IF; Tue, 03 Dec 2019 07:12:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic2Kg-000542-3e; Tue, 03 Dec 2019 07:10:53 +0000
X-UUID: e4ed83a1d25046d4aa8bdadde969e30d-20191202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Fph9XXbAQAeiXeIpfN6pksMELJ8OSpAJ1DcbjNsN8zU=; 
 b=XA+IIVQ5JFXIQr0CedbqkJ8RPF6c1nBxfUND62wQSvdwI9j9BwiPBtJ6tDVGgTToOX2OKcHcsZi4KBWNy19+dEOewwtZ+joLCZ1lSROqf2+WLWDqcewCch5Z19r4KvZ+1KC0BFCmLocAM45kvBMQnh+QqtYjbgkrTXbzvJdPtVM=;
X-UUID: e4ed83a1d25046d4aa8bdadde969e30d-20191202
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 334200469; Mon, 02 Dec 2019 23:10:41 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 23:10:51 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 15:09:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 3 Dec 2019 15:10:20 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 6/6] drm/mediatek: apply CMDQ control flow
Date: Tue, 3 Dec 2019 15:10:36 +0800
Message-ID: <20191203071036.14158-7-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191203071036.14158-1-bibby.hsieh@mediatek.com>
References: <20191203071036.14158-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 560FAB5E0D7D0CB653ED640285D9EFC0442629B88FD93FB206BA002BF261928F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_231050_286027_9E0715FA 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: drinkcat@chromium.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, CK Hu <ck.hu@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Unlike other SoCs, MT8183 does not have "shadow"
registers for performaing an atomic video mode
set or page flip at vblank/vsync.

The CMDQ (Commend Queue) in MT8183 is used to help
update all relevant display controller registers
with critical time limation.

Signed-off-by: YT Shen <yt.shen@mediatek.com>
Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 163 +++++++++++++++++-------
 1 file changed, 118 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 9b2f7935ba28..7b47fe8ccee8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -12,6 +12,8 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <linux/of_address.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_drm_drv.h"
 #include "mtk_drm_crtc.h"
@@ -42,11 +44,17 @@ struct mtk_drm_crtc {
 	unsigned int			layer_nr;
 	bool				pending_planes;
 
+	struct cmdq_client		*cmdq_client;
+	u32				cmdq_event;
+
 	void __iomem			*config_regs;
 	const struct mtk_mmsys_reg_data *mmsys_reg_data;
 	struct mtk_disp_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
+
+	/* lock for cmdq access */
+	struct mutex			chan_lock;
 };
 
 struct mtk_crtc_state {
@@ -56,6 +64,11 @@ struct mtk_crtc_state {
 	unsigned int			pending_width;
 	unsigned int			pending_height;
 	unsigned int			pending_vrefresh;
+	struct cmdq_pkt			*cmdq_handle;
+};
+
+struct mtk_cmdq_cb_data {
+	struct cmdq_pkt			*cmdq_handle;
 };
 
 static inline struct mtk_drm_crtc *to_mtk_crtc(struct drm_crtc *c)
@@ -229,6 +242,50 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 	return NULL;
 }
 
+#ifdef CONFIG_MTK_CMDQ
+static void ddp_cmdq_cb(struct cmdq_cb_data data)
+{
+	struct mtk_cmdq_cb_data *cb_data = data.data;
+
+	cmdq_pkt_destroy(cb_data->cmdq_handle);
+	kfree(cb_data);
+}
+
+static void mtk_cmdq_acquire(struct drm_crtc *crtc)
+{
+	struct mtk_crtc_state *mtk_crtc_state =
+			to_mtk_crtc_state(crtc->state);
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+
+	mutex_lock(&mtk_crtc->chan_lock);
+	mtk_crtc_state->cmdq_handle =
+			cmdq_pkt_create(mtk_crtc->cmdq_client,
+					PAGE_SIZE);
+	cmdq_pkt_clear_event(mtk_crtc_state->cmdq_handle,
+			     mtk_crtc->cmdq_event);
+	cmdq_pkt_wfe(mtk_crtc_state->cmdq_handle, mtk_crtc->cmdq_event);
+}
+
+static void mtk_cmdq_release(struct drm_crtc *crtc)
+{
+	struct mtk_crtc_state *mtk_crtc_state =
+			to_mtk_crtc_state(crtc->state);
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_cmdq_cb_data *cb_data;
+
+	cb_data = kmalloc(sizeof(*cb_data), GFP_KERNEL);
+	if (!cb_data) {
+		DRM_DEV_ERROR(crtc->dev->dev, "Failed to alloc cb_data\n");
+		return;
+	}
+
+	cb_data->cmdq_handle = mtk_crtc_state->cmdq_handle;
+	cmdq_pkt_flush_async(mtk_crtc_state->cmdq_handle,
+			     ddp_cmdq_cb, cb_data);
+	mutex_unlock(&mtk_crtc->chan_lock);
+}
+#endif
+
 static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 {
 	struct drm_crtc *crtc = &mtk_crtc->base;
@@ -383,7 +440,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 	if (state->pending_config) {
 		mtk_ddp_comp_config(comp, state->pending_width,
 				    state->pending_height,
-				    state->pending_vrefresh, 0, NULL);
+				    state->pending_vrefresh, 0,
+				    state->cmdq_handle);
 
 		state->pending_config = false;
 	}
@@ -403,13 +461,54 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 
 			if (comp)
 				mtk_ddp_comp_layer_config(comp, local_layer,
-							  plane_state, NULL);
+							  plane_state,
+							  state->cmdq_handle);
 			plane_state->pending.config = false;
 		}
 		mtk_crtc->pending_planes = false;
 	}
 }
 
+static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
+{
+	struct drm_crtc *crtc = &mtk_crtc->base;
+	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	unsigned int pending_planes = 0;
+	int i;
+
+	for (i = 0; i < mtk_crtc->layer_nr; i++) {
+		struct drm_plane *plane = &mtk_crtc->planes[i];
+		struct mtk_plane_state *plane_state;
+
+		plane_state = to_mtk_plane_state(plane->state);
+		if (plane_state->pending.dirty) {
+			plane_state->pending.config = true;
+			plane_state->pending.dirty = false;
+			pending_planes |= BIT(i);
+		} else if (plane_state->pending.async_dirty) {
+			plane_state->pending.config = true;
+			plane_state->pending.async_update = false;
+			plane_state->pending.async_dirty = false;
+			pending_planes |= BIT(i);
+		}
+	}
+	if (pending_planes)
+		mtk_crtc->pending_planes = true;
+
+	if (priv->data->shadow_register) {
+		mtk_disp_mutex_acquire(mtk_crtc->mutex);
+		mtk_crtc_ddp_config(crtc);
+		mtk_disp_mutex_release(mtk_crtc->mutex);
+	}
+#ifdef CONFIG_MTK_CMDQ
+	if (mtk_crtc->cmdq_client) {
+		mtk_cmdq_acquire(crtc);
+		mtk_crtc_ddp_config(crtc);
+		mtk_cmdq_release(crtc);
+	}
+#endif
+}
+
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state)
 {
@@ -425,34 +524,15 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
 			       struct drm_plane_state *new_state)
 {
-	struct mtk_drm_private *priv = crtc->dev->dev_private;
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	const struct drm_plane_helper_funcs *plane_helper_funcs =
 			plane->helper_private;
-	int i;
 
 	if (!mtk_crtc->enabled)
 		return;
 
 	plane_helper_funcs->atomic_update(plane, new_state);
-
-	for (i = 0; i < mtk_crtc->layer_nr; i++) {
-		struct drm_plane *plane = &mtk_crtc->planes[i];
-		struct mtk_plane_state *plane_state;
-
-		plane_state = to_mtk_plane_state(plane->state);
-		if (plane_state->pending.async_dirty) {
-			plane_state->pending.config = true;
-			plane_state->pending.async_update = false;
-			plane_state->pending.async_dirty = false;
-		}
-	}
-	mtk_crtc->pending_planes = true;
-	if (priv->data->shadow_register) {
-		mtk_disp_mutex_acquire(mtk_crtc->mutex);
-		mtk_crtc_ddp_config(crtc);
-		mtk_disp_mutex_release(mtk_crtc->mutex);
-	}
+	mtk_drm_crtc_hw_config(mtk_crtc);
 }
 
 static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -536,34 +616,14 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_crtc_state)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_drm_private *priv = crtc->dev->dev_private;
-	unsigned int pending_planes = 0;
 	int i;
 
 	if (mtk_crtc->event)
 		mtk_crtc->pending_needs_vblank = true;
-	for (i = 0; i < mtk_crtc->layer_nr; i++) {
-		struct drm_plane *plane = &mtk_crtc->planes[i];
-		struct mtk_plane_state *plane_state;
-
-		plane_state = to_mtk_plane_state(plane->state);
-		if (plane_state->pending.dirty) {
-			plane_state->pending.config = true;
-			plane_state->pending.dirty = false;
-			pending_planes |= BIT(i);
-		}
-	}
-	if (pending_planes)
-		mtk_crtc->pending_planes = true;
 	if (crtc->state->color_mgmt_changed)
 		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
 			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
-
-	if (priv->data->shadow_register) {
-		mtk_disp_mutex_acquire(mtk_crtc->mutex);
-		mtk_crtc_ddp_config(crtc);
-		mtk_disp_mutex_release(mtk_crtc->mutex);
-	}
+	mtk_drm_crtc_hw_config(mtk_crtc);
 }
 
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
@@ -613,7 +673,7 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
-	if (!priv->data->shadow_register)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
 		mtk_crtc_ddp_config(crtc);
 
 	mtk_drm_finish_page_flip(mtk_crtc);
@@ -755,6 +815,19 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
 	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
 	priv->num_pipes++;
-
+#ifdef CONFIG_MTK_CMDQ
+	mtk_crtc->cmdq_client =
+			cmdq_mbox_create(dev, drm_crtc_index(&mtk_crtc->base),
+					 2000);
+	of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
+				   drm_crtc_index(&mtk_crtc->base),
+				   &mtk_crtc->cmdq_event);
+	if (IS_ERR(mtk_crtc->cmdq_client)) {
+		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
+			drm_crtc_index(&mtk_crtc->base));
+		mtk_crtc->cmdq_client = NULL;
+	}
+	mutex_init(&mtk_crtc->chan_lock);
+#endif
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
