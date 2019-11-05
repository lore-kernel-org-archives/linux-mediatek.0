Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B6AC5DF60
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 694922087E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fy4gOloT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="SOht2ohC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 694922087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/HuaZx47wwpdABGwrY5fCSoD/qGMaOXVkf1RbAnOTw=; b=Fy4gOloTze/iCq
	oA1WfwD+8B1z+wbL/As0wAy5nWkBIBUwp6HgB9nKVcm+uJ2ruopM7sZX2+plKIQZwET818AT1jXrM
	rbIJlO+p0K4GEL5mO3nzJjUo249c6RC8JFIUyjymHI/IcZ2nqyYT5Vp33NQ78VG5hvZE3IgVdiKGW
	3IAHJmqElkC20U5veNpyz8+Gs0yUdK2rhYJvNtrvkdzOhqfgqJl16qyrdLW8M74hgMQ5uXvSpNNmo
	mKl22RzEtnnJz14fMVmtB0g5sue1imt/G1RO6yO5sqHAcE9VUbWOXChS1UbYWjt6lAR7yZJCa2NS6
	8+NQabub0lVWfmb67bbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS6Aq-0000yk-SW; Tue, 05 Nov 2019 21:15:36 +0000
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS66L-00030f-Mt
 for linux-mediatek@lists.infradead.org; Tue, 05 Nov 2019 21:11:02 +0000
Received: by mail-yw1-xc44.google.com with SMTP id d5so8825171ywk.9
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Nov 2019 13:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rSYARhN3b2F7BmOpE2cXjpPtSaFQKmzVCGOumhcuwg=;
 b=SOht2ohCjqLrlZPq55rZ3anuMMKFp/QgaSmJhUWGEFjcZ3/AAFfFKH7iOkzM0vgcv3
 W1J6H42pEnK3h94IuJb/CT9RHm5BVz3cAqXX97FID9YTw/D9vO6XoOKwNnFgNiRtdBrT
 ATE0IH8Ay+I9ekaK7yQVtxWDauagErUrCz7Qz5ZUCLhHxtEN8dls/5g4POuA+ug136/H
 MTabTceDtlw2hfiztNZM4KLFVDzh5/zGY4dWp4Owzf7Su0VcbzRxEoPmOlgbsXuy8FCO
 B8RGeds9Qd3QlnkdC7ACFgZPu7XOuk0KOeTmXx3lanPTLV1UrVKtS3PZu/O2wdJjM41B
 6KOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9rSYARhN3b2F7BmOpE2cXjpPtSaFQKmzVCGOumhcuwg=;
 b=RAvJ6uW1g12SnCCV8TUc48x5OxhdxF+ABQmR3RfdCPe5bRzAYL3RDQRS3b9yzYpSJL
 j0yfxPGWEAY1R1j7Kz/TEbLyYmCDz9frQL/1grig/c/aKRhqiP/f3wDSqLnT54wKwtgJ
 H8Ao7YVGA7Pvp9qrk5Q79+cnGaLirHemImRG6jQb/YlTxwHtywHZEaXhs6IRDWsRyX9e
 DaMVVA11iH7XWupJEDtMSJD4mtiTGfia0DXQ3z5VrYV7NtNVHxzOjJyQoonq9ax7p26H
 6jjDrcq0484uMc+cS4+RcGWn+9gw8NShoXjvEzoWBbGz/H9TXYjjxzJvbt5Sn0PmPjLP
 L6Ow==
X-Gm-Message-State: APjAAAVg6CL5j/pj+2kai/neFP2hKi8R2sfiDf8bdT8WFDKi05myoXuH
 /aOr17mjTzr7CnmxlvhQLMzbzw==
X-Google-Smtp-Source: APXvYqwk0F8Xq86aLEEo6QvW5jscZPzVRTRYEBQOJjXehNuiMOKQ4SUnYGK0LLbYQDo3+77/8w4Jtw==
X-Received: by 2002:a0d:f8c6:: with SMTP id
 i189mr24531710ywf.411.1572988255960; 
 Tue, 05 Nov 2019 13:10:55 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j66sm1815216ywb.101.2019.11.05.13.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 13:10:55 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/7] drm/mediatek: Plumb supported rotation values from
 components to plane init
