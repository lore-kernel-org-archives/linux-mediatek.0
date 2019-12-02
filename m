Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F12C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:44:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B406F20661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:44:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r6e1WpQJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQ5sz84a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B406F20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LODP2AVJuZ9LZHjCIi+N8UlJbxqWeCRqIqP2ZUOTW9k=; b=r6e1WpQJx7kk6m
	6ykgo1P0+1SvwVoyhLeZP3MkGv0q5aUx/M0Z5JZmcElEKN2pnZ/7qtMS8qzKSzrFyw8Z5KywfA/CJ
	JvpGuLTSEwrY1+26/ebItL4mw87nh2ayJ/oWsLVCzihC6VTZt+ihOLol6fk9kQIV6F2PGl3D9iY59
	kT9TH7MC7Za7/2Leyc+9nrPpDe4IBzgoUM0DfCSjpjXs6WXn1LyNbZ6oH68hvgz5IZjP54T/FiAzv
	/kdSs93Rzh/bV9u9++WVODQXmtbNsYzy51z684YRq9j66/X2mcNxODCZQ3Ri/iEoknGvBNnSVRdIA
	ZujsxjNXveWBTE/yPyyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrcc-0003k4-Ve; Mon, 02 Dec 2019 19:44:38 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrSE-000810-O2; Mon, 02 Dec 2019 19:34:00 +0000
Received: by mail-lf1-x141.google.com with SMTP id l18so808119lfc.1;
 Mon, 02 Dec 2019 11:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CU1uoHEr1EClqVOFtZU3zB21PkkAQa6gthbvOIOjhXw=;
 b=sQ5sz84ahngu04detfdJb7WzDQ0QcopqKxnDfHTl6wWuDWFdmsW99YWf0HBWKVWdCP
 RtINs73RJ+Sk7G71eUzuQ9dzzWizDYLIb9hlwzETpJLExqI+mi5bryV4yuHDhM1bk64b
 vEQDA0fYt2NVXGAInm08lTk2qc9z8Zuy/bBxOD7ZeK96/nmYABuBHoroyzZmnlYo/3hL
 e6lBlbFUTJ/vQgNEhqRXR+CF6RtFCvzDPOJRsXl7kAidChgKhYB4T34t/JadF6qMZ/54
 Ia1/574eLMCCnimEAcJi1a8cMBlCfwJLuzWlre+3Lh7dtm0Umq9xTA63WTRQ+KYk8fR2
 Esxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CU1uoHEr1EClqVOFtZU3zB21PkkAQa6gthbvOIOjhXw=;
 b=s7YL1GoNvSr/sz+DVjnamiYPTfr0sAAcQWLAZzaseSfUzpBHwW16eNkC+domi6WIcK
 FZNHyoAxU0BwuKuwbqcvJtiqq2P5HCs8EFyrkbS7kyLBCKek1ghS9qUL421B/KxL067N
 tDnmB5UgRuZxhf8hFQjPhE4ZY02BvjcZnPiz1O9BOz/9bTiK3R6i4V38vViMt0fy4iEw
 J7Cus3hOWfFiotfsIevNiJ8FuYvalwA90rPeWykPgx96wIrx88XVAhRdk9sH+hiH1fqJ
 EUM/8UQhag+Om3MzN3JLxq0hWj/L1H+H/6h0UHpkg8nmkg2hfkj57oDgDUEm/505Fyn5
 qZTw==
X-Gm-Message-State: APjAAAX3qZUhja+qBzkJFuF1nGD1DvJveuNwfpOQ++Gzp8da6eYAK+bS
 8eaqGr7xWU06uzqjH6a1scU=
X-Google-Smtp-Source: APXvYqy6JtwNRfjOhSCiLRMY0PnjwO80lGs4bEHgQWo2w/EjSnAnF5rp0zEQoTYkYl1Ki13jCNJp3w==
X-Received: by 2002:ac2:5388:: with SMTP id g8mr412443lfh.43.1575315232849;
 Mon, 02 Dec 2019 11:33:52 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:52 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 26/26] drm/panel: tpo-tpg110: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:30 +0100
Message-Id: <20191202193230.21310-27-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113355_001359_AC2F43A9 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-tpo-tpg110.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
index bee213ea1a42..8472d018c16f 100644
--- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
+++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
@@ -14,13 +14,13 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
-#include <linux/backlight.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 
@@ -76,10 +76,6 @@ struct tpg110 {
 	 * @panel: the DRM panel instance for this device
 	 */
 	struct drm_panel panel;
-	/**
-	 * @backlight: backlight for this panel
-	 */
-	struct backlight_device *backlight;
 	/**
 	 * @panel_type: the panel mode as detected
 	 */
@@ -356,8 +352,6 @@ static int tpg110_disable(struct drm_panel *panel)
 	val &= ~TPG110_CTRL2_PM;
 	tpg110_write_reg(tpg, TPG110_CTRL2_PM, val);
 
-	backlight_disable(tpg->backlight);
-
 	return 0;
 }
 
@@ -366,8 +360,6 @@ static int tpg110_enable(struct drm_panel *panel)
 	struct tpg110 *tpg = to_tpg110(panel);
 	u8 val;
 
-	backlight_enable(tpg->backlight);
-
 	/* Take chip out of standby */
 	val = tpg110_read_reg(tpg, TPG110_CTRL2_PM);
 	val |= TPG110_CTRL2_PM;
@@ -432,11 +424,6 @@ static int tpg110_probe(struct spi_device *spi)
 	if (ret)
 		DRM_DEV_ERROR(dev, "no panel height specified\n");
 
-	/* Look for some optional backlight */
-	tpg->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(tpg->backlight))
-		return PTR_ERR(tpg->backlight);
-
 	/* This asserts the GRESTB signal, putting the display into reset */
 	tpg->grestb = devm_gpiod_get(dev, "grestb", GPIOD_OUT_HIGH);
 	if (IS_ERR(tpg->grestb)) {
@@ -459,6 +446,11 @@ static int tpg110_probe(struct spi_device *spi)
 
 	drm_panel_init(&tpg->panel, dev, &tpg110_drm_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
+
+	ret = drm_panel_of_backlight(&tpg->panel);
+	if (ret)
+		return ret;
+
 	spi_set_drvdata(spi, tpg);
 
 	return drm_panel_add(&tpg->panel);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
