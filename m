Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C09C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 04:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhO9FNUqILmsSTy/ZJ+LCBLyVosB/ZDOWAwfjhw+4yE=; b=nBBl0ElqLB3hw9gOxkoyrxUfS0
	Jn60m6zno6anrladdwet/XentsyEWyjXx3u7EOMjlIwNntfp6w9WaHqyImCvknxPCdfoSzdEdF6t8
	cW9RTqQzmh8rpwzFrydHHL6pLgkUh6SHDz4UsRo3EytYgYJIglMEOy+ggqW/VIiu0HpnNY+Zm3UAT
	VU80C/4WjjtywbJg+7IXVnGIaN9+PnpUaikzk35k39HTgXIId6O0U1+FjHH32Ws2c8HocV+7pKE/G
	jgMVorYdKQB2u04lpo1hUa/EdmKaBfrbgm/4uk3sEabtiLZgKanSrfWkW14B93bu42Q3skYTe5MrS
	I7cX5KOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHHfe-000VKW-CK; Fri, 29 Jul 2022 04:32:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHHfa-000VGT-KI; Fri, 29 Jul 2022 04:32:16 +0000
X-UUID: 18ca626e93c24c3192227b7ba26fb3e6-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ac2d299e-b8c9-4976-8ca3-d3a1c6e52a33,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:1e50b6cf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 18ca626e93c24c3192227b7ba26fb3e6-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 734367165; Thu, 28 Jul 2022 21:32:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 11:51:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Jul 2022 11:51:32 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Alexandre Courbot <acourbot@chromium.org>, Tiffany
 Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@chromium.org>, Tomasz Figa <tfiga@google.com>,
	<nicolas.dufresne@collabora.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5, 2/8] media: mediatek: vcodec: Enable venc dual core usage
Date: Fri, 29 Jul 2022 11:51:23 +0800
Message-ID: <20220729035129.3634-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729035129.3634-1-irui.wang@mediatek.com>
References: <20220729035129.3634-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_213214_682659_A95E8B83 
X-CRM114-Status: GOOD (  28.80  )
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

Adds new property to indicate whether the encoder has multiple cores.
Use of_platform_populate to probe each venc cores, the core device can
use the init_clk/request_irq helper to initialize their own power/clk/irq.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Makefile   |   4 +-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  12 ++
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |   6 +
 .../mediatek/vcodec/mtk_vcodec_enc_hw.c       | 136 ++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_enc_hw.h       |  36 +++++
 5 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.h

diff --git a/drivers/media/platform/mediatek/vcodec/Makefile b/drivers/media/platform/mediatek/vcodec/Makefile
index 93e7a343b5b0..ac068d88af29 100644
--- a/drivers/media/platform/mediatek/vcodec/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/Makefile
@@ -3,7 +3,8 @@
 obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
 				       mtk-vcodec-enc.o \
 				       mtk-vcodec-common.o \
-				       mtk-vcodec-dec-hw.o
+				       mtk-vcodec-dec-hw.o \
+				       mtk_vcodec_enc_hw.o
 
 mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec/vdec_vp8_if.o \
@@ -32,6 +33,7 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 		venc_drv_if.o \
 		venc_vpu_if.o \
 
+mtk-vcodec-enc-hw-y := mtk_vcodec_enc_hw.o
 
 mtk-vcodec-common-y := mtk_vcodec_intr.o \
 		mtk_vcodec_util.o \
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index ef4584a46417..644021c5bbd4 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -95,6 +95,15 @@ enum mtk_fmt_type {
 	MTK_FMT_FRAME = 2,
 };
 
+/*
+ * enum mtk_venc_hw_id -- encoder hardware id
+ */
+enum mtk_venc_hw_id {
+	MTK_VENC_CORE_0 = 0,
+	MTK_VENC_CORE_1,
+	MTK_VENC_HW_MAX,
+};
+
 /*
  * enum mtk_vdec_hw_id - Hardware index used to separate
  *                         different hardware
@@ -464,6 +473,7 @@ struct mtk_vcodec_enc_pdata {
  * @dec_active_cnt: used to mark whether need to record register value
  * @vdec_racing_info: record register value
  * @dec_racing_info_mutex: mutex lock used for inner racing mode
+ * @enc_hw_dev: used to store venc core device
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -514,6 +524,8 @@ struct mtk_vcodec_dev {
 	u32 vdec_racing_info[132];
 	/* Protects access to vdec_racing_info data */
 	struct mutex dec_racing_info_mutex;
