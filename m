Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FC3C44521
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=; b=Fvh3+W7ciPisrQYsXRcH/vi7MA
	qjYbOENFehCmYMsTFNGMxMgD4kfaSXhTgdNLQT0jLFo1/lCLQ44/OTFLo01fo33plqDGPsman4+HW
	lreYgqjvpshhIqOrB5T3FYjqXD/MM64IrFT0EbY5WAUU+wRej5jRDT3tZAYepMJnhhuJMVyx3ewX6
	0lJCyZK8fwqbk4TC8QYKMCbey9H+QK/eO9J0rkFT6AUXY+/rYQn/V3PddG2AMQY3Y0zQaKhWKvndl
	c1o4X2mmUVl81txFQI62zlxmFsWtrOv1RaKtViq6w+UxWV0nvqzGxI6c0A0l4hlLQWrXeZv7R2pT3
	qcCOG4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEa4-00000004c0e-16fH;
	Sat, 18 Jul 2026 23:36:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEa0-00000004bv3-25z9
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b966dd74so36649415e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Jul 2026 16:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417782; x=1785022582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=emSYkNvhyVQpsVYx999zJOlbp5Xb8RHe6kQ7BK7CaeyZIknASV6xZhYgfwV+c/wgHv
         u3xTcSC8OCWrKbdr8bqclN5OB0Na6ognSE6v8a2/dp2iGe0gwPiYnsd9TTmBYIZ9mFy3
         W67DtDkFQgVZ2LV0csNpvJNdrePTY+6rKCXRLRtG+rwGm+Nk9dxyQB6qvcLi72XT0Q+Q
         gpKcJXFZd0YRWk+ogsNu1reDP4U6FiHF7XYPArUsF6gdRaI/Blv2hfaaBq43W1psDVvI
         Het/P0tXiBwbXCw6tLzHuqwGfq6Z2ZyokwqD00IV+4u0PQvYs2ACWi2Ikc6u8ZxSy0H7
         M0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417782; x=1785022582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=XFalkOXyTtrHYprEk+biyUuInNSdnL1NiNgSZEcba0Ua1kN7QLFTdaeyDp0MHsWube
         QOZKCy/fhvM/+6AkRF+YI51r12gRyDPn8y34Pnu/JF86xFOjVIzWR+pFfRp1G6M7upYW
         HvWMCBlHVL6WsvW181zscFROwhhn4ljUYIwU4KU1nYe7j8MsjXfmpmg5+yRZRzuobHUU
         K24OLX9BD33Q8DUhlLw0CFM2J45N5vznuWs6YFSsdpxp12TGOSth3cdn2PfQ1Y0QtYc1
         JAUgAcm2lS8VIZaopT9uBJRc8Bw3qtC58EK7Le4/ER+SUo6KfYkkgdsxUL6dPqlZ3Tps
         CI5g==
X-Forwarded-Encrypted: i=1; AHgh+Rrd87sf7RgJoRtFNV6euPhlmLQt0BEVAzAyw1LhJOLaL0e+j0F/Y63YiLTQXcOYLLvHRTOXgsEDsN5cBkhGyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/OADomvl5+7ZSa38iEpiy2qmJG9t1BNuNZ7QTIUhyTk9c4Krp
	ZX8OPmN8mXL2xFdR3IprM3dk+Kj0Iw7kS7wTRwgzo+BvKCK5PuapHc7E
X-Gm-Gg: AfdE7cnucl2b1BKATCofXvI7oCgqj5hm/1QxiNIEgCOK+Th9SEPU1vxV8v4+f9vSusb
	uYHYcQwstf+J/R4SlWX5iI39BbEyHNJwA+vp/B/BPm4u5YIq9v42s5F3aT7zHG8CI6PPMSQLjH3
	KrHzMcd5tZxxDkLR/3mQLuXKy52TRLROwL2wJSRvVuvPsRcnkCo12Ip+5Z1iMMI7F5Sjxpy0o77
	3TE14PAB9Cf8NNaBpP51GiVPp6D9Cxp6v3ifo2fEU4+54r6thcfg5flyV1WY7UMpSh3wN5GD5ck
	oEJL5VelCpMd0E+QZltIMBa33vxE70qpvHIwpFUzQBTVTWuqkW6rrcame7tiH7lIM/OitOFa8bq
	3/M7kPUEs0nQcB4PHI4IiFKndgec6k+KNUJDSThGt7SQQPVO8fsr9OXUUNWPPvn7GBT23YBNnEZ
	cvpVrMwzpH8A==
X-Received: by 2002:a05:600c:4746:b0:495:4d07:4fcb with SMTP id 5b1f17b1804b1-4954d0784c6mr79013155e9.36.1784417782504;
        Sat, 18 Jul 2026 16:36:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:21 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:38 +0200
Subject: [PATCH 07/15] drm/tidss: remove dependency on DRM simple helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-7-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163624_604216_41109878 
X-CRM114-Status: GOOD (  12.02  )
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
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 698f8d964ca0..10dbcc6cdf6a 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -9,11 +9,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
@@ -81,6 +81,10 @@ static const struct drm_bridge_funcs tidss_bridge_funcs = {
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 };
 
+static const struct drm_encoder_funcs tidss_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int tidss_encoder_create(struct tidss_device *tidss,
 			 struct drm_bridge *next_bridge,
 			 u32 encoder_type, u32 possible_crtcs)
@@ -95,8 +99,8 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	if (IS_ERR(t_enc))
 		return PTR_ERR(t_enc);
 
-	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
-				      encoder_type);
+	ret = drm_encoder_init(&tidss->ddev, &t_enc->encoder,
+			       &tidss_encoder_funcs, encoder_type, NULL);
 	if (ret)
 		return ret;
 

-- 
2.54.0


