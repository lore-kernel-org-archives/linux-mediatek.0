Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB57C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F20924670
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XuHCQEV0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euqtqE1p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F20924670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+OQdJCMIvDjwmXFDt8g0rm67YMl6ads/oYEgtqLSc4=; b=XuHCQEV01z1Bh6
	gH8nQStc8dpMhJv14ocUnkHgX4rDranEZ6h32Gd8iu+d9Q4/fLR+qPtzuhXCIM4JcGXPcN/+AEKY5
	rfFr9KDXqqiO4VKcJ9xwKBWZFy4ODbOjYDfijmaosAJP4G2BSHs8R/ICv9Al/jRjW3hAANV37cuob
	MNtFdWdVOUeetO7gY3LuHvZIw3DR49gHKovkk0Qf+QnHbRD3N/V7Kq+c9zP2DoxO21lVbGF/lvcsK
	rPB13sJHtC0eUDJFw3q1tLEdTxSXrGO3C5KTsutHPIcih/dOfe/BdWFJa9+5CQjh7kRde66OptlCF
	Wf46ahecL1Ag98QzQr4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idaka-0001Vn-JT; Sat, 07 Dec 2019 14:08:00 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idah8-0005eT-1n; Sat, 07 Dec 2019 14:04:28 +0000
Received: by mail-lj1-x244.google.com with SMTP id u17so10723622lja.4;
 Sat, 07 Dec 2019 06:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/X1ku96PJtMOzhRmVeY8hbSu7FlKPaZgSc8fbXe+3Q=;
 b=euqtqE1pfc3hrle5JL0T16PR1L5s+gJEwTWJzevgh0O7PZ66Jv2B50bf0spx1cau+t
 QePMKRl0lP8NMT/G0y+Ypfpy91xuYEAdflY9cuxYUJR/0OtX6NIbaI0Er2rS3gOxnFdt
 tg16hWbgLAlhru+jIbcRH4wTMqohJwkGHXeWOqt1JIFNw5fgO/4JyanxyGnXsyCZDap7
 wtYXIJhQABWszpbteIBw62xqiMfEYV29xOzGzGBNS/teKsSMj9y40x3IcYVfhxsgzd1u
 w/xEqE68bfhC3Sm5xv8oSO/g158a13sKqoy5QP+n5wZILCXOqSVde3mfFu4Il/I6sGtq
 bLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a/X1ku96PJtMOzhRmVeY8hbSu7FlKPaZgSc8fbXe+3Q=;
 b=SMTRQzUQ0bev2upJ2aW7Z/EF6XXHbb2mcfmHYT/e1W7dbgUtsqIoUEUnaf+VtI1Y/Y
 S8yVhdbLiR4Kg8cKS1RBqA8pQ0lbaKL+2p0Az3elxzUqpQOKStPAQO2IGJrMKU5pziRj
 gNUfu2rhM7AIVKtXKQ4WsEP7qx36CsTCuWAjJVZIr+PPr/0fulOuT4fZwUUnwWwRAsn8
 ++YysI3Qy5Ft5/AWlC5EUpgkjbbD9pvcQP7ybNO6F2C8ggVB55/Potd1qbUeTfBXMk8d
 e8CCMaaPJSyCPBu1Q8AbFXPKeGZ7c3B945B/MPJZbWOeTzEt5Gm75p3ko7oblTu/vLJB
 H6Tw==
X-Gm-Message-State: APjAAAXU+/dNfoFQs/6eo9qN4E49dTbHvsAWUXKMd/Cx9FWnkVyzGj6t
 2Z+L4HMxfchE7S22N+FQKpI=
X-Google-Smtp-Source: APXvYqwFENSCVyDVwakZNKkQAOC32yhJVErz1ubaDfyLjZVYnCk6bftAg9IioG6emITjn57KtG6AsQ==
X-Received: by 2002:a2e:2e0e:: with SMTP id u14mr11617285lju.106.1575727464491; 
 Sat, 07 Dec 2019 06:04:24 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:24 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 08/25] drm/panel: feiyang-fy07024di26a30d: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:36 +0100
Message-Id: <20191207140353.23967-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_060426_138836_334AE6A8 
X-CRM114-Status: GOOD (  11.80  )
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
