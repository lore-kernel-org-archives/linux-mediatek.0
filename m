Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4CCC432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143CE20661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IWHJfpQk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoKSmzU7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 143CE20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/G80fb4My7R2ohW0CGj63w1RtgIhGJIkmI8Zsbi++YU=; b=IWHJfpQkw/EiJk
	CSvy86id+0qKBMnhoYK3RSJzxxmTjy9oLSPUrmqF5ADfAa2YVduWB4oTHx9kIknoI7mSHZaRJJX+H
	dPirfcFtmbAlnMkTJFVzzvNxCsCKQw7qSs4vLXEb1ey42RfQRl847QtiZhy6M3kGRKmXPwUh/7eJ2
	OR41v4V/4+04j6sqsxaaldJP1S3wmUdJlQj8G/9b/nGwDRlInxD/L598cPVH+Cc4PzKgBwF+aTAy7
	kDCj4T9UWTu+lZHc9RfIziqBuFykxhvpMWCTKe+1SUSnaUpVRvp7GUXXf52/xicusrEtH9TsdBMxM
	yuSZQjfeZ9dJhPYSsFrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrZ5-0008Ue-DI; Mon, 02 Dec 2019 19:40:59 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrS5-0007sG-Jk; Mon, 02 Dec 2019 19:33:47 +0000
Received: by mail-lj1-x241.google.com with SMTP id d20so779252ljc.12;
 Mon, 02 Dec 2019 11:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M6n2l/EBcueNmX8f7XdGTcQ8vUUpCGLFuWYhReTcoKE=;
 b=IoKSmzU7gpDxUkxl0EdaC0gWScyLrTcPd3YGGa7b4HdIqDI8G1e8FafzmGs6jogxMu
 4PaXLxX2BIT63x1BMLWqC0EPxIfNV0uUXhjGCBjRnJ95PdBZFSepRhXi48HzJsmPgR6p
 nThEDz1xjPUYPgGBuMacP2vLvP9wWncj/fCylCldeMQpyFCLJm5HWIrbkmRKu/suIXcT
 vIYjVTMiZs6FqypDWxZOFvWoZcnXdjd+tuFuhS6aQUTO3t/0WeH9ez7RD5TQj5BoePw9
 HzDH58XmVFP8bucXCVQ2dtV46btVIkJ2YXGk7aWvtGn8MUVFB/j0ggZVaoWoBhBKZ+LB
 gSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M6n2l/EBcueNmX8f7XdGTcQ8vUUpCGLFuWYhReTcoKE=;
 b=U3tmzwCn6YDza+VmDjUdV5c5S5MuUnZ9IPNjlqCTME17LT/DLcFG80flvSHSntQ243
 1X+wSvq7yiHB2AolACInzx4/UEQUUUL6XjbI/2zYZkLecbpeHjyeXic5Y61n6A/L+tOP
 gC6z2Hv5Trn8B6uiXmMAOZMOHJeHe3BFxS+6Mpn6RTolcwfMHsxsTPaSml40yF10C2RW
 R/6lna840lo++7PAoeQJLpmx2YgMlxvDL2bElTzkfyJjzn+5/HECTgS2yO8x2DaO1p7s
 QrkOt0j76MkiynFsEA5u3O34uOYMW60hYZQVPRiWkJd8N/rkVfuYTQSuPvANhjTGWcmi
 CJnA==
X-Gm-Message-State: APjAAAUlI05EHePk/zGzQPOL4TqpCsgt6CZE0X7QXqNwei5Cf87+nnA9
 t75zDbSsI5aGQDfgD4mD27A=
X-Google-Smtp-Source: APXvYqyrVRyyR4w53XWdXd/Ds8WXmJXF4JV6lta6C9GpnzvDF7NujpVpoOacgf9V4KFroqTFA7Q4PA==
X-Received: by 2002:a2e:8804:: with SMTP id x4mr277866ljh.2.1575315224026;
 Mon, 02 Dec 2019 11:33:44 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:43 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 21/26] drm/panel: sharp-lq101r1sx01: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:25 +0100
Message-Id: <20191202193230.21310-22-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113345_782016_C312DF35 
X-CRM114-Status: GOOD (  12.75  )
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
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 17d406f49c3d..b5d1977221a7 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2014 NVIDIA Corporation
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -23,7 +22,6 @@ struct sharp_panel {
 	struct mipi_dsi_device *link1;
 	struct mipi_dsi_device *link2;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 
 	bool prepared;
@@ -94,8 +92,6 @@ static int sharp_panel_disable(struct drm_panel *panel)
 	if (!sharp->enabled)
 		return 0;
 
-	backlight_disable(sharp->backlight);
-
 	sharp->enabled = false;
 
 	return 0;
@@ -258,8 +254,6 @@ static int sharp_panel_enable(struct drm_panel *panel)
 	if (sharp->enabled)
 		return 0;
 
-	backlight_enable(sharp->backlight);
-
 	sharp->enabled = true;
 
 	return 0;
@@ -317,7 +311,7 @@ MODULE_DEVICE_TABLE(of, sharp_of_match);
 
 static int sharp_panel_add(struct sharp_panel *sharp)
 {
-	struct device *dev = &sharp->link1->dev;
+	int ret;
 
 	sharp->mode = &default_mode;
 
@@ -325,14 +319,13 @@ static int sharp_panel_add(struct sharp_panel *sharp)
 	if (IS_ERR(sharp->supply))
 		return PTR_ERR(sharp->supply);
 
-	sharp->backlight = devm_of_find_backlight(dev);
-
-	if (IS_ERR(sharp->backlight))
-		return PTR_ERR(sharp->backlight);
-
 	drm_panel_init(&sharp->base, &sharp->link1->dev, &sharp_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&sharp->base);
+	if (ret)
+		return ret;
+
 	return drm_panel_add(&sharp->base);
 }
 
@@ -408,7 +401,7 @@ static int sharp_panel_remove(struct mipi_dsi_device *dsi)
 		return 0;
 	}
 
-	err = sharp_panel_disable(&sharp->base);
+	err = drm_panel_disable(&sharp->base);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
 
@@ -429,7 +422,7 @@ static void sharp_panel_shutdown(struct mipi_dsi_device *dsi)
 	if (!sharp)
 		return;
 
-	sharp_panel_disable(&sharp->base);
+	drm_panel_disable(&sharp->base);
 }
 
 static struct mipi_dsi_driver sharp_panel_driver = {
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
