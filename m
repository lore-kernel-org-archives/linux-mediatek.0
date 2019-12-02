Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13357C432C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:38:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D310920848
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvdshq/k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sddcI5js"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D310920848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aUAjNl5nNf60JdNatPPAUjCNSEhrhy7ftgR6Y26YfE=; b=pvdshq/kqbtFiM
	ft1z85cO97HYkYHCKqWWTKRT7NtCWVoGnUKdjdt2hGAerIR8TtonOvvFHhtOl9xosgBtxk53M3znl
	4CWlAdenUk8RXZ9kvCtXur9VMIKR/S+q+waK8tnWB3QRnatd6VCV1wF9fuBIN9P2gXUai1CqtNUQ3
	a8KGRdshP7CKeJ8Gn5Ez+6/Pd5G8MzL1VdL9jAo4V4LpUUhrnPbSFYSOTB8Jq5MXwd9n4RAmaI5l9
	5hYOpgTguWHIqjQezcrWcyi+n3s5rKpyKitt9zjYd5bxcN/IAn+TAnY5JAbE88hWLM6j43jCBGTcu
	O0lcxp3q8i71XrzrXdEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrWM-0004df-Tf; Mon, 02 Dec 2019 19:38:10 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrRp-0007eZ-KN; Mon, 02 Dec 2019 19:33:35 +0000
Received: by mail-lj1-x241.google.com with SMTP id s22so826294ljs.7;
 Mon, 02 Dec 2019 11:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziacaDT5ojzWXLyawunTmtP2RY8dGuryn8kq/1BtKS0=;
 b=sddcI5jsaMfWn/78NbEh1ItFa3htles17a7S2GxuBnfw8EGrqWdQq7HkZHjqJsWvut
 VDGhwKNOs1pB6+2hSoNc2Fy2/J9jzTBQrmOb5sEwxK9MZJN+ydX4fCPg+t7aD1qKpkjo
 yysZG995mtrjjGPHCESf/q/8KceeZ5wnp6IMEmhZzcCag438p650Fn3bpikZtooCDOPP
 Ua3HwNS8A6DCrNhqO/b40VgQYJiJLttWNgb6bEX7jsLZ7tLx1hu5f50E51pgUTHh2gFL
 bVk46NLX3t5W/tDxiZ9YYAY8yqZxCBR7u8spRmvuAKL7fBjVd+US3HBR9HtQpkxcj63h
 pSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ziacaDT5ojzWXLyawunTmtP2RY8dGuryn8kq/1BtKS0=;
 b=eomW6Xb3qVt/m80v+YyA1rAJdbf75ptoJKiWagkYierkLa08ZdmY4KGS6InPQ7ywu0
 lg/7X9ktaV5D2KQxcKwEpPQwvzwcQfg7yIdI4pTPW2yGRcZxWVBmX9gl9Or1GxrKDl7o
 fOnbmP2i3B5aO/167dLDU4x9c/wzu1VS7Ou4hAW6dmPGDdu8zne4QlhbPer0tywuEEdp
 AbAYako3Ri1gEiI7lHeFMQ3IK1D6JiODuSlJPrx1cIVbNSQDFD8YPFoA/QaBEGoeHH7Y
 87K7RrLll03dd5/36qrBBOO2uI9IASJf3s4tGjUI+aRqeuUJ/gnye0JEzhqNaa2qUjx2
 MeLA==
X-Gm-Message-State: APjAAAXrufXRfhUSl9aXosMzmZWzNldBI4pnanRDxyGPeo1XeC4gG345
 uOWhocWK16agtTnc3KDKLUA=
X-Google-Smtp-Source: APXvYqwu5DjS+1a3b7ZBEWBw4hcW7WJdhp41DTTVhmMuxsDxpn8LvqwTqvwr8F6v3F4KQxwRHBv+sg==
X-Received: by 2002:a2e:9110:: with SMTP id m16mr278458ljg.140.1575315208043; 
 Mon, 02 Dec 2019 11:33:28 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:27 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 12/26] drm/panel: kingdisplay-kd097d04: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:16 +0100
Message-Id: <20191202193230.21310-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113330_327869_D7C77225 
X-CRM114-Status: GOOD (  12.61  )
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
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
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
