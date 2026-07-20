Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947BEC44520
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pvez7dBBgFzTEWul+X0zgtK0IubmPdgVdOv0lVVEMOs=; b=NSFYHkBOZeSPUYBmhWZV98y718
	B5Uxk8xvRdO7EEUGCvyUlpLjLPGKFSiD9UOUaHPjtD19HmRtMs0mmOe7KwAjMjg8UzXXL5jGPyvJh
	idsW2SR7i7KRUiCmsRgTS5vCK/KAHGjIJdfKpu/rSaWXhQMenI2hSsRRI1d0TEtM+Li+hFgB7OIIF
	4uA6ZKG6sYiyuAIk4ax98PEL3Sw74mNZh8NANMYTKY7MzEFqzMJn7ZFuSttGbBfWWgjDBTAGlk24v
	oM93L9sqcFsKkRCW1nVWzPRV92+k8oPqpQUCRH8PLuQpjOecbwbvt7ashjJkKQL+hu8CPTL+afGr+
	/Cv98TMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq6z-00000007Dvb-2Ua9;
	Mon, 20 Jul 2026 15:40:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq6x-00000007Drv-29PD
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 15:40:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso6738150f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562053; x=1785166853; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pvez7dBBgFzTEWul+X0zgtK0IubmPdgVdOv0lVVEMOs=;
        b=L5fji3Ur1/MEOWYj2VTcAfzoKZzbIHeMxeQDcVZpcS+5wO2mWMLQSH6dzi45Sie7OJ
         eFBN+8ShRYwh/A1dugD2c3uCgm/dFdRCYKNCbG9dBbfVUHmfOF1jxN2qUsGiuHMzGDcE
         ZiectD3wtDYJtzCMFqVRwMG00Sm7ZVNJzNsyECpowGeckM699FsynRgbJoV8JNNMoLI4
         yYqTv1dOk+5G23F3j+qDtMSg7emUIrzF9e162nvgnAXU6BGtMUlHXaItmfqolsvB0pAv
         gPjINgUoRtYozGE7rBTQlICp6GgTmX5iPVqicKJTvfo4/s5aMrLDQi5OXuyDqVIts0YO
         A5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562053; x=1785166853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pvez7dBBgFzTEWul+X0zgtK0IubmPdgVdOv0lVVEMOs=;
        b=V6bsxJvZdRffw/Bq3TSouclR0lF96PrarugHlfFHvNDEuUwz+OJbMA9Hrptekz9ynR
         fC91juV40Mukk/zTIEMSmKusjHvNNI06q9JGgSLMq/RT2ywk3ETnWyCYg5dMRFdEHOPB
         4Wm4obSdRnqsv+oxcs3Hv95Egd5dwidnVSxSr2VZ+FgdfisRFMM10qoEIkInCEnxlFc2
         DkoaLI1wNLr18hhkNJpR2tPM01ZJV03yDOsGBv0j68Fv5ARiCjokPxj/q7pb/Yl+s/y0
         wDS8jxeMKbmYq35BaqRGlGBtaAq0RN7h9lozZBiWcSWNWjbMNW+r3dwl2UBDpw6r9AUU
         0HPw==
X-Forwarded-Encrypted: i=1; AHgh+RrqU6Gn6fuegPmS6Lq3uSScvx3h4s7/LJICVdVk7Rhwz6SOUkSGz0desnvT9o2uCHk1/JD2zFWmFNAM3xDtmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLwX+eL9oXwjjNRVKFqjgMKCmGOn9lNF/Cu9loDDVG+BRyBbbk
	51FQTWzle5Hb/bzCeagYvZSij6sy7KpclKuBcgfJDQ8A/54aJHX5LKme
X-Gm-Gg: AR+sD13dxncqK+NslojkjSGKVNLv4caaw4DEMoZlhfb2oMPSrlYS7MkB8C/OtCX0Cvu
	Rmcb5eg6USXzIGT3Plv3jbvTXUS6qUqOr8RYjMmNlI6/Q6Ppj5F0dcFhpqfqH4I+JziFlWg+5aQ
	yq8Y/K78Wjh4KCrCGLVleqz6RlDanmi/UTFOX8uQSSDPsQQQP9FWzM3+RBnOlK7RJZt36X/XGTi
	7mch9UtC2ZHcz9R5GgPxl+7D5CGj0qw9wrSDs9XkSbaJrYB85dzwg7T33v7z3DthrA5Y3ZNG4wi
	DKMQDdxb1RHVkRrClFs1gEp8WSZm1IBlAwvflpLjo1SMzES+s+aR4QBmiij333MoJtMRQ2z5Ubc
	ArDw/iaj803b5l6K/vtxl9i+ifjqbok0tIVclc3Jy+zbCULBc0XxA+zmmKnv5ZErXkOE5NH3W1h
	AeRp05OOaK+w==
X-Received: by 2002:adf:f604:0:b0:475:f0f0:9ef6 with SMTP id ffacd0b85a97d-47f6233f338mr13274205f8f.59.1784562053525;
        Mon, 20 Jul 2026 08:40:53 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:40:52 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:34 +0200
Subject: [PATCH v2 02/15] drm/xlnx/zynqmp_dpsub: remove dependency on DRM
 simple helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-2-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_084055_614679_0100DCCC 
X-CRM114-Status: GOOD (  13.87  )
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
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index d5f922450565..ac9197e026af 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -29,8 +29,8 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <linux/clk.h>
@@ -417,6 +417,10 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
 	.minor				= 0,
 };
 
+static const struct drm_encoder_funcs zynqmp_dpsub_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 {
 	struct drm_encoder *encoder = &dpsub->drm->encoder;
@@ -436,7 +440,13 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 
 	/* Create the encoder and attach the bridge. */
 	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->drm->crtc);
-	drm_simple_encoder_init(&dpsub->drm->dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(&dpsub->drm->dev, encoder,
+			       &zynqmp_dpsub_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret) {
+		drm_err(&dpsub->drm->dev, "failed to initialize encoder\n");
+		return ret;
+	}
 
 	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);

-- 
2.54.0


