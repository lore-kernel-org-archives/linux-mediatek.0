Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F482C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4043624677
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zq0He20z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dujt1IVs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4043624677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUFlu/HeMM7tZU2DZhY4A2gVXc+LfXXQ2wZvFzRbB64=; b=Zq0He20zC6ZW3W
	Yd56AXvThdBSbquX8mxKaxf8pKGJum/ZYKVtxy5bk2qzDzumuFNEk8VVNwD4UD7/4m6WmPeLknCeY
	9wDSfvqIIvDY3GLvF9l7z8chUv6uodg+qh3rOP/qz0JMN6zqDj+GIsVbWGDnMhsAsZCXD+RdIQf++
	08db3Ra9mI4Bb/mVcbODOgzfBcCHKr9co3DLc/QwSqG+/NvOTSvM7W2ldWfG/lkEYAdup09aJ93Fm
	OrIo5Wos+ACAbcYvA+S/5PXcDrz4H07xZhgtpzgVhuPTNW6QeVRg4r235yKXnljN03Q+02M+n0Zlm
	+8e1NZ4k2LoF03/KjaUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idapY-0007dP-Hi; Sat, 07 Dec 2019 14:13:08 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idahV-0005uf-Am; Sat, 07 Dec 2019 14:04:51 +0000
Received: by mail-lj1-x244.google.com with SMTP id e28so10676340ljo.9;
 Sat, 07 Dec 2019 06:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hw0rPta+AA/XFBLEBOh9a+kLNOAcb6jsKbJs4LtSRgU=;
 b=dujt1IVs5McsvvCsS7c3G0D/mTHDXUMi51mW2f99aBVUYnNM0USN10IKau9DTLbIXD
 N0w1Bxp2ZJQY4VWNYQZf6FDQd51O3sGNhWrqkB3oiiorl2hyxenjXW8v4i4n6DjmTHyv
 TWUFLU2Ow2/imOgILveZLZKmvAdZgNY/Ts4dRuLUCXML6td1LGA3UNom6LzqQ6gCV+t5
 gdcatQfkQ1WDpmFlbC+4HbLPGQ+gzXqkgVRKSHc9MEGkGFjFiZzolhPxEI5C3cKVent2
 vdsdkW1wpeBn3ajpWNmRLDC2AQapSvlxsrHAwg/JfiHH2CzarAQZBYcSc6lVbsqE8Pzt
 DAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hw0rPta+AA/XFBLEBOh9a+kLNOAcb6jsKbJs4LtSRgU=;
 b=RrATGeMrjOEvXqPD7M3L1AO7tbtCBEQLkHxnvCsM0ZWMUdk2Z9b8O72ehNVCKcDb27
 XESXtxVqI2E8WNG+ff/GrBJjwE4aPnZJUdulmkLrXCRMdw/THdIHnI3Z/VlC/XlHCxUQ
 7qMyGtY/gBCxPM2eRkDrGezuuQVLWnUJoJiJzFKjSV7zLSIqnX59XSBcr5tBfmgyfMKU
 JaI4/YHVhyXCM3b1xFP7UWumrUOVwXoWo9wve2cA7sxjrxoWb54AVV3g93NRHjyYvB/O
 WfNsoIai92ZetonSTRim0bI1OWHNz/oKG6gyVFD9L6lx5vss3TIF3LvR59+GMAP0bMSQ
 uj/Q==
X-Gm-Message-State: APjAAAWrQDDA9Ozb2Dswi7etzjoyRNBwdIRfdUZsvUyBfMxfEgCFDpXZ
 pn+K/iRt26alJNsM48TOMYo=
X-Google-Smtp-Source: APXvYqyWqS/UYClZRuV+PVSMCxa4dLKzGzQrOw/21c5lNjINDm39XRuZVV8pygqFWhwuQDk08wN9Sw==
X-Received: by 2002:a2e:b017:: with SMTP id y23mr11611110ljk.229.1575727487602; 
 Sat, 07 Dec 2019 06:04:47 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:47 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 21/25] drm/panel: sharp-ls043t1le01: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:49 +0100
Message-Id: <20191207140353.23967-22-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_060449_486490_C07B610B 
X-CRM114-Status: GOOD (  12.58  )
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
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 7995cf5a9fc4..b60c4db1ed6d 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -7,7 +7,6 @@
  * Based on AUO panel driver by Rob Clark <robdclark@gmail.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -25,7 +24,6 @@ struct sharp_nt_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *dsi;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
 
@@ -107,8 +105,6 @@ static int sharp_nt_panel_disable(struct drm_panel *panel)
 	if (!sharp_nt->enabled)
 		return 0;
 
-	backlight_disable(sharp_nt->backlight);
-
 	sharp_nt->enabled = false;
 
 	return 0;
@@ -190,8 +186,6 @@ static int sharp_nt_panel_enable(struct drm_panel *panel)
 	if (sharp_nt->enabled)
 		return 0;
 
-	backlight_enable(sharp_nt->backlight);
-
 	sharp_nt->enabled = true;
 
 	return 0;
@@ -244,6 +238,7 @@ static const struct drm_panel_funcs sharp_nt_panel_funcs = {
 static int sharp_nt_panel_add(struct sharp_nt_panel *sharp_nt)
 {
 	struct device *dev = &sharp_nt->dsi->dev;
+	int ret;
 
 	sharp_nt->mode = &default_mode;
 
@@ -260,14 +255,13 @@ static int sharp_nt_panel_add(struct sharp_nt_panel *sharp_nt)
 		gpiod_set_value(sharp_nt->reset_gpio, 0);
 	}
 
-	sharp_nt->backlight = devm_of_find_backlight(dev);
-
-	if (IS_ERR(sharp_nt->backlight))
-		return PTR_ERR(sharp_nt->backlight);
-
 	drm_panel_init(&sharp_nt->base, &sharp_nt->dsi->dev,
 		       &sharp_nt_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&sharp_nt->base);
+	if (ret)
+		return ret;
+
 	return drm_panel_add(&sharp_nt->base);
 }
 
@@ -309,7 +303,7 @@ static int sharp_nt_panel_remove(struct mipi_dsi_device *dsi)
 	struct sharp_nt_panel *sharp_nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = sharp_nt_panel_disable(&sharp_nt->base);
+	ret = drm_panel_disable(&sharp_nt->base);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
 
@@ -326,7 +320,7 @@ static void sharp_nt_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct sharp_nt_panel *sharp_nt = mipi_dsi_get_drvdata(dsi);
 
-	sharp_nt_panel_disable(&sharp_nt->base);
+	drm_panel_disable(&sharp_nt->base);
 }
 
 static const struct of_device_id sharp_nt_of_match[] = {
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