+
+	void *enc_hw_dev[MTK_VENC_HW_MAX];
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index 95e8c29ccc65..9cb6ce1fa101 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -263,6 +263,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_enc_pm;
 	}
 
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret) {
+		mtk_v4l2_err("Failed to populate children devices");
+		goto err_enc_pm;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 
 	dev->reg_base[dev->venc_pdata->core_id] =
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.c
new file mode 100644
index 000000000000..cc4938f027e0
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include "mtk_vcodec_drv.h"
+#include "mtk_vcodec_enc.h"
+#include "mtk_vcodec_enc_hw.h"
+#include "mtk_vcodec_intr.h"
+
+static const struct of_device_id mtk_venc_hw_ids[] = {
+	{.compatible = "mediatek,mtk-venc-hw",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_venc_hw_ids);
+
+static void clean_hw_irq_status(unsigned int irq_status, void __iomem *addr)
+{
+	if (irq_status & MTK_VENC_IRQ_STATUS_PAUSE)
+		writel(MTK_VENC_IRQ_STATUS_PAUSE, addr);
+
+	if (irq_status & MTK_VENC_IRQ_STATUS_SWITCH)
+		writel(MTK_VENC_IRQ_STATUS_SWITCH, addr);
+
+	if (irq_status & MTK_VENC_IRQ_STATUS_DRAM)
+		writel(MTK_VENC_IRQ_STATUS_DRAM, addr);
+
+	if (irq_status & MTK_VENC_IRQ_STATUS_SPS)
+		writel(MTK_VENC_IRQ_STATUS_SPS, addr);
+
+	if (irq_status & MTK_VENC_IRQ_STATUS_PPS)
+		writel(MTK_VENC_IRQ_STATUS_PPS, addr);
+
+	if (irq_status & MTK_VENC_IRQ_STATUS_FRM)
+		writel(MTK_VENC_IRQ_STATUS_FRM, addr);
+}
+
+static irqreturn_t mtk_enc_hw_irq_handler(int irq, void *priv)
+{
+	struct mtk_venc_hw_dev *dev = priv;
+	struct mtk_vcodec_ctx *ctx;
+	unsigned long flags;
+	void __iomem *addr;
+
+	spin_lock_irqsave(&dev->main_dev->irqlock, flags);
+	ctx = dev->curr_ctx;
+	spin_unlock_irqrestore(&dev->main_dev->irqlock, flags);
+	if (!ctx)
+		return IRQ_HANDLED;
+
+	mtk_v4l2_debug(1, "id=%d core :%d", ctx->id, dev->hw_id);
+
+	addr = dev->reg_base + MTK_VENC_IRQ_ACK_OFFSET;
+	ctx->irq_status = readl(dev->reg_base + MTK_VENC_IRQ_STATUS_OFFSET);
+	clean_hw_irq_status(ctx->irq_status, addr);
+
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, 0);
+	return IRQ_HANDLED;
+}
+
+static int mtk_venc_hw_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_venc_hw_dev *sub_core;
+	struct mtk_vcodec_dev *main_dev;
+	int ret;
+
+	if (!dev->parent)
+		return dev_err_probe(dev, -ENODEV,
+				     "No parent for venc core device\n");
+
+	main_dev = dev_get_drvdata(dev->parent);
+	if (!main_dev)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to get parent driver data\n");
+
+	sub_core = devm_kzalloc(&pdev->dev, sizeof(*sub_core), GFP_KERNEL);
+	if (!sub_core)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed to get alloc core data\n");
+
+	sub_core->plat_dev = pdev;
+
+	platform_set_drvdata(pdev, sub_core);
+
+	sub_core->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sub_core->reg_base))
+		return dev_err_probe(dev, PTR_ERR(sub_core->reg_base),
+				     "Failed to get reg base\n");
+
+	sub_core->enc_irq = platform_get_irq(pdev, 0);
+	if (sub_core->enc_irq < 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to get irq resource\n");
+
+	ret = devm_request_irq(dev, sub_core->enc_irq,
+			       mtk_enc_hw_irq_handler, 0,
+			       pdev->name, sub_core);
+	if (ret)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to install sub_core->enc_irq %d\n",
+				     sub_core->enc_irq);
+
+	ret = of_property_read_u32(dev->of_node, "mediatek,hw-id",
+				   &sub_core->hw_id);
+
+	if (ret || sub_core->hw_id >= MTK_VENC_HW_MAX)
+		return dev_err_probe(dev, (ret ? ret : -EINVAL),
+				     "Cannot parse hardware id");
+
+	main_dev->enc_hw_dev[sub_core->hw_id] = sub_core;
+	sub_core->main_dev = main_dev;
+
+	dev_dbg(dev, "Venc core :%d probe done\n", sub_core->hw_id);
+
+	return 0;
+}
+
+static struct platform_driver mtk_venc_core_driver = {
+	.probe  = mtk_venc_hw_probe,
+	.driver = {
+		.name	 = "mtk-venc-core",
+		.of_match_table = mtk_venc_hw_ids,
+	},
+};
+module_platform_driver(mtk_venc_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek video encoder core driver");
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.h
new file mode 100644
index 000000000000..9daea9665659
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef _MTK_VCODEC_ENC_HW_H_
+#define _MTK_VCODEC_ENC_HW_H_
+
+#include <linux/platform_device.h>
+#include "mtk_vcodec_drv.h"
+
+/**
+ * struct mtk_venc_hw_dev - driver data
+ * @plat_dev: platform_device
+ * @main_dev: main device
+ * @pm: power management data
+ * @curr_ctx: the context that is waiting for venc hardware
+ * @reg_base: mapped address of venc registers
+ * @irq_status: venc hardware irq status
+ * @enc_irq: venc device irq
+ * @hw_id: for venc hardware id: core#0, core#1...
+ */
+struct mtk_venc_hw_dev {
+	struct platform_device *plat_dev;
+	struct mtk_vcodec_dev *main_dev;
+
+	struct mtk_vcodec_pm pm;
+	struct mtk_vcodec_ctx *curr_ctx;
+
+	void __iomem *reg_base;
+	unsigned int irq_status;
+	int enc_irq;
+	enum mtk_venc_hw_id hw_id;
+};
+
+#endif /* _MTK_VCODEC_ENC_HW_H_ */
-- 
2.18.0


