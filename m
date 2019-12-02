Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69195C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:41:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E45620661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JAxzoSsw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXUTqMev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E45620661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/Fl/zBi+S4XF9lYe0gyyacGyggZH4DizIb2fPOIJ/s=; b=JAxzoSsw9S3YH3
	h3M4TS7/XzkmfcyJ3xTcsrVuYQInMsvTBkhZcUN2302uIL5iqu7jY9OJkBtGu13sdMi0xAVPG88dx
	V4dKZ1WEpku9DmxVQqbnRG6TEvL7oF/7UGXU7FPynzo/y+ZuZ42WLZHo5kcu7C+de2cCaYx0QR2bh
	1z1cw6IPs2KMbjYmtbtqEt1+f65h9q4ZY6awliHkUnwaL5I30aYlNY5Xfaockx/vdIJ+nCyi0ESmV
	hw6JD5SQxO60s5f1qsmjI+PcxS/Ia34dTrIC2o99WRZJMmVgawsYE/eb8re4DATfSTlliZewxUF97
	0GG3uU5XTYkfKK+/Y8gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrZ8-00005c-M2; Mon, 02 Dec 2019 19:41:02 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrS2-0007ow-FY; Mon, 02 Dec 2019 19:33:44 +0000
Received: by mail-lf1-x142.google.com with SMTP id q6so777464lfb.6;
 Mon, 02 Dec 2019 11:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RAsbC5cqN6MKFPQ6PG5e5K6xQzBWVJ78zoRaemBgaGg=;
 b=TXUTqMevG+NnSg2VBH8v+6DuQCnq6JRVAalnYOEupDPG7sgQ4MOBs0GxgbTost/kN2
 5W4yzzNwg+Y3BitXq2T9jpEpfJHIptbCJeIjvnco+zlT2eefFw4RBaEB+ibA+F8H7ymY
 AkNZCpxsiTQfe0XRmefXBvT82/3Wnq/R7+W+Dc195BoXoXm3NxY3jx6fhADMTjgo2ZDN
 4Onzbk+H6sTnkhdgzv7O4OOSO/csJHyyJn6Mz73f1WDRE/lYGlRqBp+jCTYqz4XJtUlD
 WhN2e+8+09qJ90X8cql4g9vMVXvF8HZXhmAp7SXQ2gvtV5c75/VwyBQyjSXFwqleuXbC
 mLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RAsbC5cqN6MKFPQ6PG5e5K6xQzBWVJ78zoRaemBgaGg=;
 b=CHACvqwYutSWtHcv7NyLIcZNft4M8vZFig70IixDwYulRlZEkZhdzykVqV5jmZY7uj
 vkaAfph3EPAgvf4DMmhhVaUgTCko5zDu6CUKGhOEM0/OvXER7dvey5NJ4DWf3nwto4EK
 Ys7C8YsHrRU2EsVj57OKCPUshEzPClRa8gnI50ZBqYNami9tarugR3oax0AbjgjreYQy
 bcq0toUNb0dkUg9Nc2hvJAJsUcHiK7AU58Q67IO+bDa/XH+vWvyiA1ahV50IcOn8XnVi
 C/PLXK3rN7a5t0fCoTuOvcvnKR2i3oonCoxnMNGlpMRI1Amk/0XCymS4BZfvk+a0Axbg
 37CA==
X-Gm-Message-State: APjAAAVdyaQzLTEjw9ofudKOuUTn5uZmdl91Yqufep3MzOHFawNqp6Vu
 38R1FTji8ys0Z0fAsDLX0W4=
X-Google-Smtp-Source: APXvYqxgC0o7yY6+/wa5jNY1ByPzl8EwYMqBcVDLKKwFraG7QLXiwa/WDguruEd1xtBPdhlcSdCT9w==
X-Received: by 2002:ac2:4946:: with SMTP id o6mr432258lfi.170.1575315220244;
 Mon, 02 Dec 2019 11:33:40 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:39 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 19/26] drm/panel: ronbo-rb070d30: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:23 +0100
Message-Id: <20191202193230.21310-20-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113342_632273_F26AAB38 
X-CRM114-Status: GOOD (  12.42  )
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
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index 746a3a221100..ef18559e237e 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -7,7 +7,6 @@
  * This file based on panel-ilitek-ili9881c.c
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -29,7 +28,6 @@
 struct rb070d30_panel {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi;
-	struct backlight_device *backlight;
 	struct regulator *supply;
 
 	struct {
@@ -84,22 +82,13 @@ static int rb070d30_panel_enable(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
-	ret = backlight_enable(ctx->backlight);
-	if (ret)
-		goto out;
-
 	return 0;
-
-out:
-	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
-	return ret;
 }
 
 static int rb070d30_panel_disable(struct drm_panel *panel)
 {
 	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
 
-	backlight_disable(ctx->backlight);
 	return mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
 }
 
@@ -208,11 +197,9 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->gpios.shlr);
 	}
 
-	ctx->backlight = devm_of_find_backlight(&dsi->dev);
-	if (IS_ERR(ctx->backlight)) {
-		DRM_DEV_ERROR(&dsi->dev, "Couldn't get our backlight\n");
-		return PTR_ERR(ctx->backlight);
-	}
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
 
 	ret = drm_panel_add(&ctx->panel);
 	if (ret < 0)
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
