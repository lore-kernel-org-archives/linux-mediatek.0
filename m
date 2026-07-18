Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85400C44523
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=; b=o9kBYFzZsXy5/vNQhzPFFYt1p/
	QKtJHDrNukgYqruSG0ErGClGiIlaYxDszOX/2z9E+hi0pSacNPOOG3tku1uBacDOG7Fxm+EUq2bsD
	3TaIqXn5up8cKmVF8t49yDPuYAjYXOmw5Ly/iy/oWUhN+LH3j6Yleqpg004qQAur+IGegEoU+XGo9
	qD/PAOfuO5aCMwfrtyxGOZAn4LsixYQKzozB3e6kAE6jJ2MnYQaxI+Y8ieFDpsgAsk+uy35SrCSyT
	KBlE6wkaoZP/Ony7B2vDwF76BGg6MHtI5h/OYE//Yn4virngWMhkQxC5jQlSFtAJW/Lhh8x/NXHPF
	Ynchuz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaE-00000004cEC-33Js;
	Sat, 18 Jul 2026 23:36:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEaB-00000004c7u-0Ov0
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so6481743f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Jul 2026 16:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417793; x=1785022593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=XeTXULK2lKQKbyCDfD2OrjaJ3pypO+zea9cIoqHluv3G8fWQpTxC3ZtqDxHs2aY8bP
         qLeVVQt8soYlvy8nhjbcVP+tXSvMZk+5v8yjLbtSlAB45yMROVezEgoDGLNrmKoFZyeK
         ixOjXLbTknQwOlTapFkVMoDUoe4yquvX0ZfVoiCYQd6MiZdCaFEFux4evKhMGhtMUWTA
         NKuhwaE8XuApBy0pxC8UEx2e+23pVND9WxrzoEixxLyh+Sv3Xc2BlE1IOpxRBG8hS4lY
         O325y8wQQMH90ODfsLbNlFlIYPdPBXb2BneqUMhcQrv/FyPrw+u4HTaJwM06QXFWf5Aw
         gM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417793; x=1785022593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=PqvFvALUo3DKENwZFQCuLr0s7lvPrtkRmIO0Gec6s+5QMy4/fkUcwYw8a6p++vZPwx
         YCt650qu+/jPLCYP/hfL5/Vua8Eoe+X8HmOMjMvPDtCbOsX9yJgOs52HsP1lT9jkz4uZ
         +US3LUF57IfKEpaaWLVhP4PTOxGkzS5W4ffuel9CoHykoBFFz+3o52MYwYVeZYYue7d1
         PZUSNM/9ThIRw8aNTwx0aEf7pioJMgZtrNoEK5bCsGEufStypRzRjjQQFsGo3MKLTgPi
         rcu/btzqMM2dnToLH1gkKsQCyljnYUYRDA3u5gxo6QvSNoEyclaCPDnceMWVeN9UfdPm
         ofsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqy2twannS4WYd3qTjTaUl4CuWCYsEb34qW10spIh2wJJVFHAwbuKfxVyK93Eo2a4ZyficiIu12G4DIoM7y2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk0sUohEJ/scnVOyy3+ST0ZbiZt1rVIDo2VW/d3A2SOTbrX4iv
	EBjQWC1scUHeodGH/OJVfnGVae6UVzGeItP9xutzHGQaxj0Q+xuR23JU
X-Gm-Gg: AfdE7cmRWYXHD4f+rimZzlghfRup301KS+pmT+wUXXbkZi2hvzr5TKVmmzrnq/E7/Ca
	jhxXOPwT7Mpbkra2gbT3J+I3C8/4UBVwilYym9rD4tzunkXVkOHCN7EeYiz/zJbrGYkzrD+KuwA
	RqFoigjxJA7MZ2XJx9m6QseYn/Ee1X0+j2qeSsRXKdgJJb/HOsc8usx1MCnni3Kjq4FNnzqhQzQ
	v0WA7W3uZe62vvCm2EF+UNC9S4rmjuxgXa3PLIbrmXpXsA18NGlJlVMeoAVvG4xJnSbPtaIi1AV
	5MM/Xdh4zXpg+TH3/QVBIhD9qWGOZ8jcPXoJ034XMolc5QTzoDWwOPlmwCVOwL1Hb9CABCANJWk
	vfC9gwRuqm28baMhny1CKjkC7RbwnnVnXtapwE1ct4Se0l9bMI4v742s7ff1bSuT1Fw8XHyvSXn
	pxjyXRIRIf2A==
X-Received: by 2002:a05:600c:6287:b0:493:e79e:da63 with SMTP id 5b1f17b1804b1-4954a51319dmr90732155e9.34.1784417793083;
        Sat, 18 Jul 2026 16:36:33 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:32 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:41 +0200
Subject: [PATCH 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-10-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163635_234896_5BA56CD4 
X-CRM114-Status: GOOD (  12.62  )
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
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 1a2b9b68af6f..2dc477c7eda6 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -21,6 +21,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -29,7 +30,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <video/videomode.h>
@@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
 	.mode_fixup = shmob_drm_encoder_mode_fixup,
 };
 
+static const struct drm_encoder_funcs shmob_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 /* -----------------------------------------------------------------------------
  * Encoder
  */
@@ -448,8 +452,8 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 
 	encoder->possible_crtcs = 1;
 
-	ret = drm_simple_encoder_init(&sdev->ddev, encoder,
-				      DRM_MODE_ENCODER_DPI);
+	ret = drm_encoder_init(&sdev->ddev, encoder, &shmob_encoder_funcs,
+			       DRM_MODE_ENCODER_DPI, NULL);
 	if (ret < 0)
 		return ret;
 

-- 
2.54.0


