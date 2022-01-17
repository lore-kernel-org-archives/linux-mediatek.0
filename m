Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F3BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 12:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JN12C8qgi+8y2/8NwrwtQH/1p6ppkaHSKUt8a5ygKJo=; b=hEi4yUtdu/+Y+O
	FgigkQt6C09/Fi5m1D9gx+GR2cLnYJs+J70qnKC770hElWX3U1K9Jj7odmHS31ck5OgAeF2XIFqDE
	a8SpAnvIjEnu/lzmvzRrsPjfA1yQjhc+3XUTMWRx7tNbOM93TdQyDo/nXYccUlOImxhlz/Z/gx71f
	yQp0RJCMvFJmHi570oZvrhnj9+RakGxRKcFUfa5MMDj7lhGNt7FGOg9WvH8qOQULG3hAuwAfp8X8q
	oN3glYsAp8hm0wVo3W430fvxXqE2KbIUBOanl41avEHmOIVa25mNtaFeWaDcqntoXzdqihO1H39XP
	MdDskXFC7enkaC+XQntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9QtD-00EpVV-Qj; Mon, 17 Jan 2022 12:13:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Qr3-00EoRa-8Q; Mon, 17 Jan 2022 12:11:23 +0000
X-UUID: 341e6fd64d384a8db6df946a522ba64c-20220117
X-UUID: 341e6fd64d384a8db6df946a522ba64c-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1608916845; Mon, 17 Jan 2022 05:11:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 04:06:36 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 17 Jan 2022 20:06:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 20:06:32 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2, 04/10] media: mtk-vcodec: Enable venc dual core usage
Date: Mon, 17 Jan 2022 20:06:09 +0800
Message-ID: <20220117120615.21687-5-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117120615.21687-1-irui.wang@mediatek.com>
References: <20220117120615.21687-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_041121_350361_516BAD8B 
X-CRM114-Status: GOOD (  32.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adds new venc core mode to indicate different venc hardware mode:
VENC_SINGLE_CORE_MODE means only one core, the device has its own
power/clk/irq, init_clk/request_irq helper can be used.

VENC_DUAL_CORE_MODE means more than one core inside, the core device
can use the init_clk/request_irq helper to initialize their own
power/clk/irq. And the main device doesn't need use these helper anymore.

MT8195 has two H264 venc cores, enable dual_core_mode for it.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  22 +++
 .../platform/mtk-vcodec/mtk_vcodec_enc_core.c | 153 ++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_core.h |  36 +++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  88 +++++-----
 5 files changed, 266 insertions(+), 37 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.h

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index 93e7a343b5b0..c472b221bd6b 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -3,7 +3,8 @@
 obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
 				       mtk-vcodec-enc.o \
 				       mtk-vcodec-common.o \
-				       mtk-vcodec-dec-hw.o
+				       mtk-vcodec-dec-hw.o \
+				       mtk-vcodec-enc-core.o
 
 mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec/vdec_vp8_if.o \
@@ -32,6 +33,7 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 		venc_drv_if.o \
 		venc_vpu_if.o \
 
+mtk-vcodec-enc-core-y := mtk_vcodec_enc_core.o
 
 mtk-vcodec-common-y := mtk_vcodec_intr.o \
 		mtk_vcodec_util.o \
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index f78463ff4551..9e4e4290a69a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -117,6 +117,23 @@ enum mtk_vdec_hw_count {
 	MTK_VDEC_MAX_HW_COUNT,
 };
 
+/*
+ * enum mtk_venc_core_id -- encoder core id
+ */
+enum mtk_venc_core_id {
+	MTK_VENC_CORE0 = 0,
+	MTK_VENC_CORE1 = 1,
+	MTK_VENC_CORE_MAX,
+};
+
+/**
+ * enmu mtk_venc_core_mode - Used to indicate different encode mode
+ */
+enum mtk_venc_core_mode {
+	VENC_SINGLE_CORE_MODE = 0,
+	VENC_DUAL_CORE_MODE = 1,
+};
+
 /*
  * struct mtk_video_fmt - Structure used to store information about pixelformats
  */
@@ -420,6 +437,7 @@ struct mtk_vcodec_dec_pdata {
  * @output_formats: array of supported output formats
  * @num_output_formats: number of entries in output_formats
  * @core_type: stand for h264 or vp8 encode
+ * @core_mode: indicate encode core mode
  */
 struct mtk_vcodec_enc_pdata {
 	bool uses_ext;
@@ -430,6 +448,7 @@ struct mtk_vcodec_enc_pdata {
 	const struct mtk_video_fmt *output_formats;
 	size_t num_output_formats;
 	int core_type;
+	enum mtk_venc_core_mode core_mode;
 };
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
@@ -479,6 +498,7 @@ struct mtk_vcodec_enc_pdata {
  * @subdev_dev: subdev hardware device
  * @subdev_prob_done: check whether all used hw device is prob done
  * @subdev_bitmap: used to record hardware is ready or not
+ * @enc_core_dev: used to store venc core device
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -524,6 +544,8 @@ struct mtk_vcodec_dev {
 	void *subdev_dev[MTK_VDEC_HW_MAX];
 	int (*subdev_prob_done)(struct mtk_vcodec_dev *vdec_dev);
 	DECLARE_BITMAP(subdev_bitmap, MTK_VDEC_HW_MAX);
+
+	void *enc_core_dev[MTK_VENC_CORE_MAX];
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.c
new file mode 100644
index 000000000000..d84914f615a5
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.c
@@ -0,0 +1,153 @@
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
+#include "mtk_vcodec_enc_core.h"
+
+static const struct of_device_id mtk_venc_core_ids[] = {
+	{
+		.compatible = "mediatek,mtk-venc-core0",
+		.data = (void *)MTK_VENC_CORE0,
+	},
+	{
+		.compatible = "mediatek,mtk-venc-core1",
+		.data = (void *)MTK_VENC_CORE1,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_venc_core_ids);
+
+static void clean_irq_status(unsigned int irq_status, void __iomem *addr)
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
+static irqreturn_t mtk_enc_core_irq_handler(int irq, void *priv)
+{
+	struct mtk_venc_core_dev *core = priv;
+	struct mtk_vcodec_ctx *ctx;
+	unsigned long flags;
+	void __iomem *addr;
+
+	spin_lock_irqsave(&core->main_dev->irqlock, flags);
+	ctx = core->curr_ctx;
+	spin_unlock_irqrestore(&core->main_dev->irqlock, flags);
+	if (!ctx)
+		return IRQ_HANDLED;
+
+	mtk_v4l2_debug(1, "id=%d core :%d", ctx->id, core->core_id);
+
+	addr = core->reg_base + MTK_VENC_IRQ_ACK_OFFSET;
+	ctx->irq_status = readl(core->reg_base + MTK_VENC_IRQ_STATUS_OFFSET);
+	clean_irq_status(ctx->irq_status, addr);
+
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, 0);
+	return IRQ_HANDLED;
+}
+
+static int mtk_venc_core_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_venc_core_dev *core;
+	struct mtk_vcodec_dev *main_dev;
+	int ret;
+
+	if (!dev->parent) {
+		dev_err(dev, "No parent for venc core device\n");
+		return -ENODEV;
+	}
+
+	main_dev = dev_get_drvdata(dev->parent);
+	if (!main_dev) {
+		dev_err(dev, "Failed to get parent driver data");
+		return -EINVAL;
+	}
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	core->plat_dev = pdev;
+
+	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->reg_base)) {
+		dev_err(&pdev->dev, "Failed to get reg base");
+		ret = PTR_ERR(core->reg_base);
+		goto err;
+	}
+
+	core->enc_irq = platform_get_irq(pdev, 0);
+	if (core->enc_irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq resource");
+		ret = core->enc_irq;
+		goto err;
+	}
+
+	ret = devm_request_irq(&pdev->dev, core->enc_irq,
+			       mtk_enc_core_irq_handler, 0,
+			       pdev->name, core);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to install core->enc_irq %d (%d)",
+			core->enc_irq, ret);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	core->core_id =
+		(enum mtk_venc_core_id)of_device_get_match_data(&pdev->dev);
+	if (core->core_id < 0 || core->core_id >= MTK_VENC_CORE_MAX) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	main_dev->enc_core_dev[core->core_id] = core;
+	core->main_dev = main_dev;
+
+	platform_set_drvdata(pdev, core);
+
+	dev_info(dev, "Venc core :%d probe done\n", core->core_id);
+
+	return 0;
+
+err:
+	return ret;
+}
+
+static struct platform_driver mtk_venc_core_driver = {
+	.probe  = mtk_venc_core_probe,
+	.driver = {
+		.name	 = "mtk-venc-core",
+		.of_match_table = mtk_venc_core_ids,
+	},
+};
+module_platform_driver(mtk_venc_core_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Mediatek video encoder core driver");
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.h
new file mode 100644
index 000000000000..856681989869
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef _MTK_VCODEC_ENC_CORE_H_
+#define _MTK_VCODEC_ENC_CORE_H_
+
+#include <linux/platform_device.h>
+#include "mtk_vcodec_drv.h"
+
+/*
+ * struct mtk_venc_core_dev - driver data
+ * @plat_dev: platform_device
+ * @main_dev: main device
+ * @pm: power management data
+ * @curr_ctx: the context that is waiting for venc hardware
+ * @reg_base: mapped address of venc registers
+ * @irq_status: venc core irq status
+ * @enc_irq: venc device irq
+ * @core id: for venc core id: core#0, core#1...
+ */
+struct mtk_venc_core_dev {
+	struct platform_device *plat_dev;
+	struct mtk_vcodec_dev *main_dev;
+
+	struct mtk_vcodec_pm pm;
+	struct mtk_vcodec_ctx *curr_ctx;
+
+	void __iomem *reg_base;
+	unsigned int irq_status;
+	int enc_irq;
+	int core_id;
+};
+
+#endif /* _MTK_VCODEC_ENC_CORE_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 1f950310a3fb..9d48c604bc54 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -231,10 +231,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dev *dev;
 	struct video_device *vfd_enc;
-	struct resource *res;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
-	int ret;
+	int ret, core_type;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -260,39 +259,37 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		return PTR_ERR(dev->fw_handler);
 
 	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
-	ret = mtk_vcodec_init_enc_clk(dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get mtk vcodec clock source!");
-		goto err_enc_pm;
-	}
+	core_type = dev->venc_pdata->core_type;
 
-	pm_runtime_enable(&pdev->dev);
+	if (dev->venc_pdata->core_mode == VENC_SINGLE_CORE_MODE) {
+		ret = mtk_vcodec_init_enc_clk(dev);
+		if (ret < 0) {
+			dev_err(&pdev->dev,
+				"Failed to get mtk vcodec clock source!");
+			goto err_enc_pm;
+		}
 
-	dev->reg_base[dev->venc_pdata->core_type] =
-		devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(dev->reg_base[dev->venc_pdata->core_type])) {
-		ret = PTR_ERR(dev->reg_base[dev->venc_pdata->core_type]);
-		goto err_res;
-	}
+		pm_runtime_enable(&pdev->dev);
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "failed to get irq resource");
-		ret = -ENOENT;
-		goto err_res;
-	}
+		dev->reg_base[core_type] =
+			devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(dev->reg_base[core_type])) {
+			ret = PTR_ERR(dev->reg_base[core_type]);
+			goto err_res;
+		}
 
