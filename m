Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1316C43215
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61BFE20661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hbpUmb+X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7qfmJB7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61BFE20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aB+Pwnj1pHd50fJb1sfNbgGkwPUvR2Bt0zNWnQQhFjg=; b=hbpUmb+XRBuy6L
	VMzGzcF8reLR5Gtaql4IFWotOeI99iqm4lJAUBYEXp2CBxmDpuXvFxGpMQGBco6SXoq/rKR2Ti/9z
	H9mE5enGqlHkLJeo1L607dkuj6a7oXdcYZUHK5RLqZtMX34M7l2RXjuq+qgwbF9hORHw8aIMiOJF9
	GacWAPk174gAUkSaefIs/sIae5OyOG1EDbf1XR8fkyt1grvs+8TJ62ScfJR4PasYMjxvrJxaKFG+e
	kDQp3dXlZ4UUM08a0bVWRZWiMlClt6Y9/NiKfH1S6ijxm4zCGrHETVK/L3aYEWwR6R6wnYRvPrl35
	046Cp4Y+nMaivxQFoRMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrSX-0008GE-15; Mon, 02 Dec 2019 19:34:13 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrRV-0007Lj-Mq; Mon, 02 Dec 2019 19:33:12 +0000
Received: by mail-lj1-x243.google.com with SMTP id 21so875049ljr.0;
 Mon, 02 Dec 2019 11:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQQWTzPxFOvUW0DGcl4YpgZWZHH+8BFvj48Hp2FKfa8=;
 b=P7qfmJB7gvDRX9cK4SwTcYkfCK+h7HfN6dil8iCxOUJpUAmm2axESYkmf6IUXBX3Uq
 WcmlNpE+pVguPwT3omJfvN4fWDZrMuwuXEfiWzGRCml/b3t3ZWCkG9cu3t157dFuaOZ4
 knqGQ/aw7yV6rIykXAsY3sKhFeY0GXLkogBkJISKrtaz0Sg96uheXMKaETsEE+NqE9IT
 ZdhniU0NKn8/PWLne5hKZW5BgXUi5yRzYPX6+vg4Ld9cFLnyLSViVJjpseH9TI5H5NnG
 s3acjDx6kOTjbCM4IaA1oKdjgaptx3ddRgMYzaOgdb/V3KEUtBt6imN+MtGr+WV3pNPE
 w16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kQQWTzPxFOvUW0DGcl4YpgZWZHH+8BFvj48Hp2FKfa8=;
 b=b2sAHMCejc+s7ALPh2HzQif3SrSO+HH42Hnmn+I9nqQN2ZshTaFe4dIo5bPA5CH2pe
 RYZddf+yPCcQtk1COlDz1VgJJsSO9UejNnY8Vkdv3We0oDjZDgGqAPMNiBgLv2SpaM1K
 H+mzS0hF4oq+136MQky4hhWp4DB4bE3Fq7SDoXIOwbriiv1nKuSDeZD2B3ql5kzYvD48
 dQEV8zBORQCxTM/HpP4qAiWoqD9O4Sllegi68aoi7uM0kLp12vq++aJXZ4cTrLdDyq5M
 GexmGcO0nBWw3CNLisx8mM0vW2diI2DdvcYJop8Qc61Wt9JGI0V+V+4mNvH8q8YljPOq
 NaFw==
X-Gm-Message-State: APjAAAW3khTzM4ZV4gmSWqhoiGaZ3ailrGwEyKkD6VMIBeRQkgtpV9k8
 eA/TjcI/aWhbAkFnCY39bFicq4LiCeeGQg==
X-Google-Smtp-Source: APXvYqwYpJfjizEaD5IBDV4xc3cEeqEstQeeKZaXT9Z/vSBZFIXZ28HzUNDZprk6Zlxob1NmomY5yg==
X-Received: by 2002:a2e:7202:: with SMTP id n2mr243436ljc.194.1575315187338;
 Mon, 02 Dec 2019 11:33:07 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:06 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 02/26] drm/panel: add backlight support
