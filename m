Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B775C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 11:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1Z+g58MrUghONvFYfzTqLxyQqEgKW0qabrUwXKdlLw=; b=VPri2pQAV9XDOMxozxcEDhp/q8
	Mz1tiAWIPyr75gB4swRb6yiA0kpHOnarrLi1ELVO/UXN8/IoeweTLsnU40SZH4fhPs3Y8OXvX2oLZ
	Na5iy0UvmGe/6sQR5DuUAUOEjDDSqxzaIcON6LT7YyKOzU3txsEJDOK0/2awhSoqN0oP7gjlMX2mw
	BlxKCVli2BFEBVKwHA8fTBDRQkYgz5/lneVg/9M0gZI56NAFcFMD/MbPnWZnZ1F6vbJv55+pslimM
	5VSU3aLGlBOXptMV7Rso4z8PdtaA37fczO005DFRR2z8YQXyTCHuOIDvSTNOB9YEJGyg/gohFQWAB
	Gef8PrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRPm-008MVd-6D; Tue, 22 Nov 2022 11:26:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRPj-008MTC-L5
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 11:26:09 +0000
X-UUID: 5c6a982e99ae4d2eb2eac7dcff4cca29-20221122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B1Z+g58MrUghONvFYfzTqLxyQqEgKW0qabrUwXKdlLw=;
	b=qhjNaZPxXlINBuUn/OaUn+frB4iUsMdg+yKt3hxl7FDtawC87QIFYrS0v+j013klpDbcaP+yQJey1joGoEWSTqk3jsyWnPyH9nSkj+JQaKrBTVDLnvfAaIvITgSoN/GbVMeEz2kh+ysKXyBjCztQRE0SGD+7ds4VnaFwygKkbss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:8aa2515f-7884-4074-b06b-395b04a2cd9d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:67707f2f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5c6a982e99ae4d2eb2eac7dcff4cca29-20221122
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yanchao.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 446991048; Tue, 22 Nov 2022 04:26:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 22 Nov 2022 19:15:24 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 19:15:22 +0800
From: Yanchao Yang <yanchao.yang@mediatek.com>
To: Loic Poulain <loic.poulain@linaro.org>, Sergey Ryazanov
	<ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev ML
	<netdev@vger.kernel.org>, kernel ML <linux-kernel@vger.kernel.org>
CC: MTK ML <linux-mediatek@lists.infradead.org>, Liang Lu
	<liang.lu@mediatek.com>, Haijun Liu <haijun.liu@mediatek.com>, Hua Yang
	<hua.yang@mediatek.com>, Ting Wang <ting.wang@mediatek.com>, Felix Chen
	<felix.chen@mediatek.com>, Mingliang Xu <mingliang.xu@mediatek.com>, Min Dong
	<min.dong@mediatek.com>, Aiden Wang <aiden.wang@mediatek.com>, Guohao Zhang
	<guohao.zhang@mediatek.com>, Chris Feng <chris.feng@mediatek.com>, Yanchao
 Yang <yanchao.yang@mediatek.com>, Lambert Wang <lambert.wang@mediatek.com>,
	Mingchuang Qiao <mingchuang.qiao@mediatek.com>, Xiayu Zhang
	<xiayu.zhang@mediatek.com>, Haozhe Chang <haozhe.chang@mediatek.com>,
	MediaTek Corporation <linuxwwan@mediatek.com>
Subject: [PATCH net-next v1 03/13] net: wwan: tmi: Add control plane transaction layer
Date: Tue, 22 Nov 2022 19:11:42 +0800
Message-ID: <20221122111152.160377-4-yanchao.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221122111152.160377-1-yanchao.yang@mediatek.com>
References: <20221122111152.160377-1-yanchao.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_032607_739007_95231A89 
X-CRM114-Status: GOOD (  18.81  )
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

From: MediaTek Corporation <linuxwwan@mediatek.com>

The control plane implements TX services that reside in the transaction layer.
The services receive the packets from the port layer and call the corresponding
DMA components to transmit data to the device. Meanwhile, TX services receive
and manage the port control commands from the port layer.

The control plane implements RX services that reside in the transaction layer.
The services receive the downlink packets from the modem and transfer the
packets to the corresponding port layer interfaces.

Signed-off-by: Mingliang Xu <mingliang.xu@mediatek.com>
Signed-off-by: MediaTek Corporation <linuxwwan@mediatek.com>
---
 drivers/net/wwan/mediatek/Makefile         |  3 +-
 drivers/net/wwan/mediatek/mtk_ctrl_plane.c | 62 ++++++++++++++++++++++
 drivers/net/wwan/mediatek/mtk_ctrl_plane.h | 35 ++++++++++++
 drivers/net/wwan/mediatek/mtk_dev.c        |  8 +++
 drivers/net/wwan/mediatek/mtk_dev.h        |  1 +
 5 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/wwan/mediatek/mtk_ctrl_plane.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_ctrl_plane.h

diff --git a/drivers/net/wwan/mediatek/Makefile b/drivers/net/wwan/mediatek/Makefile
index 122a791e1683..69a9fb7d5b96 100644
--- a/drivers/net/wwan/mediatek/Makefile
+++ b/drivers/net/wwan/mediatek/Makefile
@@ -5,7 +5,8 @@ MODULE_NAME := mtk_tmi
 mtk_tmi-y = \
 	pcie/mtk_pci.o	\
 	mtk_dev.o	\
-	mtk_bm.o
+	mtk_bm.o	\
+	mtk_ctrl_plane.o
 
 ccflags-y += -I$(srctree)/$(src)/
 ccflags-y += -I$(srctree)/$(src)/pcie/
