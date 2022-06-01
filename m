Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEB3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cXWx0bILZi8tHNk+O5zgYRzIMT/lB+wNPw/gBJCPag=; b=QExdcp+UHsp68c
	xdGOyDa/iBOHrdhBxpC4Ww6/H0tF/b0duH8VGRqIZo+K4ctDwrtwBcbX4kIv1FNU0C+3kjEPJHO3/
	4qHGQJHjPVF58g2jR3lbkheQsEpFiV+/c4FNltns9ozt8jsFWrCK9Hm7RkMiIMZsScm39QLHZVd1/
	n1x7ia4/+PZNNudLVXPSpKbTbveIdNhqk6oeWtbGZrmvyHY5N1Yz15mvHJeUZfmDl/5tUYAG66kB3
	Tfcpu2q5IjG2oturhVSSjhWjTJEl0QRZk9Lig3jkZqIFuykheluCkiR070aH7k1yVI7xSQKkCGCrA
	WOjyF8MoHoe7TS5lDaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJZY-00Eagr-HQ; Wed, 01 Jun 2022 08:19:20 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJYs-00EaJ5-Dd
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:18:41 +0000
Received: by mail-pf1-x42a.google.com with SMTP id y189so1274694pfy.10
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J6otup5wwDiJiR5+96KYND5483KtpYkBAJdtKoJuyjw=;
        b=BGAvSYU9vjZTkpLSJ7omYSCLkD5rwGC1Zrhe14tzTJ6mJD+IIaL5fUI5zVIvCYI+5u
         O3f/OGU3hXmiYGCIGDMvonGidLU3nu4HPEq+CqlZbJgIDMOLjCYmDLKBo5HvLSpDqxVe
         H1KJgITqR080yv/vNhZy4x0gJZsaELlx3YRkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J6otup5wwDiJiR5+96KYND5483KtpYkBAJdtKoJuyjw=;
        b=kJq/RoHvBFoPb1tyruolUKbcrJ2FYbcpO5vKAOB6AZQcBxdi32TXExgu+qeUeSv1o0
         zlJ2kbvk8JJTZIt/GVWgSvbu50bnA2G6L200inobVRKQ75gZA2DyNE202HDGsaG7Ipzj
         ka4w/j0pukqKz5PH4RfP7y7bWmVHmP2RCMetk4FkMT/lHDnZB2dV1NeQQJiMnnywSb3s
         d8wOOOlKJtzIgu3QrggYdwg3z9MIFC3Qa/9EPLITPn6A7kgYpYRsDLJyWPc1LaHNcyrq
         TN0zb5ThuOSszMgbK4jhbFGSsDW/VLB2aSfGkO5Img/cQOSIRfh/dypvDbbHFCDMvEJA
         mZng==
X-Gm-Message-State: AOAM533DFhW23+VyaR0hFPSWdM5kIJWKzskbKd4/g1/gshs4Ia5Sdb4O
	+Hr6YGck4AUfRVF5Uau1oFHe1Q==
X-Google-Smtp-Source: ABdhPJxZtG9SxZt0jjn5YoMjm5E41BxQstTom3oWSD4bkT9rz40vuUR4Iqfq9TVHuB+ISGAC/oywrw==
X-Received: by 2002:a05:6a00:850:b0:518:a9b2:1a19 with SMTP id q16-20020a056a00085000b00518a9b21a19mr45874414pfk.75.1654071515261;
        Wed, 01 Jun 2022 01:18:35 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 01:18:34 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] drm/panel: Add an API drm_panel_get_orientation() to return panel orientation
Date: Wed,  1 Jun 2022 16:18:16 +0800
Message-Id: <20220601081823.1038797-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_011838_549521_E9A9ACC1 
X-CRM114-Status: GOOD (  15.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Panels usually call drm_connector_set_panel_orientation(), which is
later than drm/kms driver calling drm_dev_register(). This leads to a
WARN().

The orientation property is known earlier. For example, some panels
parse the property through device tree during probe.

Add an API to return the property from panel to drm/kms driver, so the
drivers are able to call drm_connector_set_panel_orientation() before
drm_dev_register().

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Previous discussion:
https://patchwork.kernel.org/project/linux-mediatek/cover/20220530081910.3947168-1-hsinyi@chromium.org/#24877477
---
 drivers/gpu/drm/drm_panel.c |  8 ++++++++
 include/drm/drm_panel.h     | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..4a512ca80673 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -223,6 +223,14 @@ int drm_panel_get_modes(struct drm_panel *panel,
 }
 EXPORT_SYMBOL(drm_panel_get_modes);
 
+enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->get_orientation)
+		return panel->funcs->get_orientation(panel);
+
+	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+}
+EXPORT_SYMBOL(drm_panel_get_orientation);
 #ifdef CONFIG_OF
 /**
  * of_drm_find_panel - look up a panel using a device tree node
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 1ba2d424a53f..d1bd3be4bbdf 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -133,6 +133,15 @@ struct drm_panel_funcs {
 	 * Allows panels to create panels-specific debugfs files.
 	 */
 	void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
+
+	/**
+	 * @get_orientation:
+	 *
+	 * Return the panel orientation set by device tree or EDID.
+	 *
+	 * This function is optional.
+	 */
+	enum drm_panel_orientation (*get_orientation)(struct drm_panel *panel);
 };
 
 /**
@@ -195,6 +204,7 @@ int drm_panel_enable(struct drm_panel *panel);
 int drm_panel_disable(struct drm_panel *panel);
 
 int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
+enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel);
 
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
 struct drm_panel *of_drm_find_panel(const struct device_node *np);
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
