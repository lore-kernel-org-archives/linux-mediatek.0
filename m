Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707D9C25B7A
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 May 2024 23:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VmR6jlRXpOCtlALHy2T0+cuGx0Qi/VITbN/ISJH/Ng=; b=eCGCXoXqixRrpWlwQm1Fg38aiB
	Voxj6AZjep8imMqlfG6Hv/C7XQxg4qywzM7uSFqsP+SLgH/S6gP9+GEgZsVwN40u0PFdNsdc6k+g9
	NyxhYc3W1Hlybv63ZL98QSYoyvjwC21/b2Bv63/XaD7VeiMB+tXMSwQ8wHOk9BZ176sd/Oh8tL30L
	Bw2CAXh0dQrFaJCItA/B/W4WNWsnbM54OVz6ivqmdrsBaxNypcWDrpNac1T1H2nt7Dr3/mnKZAh1X
	MsSe0LGarhlnLXU0it4807kvYlvOK4b/bbX8YAU4Ta3Vg3f9kDAc9vZggwAJG/IYgfBRk55YVOqaL
	qoqixD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0qT-0000000BsvB-2uPO;
	Sat, 25 May 2024 23:30:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0pY-0000000BsI9-117l;
	Sat, 25 May 2024 23:29:44 +0000
X-UUID: a4535bda1aee11ef82c84f6416ccf2f3-20240525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5VmR6jlRXpOCtlALHy2T0+cuGx0Qi/VITbN/ISJH/Ng=;
	b=dhTGVw77+tcBk+o3ayDHj9mNMDfUHb2Of7v2rmAv9QaE0xBJWh5a6po1+pXPmOmGHKAXlRF5Vnswmq7BZn7XmgXyenTAkLfK2lIv/ugVxZTElBVkkBfGGmxDiKhk6f5a8vh+JT9HdDxykfSBX2jrUrvNtPS/DrhMPiQ3EeWyWsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:0a5a28a9-7732-49f0-a548-294344a56164,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:e360cd43-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: a4535bda1aee11ef82c84f6416ccf2f3-20240525
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1518545843; Sat, 25 May 2024 16:29:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:29:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:29:30 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Maxime Ripard <mripard@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, Jason-ch
 Chen <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, CK Hu <ck.hu@mediatek.com>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v6 1/7] drm/mediatek: Add interface to allocate MediaTek GEM buffer
Date: Sun, 26 May 2024 07:29:22 +0800
Message-ID: <20240525232928.5524-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_162940_402095_5222E71E 
X-CRM114-Status: GOOD (  26.76  )
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

From: CK Hu <ck.hu@mediatek.com>

Add an interface to allocate MediaTek GEM buffers, allow the IOCTLs
to be used by render nodes.
This patch also sets the RENDER driver feature.

TODO:
Drop this path after we change all the usages of this ioctl to
DMA_HEAP_IOCTL_ALLOC in the user sapce.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 13 +++++++-
 drivers/gpu/drm/mediatek/mtk_gem.c     | 31 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_gem.h     |  8 +++++
 include/uapi/drm/mediatek_drm.h        | 46 ++++++++++++++++++++++++++
 4 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/drm/mediatek_drm.h

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b5f605751b0a..11e1555e9aa4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -23,6 +23,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/mediatek_drm.h>
 
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
@@ -570,6 +571,11 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 	component_unbind_all(drm->dev, drm);
 }
 
+static const struct drm_ioctl_desc mtk_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(MTK_GEM_CREATE, mtk_gem_create_ioctl,
+			  DRM_UNLOCKED | DRM_AUTH | DRM_RENDER_ALLOW),
+};
+
 DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
 
 /*
@@ -585,12 +591,17 @@ static struct drm_gem_object *mtk_gem_prime_import(struct drm_device *dev,
 }
 
 static const struct drm_driver mtk_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC |
+			   DRIVER_RENDER,
 
 	.dumb_create = mtk_gem_dumb_create,
 
 	.gem_prime_import = mtk_gem_prime_import,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
+
+	.ioctls = mtk_ioctls,
+	.num_ioctls = ARRAY_SIZE(mtk_ioctls),
+
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
index a172456d1d7b..91f6cfa3f1b7 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -5,9 +5,11 @@
 
 #include <linux/dma-buf.h>
 #include <linux/vmalloc.h>
+#include <drm/mediatek_drm.h>
 
 #include <drm/drm.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_prime.h>
@@ -286,3 +288,32 @@ void mtk_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 	mtk_gem->kvaddr = NULL;
 	kfree(mtk_gem->pages);
 }
+
+int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv)
+{
+	struct mtk_gem_obj *mtk_gem;
+	struct drm_mtk_gem_create *args = data;
+	int ret;
+
+	mtk_gem = mtk_gem_create(dev, args->size, false);
+	if (IS_ERR(mtk_gem))
+		return PTR_ERR(mtk_gem);
+
+	/*
+	 * allocate a id of idr table where the obj is registered
+	 * and handle has the id what user can see.
+	 */
+	ret = drm_gem_handle_create(file_priv, &mtk_gem->base, &args->handle);
+	if (ret)
+		goto err_handle_create;
+
+	/* drop reference from allocate - handle holds it now. */
+	drm_gem_object_put(&mtk_gem->base);
+
+	return 0;
+
+err_handle_create:
+	mtk_gem_free_object(&mtk_gem->base);
+	return ret;
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
index 66e5f154f698..b71a7e7b405a 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_gem.h
@@ -45,4 +45,12 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 int mtk_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void mtk_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 
+/*
+ * request gem object creation and buffer allocation as the size
+ * that it is calculated with framebuffer information such as width,
+ * height and bpp.
+ */
+int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv);
+
 #endif
diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_drm.h
new file mode 100644
index 000000000000..821f7a732365
--- /dev/null
+++ b/include/uapi/drm/mediatek_drm.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * Copyright (c) 2015 MediaTek Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _UAPI_MEDIATEK_DRM_H
+#define _UAPI_MEDIATEK_DRM_H
+
+#include <drm/drm.h>
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
+
+/**
+ * User-desired buffer creation information structure.
+ *
+ * @size: user-desired memory allocation size.
+ *	- this size value would be page-aligned internally.
+ * @flags: user request for setting memory type or cache attributes.
+ * @handle: returned a handle to created gem object.
+ *	- this handle will be set by gem module of kernel side.
+ */
+struct drm_mtk_gem_create {
+	uint64_t size;
+	uint32_t flags;
+	uint32_t handle;
+};
+
+#define DRM_MTK_GEM_CREATE		0x00
+
+#define DRM_IOCTL_MTK_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
+		DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)
+
+#endif /* _UAPI_MEDIATEK_DRM_H */
-- 
2.18.0


