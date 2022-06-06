Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7370C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 04:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejuaHFHKjeeer/DghaUw79ary88tLxpqtG30+k8CpNc=; b=m+EIAEujXnfo04
	wHlsFh3qPLP3ROG4RnGs4MN9OJw03yJtg3wxH0XiDoo7+XeI0IWP93BMRyvG3/8bzml2474HMACry
	uhg9C70a7xynwWCHG3r8YuHgQgJRmts4N6LrudjlxnKeQUZPIpdO2+wIZuMZ7OkS4zwxGt6pba8hx
	zJKaA7t3utb4iQsuuJaABZWPRr/valfk9ymSBJSWV1sknGCg5OecbHCi94LVnKeokDGVKOzP5387V
	CSEd2BOWTqPciP+YEdaYBo3w7jrK801hW80tuzJJ3rKeaW6+7d0DBef85y0L2tqQbmlcd4PKvzjjG
	8oYUjvA9V7O7Wi4dViQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4ec-00GhH5-PF; Mon, 06 Jun 2022 04:47:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4eJ-00Gh94-QS
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 04:47:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id f9so779692plg.0
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jun 2022 21:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8MQxz8kqIDAZ2fZ4kfRiAMdgAPZT0OSWTELIOXH4bpA=;
        b=bijG36Pt+M1nDEyjoGMrkaI9t4WYfcYdP+WZvFtG4qqKlRVCURyenQorZwvdwzgOV2
         rgV2/0rYZAVwdMhSIzPujdPzeTd3lkGeRkbFI1yuY0dQnqMJr+1tpT4r0onWdGqgqkHa
         GqYdc69FSkzbyYjUAq914jSACIJVZt8JnQi1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8MQxz8kqIDAZ2fZ4kfRiAMdgAPZT0OSWTELIOXH4bpA=;
        b=VZTfLPhLE7w1A2pqBYn/gUEKhj3fhpTr0fcxdcZyO/r7XrkjPXJEVwDdWKYZQYrxdN
         4X7uG876f/k8SaonUD+/4V9UTxmtVmUEPyI+lCtJCj28BH++7EQlmsWZ5DP8vfzk7ijy
         KezFcL6NnnEIANnBFsJAqzQg3ujNaf7VpSwvwHdoLXGIPZawkJ9C96GvXddZoV+4RsQb
         z53F9jfBeqjxGPtIm7n9Rg21BwCengwCWmVCbNaOnPCV13Uf2IyZZaoG3Qr0GBy+AO3r
         Ts9KAKrGd7X8SxQq1dlF/p26jq9jmEpp1i59TH05m5HUXuUA9P96bU4/xasrNE6ieRmc
         DPqg==
X-Gm-Message-State: AOAM532i/XeNkV3wtwt33vodb8sayHyKNPbOB5aT6Es6Q4DPraoPd7gI
	ZuURLfxOsoVyxRQsDMIEiHjf4Q==
X-Google-Smtp-Source: ABdhPJyEhyggeaOMzIgoDx50rqIZ96LmNePoBj+W9JhZTpmi9YNIR5A0G9TFAJu584hNP5KsKh6jeg==
X-Received: by 2002:a17:90b:38c1:b0:1e8:5df7:cfd8 with SMTP id nn1-20020a17090b38c100b001e85df7cfd8mr10240268pjb.79.1654490850677;
        Sun, 05 Jun 2022 21:47:30 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ced3:b110:401b:b32c])
        by smtp.gmail.com with ESMTPSA id t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:47:30 -0700 (PDT)
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
Subject: [PATCH v3 1/8] drm/panel: Add an API drm_panel_get_orientation() to return panel orientation
Date: Mon,  6 Jun 2022 12:47:13 +0800
Message-Id: <20220606044720.945964-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_214731_915746_0935C902 
X-CRM114-Status: GOOD (  14.76  )
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
v2->v3: no change
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
