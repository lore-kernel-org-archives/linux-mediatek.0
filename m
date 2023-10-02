Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599A6E784AF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZEAIvCKjKxg1y/mOTHgOyfszBWrD2m6dpbpnehzSJo=; b=e6PvoP5HRCcnEAm7Ej8vx52NIC
	UCB/Meulm5M8X1Wj88AAmC0blEPdZk79+Hn4WSJ6LTDmOoZGjKJRV8bkNAFowgcvPOXXsA2bHePj4
	tOd6st01RX2Z77rUnmyezO+UU84RR9H34cUnaUBjL27nphcIwNZKmqTYodcszSlysX5Rm2dJ0xcKj
	Gq2nV9Msf7EmtWAdU77z7mXkMF5SOwj64aQ2WzMXXtkeLWDJGqaNdPCg+egJ1LtTdORGHxFlob102
	XUo1IxN+2LFmXXLovoJbtGrqEdlnWRuAIqqtQIZ5ajdGc8cli+9k789cAMB4s8qq8EKcJXVnfi1t2
	DmweqkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnF6r-00CDi4-33;
	Mon, 02 Oct 2023 09:21:01 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnF6o-00CDfk-1V
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 09:20:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-692a885f129so11599201b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Oct 2023 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696238457; x=1696843257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZEAIvCKjKxg1y/mOTHgOyfszBWrD2m6dpbpnehzSJo=;
        b=MdsIbIk2hn34Fr/l6L4eFpLQHLEOu/L2iSWmoYYalgI/Cvlx9UB6AzorivpNxklKA2
         63hCC5DjIInnIaio8ueSix2v4ET0So+mwBKytISHCUqJXxHVgKomlnE7jqbkapKGFIgF
         2srLJ3PJ/t/Xz8vAQ6KaV9jHwVSGdD5zyEeFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238457; x=1696843257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZEAIvCKjKxg1y/mOTHgOyfszBWrD2m6dpbpnehzSJo=;
        b=PdOVU3WPS1K2mFtGT00vUY9MAN9wWJXR+p9crLa1sfQf2IhDYo6ciyRC29+1mL6uNP
         sFujcaCQmyy1J58FvDGljRNzs/4dStXfns6fdxj2gcaUh+3hW+17ikd0F4iqxgnWc4s0
         v8EBfpJ0EA/bdpDIEyOKG88qFvBndHRbuWw7EYL3rVKk7vQuaGALPUjgEouTIoqXoU2J
         OwZw+Bu6avS16BBEIII8VM92eC3M9ZR8dgNmeI+luP4bVXfwdQQeaFgLy9opfwtkPMaI
         z7QTo3JYsxNoP1Pz9xGhQWoIFoYNLw0pBA9K+Shysx+AqbB029/HiI5Q5Bpi+Sc0RXyj
         jRzw==
X-Gm-Message-State: AOJu0Yxb2LPNI0rN/VW/jdMB5VHVVVIBmX9ZIUcvWj0PZHfBFlHRxgTe
	JmUFCS0ZdFpf9/39J/PGfP++dsmQuxRIIi4SBpE=
X-Google-Smtp-Source: AGHT+IH+tG+Aai4uuggMfO+rGGTM2xMUkfQN5lWyX+UpJgbKOheJR2hXD3NjLu95wgcSCgr7dLlOhA==
X-Received: by 2002:a05:6a00:21ce:b0:68f:c865:5ba8 with SMTP id t14-20020a056a0021ce00b0068fc8655ba8mr10744096pfj.18.1696238457377;
        Mon, 02 Oct 2023 02:20:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:16ed:daa5:ae8c:12dd])
        by smtp.gmail.com with ESMTPSA id x26-20020aa784da000000b0068c0fcb40d3sm19164936pfn.211.2023.10.02.02.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 02:20:57 -0700 (PDT)
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
Subject: [PATCH] drm/mediatek: Correctly free sg_table in gem prime vmap
Date: Mon,  2 Oct 2023 17:20:48 +0800
Message-ID: <20231002092051.555479-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_022058_503700_F2382EE8 
X-CRM114-Status: GOOD (  13.15  )
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

Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Please merge for v6.6 fixes.

Also, I was wondering why the MediaTek DRM driver implements a lot of
the GEM functionality itself, instead of using the GEM DMA helpers.
From what I could tell, the code closely follows the DMA helpers, except
that it vmaps the buffers only upon request.


 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9f364df52478..297ee090e02e 100644
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
@@ -248,11 +249,13 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
 			       pgprot_writecombine(PAGE_KERNEL));
 	if (!mtk_gem->kvaddr) {
+		sg_free_table(sgt);
 		kfree(sgt);
 		kfree(mtk_gem->pages);
 		return -ENOMEM;
 	}
 out:
+	sg_free_table(sgt);
 	kfree(sgt);
 	iosys_map_set_vaddr(map, mtk_gem->kvaddr);
 
-- 
2.42.0.582.g8ccd20d70d-goog


