Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46803C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thQDy1uJd6jUlVbBNd48BWmu2e12SiNy83H2ggtLupY=; b=3tJEMLNqRowCg0
	PAZKG692uvsBMqxx06/r0ikGGjVVSIfewsziDHrOSjn0J/HgvugQrtyaOX+DXgoq1FjQ92rA+D0QY
	QH+aUW9xVfNOSxQoqzYMiEF4uefzSqhfF94FyStMMEazYcaJTVgcsPmmyqOBoCYO9xi4aTeefSJeX
	GdysGBIg4aSu6Tkwggu9KtsdMd9FF9dyeCPomP+iwM8qQZpubF83S7kpA2xq6VVAt4gYN1p+MK91Z
	jIvVxCIrVmOj+1E9bnClMHZGwwSk6u0Rj1oNMpqBrk+xFpBXaK5fTakhvobI8BJ83LFtHPirHSmdK
	sQjSvgt0nZrInGOmiMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJcB-00Ec5N-Sb; Wed, 01 Jun 2022 08:22:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJZD-00EaWy-PI
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:19:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id t2so1105592pld.4
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tde+IhIAyMS5phfhjLJ/xUjc9TpTeEZ8Vt0Thw0su/Y=;
        b=AvPaiVerLhPA7bu4ah3qZZGvu6x+scDrnj9QwMVpBGEzH3jZ7jjZctDsthGN2X75vw
         +gqQh9EYZiKEDVg457+bSPZMSAva31GxPBAHUAeqWSP4I5zE+e61zJti+EJ+Q8OnrZ/N
         KigOKjCuq65/FJ5z6+Tj+iW5NfPqCgjMotibk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tde+IhIAyMS5phfhjLJ/xUjc9TpTeEZ8Vt0Thw0su/Y=;
        b=rSHHAuJV12k3G1HjR75geXnOaPK5HqxJuarvDnnMcW32hTZLb8rlYOelaawRX/m/n4
         EG82AN6l/RqXUSzmh5mftK3ygHVkLrAl/DYwIZ8Fag7PR2Drz+aHgWXCMPDzBQ8VVTNk
         SWiuLS8tpVK9FQXxMF2tXHngF6LzrGJBFOUggBpl8SH0aOwtHU5EH5KvZFrdJkYY5KOc
         U4ILUmBnDroZFLsCbt8KjGPf4TCGmKJYKF/owpA56t9pmYTTJ3Vf9Dhf/sqZ9GitOXa1
         2oMzg13R1vrTfIjgXszfts1c6nL/t7XgejhqA4Qz4aTEmrbgrwlZic6So/qEVyz6Hbgd
         QQbg==
X-Gm-Message-State: AOAM532jjF5AbRjdIjVbVE6rU+iwBZlJa/dGJBOwa7mLBQwMHDub6ABU
	rb52gVTOr8A1BQ+cfqAjolfMVg==
X-Google-Smtp-Source: ABdhPJyJZ9Nd5iUhCD6MyJuY2jjn3E+5iA+mGbWJIcSz/UCeJVMvsyFTNMYYQQ2/CExPe30dQ0kFsA==
X-Received: by 2002:a17:90b:1e44:b0:1e2:e772:5f08 with SMTP id pi4-20020a17090b1e4400b001e2e7725f08mr17755299pjb.129.1654071539081;
        Wed, 01 Jun 2022 01:18:59 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 01:18:58 -0700 (PDT)
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
Subject: [PATCH 8/8] drm/mediatek: Config orientation property if panel provides it
Date: Wed,  1 Jun 2022 16:18:23 +0800
Message-Id: <20220601081823.1038797-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_011859_898396_F50C44C2 
X-CRM114-Status: GOOD (  18.86  )
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

Panel orientation property should be set before drm_dev_register().
Mediatek drm driver calls drm_dev_register() in .bind(). However, most
panels sets orientation property relatively late, mostly in .get_modes()
callback, since this is when they are able to get the connector and
binds the orientation property to it, though the value should be known
when the panel is probed.

Let the drm driver check if the remote end point is a panel and if it
contains the orientation property. If it does, set it before
drm_dev_register() is called.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
The concept is the same as the previous version.
https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/
The only difference is, it now uses the panel API instead of parsing
orientation from the driver.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index bd3f5b485085..12836a697f56 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -185,6 +185,7 @@ struct mtk_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_panel *panel;
 	struct drm_connector *connector;
 	struct phy *phy;
 
@@ -822,6 +823,16 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	/* Read panel orientation */
+	if (dsi->panel) {
+		enum drm_panel_orientation orientation;
+
+		orientation = drm_panel_get_orientation(dsi->panel);
+		if (orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
+			drm_connector_set_panel_orientation(dsi->connector, orientation);
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
@@ -837,6 +848,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	/* Get panel if existed */
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
+
 	ret = mtk_dsi_encoder_init(drm, dsi);
 	if (ret)
 		return ret;
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
