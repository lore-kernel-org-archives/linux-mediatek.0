Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D31C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AD7120661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DDVz4U8z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAXzCXL9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AD7120661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z776b+W+nIPnDsZjaA3f8nOo+UxVemk7qzBVXodkvu4=; b=DDVz4U8z2jbtR2
	cWezB7edjDuvEpT2lJ9OaQ6OOiTr/upRTbPKI997zJS4cjR3QraIh+HNW8kP7v4To4PbpLLTmW88O
	xw4YlAT1no/e+TjS9tAmOaXKQw1lkoow8lGCIbVt9LQcPI9rmI0R67M6gQ2UkGwlJS2sSqlRDDkUR
	LrK7MQ+eBdMZBdeYBgc/w7r4Wjv/0SG/dDWhu3rjrJCqphATxDqiDb8Q4eZghajR/H2u4KdlTiIDm
	w7ZTiDbg8J+RcErh+4/fWrDIDCPkcuxsIaL02tQMZN4ub9UqBBbSLdmLaJvoCEpku6Gm0jIexfnJj
	q43U4PSSeruJ9kiXtoQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrZY-0000oQ-Do; Mon, 02 Dec 2019 19:41:28 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrS4-0007qN-5j; Mon, 02 Dec 2019 19:33:45 +0000
Received: by mail-lf1-x141.google.com with SMTP id r15so808174lff.2;
 Mon, 02 Dec 2019 11:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+FHuLNwTdHR6blgVNr/owkQfKdgYFCUT0XTY+HsYKBg=;
 b=jAXzCXL9OdEFsuNU1Rs/H2FYtD6pIirQWfm5U6evmlkFIskQuthJt9AUIdScaihjmF
 52FsG/8XdjrE41j+He/A6yyC4jP5mmYdG1kZ3G0ZpJVzEHwZBztYfRt+kcQL2kUFvh/L
 yW9AezRVYJMkZnaGMdTL3Q+YhbEZoA/RoEjQTerZESKzRJxS03HIJ86GOmWGZdCBzUSS
 HnP3Mu25UOP/ytQcsx+HDzNsMONGSLUwbpSZNLe1q8ni4NI8jZwpxIZdbWOnX8+nOUiY
 2wlEgN8ddWA+US468fwzh7tyFb1t3BA0PgXvb1U/3gWy/qnyLg82pgFzUE6eqnZk0Tcq
 RD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+FHuLNwTdHR6blgVNr/owkQfKdgYFCUT0XTY+HsYKBg=;
 b=nyfl91aEdyGZZ/ubytLEZxBbBeM1q0fZ2R3uIw8kJwy0kINngdjoGzNfLOtanzKdsd
 /I71ttFrRnJzfEYh/V+c34SJm/pSPZIDg3HvbljQN0qQm8Te+uo9iubc1Zb25dN+/mSv
 5hWSlgDzDvB7qzHVbdMc0bdImNbhdabbttIVsfd10sYnS6I0rzgBdx4jfp3P0vgmCfCw
 bL58AqTAcwMAA8fMyuxxTyvpp2qtBu6/ajC4aCU5VIy3nzJtJp3QrDBoFJnW291c9dC3
 vqihmhWIISA7uqz0siGOZxwKN/VfDBWthbgrllNNBjHlI7J13dkwnVvKM45Js30fKEdL
 lYrg==
X-Gm-Message-State: APjAAAX8KlfJ68R/XaSg3v9Vdz7lzPSkAm1ErCP76+vYC/9Z/Ppmc0m9
 zFPY6X+EO81UcrSIxWUk7YQ=
X-Google-Smtp-Source: APXvYqzGlpVDHTn2zIkxekoAh78y1wVNAMIONaXD45gxrFXPhUl9H7ermaRGNE/MDT+fhbkWwEN1Ww==
X-Received: by 2002:a19:2213:: with SMTP id i19mr408485lfi.83.1575315222087;
 Mon, 02 Dec 2019 11:33:42 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:41 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 20/26] drm/panel: seiko-43wvf1g: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:24 +0100
Message-Id: <20191202193230.21310-21-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113344_275930_613196AF 
X-CRM114-Status: GOOD (  12.91  )
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
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 36 ++++-----------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 4b345a242b3f..e7e00b23c975 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -6,7 +6,6 @@
  * Based on Panel Simple driver by Thierry Reding <treding@nvidia.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -46,7 +45,6 @@ struct seiko_panel {
 	bool prepared;
 	bool enabled;
 	const struct seiko_panel_desc *desc;
-	struct backlight_device *backlight;
 	struct regulator *dvdd;
 	struct regulator *avdd;
 };
@@ -127,12 +125,6 @@ static int seiko_panel_disable(struct drm_panel *panel)
 	if (!p->enabled)
 		return 0;
 
-	if (p->backlight) {
-		p->backlight->props.power = FB_BLANK_POWERDOWN;
-		p->backlight->props.state |= BL_CORE_FBBLANK;
-		backlight_update_status(p->backlight);
-	}
-
 	p->enabled = false;
 
 	return 0;
@@ -196,12 +188,6 @@ static int seiko_panel_enable(struct drm_panel *panel)
 	if (p->enabled)
 		return 0;
 
-	if (p->backlight) {
-		p->backlight->props.state &= ~BL_CORE_FBBLANK;
-		p->backlight->props.power = FB_BLANK_UNBLANK;
-		backlight_update_status(p->backlight);
-	}
-
 	p->enabled = true;
 
 	return 0;
@@ -227,7 +213,6 @@ static const struct drm_panel_funcs seiko_panel_funcs = {
 static int seiko_panel_probe(struct device *dev,
 					const struct seiko_panel_desc *desc)
 {
-	struct device_node *backlight;
 	struct seiko_panel *panel;
 	int err;
 
@@ -247,18 +232,13 @@ static int seiko_panel_probe(struct device *dev,
 	if (IS_ERR(panel->avdd))
 		return PTR_ERR(panel->avdd);
 
-	backlight = of_parse_phandle(dev->of_node, "backlight", 0);
-	if (backlight) {
-		panel->backlight = of_find_backlight_by_node(backlight);
-		of_node_put(backlight);
-
-		if (!panel->backlight)
-			return -EPROBE_DEFER;
-	}
-
 	drm_panel_init(&panel->base, dev, &seiko_panel_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
+	err = drm_panel_of_backlight(&panel->base);
+	if (err)
+		return err;
+
 	err = drm_panel_add(&panel->base);
 	if (err < 0)
 		return err;
@@ -273,11 +253,7 @@ static int seiko_panel_remove(struct platform_device *pdev)
 	struct seiko_panel *panel = dev_get_drvdata(&pdev->dev);
 
 	drm_panel_remove(&panel->base);
-
-	seiko_panel_disable(&panel->base);
-
-	if (panel->backlight)
-		put_device(&panel->backlight->dev);
+	drm_panel_disable(&panel->base);
 
 	return 0;
 }
@@ -286,7 +262,7 @@ static void seiko_panel_shutdown(struct platform_device *pdev)
 {
 	struct seiko_panel *panel = dev_get_drvdata(&pdev->dev);
 
-	seiko_panel_disable(&panel->base);
+	drm_panel_disable(&panel->base);
 }
 
 static const struct display_timing seiko_43wvf1g_timing = {
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
