Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC0FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uyuVEDqKkVz7gbckkRm+rTCC2fuwEHBqd/LPLlOmCM=; b=1rML6nS5Ovyd6l
	h13KOrUFQdcVCxp+RzGTF9VZ4DMCdj2oBfs+qvG6E771qn3Mm61JqbAfUcKWlHsOtg33KGC9iz/wx
	WxpP6UZy13BrmONar1sqpArieUl3i14ZODhEqPkgwWyHYLWJO7uvLaiQk/oOK9guViQMoQoBHWNqr
	Iw5qDsBs8sMaJzPZcgWIr+3Vj6+TRzBm/y7xEnWokFEVXQYaUlAZi4Rmv1z6b0asfzM7yAwdcILvF
	IcWDqag8W0KhYPo+rFZw3hxNy6DFSl/6SZkdGEeJWdgAsYyzbrhQHfMldNmbXr3rtC/2z0fttEMgY
	jwLkMqBStdcYsbki4WvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwL7f-00F5e8-2h; Wed, 01 Jun 2022 09:58:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKwC-00F1EU-0o
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:46:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id i1so1295019plg.7
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ly6+5XNWmCSkjCBGbVKtEs9r+Surb9t2PEnnpf5hGg=;
        b=QRBX/kxizeClVBE0CYu4NjV4OOEi4yCiQqllUL190dxEVKt6HTUf6obRnPH+h/5Do6
         X67p3+jRpmcMr2sRMX1JDEgOAmWlHfT2i9GjxibwNOvxEKU13OXXV74hKqUHIvaf6LSo
         TiLpRisA8FksqwMAxdxJukxiVP42iMy06fPk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ly6+5XNWmCSkjCBGbVKtEs9r+Surb9t2PEnnpf5hGg=;
        b=QlMmc3ns4dXmLwEIJOwaC7N7sQ2x3GJqIl6+sA4t8xmvv+NuFl5YTAPUDarBz9jLgZ
         kQjhu8gZ4TRKgW12podXHcaAvjxvXJt7nH4ymPBO74UN/Ruag47WnaKrxCbwA5hFUyZG
         yS7KvX23m7l/QafZaVhUkesLine2md+95WPc6y9HfzgIj8j9ZPK1acP/4f/HrmcDq7u4
         nWL5tfxFdM7ULFNI/ncrRJvO2xxzkBWcVeIE1A6ixiYiObGZ25Nek+lkDyTofz8Ki1A+
         BOEVXDctPvU9irQn3M/x2D+iI2svggssv1pczzxeFJ9wgtVllVe1Z0RgTbBxCEDswEdl
         wv6A==
X-Gm-Message-State: AOAM530NJsfqvIR84PaVq5wTqXDLl4gIXcAr3XtxN8FgQC5YM0SxoiPN
	gkOnlrybQkWS8s7LPuMFbYOQyg==
X-Google-Smtp-Source: ABdhPJzeWn2amYAMvPYY4kbTogyvoZUC/Zy9OCPdoeNKPYAG80RGrpKEdqDx8Y3iV2XaG61OhG6/CQ==
X-Received: by 2002:a17:903:1211:b0:15e:8208:8cc0 with SMTP id l17-20020a170903121100b0015e82088cc0mr66287614plh.52.1654076807659;
        Wed, 01 Jun 2022 02:46:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:46:47 -0700 (PDT)
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
Subject: [PATCH v2 1/8] drm/panel: Add an API drm_panel_get_orientation() to return panel orientation
Date: Wed,  1 Jun 2022 17:46:30 +0800
Message-Id: <20220601094637.1200634-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_024648_099115_D7AC40E5 
X-CRM114-Status: GOOD (  15.39  )
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

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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
