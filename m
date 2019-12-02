Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D092C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:44:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E94920661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UtBnxnFQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pt4eRo+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E94920661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u53C9G9BDBfCMrQ4C+2WfXyNTb2FY9lG4S+6TptsNPk=; b=UtBnxnFQLKbV7/
	4xxhSQd3HaAIfBLmIz8/STUmFgaMTm/vHduH29GnHCAlxvsuH1nClhlozu4nVzHgyl+ghPEt4v2Tl
	hlq40YOIy0i+ejN9v/KNoDGC9c5OF55aq/Ln20xNI++GrmIQySgdUxJkeAWlAOai9rkTt7S2agjXv
	ueSoWJNPBgqzOqfAn6dLTYRd/pyUSeCLnDZxy014ZFC/8oxiLPC/t7ERr8bF0Mm+kbol1guoEu4eK
	x0t5+B73mvJeVrEMoMmrrELXiE8qzVtnz0/g7Uq/PK19haxI4Eruy6RzU8E2nJAd/Aluhur5R6Gtf
	aaA5P8VyTcd3mBkid3wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrcf-0003ma-M1; Mon, 02 Dec 2019 19:44:41 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrSC-0007z4-P9; Mon, 02 Dec 2019 19:34:00 +0000
Received: by mail-lf1-x142.google.com with SMTP id l18so808050lfc.1;
 Mon, 02 Dec 2019 11:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sQFlzyFny1i3dHVwTEws0fP7Z8KCjLT5c7TINBzn22A=;
 b=pt4eRo+rlUMtO4GzjerqssqjlO0TO1vFSYLwXnfqMSsS6I6x4kY1DKOw6u9G9vdsgW
 VAXzxTR5zDmXqrnHapjbB2IRlTBgXXfxGeEzL71oJVndvo7oGsIzdM4JNNW+vJ9wI25g
 Qpon0HiFbTQdsFgeRb9y24Z617Q2A4fAEvuGRRje5A0OM5b/IzFlUNEFnzszoF9xFYKW
 CFKHrlknb1/H6PzMT5qxX68gQRn6wKxNlsb26QKyV9LEm0W4VdQaXIu/ffS0UbmwteSa
 ESNzQZVCq6Z1dS+LBlZ71mm/mZiCmeduZsUF8YAG5RFC59oKdaCyFJU+oIb5eWrZqitl
 CEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sQFlzyFny1i3dHVwTEws0fP7Z8KCjLT5c7TINBzn22A=;
 b=e+2FI6g3h+DGP+qWaH2eGtKSjXwjphA8uMglF/N6XM2Qbv63f8ppJDs6h5TxK5b74K
 bXmFAVZZycZO5PWEPH3ud9YTXAXs6ycDOfAysWe5S1DKCKVJ6qMF8tyZGgpYpb4ZJ9d4
 Lv7iVT4HQLnEbSKn1WBm867ScBz3/+lkIg2JsOOYTWO2aRzTA8qq1VHkabW8dLGso6iB
 Wqnz74FVAzK+T6IHqlrxOtSDYVii3/1k6ChxR/x93/ZaPkT1nocL6PVUqNLRNjGuO8P4
 5Tk6rJZ2A2UoJS6eUAbJ5unVolz29C4ws38f+Xk0blL+08FsQ3wFqWPJFKc24ASJ55Gt
 BHig==
X-Gm-Message-State: APjAAAWkYf3BirFUtvFUYFAjRuWremeo+rH7KM0lJvZVpuhNgX9tDkfH
 mR+m73MX7MoRmItlsYD9qIo=
X-Google-Smtp-Source: APXvYqw+I2ccfhtX+jZIDSZ8cLTRrK19+BfFlN/G+FBcKPfk4B/UKRsY/a6pLRlAL5tf08+wnj+Qzg==
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr397464lfp.121.1575315231117;
 Mon, 02 Dec 2019 11:33:51 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:50 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 25/26] drm/panel: tpo-td028ttec1: use drm_panel backlight
 support
Date: Mon,  2 Dec 2019 20:32:29 +0100
Message-Id: <20191202193230.21310-26-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113352_836682_2FC8FC9C 
X-CRM114-Status: GOOD (  11.30  )
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
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
index 37252590b541..cf29405a2dbe 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
@@ -17,7 +17,6 @@
  * H. Nikolaus Schaller <hns@goldelico.com>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/spi/spi.h>
@@ -83,7 +82,6 @@ struct td028ttec1_panel {
 	struct drm_panel panel;
 
 	struct spi_device *spi;
-	struct backlight_device *backlight;
 };
 
 #define to_td028ttec1_device(p) container_of(p, struct td028ttec1_panel, panel)
@@ -243,8 +241,6 @@ static int td028ttec1_enable(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
-	backlight_enable(lcd->backlight);
-
 	return 0;
 }
 
@@ -252,8 +248,6 @@ static int td028ttec1_disable(struct drm_panel *panel)
 {
 	struct td028ttec1_panel *lcd = to_td028ttec1_device(panel);
 
-	backlight_disable(lcd->backlight);
-
 	jbt_ret_write_0(lcd, JBT_REG_DISPLAY_OFF, NULL);
 
 	return 0;
@@ -334,10 +328,6 @@ static int td028ttec1_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, lcd);
 	lcd->spi = spi;
 
-	lcd->backlight = devm_of_find_backlight(&spi->dev);
-	if (IS_ERR(lcd->backlight))
-		return PTR_ERR(lcd->backlight);
-
 	spi->mode = SPI_MODE_3;
 	spi->bits_per_word = 9;
 
@@ -350,6 +340,10 @@ static int td028ttec1_probe(struct spi_device *spi)
 	drm_panel_init(&lcd->panel, &lcd->spi->dev, &td028ttec1_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
+	ret = drm_panel_of_backlight(&lcd->panel);
+	if (ret)
+		return ret;
+
 	return drm_panel_add(&lcd->panel);
 }
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
