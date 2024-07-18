Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A407BC3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nZ0QNKGzaJ5A/qrGDPucxbJvj/Nq+tnTMnYApQ7H/qY=; b=GDUZ9xVwHMWl2a0mxmZ8pOpHRk
	8V5xieC7rLJaQABU3nt5mSGJRCotdWqmjADfb+VOAIi9Bn+SUqhgDvZ8YKRrrGQDn0Fh1jbSXHrZ3
	AGARGfsRTyVoCe64jMC08JhDTickQrZ7ox+NsGOyHozRppNzB3UahvaS/pvOsJ3F0/sjjqXthomcP
	ugw4kfM8aA4Flv2RR9CmwMz70slLOdrE3Lpfl3w2xqKps5WbyQYVB2pL7H717e+F3At1V60wyz7SE
	+G1801T2uQnc3ycunpAq8f+dqMeXkhwOr0rJeFvdBgZ7hovUISZRaGhzG/K07u5vHWfUg29pFSyuK
	nFBWc03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMSO-0000000GNUp-15mA;
	Thu, 18 Jul 2024 08:25:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMS0-0000000GNM3-3oUk;
	Thu, 18 Jul 2024 08:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721291119;
	bh=89eygFmnv7fnoScWyve+SwrE7rlZmWG+C4XF1WW1nLE=;
	h=From:To:Cc:Subject:Date:From;
	b=2v0nAgkIbSzaxpv1BTleKVSzfGwm1gJxuZE2JJSLnsiCUcLYI+frzTvgvAKan+bth
	 uHmmKOVbMuiYnzxMx1ecPgENRdMUmiTEmhugyKykbHMKJtdPt9+LV+e/8NZeIac9pB
	 bD1o25H0rd1INIF64BiIl4gG2/tClhnSvz7IKoIwcpXBYB9vb/YtXlXntDnTuG1k6O
	 BwPUY4DGIIGY9MmhZBmSi6Sw5jNWbOWQ1nIHcUU1Ao5qHkMn170ZIeKK8gTREbmkVn
	 DrmN9m5RLR9ODnnIexicR+ow8raLbkzCwC67n5cLPWHTP0Ta4oWu6rQOs2/K6has8Q
	 TggjAYnqFPOoQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B06A43782167;
	Thu, 18 Jul 2024 08:25:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	shawn.sung@mediatek.com,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] drm/mediatek: Declare Z Position for all planes
Date: Thu, 18 Jul 2024 10:25:07 +0200
Message-ID: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_012521_104338_FBC9EDF4 
X-CRM114-Status: GOOD (  16.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MediaTek SoCs support multiple planes, one of which is the primary
and all the others are overlays (and CURSOR is the last overlay).

In all currently supported SoCs, the Z order of the overlays can't
be changed with any fast muxing action, and can only be changed by
swapping the contents of the entire register set of one overlay
with the other to internally reorder the layer properties, which
is indeed feasible, but probably more expensive than desired.

Declare the Z position for all planes with an immutable property
at least for now, so that the userspace can take its decisions
accordingly.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c  |  2 +-
 drivers/gpu/drm/mediatek/mtk_plane.c | 18 +++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_plane.h |  3 +--
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 072b2fdae87b..327214721b4d 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -874,7 +874,7 @@ static int mtk_crtc_init_comp_planes(struct drm_device *drm_dev,
 				mtk_crtc_plane_type(mtk_crtc->layer_nr, num_planes),
 				mtk_ddp_comp_supported_rotations(comp),
 				mtk_ddp_comp_get_formats(comp),
-				mtk_ddp_comp_get_num_formats(comp));
+				mtk_ddp_comp_get_num_formats(comp), i);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 5bf757a3ef20..7d2cb4e0fafa 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -321,7 +321,7 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
 		   unsigned int supported_rotations, const u32 *formats,
-		   size_t num_formats)
+		   size_t num_formats, unsigned int plane_idx)
 {
 	int err;
 
@@ -338,6 +338,22 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		return err;
 	}
 
+	/*
+	 * The hardware does not support repositioning planes by muxing: their
+	 * Z-position is infact fixed and the only way to change the actual
+	 * order is to swap the contents of the entire register set of one
+	 * overlay with another, which may be more expensive than desired.
+	 *
+	 * With no repositioning, the caller of this function guarantees that
+	 * the plane_idx is correct. This means that, for example, the PRIMARY
+	 * plane fed to this function will always have plane_idx zero.
+	 */
+	err = drm_plane_create_zpos_immutable_property(plane, plane_idx);
+	if (err) {
+		DRM_ERROR("Failed to create zpos property for plane %u\n", plane_idx);
+		return err;
+	}
+
 	if (supported_rotations) {
 		err = drm_plane_create_rotation_property(plane,
 							 DRM_MODE_ROTATE_0,
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/mediatek/mtk_plane.h
index 231bb7aac947..5b177eac67b7 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_plane.h
@@ -49,6 +49,5 @@ to_mtk_plane_state(struct drm_plane_state *state)
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
 		   unsigned int supported_rotations, const u32 *formats,
-		   size_t num_formats);
-
+		   size_t num_formats, unsigned int plane_idx);
 #endif
-- 
2.45.2


