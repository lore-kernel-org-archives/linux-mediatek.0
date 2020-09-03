Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58CEC43461
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 21:03:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60B9C20684
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 21:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f9etSkKy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60B9C20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ui+dCIlKLHr8FX6r9HAhVdcw5VepQ/JwQ33nakjHEQ=; b=f9etSkKyQ+YpN8kA7UvYmUG6Ce
	ld2CDyPz080XGKrinxjhWCxr1WzKPoiY0yxkHQbNfGWt0KkJbr3Cc9xx3dYgx5mIh4lFfmgsrQDxa
	VtJBuI+llUz9QEBibG0Nu74m0xbhgKXsUbDgDpsLh5qaABvugejWUdJ3RWycVKvh9nEOCuNREcfed
	QgFKnP0hJxfeR69JR+YTSgv/AcONI/Fa6+Gtxh19Wptue5pLT3UgMXj3fhKTKDMxpFsbFEdgH9LAe
	Nlsg0iN0q8+lOZQRzntAWzXmzTNBnjf+fDvIVOPFrgIggOoXXMUWx7CvtZwwbRysyZ6+lo8Pk4M9P
	XH9IDZtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDwNe-0003f2-Iu; Thu, 03 Sep 2020 21:02:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDwKG-000242-QE; Thu, 03 Sep 2020 20:59:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 059751045;
 Thu,  3 Sep 2020 13:59:19 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 328733F68F;
 Thu,  3 Sep 2020 13:59:18 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de
Subject: [PATCH] drm/mediatek: Drop local dma_parms
Date: Thu,  3 Sep 2020 21:59:14 +0100
Message-Id: <d6f1943aaf58bb0ca527e048406e09cf387a12b0.1599166624.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_165920_943350_4772E26D 
X-CRM114-Status: GOOD (  15.86  )
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
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
for platform devices"), struct platform_device already provides a
dma_parms structure, so we can save allocating another one.

Also the DMA segment size is simply a size, not a bitmask.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 23 +++--------------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |  2 --
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 040a8f393fe2..3941f6f6b003 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -221,21 +221,10 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	 * Configure the DMA segment size to make sure we get contiguous IOVA
 	 * when importing PRIME buffers.
 	 */
-	if (!dma_dev->dma_parms) {
-		private->dma_parms_allocated = true;
-		dma_dev->dma_parms =
-			devm_kzalloc(drm->dev, sizeof(*dma_dev->dma_parms),
-				     GFP_KERNEL);
-	}
-	if (!dma_dev->dma_parms) {
-		ret = -ENOMEM;
-		goto err_component_unbind;
-	}
-
-	ret = dma_set_max_seg_size(dma_dev, (unsigned int)DMA_BIT_MASK(32));
+	ret = dma_set_max_seg_size(dma_dev, UINT_MAX);
 	if (ret) {
 		dev_err(dma_dev, "Failed to set DMA segment size\n");
-		goto err_unset_dma_parms;
+		goto err_component_unbind;
 	}
 
 	/*
@@ -246,16 +235,13 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	drm->irq_enabled = true;
 	ret = drm_vblank_init(drm, MAX_CRTC);
 	if (ret < 0)
-		goto err_unset_dma_parms;
+		goto err_component_unbind;
 
 	drm_kms_helper_poll_init(drm);
 	drm_mode_config_reset(drm);
 
 	return 0;
 
-err_unset_dma_parms:
-	if (private->dma_parms_allocated)
-		dma_dev->dma_parms = NULL;
 err_component_unbind:
 	component_unbind_all(drm->dev, drm);
 
@@ -269,9 +255,6 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 
-	if (private->dma_parms_allocated)
-		private->dma_dev->dma_parms = NULL;
-
 	component_unbind_all(drm->dev, drm);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index b5be63e53176..6afd0b5f2b92 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -44,8 +44,6 @@ struct mtk_drm_private {
 	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
 	const struct mtk_mmsys_driver_data *data;
 	struct drm_atomic_state *suspend_state;
-
-	bool dma_parms_allocated;
 };
 
 extern struct platform_driver mtk_ddp_driver;
-- 
2.28.0.dirty


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
