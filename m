Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB82C46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 22:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNVirr7Mh55HoZPwbq9lUXgYo3JdiDpzBy8o0MLFF70=; b=aWkPmXMmtZzE489v/Vh1Z0YTRA
	DY2FJjO7OZYrbuWN0anFyKP/V3nqyuphrXXjdfWjRKP8pO+s0Ouwx2N3y30ydO9DGImtLOn+WbNQn
	K+4Iy2NOa8w+INmLvFog9AS6zxLuocGv7Ic+xptEA/8SVbuSLZmiVBjAVj9b/LnAs7tEVzYOzKTj2
	GJS+vIH7Q37nhg9W7QQIZntzpCMIBHkZgOoYNS3JDOLkNWjLlnW3U+DKtqnKvRZU+jrRYwqHZ2/EJ
	1G+ru9RJiM9kdAxvYk6O0tykuntMuKW5jxGxutawLmdSo50hkTe97KpDVpr8Sp8bgwWf5jcx6yqi7
	75rG7YeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdaY-007Uc0-17; Thu, 19 Jan 2023 22:40:54 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdaU-007Uap-Fy; Thu, 19 Jan 2023 22:40:51 +0000
Received: by mail-pf1-x431.google.com with SMTP id i65so2690681pfc.0;
        Thu, 19 Jan 2023 14:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rNVirr7Mh55HoZPwbq9lUXgYo3JdiDpzBy8o0MLFF70=;
        b=aFrVtm751bC7Wj4QpfEcse3y80R5JKQlg6yJDGcYfJqg2vUWXjOnVuGkBhuMHVoMc9
         7k/nRUyAdZqum1UxhknqAz9ycBaiPKFJu7CqmLucaeAmSm6BxwomU6SpJAMKByRA6M/f
         yuVwoVStRilq5e6F5twMsddLu7ppayYGugLAXQxZjK51e7Vsb/JF4FgS/uIjV5plMacP
         v3+dpRBC9fBa5K6FapBglGnZuEzFsx7mZ+rjFj9awLRsCudjmZ92Jd0mMW1S8ZyDfRvk
         TztGrLmb/oVmd9wmiKG7Xf1EADYPseot/SOSBFMV4cZ3bGd8ZuBygXjxyNolq6C3a1MD
         Sr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNVirr7Mh55HoZPwbq9lUXgYo3JdiDpzBy8o0MLFF70=;
        b=PTXRxCJsAS99iydROQPCc2+CTqYhRS9KTJr9ra9ky9slqWrDR0h66r9TGAGloz99k+
         issIbWOlrkC7BPgjSlV5wqS9gbKo0H9MbVikZ5k0jPILDgpiWvU7i1W6IYrAAr662T+j
         PpIPjZZCLYR1PzkkNEbGcYTEf00pzJVqqqMviMpNKCOz46p7EOxq725hez61t/k2rwwc
         Ecg2Yg7P4UrkOXYtRy3AgWY8tykDqwZD+pFEGjXU53yB8uaUufuaKqqBsxlB8RtrMVbM
         l8j7ZL4a/AyEg5cWVzmO8arACUWSqNBUg1kOd9Td5CNHZXS7JiPs+so4YeBaVCtCMAc6
         gbvQ==
X-Gm-Message-State: AFqh2koKI+rfoeiL9e6OOfvjsfu4ELz0wYHqwzlWb8RjOqXQGCJ+RocP
	PWD4dHvHycBkmnVyTMA0Ozw=
X-Google-Smtp-Source: AMrXdXuTk57vqfyycosJjc83ytHzfOrTz8oBlyWzkuEA4oYwVi918dWiZhgHT9pQS5GsV8DtjUo1+g==
X-Received: by 2002:a05:6a00:188b:b0:576:de1:cd32 with SMTP id x11-20020a056a00188b00b005760de1cd32mr16243662pfh.0.1674168048178;
        Thu, 19 Jan 2023 14:40:48 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
        by smtp.gmail.com with ESMTPSA id 63-20020a621942000000b0056d98e359a5sm24553533pfz.165.2023.01.19.14.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 14:40:47 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org (moderated list:DRM DRIVERS FOR MEDIATEK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] drm/mediatek: Remove dependency on GEM DMA helper
Date: Thu, 19 Jan 2023 14:40:52 -0800
Message-Id: <20230119224052.2879106-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_144050_576582_5809FEEE 
X-CRM114-Status: GOOD (  11.56  )
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

From: Rob Clark <robdclark@chromium.org>

It appears that the dependency on the DMA helpers was only for
drm_gem_dma_vm_ops.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/mediatek/Kconfig       | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 7 ++++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 369e495d0c3e..b451dee64d34 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -7,7 +7,6 @@ config DRM_MEDIATEK
 	depends on HAVE_ARM_SMCCC
 	depends on OF
 	depends on MTK_MMSYS
-	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 47e96b0289f9..9b3d15d3a983 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -16,13 +16,18 @@
 
 static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
+static const struct vm_operations_struct vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
 static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
 	.free = mtk_drm_gem_free_object,
 	.get_sg_table = mtk_gem_prime_get_sg_table,
 	.vmap = mtk_drm_gem_prime_vmap,
 	.vunmap = mtk_drm_gem_prime_vunmap,
 	.mmap = mtk_drm_gem_object_mmap,
-	.vm_ops = &drm_gem_dma_vm_ops,
+	.vm_ops = &vm_ops,
 };
 
 static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
-- 
2.38.1


