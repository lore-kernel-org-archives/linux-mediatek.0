Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85178C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:37:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 577C420661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iraws8sg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLSVwBKz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 577C420661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTKCRe6lcmsYmtBLGvPZoR2Ou6ktfwmr7vpBjT0Jjvo=; b=Iraws8sgYyXl2h
	o6NQt94VNzEPRv5y34rH76P+PZamwN9O7GQ9k4lhULpn2QWA2FPCBE5Gp69nNb+KqxEdIYJng4635
	JfPzjnIqmsJwx13LN8MteztSCsbMijJa5CHS7kfdwEkAyGU9zj9UOgzFdmodDMevc8gh6PcGgiBSE
	s7Wk2c6e7iEVAF51QP5lJLCtXlO+7FkcWDVmbkkmwAkq+b+oaxh8XRafzkmt8K7v4CQg6wRKB6sXF
	1h/cqO08PDN1SNc+Cr3qqy1Oqf/T2s9cX4VO3kULp8p1XLKnlv/r3DHpTAGGhgQqwqJwXFt0AGnks
	IXQn33bG2rl3XLLfRWrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrVL-0003nZ-QB; Mon, 02 Dec 2019 19:37:07 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrRk-0007ap-55; Mon, 02 Dec 2019 19:33:28 +0000
Received: by mail-lj1-x243.google.com with SMTP id h23so806070ljc.8;
 Mon, 02 Dec 2019 11:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Y1mqiAE5RcwUiFVegDkD/kI5NKO3CN9zEHEAS4n6tI=;
 b=eLSVwBKzRfmXzJ69INKynMpE4N+QQ7C9joHALFYJRJTjHtsbtAjm27xqORSgSJupcp
 S0nGdqqVn2kkSardiQERm/a90jeAPPwGzVanVoD35JhitHcJH53uxrfd7S2Zi58vhbzD
 FUorU2ibBmatCrIxrMQB+K6o40M7+/0VcP3JSzDRyM1/xNcRLTV/gvQg2ucde6SD5EbP
 KLhChZtOknbLmrQ7u8kIrf6AmS0NqVBWY/0VOEMtArY1WWLoUolWQKGFBK/eWf8pcYxE
 TmnkPIOHMXGihWqlXSE1d4uJJhE7omNjuBNqZznXzaSsMk2nsVlWG+zqWOJ3mzb1lva1
 xjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2Y1mqiAE5RcwUiFVegDkD/kI5NKO3CN9zEHEAS4n6tI=;
 b=ehxjSyJ3/rRFCTFHW5vmMyZgsyt+KRB7iZXGYMx7Y/BZjI/vjxwFg+OywtD+Y6wjj1
 +j734jmajWLoiYxXHZfKhgFpubT6cNSlojIA2rvsOUhF3Mhi0+dyv4ByJjjdpSN+rHde
 TKDqExaoTNonprfciYJWG8HV9G27sOFxkh0mPZCRRTZe7WlWiEnBpKYyS1Mex3DWU/Sa
 AO6isaNBdaVvN4fGwuY5FrwZYtW0RNI9dg4maf7YV9L4DemqcWUdHq8Ymxu47u3HGM8k
 sGxs20OH2LfRCkuuDXnJVxIIoWd+BlGM6/AZW2UJCDkX7Oa9P0rEq7b57SagGIz8qO59
 lBQA==
X-Gm-Message-State: APjAAAXUJgGZUm9vhQvo10n3GfT4oHxCtNM27wSKRzyoA0uhbo8f7CY4
 MGikg+7PIS9Sq4eeF7aQEdo=
X-Google-Smtp-Source: APXvYqxkxVmRA7p6+jFuEl6sc6enaU4TOldkVPnjP/5gpD+fwCWFbaI2otg2zdXHDExHl1Fmyas7wg==
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr265078ljg.3.1575315202212;
 Mon, 02 Dec 2019 11:33:22 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:21 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 09/26] drm/panel: feiyang-fy07024di26a30d: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:13 +0100
Message-Id: <20191202193230.21310-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113325_757800_2CC3FC35 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index 0157d1844e3e..95b789ab9d29 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -9,7 +9,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
-#include <linux/backlight.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -22,7 +21,6 @@ struct feiyang {
 	struct drm_panel	panel;
 	struct mipi_dsi_device	*dsi;
 
-	struct backlight_device	*backlight;
 	struct regulator	*dvdd;
 	struct regulator	*avdd;
 	struct gpio_desc	*reset;
@@ -102,7 +100,6 @@ static int feiyang_enable(struct drm_panel *panel)
 	msleep(200);
 
 	mipi_dsi_dcs_set_display_on(ctx->dsi);
-	backlight_enable(ctx->backlight);
 
 	return 0;
 }
@@ -111,7 +108,6 @@ static int feiyang_disable(struct drm_panel *panel)
 {
 	struct feiyang *ctx = panel_to_feiyang(panel);
 
-	backlight_disable(ctx->backlight);
 	return mipi_dsi_dcs_set_display_off(ctx->dsi);
 }
 
@@ -225,9 +221,9 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->reset);
 	}
 
-	ctx->backlight = devm_of_find_backlight(&dsi->dev);
-	if (IS_ERR(ctx->backlight))
-		return PTR_ERR(ctx->backlight);
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
