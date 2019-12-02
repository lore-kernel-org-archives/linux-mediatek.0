Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EED0C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:44:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB9620661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bIx8ksTR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrpzjoCo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB9620661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8r7z+BluZ/8swQFSgU1qv2FIT19K7TRud0tfL/8B/dI=; b=bIx8ksTRlxHSKf
	RlbWrLzjrPh3a+zDyXofIbaKh2GO59WJq7ZSU3XhLo/tZDg3qLRWLeuivvqc6cVVVFiDk800Io1m3
	FA2blUV2gXxIBzP05lISKRA5cx9aFuGQWqojtBPLFmRK8F1NpZWwbi36ttCDW1y5qtq6LpVZCe9vf
	/8On3nweaytmY/jJcCjTl8I436Z2TsDJNDyGWIontE+E8vwLeV9laAomJvozCHC9OO0/tghfrgxj0
	L7WFaY8+zZrpBIPpup6J9Xd5XhAeWeYPIytw+flHkp7/+Qgn6rq+uf4c6R96QZ1KzKxLqggDJuTbg
	N5I6Pz7FkOSsYEnEAx/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrcb-0003io-Iw; Mon, 02 Dec 2019 19:44:37 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrS9-0007v9-Kn; Mon, 02 Dec 2019 19:33:56 +0000
Received: by mail-lf1-x143.google.com with SMTP id m30so768200lfp.8;
 Mon, 02 Dec 2019 11:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u1P14KeAOzrkL3LNTshRMs65q8V9CfCv8YTP7h0aK64=;
 b=JrpzjoCoLqwt9XJXm9NiiM6/tImyc78Qynmiev/loI9ukXyLXuVueEfltQnqgtLMsR
 JycYlyEvffuZWj7Z7TOdRqlz+dyRHYl5icP+sjNhYoVrW/GPm5XmLAsdlYd8VGUI4aOj
 vGYTy8sjIrLh/pcKwJ/iOhlyeCR3u06MCTKDI8Cvb8bFmM3gyXY+jwIWsXaDh8bqssFz
 hQw5MqZ1KqhzUUum8KD0GL3eFU2X6gW0+rpXl5mpPep81T1FBL9xtPRbI0xjfS3u78is
 Dx9sJKJwySbgX5RyJ+xbNW1dS8FbwR58QRkO08VBKwazlwTmeO0U0FJ9N15PZT741s1A
 Ru/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u1P14KeAOzrkL3LNTshRMs65q8V9CfCv8YTP7h0aK64=;
 b=eIAhk8fwNyHPUxPeAYlLUg0No+Z1uGiKk+YbVzHOu4hqx5cixVODMGMwvT8mEQECSG
 kbUhn4ae3X3xvJhJAS0+wDoq/ihlfNiprVCD95k0gVLTlNIwl/sDkiFz4YAoB8OrE823
 9eKYYNmwFPeUhLvgf+dBeJixtrskgyIrYEmG4f0pNZBVQRKdGyz28IFk4RLrYmjf4KBH
 y714it7xsLS/Hp3jKgBvLMGhZn8eiR3sxsIi4eTPvyGXsTGBeop0EaeONxv31AC7eUtg
 428vJY48nvOCSLSUEFlX8qq7DwXHFMD/wfFiTVUpiYK9eQqvPwYJRuO8JrhLJP5Pbg86
 wVyg==
X-Gm-Message-State: APjAAAVLmgn4dtQeTnrM5EENpjkX/p+dOaguvkujhtqyO+6rUgt2PR4M
 CnUWOZkIRoeuhLcA0/PPMSiy2nYgclxmwQ==
X-Google-Smtp-Source: APXvYqxwbVLzsiX6A4ZpKGEcYM1Fgrfee7HhMpCObNZmnZ3kty6IsgrehL3h2mIoslhqWhw9cf4q1A==
X-Received: by 2002:a05:6512:499:: with SMTP id v25mr439414lfq.9.1575315227477; 
 Mon, 02 Dec 2019 11:33:47 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:46 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 23/26] drm/panel: sitronix-st7701: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:27 +0100
Message-Id: <20191202193230.21310-24-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113349_953021_6E85E5CC 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index c08a865a2a93..4b4f2558e3b4 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -9,7 +9,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
-#include <linux/backlight.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -103,7 +102,6 @@ struct st7701 {
 	struct mipi_dsi_device *dsi;
 	const struct st7701_panel_desc *desc;
 
-	struct backlight_device *backlight;
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset;
 	unsigned int sleep_delay;
@@ -223,7 +221,6 @@ static int st7701_enable(struct drm_panel *panel)
 	struct st7701 *st7701 = panel_to_st7701(panel);
 
 	ST7701_DSI(st7701, MIPI_DCS_SET_DISPLAY_ON, 0x00);
-	backlight_enable(st7701->backlight);
 
 	return 0;
 }
@@ -232,7 +229,6 @@ static int st7701_disable(struct drm_panel *panel)
 {
 	struct st7701 *st7701 = panel_to_st7701(panel);
 
-	backlight_disable(st7701->backlight);
 	ST7701_DSI(st7701, MIPI_DCS_SET_DISPLAY_OFF, 0x00);
 
 	return 0;
@@ -366,10 +362,6 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(st7701->reset);
 	}
 
-	st7701->backlight = devm_of_find_backlight(&dsi->dev);
-	if (IS_ERR(st7701->backlight))
-		return PTR_ERR(st7701->backlight);
-
 	drm_panel_init(&st7701->panel, &dsi->dev, &st7701_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
@@ -384,6 +376,10 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 	 */
 	st7701->sleep_delay = 120 + desc->panel_sleep_delay;
 
+	ret = drm_panel_of_backlight(&st7701->panel);
+	if (ret)
+		return ret;
+
 	ret = drm_panel_add(&st7701->panel);
 	if (ret < 0)
 		return ret;
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