-	dev->enc_irq = platform_get_irq(pdev, 0);
-	irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
-	ret = devm_request_irq(&pdev->dev, dev->enc_irq,
-			       mtk_vcodec_enc_irq_handler,
-			       0, pdev->name, dev);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Failed to install dev->enc_irq %d (%d) core_type (%d)",
-			dev->enc_irq, ret, dev->venc_pdata->core_type);
-		ret = -EINVAL;
-		goto err_res;
+		dev->enc_irq = platform_get_irq(pdev, 0);
+		irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
+		ret = devm_request_irq(&pdev->dev, dev->enc_irq,
+				       mtk_vcodec_enc_irq_handler,
+				       0, pdev->name, dev);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to install irq %d (%d) core_type (%d)",
+				dev->enc_irq, ret, core_type);
+			ret = -EINVAL;
+			goto err_res;
+		}
 	}
 
 	mutex_init(&dev->enc_mutex);
@@ -358,8 +355,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_enc_reg;
 	}
 
+	if (dev->venc_pdata->core_mode == VENC_DUAL_CORE_MODE) {
+		ret = of_platform_populate(pdev->dev.of_node,
+					   NULL, NULL, &pdev->dev);
+		if (ret) {
+			mtk_v4l2_err("Venc main device populate failed");
+			goto err_enc_reg;
+		}
+	}
+
 	mtk_v4l2_debug(0, "encoder %d registered as /dev/video%d",
-		       dev->venc_pdata->core_type, vfd_enc->num);
+		       core_type, vfd_enc->num);
 
 	return 0;
 
