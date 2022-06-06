Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4BDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gA7ZexWBFeQzG4jkIbIWJ+fzmLZmOMUH7LryMIVlOLY=; b=wmX+nQwg1VOgTQ
	cCeR+Dbr4QAp62/Vh6Q7Lj/qdTB9LlaAEfgO48vD+X13LXtmw/kiyxg//fYdHMmlFydmS1PTfHaT3
	KuDiSQXKGlANd/hGkENB/j1lIhIC+2F9iWXfYshvSO2XxswyUgf7J9kP5iKmxOqLFPOQJEGfB3pxP
	KS4bAHe1boAIlgcNkGOoF4VsKPQSN3n6mzX7bumNQh2wnAvzmX3V3RwdA72CapskuU2jn574YSwa7
	FXSaS3tYulBuOVFHOXq+US+zjsQ32Iy2c0xuO98BM/FlU5jkHwgveQQ03zq01fFM5O9Vo72GBmJkW
	qp1tgM1AiKlD+MyssoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEd9-001nba-PN; Mon, 06 Jun 2022 15:26:59 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEbC-001mBS-Dr
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:25:00 +0000
Received: by mail-pj1-x102d.google.com with SMTP id cx11so13092094pjb.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YL/lrHRCDaMsktsmCvu5YRB9LM1inDC2pOHgWJCndXw=;
        b=D1Z5KQS2HSLEvMtB2j3LAhR5NcmnjnaRakAOctNY/fTtjy6NJh9M/naWqqKJFMw1aD
         ftJxyHyWX2BaMF+GgrZvKktG7a0W4ygHBP4JLSRdjeUYzuH55ulRLZwJWhNBOqXdleCC
         u4gEGUizOSUZZfXcgjF2AXmGtp2hBT5JWMOXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YL/lrHRCDaMsktsmCvu5YRB9LM1inDC2pOHgWJCndXw=;
        b=1rUBpkDSmLKmIqbUrBZm8hUStYnNoCdSN03nn1jEcjV6Uy/weB9nyaE9RZe2JpcKnH
         m0WbMeYJX0vJRHQMmySXxVm7LM1101By+ntfdGJo8pwawuC+evzy3udki4HQnJp0ArTm
         02+A6FMmMkUl11a+mQMzF+XGl90jrPCYthWhgV2cnmJsRRXkXPhuojG0Tsbg6NzZNSep
         DSav85ORg3L8MguCeWDoKJbVzNn64EpzUUq77f2I7+tU8DjwhrkxaszVgL58FZ7E5+0P
         wdIykg6g9Y7uY6m8PSMQEM435yZ8xQKse3bvHTKYCBGYt2Cz3EP+SuXrE0/vaUeLg8mb
         hI+Q==
X-Gm-Message-State: AOAM533eM2JwI4hPKJ9nGjIlmK2qGgWEZhySCzjKv3bMnacBthXM/Mb+
	UCEiROJUepKT2hB1cOrNqDM39g==
X-Google-Smtp-Source: ABdhPJxjbZpEemJMQlqSYXCJpgXeUA7eJzzobDUSHMTnQ1O4rJ9DQ16x3dGz7G127Y3Adt9gtA60bQ==
X-Received: by 2002:a17:90a:930b:b0:1d5:684b:8e13 with SMTP id p11-20020a17090a930b00b001d5684b8e13mr27078340pjo.153.1654529098014;
        Mon, 06 Jun 2022 08:24:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a0a:5e4:e24:c8c4])
        by smtp.gmail.com with ESMTPSA id h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:24:57 -0700 (PDT)
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
Subject: [PATCH v4 6/8] drm/panel: ili9881c: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 23:24:29 +0800
Message-Id: <20220606152431.1889185-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082458_484383_16DD8245 
X-CRM114-Status: GOOD (  12.83  )
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
