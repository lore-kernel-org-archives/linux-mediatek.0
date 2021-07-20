Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34323C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 10:06:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7D4E6113A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 10:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7D4E6113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0xMAgmGN/CRP1NoQ26HwXJ4RTbg3pOZN1JsXWwHT4es=; b=fAYEpVLTC6XIto
	ylPYSQDvcplEdbN853+6Ds8Gxb3ILNCnujh9fs5vSWlwkOjy7GWZzuo9LvDljr7hF4HcHvfwhZbM2
	7VF6asD+9H1V+2Gq1nftDIhilQGxPsmAcWADLCK1v3naQ+i7ZpRVGIc69WXFes+YT6bqW0xn8RhLy
	rBf0uP2LUSppu/H0tQUHWcicYF+M5jNYc1iO6qYcWwDLUIxuGYzwzmQpijhRf9N5dA77yoXmL0wmT
	dCQnBNA6gKBVrEOWKXVWuUNo7kulIOD+usYQ9fp1YSG7aEUioGtxZMfk/gQZRtWNI6UtLFkb8CUr2
	Ss5TnU4+4/b6u/FYPbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5mdr-00CT5G-7J; Tue, 20 Jul 2021 10:06:23 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5mdY-00CT1s-A9
 for linux-mediatek@lists.infradead.org; Tue, 20 Jul 2021 10:06:09 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso1604289pjz.1
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Jul 2021 03:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6dvoxU82sdq8hrtHo6MNtrAkdmF4Qfs1QHBwRf0tvA=;
 b=Cp59n2Cb272AzmErANtJnFMRXbhxIXwpy4y+lZNu4HXwA0rY3ycd0yal8gjH4KS/8B
 tX7HiQlqzbMpHXvkhj2/8EtDSZVA5KLyTBhW7d8tTrmJmBbNDOWpfkD76197FZBz7zti
 ydKpQM1bMd+Ia1gvMedLl7LNhCSltVNot4Bc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6dvoxU82sdq8hrtHo6MNtrAkdmF4Qfs1QHBwRf0tvA=;
 b=Wy5g1Rst9j4eJzwRFj3QTgXfM0Ov8nx0Hq3s2DY4RZErRea0Xu3J4ZYXFrd1fg2VNl
 oLWv7OwhtC1m6o7sA6po7b1m3Y5V80DmsSSev1l12ayiu9/CMj5Q27+Zek4iyRjD3mwK
 BStK7Ybw9u0KlBga+rPEMAXezg9ZIH8JybILrYDfzsQ+RYJ8uxAy4r2tDO0pNqDf9i1X
 381iQ1bFtH5UKdZHs1WJefeAQV1vT2io0siCb5gQioVWSFQGLYviJLDSo//NPmIdszF2
 cEucaDs6KnDOuzv+E0M9vXd64hEH0F6rJ/1QetuesngIDEKByPfvmY5i4asOhDL9Eo9W
 bPRw==
X-Gm-Message-State: AOAM533Pt4BsgQ9QhNJeXt0mZWWDeIRyYhybgzTSqXiW82vGJzdjaSv+
 jujr0H3I0BfcW6qLuxedyl6JvQ==
X-Google-Smtp-Source: ABdhPJymK2i/4VfbrYc8qY2j3o9aCSyBSwL36wWIQBgl7jKUzWJ4Lv9BHbGe+7BeA9pC5I4dtFqRRw==
X-Received: by 2002:a17:90a:4302:: with SMTP id
 q2mr33210703pjg.189.1626775562319; 
 Tue, 20 Jul 2021 03:06:02 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id y5sm22843830pfn.87.2021.07.20.03.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 03:06:01 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v2] drm/bridge: anx7625: Use pm_runtime_force_{suspend, resume}
Date: Tue, 20 Jul 2021 18:05:21 +0800
Message-Id: <20210720100553.2340425-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_030604_429651_280933EB 
X-CRM114-Status: GOOD (  19.92  )
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

Use pm_runtime_force_{suspend,resume} as system suspend/resume hook, to
ensure that anx7625 is always powered off on suspend.

Also add a device link between anx7625 driver and the encoder, to ensure
that bridge_disable will be called before suspend.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---

