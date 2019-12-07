Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F63FC43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F7824677
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EU9PNZmM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLR0ghga"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24F7824677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00UWZ8e6scFcZiiaY74ai9zhv8BNOPV+AlTWjcnRku4=; b=EU9PNZmMZSxJCC
	SO4saWZOCtTgW7P3H6yqT4G2JiMY6kq7wo75PWnd54uLPLDty8+hXm+VtxNo26hPIAHneYlnWNI+s
	2Qq+3P15IW0DM7wU0MBAwHiyWLLUHX8yNlbpTOfpt4n/uFEsLwRgHSHWo/oNj44yYJExY3cgAM4G5
	pZiRmq0gKKBcsP7gHNtHJOH9SlQnCChjylHxo0X0UJQeHBuzlYnxsAVgtBskVrwt3kVUriAXDYp8K
	L8Su3rvykbfwTrhbGF4VgE5XuFcjgU5cseoU55DwWfFgJs5gh1rarK1DmQLpt2oTkAq0C6ypwrLMQ
	Wp3mcgUN0iCXXL+EySag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idanz-0005uy-Cv; Sat, 07 Dec 2019 14:11:31 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idahK-0005o0-W0; Sat, 07 Dec 2019 14:04:45 +0000
Received: by mail-lj1-x244.google.com with SMTP id m6so10743068ljc.1;
 Sat, 07 Dec 2019 06:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nh+auvkxV6hzFWp6G1ySZlQ+h5mj84VTfDwYW3UcNEg=;
 b=GLR0ghga41ugllFnX9V68j3o6mCPObjN2evzL1OX/t2lGBgTB8wmIPLgwwMBOpjpDq
 Nk8zbYrhiz40wWzyaxFyDCOx9Qp3c7eNa8A/95q5A1Qqh83tyWD1BVp0y4VctW8mG+WZ
 DAA9mowrjQXH5AcAt80VyzXd/OACUG56WyF75bVLrPavuEBdVpRprBVKB4AV35/ONJLz
 6OVdFjErq0R1IIbK1uTpO/rvDNpe+vSvtO8NekSaF7kbDOnEy/SGbQ4OnXGYt3pmaEeA
 mb8xoiJxNRlo37czxRawcLQfn8YURT2gt7i/+ojRcPc73xXdZuJ4AZGjcgILa50pJKcz
 KvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nh+auvkxV6hzFWp6G1ySZlQ+h5mj84VTfDwYW3UcNEg=;
 b=ufRMWxxx69KVhHPgTVcmQ0LeGJc7hVlxzH5ujs7GoSze7LRblFFWzVNcMCEFgIaKck
 qwAk4uiKwaZFjKWPjpBkfl93aiiCeri/+7uzF7Wp10UH6gGNXPj55dV+zIS2M0eL7e5Z
 ogqNSwRqxLD8YRyYWCzjDd1NpfNCFqt0v4236pM32TnOHyJR2XdltR2MD3gQkVlbCzPX
 Yxx+h/s9Mo8shu91JxEGWtM2Bvy83agSlHRTy1GeB7pNeYFBhLCBdGUKRvghUMDCWrxD
 ErSgyaDVQJ44tXhKLFHOV9uYl05Zu+g/JCLL51A1LkjajWXm4CeP5v1Y0nEn8628E6mc
 FpVg==
X-Gm-Message-State: APjAAAXqkUCNtkmwihdyhOh7Nc4q5vMWiP6Y4vlDe+OPuXpOMFUmcmRR
 gwOCA1ICmZAO4Fxe7nse99g=
X-Google-Smtp-Source: APXvYqwiY4N+GIwVJEZXPGgmoqNV1sicVH+q4kCFtsUl1LtIrxYJcm5qUL/ngh8pFMnKlvdyCiPdfA==
X-Received: by 2002:a2e:2418:: with SMTP id k24mr12093950ljk.49.1575727477038; 
 Sat, 07 Dec 2019 06:04:37 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:36 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 15/25] drm/panel: panasonic-vvx10f034n00: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:43 +0100
