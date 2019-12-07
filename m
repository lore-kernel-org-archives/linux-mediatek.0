Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DE5C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:13:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A7824677
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LZAYQATM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCzX7740"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6A7824677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3brCTgpwbBg9Aq5oasl6L+N+awPKJ8mOS3zOSe5Fw4=; b=LZAYQATM0reUIv
	3nTN6ENNr5/33Mvtczgp2/9gOjMoGGasIdzy48LArT7Q8dycUaHv7vk3ITwWauzjDswbqMe3/uJ0J
	IwMtiOx5SLM04NmEgtbvUzIIzO2lFFkIvcNOZAE9PO7zPCBN/7VPRRqieCoAPCxB8YSyKb1BdAHJJ
	+D3tKI/OSDqhFHo+SFzWhQ8KmRfuD2jmXYlzR+nbh16CPizBIHlaeLZn5u6P4fWdTkxjLIdEHZdHJ
	Z6nuRNBgCWE5jN6lkEP0r8p8dLAoxbzZvzrriTZ3rTv32TlZfvUS4YGjwpzM0O27O8egwRPUKFjRY
	/TkfhEJPm/7BA+KFnTSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idaq2-00089E-ET; Sat, 07 Dec 2019 14:13:38 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idaha-0005yY-5n; Sat, 07 Dec 2019 14:04:55 +0000
Received: by mail-lj1-x242.google.com with SMTP id d20so10660139ljc.12;
 Sat, 07 Dec 2019 06:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SbAZsoLI4xe9I1FggVPS6JxgD/wZYj776xJ1KOhYNIk=;
 b=DCzX7740hQWDvyui4A8ga8DkYDCncQFz4GDyBUZdgaMJdfBOLfab/YXEKbqNxeNt15
 3tHZkpiTr/zuL6N3ZElvYBLM+CewDl04mfT5TD53GI0I0rsUs+yrDHc7ZwmEvlvVgLcn
 Sh1p51fhuIU9LaCeS7pZRZt/EGRmsq2zDF56PCT8PQX0dh0SOe7piwguDWq3xVxCh+1+
 YOynvNp9Vpl9YGZRC9ZB1L8Oc0/NBQNlmtAoxgBtKnG2Tg2IZcYjOkRp8hVxt0WChfIi
 9FaIqOlPVaofR8kankX4QZE3AbRYT2FdIbF6MztPJ6s25nfdKHjJFl1UwUOdY5WHme4Q
 2ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SbAZsoLI4xe9I1FggVPS6JxgD/wZYj776xJ1KOhYNIk=;
 b=jreXZKCfnb4his6rTt7U32lEdwNt9POdwewef184GyOeLx359wrJQoJnmFbRDWtLTg
 qd/iagr/PDmzgLtzmBFaNhkzEejsrSI1gtqA+OAxCdPMKm11WR4gktjmP14B7rUiZj34
 3+/wX2+mfs0GqmuoxnKo77V/yecDXoZZDIRf0djwzfGLPnzouwVSYbrj5+WXA7Gt4G0j
 PVllufKBKkonDMcEx6H6LjgAlUayidHmMqfsYWe9y+HsfiETeLb6ap18olwwMkH4KqWt
 9LXxRK83KJcsHiDZ/I5UjSYP1jsECpkeU7Oo8T6h+qBV7Ej2doiH/kHntjkczeuEr7Z4
 tY1Q==
X-Gm-Message-State: APjAAAXWWhIwqEsgqHdD7S4eTSqs2VWFW6J/i6/pRYvDs2TJqdmTbUze
 u7UxqFXuGxpP0XeMuZ0oGN8=
X-Google-Smtp-Source: APXvYqyueXqxzfVF1B9uqOsm+QnSO4hj8wBzhQU9+hnmAtFQMkiDT971EwDtMKEqiCRZcigJkrKh8A==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr4087572ljk.220.1575727492532; 
 Sat, 07 Dec 2019 06:04:52 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:52 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 24/25] drm/panel: tpo-td028ttec1: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:52 +0100
Message-Id: <20191207140353.23967-25-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_060454_330077_256AFBC5 
X-CRM114-Status: GOOD (  10.98  )
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
