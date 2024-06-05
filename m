Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EA6C27C55
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 00:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsRu3jEWU9sK1vmuNiyJjPrhOLNs5NH11TNjKSLZ2vI=; b=dUSmaXLHuVCr6PAqW5YP5X1/o6
	OYh2bd7VAI74A0TN7Xq1fqD7QbI43PXj0CfKP325tN61sR3eLbds3ONoZx8M0Y3GSIQZqrA+Y8C5x
	PoWeZm5b7eLEvGPVea2DBXQ9fntOidJbI5Bxhj9MyGLi9x7JGz7ca3W8C++3/Fu4Nfqgff+HdXpFy
	976jxGuEaeBAVp8FYYb49mzr1dTOqlX/UBc4KLUeBTJbIELXB+W34eV259xAbwtIU+0NBCkdq1vHq
	U/mWylpcVrg89zfa7iPzZ9+tAfBMWj1pTJzROeJSW3gjVRiPItNsMEqTQCTKEXhyEpvQM7KwM4S4Q
	WnfuWzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEeRx-00000004GGS-0dpl;
	Wed, 05 Jun 2024 00:24:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEeRs-00000004GCJ-1KBO
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Jun 2024 00:24:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f4a5344ec7so2936335ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 17:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717547055; x=1718151855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsRu3jEWU9sK1vmuNiyJjPrhOLNs5NH11TNjKSLZ2vI=;
        b=CXjmL8XFg4cam241BdQl5FgLBYmLdhu7TE5ZLZT+dDPNpgTldx2QYP32L98crpcz3T
         yshhSIrLK8HDxkWYeFB4XBncnGgO4mFmCZ0mVXcCo0Hn2VqwhKZxEoit/6vR78eorFt2
         jK6Yr1lz/iwqMrWgiog0T4bGAC7sWkBn7dtSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717547055; x=1718151855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsRu3jEWU9sK1vmuNiyJjPrhOLNs5NH11TNjKSLZ2vI=;
        b=Zbgulez/0RntUN4BIb93zp+4gLV4i7j07pkeX00ZDpYTCwZ1XiI4+uEUtNDtIgRmmF
         X80+EZRfFtebLUyxm49G3vFt12e2Wz+ljPz9dePFMw5jqUVOOPUekxoLKItqipovTKy3
         lGYXbCUoNsxahCMF5r4mvDBjA/XtHxA19cdbPudR8K4kZp7xARMkKE5Oyxtae2B/SWnj
         pC2R6CamQYmPDqWKdi7uEKoi3FkGNDFC1cKz6T93hlI+LjMotH+ChM3sWdl5/uihU2aB
         POrphCSKZVLVhbaf9fQ3klWOWOWbuKu+QHt6HjgnkfroyIb0KJsECd/ojpGKk0xWV5fm
         dCdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL4yJubBPkG7alkHX1AsAaN1UCoOMEgH1itjqiSl6Fcmxtv3pV+LupnXZfz40ia1TwBU80M/xH4w7CX7bqiYIEFuG4jDGYPRnpMRT/su1CfxAV
X-Gm-Message-State: AOJu0Yz9OVZ8dpArJS6ey3QR94ewGiiqr+6qs0T68sIffd4HMFGUbTI9
	qz02DyQtz9qysLtLl9RRy+CSCRcDdRms6fl/ibTCzDtyDGyKOUEdKTXwJ5Ulww==
X-Google-Smtp-Source: AGHT+IEuttE4Gs9JJB+IuOsNqsKWp7EyRVQUbEuRZzgK3b55KLaK0AVYQ/oG9ywbjEwvWBwh98g+5w==
X-Received: by 2002:a17:903:2303:b0:1f6:a572:86ab with SMTP id d9443c01a7336-1f6a572a1d3mr22763635ad.15.1717547055143;
        Tue, 04 Jun 2024 17:24:15 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:3609:ff79:4625:8a71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 17:24:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yuran Pereira <yuran.pereira@hotmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Jerry Han <jerry.han.hq@gmail.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Rock Wang <rock_wang@himax.com.cn>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 02/24] drm/panel: boe-himax8279d: Don't call unprepare+disable at shutdown/remove
Date: Tue,  4 Jun 2024 17:22:48 -0700
Message-ID: <20240604172305.v3.2.I19086c524d38f28f746befe85cb39ffda9d2f666@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_172416_387208_3329144D 
X-CRM114-Status: GOOD (  15.89  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

Unfortunately, grepping mainline for this panel's compatible string
shows no hits, so we can't be 100% sure if the DRM modeset driver used
with this panel has been fixed. If it is found that the DRM modeset
driver hasn't been fixed then this patch could be temporarily reverted
until it is.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Jerry Han <jerry.han.hq@gmail.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Rock Wang <rock_wang@himax.com.cn>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-boe-himax8279d.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index 12e14615298b..df746baae301 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -894,14 +894,6 @@ static void panel_remove(struct mipi_dsi_device *dsi)
 	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = drm_panel_disable(&pinfo->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
-
-	err = drm_panel_unprepare(&pinfo->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
-
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
@@ -909,14 +901,6 @@ static void panel_remove(struct mipi_dsi_device *dsi)
 	drm_panel_remove(&pinfo->base);
 }
 
-static void panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&pinfo->base);
-	drm_panel_unprepare(&pinfo->base);
-}
-
 static struct mipi_dsi_driver panel_driver = {
 	.driver = {
 		.name = "panel-boe-himax8279d",
@@ -924,7 +908,6 @@ static struct mipi_dsi_driver panel_driver = {
 	},
 	.probe = panel_probe,
 	.remove = panel_remove,
-	.shutdown = panel_shutdown,
 };
 module_mipi_dsi_driver(panel_driver);
 
-- 
2.45.1.288.g0e0cd299f1-goog


