Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB88C44521
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=; b=PUU+qB9+vvD0zgSo6wf6L3q45i
	YBpuElWIYdMGxOCHrmz3vmLynPLzz+7Jt5iSKulMkm+evKxJjA2WnyPfGErnnzjl1y3cmzVmebWDM
	0NUWv7gKl7Cre14/aPBCXv/euOQF+yfMIk+PLwByhOwYpRUU2q0cjTCZt756+TgKSAgAKXrHT2ha4
	gHbwcNL0hTFufpU6Qj4oC7BMMGLp4merxDIa1aR9X5lXxAPCTJWpHZEzYTBclTUbkH0ZMSfTVChIX
	OY9xYLxaWD5S8hMZ8/xE0fEKOiCMUMITD4mwjvLDkg1BULXqRBGAARH55Z+eAvp/xI+YGZ4bDA1oZ
	b+F96J9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaQ-00000004cT7-1EzS;
	Sat, 18 Jul 2026 23:36:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaO-00000004cP5-058v
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4953ddae026so28560625e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Jul 2026 16:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417806; x=1785022606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=B13jAn40IElZW95QTv3H7HPdtJkyE7LAQpPhSk6Z1zU7IUvdqBZONY/tA+kLUIe9yu
         xa7ncmRB32ed7kUrq9Th0/t9iBd5gNJwusNyISRMCnO6LdHvMCIlr4xnSpv6avI/N6NP
         0XAQpRIHNpSeygNuZ8P4prkq0sIzCAVCf7mIU2+QjEjTuToeJmseSPkMibNZ3Ygtb3MK
         fdEyNh2tBhTs6CA8laf6F/0GcvK8tNDKVflCyWhOOSPrNs4gBZGHUqxbZtE6EhbewcHk
         aAq9n03h8fzfYVd+RkvOsIW6CsfCDzvOEHKYiRIORfeqnJShe1AJt3u4G/slGISnQ6jK
         99aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417806; x=1785022606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=ETzxVz59UH3KnKEafl9xA4ixvm5YzPH2nLo3mA/XJf1cAg4dbMaW23rkWOdyGMh2bL
         odX6EnNpNukxEJWnTJNk+OL+IC+BwnutZsEjC8LyeG92RBwkUYNP30fie5388Qrz9DtE
         xspWkeYbAc0DneIbWKw7X48K0sPJaxNFgl4+3mdxf+/c9JU+SYyPfXFfO8WmBuNegeL8
         umbcrmLitxJ6qLNAYX76TGYFbX0/cpSWW7UlYmiqbX+A36Bk9JNyTlYC0dXyPA6XAnPk
         kUKqM/dQ7l9LtjZ1Is2E42TS+BoDmCxY8g7SmIRIYMqa22PB6Cs5Fg8IoP/7QztLhmcx
         mPvg==
X-Forwarded-Encrypted: i=1; AHgh+Rqrx+245ki3wE1TIscIxCaSt6Vd/MDZhi4SwBYbYdAVQSwB2nHhSP8bK+TrhVTYdk59Oy7yuJBUkPNRCQzf/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgHO6itUKSgKIHxHDX7EL4kxUDMhmGupIZ557cDh4mHwoNntXz
	0vtA5Xdv/QZs9642Ljgw75PI1z3Ipg2K6nh1wKsfCmM3nnvQDUPzd5asW2/xZzqL
X-Gm-Gg: AfdE7clFo0h+5F1+VaN3DA/IBRXScANxzAUCj0xJnYbaT+P8jqa2yBQRkeV7l5+EQwE
	ZNEDbMfwe5UmNM9+aWMFQjRU1LyKmc5DZCEEhtMBR+m4iqpOqx1/c4eGHb8js1P6DnxnbR2f5VT
	Si87z8MS9W1wcN+jv5SBZR12htAdRW86LFVNM0X0nU6g9Mq6tDnBnlEs1ClRXSkpXmRh0hD1hCq
	yNzq8lFvPcN5v/8RJrivy8Tzu+FLT6M1EESgds9rKpsHwJKB/fmiPNpzPXkUirjpgCRyvZDpkHe
	u9EcFEYPfAtlxmQT56gwewuLIpMNSXfoQp+6EsOSsD49+biRFSkBbWTKfWjXB2gokYZSNkJooRB
	H1/xnxrzIAZwmSFpCVsMQGz9AbO7UBaR1G3M4FzAUrDH0JB9J2BWiC9J97gJu5P61BRUIGPHhjW
	4ubn8SUagqsg==
X-Received: by 2002:a05:600c:1c28:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4954a3d0be6mr96444645e9.3.1784417806328;
        Sat, 18 Jul 2026 16:36:46 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:45 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:45 +0200
Subject: [PATCH 14/15] drm/drm_simple: remove deprecated
 drm_simple_encoder_init function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-14-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163648_131751_4D1D5C37 
X-CRM114-Status: GOOD (  11.95  )
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

All driver users of drm_simple_encoder_init() have been converted to
drm_encoder_init(). Drop the helper and open-code its remaining internal
use in drm_simple_display_pipe_init() to prevent new users.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 13 ++-----------
 include/drm/drm_simple_kms_helper.h     |  4 ----
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 8e1d07b9f1e3..7878b9d7d524 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -20,16 +20,6 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
 	.destroy = drm_encoder_cleanup,
 };
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type)
-{
-	return drm_encoder_init(dev, encoder,
-				&drm_simple_encoder_funcs_cleanup,
-				encoder_type, NULL);
-}
-EXPORT_SYMBOL(drm_simple_encoder_init);
-
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type)
 {
@@ -363,7 +353,8 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 		return ret;
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(dev, encoder, &drm_simple_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret || !connector)
 		return ret;
 
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index cb672ce0e856..c95f86ff355f 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -68,10 +68,6 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 			const uint64_t *format_modifiers,
 			struct drm_connector *connector);
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type);
-
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type);
 

-- 
2.54.0


