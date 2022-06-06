Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F53C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 04:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aX8Ayk1tlQ56DWixDgk6mj7goitiwMA647MGKT7pkIY=; b=jYK1YnOg4Dzp+U
	z0KuNPesRPKoiCfrYsBiq4cPsQaqTz/Aj0itKSlQlzCvbpDnAFWeceIwvTPRkG2PXSYoyHcq11G5m
	jVZbyr6jA8qkF544nMc9AwzNb1d39SQvRhXDC13yDq3B0PuuahlbGhfUjTiRc7fN3VC+aLXpesfKX
	nEg6Bm5nMuJe0fw2NpbZ5KHnIfdfIKZJyuv6jtP8wmjfNPR04sVCLYGsqF5eO4ufE/Mxfm8rHIbbK
	qDG3jfG5G8/KsVkcUuza8iNu/lTJu9nI2jc7jVwO68WkzD/ComHYh0Iyiu2CZwaXk0W+aMsNqDRqX
	N28neAiJHbgOVI0DAElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4eo-00GhOF-D2; Mon, 06 Jun 2022 04:48:02 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4eN-00Gh9r-AH
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 04:47:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id gd1so11891235pjb.2
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jun 2022 21:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGnDD5r5M3UXCU6BZiTbTzLZsBiSocgUQfxs0cDS1G4=;
        b=l30rCOLic8LaKGIFsKhI6vz67rGgjxbrO3jiCldFNIW8I5OkLf9aDeJzRGh8jMUXQr
         SdCvlbgXiwhwr5/BW2rNXyL5J0Ps9u1DEZr8MjIpgqYLPWpvNzo7Yl+yZKxpXm2JIANR
         IIiMhDTbZV4a5Cc7egdsQqqF+o3IIyQ41+HPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGnDD5r5M3UXCU6BZiTbTzLZsBiSocgUQfxs0cDS1G4=;
        b=Q95Hx8h0YC5zCLqUFVCebqk2rOT+b714zUgtbH0kLBpy0R4pE8Rvdbhiv8zWcrLhe4
         PTpDyF871feg+/C/Qboxqn55wZcDAtXdL9fUG5lN0SnxUfaEZOJpQlj7olg4PmLw+CUH
         NCWuBgGv3v7TETzOiWkHRrxdim0Rke4zfivBQQpyKRRojSRRjYszkRrfGGo6uJI9idUl
         toWm17+R/uY8AR1EA2QWNGY4Io6tRjd6XCJh5Hua9pLapTSvq7DYQiiLVUj7YMHUICnX
         V1rnCkqZYSMvlVyAWdig/FtulbOEjlRWgQFpV0Suj6Frwum9ALvF/JRPIQFJrJ+Q7PJh
         1KAQ==
X-Gm-Message-State: AOAM5308Gi01YDjWWAp+w8aedoN7tVDDxlB3XZWa8ygfG+WTEiJfGA4o
	tfBObjqveVI0WfyZPtnsUyxK9A==
X-Google-Smtp-Source: ABdhPJzbBbErXs2PWbpEsxPCivcXPl2J9WhwCBQUubS9o01KqgtcAIWDGinwPaxoXPioh5PpozS7CA==
X-Received: by 2002:a17:902:c407:b0:163:df01:bbbc with SMTP id k7-20020a170902c40700b00163df01bbbcmr22376780plk.4.1654490854118;
        Sun, 05 Jun 2022 21:47:34 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ced3:b110:401b:b32c])
        by smtp.gmail.com with ESMTPSA id t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:47:33 -0700 (PDT)
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
Subject: [PATCH v3 2/8] drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 12:47:14 +0800
Message-Id: <20220606044720.945964-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_214735_402252_AC9B9D07 
X-CRM114-Status: GOOD (  12.84  )
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
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 1be150ac758f..a9cd07234179 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1511,16 +1511,30 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = boe->desc->size.width_mm;
 	connector->display_info.height_mm = boe->desc->size.height_mm;
 	connector->display_info.bpc = boe->desc->bpc;
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, boe->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation boe_panel_get_orientation(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+
+	return boe->orientation;
+}
+
 static const struct drm_panel_funcs boe_panel_funcs = {
 	.unprepare = boe_panel_unprepare,
 	.prepare = boe_panel_prepare,
 	.enable = boe_panel_enable,
 	.get_modes = boe_panel_get_modes,
+	.get_orientation = boe_panel_get_orientation,
 };
 
 static int boe_panel_add(struct boe_panel *boe)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
