Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53AFC432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:42:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876DD20661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NT0cZEGM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OY1yeCPD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 876DD20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1kNMF0SXaHeJvydOihwDI/RjPX7R/jVC+U2eFHUnOw=; b=NT0cZEGMwK9CbC
	8NLkS0EC2/IDJGpq3VcH7DBMiWvjZbZdHEFSNzSjRxW9LmhHm/1y5VvNVcY/If7Kis0MDlXHhDYqm
	38EeKk02bnMaA/aRelDOtRfvoal+l7kJ/QmfuGgK9Kr/ZsRFOjEwvoQoqgg1kWnATCfO54F+VtJjk
	4m+ux2LZCO/DaIYC7ztJZD7nKEmgsC4r81K42fsRIevxM2rIawPsB64abtNOaUygJGF7+sJqUty1T
	URX7OBNWUo3qj3qPWzXjwUoVrDCz7/SJ7yOL4MDZvw8RDoQPHapS/xGZG/MYVMSGe6/buuaf/qn8Q
	bDHzIQKe0fTpFo0k7MFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibraD-0001S4-5Z; Mon, 02 Dec 2019 19:42:09 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrS7-0007u2-HH; Mon, 02 Dec 2019 19:33:49 +0000
Received: by mail-lj1-x241.google.com with SMTP id a13so793257ljm.10;
 Mon, 02 Dec 2019 11:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EQCdMhhHkJLZcD9BzMhwIb5xb1irL0uJ2pcFEXKepFw=;
 b=OY1yeCPDNfjdMrvsRARHHhgFlNUaTixpvh8ETXE7pMJprdmFTKVV1we1+8cJAz4XT/
 TZOFneS+bmAmVo2/1FarsnUNlF/HQ+i0a79binQ5VeON+J+QbN06Nj4uz7Ma4ZX7Igvl
 NXSUqN+sktPvX04ns9obPeU83zwmI1ihE6txwTCk4mACiFSc0Q+/zOjZfeleVpUs3cTe
 /fi4PLHiLkuNCu2ibSyeRs7p/Vqvx3bApaueyaqYsXJJJtQcMDWNS4q1uTGpF1hcRUau
 gBOAK7Vue7m8v3F+YcSlkj9YA2E3ShmHOkJj0JQcPrWeqpoS0NMGuWbKaARELG4bbetw
 SW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EQCdMhhHkJLZcD9BzMhwIb5xb1irL0uJ2pcFEXKepFw=;
 b=CtV2rHV0hxtsNQsjdmOF+esCE9uXF/Jci55xSyOf7yAHsDDb4HB0Sq8PKgF75bVluj
 Fjkebqxh9j9aavJsemkGQBv3Oi3AWopVCBDq+6+8gLaCZOKXYadbYyMOJsRKTK4XGDGh
 bTRWqYMap+5yVYhM8e4MLxtqyf62XxrpkstV8aPV5wfupPdpWXseit1TXTrCsV+b2Rl5
 1RQ0oIDo9GKNocExxkG2Wvv48F+tgRgC/7qeR+DRy8aLPlAhXhiBFtzHsYDe5MRtlja7
 o+pYTi1Lg9a22HmUZfSUGvo4N9oL3fSm9v0PCdLw3Eapua18+h4Ri3XKFbdeopd6Uogx
 /NQw==
X-Gm-Message-State: APjAAAXe0ZU/v8Pt+Qf8gqQIGKrMW+TW9iy1/XXKK51l5R5dbfbL4mvK
 lwVdRyQPrr8hcaEIFgrzRKo=
X-Google-Smtp-Source: APXvYqzBtPgnZJO2C3FgsAdYxGahX1PcJUcy/5pxg4ftOozbwWlQs9ZDIf/3+yVVuJ09OIxficg0uA==
X-Received: by 2002:a2e:c42:: with SMTP id o2mr277018ljd.222.1575315225817;
 Mon, 02 Dec 2019 11:33:45 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:45 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 22/26] drm/panel: sharp-ls043t1le01: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:26 +0100
Message-Id: <20191202193230.21310-23-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113347_689417_2D7F6B69 
X-CRM114-Status: GOOD (  12.90  )
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