Date: Mon,  2 Dec 2019 20:32:06 +0100
Message-Id: <20191202193230.21310-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113309_795112_8FAAF8FD 
X-CRM114-Status: GOOD (  19.78  )
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
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
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

Panels often supports backlight as specified in a device tree.
Update the drm_panel infrastructure to support this to
simplify the drivers.

With this the panel driver just needs to add the following to the
probe() function:

    err = drm_panel_of_backlight(panel);
    if (err)
            return err;

Then drm_panel will handle all the rest.

v2:
- Drop test of CONFIG_DRM_PANEL in header-file (Laurent)
- do not enable backlight if ->enable() returns an error

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_panel.c | 49 +++++++++++++++++++++++++++++++++++--
 include/drm/drm_panel.h     | 23 +++++++++++++++++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 2d59cdd05e50..35609c90e467 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/backlight.h>
 #include <linux/err.h>
 #include <linux/module.h>
 
@@ -196,13 +197,18 @@ EXPORT_SYMBOL(drm_panel_unprepare);
  */
 int drm_panel_enable(struct drm_panel *panel)
 {
+	int ret = 0;
+
 	if (!panel)
 		return -EINVAL;
 
 	if (panel->funcs && panel->funcs->enable)
-		return panel->funcs->enable(panel);
+		ret = panel->funcs->enable(panel);
 
-	return 0;
+	if (ret >= 0)
+		backlight_enable(panel->backlight);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -221,6 +227,8 @@ int drm_panel_disable(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	backlight_disable(panel->backlight);
+
 	if (panel->funcs && panel->funcs->disable)
 		return panel->funcs->disable(panel);
 
@@ -289,6 +297,43 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_panel);
 #endif
 
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+/**
+ * drm_panel_of_backlight - use backlight device node for backlight
+ * @panel: DRM panel
+ *
+ * Use this function to enable backlight handling if your panel
+ * uses device tree and has a backlight handle.
+ *
+ * When panel is enabled backlight will be enabled after a
+ * successfull call to &drm_panel_funcs.enable()
+ *
+ * When panel is disabled backlight will be disabled before the
+ * call to &drm_panel_funcs.disable().
+ *
+ * A typical implementation for a panel driver supporting device tree
+ * will call this function and then backlight just works.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_of_backlight(struct drm_panel *panel)
+{
+	struct backlight_device *backlight;
+
+	if (!panel || !panel->dev)
+		return -EINVAL;
+
+	backlight = devm_of_find_backlight(panel->dev);
+
+	if (IS_ERR(backlight))
+                return PTR_ERR(backlight);
+
+	panel->backlight = backlight;
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_of_backlight);
+#endif
+
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
 MODULE_DESCRIPTION("DRM panel infrastructure");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index ce8da64022b4..d30c98567384 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -28,6 +28,7 @@
 #include <linux/errno.h>
 #include <linux/list.h>
 
+struct backlight_device;
 struct device_node;
 struct drm_connector;
 struct drm_device;
@@ -59,6 +60,10 @@ struct display_timing;
  *
  * To save power when no video data is transmitted, a driver can power down
  * the panel. This is the job of the .unprepare() function.
+ *
+ * Backlight can be handled automatically if configured using
+ * drm_panel_of_backlight(). Then the driver do not need to implement the
+ * functionality to enable/disable backlight.
  */
 struct drm_panel_funcs {
 	/**
@@ -132,6 +137,15 @@ struct drm_panel {
 	 */
 	struct device *dev;
 
+	/**
+	 * @backlight:
+	 *
+	 * Backlight device, used to turn on backlight after
+	 * the call to enable(), and to turn off
+	 * backlight before call to disable().
+	 */
+	struct backlight_device *backlight;
+
 	/**
 	 * @funcs:
 	 *
@@ -183,4 +197,13 @@ static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
+int drm_panel_of_backlight(struct drm_panel *panel);
+#else
+static inline int drm_panel_of_backlight(struct drm_panel *panel)
+{
+	return -EINVAL;
+}
+#endif
+
 #endif
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
