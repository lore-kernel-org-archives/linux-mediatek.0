Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF6BC43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EAE824677
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sGUaL5bo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msAonKM+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EAE824677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5s26LplTav5J5oSjoIe0T195PRKzuTXjeHIKXVBjqXE=; b=sGUaL5boBzEgzz
	KG2MlvPbyOIrIvjHr5ZKOLe38MHZzshyiwvjSuuthSkjmTA/dREhZ9xdo3eTTNws+JcAd0/smYIE5
	b9JvmcUhrxnAHuTEbi6PM/k6bvak4Y64TKNLy7+82wDpj4hpz6WvbN7MUetOpKMCSzLvEQhr8TicS
	fqhXEsAaFE94GMgIOAb6A/lKvM1T6yvKiTiHoWmmedDIkq41pEy0aHpeAo+JJ/s1mQsJjE42SFsr2
	DvfCeX1ghQnthfylZqnk8PTjbHgAw606rLXKBUJnsXS8uIjpGZEPWsJZyQWn9NYjFcvgejrBfje9D
	Fx2qryG5x8ZhoK1AU/Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idaoH-0006M8-IX; Sat, 07 Dec 2019 14:11:49 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idahR-0005sZ-UJ; Sat, 07 Dec 2019 14:04:48 +0000
Received: by mail-lj1-x241.google.com with SMTP id j6so10737685lja.2;
 Sat, 07 Dec 2019 06:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e7mwo6xIwy/U2XO5N1RPHN+wQVnB1gT7AErUd+pEX6s=;
 b=msAonKM+50sxoUWm6s+q2esLV9oiyaLLag111TzDTz8SQ+I/uiTt4rgjySC6KQ24ZP
 fXT8q42NVcWNBBOldzoyC2oxgwuojTx+oMy8sGrVOxFJc+sIFep2xsKxiGPLGuvCUOQb
 +DehKKaI9EjFDPgvxBfkGTlkJ6+EeOEQ26qQrsfCpTK5BlwPzwkP21+KBhAIynRdYqh0
 Jw7CBJeqjUi/cNctV7ufzixPmO4vWRS6LCKWGG3X/IuYWOWD+ogcWxss+SUNRHoQhGxd
 rb3/XNYedJL3zRiwMkBCAYztTMbOApa0sT+M+ObavSMPtvRbjj3Ie40+20QGBlMIpb2P
 +9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e7mwo6xIwy/U2XO5N1RPHN+wQVnB1gT7AErUd+pEX6s=;
 b=DYAgPdcs7dxph6DW+gE0nJUSLzi128WudQ/7fFyTVpnmzpvJp9Caf6fRMbUQEMadtP
 j5jQWQyo67KIPn2dj5jLLCNuJw9s4pQZPMB5Ibsy+x6mI9D1cxyO7vTIOoCWNV99nYRg
 KV6TdvPbF7Mmryzd1gu/0J7TxUATdE5uU9Uh+Y/4c6jwCpdh6i0fZCxEHo5dzCK0H7/y
 Ak82N6miCzL/VwV6a4UALriQSTRp+8LuwesXWZwt5Ts2EePfrpItHdZBIpCVrsZzBlKS
 CiMuIWKRkajy+zb1r2C7z0AY3UU78cl2niVMINjHewH2bNL9EOXz7Flylvz8TnNPa++b
 GWkg==
X-Gm-Message-State: APjAAAVx13GrWr9R2xj8Ug8+Xn4p8p/IQsGm4M9Lk+985c+E0rJM3/cP
 Z3jV//iOlgfvPQ2PeDrh708=
X-Google-Smtp-Source: APXvYqwmQQwd5PYZLccoPw95nR8Lj7iniKv3EdQE4SgC0FhGKWQQgOWwqa3PijSftjOtij17f88rLg==
X-Received: by 2002:a2e:2d11:: with SMTP id t17mr3482709ljt.177.1575727484353; 
 Sat, 07 Dec 2019 06:04:44 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:43 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 19/25] drm/panel: seiko-43wvf1g: use drm_panel backlight
 support
Date: Sat,  7 Dec 2019 15:03:47 +0100
Message-Id: <20191207140353.23967-20-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_060446_145335_33589481 
X-CRM114-Status: GOOD (  12.59  )
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
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 36 ++++-----------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 18e745104aaf..40fcbbbacb2c 100644
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
@@ -245,7 +231,6 @@ static const struct drm_panel_funcs seiko_panel_funcs = {
 static int seiko_panel_probe(struct device *dev,
 					const struct seiko_panel_desc *desc)
 {
-	struct device_node *backlight;
 	struct seiko_panel *panel;
 	int err;
 
@@ -265,18 +250,13 @@ static int seiko_panel_probe(struct device *dev,
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
@@ -291,11 +271,7 @@ static int seiko_panel_remove(struct platform_device *pdev)
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
@@ -304,7 +280,7 @@ static void seiko_panel_shutdown(struct platform_device *pdev)
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
