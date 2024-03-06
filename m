Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3799C54E41
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 20:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=awa1dQXZmpY5VwV6yZnL1TS+1i6+6YFAvsCFb4B//5A=; b=Gv+nxmz2gHVlDG
	+4PmuHBUALTrY3EZ+mC7MEOb0tLQE9YRL4MJHkN7b3fXUBeo96R4bPxFFzgxnonhkwQXKJ+x/820g
	dzKSl6Q5CzsuaTw0RX3UQHYApwe0gEGDDMmM83Z3t/+fqh8Ja8SOmQaNOWgQYmusjxrSy93CeSs7R
	Q14wvF0Xs4DrdLdEf6dLW2Ba7POTcovAwlvSwEy0M4jjJZqV6/GGYOeYHksVWR3EUGSwOS58nwRKa
	MVTMW3ZuSXHAQzvxbbJYdI5/aJk0CJawaXvNYIFtua1fswSKV6x3SBRsoLusl0YYqkIdD45yXLXSJ
	b1ZcB1fNdeUpjRiAfP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhy0r-00000001pih-002Y;
	Wed, 06 Mar 2024 20:37:17 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhy0n-00000001phf-1zr8
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Mar 2024 20:37:15 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5a14dfa68eeso60821eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Mar 2024 12:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709757431; x=1710362231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awa1dQXZmpY5VwV6yZnL1TS+1i6+6YFAvsCFb4B//5A=;
        b=d8QFlgoA0jUFSYPfDen1q6LNF6TjphpFSH2u890rD9X459tJkFeEcnVftESqyzYvvA
         b/2iWRESt3Lf8j/xJPxRuvGTRhwnOBzT+y0K7CkGC0/gED4cBktN5KczWp+PpJZS8utg
         g/7nRZ8SEG9t8ZO+HtLKU92pbKiram2RqU/yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709757431; x=1710362231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awa1dQXZmpY5VwV6yZnL1TS+1i6+6YFAvsCFb4B//5A=;
        b=MweYAx8GcL7NQ9nt3+eGNiL2P3/pdiAJnPKRyKN3b+r4Mxy/1eOlvdAbAiNRvfbuJ8
         I6PkQUPrXEMFjMzELDl3Glal9IOE8DTcNdN1lsPZYY4Zq35aQulukxYS9bum0VbWnrxM
         ZNXOp4STuPF8cRBvpNKAttdRGntDMOtMhA41f0ZiqrVbFTzOXFlLlr32JNp9k6nKEgr2
         UW6itOWJLKQqUg9NmsIzFqmAKIp7DcxLpaPQojU4qI7s5910O4ndGGdU3EqlxVtLtjv3
         rw+V9HKuS0gDHhnzM4YCZdy6kIO69/MiNo5K5jqB/D0/CrsHdTHwrC/Oxos2N1Q3hPIe
         TkMQ==
X-Gm-Message-State: AOJu0Yw5G6bFFQzEDRPEF5AazfZyVVqWf1giKr259ghpSTSCxB26H/QK
	9ATrbCoj7SNljBNS9a7RSmz6cNf/0/kjvx+U4MMTOwKMam8drPDwY4uFqG7hhWlgejCFzMyhHXw
	=
X-Google-Smtp-Source: AGHT+IHN/Wg36ruErxYWj1YUE8/W5ZbCAiEK4i9KqiK0BiH5Rh+ZCVJOegwQRIXPbUka2mryiijX0A==
X-Received: by 2002:a05:6358:649d:b0:17c:1b81:136f with SMTP id g29-20020a056358649d00b0017c1b81136fmr7025517rwh.32.1709757430926;
        Wed, 06 Mar 2024 12:37:10 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:259f:7f7f:41a:9afb])
        by smtp.gmail.com with ESMTPSA id ay12-20020a05620a178c00b007884435812csm337535qkb.54.2024.03.06.12.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 12:37:10 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Add 0 size check to mtk_drm_gem_obj
Date: Wed,  6 Mar 2024 15:37:02 -0500
Message-ID: <20240306203702.3924719-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_123713_777927_1698C058 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com, Justin Green <greenjustin@chromium.org>, dri-devel@lists.freedesktop.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a check to mtk_drm_gem_init if we attempt to allocate a GEM object
of 0 bytes. Currently, no such check exists and the kernel will panic if
a userspace application attempts to allocate a 0x0 GBM buffer.

Tested by attempting to allocate a 0x0 GBM buffer on an MT8188 and
verifying that we now return EINVAL.

Signed-off-by: Justin green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 4f2e3feabc0f..ee49367b6138 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -38,6 +38,9 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 
 	size = round_up(size, PAGE_SIZE);
 
+        if (size == 0)
+		return ERR_PTR(-EINVAL);
+
 	mtk_gem_obj = kzalloc(sizeof(*mtk_gem_obj), GFP_KERNEL);
 	if (!mtk_gem_obj)
 		return ERR_PTR(-ENOMEM);
-- 
2.44.0.278.ge034bb2e1d-goog


