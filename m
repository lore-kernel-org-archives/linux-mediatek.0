Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDAEC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 04:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCAyVgYSlIUVbJvdQNK08H31VNhgKGjHTyKjGoMDfIY=; b=kYDyK2EcuqTp9c
	sY7rNdvF4uf7HjHrq1faOrr6o1a1gNPSvkP3+OSGOWSztENIfIDl/KMCzIg4T4CuHacnHhmkgp+Qk
	+J7TQ03wlaXK1+Jbk3Zwo9NmGyCfGZ5436wA3p0kRy5v+7svHFYDQDIaSFox7wr/cy+eL/WNGEaFr
	xJPMoPSIUSgQqqiPjwSkXd/1J/Zlrm61yoRsR+mvZXSLrs3KsVtVZs+CzLcqWuViWSXrNrOGG8GsA
	94m2mkk9n7ao7BNhIQ+v2W5n+z6k17OVf7uXBPKpTs0M0lSLfr7gfTT5xhxxFQn6CzolHN43g86Jv
	am+L1zh/nWsVDQ+BR6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4g2-00Gi6h-1c; Mon, 06 Jun 2022 04:49:18 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4eh-00GhK2-UJ
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 04:47:57 +0000
Received: by mail-pf1-x42b.google.com with SMTP id bo5so11816307pfb.4
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jun 2022 21:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rFqpHuECGLqoarwvqRrQML/2d/T3XwkU1fNzjkmrThY=;
        b=nG1yyOS5j92wx36wFLjCQZuqCI8wBnye/wbubTHe2BewKZzQ9yMf1UIW4GqUrEowLO
         oNioyR4aXi/4ny+ODAKcr8PzVpr6DIY/BPv7GvZ70ptVaGPylbVMca7uastiacbDBQ4f
         ILJTMDta6UTJD0Pb6Sx2xdZNL3cnUMePfPSak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rFqpHuECGLqoarwvqRrQML/2d/T3XwkU1fNzjkmrThY=;
        b=brw5Yv44EZgPErbgaeyjx/DguDRxuhj1dWh/zEkvtIsiT+XZCIoOqvkF3mFhfAAuZr
         LeiLt5tMNMQdsGy88GCkx/beKaRGEncqIX9FnhIrWbsrBsHV93BawHPoaGtHnEfXxhcB
         BPcHHRmPyr7KfDriLcAVY8wm0f98R0Y2aVbZUCNVI7Jjccb+lDtZhpWWwV8DvEZEp4UZ
         vijTPDA8QyVaU8Hat5t7vqCK1gLhHvIsXIq5si4FRk+D1PgHyql/Mmex9B3Udjdjq4PD
         vYcVZcp7SUKD4t5UtB8V3lGUuoRhbdo5/m5nGn77W90Ou82rFLondM5IsrwQNEpjBjtM
         /0gQ==
X-Gm-Message-State: AOAM533UtT7PfOAFdzZomfqMwuk0+4l9BzFUw/htRY5890Z6b0Lh10Zl
	QAoB2psDsvmMGTdUTFl1Scl7zQ==
X-Google-Smtp-Source: ABdhPJzMQinIyRVXtoVcfR4sTm2R3u3+0i2fuXPqOVvQzKi6bI2cScBSpS72MoNigiZHZpLbI2uKdA==
X-Received: by 2002:a05:6a00:23c4:b0:51c:5e8:e8a9 with SMTP id g4-20020a056a0023c400b0051c05e8e8a9mr7064626pfc.62.1654490874687;
        Sun, 05 Jun 2022 21:47:54 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ced3:b110:401b:b32c])
        by smtp.gmail.com with ESMTPSA id t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:47:54 -0700 (PDT)
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
Subject: [PATCH v3 8/8] drm/mediatek: Config orientation property if panel provides it
Date: Mon,  6 Jun 2022 12:47:20 +0800
Message-Id: <20220606044720.945964-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_214756_060372_419BFA17 
X-CRM114-Status: GOOD (  16.75  )
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2->v3: no change.
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
