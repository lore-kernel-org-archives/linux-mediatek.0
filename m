Return-Path: <SRS0=lfsG=J4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071A1C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 May 2021 03:24:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55D3C61418
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 May 2021 03:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55D3C61418
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NxU/DsyRjIHHQIw5qAgNI0JsYDc3UjUQuTVyt+4mS/8=; b=CSnxXa/ebT70EYEcwpMMqKPs/
	OGYJCMVlZuvfi57d6V4+m4WJ9ZdUNlQnQmbrlaRvXdtCENJPAxJwcZdOK9cdvYZGuICnKXw0V3ZPb
	h5czghI+WZk0vgrOhEHzlRDInclwGFSkxlBr4vkbkO2ShU+JqR5FTS6VjAAto4qUKxf0rQ5gdkVvI
	qvoYAjoYc6s4YvoNcI7uRwnwnK4z4v8ac3sPMo2xZ/RnufuhSgguiu9Hu7waXENuGelmB1uN/AI8g
	STf1vbqVkr8wM4HsVrS4z3kEJq0qI7+jmfFyJbO9JE4l3WEA4OzVqwi/HbT98hI3F0+3f5wty31Mq
	1c8iGvsZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcgEj-009HxX-Hb; Sat, 01 May 2021 03:24:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcgEU-009Hwy-EM; Sat, 01 May 2021 03:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=VuQrAV0LwHjeksBrQIpEwylTZUoNtZrCFM9m6C9/ios=; b=tZRdzkSp5lhnRt9B7XG2/1mdIa
 n8YU4WAXXBNkpQvlnETsNQGVN7xHt2p36pd95qpn00Dfb9DLExOFL7j1r2X/g5uLfRF8AaFLlGHy7
 xT55jB3B2BJ7Wgfpb9UWdaTlrVruFho33cmIak3oNfYgrGuvDyRq+jUuqxubaoQqHkkhi485sVc01
 GIB3wJt+CkaO5roq1aA7Ax3HfFVYjKwUzurSLzRfDHu9603mp4mob0bG3R2QYTN1ATl9lvxn5XweQ
 ojYsjgRgD4ZZuPrcDYJ8bb3vXuJx45gZttet8NtqqjJHvnKQxgKQAZsj04bLvcT432qn+LCm6WDI/
 158Bq2jw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcgEQ-001nXl-CH; Sat, 01 May 2021 03:23:51 +0000
X-UUID: b80d6165eba84a5393e56d81833e261d-20210430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VuQrAV0LwHjeksBrQIpEwylTZUoNtZrCFM9m6C9/ios=; 
 b=GO0SCz1KHyuUffCVIsK0tmOEi0Iyl6vameIX/5Kjp5/eY2cMsCFW/NANoRrEptJE8kbgkOipLKAnVcWz6elFVASli2COe2p8Bgzyd7oDaf3JykH6LTZa1fU7n7h/WlponxubvGuls/Fism6BqFWvrIloAWjfDfnbaEv3CJ4GV3c=;
X-UUID: b80d6165eba84a5393e56d81833e261d-20210430
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2080497259; Fri, 30 Apr 2021 20:23:48 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Apr 2021 20:13:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 1 May 2021 11:13:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 1 May 2021 11:13:43 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Hung Wu
 <chun-hung.wu@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, "CK
 Hu" <ck.hu@mediatek.com>
Subject: [PATCH 2/2] drm/mediatek: clear pending flag when cmdq packet is done.
Date: Sat, 1 May 2021 11:13:39 +0800
Message-ID: <1619838819-11309-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1619838819-11309-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1619838819-11309-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_202350_446575_52CF8377 
X-CRM114-Status: GOOD (  14.45  )
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
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 57 ++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index c37881b..6a3cf47 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -231,18 +231,57 @@ static void ddp_cmdq_cb(struct cmdq_cb_data data)
 {
 	struct mtk_cmdq_cb_data *cb_data = data.data;
 	struct mtk_drm_crtc *mtk_crtc;
+	struct mtk_crtc_state *state;
+	unsigned int i;
 
 	if (!cb_data) {
 		DRM_ERROR("cmdq callback data is null pointer!\n");
 		return;
 	}
 
+	if (data.sta == CMDQ_CB_ERROR) {
+		DRM_WARN("cmdq callback error!!\n");
+		goto destroy_pkt;
+	}
+
 	mtk_crtc = cb_data->mtk_crtc;
 	if (!mtk_crtc) {
 		DRM_ERROR("cmdq callback mtk_crtc is null pointer!\n");
 		goto destroy_pkt;
 	}
 
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
 	mtk_drm_finish_page_flip(mtk_crtc);
 
 destroy_pkt:
@@ -403,7 +442,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				    state->pending_vrefresh, 0,
 				    cmdq_handle);
 
-		state->pending_config = false;
+		if (!cmdq_handle)
+			state->pending_config = false;
 	}
 
 	if (mtk_crtc->pending_planes) {
@@ -423,9 +463,12 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
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
@@ -445,9 +488,13 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
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
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