Changes from v1:
* Use device link to ensure suspend resume order, instead of manually
  calling force resume.

This is the second approach mentioned in v1 of this patch
(https://lore.kernel.org/patchwork/patch/1459569/#1655836).

An issue was found that the anx7625 driver won't power off when used as
eDP bridge on Asurada board if suspend is entered via VT2.

The reason is that in this case, anx7625_suspend won't power off anx7625
(since intp_irq is not set). And anx7625_bridge_disable is only called
indirectly by other driver's (mediatek-drm) suspend.
pm_runtime_put_sync won't do anything since it's already in system
suspend.

If not in VT2, the bridge disable is indirectly called when Chrome
stops, so anx7625 will be powered off correctly.

To fix the issue, the suspend resume hooks are changed to
pm_runtime_force_{suspend,resume} to ensure the runtime suspend / resume
is always called correctly when system suspend / resume.
(Note that IRQ no longer needs to be disabled on suspend after commit
f03ab6629c7b ("drm/bridge: anx7625: Make hpd workqueue freezable"))

Also adds a stateless device link to ensure that the bridge disable is
called before anx7625 is suspended.

---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 54 +++++++++--------------
 drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
 2 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 7519b7a0f29d..e248f0da2f8b 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1331,6 +1331,8 @@ static void anx7625_bridge_detach(struct drm_bridge *bridge)
 		mipi_dsi_detach(ctx->dsi);
 		mipi_dsi_device_unregister(ctx->dsi);
 	}
+	if (ctx->link)
+		device_link_del(ctx->link);
 }
 
 static int anx7625_bridge_attach(struct drm_bridge *bridge,
@@ -1355,6 +1357,13 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		return err;
 	}
 
+	ctx->link = device_link_add(bridge->dev->dev, dev, DL_FLAG_STATELESS);
+	if (!ctx->link) {
+		DRM_DEV_ERROR(dev, "device link creation failed");
+		err = -EINVAL;
+		goto detach_dsi;
+	}
+
 	if (ctx->pdata.panel_bridge) {
 		err = drm_bridge_attach(bridge->encoder,
 					ctx->pdata.panel_bridge,
@@ -1362,13 +1371,22 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		if (err) {
 			DRM_DEV_ERROR(dev,
 				      "Fail to attach panel bridge: %d\n", err);
-			return err;
+			goto remove_device_link;
 		}
 	}
 
 	ctx->bridge_attached = 1;
 
 	return 0;
+
+remove_device_link:
+	device_link_del(ctx->link);
+detach_dsi:
+	if (ctx->dsi) {
+		mipi_dsi_detach(ctx->dsi);
+		mipi_dsi_device_unregister(ctx->dsi);
+	}
+	return err;
 }
 
 static enum drm_mode_status
@@ -1705,39 +1723,9 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused anx7625_resume(struct device *dev)
-{
-	struct anx7625_data *ctx = dev_get_drvdata(dev);
-
-	if (!ctx->pdata.intp_irq)
-		return 0;
-
-	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
-		enable_irq(ctx->pdata.intp_irq);
-		anx7625_runtime_pm_resume(dev);
-	}
-
-	return 0;
-}
-
-static int __maybe_unused anx7625_suspend(struct device *dev)
-{
-	struct anx7625_data *ctx = dev_get_drvdata(dev);
-
-	if (!ctx->pdata.intp_irq)
-		return 0;
-
-	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
-		anx7625_runtime_pm_suspend(dev);
-		disable_irq(ctx->pdata.intp_irq);
-		flush_workqueue(ctx->workqueue);
-	}
-
-	return 0;
-}
-
 static const struct dev_pm_ops anx7625_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
 			   anx7625_runtime_pm_resume, NULL)
 };
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 034c3840028f..c941b7a32859 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -385,6 +385,7 @@ struct anx7625_data {
 	struct drm_bridge bridge;
 	u8 bridge_attached;
 	struct mipi_dsi_device *dsi;
+	struct device_link *link;
 };
 
 #endif  /* __ANX7625_H__ */

base-commit: 3568c2c543e25d1a47bd97a607171511e7d44a45
-- 
2.32.0.402.g57bb445576-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
