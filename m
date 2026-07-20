Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD39C44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=; b=i+TYw580U9ZYDMDgCjP+offZwQ
	dV4ENz5W0+apq0/67DAkFcL6oSjEjmWtYnOj9ZniHHQzj4W2jfjUct6tLsfjcUjLT+9JXcgx4odHb
	2FnjyUBUvmWJK2z3qksWaLQ1zYJU865ZhxR9LG+pN+vU/4XB7HlraEFQQWZgvUzH3chdDujCzrQTQ
	gHQ+kt788q89CQQbisn/gBKOJY5HWMFtDTkhncgsiHEipoZeT6lE9JY+DfoLRVKLTWlpr/VYA3tOu
	6jOp4veWtPzVIWVnd9dW9AbASugbWkgDF24fa1igiuRZut+IhrY4JkrGre0VSnjuucvFtuuZXtog5
	yWRMUR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7l-00000007EuD-01vZ;
	Mon, 20 Jul 2026 15:41:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7h-00000007EnK-1yRV
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47df43bfb07so2743634f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 08:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562099; x=1785166899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=juqD8UmqBkmR0fv7rbk0u9DADPzrDf+9ZHWB87quLpbXfOOxu6losI77w9cXOAbPBR
         QqjvUtzhQcjgs0O76RNf2Jf5kRMtsoQdjgeaOmloi1uKxOHraA8QHySsT5Xb0xPOxKNz
         pr9nKC/tQdhetY1wLHCS/BEb1h2Ng42GmAtNMbEngGDgAcvzEHMwvmof4FbhpQqt2ftJ
         WpoI8QpbLAz3XHpeYQmJxiW1NWOJJ9/b4CuXp5B6gBw/DwksrrL9hAzCqhaDE715ayG0
         BqPBTBTnN653Gerrcv/VBsIflhuDyl5b9/4SgrUwB8wFd00wrfLQ4NwZE/aosQg2MKPm
         3igQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562099; x=1785166899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=C4rWO3+iIrUNzbfd+/jg+3c+CoeT8xtK57YzsNulPgt4BfifEbZi5s3+T0QKLu74Cc
         YgjjJ9vKCbSLNJfLm2PEYyqnfazvo1lWKyLAjEJiJP+4fF81ds09gPtYtxWySf4Jyh2o
         P06jL2FvmQJm94bkThrJWe1Gw+lcy/vUvzbLC923Ys+Uwtjw52vm6y9p7h1sneAga7bP
         vq9ow2Pq2rD4prErD/Y/Cge8+PVmYx36G12lwe/uYFfMn7FvB12Ez4Srt352znMnLJeF
         XcQBUKJBrChdPPBirbargX4ZQ73FPxsje0HFCe6JcSWL62wmDuU47yPfg928Hm19wab+
         rgdQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3s/Xsb93cb6awYvtPX/Az53TTE6d/Pe7tNGrpBq0PMHFWkJwBxSOvo8RM6eNVcNAPowqXKSW/znSpjy7mcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCzc3PBPW1n3Go6zqYHc/XG1QEGh7KOUrUmOgTFVLuSzIFHBlG
	aYb9Dz8UIccJHSoeCtVJyAgLkq3sydBR5z9B0bwr5XKU4TaIFT5lJ/Ua
X-Gm-Gg: AR+sD12PcZEAACcLGZ2+XhpeBrOHfNFO92STUexD2w6OFM54/kV0oovcikHUdHlarBo
	s00O/SuSmGTTQo88Bk0yA2ydmv5dVGTPy4EOfNFkcVdgevZYhGlrU0iTa+GAESCcwAvw/1nMWqD
	z9QNzanIX+sbG5+k5ozdw11DBUgeSdsE1trfuRCOpuoj9bJj4WNTyvDxfjCzwWlFmdZYluq1+4V
	5vIuqrNxogFgHWK6fT4CfIeKk4qE6tv+z67veiVsJs29CL/u+lCGZzUdNdGXXFSlsV6VRTOyUCz
	xm62QsHCDCFM8figtTQgMqqMR4higJ9X+37xzsx9A4AqR6z1NQ6jSIw6Cj6Ojnnu5RP1SQKxCI0
	vTaFu9T88c5H73NsxLnd8cyGJJkx2BBn9E36XtQ559nYcz+Q2HU7JL2NHq4w4cCRV1puYRihHdu
	ZbSggqhDMi8A==
X-Received: by 2002:a5d:5f91:0:b0:46f:7d90:8121 with SMTP id ffacd0b85a97d-47f62305661mr18563371f8f.14.1784562099337;
        Mon, 20 Jul 2026 08:41:39 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:38 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:46 +0200
Subject: [PATCH v2 14/15] drm/drm_simple: remove deprecated
 drm_simple_encoder_init function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-14-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_084141_562876_5126E1AB 
X-CRM114-Status: GOOD (  11.97  )
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