Message-Id: <20191207140353.23967-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_060439_084896_E8004307 
X-CRM114-Status: GOOD (  13.25  )
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
 .../drm/panel/panel-panasonic-vvx10f034n00.c  | 45 +++----------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 579ac0d86ea4..4e15bff5a1b5 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -7,7 +7,6 @@
  * Based on AUO panel driver by Rob Clark <robdclark@gmail.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -31,7 +30,6 @@ struct wuxga_nt_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *dsi;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 
 	bool prepared;
@@ -62,12 +60,6 @@ static int wuxga_nt_panel_disable(struct drm_panel *panel)
 
 	mipi_ret = mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
 
-	if (wuxga_nt->backlight) {
-		wuxga_nt->backlight->props.power = FB_BLANK_POWERDOWN;
-		wuxga_nt->backlight->props.state |= BL_CORE_FBBLANK;
-		bl_ret = backlight_update_status(wuxga_nt->backlight);
-	}
-
 	wuxga_nt->enabled = false;
 
 	return mipi_ret ? mipi_ret : bl_ret;
@@ -142,12 +134,6 @@ static int wuxga_nt_panel_enable(struct drm_panel *panel)
 	if (wuxga_nt->enabled)
 		return 0;
 
-	if (wuxga_nt->backlight) {
-		wuxga_nt->backlight->props.power = FB_BLANK_UNBLANK;
-		wuxga_nt->backlight->props.state &= ~BL_CORE_FBBLANK;
-		backlight_update_status(wuxga_nt->backlight);
-	}
-
 	wuxga_nt->enabled = true;
 
 	return 0;
@@ -206,7 +192,6 @@ MODULE_DEVICE_TABLE(of, wuxga_nt_of_match);
 static int wuxga_nt_panel_add(struct wuxga_nt_panel *wuxga_nt)
 {
 	struct device *dev = &wuxga_nt->dsi->dev;
-	struct device_node *np;
 	int ret;
 
 	wuxga_nt->mode = &default_mode;
@@ -215,38 +200,20 @@ static int wuxga_nt_panel_add(struct wuxga_nt_panel *wuxga_nt)
 	if (IS_ERR(wuxga_nt->supply))
 		return PTR_ERR(wuxga_nt->supply);
 
-	np = of_parse_phandle(dev->of_node, "backlight", 0);
-	if (np) {
-		wuxga_nt->backlight = of_find_backlight_by_node(np);
-		of_node_put(np);
-
-		if (!wuxga_nt->backlight)
-			return -EPROBE_DEFER;
-	}
-
 	drm_panel_init(&wuxga_nt->base, &wuxga_nt->dsi->dev,
 		       &wuxga_nt_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
-	ret = drm_panel_add(&wuxga_nt->base);
-	if (ret < 0)
-		goto put_backlight;
-
-	return 0;
-
-put_backlight:
-	if (wuxga_nt->backlight)
-		put_device(&wuxga_nt->backlight->dev);
+	ret = drm_panel_of_backlight(&wuxga_nt->base);
+	if (ret)
+		return ret;
 
-	return ret;
+	return drm_panel_add(&wuxga_nt->base);
 }
 
 static void wuxga_nt_panel_del(struct wuxga_nt_panel *wuxga_nt)
 {
 	if (wuxga_nt->base.dev)
 		drm_panel_remove(&wuxga_nt->base);
-
-	if (wuxga_nt->backlight)
-		put_device(&wuxga_nt->backlight->dev);
 }
 
 static int wuxga_nt_panel_probe(struct mipi_dsi_device *dsi)
@@ -281,7 +248,7 @@ static int wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = wuxga_nt_panel_disable(&wuxga_nt->base);
+	ret = drm_panel_disable(&wuxga_nt->base);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
 
@@ -298,7 +265,7 @@ static void wuxga_nt_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct wuxga_nt_panel *wuxga_nt = mipi_dsi_get_drvdata(dsi);
 
-	wuxga_nt_panel_disable(&wuxga_nt->base);
+	drm_panel_disable(&wuxga_nt->base);
 }
 
 static struct mipi_dsi_driver wuxga_nt_panel_driver = {
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
