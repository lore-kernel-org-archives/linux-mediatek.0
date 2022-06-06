Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA55BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qMNBycVlp/DeugvHz/SQ4g+vv4hRqK6sJ1eDPfcQ0o=; b=s2RIWc9xuz6sqD
	bxCuwtpRGKTG/uN95Dz8nQWLvRCv9c8MCZckiudDZYQBwvzVVhXpRVSDmWu7qF9NHZY8cMR1MpQ34
	dytP08Dm6epgDC774qroZHc7wGCeb0K6VGXyh9LxseA2hLN/YHcyiIvgDd+0Flw7zTLPEhKPdiX+C
	9OEggDIbX1JPEPnqrrD8N7am8yy6qg/6gDDhmHLq6WQt91Sb6j/LVmvEFo5Gqdc4H+esf5NLZnltU
	LJXz63G/YwSRp7XhxWrXBB3XT4xfViFtACRRNUcuEjoxgimKNmA8CBeNbEfPVwU5D9nuVpHKVChv3
	kdM+iP3/p95ImdE94TAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEd7-001nZs-Eh; Mon, 06 Jun 2022 15:26:57 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEbB-001mKC-JG
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:25:00 +0000
Received: by mail-pj1-x1029.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so18119497pjl.4
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a1lnjY8i/+WS666XDlnuCv9IyvqUonnUraywvJyMjlI=;
        b=Yg7NCIfTyeYWU95xPrJ7gstR8zKeMvxvOcu6rI98w5bCid2+Yxt48QhFQi3SGE0wBW
         eV+CFEsv3wJ7eJHTzBRHd8LxWfOnVWesx12yf+tMymjIcOzkVwUTHC0xtQQnDerV8Sry
         YMcSV4DVWPXO4rBZt5BDf6zsZlk09roWCNyRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a1lnjY8i/+WS666XDlnuCv9IyvqUonnUraywvJyMjlI=;
        b=LdAx4wm10KS3f0lyPjNcfopZ7vLq1NzVNWNO/l2dz/6aHONXLXssLiDuLm+Ix80WHF
         GJJNAGESSV6XAq7X/wSyMRPTzqG4WUiPqoMus7wH3btA8XvkJ89kTEJZsI4H1UAvZgVu
         mVLQUQ4cO/Rv5hKA6FruBr1Kpx49xjqR3ZmhuJH8Bc0rQHXeo1FBZccVXJOWkP87WjL9
         VVa8LZ0KsjKi/YWrV9vmIlKkRhn0x04VIFBUPAKOLp1dNEKt3Y1oVvg205syYbsRyhMW
         yXGNz3/iBtNUt6GEExj42+4I0q5+YpF8MTH7tHg8uryfiC7onCpVxuPQuju8bu2CAqOg
         AUvw==
X-Gm-Message-State: AOAM531UGXtz0YL7h56npnCQaLNZqK2+nZpjyrWFPP9kdT8A7u0qG9t8
	uXFCUbx125fGg+ZRJ0H2tyardA==
X-Google-Smtp-Source: ABdhPJywwp7pRhhliSH9owLMvrc3WOxzZZGXiapJ20kmflDYyQShHfCrO6yi2UNKEJawzzwv33KgGQ==
X-Received: by 2002:a17:902:b581:b0:161:5f37:6688 with SMTP id a1-20020a170902b58100b001615f376688mr24315575pls.145.1654529094611;
        Mon, 06 Jun 2022 08:24:54 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a0a:5e4:e24:c8c4])
        by smtp.gmail.com with ESMTPSA id h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:24:54 -0700 (PDT)
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
Subject: [PATCH v4 5/8] drm/panel: panel-simple: Implement .get_orientation callback
Date: Mon,  6 Jun 2022 23:24:28 +0800
Message-Id: <20220606152431.1889185-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082457_673389_34ED4819 
X-CRM114-Status: GOOD (  14.40  )
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
 drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4a2e580a2f7b..f232b8cf4075 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -411,7 +411,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	/* add hard-coded panel modes */
 	num += panel_simple_get_non_edid_modes(p, connector);
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -434,6 +439,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
+{
+       struct panel_simple *p = to_panel_simple(panel);
+
+       return p->orientation;
+}
+
+
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
@@ -441,6 +454,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
 	.get_timings = panel_simple_get_timings,
+	.get_orientation = panel_simple_get_orientation,
 };
 
 static struct panel_desc panel_dpi;
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