Date: Tue,  5 Nov 2019 16:10:21 -0500
Message-Id: <20191105211034.123937-5-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191105211034.123937-1-sean@poorly.run>
References: <20191105211034.123937-1-sean@poorly.run>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_131057_909080_6C9DA6F7 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: dcastagna@chromium.org, matthias.bgg@gmail.com, mcasas@chromium.org,
 Sean Paul <seanpaul@chromium.org>, p.zabel@pengutronix.de,
 frkoenig@chromium.org, ck.hu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Paul <seanpaul@chromium.org>

This patch adds the ability for components to expose supported rotations
which will be exposed to userspace via a plane rotation property.

No functional changes in this patch.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 10 ++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 12 +++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  4 +++-
 4 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 04e7e4bdbdb5..f80a8ba75977 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -600,13 +600,15 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 					 int comp_idx, int pipe)
 {
 	int num_planes = mtk_drm_crtc_num_comp_planes(mtk_crtc, comp_idx);
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[comp_idx];
 	int i, ret;
 
 	for (i = 0; i < num_planes; i++) {
 		ret = mtk_plane_init(drm_dev,
 				&mtk_crtc->planes[mtk_crtc->layer_nr],
 				BIT(pipe),
-				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr));
+				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
+				mtk_ddp_comp_supported_rotations(comp));
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 3de371e28bdf..2f1e9e75b8da 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -77,6 +77,7 @@ struct mtk_ddp_comp_funcs {
 	void (*stop)(struct mtk_ddp_comp *comp);
 	void (*enable_vblank)(struct mtk_ddp_comp *comp, struct drm_crtc *crtc);
 	void (*disable_vblank)(struct mtk_ddp_comp *comp);
+	unsigned int (*supported_rotations)(struct mtk_ddp_comp *comp);
 	unsigned int (*layer_nr)(struct mtk_ddp_comp *comp);
 	void (*layer_on)(struct mtk_ddp_comp *comp, unsigned int idx);
 	void (*layer_off)(struct mtk_ddp_comp *comp, unsigned int idx);
@@ -133,6 +134,15 @@ static inline void mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp *comp)
 		comp->funcs->disable_vblank(comp);
 }
 
+static inline
+unsigned int mtk_ddp_comp_supported_rotations(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->supported_rotations)
+		return comp->funcs->supported_rotations(comp);
+
+	return 0;
+}
+
 static inline unsigned int mtk_ddp_comp_layer_nr(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->layer_nr)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 58b02fffe321..cd7c97eb7ee6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -138,6 +138,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	state->pending.y = plane->state->dst.y1;
 	state->pending.width = drm_rect_width(&plane->state->dst);
 	state->pending.height = drm_rect_height(&plane->state->dst);
+	state->pending.rotation = plane->state->rotation;
 	wmb(); /* Make sure the above parameters are set before update */
 	state->pending.dirty = true;
 }
@@ -160,7 +161,8 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 };
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
-		   unsigned long possible_crtcs, enum drm_plane_type type)
+		   unsigned long possible_crtcs, enum drm_plane_type type,
+		   unsigned int supported_rotations)
 {
 	int err;
 
@@ -172,6 +174,14 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		return err;
 	}
 
+	if (supported_rotations & ~DRM_MODE_ROTATE_0) {
+		err = drm_plane_create_rotation_property(plane,
+							 DRM_MODE_ROTATE_0,
+							 supported_rotations);
+		if (err)
+			DRM_INFO("Create rotation property failed\n");
+	}
+
 	drm_plane_helper_add(plane, &mtk_plane_helper_funcs);
 
 	return 0;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 6f842df722c7..760885e35b27 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -20,6 +20,7 @@ struct mtk_plane_pending_state {
 	unsigned int			y;
 	unsigned int			width;
 	unsigned int			height;
+	unsigned int			rotation;
 	bool				dirty;
 };
 
@@ -35,6 +36,7 @@ to_mtk_plane_state(struct drm_plane_state *state)
 }
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
-		   unsigned long possible_crtcs, enum drm_plane_type type);
+		   unsigned long possible_crtcs, enum drm_plane_type type,
+		   unsigned int supported_rotations);
 
 #endif
-- 
Sean Paul, Software Engineer, Google / Chromium OS


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
