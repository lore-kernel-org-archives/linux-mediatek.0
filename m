Return-Path: <SRS0=XjSu=FY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386F4C3526C
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 02:37:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD42F23AC1
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 02:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD42F23AC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoCtEbrTvL/7EQ4Q8f4hoIoQ1S3UEJ0sLf/4hnMlwvo=; b=KKWfNmrzdtHCC3SMfUHOsIFs5p
	v+EOlFX2RJSng2R1aShZP6aTc5sHwwrPKA9Vtaaki+G6MoWdKGRkFyo5Z0PF1OGXAqAi4R4V+dons
	VN/GmzujZN7OuFnAzkxC0cw8Krn/z/JJlq0Xh0y5eEr4+018tVuU8XqYcN3AJF1JzVWs7DOgtvEhO
	GqSYSWEy2rbuTjom0jwMgE55eNq5o1OERvkWMPqvkpNNz0+FTETj1Vi7Kyo/S7PnWLIxZNRuFrLj4
	zCFm+02b1kYvvUFyRWuN4P2tb+tLFa3PP6ghM3DLPrhKELBWAftyAQmMzsQRDXBEHOJ7xb0A2fxJn
	KT6/m0Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqobU-0006wa-0U; Sun, 20 Dec 2020 02:37:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqob3-0006o5-DJ; Sun, 20 Dec 2020 02:37:26 +0000
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/5] drm/mediatek: Automatically search unclaimed mtk mutex in
 mtk_mutex_get()
Date: Sun, 20 Dec 2020 10:36:54 +0800
Message-Id: <20201220023655.30795-5-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201220023655.30795-1-chunkuang.hu@kernel.org>
References: <20201220023655.30795-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_213721_552124_0C9616FC 
X-CRM114-Status: GOOD (  14.11  )
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
index 5c4e8e2f4448..23d9abc4f46c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -772,7 +772,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	if (!mtk_crtc->ddp_comp)
 		return -ENOMEM;
 
-	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev, pipe);
+	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev);
 	if (IS_ERR(mtk_crtc->mutex)) {
 		ret = PTR_ERR(mtk_crtc->mutex);
 		dev_err(dev, "Failed to get mutex: %d\n", ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.c b/drivers/gpu/drm/mediatek/mtk_mutex.c
index ece26359a292..e16b1772317c 100644
--- a/drivers/gpu/drm/mediatek/mtk_mutex.c
+++ b/drivers/gpu/drm/mediatek/mtk_mutex.c
@@ -226,18 +226,18 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
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
