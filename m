Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530E7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7c6Y15hnPgTVUTF/+wDzhVaU188aLX5BDwN1sL0J8XA=; b=lix8TjLT5H5+UI
	6D+bIAt51P/Ci+HbyaAmh8EuTxFcJjrSA6qgyrCGcMG6m7JqwdNgN5qggPlX+ETJpDU4Uo+0NMQt6
	SEPHuk7BwTMtwu9oH/jTby1bY9Zrb8erIM7i1FRyyWWXMfn26XOAs+ZPzw0/enr5zw1tcmNAdrO4T
	uhno51HJd/AfFiHEMFpMesoqvin3cIMg24uJbzpzbiNOX9FWou8GAnzIa2kVyZzjFCMgAQcA1dPZL
	nvxT70eqYuVUP9C+hxrZ0rExOwrLfa76orIJNGLsfntxCvrqorXUillc3m5DGzPfQlE4zCXY+ULjf
	i17ZLwyJkqJUXPB+Bt5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVHt-0067Ke-Ks; Tue, 07 Jun 2022 09:14:09 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVA9-0063Bb-JH
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 09:06:12 +0000
Received: by mail-pj1-x1030.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so20276052pju.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xYeDQhf6C4qNcR/ypeqIeNKvzW6/RJ1frKBoLaPHIDU=;
        b=e5GUX3w98mXidj6PktAsCCs+1jtyi7CTkOjk4ZtoYHy7DxEANDLibad2GC3quOwOrm
         UVZoqe81WqocOq5NEs/kaeH0rl1kjIlsj08svMQHfMdKvx5CkRYStIBgMRcuCypTHAy0
         URnedot666T8TmTtSlzzLt0YKeJ/9f/LZz9XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xYeDQhf6C4qNcR/ypeqIeNKvzW6/RJ1frKBoLaPHIDU=;
        b=Uxmj0lSps/SbgwozYZKckB2TUwuwWOnY5oj592rrXvfQs6L39p8KG9W3uigFJHMV28
         8OcsFDmoHDz5AtW/ez5DNW7M50jsRgODV7rD52i9xA30L3j4EgXG69ztr7Y6YC7jwncB
         u8chYCMqyWi03W1SvPV6TLJGltlx09t/9+Rsg843wUykpaDntz+ytIXaYRAdZeiipZ4c
         ZL0oI0Q01zo/3eUIDqRos2PnxXWSd2fF11wBU+747I9+FAv11fjmIOx9MkfpZHVPk6BS
         hbP4lghC2Q1tVFqvg/m8aq46ATdFW50NldXrECnWSe9ECuBb8CwLZNx4GyVnX5EUPQt/
         N2Ug==
X-Gm-Message-State: AOAM530z8dlLfcafkAtLF3qi3iiPxWf4nM6W4tO6xg2b6w5vuAWb9Nd5
	Pb5WKfYC3GuM5QPwxNWXLmRtqg==
X-Google-Smtp-Source: ABdhPJzeaeZzletu7cyNw10d23dKyONDwXP2r/qWUVnyVfAreMR1Ry/RctWwZMxAUZbcnT+OV3SZpQ==
X-Received: by 2002:a17:90b:3c4e:b0:1e3:36c8:8496 with SMTP id pm14-20020a17090b3c4e00b001e336c88496mr40678398pjb.82.1654592765731;
        Tue, 07 Jun 2022 02:06:05 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
        by smtp.gmail.com with ESMTPSA id t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:06:05 -0700 (PDT)
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
Subject: [PATCH v5 3/8] drm/panel: panel-edp: Implement .get_orientation callback
Date: Tue,  7 Jun 2022 17:05:44 +0800
Message-Id: <20220607090549.2345795-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_020609_694491_F4C31677 
X-CRM114-Status: GOOD (  13.91  )
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
 drivers/gpu/drm/panel/panel-edp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c96014464355..ee622c1dd532 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -586,7 +586,10 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	else if (!num)
 		dev_warn(p->base.dev, "No display modes\n");
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -609,6 +612,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
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
@@ -637,6 +647,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
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