diff --git a/drivers/net/wwan/mediatek/mtk_ctrl_plane.c b/drivers/net/wwan/mediatek/mtk_ctrl_plane.c
new file mode 100644
index 000000000000..4c8f71223a11
--- /dev/null
+++ b/drivers/net/wwan/mediatek/mtk_ctrl_plane.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/freezer.h>
+#include <linux/kthread.h>
+#include <linux/list.h>
+#include <linux/sched.h>
+#include <linux/wait.h>
+
+#include "mtk_bm.h"
+#include "mtk_ctrl_plane.h"
+
+int mtk_ctrl_init(struct mtk_md_dev *mdev)
+{
+	struct mtk_ctrl_blk *ctrl_blk;
+	int err;
+
+	ctrl_blk = devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNEL);
+	if (!ctrl_blk)
+		return -ENOMEM;
+
+	ctrl_blk->mdev = mdev;
+	mdev->ctrl_blk = ctrl_blk;
+
+	ctrl_blk->bm_pool = mtk_bm_pool_create(mdev, MTK_BUFF_SKB,
+					       VQ_MTU_3_5K, BUFF_3_5K_MAX_CNT, MTK_BM_LOW_PRIO);
+	if (!ctrl_blk->bm_pool) {
+		err = -ENOMEM;
+		goto err_free_mem;
+	}
+
+	ctrl_blk->bm_pool_63K = mtk_bm_pool_create(mdev, MTK_BUFF_SKB,
+						   VQ_MTU_63K, BUFF_63K_MAX_CNT, MTK_BM_LOW_PRIO);
+
+	if (!ctrl_blk->bm_pool_63K) {
+		err = -ENOMEM;
+		goto err_destroy_pool;
+	}
+
+	return 0;
+
+err_destroy_pool:
+	mtk_bm_pool_destroy(mdev, ctrl_blk->bm_pool);
+err_free_mem:
+	devm_kfree(mdev->dev, ctrl_blk);
+
+	return err;
+}
+
+int mtk_ctrl_exit(struct mtk_md_dev *mdev)
+{
+	struct mtk_ctrl_blk *ctrl_blk = mdev->ctrl_blk;
+
+	mtk_bm_pool_destroy(mdev, ctrl_blk->bm_pool);
+	mtk_bm_pool_destroy(mdev, ctrl_blk->bm_pool_63K);
+	devm_kfree(mdev->dev, ctrl_blk);
+
+	return 0;
+}
diff --git a/drivers/net/wwan/mediatek/mtk_ctrl_plane.h b/drivers/net/wwan/mediatek/mtk_ctrl_plane.h
new file mode 100644
index 000000000000..343766a2b39e
--- /dev/null
+++ b/drivers/net/wwan/mediatek/mtk_ctrl_plane.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear
+ *
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#ifndef __MTK_CTRL_PLANE_H__
+#define __MTK_CTRL_PLANE_H__
+
+#include <linux/kref.h>
+#include <linux/skbuff.h>
+
+#include "mtk_dev.h"
+
+#define VQ_MTU_3_5K			(0xE00)
+#define VQ_MTU_63K			(0xFC00)
+
+#define BUFF_3_5K_MAX_CNT		(100)
+#define BUFF_63K_MAX_CNT		(64)
+
+struct mtk_ctrl_trans {
+	struct mtk_ctrl_blk *ctrl_blk;
+	struct mtk_md_dev *mdev;
+};
+
+struct mtk_ctrl_blk {
+	struct mtk_md_dev *mdev;
+	struct mtk_ctrl_trans *trans;
+	struct mtk_bm_pool *bm_pool;
+	struct mtk_bm_pool *bm_pool_63K;
+};
+
+int mtk_ctrl_init(struct mtk_md_dev *mdev);
+int mtk_ctrl_exit(struct mtk_md_dev *mdev);
+
+#endif /* __MTK_CTRL_PLANE_H__ */
diff --git a/drivers/net/wwan/mediatek/mtk_dev.c b/drivers/net/wwan/mediatek/mtk_dev.c
index 513aac37cb9c..96b111be206a 100644
--- a/drivers/net/wwan/mediatek/mtk_dev.c
+++ b/drivers/net/wwan/mediatek/mtk_dev.c
@@ -4,6 +4,7 @@
  */
 
 #include "mtk_bm.h"
+#include "mtk_ctrl_plane.h"
 #include "mtk_dev.h"
 
 int mtk_dev_init(struct mtk_md_dev *mdev)
@@ -14,12 +15,19 @@ int mtk_dev_init(struct mtk_md_dev *mdev)
 	if (ret)
 		goto err_bm_init;
 
+	ret = mtk_ctrl_init(mdev);
+	if (ret)
+		goto err_ctrl_init;
+
+err_ctrl_init:
+	mtk_bm_exit(mdev);
 err_bm_init:
 	return ret;
 }
 
 void mtk_dev_exit(struct mtk_md_dev *mdev)
 {
+	mtk_ctrl_exit(mdev);
 	mtk_bm_exit(mdev);
 }
 
diff --git a/drivers/net/wwan/mediatek/mtk_dev.h b/drivers/net/wwan/mediatek/mtk_dev.h
index 0c4b727b9c53..d6e8e9b2e52a 100644
--- a/drivers/net/wwan/mediatek/mtk_dev.h
+++ b/drivers/net/wwan/mediatek/mtk_dev.h
@@ -130,6 +130,7 @@ struct mtk_md_dev {
 	u32 hw_ver;
 	int msi_nvecs;
 	char dev_str[MTK_DEV_STR_LEN];
+	void *ctrl_blk;
 	struct mtk_bm_ctrl *bm_ctrl;
 };
 
-- 
2.32.0


