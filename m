Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79766CCA473
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WH5hgnZoGB/0cE5novnnyS2TNJn/IkUsFSDNnpS+gnU=; b=gSRPKzuZPxMELH
	FIUsb4+jPEvjGatW28QT/jiQ5wZDfuNzJLdFEq1YJoHNODxOs6uqI/4ZAYcqlRifbYkmDNcJb1y1V
	j+KQz6iXSO4sjznePjMmFibZt7Tg0CKPD79nlO8IxhU8AXnBhtZUihnUVHhEt8etns7lu/v20bDsW
	LS4bPmteDbay3yJmPm4GQ0zyQ3OHJ5gWAljZmJAKDvS09+P6DrP+Qr73WzwL3qWETspBW+aKTJemQ
	SrOfWveZRKs0f4LZYF/ercalXGHrQOfEeaNFcnmHDrlld7rrNcVBAm3K2WOin7QK4GjAkRmvX6LAj
	ocAckhNh4fynjanJK1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEb8-001mJk-Cw; Mon, 06 Jun 2022 15:24:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEax-001mCV-Tw
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:24:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id w3so12337209plp.13
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/LOT6rcj75BLu5PAhhZSBrZhENYGfSEJ9VcTy2ymZ8A=;
        b=WEtPtsSlp7epK+M3w4yaaaGS/p+B2+4rpNHJeUsP9pApwkHOD6/CvyYeaubs73Yt/w
         oPoFAMzIMC++OPvNhqyBh/HoAvv2qP66rFYT0/uEsedGJhm18S6d890znFvx8vGNsOEa
         vHBGRFLbv9y2nkty8mKnNyBjq9KlWxKnFuADI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/LOT6rcj75BLu5PAhhZSBrZhENYGfSEJ9VcTy2ymZ8A=;
        b=H6lDx3skvyt1e6oekkoClkhn6oO6i5Vtv4vn8S2SC5r8MmuHyv58H1jInh7JmNt4aw
         KDICBd3uyr63KjOAARauO2MT0LksVmOfmC0ksbHx1BF2heRTGELpCp9reteRHj+Tt4b+
         XHfrPQSjiGKltifV9DG1SV/x6cVQcIcHOVcbjNT/yOGcQatyztK1R54izXpsP/vMaGgq
         qdTg1a4B5ec8dwhlF6bXqrXuljxAlXZ+Uh4xJskKpst3NnaQv7TZLcDvMPlnEbMTsR9k
         tEcV35PuoMReotItOdY8w1f2zjWyZRqQ3gMsbbbsFswe0GxZ88CC685RPRC5VSEQgeBY
         N1jQ==
X-Gm-Message-State: AOAM533ZVPczND3cfarxu9xlRfV/bKw6WTqMrTzaZAg1PAsEFqEQUCqi
	Zkwvf9zjXvMjmAwgRC7YX4Zecg==
X-Google-Smtp-Source: ABdhPJy7JvLDYfxz5F4Nt8K+TVZ3FjEYm4tRpfxZ1sLiT7du/kp/1NB5fmpP5Q6LvbYZVHw35nx5Nw==
X-Received: by 2002:a17:902:d50b:b0:165:2aa0:4b22 with SMTP id b11-20020a170902d50b00b001652aa04b22mr24685964plg.131.1654529080928;
        Mon, 06 Jun 2022 08:24:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a0a:5e4:e24:c8c4])
        by smtp.gmail.com with ESMTPSA id h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:24:40 -0700 (PDT)
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
Subject: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation() to return panel orientation
Date: Mon,  6 Jun 2022 23:24:24 +0800
Message-Id: <20220606152431.1889185-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082444_012715_701F54D0 
X-CRM114-Status: GOOD (  14.40  )
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v3->v4: Add a blank line.
---
 drivers/gpu/drm/drm_panel.c |  9 +++++++++
 include/drm/drm_panel.h     | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..e12056cfeca8 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -223,6 +223,15 @@ int drm_panel_get_modes(struct drm_panel *panel,
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
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_panel - look up a panel using a device tree node
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index d279ee455f01..5dadbf3b0370 100644
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
@@ -202,6 +211,7 @@ int drm_panel_enable(struct drm_panel *panel);
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
