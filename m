Return-Path: <SRS0=MjbJ=ZH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0EE1C432C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2019 09:21:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 861192073B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2019 09:21:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtNwZ5Z7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="WfM8FyTO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 861192073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GD+XhFPdKQSXHo2xxOE24gKbJWo5Hzdpifcc1+Jcyww=; b=rtNwZ5Z7z8CtT/
	G5XwIDeG5/GtKH3b7TPxGeE1jnutH5j13Sloghw7mSxcSbiURCX1XggV/LeEnkWGmg+oxkilINv/I
	DqoFOtawGv6NVC35BMMYOpK2PlkibNftK0GMMLkIPBInbU/HCbIdhzXuBXAWN9mUPs4kYQQ7w84lJ
	VVoq0ERulvdyK2SY+Au6FyvuAkBHD4dWrTR8bHD4nqT+0zuvcw/VkgkYCagpBZ3skXbX1HyWDDp0u
	U3jgMUAk0erAwL8XAL33YWDB2cHx4a210d0jzyyJANBptbRLLFrpLRXWitcilWfbxBvrFwioRtbZW
	oz5slsk8nAPq5KnxqSuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVXnR-0007W8-Sf; Fri, 15 Nov 2019 09:21:41 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXnH-0007Ms-HK
 for linux-mediatek@lists.infradead.org; Fri, 15 Nov 2019 09:21:33 +0000
Received: by mail-wr1-x442.google.com with SMTP id z10so10116464wrs.12
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Nov 2019 01:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tGjIM2+uUqMORVIasokc3/CvFp+wprfDfEiecNEi+4o=;
 b=WfM8FyTO7ypE+YMQNKDxQoBKIEgYOliOhA8IHmPKabbGB3iVqRcp9+2Yiz95KojpyN
 5RRyo1OFsYseOMJj0ngbATa4TKXxD9cw6JBnsUbQKpNyC8sS9fwiLVyMISJSJt3Y2mwY
 EujkOzvZYc9UjWmsXzRIqw8m1ryOAtGIjx3UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGjIM2+uUqMORVIasokc3/CvFp+wprfDfEiecNEi+4o=;
 b=Yh+0002J/SxL6J7+XuSJgPwu2k8OhfyplfCVdbBIJTM9QlCLYjz06D2BMbYUcD99Pf
 TSMW18d6eBU6XtKhIulJyL8E4wyoNslGwpTWTmZeF3epXFFJfpVWgvubI0Viz2Op9n7m
 BmU+EQa+dHWEaR1NmC7KFgVc0g1tlNCHCUm31owtoViovJweEJntlvbBWZnyDlN1gXpP
 SfWEIZxp5M1im4f75MkB+kNo3wIXi+lPEpQcNY2WeoAtuslnUmYiWJqc/YlKACzUeeC0
 q2Yrf6SnLSayHDyDvlFojp9FNpWzB1zgS3neSXvC3JGx31DZiftUr6HUTvMGhOlm43Sp
 KETg==
X-Gm-Message-State: APjAAAWyoLFkWmiD/pdo7XDuv6LH5brPKCYCr0GOFBzEchPouw+CLVcq
 JjQC1ZpQXeAH6v1VWUrBVwkLpQ==
X-Google-Smtp-Source: APXvYqwnf2/MQXZ679hFBEv5ABxJG5pWkcrTe0XZXAxsR67X5YWu3QoXY4fHOvAlU81ah5/AgJgOLA==
X-Received: by 2002:adf:e883:: with SMTP id d3mr13501518wrm.197.1573809690172; 
 Fri, 15 Nov 2019 01:21:30 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 11sm8987506wmi.8.2019.11.15.01.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 01:21:29 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/mediatek: don't open-code drm_gem_fb_create
