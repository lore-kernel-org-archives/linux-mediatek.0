Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855E8C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:12:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AD1124677
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uLPvsooW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKMslgi7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AD1124677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEG9SXdk0mcmICcpRyHjMpf0oeXYrsQgWpmETf08kts=; b=uLPvsooWb7IuzP
	4ZM640QGfidzaLrdMlZHld3TOiLm6FuZggQnLRDrVx/eg/L4EsUhS9BvosmNt/IO88+mEJ+OiKJup
	yOJ3Q20O2mFAk2up9AQvKxFjZcL2kZCCnX/ISkeQC79fJb+z9nrnY4ztsv73ch5HPPF66Jz1qSKHo
	k9oxV6KCyl++S3bOb9zLUo0AoGS5elgYjH7tYmwJkP62c3zyiYUMCtQEbwQ5EjeT3748i5cEXe8nC
	y7EYl7penQTwRZo+/20urWTnsR6H2NvRyGGDWP9QfSx165fQ1sd+GIpMWWmytrKBvRms/3A5+xQOw
	E6nNFYkORQKrREPWcexA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idaos-0006w5-QB; Sat, 07 Dec 2019 14:12:26 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idahT-0005te-M4; Sat, 07 Dec 2019 14:04:49 +0000
Received: by mail-lf1-x141.google.com with SMTP id y5so7411914lfy.7;
 Sat, 07 Dec 2019 06:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uKgoBqJhtrf0FWUc5M51wYfkZmsISTzPDRkC9yTue0=;
 b=BKMslgi7xVleeGecLAw058JIH7yjiJbxL7EUfvDrF7ShlQN3W64dYFsUxPMbZpu2Ua
 rudFkHBfL5wF5rQEL7uQFqEe4tkPUXOk0hOb4gbS0ZD8vtRdMQjsAaUZjU7kJXDwY3WX
 ED7LxMWBBNGf/5bVvUoxDIHKlkBnwGEv27+DfXooZfRNTvADOTMlGhdJjDM4uXxdz+Yz
 mt5GhO3kOfbw55PgQhojY5FYla6MXgjFxa2yOsYgAaB95oQ6zJjkyMPUIHxhvBgOasFY
 MYkm5M2fQ7ZSbYE6H697I/iMLKnnD905ch98WaA6uG1g+S4RDVzHtatnvdhXpB3gGLQy
 EL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9uKgoBqJhtrf0FWUc5M51wYfkZmsISTzPDRkC9yTue0=;
 b=CA5aC9GOM9MK1n3lWj3lEVCvQTcvyliDWOjszfU8quBoEcdrmpfrIW+e+KoSpbX8eT
 2ktYLz1xq7+gijHSglF0OB/R4hbohsrvYhbOe5OMQ0a+mg5r2Mm8YqohvBVgPJpZrDWG
 Xvq+Inj59/Jk0DGr2OuEgYoUpWBY0H8XgbD4iKr0CRJ1RoebDj1+PGwRZ0We0vYyp43s
 hJ1o+36APOzz6suaK9YdigKa4Z9cWKsKAwEzve8nDXWO2XZ4h9yw4fOuC1uF5ry6N5Fy
 bvJ4nfBstheCHJpluGl8kQSb38F4UwflhAR5xlVXY7IIvsXlKO+v4/j+4liMVwvr4Ioz
 aKdw==
X-Gm-Message-State: APjAAAVFBngCda8h3t3VGrH1FReD+lZSV+fT/v4IIjw8F/ITJULq4/Sr
 6qLHF9r+s8x1tE5qwEh95Rk=
X-Google-Smtp-Source: APXvYqy4lENi/Wt/Q68tswRQRbAi0Mnhg0y9s5hIE9FYqSGHRzwnKB+/7xYLTqeFrZoDIkk+/ng3RQ==
X-Received: by 2002:a19:5e16:: with SMTP id s22mr564453lfb.33.1575727486014;
 Sat, 07 Dec 2019 06:04:46 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:45 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 20/25] drm/panel: sharp-lq101r1sx01: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:48 +0100
Message-Id: <20191207140353.23967-21-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_060447_743676_D9CA73E0 
X-CRM114-Status: GOOD (  12.43  )
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
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 17d406f49c3d..b5d1977221a7 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2014 NVIDIA Corporation
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -23,7 +22,6 @@ struct sharp_panel {
 	struct mipi_dsi_device *link1;
 	struct mipi_dsi_device *link2;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 
 	bool prepared;
@@ -94,8 +92,6 @@ static int sharp_panel_disable(struct drm_panel *panel)
 	if (!sharp->enabled)
 		return 0;
 
-	backlight_disable(sharp->backlight);
-
 	sharp->enabled = false;
 
 	return 0;
@@ -258,8 +254,6 @@ static int sharp_panel_enable(struct drm_panel *panel)
 	if (sharp->enabled)
 		return 0;
 
-	backlight_enable(sharp->backlight);
-
 	sharp->enabled = true;
 
 	return 0;
@@ -317,7 +311,7 @@ MODULE_DEVICE_TABLE(of, sharp_of_match);
 
 static int sharp_panel_add(struct sharp_panel *sharp)
 {
-	struct device *dev = &sharp->link1->dev;
+	int ret;
 
 	sharp->mode = &default_mode;
 
@@ -325,14 +319,13 @@ static int sharp_panel_add(struct sharp_panel *sharp)
 	if (IS_ERR(sharp->supply))
 		return PTR_ERR(sharp->supply);
 
-	sharp->backlight = devm_of_find_backlight(dev);
-
-	if (IS_ERR(sharp->backlight))
-		return PTR_ERR(sharp->backlight);
-
 	drm_panel_init(&sharp->base, &sharp->link1->dev, &sharp_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&sharp->base);
+	if (ret)
+		return ret;
+
 	return drm_panel_add(&sharp->base);
 }
 
@@ -408,7 +401,7 @@ static int sharp_panel_remove(struct mipi_dsi_device *dsi)
 		return 0;
 	}
 
-	err = sharp_panel_disable(&sharp->base);
+	err = drm_panel_disable(&sharp->base);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
 
@@ -429,7 +422,7 @@ static void sharp_panel_shutdown(struct mipi_dsi_device *dsi)
 	if (!sharp)
 		return;
 
-	sharp_panel_disable(&sharp->base);
+	drm_panel_disable(&sharp->base);
 }
 
 static struct mipi_dsi_driver sharp_panel_driver = {
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
