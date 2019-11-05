Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0D6C5DF60
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:14:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B3652087E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:14:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JV10546x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="XA/fs7qg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B3652087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDSkvLx14maCaO9G6oiSeQFRPiMo297B4gvE65fF8zQ=; b=JV10546xhNQk/L
	M7h5lLY9yb7CIdg7UenWztnoPFLf+3QNpWJxr5oQDVEDypDnRST7wmCwJgOQR00QusOmKXgFC1Nvn
	A2Um016uq2n89ci+FsAvQXmWIsMjzAy+7r7gFegnI2a0pS+VLls3y7xzaNnlR5bmevHaP23NGR6jY
	S20EyfuSnrITtBtYufYXdlMO/NGMNQjQIS5vsu+J05Om3QlX3B3fRmAXMaRJSOdVsqok3BHWm/KmY
	FwFE05T2nsa8tn8D4+A/wBg79/Oh/N6zh7rL6evjWX5b8dzC78Qx/xEabjJ6/nKZSuQjPmtdqhAU6
	BhfJjQfwSnD7z9x2FkzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS6A6-0007Sg-Rg; Tue, 05 Nov 2019 21:14:50 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS66H-0002uV-Me
 for linux-mediatek@lists.infradead.org; Tue, 05 Nov 2019 21:10:55 +0000
Received: by mail-yb1-xb41.google.com with SMTP id r201so1676711ybc.10
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Nov 2019 13:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ta1Xwfa+QeAgFSaukNPJQ5uJyx0Z9KTcb0vCHsmGyFQ=;
 b=XA/fs7qgEdfJZML+yaAQj0RuclIsRF7Ra54ebOTOISjSJsvFenImCTBE6H+Tya5FKp
 YlAwTnFfG8ezZMDaqA0HJZikqdEHYac7VFwjzlzBpKZ4sG3lqdDZqtpWWJiMkD/T6x3X
 EFSD8vOEyexf+Odjr1tXCZa9CX35E54Jm5ooFUlPNOVyFOSa9IljuapxUFX2L2ySKvlw
 8AZp/urnvC+xMC+E0XaBzF2do4tcNa1YV+RS2fyLicN1Biz6DJQ019Cj8AHzPAnMGFeS
 PGwJf4Rmu/viUbcl2eIoqpebK0yG/Xg5GgEryWs7INnvw46teyCbUNsZuZj8S1dKmTSD
 MCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ta1Xwfa+QeAgFSaukNPJQ5uJyx0Z9KTcb0vCHsmGyFQ=;
 b=MANlMjv+QWQfT8NO995Sorq4o2qgpHXnV1e4cU1IuuKWMjxjibo+8kPIdn8COXS9CI
 9isT1nI+x+9pf0RHMzsnF9Fy2mXGUD9oDotxBGbhmmeM6L708Ll0M8kpZq3Z9efD/jwj
 LqVJwomEo7/vTFQvJx/t34jVGepct4Cry1oHVJn414oKM1gslPt2r0JnVoeVdKa/A9Et
 B6ZNBHDJlMcKLExh5d0ARdb7PYGs65wfvIbmY+DXafxMLwUNoaZejMldPURP/fHrr4iA
 0THKi/0Vv72MSEFRMu4ba9l2aUeSKl/xKpbQNjyufnXIsIZulqwODHXmIfkbzK8JVhx+
 +B7w==
X-Gm-Message-State: APjAAAUHFHbZFDeAeamoOj84PCcd/6UcTXnuz2RxKAMCctbwgFCT0htu
 tcXR4p98VIyWKgpAxJQsqe139A==
X-Google-Smtp-Source: APXvYqylGH6ZNkY6K1tLbHFtvCxKxcHMgw9PDG6CbQLvQSvJUEARUn/PSgkolxKP8MpBrxfh0FKWzw==
X-Received: by 2002:a25:cc84:: with SMTP id
 l126mr28076860ybf.249.1572988252193; 
 Tue, 05 Nov 2019 13:10:52 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j66sm1815216ywb.101.2019.11.05.13.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 13:10:51 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/7] drm/mediatek: Add helper to get component for a plane
Date: Tue,  5 Nov 2019 16:10:19 -0500
Message-Id: <20191105211034.123937-3-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191105211034.123937-1-sean@poorly.run>
References: <20191105211034.123937-1-sean@poorly.run>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_131053_762060_6476BD37 
X-CRM114-Status: GOOD (  11.98  )
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

Instead of hard-coding which components have planes, add a helper
function to walk the components and map a plane index to a component
layer.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 56 +++++++++++++++----------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 7d0f50da8e40..ccf395f17a99 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -207,6 +207,28 @@ static void mtk_crtc_ddp_clk_disable(struct mtk_drm_crtc *mtk_crtc)
 		clk_disable_unprepare(mtk_crtc->ddp_comp[i]->clk);
 }
 
+static
+struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
+						struct drm_plane *plane,
+						unsigned int *local_layer)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_ddp_comp *comp;
+	int i, count = 0;
+
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		comp = mtk_crtc->ddp_comp[i];
+		if (plane->index < (count + mtk_ddp_comp_layer_nr(comp))) {
+			*local_layer = plane->index - count;
+			return comp;
+		}
+		count += mtk_ddp_comp_layer_nr(comp);
+	}
+
+	WARN(1, "Failed to find component for plane %d\n", plane->index);
+	return NULL;
+}
+
 static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 {
 	struct drm_crtc *crtc = &mtk_crtc->base;
@@ -283,19 +305,12 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 	for (i = 0; i < mtk_crtc->layer_nr; i++) {
 		struct drm_plane *plane = &mtk_crtc->planes[i];
 		struct mtk_plane_state *plane_state;
-		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-		unsigned int comp_layer_nr = mtk_ddp_comp_layer_nr(comp);
+		struct mtk_ddp_comp *comp;
 		unsigned int local_layer;
 
 		plane_state = to_mtk_plane_state(plane->state);
-
-		if (i >= comp_layer_nr) {
-			comp = mtk_crtc->ddp_comp[1];
-			local_layer = i - comp_layer_nr;
-		} else
-			local_layer = i;
-		mtk_ddp_comp_layer_config(comp, local_layer,
-					  plane_state);
+		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
+		mtk_ddp_comp_layer_config(comp, local_layer, plane_state);
 	}
 
 	return 0;
@@ -343,7 +358,6 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
 	unsigned int i;
-	unsigned int comp_layer_nr = mtk_ddp_comp_layer_nr(comp);
 	unsigned int local_layer;
 
 	/*
@@ -366,17 +380,15 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
 
 			plane_state = to_mtk_plane_state(plane->state);
 
-			if (plane_state->pending.config) {
-				if (i >= comp_layer_nr) {
-					comp = mtk_crtc->ddp_comp[1];
-					local_layer = i - comp_layer_nr;
-				} else
-					local_layer = i;
-
-				mtk_ddp_comp_layer_config(comp, local_layer,
-							  plane_state);
-				plane_state->pending.config = false;
-			}
+			if (!plane_state->pending.config)
+				continue;
+
+			comp = mtk_drm_ddp_comp_for_plane(crtc, plane,
+							  &local_layer);
+
+			mtk_ddp_comp_layer_config(comp, local_layer,
+						  plane_state);
+			plane_state->pending.config = false;
 		}
 		mtk_crtc->pending_planes = false;
 	}
-- 
Sean Paul, Software Engineer, Google / Chromium OS


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
