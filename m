Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA264C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJh7TzwLz7ljMlUoSvMHOYdaSoqmFYlJjZi7Fr9oDB4=; b=tKnAFe/rKGYDP8
	5KwV81DmH6eoOJ7hcHu11KDuT4a2KDnign+sseFXnppKgTkutBBhtctkJGcrNTYchR7kmVQ9D+hpx
	5u4iUyyuWvWrpMP6up941ENBxrA2SJaejtASiHyuELa3AzDen7SUcx5XE0999WWCg1EE4JBSlC9J6
	+yy2hzHzP1MiIN1llfR3ddCkWPEM89grFZlBXHbELdMj2eU4eJ0sG30PvAXWR1OsC1TDVrg/rVRRp
	ZvvnwiC9YCU/lsmvae4JbanC+y5QZs6ohd95vRK11PIi4Ymdftc65Yia4nj3/4y0z0q0b4ZnyO+Dg
	7W/xtj51tjJjJ9EN6Akg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEbr-001mkE-PU; Mon, 06 Jun 2022 15:25:39 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEb4-001mG6-Pu
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:24:52 +0000
Received: by mail-pj1-x102b.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso12863207pjg.0
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NhoEcPNDHmfOm0zH51yFx0TR/S9SyI37TTBudlPfFt8=;
        b=bLmVV9G8nxZ0DbEYeB04GCYrVF2yXJrTwxLlXkwIBhzX21qKiBs6l8Dwx7L84vs3+B
         twAgdvwouWoMicxROrFcPiYDyKUdr556My/cs1kZ3Wg12HmivoQ1fmW6YwiVviprIKCC
         SbKLVBBE9VUMN6dWFdzXWoIC8MuBLA5+G1v8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NhoEcPNDHmfOm0zH51yFx0TR/S9SyI37TTBudlPfFt8=;
        b=Ir3nkrxQju01uXc7l1g/BhflHqwvPzAXKwtBlqBVy2SfsHmXA15AR/NX/DNo1jYkSZ
         YvlsWCTNLjLASYPdPGcP8DzAGYiNpZShRCA0kB7hbelHcwOr/3NdUbXwkd11+BbNUaoL
         SKZ8dc8HTbHcsqLBER0aOQil6cbTJpdNCM8NkyFhoETUPiARXri6nBqqTiJuoZGqiBN4
         0Hi4jSg+bD49RlbA9Agc+QTY0/1mnykXTOtKWWtCY0ikWk25HIyKopkpkTTbmFDzYAoS
         w/BFQ5s6ID0G/Af8Aq2Te3DUftR5tFSNdAMwVt7UjXw+eih4gtBSn7i7U3AZECiaDaRF
         XtMg==
X-Gm-Message-State: AOAM5327OUSimt+s6ApJwOjxZAk/aM2lUru+lp5c1a0I56MkF+/yw5go
	jfQCcJwKLZvnf70e2SRCfNjCIA==
X-Google-Smtp-Source: ABdhPJxPYz+Q+mHzIjxIOF/yZTOqS5+EjnzCHFxRtrzlos9dAuMVZ1mQE6TR5g/A7yPEiSYYDrsMmQ==
X-Received: by 2002:a17:902:7781:b0:161:c85a:8fff with SMTP id o1-20020a170902778100b00161c85a8fffmr24699866pll.97.1654529087820;
        Mon, 06 Jun 2022 08:24:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a0a:5e4:e24:c8c4])
        by smtp.gmail.com with ESMTPSA id h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:24:47 -0700 (PDT)
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
Subject: [PATCH v4 3/8] drm/panel: panel-edp: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 23:24:26 +0800
Message-Id: <20220606152431.1889185-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082450_899229_6B764215 
X-CRM114-Status: GOOD (  14.57  )
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
 drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c96014464355..c0a43bc7d24a 100644
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
