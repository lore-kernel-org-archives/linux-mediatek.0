Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8661C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 04:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZBe9+xFCIYPLHLJbsQcrjisqFkA3tA8STSPpOOHkgU=; b=mIZ7ixFqlFVZPw
	qVVumK2/+7iyhtjXlfAjwIwOVV3i9Yo9uutpoawaK8N5cvM2CdiVNVSQoBCIgdRJ6p/nrFEy1j4XK
	P2ahO9i4X0joztnGgvUgsrKmvrobY5YAtPaFB+EMxM9vfpkVVkUh2oj+mImvjuc86DtFJsgR6mdbO
	Gzp6gAeiNEcbO9GWDlW/D+DIjCiNmQvRQxiFC1kFyyOR6zS/uHq7Gy467f9+GNyuPjkhRunUN/d7b
	becMm4PWulqXTY4N1brdH8hQJQUUieUM6Qr2sxu6BaIQ32Lc4Wssq6B+mawjqjLbM9XuClrijEEq5
	jdSMgN6AY2F6bS6yWXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4g0-00Gi5n-Pi; Mon, 06 Jun 2022 04:49:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4ed-00GhHj-RD
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 04:47:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id b5so11214371plx.10
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jun 2022 21:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97K3htkiWQw+INn8ETXNI7aVsJxE2gVqrlXYI1w5zzg=;
        b=dpNT3fTX/WPB28+JQiYWM7nrmX5TOOLvK8DrJSqzIIFhGqrpFbggxbj9UFaSCTSaAn
         LmuhI/pzBFe/vSEP67ajaAyBbveZCRa0Uw47P+OUvwnCR9uLK97wlNpW3/B55/T156Cd
         +NaBn/YN9zWbC4kRLOhAn6kg37+XSoHeweuDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97K3htkiWQw+INn8ETXNI7aVsJxE2gVqrlXYI1w5zzg=;
        b=67dDZ2+ECKnKGH0Ilz/t+2V87NGtArrAk9Q8F1XvfKmGvzuFH/d2ycpM5flRSYvqkA
         kubjNrJwAWKgUxYamhHT7gXk+McTN5I0TNbOs2zx7IeRssnIS0AevY4XdD614e5VzZ1/
         IzemadcEcnm2bK3gxWci7ksQjSsFyCJMpSb0l6i4U2l/LVYpRg3sEwjSK8Ij1rvcjNMr
         qY386cpIS+eSS3QQ2ykPQWcKO5nwlkBUDftUMaBaI3GEfZTe+oj1ORrl+QqOx4PECug1
         HZX6Wy7WsRUh1RSrRzf+clGc9FiF9LJ4jDsqooSEofx9pMtFsscKQIzV+fnGBqNX1Gfy
         aiCQ==
X-Gm-Message-State: AOAM531MGFVG3y/WQofMzFRV5tAY2IMQVZTM1H2GLk9MPEnVU9kR2NER
	+zqVcMjKhHFMYIWEdOmOZLZxNw==
X-Google-Smtp-Source: ABdhPJxWIJ5ysaq0U6xtUiPqFAzKyFZ1dwsPlcd06PakILavWh2loAFbXrXLsTBIY0LKdxgIA1tiYQ==
X-Received: by 2002:a17:903:2cb:b0:14f:4fb6:2fb0 with SMTP id s11-20020a17090302cb00b0014f4fb62fb0mr22003917plk.172.1654490871310;
        Sun, 05 Jun 2022 21:47:51 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ced3:b110:401b:b32c])
        by smtp.gmail.com with ESMTPSA id t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:47:50 -0700 (PDT)
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
Subject: [PATCH v3 7/8] drm/panel: elida-kd35t133: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 12:47:19 +0800
Message-Id: <20220606044720.945964-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_214751_941712_2CDADA92 
X-CRM114-Status: GOOD (  12.91  )
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
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 80227617a4d6..fa85a288afdc 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -217,15 +217,29 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 	drm_mode_probed_add(connector, mode);
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation kd35t133_get_orientation(struct drm_panel *panel)
+{
+       struct kd35t133 *ctx = panel_to_kd35t133(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs kd35t133_funcs = {
 	.unprepare	= kd35t133_unprepare,
 	.prepare	= kd35t133_prepare,
 	.get_modes	= kd35t133_get_modes,
+	.get_orientation = kd35t133_get_orientation,
 };
 
 static int kd35t133_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
