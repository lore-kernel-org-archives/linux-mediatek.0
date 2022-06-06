Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B46FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wj6pfPpnmMMvZXvMp4CEvaIdJH8wcUByimJpCy/PQ6k=; b=EJitt1ZRxlTXhI
	BiW4oYuhEZ421dQgaY506+KM63SXUhMZr2gz0NfZMyxEnWlxgZiFHCIlxKxJjnnJKS0jvtRIcT66t
	GK8pDnM7ODFnF7Vo/7MVZshhTBhnvdejh5ktJADC2leN+rvZtcs9McN6dGIpQw9S2CafQBXwsw+w9
	DRn6E0ifRexDSzZnpexVtRY12U6OLZ92e0ledpXLcisRDDCtGSG0hsjFRYQ1VGny7dX8mIjDyXgvw
	e+cUsV7wKXgHPMzrHhxyyQFjOcezznEE9JLBJriMtWctVkm6u4JCRkS1ez2TZ9tzT3YO8lunroCKg
	kdeAYxQC+VFMxNG3TA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEdx-001o03-8c; Mon, 06 Jun 2022 15:27:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEbI-001mPa-Bj
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:25:05 +0000
Received: by mail-pg1-x52f.google.com with SMTP id q123so13165411pgq.6
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pK8Pia3oWcO6LvRo8JULHgdKZyhIvY64SIstYz7E0T8=;
        b=j8KrEYwzpTl5wHCO3UxGm1TqLbk/MMUjBXH7zs5T2HtQD/NymmchMMT2FhwajxbvDA
         /NGiGjbOKNhODqs6sZLzSOIu7dkS7XzlyhcmJNGvmaouF1zHr6tpgxhRc544Z15q2oF9
         L+qG4WbV8zWJL+HU6jxVCj6uINhkvLcAgNEFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pK8Pia3oWcO6LvRo8JULHgdKZyhIvY64SIstYz7E0T8=;
        b=1xuVXDRbUHmhTn2PM6NVhKPDbfS/3Ud4CyTPm7r3pOr3e13X6lYUbDxSSq27zfWvmq
         FOc0h+JEtnVuUTKfvm3HX1dqDUTBy8AofJSeNq8SL0CFYvGzKC75uBLdHXApw2RfhhSx
         XB2YzjzepBMBZvhBpI1pQPGX1u0FR9Ay/I8/S9rYmHT1ndXMftFq/U5QIMRmBDAjosX5
         Qt5qLktDewA1I3i0WFcD2fI4UQDcQwHyD4X2aBevxKFDH4Ve/J1775hxBKHQK8RX2HPi
         unMA199ky3nDoS1ETdzhLs7xuvRJjc7DRSJ+yX2NyVjRI1z9IL6QEx4NdCTg6aYUEghn
         CoBA==
X-Gm-Message-State: AOAM533fdTuit/kGbhF4hDiZaHc69DukZn/Rfr06mcc7nz/Msz9dKTIU
	IHnCOyKqVDI+5NrpwH1UOFMzQw==
X-Google-Smtp-Source: ABdhPJze2xpVhRS2YvADrwZ5t2z07QcQ7pjO+EuDJqVX6Oxw8Uzy747DsOh3B4OxKDgctHwtGwZUxg==
X-Received: by 2002:a05:6a00:338e:b0:51b:c452:4210 with SMTP id cm14-20020a056a00338e00b0051bc4524210mr24166501pfb.69.1654529101396;
        Mon, 06 Jun 2022 08:25:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a0a:5e4:e24:c8c4])
        by smtp.gmail.com with ESMTPSA id h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:25:01 -0700 (PDT)
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
Subject: [PATCH v4 7/8] drm/panel: elida-kd35t133: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 23:24:30 +0800
Message-Id: <20220606152431.1889185-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082504_457601_399114A7 
X-CRM114-Status: GOOD (  12.70  )
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
