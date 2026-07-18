Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BAFC44521
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2026 23:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=; b=jq3uPZskE9YvBHN5QeNpthyEvt
	jT7i3fGQvJstipjQxrP0SOSZ+t3OuY+UUu0A+mCPpqndeKhxezVM95l8VkDr3v8DqqiJNNP0fd3lh
	nQkeoIItaZ8gv7CD8vV4jH1pEfmFPjwIfuhNTlEbteA+OTdnl9lBfBwVIO3j9s6MOmh2GAeDOn1UD
	kpExXON7piG5SxgqcjYCJnl8Th3BAWaM6RCktBReo+bfcqUPfdcrWix2Hd9K7HIi4b+oMmXNN9bbD
	+7oq5DiwS+fsURu7dR7hTjJVUtL25B8B+S3Xgq9P+rmLtn0/40dHAz1JHPPO/JIm2xS0JkbKp3xLi
	FOkGR5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEZv-00000004bqp-36b7;
	Sat, 18 Jul 2026 23:36:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEZt-00000004bn6-2Yso
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Jul 2026 23:36:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7181725e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 18 Jul 2026 16:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417776; x=1785022576; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=;
        b=Tb5/PKrhg8iPBszJigXIAHIykWccDR2vd4lIyByfmQho6EhgMh5nrIFlNxD/Bt2+Js
         SlxFXW/KVdSWTTrxPWr34rojdZshV/8NZCIX+EuvJrsskZMCUryy1+NQBQomNttOeRkM
         ZPm37inzkTEi8SLAWGosXU6h5SFMYaa5ZVY2OSamDpW0hV/7bnbTtZY9vzJqLAGqyknI
         alNZD4a0Hx/uqTVd7V0jiAQRmftzWhoCxTPscBoHwrgz5fu4qA9DSvkmjsOeeVmaRQ82
         urxJa8LG82ZlJU2qlCH9pNjFwwzBd+EkS/NF95Y2Qonpx6XaUSiH3sYXBv8DbAS+KKRh
         RWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417776; x=1785022576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=;
        b=UGpSkIZu995f+El/227StAB3dkZcpqHFxxRYKm0aAKIIMhpzuNlqJsPxoiPSSHCY6L
         iRilP8H2pYi4iXcLn+eJjJaA+YmDQ1stJ2eiiFhaefUwE54hzSvpWYh8tYsWyuYouw/H
         Ozi4rJv+m1Kp33f/oHgX+SVW6rUc65QmKtUT/A/a31IQG1kf9W/r0jntF8ecz7zLYKUK
         TPMtBXFf0cEAj+x152Tc0GRM4J+ks6UCjercZ5XJ1rjTg7EhoiRodUw+goCk0cHQf0O3
         p5+K2p5bN8Swqm+vCg0UEZ8JWllGNgZUzkcFU1zPb+6Vd1poT5/k53YVuWUXCZixb6cM
         qvtg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2PfT76gVFqDmR7ix2+/PVsTOc22p1HSGNiPOQJ0SHjZ5Xs1vHh/lzDbWV9F5TFrbv/RN5RWtrU/TaBfwG1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5kAcqw5DrMxxlE4tgSqQpt7RJGTKb6EH8wG+KG8dVJ+E6xiNE
	K9pKwCqa8M/cSMJw7FOdixgYWOqaH5Na88pEXa/t9/e5xbcdgBDTAAp2
X-Gm-Gg: AfdE7clU6RVuafXAEZeQglciuIyWJp5yg6C1oV7cPEesN95ELRhyXr7rvnaUSyBh1Ej
	qz6nUegH0VFZohUWl6NduoawZyAfZ5quQ46Vhm8V3H3tjAkiL6P9iaV6fNHD9YKuntgw97pw1W8
	jeUYGt+17Ba+QrTIQrfm4jtgNGR978gu5B1dcxtFs5B9hCgC83dsmp8ahAl4+tqkikHN0HQqLIo
	wIAK/csdBwlrLf7IJw5MI9mO4siVw/ivVq/KNS71/afB5DqYt966cVQiAal4A/isuiPoQyb4mbZ
	h2DF46aslpa4rOQgYPsxXVA2X9st8dWAqH/CSIkZKoDYOpZq3gHPCWbXchhl5Nn/QYmPfnwuhPe
	fuMNmEtmUBGdDNLaI4esH64xoS+EBLq3zOKKpYkGOxMfvwcvNKU484aoUzgRoeuTwkVWA8+ZmAo
	H76S5kHKsFUg==
X-Received: by 2002:a05:600c:4585:b0:495:3eb2:b763 with SMTP id 5b1f17b1804b1-4954a50c51bmr85840985e9.21.1784417775709;
        Sat, 18 Jul 2026 16:36:15 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:15 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:36 +0200
Subject: [PATCH 05/15] drm/kmb: remove dependency on DRM simple helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-5-a78c509e3062@gmail.com>
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
X-CRM114-CacheID: sfid-20260718_163617_682116_B3860501 
X-CRM114-Status: GOOD (  12.50  )
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
 drivers/gpu/drm/kmb/kmb_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 59d0e856392f..13adba96bc78 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -14,8 +14,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -1427,6 +1427,10 @@ struct kmb_dsi *kmb_dsi_init(struct platform_device *pdev)
 	return kmb_dsi;
 }
 
+static const struct drm_encoder_funcs kmb_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 {
 	struct drm_encoder *encoder;
@@ -1437,7 +1441,8 @@ int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 	encoder->possible_crtcs = 1;
 	encoder->possible_clones = 0;
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(dev, encoder, &kmb_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		dev_err(kmb_dsi->dev, "Failed to init encoder %d\n", ret);
 		return ret;

-- 
2.54.0