@@ -372,8 +378,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 err_enc_alloc:
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_res:
-	pm_runtime_disable(dev->pm.dev);
-	put_device(dev->pm.larbvenc);
+	if (dev->venc_pdata->core_mode == VENC_SINGLE_CORE_MODE) {
+		pm_runtime_disable(dev->pm.dev);
+		put_device(dev->pm.larbvenc);
+	}
 err_enc_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -387,6 +395,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 60000000,
 	.core_type = VENC_SYS,
+	.core_mode = VENC_SINGLE_CORE_MODE,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
@@ -397,6 +406,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 9000000,
 	.core_type = VENC_LT_SYS,
+	.core_mode = VENC_SINGLE_CORE_MODE,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
@@ -408,6 +418,7 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 40000000,
 	.core_type = VENC_SYS,
+	.core_mode = VENC_SINGLE_CORE_MODE,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
@@ -419,6 +430,7 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
 	.core_type = VENC_SYS,
+	.core_mode = VENC_SINGLE_CORE_MODE,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
@@ -430,6 +442,7 @@ static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
 	.core_type = VENC_SYS,
+	.core_mode = VENC_DUAL_CORE_MODE,
 };
 
 static const struct of_device_id mtk_vcodec_enc_match[] = {
@@ -457,8 +470,11 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_enc);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	pm_runtime_disable(dev->pm.dev);
-	put_device(dev->pm.larbvenc);
+
+	if (dev->venc_pdata->core_mode == VENC_SINGLE_CORE_MODE) {
+		pm_runtime_disable(dev->pm.dev);
+		put_device(dev->pm.larbvenc);
+	}
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
