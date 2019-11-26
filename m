Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEC6C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 06:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C33AF2071A
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 06:31:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X1itojyT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ow+J3TpE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C33AF2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhxCDrfd15iaT9fsbacw2d1x9DQ4ridRXNeKOXLGdrs=; b=X1itojyT2oK+7e
	TbszvOyQpYOnY6uaaEcd5VqvUzuiMZavX/6qskhfGYcyztulb0VXCcmJLsE0YsLODrfSNw+i6ti2h
	JV/01OHNYLb161VjnigfnoD4kXkKclgTAKPP7aI4ky4k9zH05PHPzYfbP4MF0xMqljaMvBRLrRM9I
	dSiqHzzx4H065GC0bceNbc+u5f57TEl5uSl12wgAuVyJUdcDGvGipSDRQU7wY/5ULAtCggXDfnYq8
	JyDsCVztR5kARRBMDeP51MOFQjn91DtnDZ7EB+slcWkG4uUVpxUp2EzFELgS2MVg4wibQ9qDeyDF7
	LSjxUXTLE0W9JVM8Tq7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZUNt-0007Le-RK; Tue, 26 Nov 2019 06:31:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZUNQ-0006wg-7g; Tue, 26 Nov 2019 06:31:09 +0000
X-UUID: 31c3e29196ec4a7b929753f8efa28a42-20191125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hy0cLnVuKAeubaG0Nw7Ly7vpXhmAWFzJmxuagNSVrvI=; 
 b=ow+J3TpE4uW6oW6H3vg2hjAz8aFxykVm8Noyubep/FWbDrRm5cpsVD9SHJizJTM0AwIeOFq2jSy0f877ihYXQlrppzJla+k3f2r3C35btEG6uodXozWX5Lok5m5KV1Oh9AE3pld9laQuNHCE+wSJKkmwoM8cUT5jEXo8FFuIczQ=;
X-UUID: 31c3e29196ec4a7b929753f8efa28a42-20191125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1159794096; Mon, 25 Nov 2019 22:30:56 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 25 Nov 2019 22:29:44 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 14:29:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 26 Nov 2019 14:29:15 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/7] drm/mediatek: use DRM core's atomic commit helper
Date: Tue, 26 Nov 2019 14:29:28 +0800
Message-ID: <20191126062932.19773-4-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191126062932.19773-1-bibby.hsieh@mediatek.com>
References: <20191126062932.19773-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_223108_276254_E446D63A 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: drinkcat@chromium.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The DRM core atomic helper now supports asynchronous commits natively.
The custom drm implementation isn't needed anymore, remove it.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 92 +++++---------------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |  7 --
 2 files changed, 16 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6c68283b6124..97949dee2af0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -36,84 +36,25 @@
 #define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 
-static void mtk_atomic_schedule(struct mtk_drm_private *private,
-				struct drm_atomic_state *state)
+static void mtk_drm_atomic_helper_commit_tail_rpm
+		(struct drm_atomic_state *old_state)
 {
-	private->commit.state = state;
-	schedule_work(&private->commit.work);
-}
-
-static void mtk_atomic_complete(struct mtk_drm_private *private,
-				struct drm_atomic_state *state)
-{
-	struct drm_device *drm = private->drm;
+	struct drm_device *dev = old_state->dev;
 
-	drm_atomic_helper_wait_for_fences(drm, state, false);
-
-	/*
-	 * Mediatek drm supports runtime PM, so plane registers cannot be
-	 * written when their crtc is disabled.
-	 *
-	 * The comment for drm_atomic_helper_commit states:
-	 *     For drivers supporting runtime PM the recommended sequence is
-	 *
-	 *     drm_atomic_helper_commit_modeset_disables(dev, state);
-	 *     drm_atomic_helper_commit_modeset_enables(dev, state);
-	 *     drm_atomic_helper_commit_planes(dev, state,
-	 *                                     DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	 *
-	 * See the kerneldoc entries for these three functions for more details.
-	 */
-	drm_atomic_helper_commit_modeset_disables(drm, state);
-	drm_atomic_helper_commit_modeset_enables(drm, state);
-	drm_atomic_helper_commit_planes(drm, state,
+	drm_atomic_helper_wait_for_fences(dev, old_state, false);
+	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-
-	drm_atomic_helper_wait_for_vblanks(drm, state);
-
-	drm_atomic_helper_cleanup_planes(drm, state);
-	drm_atomic_state_put(state);
+	drm_atomic_helper_fake_vblank(old_state);
+	drm_atomic_helper_commit_hw_done(old_state);
+	drm_atomic_helper_wait_for_vblanks(dev, old_state);
+	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 
-static void mtk_atomic_work(struct work_struct *work)
-{
-	struct mtk_drm_private *private = container_of(work,
-			struct mtk_drm_private, commit.work);
-
-	mtk_atomic_complete(private, private->commit.state);
-}
-
-static int mtk_atomic_commit(struct drm_device *drm,
-			     struct drm_atomic_state *state,
-			     bool async)
-{
-	struct mtk_drm_private *private = drm->dev_private;
-	int ret;
-
-	ret = drm_atomic_helper_prepare_planes(drm, state);
-	if (ret)
-		return ret;
-
-	mutex_lock(&private->commit.lock);
-	flush_work(&private->commit.work);
-
-	ret = drm_atomic_helper_swap_state(state, true);
-	if (ret) {
-		mutex_unlock(&private->commit.lock);
-		drm_atomic_helper_cleanup_planes(drm, state);
-		return ret;
-	}
-
-	drm_atomic_state_get(state);
-	if (async)
-		mtk_atomic_schedule(private, state);
-	else
-		mtk_atomic_complete(private, state);
-
-	mutex_unlock(&private->commit.lock);
-
-	return 0;
-}
+static const struct drm_mode_config_helper_funcs mtk_drm_mode_config_helpers = {
+	.atomic_commit_tail = mtk_drm_atomic_helper_commit_tail_rpm,
+};
 
 struct mtk_atomic_state {
 	struct drm_atomic_state base;
@@ -191,7 +132,7 @@ static void mtk_drm_atomic_state_free(struct drm_atomic_state *state)
 static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
 	.fb_create = mtk_drm_mode_fb_create,
 	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = mtk_atomic_commit,
+	.atomic_commit = drm_atomic_helper_commit,
 	.atomic_state_alloc = mtk_drm_atomic_state_alloc,
 	.atomic_state_free = mtk_drm_atomic_state_free
 };
@@ -340,6 +281,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	drm->mode_config.max_width = 4096;
 	drm->mode_config.max_height = 4096;
 	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
+	drm->mode_config.helper_private = &mtk_drm_mode_config_helpers;
 
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)
@@ -619,8 +561,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!private)
 		return -ENOMEM;
 
-	mutex_init(&private->commit.lock);
-	INIT_WORK(&private->commit.work, mtk_atomic_work);
 	private->data = of_device_get_match_data(dev);
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index c37d835cf949..3c42383dedb0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -46,13 +46,6 @@ struct mtk_drm_private {
 	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
 	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
 	const struct mtk_mmsys_driver_data *data;
-
-	struct {
-		struct drm_atomic_state *state;
-		struct work_struct work;
-		struct mutex lock;
-	} commit;
-
 	struct drm_atomic_state *suspend_state;
 
 	struct {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
