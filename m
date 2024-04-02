Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BC4CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 07:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S0aDPStcWplmgXtw121bO/EPEa2tJmV5qvIMipnIN9E=; b=kH6c1WnL8oZlf7KwBNQBd7vUMk
	cYrknKG4OIkqEc0r9IxTa/tQf1A/rnM+7EximNDApB7SkO42LQMLlsUWStIFBQM9Ou9l0CSWRsiX1
	OuL1+HwXCXWx08HHs9+VWNVqTVqWkPH46lcuB7NGPAV2WN77kkjkYLEkv76DdsPujIjQTlzy4gOSf
	bQyRk3BBfvETxJS2uHaSHECSEF0sx07E8PO2XkHtIJwmupyXh+O2KzGk77H5AcdrljuAwICwoQY/2
	0w39gJsmd8lvG0Ttt3hVHh4Ld/Z6ohfttk4RiSy6P6V7rV5ddfRwrgGV+6k7zKKUyHNLRvBO+PSCu
	Fzy9yHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrYyK-0000000A8nI-32xJ;
	Tue, 02 Apr 2024 07:54:20 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrYy7-0000000A8bf-3Qsa
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 07:54:13 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a46cd9e7fcaso615360966b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712044445; x=1712649245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0aDPStcWplmgXtw121bO/EPEa2tJmV5qvIMipnIN9E=;
        b=ETdaEYIHKAC1Vqqg4q+oD1s6PM0qBvaCTFiHhJjFMzOqLqLBwgoDrT7ihEmCKlV9Wh
         QGy696/ba2snth2TqIoe6c8PHjKP7ul2DsQo8RSSguxAAjib01DxSvoCIS/wH+8zfFMd
         uhPi1HoKhi+qiq4bB/tFfeO3falphrc5ZnKUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712044445; x=1712649245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0aDPStcWplmgXtw121bO/EPEa2tJmV5qvIMipnIN9E=;
        b=xNAGRLKSaU9ggyfwRkpSbbVtYNkECsbXcurFLUXjMDA3YiwjLSrOVcd7MMfKANBvG5
         ytcNjWZTGAoC7qhJpIeSAwsYcA4YFAzG72hzAhJhp/BudY4RQxFTaK6AVP+w9nWgZlao
         luV0sPXI2y9ZvnytK220nLIO+jBGFqGK2XOgDiQc828XxSwwmSiaSCGXaP2yGDNg/dhp
         1Cb8YWLKpEIt7zfgGcnNiielXUo3b9oQsOOX7//WKrpMcBlFEn/wYMQsHzWE8cZRBOPm
         d8/j+g+KQ4yi2Fcb36C6Mc+5+bqqc/dAATPcT588T7HsJ8zM1D+PwcvbCqNMriXfhuYI
         3DoA==
X-Forwarded-Encrypted: i=1; AJvYcCUoOtBnUjxdcA0Cjsd7iIYaqo3RVcozONm6MFPnT5kbLTEGo4zwb7ett406x3bie0MqiEQ1GmN5BL3Cqh4CnA3EhgFHjpNMbxFaEmcpWvT09y8g
X-Gm-Message-State: AOJu0Yxh7wW20mnTB8UCrhwXbfn9F3WJt9hVEKDj4fP9vNknhVIinxYc
	CjBFfXps49KDmwdauPPPQuswtkzr6OM3Ik9m9b9WoK7SFUunyK2geWVh9Qzxdw==
X-Google-Smtp-Source: AGHT+IEO3o3WE2Q6ehT7FdVQbjibduradq+vM90LrmVRkZTLj+wI/38lnWD5V3+vj2JRKKZyNZQGQQ==
X-Received: by 2002:a17:906:795:b0:a4e:8e54:7962 with SMTP id l21-20020a170906079500b00a4e8e547962mr403527ejc.41.1712044445152;
        Tue, 02 Apr 2024 00:54:05 -0700 (PDT)
Received: from orzel7.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id k5-20020a170906a38500b00a4761c94a5esm6227359ejz.107.2024.04.02.00.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 00:54:04 -0700 (PDT)
From: Wojciech Macek <wmacek@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH] drm/mediatek: Add RENDER capability to DRM device
Date: Tue,  2 Apr 2024 07:53:52 +0000
Message-ID: <20240402075352.3147747-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_005408_570532_8D7493F7 
X-CRM114-Status: GOOD (  10.50  )
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

DRM device shall create /dev/dri/renderXXX entry
to allow ChromeOS VMs to access the OpenGL rendering
offload.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74832c213092..afa4d6391b08 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -585,7 +585,8 @@ static struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
 }
 
 static const struct drm_driver mtk_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC |
+			   DRIVER_RENDER,
 
 	.dumb_create = mtk_drm_gem_dumb_create,
 
-- 
2.44.0.478.gd926399ef9-goog


