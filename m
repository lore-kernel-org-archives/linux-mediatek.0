Return-Path: <SRS0=A4vX=IL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D753C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Mar 2021 09:45:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9BC64D73
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Mar 2021 09:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9BC64D73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O5aq9PqU843TW4r43KcZpQE9jIk3xvkKvULP1qtb/VI=; b=rGdkevMGd660+I7CoXPPVx5T/z
	AhD7ppAXCFzRWy0P0rF9cDzETjsAd8XmGXXyaMV4rq11URYPb0QGyYV3Zo4ulsxs7QxEvkgL+8X7a
	pNkEj2OwrwC5E78rbZ+x9v1DQJm2bVYM4NWw5SQ837NmTSkCGjyzMVOhNKHbkJrxzSEUuqr04AKX0
	FpIcdq6r0vWfMuT9Xdid/fsh8FyRRrTfop5hI33jPKuPEBMOF2HAguVoU9aE7SFPOl/o0QOoghv7R
	RjvYiwAxPWaFMJz1x1kDJCE2YQSySHHgu446+xUSQpGvpidHkouRDW/0qkxR0ufM0X9hx1uNGgZvK
	2D3cLn2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lL0oZ-00D5M4-FA; Sat, 13 Mar 2021 09:44:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lL0oT-00D5Kb-4b
 for linux-mediatek@lists.infradead.org; Sat, 13 Mar 2021 09:44:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B397164F14;
 Sat, 13 Mar 2021 09:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615628635;
 bh=ymSvKKXkySAaTw1aQJH2nwYOEfn49ej0hD436KOzGgI=;
 h=From:To:Cc:Subject:Date:From;
 b=SpKwZx/ivwzE7HQSnOwj8SeoRatPxhdPr1nx2eUwahvYS4f2DYeKZnO+Ab4W6TLhO
 vSl7Vufuuj8vFSdi9MVYZosTRUvH7xDO5fsQn3l4wHt55E4QVQ9OUD/JWQ7GyzDkN7
 /EH/uYfVJhfpIdmHn+SWWYdKgdBm1kvgZtDk7vI8awzLBFITpts/K1G7ME+psbXPCU
 BsXxDc1ViTiBas6bdMJ/ZwlF+51ZyxPZ9BhrG06s3jZ50JWbXKuJ0ya/nqsxMGVTWI
 6pHnQLpjC7GdQObrJamifYaKhNsmEM1Zw7Z82dVmh+6qiErGIYRuEa2Kk8t0vukNWn
 YLmbec9AeLltA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: crtc: Make config-updating atomic
Date: Sat, 13 Mar 2021 17:43:31 +0800
Message-Id: <20210313094331.26374-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_094402_254249_254D75D4 
X-CRM114-Status: GOOD (  11.26  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

While updating config, the irq would occur and get the partial
config, so use variable config_updating to make updating atomic.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 8b0de90156c6..870f66210848 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -61,6 +61,7 @@ struct mtk_drm_crtc {
 
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
+	bool				config_updating;
 };
 
 struct mtk_crtc_state {
@@ -97,7 +98,7 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 {
 	drm_crtc_handle_vblank(&mtk_crtc->base);
-	if (mtk_crtc->pending_needs_vblank) {
+	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
 		mtk_drm_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
 	}
@@ -425,7 +426,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 	}
 }
 
-static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
+static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
+				       bool needs_vblank)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct cmdq_pkt *cmdq_handle;
@@ -436,6 +438,10 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 	int i;
 
 	mutex_lock(&mtk_crtc->hw_lock);
+	mtk_crtc->config_updating = true;
+	if (needs_vblank)
+		mtk_crtc->pending_needs_vblank = true;
+
 	for (i = 0; i < mtk_crtc->layer_nr; i++) {
 		struct drm_plane *plane = &mtk_crtc->planes[i];
 		struct mtk_plane_state *plane_state;
@@ -472,6 +478,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
 	}
 #endif
+	mtk_crtc->config_updating = false;
 	mutex_unlock(&mtk_crtc->hw_lock);
 }
 
@@ -532,7 +539,7 @@ void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
 		return;
 
 	plane_helper_funcs->atomic_update(plane, new_state);
-	mtk_drm_crtc_hw_config(mtk_crtc);
+	mtk_drm_crtc_update_config(mtk_crtc, false);
 }
 
 static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -582,7 +589,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 	mtk_crtc->pending_planes = true;
 
-	mtk_drm_crtc_hw_config(mtk_crtc);
+	mtk_drm_crtc_update_config(mtk_crtc, false);
 	/* Wait for planes to be disabled */
 	drm_crtc_wait_one_vblank(crtc);
 
@@ -618,14 +625,12 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	int i;
 
-	if (mtk_crtc->event)
-		mtk_crtc->pending_needs_vblank = true;
 	if (crtc->state->color_mgmt_changed)
 		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
 			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
 		}
-	mtk_drm_crtc_hw_config(mtk_crtc);
+	mtk_drm_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
 }
 
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
