Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B04FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgMrqYbI1qhC/FA6JHi39IRTr8SSL7kK4YhxwrGBk5U=; b=JgYQTYnePdhujO
	msaNg7XdQIxYNEwztMGKFVR27SfICyhhgjJiV4lfQiJth3wJ5AbRM1KsOLV4FkyWrL76+vJsn8xDo
	oKY2cGPgytPj8Y/hlmZHypbSD38Lj4k/JmKfz1DIAYO40FxVc78SYVZNBM+mLi5Iovc2kdE0jDsSj
	nXtKACa5agOiV6lP9mFgXTIQaeBmaBtyqv8lGqNXFJWJdvpiJClhDLWrtDsc75w33iLtzIIXhlSJf
	4fYzP1y4AALJ8Q2V6VxPzhByLHf5csT5uQRhPx/aAnNhbvl2nEnq5OrfcCF331yyf4Gtg4oaZuIam
	qznua8GYZlmwHSnMZ4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJZz-00Eatj-3p; Wed, 01 Jun 2022 08:19:47 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJYw-00EaJ6-Ds
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:18:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id 187so1283161pfu.9
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZXVJXoTliTs9PH6H4bJtRqk079LoRX34taoZ9SWcFs0=;
        b=UExVF+t0yo+CUF2U9NAgRgv1F5D/5gLH7m1BIMgAkp9BcaghU1VJRCg+9tTux1uS7p
         GooLVoefjUwi/Wrx57PtSiJASyS+d4Ci5wz5l5KeokvzcojAPYUOE8G6TY7CFUX1ZfS9
         GLZf2eHTn+ISk0qXAjhx+ohsQOjgmPIjWeWms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZXVJXoTliTs9PH6H4bJtRqk079LoRX34taoZ9SWcFs0=;
        b=gCk9Tzuj1Su9yTUAlOlG83Zxn2vIH961I5LnKk1Fl6GZqDnsu796fBdss42W/zxSNO
         MklAAq5Kw91luZ3IGNV+eNLEWKv2nalkQTtZ3pToq+MId8s7mqCeaCf267Vc+ZX1stDc
         WbYaOsn9rVCxr41IELsBJL3K45+9gpcNmdoWwJwY/Q6XfEup6xoof5q/ZTv7iFZbPJDD
         0gbxNHncoefRfXxfRwRCm8H9pzEmS1t5ZPQVCyrX8a7GJ97KTCjcoXjjlyyvXcCm4y32
         c7M47/lpqbUWab4xZij2kTTtWcycU6/G7v8780X4OPLt8ZadiBDog4TKOXgMAKZVBBik
         7heA==
X-Gm-Message-State: AOAM530vbOL2ChGz1YiVq2N8KQTvQE2xuTyYtgKgz0fb6vmNtZ+YUrTg
	oWwe7fAlLqVgm8IEYY+A9av3mg==
X-Google-Smtp-Source: ABdhPJxQ9eCDaf4dvRJZI6lO8kC3TdeHI0Lqsx36TI7SwrRFIzm9uahMlqRrBMTjw3p/O2lQbj6Fcg==
X-Received: by 2002:a05:6a00:218e:b0:51b:2c21:26f7 with SMTP id h14-20020a056a00218e00b0051b2c2126f7mr19812855pfi.62.1654071522073;
        Wed, 01 Jun 2022 01:18:42 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 01:18:41 -0700 (PDT)
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
Subject: [PATCH 3/8] drm/panel: panel-edp: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 16:18:18 +0800
Message-Id: <20220601081823.1038797-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_011842_551712_AEF8942F 
X-CRM114-Status: GOOD (  12.41  )
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
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 1732b4f56e38..a2133581a72d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -609,6 +609,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
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
@@ -637,6 +644,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
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
