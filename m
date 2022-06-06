Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B690FC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yjngf5QwsEMBEQWVXaJUHYZq6wsfKyad2HPdky5nZsQ=; b=EzG65Amoik8+xC
	cKiucCv1371kLyRh12Q3+IWkqcvv9UuVBOngoBt7cjorFxIVb6pDDfexAgWo0Xxltpk4rDEPj9nHM
	1V1T/LBA95Yih0SvDTMN9agBYis+YV3I1qZUKBw7EJ0lmlhBW1r8RVlUOD+3Z0DgWU1Yn5q62xF/Z
	zcf28rd1P4m6UY53T5oKEbNiUS5WbstBjhBndnzOkpu68gcwU4DGv1YbNmqzXncdCKvQLe0K60Erb
	VIkFd95ECEZwr04UvgZjqoCk5srrH2xcngDtRjWXmL1hjQIVS652bnJzwgDlARKMw6w30dj9e4uPc
	6tSTO3JMw6TsbR3FiiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEcZ-001nJ3-I3; Mon, 06 Jun 2022 15:26:23 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEb7-001mID-DF
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:24:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so18172876pjo.0
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JUUMSUxjqpGlmr3hthDS9G4YblhtZnmP+Xt3CB0AHAw=;
        b=MM9wCxMHjra8vSnY99x51x6RVe62qnapf1dqn+TZ9V6KMLtMycNavxNRE0f2U7wBnO
         dSH0v42r3ErXXt7j22NXnI+Be3YKWIHWXNkU5iPsPIWtsk8gDOrVq68MESt0950u85Xf
         i4r5p4PXFFCfquE0opsQ7jduBXRim/P69Sfu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JUUMSUxjqpGlmr3hthDS9G4YblhtZnmP+Xt3CB0AHAw=;
        b=SaYHmzLW/CyFDdBfqXWBZycs3zbyWV4Q1nut8gnbmAwiN2N+NmdiL8ulVLz4ka+HKl
         BPDA0Lqv4INd/I4+iLGzKeULzUz85cu8/JDEES+HYCVnGRpPI9krJbobYPv7NNfA0D+y
         i9cSRWA7YeVKjgqQCDZbGEAXS+ItqJNCYqjFfkvhmDfMEEDCCIkwx14GfZrYQvPuCoWV
         Y6Ly4FgOG8kwXctlxmbrOiZETyFsNBq6wGnvevQMZUS/bd9k/p+ITgRDOxFbJ32SYQde
         Kp2KjztiRBfAF8rS5aGunH3UvRRPgUWQuin8R2tw4u4RIRW6yw2iCqvVJzbvqSxSTynK
         +/XA==
X-Gm-Message-State: AOAM533i3lVDZm7H9mYHeBJClQsg+V1rt/92wjcTOQxt6V8T+nUJzzbD
	rLLWVK1XeUpQTK6J0qBGauIIcQ==
X-Google-Smtp-Source: ABdhPJyfS7sG1ItRoGo2m20r8vhB47EXPGK0Qy9fOfm5yN9s8qx5qB50fptn8+CQbBgByjupLlzaxQ==
X-Received: by 2002:a17:902:e889:b0:167:523c:6011 with SMTP id w9-20020a170902e88900b00167523c6011mr15889647plg.114.1654529091208;
        Mon, 06 Jun 2022 08:24:51 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a0a:5e4:e24:c8c4])
        by smtp.gmail.com with ESMTPSA id h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:24:50 -0700 (PDT)
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
Subject: [PATCH v4 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 23:24:27 +0800
Message-Id: <20220606152431.1889185-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082453_494098_98390324 
X-CRM114-Status: GOOD (  12.74  )
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v3->v4: rebase to latest linux-next to solve conflict.
---
 drivers/gpu/drm/panel/panel-lvds.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index f11252fb00fe..491b64c2c8d6 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -99,15 +99,30 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &lvds->bus_format, 1);
 	connector->display_info.bus_flags = lvds->bus_flags;
+
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, lvds->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation panel_lvds_get_orientation,(struct drm_panel *panel)
+{
+       struct panel_lvds *lvds = to_panel_lvds(panel);
+
+       return lvds->orientation;
+}
+
 static const struct drm_panel_funcs panel_lvds_funcs = {
 	.unprepare = panel_lvds_unprepare,
 	.prepare = panel_lvds_prepare,
 	.get_modes = panel_lvds_get_modes,
+	.get_orientation = panel_lvds_get_orientation,
 };
 
 static int panel_lvds_parse_dt(struct panel_lvds *lvds)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
