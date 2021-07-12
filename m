Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367FCC07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:52:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06F40613E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06F40613E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+tfnDZIrYqywQ8XK6cqbI5rFytxG1OGAPmioode4v0=; b=Yg5ZRljzOILfYo
	NSJGamTPlgxDhtVFSFNAudmSipuLBqxkGdZZC+kXr4UyNM/Gwq+MrDQzJJmTd77hGKoOwNRRPMijJ
	IScLxvE0plicd7XXLv1KsYPLEzG9MOim+6NULMKbQOtlOlhjJWc0eeJRBearKSDvb+fhx9kduhHLK
	qcQw/8kj8Py3Jbya3NnIGJ8nMheBylZfB2NPD9PBQhSktIEky1xOjTgk8nt2el16kHOMvk2y9VtQ5
	R5dgFgDR1NCIC3eYAi8MEX0YtuPfju2noCbDSyXcd1nS/kqkxfVPlJlEu//vR225YDUR03vbecc+g
	ecVdS+G7+0myn8Dh54wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2pne-006BGU-Cj; Mon, 12 Jul 2021 06:52:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2pnQ-006BDy-O0; Mon, 12 Jul 2021 06:52:06 +0000
X-UUID: 10b59a08d1984dedb1ffdbe6c53bd620-20210711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qu+fH7fiRaxHFEOGBp+mJoO9MDWCamNkAGASLR1fY3Q=; 
 b=NKvEojQaRJS75ig7Y2Eca6BhWhVcE7DJHQ48t9O9rN1pKthkAWzje8fwElUuAZv/NTZcByby9+M1XGYsDQ53AtnCVvSkxI7Qie+mvJJWHxTyc+A02ZjXU7+aQsDsOT5o6PjE+/1DIAw+izRJaQ6Bb8W1IYXDuIBSRIxrfJLBjas=;
X-UUID: 10b59a08d1984dedb1ffdbe6c53bd620-20210711
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 11197100; Sun, 11 Jul 2021 23:52:02 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Jul 2021 23:42:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 14:41:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Jul 2021 14:41:52 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v2] drm/mediatek: clear pending flag when cmdq packet is done.
Date: Mon, 12 Jul 2021 14:41:49 +0800
Message-ID: <1626072109-2657-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1626072109-2657-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1626072109-2657-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_235204_835806_D3FA1F89 
X-CRM114-Status: GOOD (  15.94  )
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

In cmdq mode, packet may be flushed before it is executed, so
the pending flag should be cleared after cmdq packet is done.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 92 ++++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 40df2c8..8cd107b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -73,6 +73,13 @@ struct mtk_crtc_state {
 	unsigned int			pending_vrefresh;
 };
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+struct mtk_cmdq_cb_data {
+	struct cmdq_pkt			*cmdq_handle;
+	struct mtk_drm_crtc		*mtk_crtc;
+};
+#endif
+
 static inline struct mtk_drm_crtc *to_mtk_crtc(struct drm_crtc *c)
 {
 	return container_of(c, struct mtk_drm_crtc, base);
@@ -224,7 +231,64 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct cmdq_cb_data data)
 {
-	cmdq_pkt_destroy(data.data);
+	struct mtk_cmdq_cb_data *cb_data = data.data;
+	struct mtk_drm_crtc *mtk_crtc;
+	struct mtk_crtc_state *state;
+	unsigned int i;
+
+	if (!cb_data) {
+		DRM_ERROR("cmdq callback data is null pointer!\n");
+		return;
+	}
+
+	if (data.sta != 0) {
+		DRM_WARN("cmdq callback error %d!!\n", data.sta);
+		goto destroy_pkt;
+	}
+
+	mtk_crtc = cb_data->mtk_crtc;
+	if (!mtk_crtc) {
+		DRM_ERROR("cmdq callback mtk_crtc is null pointer!\n");
+		goto destroy_pkt;
+	}
+
+	state = to_mtk_crtc_state(mtk_crtc->base.state);
+
+	if (state->pending_config) {
+		state->pending_config = false;
+	}
+
+	if (mtk_crtc->pending_planes) {
+		for (i = 0; i < mtk_crtc->layer_nr; i++) {
+			struct drm_plane *plane = &mtk_crtc->planes[i];
+			struct mtk_plane_state *plane_state;
+
+			plane_state = to_mtk_plane_state(plane->state);
+
+			if (plane_state->pending.config)
+				plane_state->pending.config = false;
+		}
+		mtk_crtc->pending_planes = false;
+	}
+
+	if (mtk_crtc->pending_async_planes) {
+		for (i = 0; i < mtk_crtc->layer_nr; i++) {
+			struct drm_plane *plane = &mtk_crtc->planes[i];
+			struct mtk_plane_state *plane_state;
+
+			plane_state = to_mtk_plane_state(plane->state);
+
+			if (plane_state->pending.async_config)
+				plane_state->pending.async_config = false;
+		}
+		mtk_crtc->pending_async_planes = false;
+	}
+
+destroy_pkt:
+	if (cb_data->cmdq_handle)
+		cmdq_pkt_destroy(cb_data->cmdq_handle);
+
+	kfree(cb_data);
 }
 #endif
 
@@ -378,7 +442,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				    state->pending_vrefresh, 0,
 				    cmdq_handle);
 
-		state->pending_config = false;
+		if (!cmdq_handle)
+			state->pending_config = false;
 	}
 
 	if (mtk_crtc->pending_planes) {
@@ -398,9 +463,12 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			plane_state->pending.config = false;
+			if (!cmdq_handle)
+				plane_state->pending.config = false;
 		}
-		mtk_crtc->pending_planes = false;
+
+		if (!cmdq_handle)
+			mtk_crtc->pending_planes = false;
 	}
 
 	if (mtk_crtc->pending_async_planes) {
@@ -420,9 +488,13 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			plane_state->pending.async_config = false;
+
+			if (!cmdq_handle)
+				plane_state->pending.async_config = false;
 		}
-		mtk_crtc->pending_async_planes = false;
+
+		if (!cmdq_handle)
+			mtk_crtc->pending_async_planes = false;
 	}
 }
 
@@ -469,13 +541,19 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (mtk_crtc->cmdq_client) {
+		struct mtk_cmdq_cb_data *cb_data;
+
 		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
 		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
+
+		cb_data = kmalloc(sizeof(*cb_data), GFP_KERNEL);
+		cb_data->cmdq_handle = cmdq_handle;
+		cb_data->mtk_crtc = mtk_crtc;
+		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cb_data);
 	}
 #endif
 	mtk_crtc->config_updating = false;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
