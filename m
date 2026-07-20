Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C807DC44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7zJzFQDZ2ba/zKljTx71fkG4BHmnEG0mOPFGgp16IY=; b=cI1mnejI3L0am6D35dF5suvo/R
	OkhDZ6PVXYyMzSqTcf/IJ5Dah5sMuSEm5YnTjyoE2zZin4fzU5V/1IOAi0VD4iT9SOk9B/UwUzECX
	hm3sRPoFkFI4c+k1ElzdxbaJhPq2DcRZND89CknpCkhDrypanyXG9hT+ea5HIHTLsJck/1Rgsd0IX
	S7yk3XJltQHPLqbAcKGw+dxnj8xT1IywoZaSr6UHoH+JbpNiGq53rnohCkONVt489ybbvognv7X9I
	8s1BigZFbhMbx7xBpMBTe717Kk1VFbAtWMg4sCmzoG2Yxt/srmYXw+oLhI5EP5BdwX/l6zVoEJPaZ
	+7PLGozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq73-00000007E0K-3px6;
	Mon, 20 Jul 2026 15:41:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq71-00000007Dwp-26fZ
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:00 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f785467faso722980f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562057; x=1785166857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7zJzFQDZ2ba/zKljTx71fkG4BHmnEG0mOPFGgp16IY=;
        b=Ww2viWcwbRZH8tFSzu99P38rfuWoPbYtcibCLC4VYPwUS6tSeA15B8CnkM/7Hpjs3x
         3/0Ahjl70K1xfbqT3vlQ/euT5AZvGqpYEsii2up5S/tfwfxS85v+BmAcNG+1ayrZMeXL
         zJegZOv0Vikb8aEthZ1Q9k5VmzQwfTXdmqeCU/XjC1gESEuXzVHjK6thfafHFNEcLLm+
         WqldpMI95oWK1i/g8qruOl0Uf/dKRCKkzJSxh0oJKXPIo+F5M/5/bUz6Ot5nLvvAzbad
         KncZs9BjgMm0tJfsEFJNwpUWynn6JpPwG6t2vSbG/wTkCrZyK37RVZbKg3obpWMQkfWB
         NiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562057; x=1785166857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7zJzFQDZ2ba/zKljTx71fkG4BHmnEG0mOPFGgp16IY=;
        b=Hw24IaeR2Z/25nOuFEjXFXYaT4lI0Sfy7Lcoec16zCFaDBZzZDNI0AEKB28C8ljA3g
         1rGPNNDz4Qus+lyfOsri5aXCiUJuU/aobjV5gUO6DeeJR6nED62JnnSUfArGdILRZ550
         YcVSXZjE0+GGyn/CVhn0XXZ56nXPfr3wNg78YxDn48Pp8MSjN9ScHWqdTTfe0P5I1e4Y
         E+ELkMjV3m05f3ei4zYJP0PO3iTGvcjP+zUSEa2vvlI1ABbcXnA7J/pPWN5ZaZusp7Bs
         dsgHNloerY+DI9JnghiajhBL0UrmvLh9NGw6WUrFje4kXlKCuff6OSNr4BrzC+W3XAds
         by9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqsiDBD97ymbN6NnKMtWsd0TkxzE8gjncieQRRyDNtMMzN2ZeX68QLyPs50O5S/Yh5TnA+ZzCyCFKyeUSE2Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yybin5O9+QkZJ0Kg95MTsSdrQvPWT5tsMcglAEtqTcT8Lqr3QbW
	CF8M6Zoh7k1PlAHA1uXl9x7Yw7/MEWqPk6D9G3ZeqP6tp8BYg1VLnNrM
X-Gm-Gg: AR+sD12TxCd6sKyNNN3XHmYzI7pteu/wjkReZa67geP/yJyZVzrPpQZsNOaEAojZbXR
	c/sDNAYQjrchERIm2JJ+ly02L2UJmKhbn+GwOCxEuSJxYICl6c7sj67jEYmcMnDJEjP+CpiGUmr
	Xccf2dNeMlKxx0QHC3HCwmvxRk7QGepj8781w1vmcDElxpNE3hnYbTqhJ6zRpqjCvVDpOOoexJv
	jvs3h4ush5m9o0WTao75g46ox2b9JCMEiMxYRfEeP8C89UuRrJYfdOktE5cchxKckEVXBjmgx3v
	301bDsCJbnrZksvN5JxxyP4DIz4h9O3hOfDihF7HXjJwRNvX8O+q/tEsmH9uSu0DA2zUSgjUPT/
	wIk7LxzWhifRgoQHqUSbe9tj+Fze6JrQOFqIac6bGUrFu3wIUMQolajdtLefjWvsR4KmAJREh+0
	ScEaYMx8ed5w==
X-Received: by 2002:a5d:6f02:0:b0:47f:7154:ab20 with SMTP id ffacd0b85a97d-47f7154ae17mr8536055f8f.37.1784562057410;
        Mon, 20 Jul 2026 08:40:57 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:40:56 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:35 +0200
Subject: [PATCH v2 03/15] drm/tegra: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-3-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_084059_867520_9AB79246 
X-CRM114-Status: GOOD (  14.28  )
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
 drivers/gpu/drm/tegra/dsi.c | 16 +++++++++++++---
 drivers/gpu/drm/tegra/rgb.c | 15 +++++++++++++--
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index e7fdd8c7ac12..3f818c195e9a 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -20,11 +20,11 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
 #include "drm.h"
@@ -1055,6 +1055,10 @@ tegra_dsi_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_dsi_encoder_helper_funcs = {
 	.disable = tegra_dsi_encoder_disable,
 	.enable = tegra_dsi_encoder_enable,
@@ -1078,8 +1082,14 @@ static int tegra_dsi_init(struct host1x_client *client)
 					 &tegra_dsi_connector_helper_funcs);
 		dsi->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-		drm_simple_encoder_init(drm, &dsi->output.encoder,
-					DRM_MODE_ENCODER_DSI);
+		err = drm_encoder_init(drm, &dsi->output.encoder,
+				       &tegra_dsi_encoder_funcs,
+				       DRM_MODE_ENCODER_DSI, NULL);
+		if (err) {
+			drm_err(drm, "failed to initialize encoder: %d\n", err);
+			return err;
+		}
+
 		drm_encoder_helper_add(&dsi->output.encoder,
 				       &tegra_dsi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index e67fbb2362e6..bc1c93c7554c 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -9,7 +9,8 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_print.h>
 
 #include "drm.h"
 #include "dc.h"
@@ -194,6 +195,10 @@ tegra_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_rgb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 	.disable = tegra_rgb_encoder_disable,
 	.enable = tegra_rgb_encoder_enable,
@@ -305,7 +310,13 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	if (!dc->rgb)
 		return -ENODEV;
 
-	drm_simple_encoder_init(drm, &output->encoder, DRM_MODE_ENCODER_LVDS);
+	err = drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
+	if (err) {
+		drm_err(drm, "failed to initialize encoder: %d\n", err);
+		return err;
+	}
+
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 

-- 
2.54.0


