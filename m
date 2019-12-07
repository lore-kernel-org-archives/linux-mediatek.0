Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCC7C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:12:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4D924677
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:12:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l20/Ke3J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxXSoMt5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4D924677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMfz1QTrXJzYrbVcBxy3feoh9zImv+67aET7AhSXwLE=; b=l20/Ke3J2SEYHE
	vSMR8Q0nMAMi5EYx8+YoAvXiAnp0vW4TW79phgz35X9JeIFsEXmPLWi9b/sn3s5zkuAU5kB5f8k0p
	oUeHFT8T0pIp5VUekkxChMfR2gM/KLVBPxWYRRJcsMx0FhyU1zMQW/FiuCX49oLYZcSJ/jkfQJQn/
	EI0NeHEpVImTB/r5MjhuUnAwS8vcCO+8SZqTuzyEqHRg+PtWJgxRvPnwmkS8uMbSTb1BK4EuSGSJf
	qeqAq8cKnWjHtD+d5i56wG1xvB0eUsrLGGfoE2LiSsK5rH4Lsl8FZIJejUXt7maatjjqiOJFqKgaE
	5krTN6IH4OdXM6NqvCMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idaog-0006gn-N8; Sat, 07 Dec 2019 14:12:14 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idahQ-0005r6-Cj; Sat, 07 Dec 2019 14:04:47 +0000
Received: by mail-lj1-x244.google.com with SMTP id e10so10697481ljj.6;
 Sat, 07 Dec 2019 06:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FyzdtrGlFpa66vBX6d0CokXkZKTeTI49fgevppwlQZg=;
 b=OxXSoMt5KqlihAHzAB1tJW/fsjhsEVaVIHQaxDsigHnPvpF+WpEYROGZBvnoIyXDMc
 iTKm69RRPHv7BTKCbm9ObKOcHrT32z/UPlc/Glf9bUIo528EwwWmQZx7GAt+6Jsb10Om
 fcHNr+GJBKvKi5S1pnU9KrJ02ERnGk7w1kOORaWMN1Pt+X1ZEfJpsICzjXkuyzSIz8pZ
 NpVBk28gMihwGzY1CDV9Y0LcT2EqA6Iu9DV3egrmbtWVtlPTTyxQw05se5aFkzoao3yl
 Crfxl/Rn3rB20oEjkeD7xmWORzd3XpiPpJBrpwgakGE9FpVGwYL10TAsQFhHJysyftoA
 +tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FyzdtrGlFpa66vBX6d0CokXkZKTeTI49fgevppwlQZg=;
 b=jBKS3w5jyPxkUHflPgfLFif7iBDbDRD/zpXftFUVsP1EAD8PkEW9O0e3cIDd3YvjSP
 iJ5o0UUou1CqQ5mqgleAyZGmHBPS61eCuSSrqIfP3BIGPjuoy/yCCsQyw4EfgSZUK6QW
 GHBo6Za0ktjaUYq+geOAW5pnK9+NhTHDFx4FSozuFsIhKAr/VbmTdjqRoryfXLYP4v9A
 c7TNMpgAG7s4YSUKXk64GHdJZ4aUuMaOqG9vpIvg9jEy1N6T2OXhegbSPjYWiYXJA5T5
 oiFlK9cQO6uBjvvNdgme23uNKZVga/y9zZ0+kSxOnAEYMi11B0nsen6GoGoavhOrlX9t
 gBew==
X-Gm-Message-State: APjAAAVtySnA/YO25Bv0PL+tjOcUzL8wcUtDkai4sPMrObbmXXUpdTvu
 dlHOwC1Inn8vxSeiQsBH5KA=
X-Google-Smtp-Source: APXvYqzmbqgsvM4MYLG+23AC8GtnbZ5+HS2M1nUpn3JGh1VQ6K7SA75id3AxcVjTkWFzhcRKBys3yw==
X-Received: by 2002:a2e:9194:: with SMTP id f20mr11614068ljg.154.1575727482524; 
 Sat, 07 Dec 2019 06:04:42 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:42 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 18/25] drm/panel: ronbo-rb070d30: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:46 +0100
Message-Id: <20191207140353.23967-19-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_060444_645565_3DE3DB9C 
X-CRM114-Status: GOOD (  12.21  )
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
