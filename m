Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55005C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 04:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31EhFHcdvh6I8zTR8aPW9KUnz5o6QRT5gfMiB2LP8LQ=; b=MZyUfqljYq1DDRUR8tYlvMxm/i
	R5fI3yxA4T3tkdeu5jF505InEJrG66623KEOuchVBydszzKc/rHcJrlRzVZ4DMtI0ZuP8Ym3AVBdq
	YDoB26C4o8H8NlUs+G3I00aR7cTkOmK2EgiF0luWuztbN99blMLGwbADKacXtyGdMf3Z7iFTM80vh
	h6L/rgHtTq0MtsHMrSWPeBlVymEWuE2xpOBja7e8nLgXbjHpYEjdaWW8CH7lMAwrV5GSuujcW93JL
	1tY8ADTBU04g6yvOqvfnvcQMPvQklHzkw6nFy8NtN/sz+FkiQHIl84iDb29tjlTLB6e+zvqAsf6uP
	BOvUKnUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qumpO-006Pg8-0c;
	Mon, 23 Oct 2023 04:46:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qumpD-006Pbo-0y;
	Mon, 23 Oct 2023 04:46:01 +0000
X-UUID: 0bfb6a46715f11ee9b7791016c24628a-20231022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=31EhFHcdvh6I8zTR8aPW9KUnz5o6QRT5gfMiB2LP8LQ=;
	b=WwMMp0jcdJrRysuo3zbIt4J6tjL9lSAqNJkFiQCqEjmYIjXq6RP1issG3gjLzttMHp7rN3vmlF6WErVaLWqpWE8LgfB9BYqapJ4lDTjiM1bLj0zX698QzCa+eNzw0YeunY6fD02tdpoxdI7fYbDQvPePs/W0wwNuB1B+RwOd1B8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:36a3f994-ba82-430c-8c19-639a168e8208,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:400e8294-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0bfb6a46715f11ee9b7791016c24628a-20231022
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1487453937; Sun, 22 Oct 2023 21:45:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 12:45:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 12:45:50 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, "Jason-ch
 Chen" <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, CK Hu <ck.hu@mediatek.com>, Nicolas Boichat
	<drinkcat@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 01/11] drm/mediatek: Add interface to allocate MediaTek GEM buffer.
Date: Mon, 23 Oct 2023 12:45:38 +0800
Message-ID: <20231023044549.21412-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.975900-8.000000
X-TMASE-MatchedRID: tpqoU9tNJ/6XFGyE5q3nYI6MisxJraxHvhf/zJ92tsP7efdnqtsaE+Xo
	AzgBreAWySbdKpXLGf+2fd29CPQsSyQVVteP90Ct7spMO3HwKCBMkOX0UoduuQqiCYa6w8tvFQ6
	esMZE452iVEZ1sNWPbYcX2pq39qsVmxh0gY/o+VmEryjhqiyzyuWNJG9IamrcjNnoU1foposm9z
	seJYWHLYY10crKp8t+Dx215gVwcojTLBkSptG5BMqXjImgj58b2+EpBnZEzfVzjAlza2E1ota35
	c528+Jg7CW5xFA6WTJ8m0eKI/dFAJYfiJHiUPPG2Hdvv/MGE3WtfY6YPaw3YTzzULHH1XTjZy7M
	b8HzS51HsT/BdZ3h5ocKmVDEfCFqK8hR2zZwSxvJ1E39jKDimCiX0qXAFL9dl2j8d+K0VSg0Kax
	SsTUXdOLzNWBegCW2wgn7iDBesS0gBwKKRHe+r8ncc7mFNrFKwRhvIHWDP0ztZIVCSj5GFufp/a
	oIIm36qyTdBR/4U04=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.975900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 69CE4B95384445C68EC99942D830788CFC504EE66EC026C1D804604C80B3ED9A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_214559_345198_A6859D83 
X-CRM114-Status: GOOD (  25.29  )
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

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
Tested-by: Daniel Kurtz <djkurtz@chromium.org>
Tested-by: Pi-Hsun Shih <pihsun@chromium.org>

---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 13 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 39 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_gem.h | 12 ++++++
 include/uapi/drm/mediatek_drm.h        | 58 ++++++++++++++++++++++++++
 4 files changed, 122 insertions(+)
 create mode 100644 include/uapi/drm/mediatek_drm.h

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 93552d76b6e7..e3e9dbdf265b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -24,6 +24,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/mediatek_drm.h>
 
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
@@ -541,6 +542,14 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 	component_unbind_all(drm->dev, drm);
 }
 
+static const struct drm_ioctl_desc mtk_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(MTK_GEM_CREATE, mtk_gem_create_ioctl,
+			  DRM_UNLOCKED | DRM_AUTH | DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MTK_GEM_MAP_OFFSET,
+			  mtk_gem_map_offset_ioctl,
+			  DRM_UNLOCKED | DRM_AUTH | DRM_RENDER_ALLOW),
+};
+
 DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
 
 /*
@@ -562,6 +571,10 @@ static const struct drm_driver mtk_drm_driver = {
 
 	.gem_prime_import = mtk_drm_gem_prime_import,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
+
+	.ioctls = mtk_ioctls,
+	.num_ioctls = ARRAY_SIZE(mtk_ioctls),
+
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9f364df52478..bcce723f257d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <drm/mediatek_drm.h>
 
 #include <drm/drm.h>
 #include <drm/drm_device.h>
@@ -272,3 +273,41 @@ void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
 	mtk_gem->kvaddr = NULL;
 	kfree(mtk_gem->pages);
 }
+
+int mtk_gem_map_offset_ioctl(struct drm_device *drm, void *data,
+			     struct drm_file *file_priv)
+{
+	struct drm_mtk_gem_map_off *args = data;
+
+	return drm_gem_dumb_map_offset(file_priv, drm, args->handle,
+				       &args->offset);
+}
+
+int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv)
+{
+	struct mtk_drm_gem_obj *mtk_gem;
+	struct drm_mtk_gem_create *args = data;
+	int ret;
+
+	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
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
+	mtk_drm_gem_free_object(&mtk_gem->base);
+	return ret;
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
index 78f23b07a02e..90f3d2916ec5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
@@ -46,4 +46,16 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
 			      struct iosys_map *map);
 
+/*
+ * request gem object creation and buffer allocation as the size
+ * that it is calculated with framebuffer information such as width,
+ * height and bpp.
+ */
+int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv);
+
+/* get buffer offset to map to user space. */
+int mtk_gem_map_offset_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file_priv);
+
 #endif
diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_drm.h
new file mode 100644
index 000000000000..c050de320a84
--- /dev/null
+++ b/include/uapi/drm/mediatek_drm.h
@@ -0,0 +1,58 @@
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
+/**
+ * A structure for getting buffer offset.
+ *
+ * @handle: a pointer to gem object created.
+ * @pad: just padding to be 64-bit aligned.
+ * @offset: relatived offset value of the memory region allocated.
+ *     - this value should be set by user.
+ */
+struct drm_mtk_gem_map_off {
+	uint32_t handle;
+	uint32_t pad;
+	uint64_t offset;
+};
+
+#define DRM_MTK_GEM_CREATE		0x00
+#define DRM_MTK_GEM_MAP_OFFSET		0x01
+
+#define DRM_IOCTL_MTK_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
+		DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)
+
+#define DRM_IOCTL_MTK_GEM_MAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + \
+		DRM_MTK_GEM_MAP_OFFSET, struct drm_mtk_gem_map_off)
+
+#endif /* _UAPI_MEDIATEK_DRM_H */
-- 
2.18.0


