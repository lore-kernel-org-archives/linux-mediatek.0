Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DA2C001DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Aug 2023 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/KTqwPYHXtpoGBRquaClm3SGFQV5jdQqQch2mviivQ=; b=odUTQjfBAvW0Lysgodre5+FB+S
	ijBkFz4L9pV+aQXiixNQBe5zlZHGy/UnAj1NGQDdXD1DENC/XGxQhjUDAwRWFXZrTt8i128Z+h2F3
	oAuipAuWijmpNaqVOEHZijfLJQhDd2bw8QcOXz2jezTApX7jV2R8vrSuNdkaHTy64ZWJ48RxbcK+H
	bo9R6JOmmGmHv1dzp6ehOJLUMCqe5TuFWa/eon+uUu39deitHKe3iV+kqm4Uu+fISIlnJVo/S837u
	CGHqb6JhMj2blzZpEfN7fdxqJH423w/X5yw8Mcei5FRQtqJiXOCc17M5falZbcIoVSnYJ8PKUJi4W
	rMj9Kk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSHnI-00ECpS-2I;
	Sat, 05 Aug 2023 13:58:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSHnD-00ECnl-1t;
	Sat, 05 Aug 2023 13:58:09 +0000
X-UUID: 17b5fc66339811ee912e1518a6540028-20230805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w/KTqwPYHXtpoGBRquaClm3SGFQV5jdQqQch2mviivQ=;
	b=H+mZdvZDal2qFrJhglvBp68dIdmH/CyrzjZlEk8UvxLuNItkVuDGOzVCwmgcIi5t3vusJ/4Jr+MGEOT9Vqi0cewieNVg+vtTtDaurWO/uCVkU3PuSEGkDKR5/kHD+/P4ppY3KrcEKyyC4WKk3FrZIl1xagPjZxpR4f8pwP+o4xo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:623f79e0-f524-4bbb-98d5-7334ed54c684,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:31a62db4-a467-4aa9-9e04-f584452e3794,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 17b5fc66339811ee912e1518a6540028-20230805
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 586244044; Sat, 05 Aug 2023 06:58:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 5 Aug 2023 21:57:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 5 Aug 2023 21:57:59 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Date: Sat, 5 Aug 2023 21:57:57 +0800
Message-ID: <20230805135757.6625-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230805135757.6625-1-jason-jh.lin@mediatek.com>
References: <20230805135757.6625-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_065807_676675_E31EE9E5 
X-CRM114-Status: GOOD (  14.54  )
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

The plane_state of drm_atomic_state is not sync to the mtk_plane_state
stored in mtk_crtc during crtc enabling.

So we need to update the mtk_plane_state stored in mtk_crtc by the
drm_atomic_state carried from mtk_drm_crtc_atomic_enable().

While updating mtk_plane_state, OVL layer should be disabled when the fb
in plane_state of drm_atomic_state is NULL.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 15 +++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 11 ++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 ++
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..06f34b304dca 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -328,7 +328,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 }
 #endif
 
-static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
+static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct drm_connector *connector;
@@ -405,11 +405,18 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 	/* Initially configure all planes */
 	for (i = 0; i < mtk_crtc->layer_nr; i++) {
 		struct drm_plane *plane = &mtk_crtc->planes[i];
-		struct mtk_plane_state *plane_state;
+		struct drm_plane_state *new_state;
+		struct mtk_plane_state *plane_state = to_mtk_plane_state(plane->state);
 		struct mtk_ddp_comp *comp;
 		unsigned int local_layer;
 
-		plane_state = to_mtk_plane_state(plane->state);
+		/* sync the new plane state from drm_atomic_state */
+		if (state->planes[i].ptr) {
+			new_state = drm_atomic_get_new_plane_state(state, state->planes[i].ptr);
+			plane_state = to_mtk_plane_state(mtk_crtc->planes[i].state);
+			mtk_plane_update_new_state(new_state, plane_state);
+		}
+
 		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
 		if (comp)
 			mtk_ddp_comp_layer_config(comp, local_layer,
@@ -687,7 +694,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
-	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
+	ret = mtk_crtc_ddp_hw_init(mtk_crtc, state);
 	if (ret) {
 		pm_runtime_put(comp->dev);
 		return;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index b1a918ffe457..ef4460f98c07 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -134,8 +134,8 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 						   true, true);
 }
 
-static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
-				       struct mtk_plane_state *mtk_plane_state)
+void mtk_plane_update_new_state(struct drm_plane_state *new_state,
+				struct mtk_plane_state *mtk_plane_state)
 {
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_object *gem;
@@ -146,6 +146,11 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	dma_addr_t hdr_addr = 0;
 	unsigned int hdr_pitch = 0;
 
+	if (!fb) {
+		mtk_plane_state->pending.enable = false;
+		return;
+	}
+
 	gem = fb->obj[0];
 	mtk_gem = to_mtk_gem_obj(gem);
 	addr = mtk_gem->dma_addr;
@@ -180,7 +185,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
 	}
 
-	mtk_plane_state->pending.enable = true;
+	mtk_plane_state->pending.enable = new_state->visible;
 	mtk_plane_state->pending.pitch = pitch;
 	mtk_plane_state->pending.hdr_pitch = hdr_pitch;
 	mtk_plane_state->pending.format = format;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 99aff7da0831..0a7d70d13e43 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -46,6 +46,8 @@ to_mtk_plane_state(struct drm_plane_state *state)
 	return container_of(state, struct mtk_plane_state, base);
 }
 
+void mtk_plane_update_new_state(struct drm_plane_state *new_state,
+				struct mtk_plane_state *mtk_plane_state);
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
 		   unsigned int supported_rotations, const u32 *formats,
-- 
2.18.0


