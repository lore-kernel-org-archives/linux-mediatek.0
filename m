Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5320C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 21:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmlX2BxVlbBMM/7zE7Hh0e6TUuNt6phr2VX7szPGLoA=; b=j74g4Aj+La7bcX
	tHq9beZgai8mVoGy91egVIz2zf31wkcK+4p5yPms+cbPr/AHOBZr3fzW3PbGehC1Iln6oAIMnSeQA
	1ucOBFC9ce1iSwSB4Oya2p5I4+0uwuJ75AsN1tYNLXT1XPBHvPmCafhBYhXI0sc+57oqipCb9aM3A
	tsLowDG/rtPJBafM1ldBXyY0w0nX+psLNah1jSMjF4cDjwvdTjOb5IN0r1lJWuzsGsCaz0MnjIKSS
	2jJynczZ7Y2d2jLQu6LZNqcPojAk8Evfo2YNsg6FqadEK1aPgIFxmnHcW+UskeE34SJnee8E4kAtx
	/pklXVvllomQkTNcPLJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5DlA-00FtVI-EM; Wed, 05 Jan 2022 21:23:52 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Dkz-00FtRx-1M
 for linux-mediatek@lists.infradead.org; Wed, 05 Jan 2022 21:23:43 +0000
Received: by mail-qk1-x732.google.com with SMTP id r139so721272qke.9
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Jan 2022 13:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zY0MGgHszlxJMiljmXEEiC1wEzxNY+uDQh+HxW5Uns4=;
 b=cWg7/JPddxtwQJ/HOgH3+oR1fhhnoQiqZH2jvDD93PkRI29IfqGagjO+gqGHJZVHZL
 v858zBw1z4lhms6W8dT4DFgbRNErR6ajZR6b10djp2d2/I0nFi21wGQEL6n4qGadZNoS
 3Lo7j7a8BgtoUBHMLbOI6m/Z2G+dzpcDPSwl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zY0MGgHszlxJMiljmXEEiC1wEzxNY+uDQh+HxW5Uns4=;
 b=JZeUuEAkaNkt9xpLV3TanhH7M/NCZJuKJ+1uY6VXszQLMVVMk8Ynbb90RdDMMMIT0J
 NDDcDlAEMAhYeSpI9ieeRGbjHI17reaTsuY10TCM/KBz2kmlz9uPsdvrw5mm/vRpbLlR
 gpm1MmBYvqpEmY15BL2FlazbsQAUGZC0CWJ0raAkL8NuHBgec3ixm/Kotf3cu+7HRoxB
 mL+O/kc/rxjdoQOGNk20a0hNu/gFJUsGU86xeBosB+PYX1dIg0zICWq0Bo8DWbsvj7IX
 ezW4w4PnALMOnsy+Kxdpt/LrjNH8SvWLQqlJGk8/9p0StAdWJnqPW2aAW2dKlQmSfDb2
 T4vQ==
X-Gm-Message-State: AOAM533YSQk4l6owlQ8ehBSOBihqmDlyjeEvSmmTKH0GNChQ1TEYj5l+
 cIXZDSvm3S8qSJec82kiblO6FtOVmvgwBQ==
X-Google-Smtp-Source: ABdhPJxEyFhumzU211wdXGQ8UbL2PChXeuyZYivpZy17HeB7BR5gVki7gW29chV6s0DnDIezHae+2w==
X-Received: by 2002:a37:a70d:: with SMTP id q13mr3984850qke.84.1641417818960; 
 Wed, 05 Jan 2022 13:23:38 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:e210:d796:8522:dada])
 by smtp.gmail.com with ESMTPSA id w63sm32384108qkd.88.2022.01.05.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:23:38 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: seanpaul@chromium.org, markyacoub@google.com, markyacoub@chromium.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 jason-jh.lin@mediatek.com, tzungbi@google.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/mediatek: Set default value for Panel Orientation
 connector prop.
Date: Wed,  5 Jan 2022 16:23:27 -0500
Message-Id: <20220105212330.2199045-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20211229184420.793234-1-markyacoub@chromium.org>
References: <20211229184420.793234-1-markyacoub@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_132341_117208_2B55D77C 
X-CRM114-Status: GOOD (  15.42  )
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

[Why]
Creating the prop uses UNKNOWN as the initial value, which is not a
supported value if the prop is to be supported.

[How]
Set the panel orientation default value to NORMAL right after creating
the prop if no DSI panel exists.
Panels have their own orientations, and panel orientation can't be
overriden once initialized to a value.

v2:
Move to the latest code where struct mtk_dsi{} has no member 'panel'.
v1:
Set panel orientation only if DSI panel does not exist.

Tested on Jacuzzi(MTK)
Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb00193..9e1d4e297ca48 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -941,8 +941,10 @@ static const struct mipi_dsi_host_ops mtk_dsi_ops = {
 	.transfer = mtk_dsi_host_transfer,
 };
 
-static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
+static int mtk_dsi_encoder_init(struct device *dev, struct drm_device *drm)
 {
+	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_panel *panel;
 	int ret;
 
 	ret = drm_simple_encoder_init(drm, &dsi->encoder,
@@ -967,6 +969,15 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 	}
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel,
+					  &dsi->next_bridge);
+	/* A drm_panel can have its own orientation. If there is no panel, set the
+	 * orientation to NORMAL. */
+	if (ret || !panel) {
+		drm_connector_set_panel_orientation(
+			dsi->connector, DRM_MODE_PANEL_ORIENTATION_NORMAL);
+	}
+
 	return 0;
 
 err_cleanup_encoder:
@@ -976,11 +987,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 
 static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 {
-	int ret;
 	struct drm_device *drm = data;
-	struct mtk_dsi *dsi = dev_get_drvdata(dev);
-
-	ret = mtk_dsi_encoder_init(drm, dsi);
+	int ret = mtk_dsi_encoder_init(dev, drm);
 	if (ret)
 		return ret;
 
-- 
2.34.1.448.ga2b2bfdf31-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
