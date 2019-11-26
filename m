Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8D3C43215
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 06:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C8732071A
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 06:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oIpGmq7p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="asxpaMpd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C8732071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=te2YJqxA2IAFl1TpR8gh0oYtpPNfIX9ONkJz4YRR/R0=; b=oIpGmq7poZ0b2J
	ySLs1HoV5eF+mQ3Bh/D9sRiS/WnEyYlwvE62Hm8xy0EyYzK0vqXLSya7SckKDdJswcbB5IZPCd1yb
	ewMFIdeEn0SAaOea/XE9B0LAYyxBWw0dJ6M661IyipDyNYO99zCEn4fJBRpmaqqgmNpNZ8cffSk1k
	4GQThfKW/8vKVDFxLJsGvpi1EeQVTtqmFeGDjBslxjFuQQUk7nk9jqDaO4MPHG+bH3cshVL4YPmSo
	eCEnyjIq8kygV5kmNS6LBWzSZMLEAmv47BA2HwdxbmBt8yVm9TonkweLfN3ULkYrRyT4PMOEulpRQ
	YoB6viIlGGbVNWOpSyfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZUNv-0007O3-Jt; Tue, 26 Nov 2019 06:31:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZUNQ-0006wh-7U; Tue, 26 Nov 2019 06:31:10 +0000
X-UUID: e4855a803ba04810bb6c2771a6a0ad2e-20191125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WLsOap9fWJYafOkS1p7359AjO4uwjv05Y5EjbgsSZb0=; 
 b=asxpaMpdTNLpqGcr7ad0oBaQwDY7UcceyLDI3uR2N4wqZFCrzbyp8JRlFZzBHuuuholIseLCWbNveMpXrCa439BnKqrT7qA3XyAeOtLX3nshcIB+RseWxNDatGAYmHB6tYfFvmNXuHLE/YbwOc3jiBo5+G/2badymVIwUEBUikM=;
X-UUID: e4855a803ba04810bb6c2771a6a0ad2e-20191125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1827809456; Mon, 25 Nov 2019 22:30:56 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 25 Nov 2019 22:29:43 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 14:29:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 26 Nov 2019 14:29:14 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/7] drm/mediatek: fix atomic_state reference counting
Date: Tue, 26 Nov 2019 14:29:26 +0800
Message-ID: <20191126062932.19773-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191126062932.19773-1-bibby.hsieh@mediatek.com>
References: <20191126062932.19773-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_223108_276343_4B5DDDB0 
X-CRM114-Status: GOOD (  17.01  )
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
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The DRM core takes care of all atomic state refcounting.
However, mediatek drm defers some work that accesses planes
and plane_states in drm_atomic_state, and must therefore
keep its own atomic state references until this work complete.

We take the atomic_state reference in atomic_fulsh() and ensure all the
information in atomic_state already was updated in hardware for
showing on screen and then schedules unreference_work to drop references
on atomic_state.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 11 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 79 +++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  9 +++
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 29d0582e90e9..68b92adc96bb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -7,7 +7,7 @@
 #include <linux/pm_runtime.h>
 
 #include <asm/barrier.h>
-
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -47,6 +47,7 @@ struct mtk_drm_crtc {
 	struct mtk_disp_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
+	struct drm_crtc_state		*old_crtc_state;
 };
 
 struct mtk_crtc_state {
@@ -362,6 +363,7 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct drm_atomic_state *atomic_state = mtk_crtc->old_crtc_state->state;
 	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
 	unsigned int i;
@@ -399,6 +401,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 			plane_state->pending.config = false;
 		}
 		mtk_crtc->pending_planes = false;
+		mtk_atomic_state_put_queue(atomic_state);
 	}
 }
 
@@ -494,6 +497,7 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
 static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_crtc_state)
 {
+	struct drm_atomic_state *old_atomic_state = old_crtc_state->state;
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 	unsigned int pending_planes = 0;
@@ -512,8 +516,11 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 			pending_planes |= BIT(i);
 		}
 	}
-	if (pending_planes)
+	if (pending_planes) {
 		mtk_crtc->pending_planes = true;
+		drm_atomic_state_get(old_atomic_state);
+		mtk_crtc->old_crtc_state = old_crtc_state;
+	}
 	if (crtc->state->color_mgmt_changed)
 		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
 			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6588dc6dd5e3..6c68283b6124 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -115,10 +115,85 @@ static int mtk_atomic_commit(struct drm_device *drm,
 	return 0;
 }
 
