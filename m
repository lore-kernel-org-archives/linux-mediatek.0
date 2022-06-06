Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4132AC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMppyXN+hbMbD74RTnUlfnptwoJ5lyxtNEszI3ZtHFQ=; b=xa0gxLo5d0jRkU
	h5Efl7VQI45BQY805EUXJT0iDKpaSRp2yLAt3m3PTF52FG0FJXXcKrrvG3aG6fRpUTXKqOPMezekQ
	KgY3KhDgyKdyxnp9Vyztfbqs0EXaPhBmhKX7h23PLUWLc75HEAdrLfpb4yCr4j02Je5lLghQvPKsw
	cyHZ25vlbs/LB+6Cs3DJAYwCuzqJ3QlPWub/4INGZ5bcb8/AD1XBeRXbx9izG+vrutP9COlnc8QLE
	gae7kfw3a81u1JqtC1Vg5IaH3izKAOozGPJiPYAEmNtjXNusG+Mxm2jVXh4ksRS0OgOv7w4jt38Nh
	LWH5d0TRBQDTSQAGn7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEbW-001mXx-U6; Mon, 06 Jun 2022 15:25:18 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEb0-001mEE-3I
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:24:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id p8so12970604pfh.8
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/04hnBCcV0Pb71XDCLpgktf4L1f1O++fCdArJyAeL3A=;
        b=hvgs/sbSKFZQ23bXVpNvG2e3L5fQtSrJK3kobvZqiQL7AvZNRVYWFjhg8WgisISjVe
         dLXOT07VdQ2XS6nNO95Rr1zbAA7rrlxjJvM8Tr0ZpAaRqKqEtYEBCYc243PiP68vQdDC
         NbvC5YDPj4dIkZ7/lF1Ffu7sOaDHoluH+DNMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/04hnBCcV0Pb71XDCLpgktf4L1f1O++fCdArJyAeL3A=;
        b=4lz5XTv0vPKxqN+FfQvWEHXTTWXVXpznra0ULlmuxZjgIQLARM/tRpizzOS9MHeiDw
         iHccT6luYu8QHUUqlMB9o/+UpYEIO7YxG/VD4IowTPpgTFb8TJ8BTxeNfQ+VWj/tDQes
         wAJ4VTpm6ZQ9xrChpKrwDCUDeaAuTPMsuWLcloE4h/qYF31bTkivj8w2lFxFSNKjzwH+
         Zed4MQGao5C1DgBELuG0PzYYWhLOBZ+rRjN7IVxl8xVJr8jaVukga78vhTd+vbs32SBb
         Eaq6pMV7TmU3zdU8nfQYfS7aRE2tPhRSMTU+yjGkqDD6x2khPnwFnqR/oULMz4rjtbRI
         uVGA==
X-Gm-Message-State: AOAM533uBs5pdntBI+liI9F7on/slBIrqRCz+Vs0cNjrS+iv4DIRGS06
	jo1fjL3ySzE9+7qwPTyNeVwRxw==
X-Google-Smtp-Source: ABdhPJzGQBTkk4Tgh5G1Gbtco9C5KKCDLaj5Jx6RMphpMPy36t68hkzaY9MJ4zflwyG376FemCJ7+g==
X-Received: by 2002:a05:6a00:23ce:b0:50d:823f:981 with SMTP id g14-20020a056a0023ce00b0050d823f0981mr25132792pfc.10.1654529084342;
        Mon, 06 Jun 2022 08:24:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a0a:5e4:e24:c8c4])
        by smtp.gmail.com with ESMTPSA id h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:24:43 -0700 (PDT)
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
Subject: [PATCH v4 2/8] drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 23:24:25 +0800
Message-Id: <20220606152431.1889185-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082446_168436_731B1B29 
X-CRM114-Status: GOOD (  12.53  )
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
