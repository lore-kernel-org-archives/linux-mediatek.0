Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23462C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:18:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07E322D74
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07E322D74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/y4xtL8R/WmMuYSpA1D+WnbYTcCHdam/+dyMtdtPPiU=; b=VILVLicMUjNa4F8xvX4y9sQMLS
	4hm9zC4WYmRubQ3MJRM3ulRxTXtCZzbn/y9/6WVy6IZSiO7rZ9M/e2tb2DdktZ1yy+tufPzZfVntz
	6rfDC9xYZ3c2mweb4m+z3zTu26pz+rvQBijQZSuWF5F5qOqiop59Oa71MXuIsGeyObrWQpBWJVXyF
	JEqnn3uG+OdN5M1k77xDrWJ+kv2ApVR5U7hokbOZ76w+uXVgy5vTPcqwxWkPt3fp6dxz10gmL6VO7
	d8mgJJULaPs19Yuxcp8lP6o+6/qmpXQjvuKNQyzni7YWo0+Ba99Sb/Q0bNWNo4VhmQ2IzqXqacb37
	UieNOuoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxI4H-0003sU-Qv; Wed, 06 Jan 2021 23:18:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxI3o-0003fv-K9; Wed, 06 Jan 2021 23:17:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00D422333C;
 Wed,  6 Jan 2021 23:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609975067;
 bh=r27Vj/voz22uOFt6pt8tkfK5I1iQpalF/T3j5c4SrVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JYytbgxzXqernG57j5f4LYEqFJCsYllR3munrVz5WuKuZdGqEAHfc7KuwDLpI48Rh
 CVVU+VjMIOyTlxux6KOhEtNz46hx2e3Dmhmh+zSlTTsF/iRKHuyotYAWdY4r9oUBpx
 Rv7GomhhJnqBubtaGw1u/0Gf4RaRhh9ul1awcXbjoNHjDQurIOLRUVqKRgo1oPNSto
 wxOOaIcb4w9k5dYvyglwvzY7pORCqryMmH/rsiIRqLaZJUCY40IyVGhAihoUV9kbNo
 yjTtYFZ11PaG7LuVR2Mk/BJ5bJyGIEjOrL+8dyT13V85nL7YCppW2SZ7FTBdSJ4TeZ
 FMiNZFo3iVDuA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 4/5] drm/mediatek: Automatically search unclaimed mtk mutex
 in mtk_mutex_get()
Date: Thu,  7 Jan 2021 07:17:28 +0800
Message-Id: <20210106231729.17173-5-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106231729.17173-1-chunkuang.hu@kernel.org>
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_181749_270006_F30CB9B4 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

Moving mutex resource management from client driver to  mutex driver
could prevent client drivers negotiating for resource management.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_mutex.c    | 16 ++++++++--------
 drivers/gpu/drm/mediatek/mtk_mutex.h    |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index bba87a036fa8..1e3a9450680b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -773,7 +773,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	if (!mtk_crtc->ddp_comp)
 		return -ENOMEM;
 
-	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev, pipe);
+	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev);
 	if (IS_ERR(mtk_crtc->mutex)) {
 		ret = PTR_ERR(mtk_crtc->mutex);
 		dev_err(dev, "Failed to get mutex: %d\n", ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.c b/drivers/gpu/drm/mediatek/mtk_mutex.c
index 98a060bf225d..66344759e622 100644
--- a/drivers/gpu/drm/mediatek/mtk_mutex.c
+++ b/drivers/gpu/drm/mediatek/mtk_mutex.c
@@ -228,18 +228,18 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
-struct mtk_mutex *mtk_mutex_get(struct device *dev, unsigned int id)
+struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
+	int i;
 
-	if (id >= 10)
-		return ERR_PTR(-EINVAL);
-	if (mtx->mutex[id].claimed)
-		return ERR_PTR(-EBUSY);
-
-	mtx->mutex[id].claimed = true;
+	for (i = 0; i < 10; i++)
+		if (!mtx->mutex[i].claimed) {
+			mtx->mutex[i].claimed = true;
+			return &mtx->mutex[i];
+		}
 
-	return &mtx->mutex[id];
+	return ERR_PTR(-EBUSY);
 }
 
 void mtk_mutex_put(struct mtk_mutex *mutex)
diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.h b/drivers/gpu/drm/mediatek/mtk_mutex.h
index b678e0988a37..6fe4ffbde290 100644
--- a/drivers/gpu/drm/mediatek/mtk_mutex.h
+++ b/drivers/gpu/drm/mediatek/mtk_mutex.h
@@ -10,7 +10,7 @@ struct regmap;
 struct device;
 struct mtk_mutex;
 
-struct mtk_mutex *mtk_mutex_get(struct device *dev, unsigned int id);
+struct mtk_mutex *mtk_mutex_get(struct device *dev);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
