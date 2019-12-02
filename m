Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15339C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:39:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E4A20661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:39:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U5NZA3lR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXVhIwS9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7E4A20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWXa1venOOXD/PxaGaYHu3y3clhIimwOM/+p7c7UVbg=; b=U5NZA3lR0XjZnW
	q2K1myHjc3L9NiCY8XrintfZuJ3sctlSxHClWYDx7g9mpm0/D1Tz2Tio6lu7EjFxgJwXb1ZGnlMNm
	bruA7KR4WAKU1OVZpLmVpGsLJ6ACMush90hV66iYPjA04g8dAuUtxwKgva6zJ3CDwbKDLKVs5Heaa
	7mj3WkJPUpEzxyRNSNTa8gwIHYlqm6Be1kpOyIxjuWerud+x0G+t8nPeJTAp5o6e6xRnOWS3FmuMB
	M91+EnwKFCeX02XuEMnMvXMBxsz0zkHnpCWLLN0NGcYSE76YItFBSjEgIRmvX/uB06d6Nvy2TewB5
	HyPBzX5IrRAdRlMxw5RA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrXr-00068Q-TP; Mon, 02 Dec 2019 19:39:43 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrRy-0007mE-K1; Mon, 02 Dec 2019 19:33:43 +0000
Received: by mail-lj1-x242.google.com with SMTP id e28so800092ljo.9;
 Mon, 02 Dec 2019 11:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YHyg1Dv+yW1P3woHHern0IWhA1ZSh1oVCkpM4/quUn4=;
 b=UXVhIwS9hxqLyUKpFsi/9B+m1W8tz6O8LM+RB3HfE3wlqNoBarTzpBZk+cRfYXcKbn
 lA8UgPBM4FenshUYYPFPqreNDBD0AdQLGp+x3aW+O9T9/S+2zSZDnb0GB1Y0loieXdeD
 x4GtLZtb2OTb7W9PgYDmkjvrt2X/t6hZEa2L5ksHtQTbwiEOw1Lk1rgsxYN+OLJdJypE
 SyLoO7QNk3W0D2lNr5wmo+W5RLt+tCMvGf1qO/QjC6NNh8geO0+GKYkbHCQLQ5BOzjqz
 s/tm2pU99xfXKIdoDFCpO4LL9AXdqOSsLBqTrS/FhG5fmQTOIcEBokwV07Xlex9BHEN3
 Urnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YHyg1Dv+yW1P3woHHern0IWhA1ZSh1oVCkpM4/quUn4=;
 b=qc/NScApczkTew3Fv09H2bubdheISiGJc4rTUeksMgWghAbgmHlIldJijhATL1ODbj
 dxF5yx2ap5NaGGqeynSisKio4EyUBwKf4F6agGxpPlh8Lgp6TDNc79SA6l022iDKkinh
 sJw/aW7n/9pcBhYsnwBAkpL2Kzmw6IzokVNZOdIM90fRm+KUso5lPhEleN2BvlFUcCia
 Xt5eiGIhKc40I3u+Q9Ue4VrQd+DVR14l2Qc6nCmvSFbuFIwS5gtxB80Z31IwYd2LKA/7
 oVA5+Pki625Fu8tGDhUHFwumLENizHwRPxWUusglEDE707e95R0SN5EsTXnhT4lrj8g5
 Z5KA==
X-Gm-Message-State: APjAAAUe/rTEkw1JVnXcrMwRx91il7JUP9Ns50XOfX6TmEqIpFKhMryp
 jTDP8ju4LD5HxIDxejegGu4=
X-Google-Smtp-Source: APXvYqz3r+laN9FnmWTYFLLBUS6ZnkiUvsIMFFNjcED2AJXxTlqVCVCVhK5M16rTTToSSV/kHLG6ng==
X-Received: by 2002:a2e:b007:: with SMTP id y7mr253216ljk.215.1575315216701;
 Mon, 02 Dec 2019 11:33:36 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:36 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 17/26] drm/panel: raydium-rm68200: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:21 +0100
Message-Id: <20191202193230.21310-18-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113338_749639_CCDB82BF 
X-CRM114-Status: GOOD (  11.23  )
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
 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index d6a03328e594..e8982948e0ea 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -6,9 +6,9 @@
  *          Yannick Fertre <yannick.fertre@st.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 
@@ -78,7 +78,6 @@ struct rm68200 {
 	struct drm_panel panel;
 	struct gpio_desc *reset_gpio;
 	struct regulator *supply;
-	struct backlight_device *backlight;
 	bool prepared;
 	bool enabled;
 };
@@ -242,8 +241,6 @@ static int rm68200_disable(struct drm_panel *panel)
 	if (!ctx->enabled)
 		return 0;
 
-	backlight_disable(ctx->backlight);
-
 	ctx->enabled = false;
 
 	return 0;
@@ -328,8 +325,6 @@ static int rm68200_enable(struct drm_panel *panel)
 	if (ctx->enabled)
 		return 0;
 
-	backlight_enable(ctx->backlight);
-
 	ctx->enabled = true;
 
 	return 0;
@@ -392,10 +387,6 @@ static int rm68200_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
-	ctx->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(ctx->backlight))
-		return PTR_ERR(ctx->backlight);
-
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dev = dev;
@@ -408,6 +399,10 @@ static int rm68200_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&ctx->panel, dev, &rm68200_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
