Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD567C2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 16:55:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E9E02067D
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 16:55:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6u7bJ/5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HS99IKXj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E9E02067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3jsAA/RI14UzjMOx2sakveQGyKiINDRKqPdbTp7AfKg=; b=Q6u7bJ/5cFRm6q
	BuQFL8YzQd6N1+LOUSucWlhzXLrmgmRyGwwTI32oZv1go8yMIwNITuA3CA7zNCzxA07leY8yJC+0p
	6IMq5Riem8ioMSekymnKdvSSxcGQU9Q3192Hf6CNzzfnFjLAQ3hQrtPu3AvWrK8bV4LcYbDHnV4QM
	+nII25LeQc4oAsysztSgrfYRQeWAUZtNJfdKnOyX96Vr9z33sNQe5p9WginXCWJTEjhVCA8AfmFrO
	t9/4oUidjURho4v66JAiKmuRbW83fw9jYCTMUMlf27f20f8mMWQEETJMkD+3GkSa3d/VDyGWAEoWY
	OI1TjCuMCrCkhFZ5HEnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2eFC-0003eH-Ay; Fri, 14 Feb 2020 16:55:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2djv-0006Xp-2H; Fri, 14 Feb 2020 16:23:08 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95B1F2475F;
 Fri, 14 Feb 2020 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697370;
 bh=JktK7OZ+PguGwXAN1oQ8D/VTtnD5HyaZVu3gKZGgxaM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HS99IKXjl9dANYiaf7VomzrYQCBwl0DE300TgVuI04mHeqOXgZSE1pxqNBwPDI8PT
 HoTXpkQRxulVsgvyJfQJlp1eidEQtM4MmQkEfNk1JQMebjPufwUCBm7JutOv3HNU5Y
 QpKihuHiqSoO4ZEWxUv9Lv8aFMqwjckSEmzJ/Xyo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 069/141] drm/mediatek: handle events when
 enabling/disabling crtc
Date: Fri, 14 Feb 2020 11:20:09 -0500
Message-Id: <20200214162122.19794-69-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162122.19794-1-sashal@kernel.org>
References: <20200214162122.19794-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_082251_149120_51A6AF2E 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bibby Hsieh <bibby.hsieh@mediatek.com>

[ Upstream commit 411f5c1eacfebb1f6e40b653d29447cdfe7282aa ]

The driver currently handles vblank events only when updating planes on
an already enabled CRTC. The atomic update API however allows requesting
an event when enabling or disabling a CRTC. This currently leads to
event objects being leaked in the kernel and to events not being sent
out. Fix it.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 01a21dd835b57..1ed60da76a0ce 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -306,6 +306,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 {
 	struct drm_device *drm = mtk_crtc->base.dev;
+	struct drm_crtc *crtc = &mtk_crtc->base;
 	int i;
 
 	DRM_DEBUG_DRIVER("%s\n", __func__);
@@ -327,6 +328,13 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 	mtk_disp_mutex_unprepare(mtk_crtc->mutex);
 
 	pm_runtime_put(drm->dev);
+
+	if (crtc->state->event && !crtc->state->active) {
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
 }
 
 static void mtk_drm_crtc_enable(struct drm_crtc *crtc)
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