Date: Fri, 15 Nov 2019 10:21:15 +0100
Message-Id: <20191115092120.4445-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_012131_576920_0749B032 
X-CRM114-Status: GOOD (  16.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Aside: There's a few other fb_create implementations which
simply check for valid buffer format (or an approximation thereof),
and then call drm_gem_fb_create. For atomic drivers at least we could
walk all planes and make sure the format/modifier combo is valid,
and remove even more code.

For non-atomic drivers that's not possible, since the format list for
the primary buffer might be garbage (and most likely it is).

Also delete mtk_drm_fb.[hc] since it would now only contain one
function.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 16 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_fb.c    | 92 ------------------------
 drivers/gpu/drm/mediatek/mtk_drm_fb.h    | 13 ----
 drivers/gpu/drm/mediatek/mtk_drm_plane.c |  1 -
 4 files changed, 15 insertions(+), 107 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_fb.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_fb.h

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 84d14213d992..2b1c122066ea 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -16,8 +16,10 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -27,7 +29,6 @@
 #include "mtk_drm_ddp.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_fb.h"
 #include "mtk_drm_gem.h"
 
 #define DRIVER_NAME "mediatek"
@@ -115,6 +116,19 @@ static int mtk_atomic_commit(struct drm_device *drm,
 	return 0;
 }
 
+static struct drm_framebuffer *
+mtk_drm_mode_fb_create(struct drm_device *dev,
+		       struct drm_file *file,
+		       const struct drm_mode_fb_cmd2 *cmd)
+{
+	const struct drm_format_info *info = drm_get_format_info(dev, cmd);
+
+	if (info->num_planes != 1)
+		return ERR_PTR(-EINVAL);
+
+	return drm_gem_fb_create(dev, file, cmd);
+}
+
 static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
 	.fb_create = mtk_drm_mode_fb_create,
 	.atomic_check = drm_atomic_helper_check,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.c b/drivers/gpu/drm/mediatek/mtk_drm_fb.c
deleted file mode 100644
index 3f230a28a2dc..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_drm_fb.c
+++ /dev/null
@@ -1,92 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2015 MediaTek Inc.
- */
-
-#include <linux/dma-buf.h>
-#include <linux/dma-resv.h>
-
-#include <drm/drm_modeset_helper.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_fourcc.h>
-#include <drm/drm_gem.h>
-#include <drm/drm_gem_framebuffer_helper.h>
-
-#include "mtk_drm_drv.h"
-#include "mtk_drm_fb.h"
-#include "mtk_drm_gem.h"
-
-static const struct drm_framebuffer_funcs mtk_drm_fb_funcs = {
-	.create_handle = drm_gem_fb_create_handle,
-	.destroy = drm_gem_fb_destroy,
-};
-
-static struct drm_framebuffer *mtk_drm_framebuffer_init(struct drm_device *dev,
-					const struct drm_mode_fb_cmd2 *mode,
-					struct drm_gem_object *obj)
-{
-	const struct drm_format_info *info = drm_get_format_info(dev, mode);
-	struct drm_framebuffer *fb;
-	int ret;
-
-	if (info->num_planes != 1)
-		return ERR_PTR(-EINVAL);
-
-	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
-	if (!fb)
-		return ERR_PTR(-ENOMEM);
-
-	drm_helper_mode_fill_fb_struct(dev, fb, mode);
-
-	fb->obj[0] = obj;
-
-	ret = drm_framebuffer_init(dev, fb, &mtk_drm_fb_funcs);
-	if (ret) {
-		DRM_ERROR("failed to initialize framebuffer\n");
-		kfree(fb);
-		return ERR_PTR(ret);
-	}
-
-	return fb;
-}
-
-struct drm_framebuffer *mtk_drm_mode_fb_create(struct drm_device *dev,
-					       struct drm_file *file,
-					       const struct drm_mode_fb_cmd2 *cmd)
-{
-	const struct drm_format_info *info = drm_get_format_info(dev, cmd);
-	struct drm_framebuffer *fb;
-	struct drm_gem_object *gem;
-	unsigned int width = cmd->width;
-	unsigned int height = cmd->height;
-	unsigned int size, bpp;
-	int ret;
-
-	if (info->num_planes != 1)
-		return ERR_PTR(-EINVAL);
-
-	gem = drm_gem_object_lookup(file, cmd->handles[0]);
-	if (!gem)
-		return ERR_PTR(-ENOENT);
-
-	bpp = info->cpp[0];
-	size = (height - 1) * cmd->pitches[0] + width * bpp;
-	size += cmd->offsets[0];
-
-	if (gem->size < size) {
-		ret = -EINVAL;
-		goto unreference;
-	}
-
-	fb = mtk_drm_framebuffer_init(dev, cmd, gem);
-	if (IS_ERR(fb)) {
-		ret = PTR_ERR(fb);
-		goto unreference;
-	}
-
-	return fb;
-
-unreference:
-	drm_gem_object_put_unlocked(gem);
-	return ERR_PTR(ret);
-}
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.h b/drivers/gpu/drm/mediatek/mtk_drm_fb.h
deleted file mode 100644
index eb64d26001c6..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_drm_fb.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2015 MediaTek Inc.
- */
-
-#ifndef MTK_DRM_FB_H
-#define MTK_DRM_FB_H
-
-struct drm_framebuffer *mtk_drm_mode_fb_create(struct drm_device *dev,
-					       struct drm_file *file,
-					       const struct drm_mode_fb_cmd2 *cmd);
-
-#endif /* MTK_DRM_FB_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 3b0cc91c7023..540ef2faa40a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -13,7 +13,6 @@
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_fb.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
 
-- 
2.24.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
