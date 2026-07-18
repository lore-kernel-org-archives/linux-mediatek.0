Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A043DC44523
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxJhJqOvpAaSiQeGabxE955gR5KY+0a4asEx/JWs7Lo=; b=2uUD9HvFWRb6N4mUFOv4lVuYg8
	wQnbq9jfw7bGJmr1oVtIhmuXndmKYR45ylZBMrXvikbHYoSHC6IVumZZhVARBiVdGWgHFQyG2mnYS
	7CNgA0+M2gjk/KXGjqZerOCfqvwBXloDx2aICOr+MsqJu6/llDZb2GI2AYm1mCAutgVmxKlpTNIzT
	kIWGvSuT7CqIR/T0ZMUy4QCYl/M0jeH9M1rQisVOlmCVjvrXOtR68BCYJz+Tqnt/MyCsxiv4SLH+l
	VVwewhHowTG0Gl+0ztC8Xlb21LIx6+yUXv8P61tEeTnRY8hn0Dum0Alv56QEJ2K5U9KYzB45qQhHB
	xgHE7KiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEZk-00000004bf0-2Qwb;
	Sat, 18 Jul 2026 23:36:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEZi-00000004bbx-2M7l
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-495590dde14so1120475e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Jul 2026 16:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417765; x=1785022565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxJhJqOvpAaSiQeGabxE955gR5KY+0a4asEx/JWs7Lo=;
        b=JiyJzfwGcbMoGLCbS9VQK9Krlb9tAcJO1xt9u39/577aE1gfEIt8HtPPRg3tRuVGH7
         6eF+XXXtHulWa5h5VkfysZBk/qdR2r23B6gkZsMsslbrsVnstJWQSrPN5X4zya1j5WRo
         G+3wxO0VsfK5c3wqdW7k7gBgbMStDKj/+OpLQwcOfxSKsUqkiVNok2cdbq5gE3Wd60mn
         U1MPz+WXWG4quSaB6lT6iwlnv7tfNAV96wP5p2p6xYp9jOAfjc5no29gc8GoG+naLocD
         qfHU3yhdEdaet6S1Kw7L2FI3CJfuGqEeIpQKKWFTzXjn4DV/RjOnWgJ2u7D9yavea6oA
         xo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417765; x=1785022565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxJhJqOvpAaSiQeGabxE955gR5KY+0a4asEx/JWs7Lo=;
        b=Awxu9onRwSYnEI8a+vah5d96oIRsGZyTxWGR0YJCYnV/JxrQWHCpYt+0GrSuk6Qan4
         ZcQO5a1QAp4zHxdrJW6/rOT2SVrjkv4GZ6M6a/rRhVnZz8PDfC70nTTtxJcVvBDJwGLf
         VShFvUHw8ById+XTT16S69qq9XDC3OJkhjDmfsT5nLDbpXCEbE5uNjCCrezWYQ1ged+K
         Ysb2SRl6BRE9x8M3EQKMz3pDUgKgIaEB3pQjbhuZcDJUtARO411j1nEFRGaYKCByXVfk
         uZ7b/CndjbYuJqyEAVu+Y8F7h8wpbzIxb8h9xmjMJVvGTrxL521V2rexx/xIaWtIL4OX
         6JAA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/UYTKI7PHQ2wkS/dgq3diBJI5vNaNbr7dy99Y6EuYCsAQgow3oBaQKtlQTOF6NJSnzVS4FeEc2iXS93h++A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyW+Bc9pqfqAO8oDama9JsEtTvdF6IUzeNj0Pp54+BQQnqX4gbp
	oiLZNuKeE3pjEiI4FQyQlCc7WVe1b3PSvB0YugCJn8cApKpIZdH3jWKf
X-Gm-Gg: AfdE7cmr2yxGLCYr6Ugn6ggXg+CWug0dwhT5ik0MBHH6ACtDbOpA1D8173Ick7LU3lO
	wfpY1f34v9rEG+0taopAU/Fap+gJlli+G/OEug7oY6ZGDIBshwSDti+TX4IiVSvhumqCG/VnHbG
	qKVusohpyO4cAqE8CRHYVCqFcSqEw3EkvML5fD4drW0OWlHNqStIA33e48hZtu0W3oWcQKBMbDi
	wAfjBZO1+nFaqO7OkSU4lCc9de7z5tTp55p1emZ+EtlCCgixeZOFs828gErOlf9eOaT0SVOas3E
	8cQrUG3xFa9/f2ee/eqrNxbSO0VEX39EY5gLxUxIqfZGjIxske/ya63DR+AUBOknZtIAIGdRHnT
	1UWS/2kWLMGi9z+f5/ZunzHrxI3vc3eGTTWq6a3K0Kt1Wro5o0AEQQyS4F46PqBCXPAtXZWeUES
	+xJgQ9PsY/vA==
X-Received: by 2002:a05:600c:4ec6:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-4954d5c913dmr76289525e9.7.1784417764814;
        Sat, 18 Jul 2026 16:36:04 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:04 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:33 +0200
Subject: [PATCH 02/15] drm/xlnx/zynqmp_dpsub: remove dependency on DRM
 simple helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-2-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163606_640400_9FE2C714 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.
Also check the return value from drm_encoder_init() to avoid silent
failures.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index d5f922450565..1d194c2824e3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -30,7 +30,6 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <linux/clk.h>
@@ -417,6 +416,10 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
 	.minor				= 0,
 };
 
+static const struct drm_encoder_funcs zynqmp_dpsub_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 {
 	struct drm_encoder *encoder = &dpsub->drm->encoder;
@@ -436,7 +439,13 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 
 	/* Create the encoder and attach the bridge. */
 	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->drm->crtc);
-	drm_simple_encoder_init(&dpsub->drm->dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(&dpsub->drm->dev, encoder,
+			       &zynqmp_dpsub_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret) {
+		dev_err(dpsub->dev, "failed to initialize encoder\n");
+		return ret;
+	}
 
 	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);

-- 
2.54.0


