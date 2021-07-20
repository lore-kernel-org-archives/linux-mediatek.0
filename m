Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1F1C07E9B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 07:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 601A8611C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 07:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 601A8611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kf5b+jrscNtf9CALSfjfyIQlg3QUpI2iAukKOy+5/4=; b=2eOEgY9OlfFgK4
	vhn2lsns2THZJGgZdctUjwBZinW0IbSfN5/+Wh75LhmFacQ4/LYXwnk/my5III5wICc/7FDGuJPnt
	K9XrKx6ftRQvqwW34HLbX9dqR7NU/mtie3GmDtU8gCGbFZHGanKy1FZHWliSMKFl6VJV5EikLo/cS
	/C7nvkCMXcwgw1bCqx6ZDMe7TpQCR9gbag+ilvaXnQCivYKkwde61fdId9+S8KGUUYyTxWTOKuGC9
	47/iPwLuv5IdBPUd496S9oBisJKYQu/pCbjJLmJdhjNQzhSrliRKDv4j1YLipUPa+BNq+tnbLawS6
	1Mk0GF3IjYHYLNDEXFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5kdo-00C8em-Es; Tue, 20 Jul 2021 07:58:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5kdY-00C8d0-8c; Tue, 20 Jul 2021 07:58:00 +0000
X-UUID: 8b717a5325714633b1a9fa1892ed7358-20210720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RpftztzPqxBa5GANLw3kbQ0Ebj5HCYsSR0IyRV4fIfc=; 
 b=Rz8R1s/xsmo/rQDAsAQp+gzdo3TA76iqwtk88n+ZnRC+Udo3TA6+/LrpnihGu7hnpwjlrUncaWMCRbHAr1id46x6ODH0zJJYGmT46X8lA8EggSL0Q1kQMdT1XgWbNnpUqUV5H2rQGJY6zNJX4YlTKDDmi1ur78eU3MUtJeUIbVs=;
X-UUID: 8b717a5325714633b1a9fa1892ed7358-20210720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1507022886; Tue, 20 Jul 2021 00:57:52 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 00:47:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 15:47:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 20 Jul 2021 15:47:36 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 <enric.balletbo@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <fshao@chromium.org>, <hsinyi@google.com>, <jason-jh.lin@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <David-YH.Chiu@mediatek.com>
Subject: [PATCH v3 1/1] drm/mediatek: Fix cursor plane didn't update
Date: Tue, 20 Jul 2021 15:47:34 +0800
Message-ID: <20210720074734.22287-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210720074734.22287-1-jason-jh.lin@mediatek.com>
References: <20210720074734.22287-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_005757_728076_02AFA935 
X-CRM114-Status: GOOD (  15.44  )
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

The cursor plane should use the current plane state hook in
atomic_async_update because it would not be the new plane state in
the global atomic state, since drm_atomic_helper_swap_state happened
when those plane state hook are run.

Fix cursor plane didn't update issue by below modification:
1. Remove plane_helper_funcs->atomic_update(plane, state) in
   mtk_drm_crtc_async_update.
2. Add mtk_drm_update_new_state into mtk_plane_atomic_async_update to
   update the cursor plane by current plane state hook and add it into 
   mtk_plane_atomic_update to update others plane by the new_state.

Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state pointer")
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 60 ++++++++++++++----------
 2 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 474efb844249..063c75bab3a8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -538,7 +538,6 @@ void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
 	if (!mtk_crtc->enabled)
 		return;
 
-	plane_helper_funcs->atomic_update(plane, state);
 	mtk_drm_crtc_update_config(mtk_crtc, false);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index b5582dcf564c..e6dcb34d3052 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -110,6 +110,35 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 						   true, true);
 }
 
+static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
+				       struct mtk_plane_state *mtk_plane_state)
+{
+	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_gem_object *gem;
+	struct mtk_drm_gem_obj *mtk_gem;
+	unsigned int pitch, format;
+	dma_addr_t addr;
+
+	gem = fb->obj[0];
+	mtk_gem = to_mtk_gem_obj(gem);
+	addr = mtk_gem->dma_addr;
+	pitch = fb->pitches[0];
+	format = fb->format->format;
+
+	addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
+	addr += (new_state->src.y1 >> 16) * pitch;
+
+	mtk_plane_state->pending.enable = true;
+	mtk_plane_state->pending.pitch = pitch;
+	mtk_plane_state->pending.format = format;
+	mtk_plane_state->pending.addr = addr;
+	mtk_plane_state->pending.x = new_state->dst.x1;
+	mtk_plane_state->pending.y = new_state->dst.y1;
+	mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
+	mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
+	mtk_plane_state->pending.rotation = new_state->rotation;
+}
+
 static void mtk_plane_atomic_async_update(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
@@ -126,8 +155,10 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
 	plane->state->src_h = new_state->src_h;
 	plane->state->src_w = new_state->src_w;
 	swap(plane->state->fb, new_state->fb);
-	new_plane_state->pending.async_dirty = true;
 
+	mtk_plane_update_new_state(new_state, new_plane_state);
+	wmb(); /* Make sure the above parameters are set before update */
+	new_plane_state->pending.async_dirty = true;
 	mtk_drm_crtc_async_update(new_state->crtc, plane, state);
 }
 
@@ -189,14 +220,8 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
-	struct drm_crtc *crtc = new_state->crtc;
-	struct drm_framebuffer *fb = new_state->fb;
-	struct drm_gem_object *gem;
-	struct mtk_drm_gem_obj *mtk_gem;
-	unsigned int pitch, format;
-	dma_addr_t addr;
 
-	if (!crtc || WARN_ON(!fb))
+	if (!new_state->crtc || WARN_ON(!new_state->fb))
 		return;
 
 	if (!new_state->visible) {
@@ -204,24 +229,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	gem = fb->obj[0];
-	mtk_gem = to_mtk_gem_obj(gem);
-	addr = mtk_gem->dma_addr;
-	pitch = fb->pitches[0];
-	format = fb->format->format;
-
-	addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
-	addr += (new_state->src.y1 >> 16) * pitch;
-
-	mtk_plane_state->pending.enable = true;
-	mtk_plane_state->pending.pitch = pitch;
-	mtk_plane_state->pending.format = format;
-	mtk_plane_state->pending.addr = addr;
-	mtk_plane_state->pending.x = new_state->dst.x1;
-	mtk_plane_state->pending.y = new_state->dst.y1;
-	mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
-	mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
-	mtk_plane_state->pending.rotation = new_state->rotation;
+	mtk_plane_update_new_state(new_state, mtk_plane_state);
 	wmb(); /* Make sure the above parameters are set before update */
 	mtk_plane_state->pending.dirty = true;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
