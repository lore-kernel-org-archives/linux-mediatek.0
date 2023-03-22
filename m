Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D62EC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 09:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1auQmDPlDWuWCFjiGD/N9g5k0v7IBBTaFSzN1WpWw/k=; b=SKzLyfFnz7SXeMZvKEbq8SIfCz
	2f8Wof3Z9S21CJGHLDuk27xoq58CD8tq3WcFq3EjKt2NPm8Y1rFI72X/6PuZgagUl/Y53GeDvhsEL
	Dj2zC8aRJirDKWe4Fn5raNhkEqspD1W0gBZ7ot5I7gVkZQhZJk4H53hfX3wzXhrK4XWL3G4VKasOW
	kUSFHp5n7dej8dC7K0mCsXAvAEB9oH6gUEGvxU7FfBzPIfmYjMKbu2Tn+2itzTixubiyRtxYgt+KU
	F6STpjChucRBiSKO+iKDMgSYAXG8dzxRztUglHxKUFpzQR1naTpw4f+dAnuaR7wnPV3tQVJhkMj3Q
	SaRQ79+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev3o-00FVQP-09;
	Wed, 22 Mar 2023 09:47:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pev3b-00FVII-0P;
	Wed, 22 Mar 2023 09:47:00 +0000
X-UUID: 7b195c8ec89611ed8687db9d93187ff1-20230322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1auQmDPlDWuWCFjiGD/N9g5k0v7IBBTaFSzN1WpWw/k=;
	b=QMcYOqGud0czJOgsVQ1TYgEg49ZgHQfgqjT+CYJ8CuEhyF8DoW0qeB+Mi/9Q/JvdTOOu9IPd1DdbXrI9EZ7sONsrHyNOY7G20LQx/LbtBuKuXOPBVp4mjOWK+ugaR/e+Zuv2H2Gtks9mHdyGye17ksZSgByi7OvEJMmPXALgJE4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:849dab71-b1e8-4f7d-9032-f4dc849392a3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:849dab71-b1e8-4f7d-9032-f4dc849392a3,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:f11993f6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230322174623FZLCA41G,BulkQuantity:4,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 7b195c8ec89611ed8687db9d93187ff1-20230322
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 906977249; Wed, 22 Mar 2023 02:46:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 22 Mar 2023 17:46:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 22 Mar 2023 17:46:20 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,1/7] media: mediatek: vcodec: Add debugfs interface to get debug information
Date: Wed, 22 Mar 2023 17:46:11 +0800
Message-ID: <20230322094617.19410-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322094617.19410-1-yunfei.dong@mediatek.com>
References: <20230322094617.19410-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_024659_174627_4A71EA27 
X-CRM114-Status: GOOD (  20.68  )
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

This will be useful when debugging specific issues related to kernel
in running status.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Makefile   |  6 ++++
 .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 33 +++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dbgfs.h        | 32 ++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |  2 ++
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  4 +++
 5 files changed, 77 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h

diff --git a/drivers/media/platform/mediatek/vcodec/Makefile b/drivers/media/platform/mediatek/vcodec/Makefile
index 93e7a343b5b0..f6b750cf7077 100644
--- a/drivers/media/platform/mediatek/vcodec/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/Makefile
@@ -44,3 +44,9 @@ endif
 ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP),)
 mtk-vcodec-common-y += mtk_vcodec_fw_scp.o
 endif
+
+ifneq ($(CONFIG_DEBUG_FS),)
+obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dbgfs.o
+
+mtk-vcodec-dbgfs-y := mtk_vcodec_dbgfs.o
+endif
\ No newline at end of file
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
new file mode 100644
index 000000000000..fb9edd379af5
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include <linux/debugfs.h>
+
+#include "mtk_vcodec_dbgfs.h"
+#include "mtk_vcodec_drv.h"
+#include "mtk_vcodec_util.h"
+
+void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev)
+{
+	struct dentry *vcodec_root;
+
+	vcodec_dev->dbgfs.vcodec_root = debugfs_create_dir("vcodec-dec", NULL);
+	if (IS_ERR(vcodec_dev->dbgfs.vcodec_root))
+		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%d\n",
+			IS_ERR(vcodec_dev->dbgfs.vcodec_root));
+
+	vcodec_root = vcodec_dev->dbgfs.vcodec_root;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_init);
+
+void mtk_vcodec_dbgfs_deinit(struct mtk_vcodec_dev *vcodec_dev)
+{
+	debugfs_remove_recursive(vcodec_dev->dbgfs.vcodec_root);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_deinit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Mediatek video codec driver");
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
new file mode 100644
index 000000000000..5eec2211cbbe
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#ifndef __MTK_VCODEC_DBGFS_H__
+#define __MTK_VCODEC_DBGFS_H__
+
+struct mtk_vcodec_dev;
+
+/**
+ * struct mtk_vcodec_dbgfs  - dbgfs information
+ * @vcodec_root: vcodec dbgfs entry
+ */
+struct mtk_vcodec_dbgfs {
+	struct dentry *vcodec_root;
+};
+
+#if defined(CONFIG_DEBUG_FS)
+void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev);
+void mtk_vcodec_dbgfs_deinit(struct mtk_vcodec_dev *vcodec_dev);
+#else
+static inline void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev)
+{
+}
+
+static inline void mtk_vcodec_dbgfs_deinit(struct mtk_vcodec_dev *vcodec_dev)
+{
+}
+#endif
+#endif
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 174a6eec2f54..de29b1fb0436 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -431,6 +431,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		mtk_v4l2_debug(0, "media registered as /dev/media%d", vfd_dec->minor);
 	}
 
+	mtk_vcodec_dbgfs_init(dev);
 	mtk_v4l2_debug(0, "decoder registered as /dev/video%d", vfd_dec->minor);
 
 	return 0;
@@ -505,6 +506,7 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 	if (dev->vfd_dec)
 		video_unregister_device(dev->vfd_dec);
 
+	mtk_vcodec_dbgfs_deinit(dev);
 	v4l2_device_unregister(&dev->v4l2_dev);
 	if (!dev->vdec_pdata->is_subdev_supported)
 		pm_runtime_disable(dev->pm.dev);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index 9acab54fd650..a7e8bb3608ac 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -16,6 +16,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 
+#include "mtk_vcodec_dbgfs.h"
 #include "mtk_vcodec_util.h"
 #include "vdec_msg_queue.h"
 
@@ -470,6 +471,7 @@ struct mtk_vcodec_enc_pdata {
  * @dec_active_cnt: used to mark whether need to record register value
  * @vdec_racing_info: record register value
  * @dec_racing_info_mutex: mutex lock used for inner racing mode
+ * @dbgfs: debug log related information
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -520,6 +522,8 @@ struct mtk_vcodec_dev {
 	u32 vdec_racing_info[132];
 	/* Protects access to vdec_racing_info data */
 	struct mutex dec_racing_info_mutex;
+
+	struct mtk_vcodec_dbgfs dbgfs;
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
-- 
2.18.0


