Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A87C27C50
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 00:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZEZey5x5luD0xWg/8KZQe7BPyHWAO218kvdlS1elh8=; b=SMmBkOLOQfMks5Tc+kf01v5o9v
	Mz9/cEVpNnunUJJiHSi8nfuBDFYazOd5F/9pEH67M1WFBgAyFv81fw5ffcybChHnWsh+gSgAtryp3
	nu1NPNoltqY0WCiCK/oJQrbKFWcR3CvWErhS9am3RX6ohGmZn0g6FO6vtkFu9ymCgsHGcSbf8ekY+
	Uhegb6DflnqYWGmZ5DYslX+V8bAkjssjMneKzUUrPtYnxXvPXYHmZRfVVKJ1ubr5Xf7jlPaOO6Ozf
	8KIxHu8VtABxdqPXxovoz5cnPsTN000OYBIF60v6YMMk0ran8DEHhgEbsJX/dNyAhwPNn1BVEAAtm
	4n5c3/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEeRw-00000004GFT-0b8e;
	Wed, 05 Jun 2024 00:24:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEeRp-00000004GBL-1o6v
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Jun 2024 00:24:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f4a52b9413so48666925ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 17:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717547052; x=1718151852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZEZey5x5luD0xWg/8KZQe7BPyHWAO218kvdlS1elh8=;
        b=PyAf6lbcPWuyOQpNvA3U2nArH+++p7kAuLypyZlKCkiLvy0YRBbjq1EzFkiX7VGeTk
         XuSWmKz3xwFR3zp2Ov/7d3+6fOUO5K1sCqR4VBToNE4BRuc1+YOXNONPvLv9xHZvr1at
         alFFFqYmla/MTNXnhBz3rT1FwTNFzs0ZbgzQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717547052; x=1718151852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZEZey5x5luD0xWg/8KZQe7BPyHWAO218kvdlS1elh8=;
        b=UNMjIUO3RTxODkbi50mrPC02RtmruaV63chOczz2s/TBZLBONWRfag4lc3nambKwPg
         i0kGKyHMKsX1XHQQp+gS97x/SNVPXbgL7Yw+btCP3eSX260OaTcEbc99MdMJv7g6wAr4
         V+Pda/5+Z3TkLieRwVfFNN9DGBCXiCUiY9ZQKZtNchUTfoCtbhQZQhhnchLlhHcvpKro
         tOsHPSi8xGPfwQktiN4Na9gnDeFj4gIDijG6rYUcM4xXNqxaSAawHNF7ORM32Est2HY+
         V9saiaIevPWE/UM16yqsZXw+sitzjuHLzx6TsX1WO9p5hRVaE0TGvnRgjwm6rEQClUc8
         aUoA==
X-Forwarded-Encrypted: i=1; AJvYcCUvH8hWDRl/6VLmaccLCodToPd6DLHckup1U7beh+AkZsIw/PaN/z/5GO5zJCo82QyoS2kB7oGtyWShyt83vwlv+nkWJuwZhYZtdsjRJOCcsgas
X-Gm-Message-State: AOJu0Yx8PjeMMAyG3krZfZp/KKcFJUkMR4V8mEu3pZouk6u2COg1mJg3
	nkHJ7li+km6oRidGphGA9Ia0Ht4jNKhUcWQS9s88/FDaoJcILm+R9G4ZhcI9fQ==
X-Google-Smtp-Source: AGHT+IEfsqqgmgYWM0BC/bbTU6AS9BdhPGPSHuCKwVJwHIAn7JXDeAeaFpMbK/YJKuIU6Ne3nlYqaw==
X-Received: by 2002:a17:902:a515:b0:1f6:4cff:6ffd with SMTP id d9443c01a7336-1f6a5a83e7emr9332115ad.57.1717547052198;
        Tue, 04 Jun 2024 17:24:12 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:3609:ff79:4625:8a71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 17:24:11 -0700 (PDT)
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
Subject: [PATCH v3 01/24] drm/panel: boe-himax8279d: Stop tracking prepared/enabled
Date: Tue,  4 Jun 2024 17:22:47 -0700
Message-ID: <20240604172305.v3.1.Ia3f254ab6e04e4f7afba6c066454498c8fb01324@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_172413_481757_88C1F84E 
X-CRM114-Status: GOOD (  16.48  )
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

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

NOTE: as part of this, transition the panel's direct calls to its
disable/unprepare functions in shutdown/remove to call through DRM
panel.

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

 drivers/gpu/drm/panel/panel-boe-himax8279d.c | 31 +++-----------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index e225840b0d67..12e14615298b 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -47,9 +47,6 @@ struct panel_info {
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *pp33_gpio;
 	struct gpio_desc *pp18_gpio;
-
-	bool prepared;
-	bool enabled;
 };
 
 static inline struct panel_info *to_panel_info(struct drm_panel *panel)
@@ -86,17 +83,12 @@ static int boe_panel_disable(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;
 
-	if (!pinfo->enabled)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(pinfo->link);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
 		return err;
 	}
 
-	pinfo->enabled = false;
-
 	return 0;
 }
 
@@ -105,9 +97,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;
 
-	if (!pinfo->prepared)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(pinfo->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -121,8 +110,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 
 	disable_gpios(pinfo);
 
-	pinfo->prepared = false;
-
 	return 0;
 }
 
@@ -131,9 +118,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int err;
 
-	if (pinfo->prepared)
-		return 0;
-
 	gpiod_set_value(pinfo->pp18_gpio, 1);
 	/* T1: 5ms - 6ms */
 	usleep_range(5000, 6000);
@@ -180,8 +164,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	/* T7: 20ms - 21ms */
 	usleep_range(20000, 21000);
 
-	pinfo->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -194,9 +176,6 @@ static int boe_panel_enable(struct drm_panel *panel)
 	struct panel_info *pinfo = to_panel_info(panel);
 	int ret;
 
-	if (pinfo->enabled)
-		return 0;
-
 	usleep_range(120000, 121000);
 
 	ret = mipi_dsi_dcs_set_display_on(pinfo->link);
@@ -205,8 +184,6 @@ static int boe_panel_enable(struct drm_panel *panel)
 		return ret;
 	}
 
-	pinfo->enabled = true;
-
 	return 0;
 }
 
@@ -917,11 +894,11 @@ static void panel_remove(struct mipi_dsi_device *dsi)
 	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = boe_panel_disable(&pinfo->base);
+	err = drm_panel_disable(&pinfo->base);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
 
-	err = boe_panel_unprepare(&pinfo->base);
+	err = drm_panel_unprepare(&pinfo->base);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
 
@@ -936,8 +913,8 @@ static void panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
 
-	boe_panel_disable(&pinfo->base);
-	boe_panel_unprepare(&pinfo->base);
+	drm_panel_disable(&pinfo->base);
+	drm_panel_unprepare(&pinfo->base);
 }
 
 static struct mipi_dsi_driver panel_driver = {
-- 
2.45.1.288.g0e0cd299f1-goog


