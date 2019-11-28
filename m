Return-Path: <SRS0=mhP0=ZU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B21C432C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Nov 2019 02:44:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38EF920637
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Nov 2019 02:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IzTDHYcT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nVszY4uD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38EF920637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b47w3T7ffG2wwfnwrU6dtlaJp3v0KjlJvsxPH3I8Mfk=; b=IzTDHYcToqCb6J
	WyolsMc+Ib+LQYXEOrr8CXBKiBE4M60PUT0ccxSBPjDUaFY7iy3RY6NbCHehbedmoVOJVzNXDNigN
	JfI6GIi3KM+7fGS5EarvW5ZRSKT2BKQfHwfxLBK02XFCzwhNCyM5t+DCPTOPFT8m6Vc4nna621PFJ
	R7fKQBp553nuUMRxCLqbJVGvdN2HaZxJOttUf18OtBrxB7CAthKk3x2IRkdBUwQvWi9Jy4rxt1nzw
	27t0VudWFibu5pj/yRlr9wizrr4u6mhj5ieLmyyE4Cgi4pvZRw+J1tqduj6SzFCrhbMWFB/N2l2q5
	MxuKQwQ/Ytu0ai6uUDaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ia9mr-0000uN-Bd; Thu, 28 Nov 2019 02:44:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ia9lY-0007zF-Cn; Thu, 28 Nov 2019 02:42:50 +0000
X-UUID: 0eaa554f06c84a1f9ff7735065d8a4da-20191127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=k6VM4/UsnlA89IWtcgp+bIwlUMlgMEZvRSQW+Rdw4ko=; 
 b=nVszY4uDZnluYvvDcZLfNlBl+nlhsPRnbBa8BU+zUd0Wx1ktzL6yTrZCKxcQUDwvzrFTO09LH90COcZxaHW7+3qxhjgaLXbWP1A5wPvMYjK5XwjCfeob7vJ5UkAveBSdA8NMaxXRig8+G5QKAD7Dlfk34Bu4pM10vAksbnN7mVY=;
X-UUID: 0eaa554f06c84a1f9ff7735065d8a4da-20191127
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 818243209; Wed, 27 Nov 2019 18:42:44 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 18:43:19 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 28 Nov 2019 10:42:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 28 Nov 2019 10:42:46 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 6/6] drm/mediatek: apply CMDQ control flow
Date: Thu, 28 Nov 2019 10:42:38 +0800
Message-ID: <20191128024238.9399-7-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191128024238.9399-1-bibby.hsieh@mediatek.com>
References: <20191128024238.9399-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_184248_470790_145D8B12 
X-CRM114-Status: GOOD (  13.44  )
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
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 86 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 31 ++++++++
 2 files changed, 113 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index fcf4e755e0bd..1b4e537ac3c1 100644
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
@@ -42,6 +44,9 @@ struct mtk_drm_crtc {
 	unsigned int			layer_nr;
 	bool				pending_planes;
 
+	struct cmdq_client		*cmdq_client;
+	u32				cmdq_event;
+
 	void __iomem			*config_regs;
 	const struct mtk_mmsys_reg_data *mmsys_reg_data;
 	struct mtk_disp_mutex		*mutex;
@@ -56,6 +61,11 @@ struct mtk_crtc_state {
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
@@ -229,6 +239,46 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
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
+}
+#endif
 static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 {
 	struct drm_crtc *crtc = &mtk_crtc->base;
@@ -383,7 +433,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 	if (state->pending_config) {
 		mtk_ddp_comp_config(comp, state->pending_width,
 				    state->pending_height,
-				    state->pending_vrefresh, 0, NULL);
+				    state->pending_vrefresh, 0,
+				    state->cmdq_handle);
 
 		state->pending_config = false;
 	}
@@ -403,7 +454,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 
 			if (comp)
 				mtk_ddp_comp_layer_config(comp, local_layer,
-							  plane_state, NULL);
+							  plane_state,
+							  state->cmdq_handle);
 			plane_state->pending.config = false;
 		}
 		mtk_crtc->pending_planes = false;
@@ -454,6 +506,13 @@ void mtk_drm_crtc_cursor_update(struct drm_crtc *crtc, struct drm_plane *plane,
 		mtk_crtc_ddp_config(crtc);
 		mtk_disp_mutex_release(mtk_crtc->mutex);
 	}
+#ifdef CONFIG_MTK_CMDQ
+	if (mtk_crtc->cmdq_client) {
+		mtk_cmdq_acquire(crtc);
+		mtk_crtc_ddp_config(crtc);
+		mtk_cmdq_release(crtc);
+	}
+#endif
 	mutex_unlock(&priv->hw_lock);
 }
 
@@ -570,6 +629,13 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 		mtk_crtc_ddp_config(crtc);
 		mtk_disp_mutex_release(mtk_crtc->mutex);
 	}
+#ifdef CONFIG_MTK_CMDQ
+	if (mtk_crtc->cmdq_client) {
+		mtk_cmdq_acquire(crtc);
+		mtk_crtc_ddp_config(crtc);
+		mtk_cmdq_release(crtc);
+	}
+#endif
 }
 
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
@@ -619,7 +685,7 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
-	if (!priv->data->shadow_register)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
 		mtk_crtc_ddp_config(crtc);
 
 	mtk_drm_finish_page_flip(mtk_crtc);
@@ -761,6 +827,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
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
+#endif
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 6d0f349ddf82..9cc12af2bc06 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -370,6 +370,9 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 		      const struct mtk_ddp_comp_funcs *funcs)
 {
 	struct platform_device *comp_pdev;
+	struct resource res;
+	struct cmdq_client_reg *cmdq_reg;
+	int ret = 0;
 
 	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
 		return -EINVAL;
@@ -404,6 +407,34 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	}
 	comp->dev = &comp_pdev->dev;
 
+#ifdef CONFIG_MTK_CMDQ
+	if (of_address_to_resource(node, 0, &res) != 0) {
+		dev_err(dev, "Missing reg in %s node\n",
+			node->full_name);
+		return -EINVAL;
+	}
+	comp->regs_pa = res.start;
+
+	comp_pdev = of_find_device_by_node(node);
+	if (!comp_pdev) {
+		dev_warn(dev, "Waiting for component device %s\n",
+			 node->full_name);
+		return -EPROBE_DEFER;
+	}
+
+	cmdq_reg = kzalloc(sizeof(*cmdq_reg), GFP_KERNEL);
+	if (!cmdq_reg)
+		return -EINVAL;
+
+	ret = cmdq_dev_get_client_reg(&comp_pdev->dev, cmdq_reg, 0);
+	if (ret != 0)
+		dev_dbg(&comp_pdev->dev,
+			"get mediatek,gce-client-reg fail!\n");
+	else
+		comp->subsys = cmdq_reg->subsys;
+
+	kfree(cmdq_reg);
+#endif
 	return 0;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
