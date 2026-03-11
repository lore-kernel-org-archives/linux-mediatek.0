Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD5A1049521
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VT7ZzcC3UQ69KoSxqnkGn97mAkV5xCuC7gmeayRSfVQ=; b=CBBzlHCLB5RfTiiSDilfpW1R7j
	YNw0f8vgDQjLncFXt39JYcAc8r7y5WPwwbzEZHZWGw1sKtvuFza5YZDyKS88UPqUNhNEYr+hWYkSi
	K+qWA4LY4KBrpZl4XSZ9E8OYn90lr5fmpZJlaV5oHOpCQCm0TB6jPbYv1gR59AqocKuOVJ4A/mnq0
	lzuGkcaG2L0z6GafirDBAkC82C4TOfHeWndzI5cSzoumCEeKJeTiLydQg0q366LqVgW6y9DN8PoNw
	AlRXaxzxSeDAhB4Grjusc6Lv3JtBGPD0ffkMQ17uyayfnnD7aVWyFwUZVuzJji55vtn9Mt3w7IaTa
	tq9Gbyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCY-0000000BJjL-1aBE;
	Wed, 11 Mar 2026 09:50:02 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCV-0000000BJgl-1r8M
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 09:50:00 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-829a27414a3so2975941b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222597; x=1773827397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT7ZzcC3UQ69KoSxqnkGn97mAkV5xCuC7gmeayRSfVQ=;
        b=E2Oie7dbUTHmI3BKf3Fm6s0cKJg3NLEpP34Q13QdztQE2kRKqhgX8L9xUhQp2bSy9e
         Bvg0EEzSKF/2Cz7IPUgrGg6eqAjIFF2Lm+j3Lez9bQZVFC4b7iMJzhwocEBUoDw2QuNB
         yNh6HtSqbOk9hAtB05/KyCWM5o++EMPykB7Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222597; x=1773827397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VT7ZzcC3UQ69KoSxqnkGn97mAkV5xCuC7gmeayRSfVQ=;
        b=rEy17uRcOFYNeoj8Stsj98SzsRp/lqGxrfDhU3ZAQacv7Cf7TY9mwsqiScAB6XKVu5
         LYiUGH/KcDwiz0+73enOcx4x2s16B/JCM7ZEuvw+xo3KC7zJQREMYe+oZQHOuVs7OFm2
         5103dPN6LeNFKp9yJxHyhKHG26GkMOmlglEWQnWD/BRBPJiv0cM2+ERUzqLeYHEQmdDq
         5CqTIuAaaVYZfC/6dRUj6Y+RIXwXUENExjV7a0jH+HVVQnEUCTwgOXGwkFUI1DwzKdrz
         UCfWz3bKw5erYiS+5UEzMcP9tMTDN2vldItiTJSYgkrZV5uOWFfphMGYzSxf+JAPFH7x
         +U8g==
X-Forwarded-Encrypted: i=1; AJvYcCWWuKHYUXD4v5FCFxw7lG58BYOVYfQBznyFOekLeXdnPNGtskzW9Zn/vekUmk6QjQzxieQHNUVghTamX/aKNg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/lM9QGi5hMix+aRVI9ubG6BWupoyV0kuQPc4W9iOHPmgD07tZ
	8JP0lh6RKhxhpzjURwq7zhNj4CHBdFkJO2MA2f1Elch6nL0DllRnKeIHIAH/ZNYeKg==
X-Gm-Gg: ATEYQzxKtzGzQDEZH2ow2q+PCilUmeKfZRFaLVRu1dvch+j2cEebnd/MsbvcTLPjOCo
	QZrX2VMAWqvDoM4UYaid03I3RfrxsPiZDIi0ais4WSycmANRrB7JAJK7qh5b3Sz7wKBj8iP+Bzc
	KJ0NazGHX06y1vjqRCfd82zDZgNPLLMNLqs52MSpsVTAuLCz38527Q4AsNqY2+2xxY//JIryLiA
	DOSBSSuxdBPGdD3RkRRLQsktVPBEH9vXDAxZeVQ+jwcIgCbo+dDYtc5OQ05Uc9AWFovqs1BbgxD
	lp+0DQgxCmtPEPtQoVv6GelRJxnRq6bJrhRIkQcZQvt5i4N2Wz8SU4taHmiowZp7HCEg9vJquOf
	EKHtMPKK4wQawQqcq8FEEOUS1/I7oX4fZQgtnNQ45T44fa0JpPJ69Ky4Ceeig+VUlMobxAAnRND
	Oy6CtcaCGKD9eweBpiYa0KOHOsOpsmcNmA3RMkEUFIo6Ug89HQa44guuXjuqwfqg/VqdDXUpMaT
	Wls9o8rvYWZHha+8jw=
X-Received: by 2002:a05:6a21:6e0c:b0:389:8f3f:50ce with SMTP id adf61e73a8af0-398c612795emr1755090637.56.1773222597656;
        Wed, 11 Mar 2026 02:49:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:49:56 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/prime: Limit scatter list size with dedicated DMA device
Date: Wed, 11 Mar 2026 17:49:25 +0800
Message-ID: <20260311094929.3393338-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311094929.3393338-1-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_024959_487858_199D1434 
X-CRM114-Status: GOOD (  13.93  )
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

If a dedicated DMA device is specified for the DRM device, then the
scatter list size limit should pertain to the DMA device.

Use the dedicated DMA device, if given, to limit the scatter list size.
This only applies to drivers that have called drm_dev_set_dma_dev() and
are using drm_prime_pages_to_sg() either directly or through the SHMEM
helpers. At the time of this writing, the former case only includes the
Rockchip DRM driver, while the latter case includes the gud, udl, and
the tiny appletbdrm and gm12u320 drivers.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 51fdb06d3e9f..9b44c78cd77f 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -859,7 +859,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	if (dev)
-		max_segment = dma_max_mapping_size(dev->dev);
+		max_segment = dma_max_mapping_size(drm_dev_dma_dev(dev));
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
 	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
-- 
2.53.0.473.g4a7958ca14-goog


