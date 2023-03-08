Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1A3C742A7
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd0pXPWFNXejSLhEyKT2rFb5IqInkH4mtznmiVegFkA=; b=sIvgYkuZqy+r+Af1TuTu4hrlC0
	V/HiGTf3OZbgttBUuvJrekwssUiu+9bh87rTezt31yn4J4GcbtFdWcE0dsV0LkA9RA3kMOUtBe/o4
	CrcxgdJs8YhwDLULaCCwgoBgdwkx5qlPQCZBpc/ieA+ATBZEmFbuHlnMkUC6lpV+XHdiayVzY6DjI
	5UfQ60/YAgIfj4VFA42A6m5ymnsagz5XcFMcHMATkbfYSnVkPZW4kRhmbmCvoemz6I7EPwuIMMciE
	JarOLGZaxuv/kUMnTsLkF5hSZPJI8HepNbtdNu+xVlGA7Iaozd25+ME5rVpr2k1tUnnaEEC+GmJ+B
	UGRV5/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvoA-005j6H-Oo; Wed, 08 Mar 2023 15:34:26 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvo6-005j3h-LO
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 15:34:25 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id ne1so11299969qvb.9
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 07:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678289659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd0pXPWFNXejSLhEyKT2rFb5IqInkH4mtznmiVegFkA=;
        b=fbtcVf78wm2MkSmtDAJmRhaQh1osCKcowM4XAkX+nCcGF6az0qTlAyto4b3XzMMEX8
         1tWYJB2tGCwuoFs/SKIAAromzTNWKoDnp9kWRseyGcwp3MqEWUqh+tI4bK2RS0vIpbU7
         5nJHnHuuaiLHIKo98wHgib+iOiPcGFwS0xSrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678289659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rd0pXPWFNXejSLhEyKT2rFb5IqInkH4mtznmiVegFkA=;
        b=FHJQVU7yYHbNVX8+AJbSiT4Ym+j6WbGT0Dmz3/Gz0bJAAnOJM5udxmO20bbL3OieHU
         DuelLzM42plvmekagacBbnuBQKxSqQ2AQ8kZ3dChpso2EtVv3kNGNi5cbcQRXAFsGu2r
         D93fuKG4QGlNSOUsb0ZlC78A4IbHCXVskkBNsL10MtUF5d/v3QjspaZfrGp4+tB4oyjD
         /EJ3ylnA7aorqRY+kjRfbnfdU6AHgNELXKl4I4krsHcLLxfT5gufwJmy9RFrSs+P1yNT
         6WxULFyYNAOHiCP3i+X9NNCt/k2loU/Qjx+JI1ekvJkC1Yuqwn9dOx9VraqIO7NGPMc4
         2Wvg==
X-Gm-Message-State: AO0yUKV+F+otAawJug3l57D7nkXHYJ5Cm9/3S/cyKlvsPq67Gfb5N5Bc
	i83pCzRh4y9djJL16lBpbP/EEWVhRCiP+lx7sLA3AA==
X-Google-Smtp-Source: AK7set+/Yh8U5nfOjnXXD2FUZZsh5QPgFOmkiVgcnLubTQxADoPInKttBVk6EZO8zlHUC1jUa+tgiw==
X-Received: by 2002:a05:6214:493:b0:56e:9986:4fa9 with SMTP id pt19-20020a056214049300b0056e99864fa9mr36817046qvb.7.1678289659298;
        Wed, 08 Mar 2023 07:34:19 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:8752:d0ab:8bcc:f9a8])
        by smtp.gmail.com with ESMTPSA id c134-20020ae9ed8c000000b0073d873df3fesm10506884qkg.30.2023.03.08.07.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 07:34:19 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	greenjustin@chromium.org
Subject: [PATCH v7 RESEND 3/3] drm/mediatek: Enable AR30 and BA30 overlays on MT8195
Date: Wed,  8 Mar 2023 10:33:58 -0500
Message-Id: <20230308153358.333297-4-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230308153358.333297-1-greenjustin@chromium.org>
References: <20230308153358.333297-1-greenjustin@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_073422_756888_A19ABD57 
X-CRM114-Status: GOOD (  10.27  )
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

Tested using "modetest -P" on an MT8195 device.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index a6255e847104..7d26f7055751 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -85,6 +85,22 @@ static const u32 mt8173_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+static const u32 mt8195_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -616,8 +632,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8195_formats,
+	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.supports_clrfmt_ext = true,
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
-- 
2.39.1.456.gfc5497dd1b-goog


