Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A41C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 04:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQ83cB5X5P/vIgcn/8x8Biw/D57EDMizjQyaZQNb/20=; b=xG0qup/4X79mCZ
	d5Up5c/2lcxFhfG1H/XxWqEJBHyBOSRFjAh2v9Tx8ddqtqDiDyNIC8Bztk98hP0/uhhxl/jlOD5IM
	rEwe1OJL1p+7kadTK3A+HTTMp2n4KkM8LSg2+TPFSeBq2OtTdPt9Gn9UvcXfbsX/HClH1IL4bYf1i
	DNb+PisUXcSM635cAOSFDiy7VVfwKY9J9wzzn/Bpi9wOM7c06vXdit23ijI2XvoE3vKzoYyZhHRCH
	c5es2/g9kvjfo5nFI8akBhUabweVCtCbHq2IOkXOCpbWwhKDbkh+Fy99ZAv6L6rT9E1M7g2UohjtQ
	+QQX4Je9V+1JADeAQr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4ep-00GhOs-FL; Mon, 06 Jun 2022 04:48:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4eP-00Gh94-Sq
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 04:47:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id f9so779692plg.0
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jun 2022 21:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j5js470YBzKdTaXPl+QQ3rHxeotAooP4m8EcPovVk7E=;
        b=jsy7p+Ffk83iH0WeQKhkJUtkuFwG2INATX6huMKL3o2tgG0gGW3qfw6O/Y1Oi1MDyg
         86riQ5YlrwYS7iGY1PePFPe+QKpOOSPUS/fFSgbsGS9/VB15qANkhc1m6SHZ/SEYuU7k
         2XcBTzVWeh3t3DXe0/FAfRY1xILCc0/LrypXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j5js470YBzKdTaXPl+QQ3rHxeotAooP4m8EcPovVk7E=;
        b=2qWYOU2Tq9w2aJFEmVBCtYCTGmiFWvFixWSsB4LGoOGPS2Sre5ZKYOWKykZWzw1OxK
         BdMo1+Ms3D0UdW0FmsEGj3OlzDKVpjVavkd+uhcaqAO95TspUiU2eOVBAvK42yeZdowS
         OJ9brCkCUI3AVZggaPdFMyj8ItEC62kQFrL90uFPM/AB4ogAK7OCo+SAK51/Hi7nK95t
         bgY3VOMLYDJZW4WFhJrCRtE3hrvSOkI+FOCTRoHZG16vT8+OhBio7cUv1uM1NXGIqmXc
         68jazRwBL/8hV1ACZV+/ruboNnhy9UI3riwQUzI3zr1qiivWlMqTX6X/Xd9HRNoNnfo0
         MRcQ==
X-Gm-Message-State: AOAM532g8LVAU6NgzbYHWZ83NQfG8f6p8oO5cvmB/90tnnPErZOfBW0Z
	I87KqlGQasFSOYZM2U3ptC/OHQ==
X-Google-Smtp-Source: ABdhPJy42F5uKW7n3PhvsBm2Wpi4Be0H0h9tOi7rmAJO1h8CZRqP4ccOd2jEJ378wYUXbDk+hWrJJg==
X-Received: by 2002:a17:902:8648:b0:167:86f2:aec3 with SMTP id y8-20020a170902864800b0016786f2aec3mr986607plt.172.1654490857525;
        Sun, 05 Jun 2022 21:47:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ced3:b110:401b:b32c])
        by smtp.gmail.com with ESMTPSA id t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:47:37 -0700 (PDT)
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
Subject: [PATCH v3 3/8] drm/panel: panel-edp: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 12:47:15 +0800
Message-Id: <20220606044720.945964-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_214737_955788_157EB619 
X-CRM114-Status: GOOD (  14.68  )
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

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2->v3: add comments for notice.
---
 drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 1732b4f56e38..5fa208005395 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -586,7 +586,12 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	else if (!num)
 		dev_warn(p->base.dev, "No display modes\n");
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -609,6 +614,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_edp_get_orientation(struct drm_panel *panel)
+{
+	struct panel_edp *p = to_panel_edp(panel);
+
+       return p->orientation;
+}
+
 static int detected_panel_show(struct seq_file *s, void *data)
 {
 	struct drm_panel *panel = s->private;
@@ -637,6 +649,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
 	.prepare = panel_edp_prepare,
 	.enable = panel_edp_enable,
 	.get_modes = panel_edp_get_modes,
+	.get_orientation = panel_edp_get_orientation,
 	.get_timings = panel_edp_get_timings,
 	.debugfs_init = panel_edp_debugfs_init,
 };
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
