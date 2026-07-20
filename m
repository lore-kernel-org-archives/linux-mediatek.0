Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD54C44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=; b=ggAF1CaOGg8zVSdAA2W/TQNxlP
	1JDIvY+TpRwQ7+GNjb4vjL+pu58jmqRInSf7UzQdKHo3k33LIHXG/MrENDrWtUe5G3ALYn230DGdf
	Yn6i1rQJsccQF1UjU3WGhnaZW9TxaGNQHgMQ8ar0Bu4MRCKHblEZ9Qm5bWSVcoHXlfAjxFaiGsf6b
	3bgmR/8lKIompaT7P+VQDB+lch7eaoeqIoXHvr+lcHhKSXsahshFPAOSTKJe4NYqJ+u3YLLgphXAJ
	jROc0k8Kj7AAxiZb3tlAp71GL1e2UJ2qnzejbkRK/HO33nbbLGCmV/QfWcmURGYbAh4ChitbDe9Mi
	YwjlFp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7M-00000007EM7-1qj5;
	Mon, 20 Jul 2026 15:41:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq7K-00000007EIe-1t7j
	for linux-mediatek@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=; b=aIPyFt1R6crpiE7cM7p7WdYGX9
	gO5TolUgGn6cUFqv1oI63FdpcvKSWEANjkYU+fKCOwXKVmHo373Hin7gIhMwNsoj5Xt0PM0CVV5/y
	2nb1ySwThHRZTKxrWY3Qt5fI090LaSpp+QQw/fRxMAOKGlnJ3jQf5E7Ru1odXIO1ONT6aFCnNBVqR
	DEIFodkOS8nPbKoHPyPzfDasVa0/QcdE8tvbsDFHNNW+nxRAVqkWmlUIJ3M9wd1jyC1dw4ajpCDIU
	ACTU9Jkxa3BSVMlwRlQS76nJYbULeZPOTr9iFFNjfaSdS6ef5D0lUqnC8TKrzfY+9x4G+ZiGcKOnw
	cD/B9x4g==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlq7G-0000000GkIl-2Fuo
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 15:41:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-471eeac43bfso9602872f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562073; x=1785166873; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=gtHEBSBaNfYWgZt1hgyieuDX0FV6EZYa/xGbPrD+ko5fQhclg8gmjGOTtJFAxZnHsE
         JAS64gJMdFCP29bSc64/y7MRpmeE+Ji6KGHf2u9RUKjalyW+6YdoYZvAVLHnadn38/Dz
         ziREU5A9vlRPkYZeSoG4EL0hhr0whj+ztXUYyp/3WwIAnE/sQnuq1nUnhuAfCyXpiWXq
         5mbCk+egQCiDKHI81qh9sms7VA5uGJoEpv7Es/+GXKtjiXze+UZGnZN/OD+B+JN0TMBa
         SmSEuNCdmEZLZbl7py5bE9GapNfn1nIjCF2QOozgqTSDF1Xk0PhSSG1c4UjsElFz9R5H
         zrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562073; x=1785166873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=VF/oEGhiM429S2q+dznlfhgYE9rCMQPqpuhozx/wzzrsAlQmEdVHGXqgzsygtBTLgc
         hucTBo/YMzEibXg1aio7KUFQC3kVeCKz3//JsvhG3Km5ZXFi7SggHU66AKg9EZ9WFNeK
         bHnuCpOeproWxG80vI6PEr2OM76VLZi5Gg2zVDsHHsBBgDZ9J0YENJDGz1wnM7NROuRR
         TRJMv0boB2TtPlsK4jvQWvuxWRLOzUu/jrgSK995dAXPQvJdMPs+FZ2qpnzdJvEwbm+i
         ZSkllUwX72oLT8jxVX/FKwi7qFuIuRLnXREfAhxxtPxgDTSLAVyDSWiSPkg8mAeHkHM8
         XOjw==
X-Forwarded-Encrypted: i=1; AHgh+RrPMIK3bu5URL4PPfxucN97cmMBWYWHS+u1zF+IY64mmrn0DgwG556IETZwHu1eZ0CCULVKOKb2JtA0QljNwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLcrzp3DPg0YKgqIw4EY8GoghzItiGjR1FJpkr3PBvThlrFvQl
	Udwa5awTCKgE3oNfcsYKWjVdkrC1B3NSqCqr0aDdywx57tpuf8XEuj80
X-Gm-Gg: AR+sD13FCjdK97pCBPj2T8qbLGMruFIWQU0taXkyKwFfiJG7CmGhF68XlbGPTUv2vUl
	BiHTYjhMHy5bfmzrjshSw4WJEGZQqzFbB1YQ5L+O5HYwLD0JwnkLyppzsPIhftbp4WbWX7PWyyQ
	YBEdxng4Wjb1o6kFeOnTkzJEPMuCRcxk0qU8BVZox76XixZOhoyHjpJA/rRjIiyhU1Sqq8xRXll
	1wT2gfF4GVsDV7vYnLei9OpVS+cvqVnOopE3/GjfPsQZ7V4AHg8oQDiGdpm5E130fi/FSuBZeKZ
	xhcXUoJH/TYY1I/Jyxt7EHBFRVCWNN9M7oN7E0jCRLdyPv3Z438PGNpOy2H51UKVs2vKXgyGTgL
	VUn5AHIYOB8FCZTKZoEa0hr28iPRNrQ65OG7Ki1/Z1p75aPeHnWDzBSrE7m8dy5OvFOAb8DP5+7
	efCihDRex4UQ==
X-Received: by 2002:a5d:5d0e:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f6230389fmr18153184f8f.14.1784562072745;
        Mon, 20 Jul 2026 08:41:12 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:12 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:39 +0200
Subject: [PATCH v2 07/15] drm/tidss: remove dependency on DRM simple
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-7-5020b630668a@gmail.com>
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
X-CRM114-CacheID: sfid-20260720_164114_694240_8DF49E46 
X-CRM114-Status: GOOD (  12.08  )
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


