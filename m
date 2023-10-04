Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41165E7B5E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZldOxV+c4bwKc6J0kQAYnC3fAIMV5HICSvouxRGQ9mg=; b=ooVoHsW0ChmLh3jYVA48Ppe1/A
	G//uIqYW0aaqck7lK/ywLGpXJJwYXJTXkq5/zVQ9djU/7UE2NhtfNheLqbeyKP6ZFegq/fDotGiSU
	doeGguksI1kMEvp5Yit/yDbDZaL3Gi+Sts/gvMnTgoWzXiG0D27HT6ulLg/kFh9ygdhWrxivkHifh
	atljgurm5UVw4HkBa8zYsls7mzC9TT3z1tl7DyVGCKjnjZMfONQ4qbF2joKrFIMhfXQw5soYMM9cJ
	6QuTTQToDB9jj932I7bhBlpW64n6HH/g5v3kQckmIAyu620OCtcz3y0OujDUuqM9mVdel9LsXMyiM
	uFzjYWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyRi-00H7XV-0C;
	Wed, 04 Oct 2023 09:45:34 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxJ4-00Gq9p-36
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Oct 2023 08:32:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c60f1a2652so5527495ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Oct 2023 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696408351; x=1697013151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZldOxV+c4bwKc6J0kQAYnC3fAIMV5HICSvouxRGQ9mg=;
        b=K9QI8prxs7FcvFkMmfpMHEOu5DEb7og1fVkRAQnWv6Ea4a6wDt9eHz9BL8M29a3LfQ
         2m1RnlplGh7JWVL9uqemryYlQFYKq6z6ukoZYR4Z6R4mw3SAt5os6ih4bd7Ij7abwdBo
         X4VQy7zZ5v/ysmBAt32LugQFIUreyYfJCyg3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696408351; x=1697013151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZldOxV+c4bwKc6J0kQAYnC3fAIMV5HICSvouxRGQ9mg=;
        b=r/55sty8PG1Pe/shTSyCjtmPoyWq8Z8Jk/w0q2mGILGPbco3bFJYnTeX+GLNcwEgAo
         OnzPmLKKwNrKFkCNq5GcnmE0+i+Y++VGFGtbTe2xD86cWEElpPOunFQe09Gn3sKOCgci
         GXSQLzQAU5h+5z2qcgyBdWkzoYmwKs46i0IPkYaf7dmyuOLirTl21h+twvjehKCJK2Sf
         t6+Zr7VS8WfJHKE1ShSSoqcue8egtiBCqGcWp/YzMiK7Cl4QcLIi0HfXJnTJrlEu/zW0
         Pi5IyQeYq3hOu0J0j5VIjaGBTsTF6v/Ntjw/o709uy3Rhp+FPXCKluo6pL0i6LcyzHiM
         vlTw==
X-Gm-Message-State: AOJu0YxVpaZ95Iqbbf4qt71RfoTaURLpqLqAoa4eIYsz1c/+b4L53kYh
	hH95lTe2hlB1D9lqnSNf0gDrwA==
X-Google-Smtp-Source: AGHT+IHPFtFRpDAbBWYZ0AkQ+t6cKaHbihDnGlYJ+Lg4L83KqHlHsnttPEhpVTVbh8QLQYPAN7bkZA==
X-Received: by 2002:a17:902:db11:b0:1b8:8682:62fb with SMTP id m17-20020a170902db1100b001b8868262fbmr8840475plx.4.1696408351467;
        Wed, 04 Oct 2023 01:32:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:eff2:d66d:cbf7:f41b])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902b28b00b001b890009634sm3015940plr.139.2023.10.04.01.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 01:32:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/mediatek: Correctly free sg_table in gem prime vmap
Date: Wed,  4 Oct 2023 16:32:24 +0800
Message-ID: <20231004083226.1940055-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_013235_014474_4CB65F63 
X-CRM114-Status: GOOD (  15.68  )
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

The MediaTek DRM driver implements GEM PRIME vmap by fetching the
sg_table for the object, iterating through the pages, and then
vmapping them. In essence, unlike the GEM DMA helpers which vmap
when the object is first created or imported, the MediaTek version
does it on request.

Unfortunately, the code never correctly frees the sg_table contents.
This results in a kernel memory leak. On a Hayato device with a text
console on the internal display, this results in the system running
out of memory in a few days from all the console screen cursor updates.

Add sg_free_table() to correctly free the contents of the sg_table. This
was missing despite explicitly required by mtk_gem_prime_get_sg_table().

Also move the "out" shortcut label to after the kfree() call for the
sg_table. Having sg_free_table() together with kfree() makes more sense.
The shortcut is only used when the object already has a kernel address,
in which case the pointer is NULL and kfree() does nothing. Hence this
change causes no functional change.

Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Please merge for v6.6 fixes.

Also, I was wondering why the MediaTek DRM driver implements a lot of
the GEM functionality itself, instead of using the GEM DMA helpers.
From what I could tell, the code closely follows the DMA helpers, except
that it vmaps the buffers only upon request.

 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9f364df52478..0e0a41b2f57f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -239,6 +239,7 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	npages = obj->size >> PAGE_SHIFT;
 	mtk_gem->pages = kcalloc(npages, sizeof(*mtk_gem->pages), GFP_KERNEL);
 	if (!mtk_gem->pages) {
+		sg_free_table(sgt);
 		kfree(sgt);
 		return -ENOMEM;
 	}
@@ -248,12 +249,15 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
 			       pgprot_writecombine(PAGE_KERNEL));
 	if (!mtk_gem->kvaddr) {
+		sg_free_table(sgt);
 		kfree(sgt);
 		kfree(mtk_gem->pages);
 		return -ENOMEM;
 	}
-out:
+	sg_free_table(sgt);
 	kfree(sgt);
+
+out:
 	iosys_map_set_vaddr(map, mtk_gem->kvaddr);
 
 	return 0;
-- 
2.42.0.582.g8ccd20d70d-goog


