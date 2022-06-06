Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FF0CCA47F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 04:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uo7ehh7LNJ1jK4XROoYtyHdYBgU24zrS+edlhhKN+8=; b=YhOUodSQ3sKD4X
	CKnXJ9MHg3GN2G+ShBdJ4cBZFyQkapk/gctNS9TjrM7m/NEkn2QRU8ZIoS6tDxSCKlgo1IA+Ovv0u
	bvtPCVgue2YmYN7o9O27Xkyp3heqBcteN9ch0moTPH9VxohMX3Y2G6DupCJIkJ0Ic/I/d/wQsrhd3
	UQuTh1hki9geWI0Xzxdzso34y/tZZ1OE6Z67xtS5EJ+2WnYGis643qu6aq6gnRdAGTDpllHG0Hybg
	2oM0VupZZj6+48RSgQ9Z3mODHXF24OOxbFVkW0If6wMLwPOVhyItDo62/notKS+Hc693/UCKLqPPK
	14+njOGfe/mzsb1k3T9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4fc-00GhrH-Ok; Mon, 06 Jun 2022 04:48:52 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4ea-00GhFr-UE
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 04:47:50 +0000
Received: by mail-pj1-x102d.google.com with SMTP id cx11so11891789pjb.1
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jun 2022 21:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OBG3ddtj+ZgIQfqLNbcmwFIyPm4EVBcaHeaGb5pT53Q=;
        b=YTN/yrUXNy7AmhJsYdMLLEXrXzJNpCpiojsuW+/5T6R8odawYfdjXEzZ+B7EFnw/W6
         vYpDD9rzbiFP9XqgXZteF3gEyBPpL6GV8oBttP2HW053YVX1vnDQASxMTW9EXSt4MaCX
         dydxq0zVhK/pKtHCsXczIiTtwm7cPPHuSBmBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OBG3ddtj+ZgIQfqLNbcmwFIyPm4EVBcaHeaGb5pT53Q=;
        b=HK79gBQEqH6J3NT5pkGU9L/IdRDGK7jfxE4SNwjciqTx4ZpEIRb/Ne1LfNRJygeucF
         3fxGggnCvsnDti92atv47P89Q9YfBuRJfgT3zRhOZMMxC+SZi2Q2zVES4XZvkayY3UBf
         0UNzYXX9Idr55fE0jD8XYTnzBKihM5YtxC8jtHX5NIeBRC/F0i/32tTt85Xy5VmceZ0B
         RS+Ljbm2vN1VIG7cJ6aary2p1HfY8IQ/Sb0Gv7ZHU5KJZ+llM92pIoRYZXHyc7Ru4y68
         PTcM3dtvk9fG138+gI/rjGHFaXc7HrKaq5nVcrdsURvnf34BPuRRf3XNSspPttMJUoG5
         eHjg==
X-Gm-Message-State: AOAM533elSahM4Vxgi8WBeWpv5yTKDWjaNXDXJN8q0CXDd/RKznLSwq2
	5EVKV6ABvSvB65o6QgdHE3XP2g==
X-Google-Smtp-Source: ABdhPJy0cD/wB0NQeYXWO8VZhTzsLbFYO/xjtJmuOarvo+HHpEF1EMPNpX5LHTHmFds8OdivJ/CaRg==
X-Received: by 2002:a17:90b:1e01:b0:1e3:1f4c:dd71 with SMTP id pg1-20020a17090b1e0100b001e31f4cdd71mr24916639pjb.168.1654490867923;
        Sun, 05 Jun 2022 21:47:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ced3:b110:401b:b32c])
        by smtp.gmail.com with ESMTPSA id t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:47:47 -0700 (PDT)
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
Subject: [PATCH v3 6/8] drm/panel: ili9881c: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 12:47:18 +0800
Message-Id: <20220606044720.945964-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_214749_042895_96465C69 
X-CRM114-Status: GOOD (  12.87  )
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
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ba30d11547ad..c098a0ed6be7 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -853,17 +853,31 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation ili9881c_get_orientation(struct drm_panel *panel)
+{
+       struct ili9881c *ctx = panel_to_ili9881c(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs ili9881c_funcs = {
 	.prepare	= ili9881c_prepare,
 	.unprepare	= ili9881c_unprepare,
 	.enable		= ili9881c_enable,
 	.disable	= ili9881c_disable,
 	.get_modes	= ili9881c_get_modes,
+	.get_orientation = ili9881c_get_orientation,
 };
 
 static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
