Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAC0C4452E
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=; b=WvvNc2ZdeobkWThQnltQB+H8yi
	l8cTlHL1AV3LF3REJqmcLZ9hr50RiEn8wKTA+gzdEjDoan9QYmh96JiueOyc38+RO5EO6mtLIRGgK
	TFgKZbZE9+IuHhjXUxqr1LPqodX9dBkWLIgpb3FEtkCV2vfHf885yqu9Ri4zvn3W1U56Ykt9fO/2F
	aauU9F9tcpn6CyT06Y8RhNzbsnpMbjk49rvFeF3KvZS1gsE1sJVvtyDeP12eDEbRM0pnWL5KXcB5N
	XuitRehzwelxXAUcRDtrY8uDeqdWKGlIBlJXrB0Yh9iH/BkEnIrx9lGnjLIoAE29P4+u1EO7tczRY
	PJe3PEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7G-00000007EEP-0gtn;
	Mon, 20 Jul 2026 15:41:14 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7D-00000007E8I-10Xk
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:12 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954d383e64so16282315e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562069; x=1785166869; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=JhhAGFMz/58WncTcLFSfGXe5VoGt9FbpBueC6PldvHQ+TB6tdwTOZMZcbm0ILywdtD
         /E7QP234NQt0IrGrLIOOE0vJd40xmgeERDtBB5Kx4bElXA4IzB/ETM334crFGOsR7vTD
         7W0BAxZY02jgMz51FnYSZZkk6XWCu+0eUpELWOQk3BMmam4Dz93ElQXyKYrSN/XBFFpU
         qCk/4+z+ECS/n1N/RzZrMpyxKorD7BnLPxt9BkwTb3ut3LyK00XCVj8XPw5Ysp+L1GDU
         5bDO8JkyRdxxqJNKFImWu2ljO0tL/PTX+iKH4G6TH2Z3tbaxBQ1TxwTJ0q0ddJjD5S7u
         1e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562069; x=1785166869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=k3H6YdWt6TJOswDRdFG+F/kVAxbWQGGy3wbz8bFN+tb0qmXCWn75VNh7QPgFLX6VOS
         QPynMyhoHYiTdoXfBDiamxo/E+FekvmI8/6W8rYvxRaUfZKYj76IUlR/mI51sPuFlaNh
         jQsHdj/7GzZSXWTZHxS5NasrqmnhTbSl8y2Z0bn6x9zPxz4ABwIyJsvLM82V54vs2EER
         e1hMarHczIftmGseOLnXdiwnjsR9XMqOzx9HZiIE4RdGaVuyCgbTHOeVEzpSXFXkqnAl
         zLhlDry1S2f/tDVY7V+SpbfsSbCuhDzZYJFe24Bvn6rxC0do8WPmJAmtuh8893zTZJlG
         BWkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0M+NGxUDM1st0GTZCcm6U5C8h6cl/ydZtpXaiO+DoJmibyYqnfnFMhl5fdeXsvBqrl7nBt/tyWKeNETirzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzP0zIIqhaYxtEt11PB0LYatahPw2t/kwd15h8KfH78BS1gOtPr
	5l3CMP5LWQAJoVqUZo0pCNH1leQiBE/mvNYzlYi++3QLFnwedGI/5COj
X-Gm-Gg: AfdE7clyZAs2Q1ia5VSrZ7+k/g2/Cdb+Cdo1Vr5Qtiw/P/ALyWSwoBJLI2VCxGxvQ4G
	SDC8cUjxSk88r0RV3eMNtUqYxza0qPjlRQpE0e1ZPvjAdxK54akIwRC7tW4GLvhrm0QiN9YSJeK
	IB2otIrGtVG2eg1zHmv8fsgTVMTgHIl/sqLKJ+U5ifAETTk8vTIEMsEP+G+1IAbRUTQ7Rpdh7zI
	96C+obfjTZRarp7SDApwNas8km3ohlC5JyvkCxyB2adL9s36XMg9MGE/Iy4ShPDisS3FJwKYseW
	4EjtTTqWbGuG/YtiBzbKRfQ7rUnnZktaAFWwJ/2vTFENa7+F+o4hrsWFL6O/3Qhp3t96vt8YWp9
	53QSNDVpX8etKyB8BxIR5PUMXgAeokDKEodn2gGSamgWL2LkR5J2oHTtMte0TE84kv4C7u6FMnY
	Auvihk+5jZpQ==
X-Received: by 2002:a05:600c:1f8c:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4954a3e6e29mr174459165e9.5.1784562068798;
        Mon, 20 Jul 2026 08:41:08 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:08 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:38 +0200
Subject: [PATCH v2 06/15] drm/virtio: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-6-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_084111_749417_AC2DC936 
X-CRM114-Status: GOOD (  13.08  )
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
 drivers/gpu/drm/virtio/virtgpu_display.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 44ffffec550f..67023d91d40b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -28,11 +28,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
 
@@ -232,6 +232,10 @@ static enum drm_mode_status virtio_gpu_conn_mode_valid(struct drm_connector *con
 	return MODE_BAD;
 }
 
+static const struct drm_encoder_funcs virtio_gpu_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs virtio_gpu_enc_helper_funcs = {
 	.mode_set   = virtio_gpu_enc_mode_set,
 	.enable     = virtio_gpu_enc_enable,
@@ -306,7 +310,11 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	if (vgdev->has_edid)
 		drm_connector_attach_edid_property(connector);
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	ret = drm_encoder_init(dev, encoder, &virtio_gpu_enc_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
 	encoder->possible_crtcs = 1 << index;
 

-- 
2.54.0