+struct mtk_atomic_state {
+	struct drm_atomic_state base;
+	struct list_head list;
+};
+
+static inline struct mtk_atomic_state *to_mtk_state(struct drm_atomic_state *s)
+{
+	return container_of(s, struct mtk_atomic_state, base);
+}
+
+void mtk_atomic_state_put_queue(struct drm_atomic_state *state)
+{
+	struct drm_device *drm = state->dev;
+	struct mtk_drm_private *mtk_drm = drm->dev_private;
+	struct mtk_atomic_state *mtk_state = to_mtk_state(state);
+	unsigned long flags;
+
+	spin_lock_irqsave(&mtk_drm->unreference.lock, flags);
+	list_add_tail(&mtk_state->list, &mtk_drm->unreference.list);
+	spin_unlock_irqrestore(&mtk_drm->unreference.lock, flags);
+
+	schedule_work(&mtk_drm->unreference.work);
+}
+
+static void mtk_unreference_work(struct work_struct *work)
+{
+	struct mtk_drm_private *mtk_drm = container_of(work,
+			struct mtk_drm_private, unreference.work);
+	unsigned long flags;
+	struct mtk_atomic_state *state, *tmp;
+
+	/*
+	 * framebuffers cannot be unreferenced in atomic context.
+	 * Therefore, only hold the spinlock when iterating unreference_list,
+	 * and drop it when doing the unreference.
+	 */
+	spin_lock_irqsave(&mtk_drm->unreference.lock, flags);
+	list_for_each_entry_safe(state, tmp, &mtk_drm->unreference.list, list) {
+		list_del(&state->list);
+		spin_unlock_irqrestore(&mtk_drm->unreference.lock, flags);
+		drm_atomic_state_put(&state->base);
+		spin_lock_irqsave(&mtk_drm->unreference.lock, flags);
+	}
+	spin_unlock_irqrestore(&mtk_drm->unreference.lock, flags);
+}
+
+static struct drm_atomic_state *
+		mtk_drm_atomic_state_alloc(struct drm_device *dev)
+{
+	struct mtk_atomic_state *mtk_state;
+
+	mtk_state = kzalloc(sizeof(*mtk_state), GFP_KERNEL);
+	if (!mtk_state)
+		return NULL;
+
+	if (drm_atomic_state_init(dev, &mtk_state->base) < 0) {
+		kfree(mtk_state);
+		return NULL;
+	}
+
+	INIT_LIST_HEAD(&mtk_state->list);
+
+	return &mtk_state->base;
+}
+
+static void mtk_drm_atomic_state_free(struct drm_atomic_state *state)
+{
+	struct mtk_atomic_state *mtk_state = to_mtk_state(state);
+
+	drm_atomic_state_default_release(state);
+	kfree(mtk_state);
+}
+
 static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
 	.fb_create = mtk_drm_mode_fb_create,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = mtk_atomic_commit,
+	.atomic_state_alloc = mtk_drm_atomic_state_alloc,
+	.atomic_state_free = mtk_drm_atomic_state_free
 };
 
 static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
@@ -337,6 +412,10 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	drm_kms_helper_poll_init(drm);
 	drm_mode_config_reset(drm);
 
+	INIT_WORK(&private->unreference.work, mtk_unreference_work);
+	INIT_LIST_HEAD(&private->unreference.list);
+	spin_lock_init(&private->unreference.lock);
+
 	return 0;
 
 err_unset_dma_parms:
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index b6a82728d563..c37d835cf949 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -55,6 +55,13 @@ struct mtk_drm_private {
 
 	struct drm_atomic_state *suspend_state;
 
+	struct {
+		struct work_struct	work;
+		struct list_head	list;
+		/* lock for unreference list */
+		spinlock_t		lock;
+	} unreference;
+
 	bool dma_parms_allocated;
 };
 
@@ -66,4 +73,6 @@ extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
 extern struct platform_driver mtk_mipi_tx_driver;
 
+void mtk_atomic_state_put_queue(struct drm_atomic_state *state);
+
 #endif /* MTK_DRM_DRV_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
