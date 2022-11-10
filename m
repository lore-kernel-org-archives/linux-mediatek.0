Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582B2C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 18:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cljhpp/VlDLcEVefT+kbc4kwwtaLkI+8qYwF7PdRUXM=; b=GmvZZgwoh3GqCveX3ugC7y5uhl
	fwyDg+/l7jeLAAclXVAWuAm6U3lEVBjeGLAfEiTRsbsFrkVaKJtBulGRl8XtNUKDfV++UdzrAKiYr
	hkXPleuW6YJIPzKgHUv+Do5FDCmItAluJPmzi0wwvhzE2xMWhs8wwkbNOiLOPHsjUFNx04zKHbczA
	St7df+uUDdjowRtlNObGKodRAoLl9bcEmv3boRkmEJH3H4Yj/GxtdREPbdFqwYxC3PgPmAhiIF7wJ
	V6GdMl+VCGfkdmFvBiDdJOdokYzTxq6msvqTzS4WDCvRb0qDu8HIb9k6GNUmcuJdlOmTLwcg7nbZX
	USoTs9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCDp-0086Jp-8n; Thu, 10 Nov 2022 18:24:17 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCDl-0086He-W8
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 18:24:15 +0000
Received: by mail-qt1-x82e.google.com with SMTP id h24so1403375qta.9
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Nov 2022 10:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cljhpp/VlDLcEVefT+kbc4kwwtaLkI+8qYwF7PdRUXM=;
        b=GpWCPf1cycf6Ch31K2Q6u/AJaCOOf+b0CMrlVN2WaJPkSMQyocniK29bVR7NjZH6xi
         OXu7Gav4MZLIAw1P8ATbxNPxYfpaZY0bhpp5NdNle0ZN+AMfbEMUw3BnN0MWXpGUx+s8
         RNe5naDKt6dzFcsrx9mxdrObJXZch/NPuAfcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cljhpp/VlDLcEVefT+kbc4kwwtaLkI+8qYwF7PdRUXM=;
        b=8H4NxynpdAx281AZoEpC2fUOG3y244s2trc0eIX7P59MVDd9tAYGgbvQXxp0yhhVJu
         R0LR3a/D9B6kgkLEmIWhLuD2NG9SXDwz95kqhHf2/KlzOEYeRonku0KT88D2uyiM5sfV
         GtoDCgtrMwz3XmlZX5NlTMu/YgQrx/Oi8yArhwRkCoXDye1tq7BSSFhJCb31cQM9xH/W
         vB+v2YRH6ShDbUfiYXcaumQBlL1H8K4CkI3bB0Vk6K6Dk+4RDRsBF35S4z6QjYB2jXdW
         D6wTZ8B4+k2ZKx9fUR4UlE4mqUA2DfsmNEWu8wIOId5WOY58H8fpuX5o40sH7+oirTRu
         c8cQ==
X-Gm-Message-State: ANoB5pk13/bW8BUrXhiiPaBjx3C8W54Fbrm3E2qjR/nRPx8hpOloycQ9
	nsRj1LrlIbFhJiRo1UGmwxdktHMig53dZg==
X-Google-Smtp-Source: AA0mqf4Of8vLngtSdsgjV/ZJ3PB2ZskScQ8EXTfBrxSKC9jWqoPaDUiAuDXTH6ikQjCgNSuRdmPMCQ==
X-Received: by 2002:a05:622a:14c8:b0:3a5:95dd:6aa0 with SMTP id u8-20020a05622a14c800b003a595dd6aa0mr14913063qtx.673.1668104649466;
        Thu, 10 Nov 2022 10:24:09 -0800 (PST)
Received: from gildekel.nyc.corp.google.com ([2620:0:1003:314:4101:1159:30f8:2e7d])
        by smtp.gmail.com with ESMTPSA id bk40-20020a05620a1a2800b006fa4b111c76sm12677qkb.36.2022.11.10.10.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:24:08 -0800 (PST)
From: Gil Dekel <gildekel@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	seanpaul@chromium.org,
	Gil Dekel <gildekel@chromium.org>
Subject: [PATCH] drm/mediatek: make eDP panel as the first connected connector
Date: Thu, 10 Nov 2022 13:23:25 -0500
Message-Id: <20221110182325.1841369-1-gildekel@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_102414_088792_FAFDBC1D 
X-CRM114-Status: GOOD (  10.77  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some userspace presumes that the first connected connector is the main
display, where it's supposed to display e.g. the login screen. For
laptops, this should be the main panel.

This patch call drm_helper_move_panel_connectors_to_head() after
drm_bridge_connector_init() to make sure eDP stay at head of
connected connector list. This fixes unexpected corruption happen
at eDP panel if eDP is not placed at head of connected connector
list.

Tested by ensuring the internal panels are at the top of the connector
list via modetest -c.

This patch does to mediatek what the following patch
https://www.spinics.net/lists/stable/msg590605.html
did to qualcomm.

Signed-off-by: Gil Dekel <gildekel@chromium.org>
Tested-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 91f58db5915f..76daaf6a0945 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -386,6 +386,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	if (ret)
 		goto put_mutex_dev;
 
+	/*
+	 * Ensure internal panels are at the top of the connector list before
+	 * crtc creation.
+	 */
+	drm_helper_move_panel_connectors_to_head(drm);
+
 	/*
 	 * We currently support two fixed data streams, each optional,
 	 * and each statically assigned to a crtc:
-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics


