Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCC4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 04:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1H5hGSv7yygWigmRGGvJ1+ImKSHygsk2GuzLjx+LZaw=; b=GivGmrAlabD2xQ
	jo48Sp2iZTNArRZHF+SJzBLtqf+1dxqAQkXzGF79PVqI56+YOHS4bBQOZQRUPwn5Hg1JaKKcD5vct
	vuUaJD774skyUsdhDazgtMmApTh4X4BS5PGHms8kaB4trhvzGU+kfdhSTdNyF/y80X5VObBLf1jkx
	Lc5KPt78LoH7ao7v5f8IDf7x5xkUZYEcVDmljSil9f2h7217kL5pM56WOrjiCqFGwoNCsXEltPNFI
	hWtsjxs5p6mHQv3/bkRN0r/y0z7nTgNmihPSF5KfcADOR+bP5+1KWHAcFJxlCDU29/oX3CpKedClO
	GfM3+Vv96Fhtr/dOIjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4f1-00GhVl-8d; Mon, 06 Jun 2022 04:48:15 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4eU-00GhCz-4a
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 04:47:43 +0000
Received: by mail-pf1-x434.google.com with SMTP id p8so11811083pfh.8
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jun 2022 21:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jJ29kS9c54d0XZMXg/mI13/u5APCZGzRFuqJAJLTaSY=;
        b=Kx8+twWhs/MPzSGyOLbfniqa2/hFoAzxdS5zJtPY3HxAawuRcw8KkL4mgSmRFD6xAy
         TLCEAO9autEMesNlLsqrz0eEEQehlWzf4CMj7ow9KfICb0QKPZKvjj9jjU0uLAN+BCde
         ZWUMw6pzqRfkezTfLlpU8gnUUiZhoVvmX6dWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jJ29kS9c54d0XZMXg/mI13/u5APCZGzRFuqJAJLTaSY=;
        b=GzmgXKSoHK6ZQ6hntVmhiaIEpR8+0VNBeJ8nyZ4x9XBfUAGEMv8kal5B9AO9qJeYrm
         JPt3u/guyFD0xE3/3tG7wKBwF+rngi2xrJ6f/2cCT2i6CJNlT79K0Ie78l+2fviGAfu+
         jFNJcWL2iMEiFkwX8X6rPpz6AsfU18Qyu7nAdd1dSrF3xFEUdK+emJQcIf0UoxXwJXUF
         ACe07JEw7S8HTzLKrUQbXnKqRJ+tCWZq9FExmUqbfyxwRh6I5WOOc82v07ICJ+3t18Jc
         dkVS1hYvNpaF1jzxlzN5IAqFf5wp+jBSvXDUhRUUBXTCjLVLDjgyY2tSUTh7dEGWORRr
         8wZg==
X-Gm-Message-State: AOAM530D1++/sABJmPIqq7plV5B5QePDfc/dW8plb2qok9OMuJkzSu7P
	kIY5gErWdCeHi0+MR9MnFnnShA==
X-Google-Smtp-Source: ABdhPJxboXw4784UYCoUHqaFDgjTzJl4vu2MwUNiNzP8AEvIWZFJ27MkePTqp5g456Y0NeSDSc3yvg==
X-Received: by 2002:a62:e116:0:b0:51b:c452:47e6 with SMTP id q22-20020a62e116000000b0051bc45247e6mr21890310pfh.25.1654490861026;
        Sun, 05 Jun 2022 21:47:41 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ced3:b110:401b:b32c])
        by smtp.gmail.com with ESMTPSA id t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:47:40 -0700 (PDT)
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
Subject: [PATCH v3 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 12:47:16 +0800
Message-Id: <20220606044720.945964-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_214742_228528_967E4EB0 
X-CRM114-Status: GOOD (  12.82  )
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
 drivers/gpu/drm/panel/panel-lvds.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 27a1c9923b09..239527409b00 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -102,15 +102,29 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	connector->display_info.bus_flags = lvds->data_mirror
 					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
 					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
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
