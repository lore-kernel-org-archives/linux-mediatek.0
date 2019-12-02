Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F47C432C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:35:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E27A220661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:35:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WeMG17Cx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYgunyP2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E27A220661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6l8TCNdp8Fsx6RFAj+Xa4HtUrOhJr9pficY5YLT3IQ=; b=WeMG17Cxvtr5Ss
	CBOfeEE+n5qpr053EZgDHEGL8H9wPU38dWvmf2+nD6LfmMaRyuGp+a5mt9uwoDmU8/r+EXbOBOcCF
	776Eexhj4cYBeqqELcPZ9JqKeX1F6etTyP0X55ypJdkybZl9excJfMoIkm9NR80THTW3WHRgel1G1
	nbQCmw2imja4YI1rWiHqNJkfNeNjvUPe+i+moOEkbMciuQycdZyq2cRqjZhQHhDPghGNQZ5hjjPlF
	rzCC1BxYLHfdtiE0l84gj7hk3vDpWQEDBcwuIllVPytAAYciIyYtrcDm0WVTdxHfHyIQaR2VHiWmX
	z07TMlZc5nh3p9Zy/QIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrU4-0001NV-9I; Mon, 02 Dec 2019 19:35:48 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrRg-0007Xc-K9; Mon, 02 Dec 2019 19:33:25 +0000
Received: by mail-lf1-x141.google.com with SMTP id r15so807070lff.2;
 Mon, 02 Dec 2019 11:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDB+ry94KK7oIL0OpHG93ZpwaWVw2/vv2p+DvmVNoo8=;
 b=kYgunyP2i9Ayet6lMKznMH5w9Pw1O3NwrHR40KkICtQXJ3n05r24HPZlE8IzGRf5a0
 ZG4Tl1j433To0AdI3WsdBWEf3ixsvYYMLiMNuYRUGjVr1ZEoLW9kIXxObCZXvo0LBV3I
 uyYZwhH9eUe9ip5HifF3lUn6zJtOb5aRrpxrz+zHWhri4kqYBP+iEdsJ40go/mhOhemc
 ODCOjP6ah+7Ejf44pkVobctv8DtFUcklLHvQP8JicNshzMziVHkryicGKhTNG/O2wwwl
 ZRBNKeT34tVwDMKtPegTjSWzBNwEQbBzUvZ2JtPBuY5wTFhGtLRrXB0z7FtxsIZFhvkO
 4hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bDB+ry94KK7oIL0OpHG93ZpwaWVw2/vv2p+DvmVNoo8=;
 b=GCzkuGOHmafr1jGtHjCcmwKh7EgvzBp60xP7O9xANEC6rP8PjQcmuqJg2f8xkqO/ID
 9LlZbhs5JFYjoZyibkHTKAV/389mSZcS7G4yGUKQIKDFkhF0aAW5fX3yeV47VdMDHUR7
 N4fs/I9ogrq+/9PgoJIb3VIyYE1wQzGJgUF2Bm4GH2wfb2rhf2ZIBcIUdD2vBjtWhbVz
 4vSXgN2E9M1O1ohfNd41/tV66J0wA8xoLbU9QBFoYCUXvPVCFkF+BphY6NDE6QjykOdD
 ZXjWU3ybuzUuSEQW5Nu//GTcct4RVi5b6ZltxpFrrznujgito4wbup8/8xzKcf2t9K0U
 4ftw==
X-Gm-Message-State: APjAAAUCQ5VaTygpJb3fniyH9YdIkBQ+2WDyOSDbPttQY6/hxwS4kcZf
 WvvVC6R7/VWxTcvtqpn9VBI=
X-Google-Smtp-Source: APXvYqzTYsasNQayRM2nLXydOk+hJmtyoXsoit7N2AFCfkwcqCook4x6ElJIboXFRkeIVoP8hTsVxw==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr427722lfk.67.1575315198474;
 Mon, 02 Dec 2019 11:33:18 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:17 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 07/26] drm/panel: remove get_timings
Date: Mon,  2 Dec 2019 20:32:11 +0100
Message-Id: <20191202193230.21310-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113320_690788_3ADBC693 
X-CRM114-Status: GOOD (  10.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There was no users - so remove it.
The callback was implemented in two drivers - deleted.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 18 ------------------
 drivers/gpu/drm/panel/panel-simple.c        | 18 ------------------
 include/drm/drm_panel.h                     |  9 ---------
 3 files changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index b878930b17e4..3bcba64235c4 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -217,30 +217,12 @@ static int seiko_panel_get_modes(struct drm_panel *panel,
 	return seiko_panel_get_fixed_modes(p, connector);
 }
 
-static int seiko_panel_get_timings(struct drm_panel *panel,
-				    unsigned int num_timings,
-				    struct display_timing *timings)
-{
-	struct seiko_panel *p = to_seiko_panel(panel);
-	unsigned int i;
-
-	if (p->desc->num_timings < num_timings)
-		num_timings = p->desc->num_timings;
-
-	if (timings)
-		for (i = 0; i < num_timings; i++)
-			timings[i] = p->desc->timings[i];
-
-	return p->desc->num_timings;
-}
-
 static const struct drm_panel_funcs seiko_panel_funcs = {
 	.disable = seiko_panel_disable,
 	.unprepare = seiko_panel_unprepare,
 	.prepare = seiko_panel_prepare,
 	.enable = seiko_panel_enable,
 	.get_modes = seiko_panel_get_modes,
-	.get_timings = seiko_panel_get_timings,
 };
 
 static int seiko_panel_probe(struct device *dev,
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d6299fe6d276..e225791a6fb2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -326,30 +326,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	return num;
 }
 
-static int panel_simple_get_timings(struct drm_panel *panel,
-				    unsigned int num_timings,
-				    struct display_timing *timings)
-{
-	struct panel_simple *p = to_panel_simple(panel);
-	unsigned int i;
-
-	if (p->desc->num_timings < num_timings)
-		num_timings = p->desc->num_timings;
-
-	if (timings)
-		for (i = 0; i < num_timings; i++)
-			timings[i] = p->desc->timings[i];
-
-	return p->desc->num_timings;
-}
-
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
 	.prepare = panel_simple_prepare,
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
-	.get_timings = panel_simple_get_timings,
 };
 
 #define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 4fd61cb9eb93..c4e82b9ce586 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -102,15 +102,6 @@ struct drm_panel_funcs {
 	 */
 	int (*get_modes)(struct drm_panel *panel,
 			 struct drm_connector *connector);
-
-	/**
-	 * @get_timings:
-	 *
-	 * Copy display timings into the provided array and return
-	 * the number of display timings available.
-	 */
-	int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
-			   struct display_timing *timings);
 };
 
 /**
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
