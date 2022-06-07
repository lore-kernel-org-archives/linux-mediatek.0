Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591C5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfhSfneBxsGmI/8YGS9CfjgY2qFJcgzKjuQooBD5mig=; b=cyr6jh6loA1vf/
	zN4Qr+Gc9MaWpU2albhiT9fAmj27cbix9cqxiB7yUjT05eEo+2edKZS6URWwNuJ5VEHbFgTF1CgKb
	I+vH5GM4fBB9HiOIQc/RuYGwIYVnw+nN5BZ96Ko9PoB2dsDvQVdjiDGj5rGTGEg0bfea0oHb8emSG
	e77+5lGwAs5QJwDc3g+yY0Hnzn6tbtjjjZ018SDkdg7LtEbaVYO/peJ85c1TLk4Y1nGkbxn1ke2bB
	JK87UZdu9uNGwlOFwEIoerRj2XORn3WojlKmQjiY/7ainQJFXbTRctXX8PHwqg7pf96Fv7xPSogGu
	d66wuY3rFEt1IaytGaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVIz-0067o9-QM; Tue, 07 Jun 2022 09:15:17 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVAI-0063Jq-Jl
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 09:06:19 +0000
Received: by mail-pg1-x531.google.com with SMTP id g186so6400217pgc.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 02:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1HCnyXhOafzmcP69v2HLalUicns4RO/ZQ4qvjS6XyGk=;
        b=ge9Jny+hYIej3cj9ag/91xWa81svwEBV3N/ogFXUBgG8rjD7S/momLJGj/7KfP47Wy
         LYvdSpbngfwMYyTZAwYAiJC5uxG+viVuvfdtirnB7O0giwIJnl+IUWu8X0LiYKRKC6/z
         Lb0aWIcnWIDHNQ4GOq+bVdZ8jjlqGU35La27o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1HCnyXhOafzmcP69v2HLalUicns4RO/ZQ4qvjS6XyGk=;
        b=ZM9FU2uHw4bGdZ2JRV3HGxtMwEf3qPmNMleQSbf7w4T2vR1vjuEvx1LAtBNlGEficP
         aFm+6Cj7a0hKy4lJGeaUMKFWW9uNthnB/X1Uwbui/8CfzZ1xr9EXEO3I5iFnM4GCCu0/
         aAyWA2r48xIa7yFyiBQsTJ6vef9TXXzCbp+Q/4DQ/VcHspI3GsMCapjC3W3n7PFTuc67
         GmxDMUomXVCj+d0CnBaNPwclztmGcN0qFlA87roYeKOT/ZvoU/iRSKZYqTivDenKffXy
         KUxJTsP6VGMWc56i1uUU5JV6LAzZEJUND9VH3nGoeRh5sRQm1F21TXkWwEnBpR3VdyKW
         nSlg==
X-Gm-Message-State: AOAM530rlGxcHanV/qGM1SF8qUFOcBJPiFD4V/uDcOFZXCznQRtpR80K
	eHj8sWFsJTClDM4cw2MQVQSCq+M5Il5a2A==
X-Google-Smtp-Source: ABdhPJxKZGd/WWz8p/7xzdQeoeP8D9dga0Yr240VSGPMjirb2qQdTmq6Ah77nkDx9vsM0hVp0VQ0UA==
X-Received: by 2002:a05:6a00:1a49:b0:51b:8e5d:424b with SMTP id h9-20020a056a001a4900b0051b8e5d424bmr28485080pfv.66.1654592776372;
        Tue, 07 Jun 2022 02:06:16 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
        by smtp.gmail.com with ESMTPSA id t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:06:15 -0700 (PDT)
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
Subject: [PATCH v5 6/8] drm/panel: ili9881c: Implement .get_orientation callback
Date: Tue,  7 Jun 2022 17:05:47 +0800
Message-Id: <20220607090549.2345795-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_020618_705080_CE8DC4CF 
X-CRM114-Status: GOOD (  11.58  )
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
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ba30d11547ad..58d6798c25ed 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -853,17 +853,29 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
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
