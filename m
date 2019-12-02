Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4860EC432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05DC920661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rdPMFBER";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6seJeav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05DC920661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUzV7B9V0487sg6xHGsEK2gkIq2M6uQkj4cgmukVPqg=; b=rdPMFBERSIsnnq
	rw4mCKl6Q03UutmCksmgRW4exwvX6KEuFKv9vsezrh9k+5w5xi4z9d4eOTnMfMztyNoWjFKquKqBz
	sWZLKGI7BzSH36Ud6hBkfWYB5wNKYUJpGc+kuVlFcfgTaQQnlfV1qwYl06f2tPzd3wWW+9pWXZ1BG
	zb2vs4yQ5DBDQuRDzBkXKi33xtW2+H/yHTle0+VvdMPxLu1Guh+LX8NELmimXm6zkI3RskjTzh/iY
	6vHCTWD2PrsZVwAyg2Y8Fsa72H83ycfGyhcCqVC/PaB4VYLNiB5vppAqDx6qef/ThinOWf/W0UzTs
	oVbNG64r36GaHoa+VqRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrcZ-0003gh-4y; Mon, 02 Dec 2019 19:44:35 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrSB-0007xO-2G; Mon, 02 Dec 2019 19:33:57 +0000
Received: by mail-lj1-x242.google.com with SMTP id 21so877714ljr.0;
 Mon, 02 Dec 2019 11:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hAKrkmNcCozl3LAaqRfeNwt0Xqu/w+s6/exQHnAaPSg=;
 b=X6seJeavAuZ4rDdxOy9hEnXoLG0oobxXRy+xY8wWgitF4tTB87MsPXIcIuEVV0uvti
 W0R5e8qXxki30sA5dYdKwlmPgklxVKxb9+aHG3PRzFh67me+5fs4qU+wAFieX4NtPJRF
 2rGj0gksOxyaY6AI60t4e0xlhYM6OlmvJoiWNC3RYbIUiNJFWLIl8b6KjN07Tv5Xu2Xa
 DRWiNyEud2lLwiSrC+fJQ4G1SvpUCCuVsxuERVCrTeQsJsBzRFAmyhlurYrx1WrWpRH7
 9wuWiasSHXHEw7O6gYBiF5ZPb+ywMbAa1wk7mSydtG0bzvyJPFr+gutNvONhGKFwSg0Q
 /Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hAKrkmNcCozl3LAaqRfeNwt0Xqu/w+s6/exQHnAaPSg=;
 b=tLzUzl/HiliMBIXPMov1F9VWFYIGj4uL3oN/GvEADu6kcnbR3cKOhtM7QdjMWabM2Z
 mlJn4g3c/X+Tn8aVLr7j9kA/LPmtReZihsitL7i9eA4vnWfreMDVzKFHAaD0KWTnt9vb
 fiLQhuBEXh9xoZnE6XnbFZVn4WRV8VSyhsYXmyTfAz0AdS7UWDJiZJeKuzLUZVzbBOB7
 4qnmE0rk3D0DTvKgB9vl9HRcwupAXKCpCkkFHPHCkVomHHQQqzUQNImw5Qu7jTD7Ja31
 BK/nY90ul48ilhE2ZqiP1DM/NDurGQYZnS5sKSbI80QWglWRahNhDstUo0gg0t3vapU8
 LApA==
X-Gm-Message-State: APjAAAWOQVGUJ5zQc9gI8XEZHVWJEeSg4XTYnu52SyuQ/2Lk+nSkPhBd
 xNvC/+NkbqgXVPmixbkmC6w=
X-Google-Smtp-Source: APXvYqwkSwEanVTfqqupRACq5bTVVsNocJ7zo+uG5n6CAnsmd9lWBvGtWMlkSAMwbQN9o+Rbbx6T4A==
X-Received: by 2002:a2e:970e:: with SMTP id r14mr254679lji.57.1575315229302;
 Mon, 02 Dec 2019 11:33:49 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:48 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 24/26] drm/panel: sitronix-st7789v: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:28 +0100
Message-Id: <20191202193230.21310-25-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113351_183370_D9286FC8 
X-CRM114-Status: GOOD (  12.65  )
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
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 37 ++-----------------
 1 file changed, 4 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index ebefe2f4c26b..cc02c54c1b2e 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2017 Free Electrons
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -116,7 +115,6 @@ struct st7789v {
 	struct drm_panel panel;
 	struct spi_device *spi;
 	struct gpio_desc *reset;
-	struct backlight_device *backlight;
 	struct regulator *power;
 };
 
@@ -323,12 +321,6 @@ static int st7789v_enable(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
 
-	if (ctx->backlight) {
-		ctx->backlight->props.state &= ~BL_CORE_FBBLANK;
-		ctx->backlight->props.power = FB_BLANK_UNBLANK;
-		backlight_update_status(ctx->backlight);
-	}
-
 	return st7789v_write_command(ctx, MIPI_DCS_SET_DISPLAY_ON);
 }
 
@@ -339,12 +331,6 @@ static int st7789v_disable(struct drm_panel *panel)
 
 	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_SET_DISPLAY_OFF));
 
-	if (ctx->backlight) {
-		ctx->backlight->props.power = FB_BLANK_POWERDOWN;
-		ctx->backlight->props.state |= BL_CORE_FBBLANK;
-		backlight_update_status(ctx->backlight);
-	}
-
 	return 0;
 }
 
@@ -370,7 +356,6 @@ static const struct drm_panel_funcs st7789v_drm_funcs = {
 
 static int st7789v_probe(struct spi_device *spi)
 {
-	struct device_node *backlight;
 	struct st7789v *ctx;
 	int ret;
 
@@ -394,26 +379,15 @@ static int st7789v_probe(struct spi_device *spi)
 		return PTR_ERR(ctx->reset);
 	}
 
-	backlight = of_parse_phandle(spi->dev.of_node, "backlight", 0);
-	if (backlight) {
-		ctx->backlight = of_find_backlight_by_node(backlight);
-		of_node_put(backlight);
-
-		if (!ctx->backlight)
-			return -EPROBE_DEFER;
-	}
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
 
 	ret = drm_panel_add(&ctx->panel);
 	if (ret < 0)
-		goto err_free_backlight;
+		return ret;
 
 	return 0;
-
-err_free_backlight:
-	if (ctx->backlight)
-		put_device(&ctx->backlight->dev);
-
-	return ret;
 }
 
 static int st7789v_remove(struct spi_device *spi)
@@ -422,9 +396,6 @@ static int st7789v_remove(struct spi_device *spi)
 
 	drm_panel_remove(&ctx->panel);
 
-	if (ctx->backlight)
-		put_device(&ctx->backlight->dev);
-
 	return 0;
 }
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
