Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DCDC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 06:05:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABF1B613AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 06:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABF1B613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RMs7mv+FtA3xxs9K9M3z5IymSR3ckgcUK5UzExT0h4g=; b=y6FQFqEzOXE10E
	V/BuOHEV/v9b66YuRu2cze74c6nALM7XU4mRshYRGbtUsD145qProZ+2lOwUnVL1h2xaciZFrOrrs
	kgykpnqiHHuNOO33RagNqZ+5ped1Sg9gQziq0iCJ6bBHsakRgo+EJB2oN0g9Ekr4yP3kllydTVhd+
	yWioKNUKWFWDOrggHeT3VxYK7osJJlhNKnC6Fo9DfDvNeBO8skV8mFpEwlIRXg4j5AF1ixjakorL0
	AMWf7dNl8mFB4A7IUvrADAngfsvxk5T2tVdCpeZ8AE2O3lUEOaNBFPyOInWS24xYaiWHiQL8d05h+
	oxAOfAccS9+bu91kCgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Y1K-00CP9S-Bv; Wed, 14 Jul 2021 06:05:22 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3Y1H-00CP8Q-Av
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 06:05:20 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 h1-20020a17090a3d01b0290172d33bb8bcso3186400pjc.0
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Jul 2021 23:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n3xrLCowHoV9+qyE8ZVGJpCIjAP5+VxK4UkQj5GcY2w=;
 b=kLFkLuzZN/EMGHwlQGVS/UYmwM1Jor+xNSxXNx0vwbUEejkcyGW3ZmWZwpiB1TMCi/
 X2cTIJGs3M4vgTulRuQtElHfqpwfIWordoE8h7elKxyTNW4Vj/KhFEuk/g+f8IzSVtWR
 1IkdCBY3OhNxNLCR8lAti4i9lqmVQ4fX4VV78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n3xrLCowHoV9+qyE8ZVGJpCIjAP5+VxK4UkQj5GcY2w=;
 b=PZmLB2buXfhTwKU7apiLWGysHKxEzjFuZcC8PR+Qqj9JMBm3H8d+RxJ9zQ7UmSP7mS
 FEJnPetIO2I3u1TMnJK2Z/yLRp53Pp27HS+73yJVbk26XUa+a0hPKdYCot/NNYIT0lmZ
 wFpSzoFBGRyAY/5TWGgD5k07QPCBrvgyUMnBOPDgyL5d9aklBm42AhX2IkXC7mmhGlBo
 d9wQW7OR/VwYLLZJZ2bwcRoiFC3jclIK3t6YXw3K0h+uiCYb4tcKihryGbd1zEbXny5L
 XLbNMJVV82b5rSdJ0sI1GYWzeytmkyMBzbCt75pMougJKOWSFSG6VH65zH60OSMPvclE
 U4MQ==
X-Gm-Message-State: AOAM531vBMDwlDntpPwhJBKFqRwoYStAm+EjAmOqSup+CYp/kafny2RV
 vmmGYQgMiYdfA5m9OQIOgu4LKA==
X-Google-Smtp-Source: ABdhPJxMHrnpzw0TqHvFJSj9wz6UUif9iub0qocjpvcy/+qmAdEUClh8smx1q3mPpPVrt62tv/yGCA==
X-Received: by 2002:a17:902:ff0c:b029:11d:3e9e:41ec with SMTP id
 f12-20020a170902ff0cb029011d3e9e41ecmr6557656plj.1.1626242717623; 
 Tue, 13 Jul 2021 23:05:17 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id m19sm4524468pjl.13.2021.07.13.23.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 23:05:17 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, Xin Ji <xji@analogixsemi.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Yu Jiahua <yujiahua1@huawei.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] drm/bridge: anx7625: Use pm_runtime_force_{suspend,resume}
Date: Wed, 14 Jul 2021 14:01:59 +0800
Message-Id: <20210714060221.1483752-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_230519_427749_9635EAB1 
X-CRM114-Status: GOOD (  21.60  )
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

Use pm_runtime_force_suspend and pm_runtime_force_resume to ensure that
anx7625 would always be powered off when suspended. Also update the
bridge enable hook to always ensure that the anx7625 is powered on
before starting DP operations.

Fixes: 409776fa3c42 ("drm/bridge: anx7625: add suspend / resume hooks")

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

---

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

Since bridge disable is called indirectly by mediatek-drm driver's
suspend, it might happens after anx7625 suspend is called. So a check
if the driver is already suspended via pm_runtime_force_suspend is also
added, to ensure that the anx7625_dp_stop won't be called when power
is off. And also since bridge enable might happens before anx7625 resume
is called, a check to that is also added, and would force resume the
device in this case.

I'm not sure if the approach to fix this is the most appropriate way,
since using pm_runtime_force_resume in bridge enable kinda feels hacky
to me. I'm open to any suggestions.

---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 55 +++++++++--------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a3d82377066b..9d0f5dc88b16 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1559,7 +1559,20 @@ static void anx7625_bridge_enable(struct drm_bridge *bridge)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
 
-	pm_runtime_get_sync(dev);
+	/*
+	 * The only case where pm_runtime is disabled here is when the function
+	 * is called other driver's resume hook by
+	 * drm_mode_config_helper_resume, but when the pm_runtime_force_resume
+	 * hasn't been called on this device.
+	 *
+	 * pm_runtime_get_sync won't power on anx7625 in this case since we're
+	 * in system resume, so instead we force resume anx7625 to make sure
+	 * the following anx7625_dp_start would succeed.
+	 */
+	if (pm_runtime_enabled(dev))
+		pm_runtime_get_sync(dev);
+	else
+		pm_runtime_force_resume(dev);
 
 	anx7625_dp_start(ctx);
 }
@@ -1571,9 +1584,10 @@ static void anx7625_bridge_disable(struct drm_bridge *bridge)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
 
-	anx7625_dp_stop(ctx);
-
-	pm_runtime_put_sync(dev);
+	if (pm_runtime_enabled(dev)) {
+		anx7625_dp_stop(ctx);
+		pm_runtime_put_sync(dev);
+	}
 }
 
 static enum drm_connector_status
@@ -1705,38 +1719,9 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
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

base-commit: c0d438dbc0b74901f1901d97a6c84f38daa0c831
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
