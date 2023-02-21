Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDD8C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s5ntdNJViarBOIsrCG6AA+XjorzK95FSO6RilAokGFU=; b=ywMm670Ch9hX5jIzF4z9ZbiGPT
	XoKoMapX6xiyR+7TLpmBAZphJuJ0SjIlKgxbFE8CpyLp7/OyumdD+YOK5x0Eril0RIzlnmr7z5+hm
	aiSb0Hv0ALvT/14sfq83R0e37HCLTvVwk+rlzdIDL8++ynY58RZkRzirleH29dozkuZ+WpBcLFs2C
	9RkuBGtPuohfEka8W5BkR9iboT6d5TsO6L1tWjoW+p040uo/nAB1ktGw5xFqwzDs4eMw5a+zx6VUz
	ocFpnKp5QwMa+QXF6nDQI6RDYZQVVq9/fT/L+hgITPlBXrT4j2TW547jQK+42ULjNM48fiqNcROCt
	vlzqH6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUNlb-0070uH-RT; Tue, 21 Feb 2023 08:12:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUNlY-0070tA-L2; Tue, 21 Feb 2023 08:12:50 +0000
X-UUID: 8358ec54b1bf11eda08d4d6090ec5a5c-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=s5ntdNJViarBOIsrCG6AA+XjorzK95FSO6RilAokGFU=;
	b=HFSzPK+4WAkSDllWh8WDz5HFohDtOzwfOm045tiT5/AhAJyNQV6FeOHrOBS87A0JqK4afCI1f+uIMYrjSrI4e5TbcShuqKo6Q8pdxdomGNYe8uA3eHMygUgrUXv8u0P37zsw6K18dOu748ap1uCWbm+RBqI8on8w6ZkBCDN0mXg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:633fe083-2027-4c7f-90f0-2e4c9ace0839,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:79d03826-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 8358ec54b1bf11eda08d4d6090ec5a5c-20230221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1557443147; Tue, 21 Feb 2023 01:12:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 21 Feb 2023 16:12:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 21 Feb 2023 16:12:25 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v2] drm/mediatek: add dma buffer control for drm plane disable
Date: Tue, 21 Feb 2023 16:12:24 +0800
Message-ID: <20230221081224.23017-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_001248_717918_72BA5A7E 
X-CRM114-Status: GOOD (  15.53  )
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

dma buffer release before overlay disable, that will cause
m4u translation fault warning.

add dma buffer control flow in mediatek driver:
get dma buffer when drm plane disable
put dma buffer when overlay really disable

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 19 +++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 12 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.h |  1 +
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 5071f1263216..ff7924d8a167 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/mailbox_controller.h>
 #include <linux/pm_runtime.h>
@@ -282,6 +283,14 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 	return NULL;
 }
 
+static void mtk_drm_dma_buf_put(struct mtk_plane_state *plane_state)
+{
+	if (plane_state && plane_state->pending.dma_buf) {
+		dma_buf_put(plane_state->pending.dma_buf);
+		plane_state->pending.dma_buf = NULL;
+	}
+}
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
@@ -306,6 +315,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 			plane_state = to_mtk_plane_state(plane->state);
 
 			plane_state->pending.config = false;
+			mtk_drm_dma_buf_put(plane_state);
 		}
 		mtk_crtc->pending_planes = false;
 	}
@@ -318,6 +328,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 			plane_state = to_mtk_plane_state(plane->state);
 
 			plane_state->pending.async_config = false;
+			mtk_drm_dma_buf_put(plane_state);
 		}
 		mtk_crtc->pending_async_planes = false;
 	}
@@ -498,8 +509,10 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			if (!cmdq_handle)
+			if (!cmdq_handle) {
 				plane_state->pending.config = false;
+				mtk_drm_dma_buf_put(plane_state);
+			}
 		}
 
 		if (!cmdq_handle)
@@ -523,8 +536,10 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			if (!cmdq_handle)
+			if (!cmdq_handle) {
 				plane_state->pending.async_config = false;
+				mtk_drm_dma_buf_put(plane_state);
+			}
 		}
 
 		if (!cmdq_handle)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index d54fbf34b000..16495a057c42 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <linux/align.h>
+#include <linux/dma-buf.h>
 
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
@@ -280,6 +281,17 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
+
+	if (old_state && old_state->fb) {
+		struct drm_gem_object *gem = old_state->fb->obj[0];
+
+		if (gem && gem->dma_buf) {
+			get_dma_buf(gem->dma_buf);
+			mtk_plane_state->pending.dma_buf = gem->dma_buf;
+		}
+	}
 	mtk_plane_state->pending.enable = false;
 	wmb(); /* Make sure the above parameter is set before update */
 	mtk_plane_state->pending.dirty = true;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 8f39011cdbfc..b724e56b7283 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -33,6 +33,7 @@ struct mtk_plane_pending_state {
 	bool				async_dirty;
 	bool				async_config;
 	enum drm_color_encoding		color_encoding;
+	struct dma_buf			*dma_buf;
 };
 
 struct mtk_plane_state {
-- 
2.25.1


