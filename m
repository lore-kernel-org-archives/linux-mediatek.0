Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A37C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:08:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92D5D24670
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WPNPE9B3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqZQqzcX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92D5D24670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2As77zGiy3N4pDlWfyp06cXs8pJjWvEsAv/wBlvISr8=; b=WPNPE9B3jDP/MN
	SeHnNAL8sPb3CCk6bqPm4xETHX0kRSXlxi7mFMkZsvChfQKfJFSyEtiLce6ZKDjch/XFRjissoUj8
	LPwWIbG4Ya2kcr/TvL+c0gqc8ralthOcBtxKfs515h3IA8ciqnY5RXnIeYRRRzWL4MFu2blZp1AtQ
	Gc8UxPWkArALvBJnSUqAVQzTz5oQgNbBBacpMnex2nSCF8W0DZ+Q9MCK78W6mYmaqXOgfZEaXcnqu
	1BNOr2+aZAlWnfgyqoyIjyigtwjjqErHrXhxRhnFrkk7r1ebyWhV82c72xzJhrCEKX1eWPZHi3PTV
	IiKNVcc99b+p65FPGXSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idakl-0001ee-OV; Sat, 07 Dec 2019 14:08:11 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idahA-0005g6-G1; Sat, 07 Dec 2019 14:04:30 +0000
Received: by mail-lj1-x242.google.com with SMTP id a13so10680932ljm.10;
 Sat, 07 Dec 2019 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=63FAYeXHOLWZvE39+BvFTQvx8rk1mNWwTMgVp4w9KIs=;
 b=HqZQqzcXLz6qqDnZBbtAncz09h4HHdF2Rkf9L00gHYZQMGeLF4pATtZsOyBRySDv3s
 Bl3agh2QBKbOWCqCed3xKaiQ1hIYC4wfRE3lkCWQUbcCp2hc82VNbjrgwBfWtPlyOUUj
 TJPJwwUs5scJ4AZ3yh3dgLIhOcFzhQCvGwbnLzxnHt909E9Zlma812SMN43OXAbuKxhA
 TH6UiuR0tJW2YyO2/ggmZGxM7VQ+KvuhI20nEw/+PuNfy6SuD4QeOEzWmGd6pbg/zb+1
 IKovefo+w7fUJoUZPp71KIiPRelS6vNLmT9JDbi+oRq5TSvBn3wWF86rEoCCs2oWMu1x
 V6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=63FAYeXHOLWZvE39+BvFTQvx8rk1mNWwTMgVp4w9KIs=;
 b=a847/VLfA7Yjm26J7oX8PiVacVlJ88GPwHCTzDLq/3J3PZWWO2q2u8f/hqtOHv9MJu
 7ZTrMp7Dm0fCODJtDpJ642ADRq+Rv2UjwJ3cF9UlCBHW/blddMy+Wkkdb9UhwNdt1vcE
 LXJJYuV6ySGeNZyaYmXMOrAPyRcdK5J4r7dhI76/aPcwqnosoIJawSlE7ormwBT3EC7R
 YI5Oji0IdlA4sjn+rwdj+/s3uOUzb6ZkK2IerTPRLtfNFrFJuCMExPfRmoiQevlf1mGs
 EUZlMRheZ0edk3QlgbPUPruXGWzbxPLRwZ+rZzofskjcF6eDA5f/o5K1sLrv+l8JYQJP
 SlcA==
X-Gm-Message-State: APjAAAUl/10Nb1zbP9FQGFsIMHcIUBeObFVbpywfga4jOFuwQ+sCFnfU
 rhZqX6CPZoWU75GtdsxI7iw=
X-Google-Smtp-Source: APXvYqwCXvyDmoKVIc4zlBB2XBU0M9Y6CN9iEAOB/MhVUE9gB+QmdDrvfL6CdFab3+wa1LcGnDUevg==
X-Received: by 2002:a2e:548:: with SMTP id 69mr11532790ljf.67.1575727466338;
 Sat, 07 Dec 2019 06:04:26 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:25 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 09/25] drm/panel: ilitek-ili9881c: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:37 +0100
Message-Id: <20191207140353.23967-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_060428_764536_CBAC9315 
X-CRM114-Status: GOOD (  13.36  )
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
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 31e5a4e67750..f54077c216a3 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2017-2018, Bootlin
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -25,7 +24,6 @@ struct ili9881c {
 	struct drm_panel	panel;
 	struct mipi_dsi_device	*dsi;
 
-	struct backlight_device *backlight;
 	struct regulator	*power;
 	struct gpio_desc	*reset;
 };
@@ -348,7 +346,6 @@ static int ili9881c_enable(struct drm_panel *panel)
 	msleep(120);
 
 	mipi_dsi_dcs_set_display_on(ctx->dsi);
-	backlight_enable(ctx->backlight);
 
 	return 0;
 }
@@ -357,7 +354,6 @@ static int ili9881c_disable(struct drm_panel *panel)
 {
 	struct ili9881c *ctx = panel_to_ili9881c(panel);
 
-	backlight_disable(ctx->backlight);
 	return mipi_dsi_dcs_set_display_off(ctx->dsi);
 }
 
@@ -423,7 +419,6 @@ static const struct drm_panel_funcs ili9881c_funcs = {
 
 static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 {
-	struct device_node *np;
 	struct ili9881c *ctx;
 	int ret;
 
@@ -448,14 +443,9 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->reset);
 	}
 
-	np = of_parse_phandle(dsi->dev.of_node, "backlight", 0);
-	if (np) {
-		ctx->backlight = of_find_backlight_by_node(np);
-		of_node_put(np);
-
-		if (!ctx->backlight)
-			return -EPROBE_DEFER;
-	}
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
 
 	ret = drm_panel_add(&ctx->panel);
 	if (ret < 0)
@@ -475,9 +465,6 @@ static int ili9881c_dsi_remove(struct mipi_dsi_device *dsi)
 	mipi_dsi_detach(dsi);
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
