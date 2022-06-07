Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BA2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDX4hMfe/InBolGClrraVgxX8E/dyZSVYCCE5R3M9og=; b=OkAZ9zbvOSAHmQ
	r004yFq06tyCtU00/HWTdSm8FrIpLCAsibkN9RogbaVtv5++Xle9D28QmUJ343e1HWaVfFB67EXaD
	WiYDUr2FOfsJ5AXpD+nnmOvh5gwflQ3TP/x6wM8wY40tgKFJPt36p8W3G6+r+SwP2Qhoxo8dYiwMC
	j2fzx/LS1nfQi3pah83wYYfLbOGk4L0EIaatjMODWI0fG6vbE882VbD34cgOidLOdPxe21SyE2zAQ
	wqDWup9oFj8GdRcjheUP1HQPILnHCGD78gK3OpBCFP6YWLYOaH+3wHSCFfiFOjNRRcs9+9fM8uet4
	TP4e4QcVE4Vu0RdQHABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVK5-0068JA-SG; Tue, 07 Jun 2022 09:16:25 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVAN-00634y-Vg
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 09:06:26 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 129so15287490pgc.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lndmMwy1Xi5onPK/2gR/uuIgcJtx+Xqka0AqhZOCETk=;
        b=nEwqxsOomZ0VyeLUG6ZdtIT5DHvDyUz42wh0TrdWqyIV7DES04zqZT/xTI4m/jl4wJ
         7spZlLhVnaPE9NGehQBm6p/6cay1FPtBmqiYv//gBqWsA0rsYdzGXBPrKChzufa8M3X8
         yHZDSKUIaIuf8HkJxNNZ8scTGDOI7mvF2sKjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lndmMwy1Xi5onPK/2gR/uuIgcJtx+Xqka0AqhZOCETk=;
        b=Qlj8tomM6/PiB9vvkz+ffLIseqMxg2/hKYQsQb4rcHi0uGVsPnW62ZY/nXxZQm2tTD
         L5/RnSijItlbeW41s+XuqGC0ZN0nkOyUiQXD3u4zYCmPm5qicNxjX7f8c5uOlJ/ZBZoD
         FKvs8cjK1w9njSAeAuVMmGqEhzeY8hAaUkiLi0VuL5UKIorVYFH91JwNVE38G5w+K4ys
         ybZyK8oJcArP44kenb4XeWWhpwOIpW1MCAMyfi/k7T1H4Rg4QXhIHklwnGGXc2BOiRL0
         4h+Di96dGc3FnKrZyzVsVSFGQtcoyaEQCu8eZsSmkO+Aqpo9U8EBaf2ac6RIKyAZV7uT
         /vDw==
X-Gm-Message-State: AOAM531CXFI+aUTj6EdJN3Kfm/rHNLZrQGXyv0VGR6c/1QcFjsoQEcTU
	7Q/W0lrdKdOpqjX8EkSVC4dgaQ==
X-Google-Smtp-Source: ABdhPJy9/p/zRGqxgyYDjGPvzOwSsGPu3zYSpJfyIjbAxG5xTl/4JRnWDwLQuIRLjKB4AcijPvphZQ==
X-Received: by 2002:a63:8641:0:b0:3fd:94e8:a650 with SMTP id x62-20020a638641000000b003fd94e8a650mr11053873pgd.367.1654592783556;
        Tue, 07 Jun 2022 02:06:23 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
        by smtp.gmail.com with ESMTPSA id t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:06:23 -0700 (PDT)
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
Subject: [PATCH v5 8/8] drm/mediatek: Config orientation property if panel provides it
Date: Tue,  7 Jun 2022 17:05:49 +0800
Message-Id: <20220607090549.2345795-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_020624_080899_F9B3F9A1 
X-CRM114-Status: GOOD (  17.62  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v4->v5:
- use the new function in v5.
- don't use drm_of_find_panel_or_bridge().
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d9f10a33e6fa..998b1237e193 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -185,6 +185,7 @@ struct mtk_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_panel *panel;
 	struct drm_connector *connector;
 	struct phy *phy;
 
@@ -822,6 +823,10 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	/* Read panel orientation */
+	drm_connector_set_orientation_from_panel(dsi->connector, dsi->panel);
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
@@ -836,6 +841,16 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+	struct device_node *panel_node;
+
+	/* Get panel if existed */
+	panel_node = of_graph_get_remote_node(dev->of_node, 0, 0);
+	if (panel_node) {
+		dsi->panel = of_drm_find_panel(panel_node);
+		if (IS_ERR(dsi->panel))
+			dsi->panel = NULL;
+		of_node_put(panel_node);
+	}
 
 	ret = mtk_dsi_encoder_init(drm, dsi);
 	if (ret)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
