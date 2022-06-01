Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2086AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEpPC0SLdIvIUMBiTAKj0Qe3tSYAtcY0dGmFLzFropA=; b=ipAakhexidVN0q
	g4Ypg/X25BNWfFUB1jcv0GoY+dTsrA347UK9/l4nA/+/H0tBhAQp+TPgnF3ztinMa8PoJUvJlglqR
	3kMD7IyOkocUNT4Lbc5CSlmULa/nBYnXPWyqWWnqPa0p+D0OEH1gZplNwiMejnzK5yEh2kFQP2DEi
	mJYV2jn8WNGGk1h6IZgALRYNzIc3pfyDTesGuRilbPyHaNaarlmaO1o55MQvoU+RkbtTYsmKsFaAl
	DsvKLyOswZVHbL6iuPWA0LuoHM8Mac0xHOh/HlaYXdcPP3y3QKZMynRLRpKublnuCv3QEVdE6x9nu
	4YAaf0iIkDMfiB4tWzXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLGD-00F9Wy-4i; Wed, 01 Jun 2022 10:07:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKwZ-00F1IS-Qf
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:47:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id n8so1316253plh.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kFnswbSxGwrRy/NQADQjmmMBaytsFgRzRtZUq2P5fVw=;
        b=ErjYVzHSMtL2UomTsVi7tibDCfhMwLbxBslThaP44wqh4DHChnKrN++NI5RhSZPYfC
         Gm3RRstEdhV4L3kxlolN40Nsg9TYKbIF6sbCjvLhWMacNHii7EhOCl8zF8PssLNTP/fS
         YGFNj0OxIkbV3RMUocdQHadyiWO87CoS4BxS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kFnswbSxGwrRy/NQADQjmmMBaytsFgRzRtZUq2P5fVw=;
        b=5ApMPm3cvT1gASnA4ZKfrrgMpQnOy2MJfoBi8ZLOW1T7NxfHE2ztmgKeiG7yAJhBXs
         vIhQLjsbJNEI40XYvcQP64WaA0ldgLnx5I8PZQoLi3T6c/D5kEzCTvb6TQSZMxl3STFZ
         j4/9sqgXl9158Kzh6uZwpPH6I2epqC9pBxhEF9BoUeeo0HnU3WkrvwzG8DV5y+ykhSAM
         55N/HIBRfNSBG+FLL6BaMRouDIyz9VCJH+DcEU9GJPbxADnhpl6Y5MMdhEtpM90VA/Zn
         4nz2Ai/1j9830qRCs2Op4DmfYVuQK2YLCD3mgq4qdaw47ylTplDkg90vVM96SQqzbFTs
         ZenA==
X-Gm-Message-State: AOAM530pBYM30oDhXqoKLPwViQnMJ1Y9W+hAIaM6J2bXv20KvNjPpNfp
	Gw54NmgSq8OcItagwXidNm1ayQ==
X-Google-Smtp-Source: ABdhPJxrRTUbKi5bPBa/fX0MOFI2Wb3mwKyCfpA3888E4QDVRu2YuRIzrg8baKhCW1q9srQYrEq3/w==
X-Received: by 2002:a17:902:aa04:b0:163:c204:f41 with SMTP id be4-20020a170902aa0400b00163c2040f41mr17751950plb.172.1654076831401;
        Wed, 01 Jun 2022 02:47:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:47:11 -0700 (PDT)
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
Subject: [PATCH v2 8/8] drm/mediatek: Config orientation property if panel provides it
Date: Wed,  1 Jun 2022 17:46:37 +0800
Message-Id: <20220601094637.1200634-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_024711_949171_494AD3D6 
X-CRM114-Status: GOOD (  17.93  )
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
v1->v2: remove unused checks.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index bd3f5b485085..86613360d2d9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -185,6 +185,7 @@ struct mtk_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_panel *panel;
 	struct drm_connector *connector;
 	struct phy *phy;
 
@@ -822,6 +823,12 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	/* Read panel orientation */
+	if (dsi->panel)
+		drm_connector_set_panel_orientation(dsi->connector,
+				drm_panel_get_orientation(dsi->panel));
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
@@ -837,6 +844,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	/* Get panel if existed */
+	drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
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
