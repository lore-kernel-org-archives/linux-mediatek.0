Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4011C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:53:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B04160F5E
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B04160F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wknBmZyXhCNKilQWetae7P/5aQYXmMLrwSPG+sX5eCI=; b=IASoUALhM3KFXv
	gov6ucmSW2CTsQgoLh45XOF9Ru7xp6H1hnGP4Gb+1bAZHBMZ2ag9rqv7wxNl6KAZzxqH6BxT9e3Tp
	T7lZTLEX1/9sjQNchJ5HZ2G/3FWtYGaMfgM+HZ1MqPJNMtZvbgAXglK0d4PRykZSze0awsWRoOuoc
	b0FG1z9yQJX6TWIdFUdg6zSrFjA7jlxVJaZivQNo0IOYIyo6GQFWxn3b452M/UgfvJVoTXp05mBMm
	z7QHdge+OBNWMRIWyLPqtvtYusxsZ2dQW7cyJGYFHXR5uoPhmbO5rWeYH5wcXKHrWafzKAywpBTga
	Y9W6IeWsEZQUyJKyVUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYdCW-0015Eb-G6; Thu, 07 Oct 2021 23:53:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYdCR-0015Bt-Fl
 for linux-mediatek@lists.infradead.org; Thu, 07 Oct 2021 23:53:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD9DE60F5E;
 Thu,  7 Oct 2021 23:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633650799;
 bh=Fn7z7KY4TFXmH1LrpPcQgB8HodPs1YPG9mG6x4O+p3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oWdNEgt2WReifKUmudLuS8qpQEKFfbH5AJNhKhq2Tw7fY+DRCExcV4MCTaCKflAES
 59gq97NsyMm2ck39vDdTxeFdRxMdQqvLP+iOhDViBDTGvqQxxtNNO3dLz8uMPhesGm
 ktCunW4eEnryQAtrPtwoS/AlnAI0t0izQGKQAlbaz6aVUubF1nh97z51W9yric5G8z
 NmOlHzu3d/Lhn+R/BcKUKCCjdmN06NkAB20rALI5glMsj1cWQnKhoj/HMPJ9mARqUG
 byvVld/zIU0DEE1AvVf6yicySvUHkABy8RfJav5bCz3yDAvzZ739dMK6CObTUKFvMA
 iygPGJBlAwgNw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 1/5] Revert "drm/mediatek: Clear pending flag when cmdq packet
 is done"
Date: Fri,  8 Oct 2021 07:53:06 +0800
Message-Id: <20211007235310.14626-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007235310.14626-1-chunkuang.hu@kernel.org>
References: <20211007235310.14626-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_165319_582502_F5774622 
X-CRM114-Status: GOOD (  11.28  )
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

This reverts commit 9efb16c2fdd647d3888fd8dae84509f485cd554e.

Commit c1ec54b7b5af
("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
would cause numerous mtk cmdq mailbox driver warning:

WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
cmdq_task_exec_done+0xb8/0xe0

So revert that patch and all the patches depend on that patch.

Reported-by: Enric Balletbo Serra <eballetbo@gmail.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 47 +++----------------------
 1 file changed, 5 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 5f81489fc60c..9840b8d035dc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -267,36 +267,6 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
 	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
-	struct mtk_crtc_state *state;
-	unsigned int i;
-
-	state = to_mtk_crtc_state(mtk_crtc->base.state);
-
-	state->pending_config = false;
-
-	if (mtk_crtc->pending_planes) {
-		for (i = 0; i < mtk_crtc->layer_nr; i++) {
-			struct drm_plane *plane = &mtk_crtc->planes[i];
-			struct mtk_plane_state *plane_state;
-
-			plane_state = to_mtk_plane_state(plane->state);
-
-			plane_state->pending.config = false;
-		}
-		mtk_crtc->pending_planes = false;
-	}
-
-	if (mtk_crtc->pending_async_planes) {
-		for (i = 0; i < mtk_crtc->layer_nr; i++) {
-			struct drm_plane *plane = &mtk_crtc->planes[i];
-			struct mtk_plane_state *plane_state;
-
-			plane_state = to_mtk_plane_state(plane->state);
-
-			plane_state->pending.async_config = false;
-		}
-		mtk_crtc->pending_async_planes = false;
-	}
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
 	mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
@@ -453,8 +423,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				    state->pending_vrefresh, 0,
 				    cmdq_handle);
 
-		if (!cmdq_handle)
-			state->pending_config = false;
+		state->pending_config = false;
 	}
 
 	if (mtk_crtc->pending_planes) {
@@ -474,12 +443,9 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			if (!cmdq_handle)
-				plane_state->pending.config = false;
+			plane_state->pending.config = false;
 		}
-
-		if (!cmdq_handle)
-			mtk_crtc->pending_planes = false;
+		mtk_crtc->pending_planes = false;
 	}
 
 	if (mtk_crtc->pending_async_planes) {
@@ -499,12 +465,9 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			if (!cmdq_handle)
-				plane_state->pending.async_config = false;
+			plane_state->pending.async_config = false;
 		}
-
-		if (!cmdq_handle)
-			mtk_crtc->pending_async_planes = false;
+		mtk_crtc->pending_async_planes = false;
 	}
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
