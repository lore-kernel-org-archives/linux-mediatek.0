Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF473C25B5C
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 22:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivwzpk8LV8o9VOgpaEI0wSikxdx7Ris0rIA4UDrHOxM=; b=w2AGYBnS6cNJEHk51ijdByjt4M
	vA917fcc6TenuaR/gNVJcRZjGrY9ItvAHjnG/C+UJaaB/W3FqxCIHSLw/g2geLPF0btmtswLgA5Z1
	BrXj4qaJETF/g44f/Ro1RyganSfiLUFFxY1TihVGnSvsxkGDKrKclJ2cMHkpbCCOk8K1tS33z+HtW
	9TQfNKe1EeCeEcYWBetmc2h89tGjJCLDZBlOW+EaXDfbP0a8ZM/3/y7iiDz2Pby7Rsm9W4MQMJvY+
	3Jr57rl3Psp4v4dUC6MJH7+WEARnUMSOd7X6/Z87LwcGt0eawGNWGXw+TDq9o/7VSm7khZew/Fmzc
	znFQMoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s31fk-00000000eOn-3FEi;
	Fri, 03 May 2024 22:46:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s30Zz-00000000RV4-2Xum
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 21:36:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1ed012c1afbso1062625ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 14:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714772191; x=1715376991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivwzpk8LV8o9VOgpaEI0wSikxdx7Ris0rIA4UDrHOxM=;
        b=ETZaGtJoSOoOBpMvew+ZbN0iU1MzTn8e4ed1FTTf+AjV4sz5UcwVvod/a35IfOad9/
         pN+lqNx1PVejw11m5QQug8ivbj2E/TKENVwBCeJDSwJl/ziqhLJZCycXyHJa3j6do3eh
         Xo6bdC0VV5M0XzRmzT4FhBtEA4Dc6EObzTtG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714772191; x=1715376991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivwzpk8LV8o9VOgpaEI0wSikxdx7Ris0rIA4UDrHOxM=;
        b=CMQOELthVXw9NHPhzLu+73CbTvVwLuC3v93fRm9FdwO1Y1qfNaxVj2lshgFDL18fvZ
         DPaojA6ioE1z5uS7YLr6zm7A/ea9JuF1rg/o3hC2QiCPCnOAiJDJoY8hmuxqCExHeuhj
         6WlzpuOXtRUODgTPr8vhxvC22qu7bJmkRr3bqNDL/mpCW0kOaTSrFYHZoHH3na8cObf3
         uDIXchEVOX70Z2gbJqmH3TW46v40YwXhX+6oSrzFAvwKbwQSUWj8tK9ExBf3YTHn1Tkc
         E9DLChCit1Auqvwz69t1S4oBI77wKDORfNf/epWZ8hFMeOhLet+j06CpvGxMH2uezXQk
         GETw==
X-Forwarded-Encrypted: i=1; AJvYcCVS1yDe/6UzeKx1FsCvzH8l2/bE/LjrZkQw4M4TY4zY7yCNYo4g/pJkiJZAOqMLbJC2C3hXur9Frw+RGP86tKbmDbbDE8d73hwTLSfG7xK/U523
X-Gm-Message-State: AOJu0Yx3JYxkKkEErTAjEZM2zeaUQQww3uF+qh5BZ48vSYuC7cPrzzFW
	mW2Jxw5DlcQRXQER+Z7TPZlTlwjnKmVFFSA6Ol2BpBa1Cb/TQ3du1voHg0nEeg==
X-Google-Smtp-Source: AGHT+IEhtQwHX90SwQBe2NnOXhamncltrhxwpD6fYsYZstR87YJRnxBbL7AN6shwzv3NIn/AynD71A==
X-Received: by 2002:a17:902:d093:b0:1e0:a2cf:62e8 with SMTP id v19-20020a170902d09300b001e0a2cf62e8mr6761839plv.10.1714772190912;
        Fri, 03 May 2024 14:36:30 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
        by smtp.gmail.com with ESMTPSA id j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 14:36:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Yuran Pereira <yuran.pereira@hotmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
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
	Sam Ravnborg <sam@ravnborg.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [RFT PATCH v2 03/48] drm/panel: boe-himax8279d: Don't call unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:32:44 -0700
Message-ID: <20240503143327.RFT.v2.3.I19086c524d38f28f746befe85cb39ffda9d2f666@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_143632_015241_E812145D 
X-CRM114-Status: GOOD (  15.09  )
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
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.45.0.rc1.225.g2a3ae87e7f-goog


