Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F828C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 11:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ytxKsU5Im5E51qQ3Rb/fzkrV3hSdUjbZt8kMO28WFDI=; b=ghPKGJ6zpLXoMj
	iElrFljPt/6rAo9FrK0VPgIpWAJBXd9uguNhWdrwlgfJZOPPmw3wfx0cjpX4SwC22l7JC4o86CV2n
	ZueY/46CsW5u0JJhbJohiI+M9MQcgHHFvV3zfL6bgE+n06g7wCyrFPF3Nag8yjtJyDrcA2c9LJVw3
	CzkQlr/h3YPPS7cm8Ka5J/wM+4RjpTqEYgvEQ8K3G1n7gmwXYRUx7YIvAqXPISqXauml9VDgEETw7
	nTUfd6cBDkZJ6Fdhpuv9zgBC0W8ADvTip2MtP6VkHFlNLKrY0gItz6SuAOlg6C3m0pSOKKdWIZwRd
	iFQjh2LVUCdIU8jIUXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdbp-006LfB-Gp; Mon, 30 May 2022 11:30:53 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdbd-006LYn-Ge
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 11:30:43 +0000
Received: by mail-pj1-x1034.google.com with SMTP id e24so2048338pjt.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1LR1Tu5dH4Zqx/bEdD15yjr+iCH9O5A3630Rxdr7ufM=;
        b=iq8hfF07jpOTw9vnza7dhu2R3VgXuYuWFbQJXvXUywAg2a7FwiOA9DZqik/AY+Iw9c
         dc/xqzKTnSpkG4Gh/1+wb2Uql6MKGJ0DAAuxrH9DZ4Da2i1MSSRBR+OHp1JrCV9OcEq4
         Ow/85pl2hxvu+EJ2Ie5FMtST8Go1YBa+6Npvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1LR1Tu5dH4Zqx/bEdD15yjr+iCH9O5A3630Rxdr7ufM=;
        b=wnzf4S9lMQOwKegJsADMtPRRkAERJCOPYWwwT+oZh+r8epE0MP5fPJRMbim3vwgsx4
         X4BcQxCou/h6CsllVnz+6q37H8lDHVS8Kd8sU1vMJgototniWFrSDzED0U9/y/wIh7yO
         IZyYI0NuS+AyI3cDa7UwsScRQJ08vDxnZqWH9QLp0FgmBJLgyFuag/gfRwbgdtndsAyQ
         BoBr6Bd8eXtj6QBxjBgIOVuyDT7wLoDF+nl3jFAC7ykZ/wFApFEc1u8vhmLpEMCObDvh
         CmueV3TH+MW9ABXnD8HOxUjaMOOvdFXgDHT4dNcyTqd6l6fEix0tEnWr8utOGzbKiunM
         Gyqw==
X-Gm-Message-State: AOAM531nvM8hqQVgRwoIHpqU2crM2W/xLIwaqdQcF8BOwOuwoyTB+iqW
	ouuuu0MOq5Yxz7LNphS4Tlzx6g==
X-Google-Smtp-Source: ABdhPJyNeD8LmDCsvC/XVQPkRq4HOHV0lgFLmaOFAz25EFxhZMA8/4iMeqygIHLdjPqRtFlwHfwzuQ==
X-Received: by 2002:a17:902:b688:b0:162:3124:cde2 with SMTP id c8-20020a170902b68800b001623124cde2mr36157868pls.166.1653910239861;
        Mon, 30 May 2022 04:30:39 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ae1c:3d63:abec:1097])
        by smtp.gmail.com with ESMTPSA id o3-20020a654583000000b003fa5b550303sm8384222pgq.68.2022.05.30.04.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 04:30:39 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
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
Subject: [PATCH 1/2] drm/mediatek: Config orientation property if panel provides it
Date: Mon, 30 May 2022 19:30:32 +0800
Message-Id: <20220530113033.124072-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_043041_558366_39FBAF88 
X-CRM114-Status: GOOD (  17.31  )
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
This patch is to solve the same problem as [1]
[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d9f10a33e6fa..091107f97ccc 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -198,6 +198,7 @@ struct mtk_dsi {
 
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
+	enum drm_panel_orientation orientation;
 	unsigned int lanes;
 	struct videomode vm;
 	struct mtk_phy_timing phy_timing;
@@ -822,6 +823,10 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	if (dsi->orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
+		drm_connector_set_panel_orientation(dsi->connector, dsi->orientation);
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
@@ -836,6 +841,14 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_panel *panel;
+
+	/* Read panel orientation if existed */
+	dsi->orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
+	if (!ret && panel && panel->dev) {
+		of_drm_get_panel_orientation(panel->dev->of_node, &dsi->orientation);
+	}
 
 	ret = mtk_dsi_encoder_init(drm, dsi);
 	if (ret)
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
