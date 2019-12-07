Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AB9C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:11:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C62A24677
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:11:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TqRJpID3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s22pFD4Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C62A24677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQXxfrlPchiqbA3UnoL/R6QwwtyjAey0EsULuKV8IAk=; b=TqRJpID3t372hM
	zvHcjPo9n2eE5Val75HRPp9icIPH6SmQ5h2qTPc6zO3lLHeNmXPVMuhyMPN2r4UFf6F9cCa9RG5LY
	9hPhp3y3n14bGvkwVEjyG1yHCoxlS0rSLbgFCRjUY8rICYJ5f1FSyAFGkxGz9j7IzYYiIcqkyhClC
	PhKEOlQh+foCwZs5Bo8reRAzoBTx2R2+a3UpvYnDsw6VZkqBRV22ppq7IYdjwXDXbwzGNUu97IF8A
	vC0axAx2Rq/fUU8VBj/V6yVH0W9zwzcykhTmC7m6OKjm/pDnsZPnXHt6OSc+o+oYyx03vfpOiHi+Q
	GYKInC4kqH4RFwDE0rcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idany-0005tx-Mx; Sat, 07 Dec 2019 14:11:30 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idahD-0005iv-MJ; Sat, 07 Dec 2019 14:04:43 +0000
Received: by mail-lf1-x144.google.com with SMTP id y5so7411562lfy.7;
 Sat, 07 Dec 2019 06:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCcsUdwReshm9HwMNcrU5BxdMhIAKJ/ocTck1sZP+Fo=;
 b=s22pFD4YrEM3PFFzKv+ZLsVIXm+HdH/EaDdcclRIe89iftvcVnXlN37VAJLTLRpKCI
 Joj9aeFpY8riXENAwhHWUGERnh/I5RyC2zHkzJ4cvd/ly3H5g+HjF7GEvZPbNkirgs3P
 ZVynpmSQopiLvYNmQKwKGrQsFS4gud4WijDs1HgxL2uNpFOb7fIg/6ULqcKqAMszS3Rj
 3KtWDPxC+GD7oLwj9GPbI4DrWrOgAo6SdNIDXyYnDcF7eOmSvKVExMRWyVzwV/tSHyMC
 E76/PwPIZVH4HkQC9Me7Eg88eefxTIt8g9IHrCvjj+IcTjeu1oIAncoo/mzoGU9hxyPr
 B8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uCcsUdwReshm9HwMNcrU5BxdMhIAKJ/ocTck1sZP+Fo=;
 b=roLDPej+1NQu+5DK7stNvJ/EYY+PlGf7dWDPk1DNe3O4RcDhz9IBjVVa55H5E9dVQw
 DrC0MyYeZIH6OMP4C9+yGvMq+ZyvyEkWDRjg2q2+Hke3NmhR0/g7wNry8L/x9fNvw2F/
 53Iqs6Bs4RPyQECCb6iKrjQg168CVF3SMXexYsz07yQFuSgD9ggMqdnLmSGNTVVxRUEm
 IKd6OhG0wBcyB5IHbI6+cg9NSyIxuV4RyCnIPsyNHCYSAWcBc3d4Qsm5jSAdqdKdl+pw
 Xv8Wkk/7iFgaSV1ru6DUCyeF3xEBhm+OIC5ioEKfLTDW1wcVDVz9vhERKOp4OVHXVJmK
 2I8A==
X-Gm-Message-State: APjAAAVHoAmtg5Cg+OpCxYJ5JmUKAIuYNObDYd2hIS6SWhapUNIxYsBS
 6c3aUV/eQ+cCOval8KYpIBQ=
X-Google-Smtp-Source: APXvYqwODyhNxo//UXLNaOKxcezmY/8FXmz3+HXMvPwIlwOjWb5g2QkT3BMHdTPdMLzXRsxZlWwl5w==
X-Received: by 2002:ac2:5635:: with SMTP id b21mr814144lff.127.1575727469887; 
 Sat, 07 Dec 2019 06:04:29 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:29 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 11/25] drm/panel: kingdisplay-kd097d04: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:39 +0100
Message-Id: <20191207140353.23967-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_060433_429173_3678C6D5 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Stefan Agner <stefan@agner.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the backlight support in drm_panel to simplify the driver

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 28 ++++++-------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 353ee6caa01c..bac1a2a06c92 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2017, Fuzhou Rockchip Electronics Co., Ltd
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -23,7 +22,6 @@ struct kingdisplay_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *link;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 	struct gpio_desc *enable_gpio;
 
@@ -191,8 +189,6 @@ static int kingdisplay_panel_disable(struct drm_panel *panel)
 	if (!kingdisplay->enabled)
 		return 0;
 
-	backlight_disable(kingdisplay->backlight);
-
 	err = mipi_dsi_dcs_set_display_off(kingdisplay->link);
 	if (err < 0)
 		DRM_DEV_ERROR(panel->dev, "failed to set display off: %d\n",
@@ -303,18 +299,10 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 static int kingdisplay_panel_enable(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
-	int ret;
 
 	if (kingdisplay->enabled)
 		return 0;
 
-	ret = backlight_enable(kingdisplay->backlight);
-	if (ret) {
-		DRM_DEV_ERROR(panel->dev,
-			      "Failed to enable backlight %d\n", ret);
-		return ret;
-	}
-
 	kingdisplay->enabled = true;
 
 	return 0;
@@ -388,13 +376,13 @@ static int kingdisplay_panel_add(struct kingdisplay_panel *kingdisplay)
 		kingdisplay->enable_gpio = NULL;
 	}
 
-	kingdisplay->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(kingdisplay->backlight))
-		return PTR_ERR(kingdisplay->backlight);
-
 	drm_panel_init(&kingdisplay->base, &kingdisplay->link->dev,
 		       &kingdisplay_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
+	err = drm_panel_of_backlight(&kingdisplay->base);
+	if (err)
+		return err;
+
 	return drm_panel_add(&kingdisplay->base);
 }
 
@@ -432,12 +420,12 @@ static int kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
 	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = kingdisplay_panel_unprepare(&kingdisplay->base);
+	err = drm_panel_unprepare(&kingdisplay->base);
 	if (err < 0)
 		DRM_DEV_ERROR(&dsi->dev, "failed to unprepare panel: %d\n",
 			      err);
 
-	err = kingdisplay_panel_disable(&kingdisplay->base);
+	err = drm_panel_disable(&kingdisplay->base);
 	if (err < 0)
 		DRM_DEV_ERROR(&dsi->dev, "failed to disable panel: %d\n", err);
 
@@ -455,8 +443,8 @@ static void kingdisplay_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
 
-	kingdisplay_panel_unprepare(&kingdisplay->base);
-	kingdisplay_panel_disable(&kingdisplay->base);
+	drm_panel_unprepare(&kingdisplay->base);
+	drm_panel_disable(&kingdisplay->base);
 }
 
 static struct mipi_dsi_driver kingdisplay_panel_driver = {
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
