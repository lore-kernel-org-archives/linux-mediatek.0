Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD03C44521
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=; b=lAytqazygs2yWl6HmDOOr+Hu1+
	yIpnnI2GMSmKxDI1qLVFIWh6ubr33G05SjYLbmONwiUQ+Tp7zarXLjZ/DIGpua/K0xmYeCcUr3GkV
	nMqy5awG1vzhgsCIVy9Op7tjFlrvrtetKVfQSDbo0LJxsSAu2hhvNsP6Oh/2QTObpfaEHPP0s0arx
	nAQ4GXQ7/oYkooZvT5mpmZ9glWj2YnYEYcoLELSMABTUbgXd4ykNY/j3wkrwULvqDxgOFbKlqGtk5
	Q+f0mKXP4fKHmGKoZA6TVV/396r9/NomfhiNiA9r5d/kPYp5NjYYSF2qWDhxRBnRBtafXYOyxupNH
	HEJehbNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEa8-00000004c5s-09Rg;
	Sat, 18 Jul 2026 23:36:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEa4-00000004bzu-2xDJ
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso13190275e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Jul 2026 16:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417787; x=1785022587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=;
        b=hHGkh3H4Y3eLv+bePcEodfyPRSBuoSu4Nkt+zo/81MMYkLqYvvwJ6fzO9A2hn8qKAr
         RacOZaJP5ojj7rKxpbAqtJ6xZSdbzSuh+u20JvIJaok+HokP4Eo4J45PMKg4ShBn3imT
         iPxz0Y0+GcXrlyg36yLSARrCHIv0vhG/nzWFB2yNTwlD/fQelbPoNVw72+/RL8Kgu3yo
         6qV/t0e8VKlBodRmzjvGxJEutUnO6/OOC+4wFjWbf/gdJKPUX4a0zxr1KEYelHkTui7k
         U/Q0uWnP1mSQ0NVBwmp5Lat6scQjL+g7IomMKFWtjT1kolYDy70OOE+HlE9IoUmQRUKU
         LRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417787; x=1785022587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=;
        b=hwxYF7y/05dgr6H+/QgsUJ6M3Vjelw09eUYmp25JuohFWat52VAp4fkQG4064tfPAY
         uUEoIYUhC3o1CSV1FgYndOMiFcA4jAu/4CgKNSEFZ+q9qJ6m8GecLihxelzIU4sPZ2lz
         nJiWfJ1Fil2b+08b5NRMZQDCR8f0fkkC3I025+unHOE0STeOMJw3RM35/A/gB+IrrDoU
         qV7YQ/JCpJeX36yIgqcgICG0hFrlDMqPYL+jvR986fUU9ZCp8FU6lrpJw1a6S+KpHM6p
         p+BQQRR2t9sVeQaioIIQ29Kok9eaKciv/QET1PsZrtZCIa35dc2Vd8sCofEcxvGr4Gj/
         sKUA==
X-Forwarded-Encrypted: i=1; AHgh+RpBN8SlKY+2PGxoQ5XR4D5S1BJ8AxGxPbbPjfT19x8q6paxVMPt3eSAtCrAhWVirsDwXsbuWCq4hXk2/pZ82w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDlKgk2O+uX1d5A0Nd3HRQYM5tBmDTHLHuJAQux36wfCjrHhVW
	Yv+yIzAxmdQYOjrk3caMsjvqlSqejZWybIK7U8AUR2brRW14Ap0IOz1f
X-Gm-Gg: AfdE7cm+X4132IB5SkxJEhbKt7mDinpZiUkWI8M3MIBTApQSk1p0+91H6eSmBShYj1b
	bc4S7FJDFmVy4tP/VO1rmP2QtVMqKqeCm6m+VT9Jp2gdKn6vuU+11LrLf6wqbFpCvLjLWl33oNN
	ucaLY/z7BD22g9CXbaO1jMgSyt6yZozt1wQEum+Fek4Jqhub4QK9THECZDMA+WeWSJ46vUg5dag
	4RGY/6yPB0r0OGclogkOJhhsunAj8wMvYytsw+hmov8XbTrfgZfXOQHF+zNoIDh0zVTIFT5vOAT
	CO16E2mLuI+q/VMBbfVybyw9X9lFNybPbdXig4AE5vH7+pbG43nVkUNEpr7tMTOQbUdCNNt9Arl
	peh8rO6bJ6wlvOC7PlVlnV0/Y3hULUcqsuXunrn3JKBoNKMgDiS9FX0l8HQOZaj1Gqqc62Y4Ib8
	lWcyHTroBtg5qLbVAAaLSh
X-Received: by 2002:a05:600c:a42:b0:493:e983:806e with SMTP id 5b1f17b1804b1-4954a3ee98emr95800615e9.3.1784417786829;
        Sat, 18 Jul 2026 16:36:26 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:26 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:39 +0200
Subject: [PATCH 08/15] drm/imx: remove dependency on DRM simple helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-8-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_163628_822107_711DBD2C 
X-CRM114-Status: GOOD (  12.37  )
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

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/imx/dc/dc-kms.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-kms.c b/drivers/gpu/drm/imx/dc/dc-kms.c
index 0f8cfaf4c4d1..a9adcfc68b84 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.c
+++ b/drivers/gpu/drm/imx/dc/dc-kms.c
@@ -17,7 +17,6 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "dc-de.h"
@@ -30,6 +29,10 @@ static const struct drm_mode_config_funcs dc_drm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+static const struct drm_encoder_funcs dc_kms_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
 					int crtc_index)
 {
@@ -55,7 +58,8 @@ static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
 	}
 
 	encoder = &dc_drm->encoder[crtc_index];
-	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(drm, encoder, &dc_kms_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret) {
 		dev_err(dev, "failed to initialize encoder for CRTC%u: %d\n",
 			crtc->index, ret);

-- 
2.54.0


