Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFF1C44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=; b=SruZb2ligVw9p2j+O8cQkFCVBw
	22tKudyRV1Ox1E+rlbQ1M0xNghEWMifoVlFYR0eDp//3rXbfynTfz4pBlQZIdL7H2pc6iDB0yyOjy
	B3eTjpvFndIS6vi1uLsIIFNixYk1fAJPf4GBSUWD/tRjVE8PKXXv2tgfycMrD5HfjdEeZed9740y0
	Mlk4YSPkZDI98d19GpRuuGDUT9+N3yHI1Fx9EcCcdcSSW5rVX0A/ynHpQASZhltDMl4EqMmv8Polz
	EFoTtAIfaep6eIJijqOdZ54E8/1mLYMTekOSj+KJ7CXsmcsZ6PfV8BGn8jxVpSAhXGOhoVm4lCtFa
	1VX6jDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7D-00000007E9w-2P6m;
	Mon, 20 Jul 2026 15:41:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7C-00000007E7k-0DDO
	for linux-mediatek@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=; b=Oqu9ltd7/63UBdmKyBIQztl31c
	e9AmAqy3ul9cKsAq7wOj5k9wNQS3IsZy4ZRG07H0be4g2A/xl904K+FovKkqgWcjHWyFdeilGulG8
	BL8xLZ9rWHB1r6c242Wj8zXLNu5xSm4wA9o6uU+B8gLRFlYscPbJyCcJ7E8QEV0LWVydo4haYnAAb
	XF3SK2zOC3f1kz+Ep44zCL7OeDOaiJp/jlmmtsWshNIkdOWLg3d6QNM15F1lDmv4QT+FnR1NhF8Tn
	VMYEeL0ul2RmGtfkJgR9UtRV8y3O0uHIKHykdqT2w7sAOhT9mXwqsEhliFchqO25FtbErdHmXbj2B
	q74CJ0Eg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlq79-0000000GkGB-0a9E
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so44672545e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562065; x=1785166865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=;
        b=eL4gQKo2CIKavg3FEwpnC2F2bDOCj0eqKWxj4F99YvvLOkG6oQjWkFwOHLKdwtz4zj
         PSLcxfSwDezlB4qry6/5IZUT9cHoesnvAzs61ax0ht/lx6+fw8+UBMIOcdIv7qqJa504
         Ya7sKm+gSqry5Uta5HU0KcpYW9WCUdpUJ5h6gGR48LAqKQimNLQQPr2efo7p2JdtXcO5
         fJT+Z1cw2ym7LviMZ6ZwHIdL4RxO644cNIAxSUT803qZ8u6oh+8X6FC0o1kbsOY5DOax
         g99C2j3rNt0oNwVEdaL+jc0EGNuIOVtJwIcs4s2mgOzlCHOqel9IYbWxyheOTEQ8oZfg
         gY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562065; x=1785166865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=;
        b=J3RS7Nt1TfecjtjgyxOIsKHLdDdOoEAHVrd3hfMRgInZwSwxRkbSPqw0fb3Swt/4ib
         qDAZjY5ylDMa2vZkY6g4M/jw4OhxVrhK2riiz0x4YAjLYNgeu5Wh7uRpByGCW2q0s//o
         T16AtpbGWBVmMkCJNCQGpOrsztXwHyrfB2LnETqs6isDX3FeoKztoMX/epcB5gUcqEoQ
         UCEtYy1gatfHWx3rzHNaGJsMszva2+u05WWkf3Q2w3HgpNk8uamyEQRJbkgBwxv2IlPp
         jK+Owd/YjzXbYuys8dXlpiRFo5tZPk6K6hu4ifIHLvp72LliDf9vII/0amAXQH3cocka
         bGwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCZzfd+jDGCeSCswRErLMRQaNzq8P6XHATxeOi79UNT6blZ30DjZ8gthWS57URqA6oD7L08rqPNpdMiawvQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh/FpaeHzbGoZ9wvrSxK57ZSHluy8q9Fjq1bVkIVxTuHT6QiCY
	+YIqMDK+uRW1uQ78jFfckUyv6SFaAU5XSfsJn6eSRUc3LeZFJ+JW9104
X-Gm-Gg: AfdE7cl8xDxZ5n1sTWHSJe4NaMP/okvkKV4160hRunpjIohuIHINT/BOvHxLvXbeiTM
	xDqhc5Nlh+HToKjbUablWPyj3H8in8TJEAKp0/gPJ8SK+5KsxQ0MNN1rWNZdwqbaeULvpKtCL9i
	/u5bIk+3q8kXBq3q5wodmF+pJU6vIufOvDMVN0M7YuGUon0hUOVFcbKs/VeiIzVYYQxBLqrqwpr
	tKfyOm4JLKfnhtZut6e3AbaAeUn202jjd0dv9y6Mwi0D8bCnqj4nDaFhU9CAB8suLu6t+0MtVqB
	8M/ZLhlv4kqcQG6L8a+ypt2JzObG1kU2PueGiObwNL9tWQh7caPJG/Ul8e8oRh4263bFeFHB7XI
	FnoEQ740CWSyjjGk383AcwCvX/ZHnQfQrAActXoagj+he1rxbqi1aXijzESqPay0GJY07BIVTKP
	iwKowwSZUzlA==
X-Received: by 2002:a05:600c:1d1b:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-4954a3db7dbmr155975945e9.15.1784562065028;
        Mon, 20 Jul 2026 08:41:05 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:04 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:37 +0200
Subject: [PATCH v2 05/15] drm/kmb: remove dependency on DRM simple helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-5-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_164107_338925_53E783B5 
X-CRM114-Status: GOOD (  12.58  )
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


