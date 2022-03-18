Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310DBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 06:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjkVSNQfT6L5+6eIFHEFcqe95BWr1rJzSK4SZz+LEX0=; b=i9nxznWJaE0XVP
	h76WfTTXxdgvYTxli95e/8EyhiXHyAJfVsQRfMIhPgZJ4VT3uvX2d3Tha5nRNRGz5TySwap+rWk1K
	uWSoXR9g3lUsrfrpdxyAGho1Qpc5ptW1WSVfrsLorrN/tRwR1iZtpxDsWau8TMdSJ/oSYa1H3Uj66
	LF8ActVVkD5Yja+NEvtdNDy4LCcdy4cjHkAIqzU67eea8IfPk0g0bEr7brEeHTjqmEgXf/1ccrEts
	AcgGf7jwG3tU8Ened0E4Nfqe+59Ifrp2n+DYMT9mDYaOFTc146QB/HF3jIf4hWieVPBodIgkF1guY
	jURICBo6CX3Ca/n6W6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV65i-000T7u-A3; Fri, 18 Mar 2022 06:28:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV65C-000T0L-Rc; Fri, 18 Mar 2022 06:27:32 +0000
X-UUID: a3be90a019ca4384a5f95d7b931c1b22-20220317
X-UUID: a3be90a019ca4384a5f95d7b931c1b22-20220317
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1147637219; Thu, 17 Mar 2022 23:27:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 23:27:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 18 Mar 2022 14:27:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 14:27:18 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, kyrie wu
 <kyrie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [V8,3/6] media: mtk-jpegenc: manage jpegenc multi-hardware
Date: Fri, 18 Mar 2022 14:27:10 +0800
Message-ID: <1647584833-32750-4-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1647584833-32750-1-git-send-email-kyrie.wu@mediatek.com>
References: <1647584833-32750-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_232730_934422_B1D45368 
X-CRM114-Status: GOOD (  24.45  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

manage each hardware information, including irq/clk/power.
the hardware includes HW0 and HW1.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/Makefile      |  11 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  76 ++++++---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  38 +++++
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 157 ++++++++++++++++++
 4 files changed, 257 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/Makefile b/drivers/media/platform/mtk-jpeg/Makefile
index 76c33aad0f3f..69703db4b0a5 100644
--- a/drivers/media/platform/mtk-jpeg/Makefile
+++ b/drivers/media/platform/mtk-jpeg/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mtk_jpeg-objs := mtk_jpeg_core.o \
+obj-$(CONFIG_VIDEO_MEDIATEK_JPEG) += mtk_jpeg.o \
+	mtk-jpeg-enc-hw.o
+
+mtk_jpeg-y := mtk_jpeg_core.o \
 		 mtk_jpeg_dec_hw.o \
-		 mtk_jpeg_dec_parse.o \
-		 mtk_jpeg_enc_hw.o
-obj-$(CONFIG_VIDEO_MEDIATEK_JPEG) += mtk_jpeg.o
+		 mtk_jpeg_dec_parse.o
+
+mtk-jpeg-enc-hw-y := mtk_jpeg_enc_hw.o
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index d532f86e826e..35fd2b41f446 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1312,31 +1312,39 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	spin_lock_init(&jpeg->hw_lock);
 	jpeg->dev = &pdev->dev;
 	jpeg->variant = of_device_get_match_data(jpeg->dev);
-	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
 
-	jpeg->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(jpeg->reg_base)) {
-		ret = PTR_ERR(jpeg->reg_base);
-		return ret;
-	}
+	if (!jpeg->variant->is_multihw) {
+		INIT_DELAYED_WORK(&jpeg->job_timeout_work,
+				  mtk_jpeg_job_timeout_work);
 
-	jpeg_irq = platform_get_irq(pdev, 0);
-	if (jpeg_irq < 0)
-		return jpeg_irq;
+		jpeg->reg_base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(jpeg->reg_base)) {
+			ret = PTR_ERR(jpeg->reg_base);
+			return ret;
+		}
 
-	ret = devm_request_irq(&pdev->dev, jpeg_irq,
-			       jpeg->variant->irq_handler, 0, pdev->name, jpeg);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
-			jpeg_irq, ret);
-		goto err_req_irq;
-	}
+		jpeg_irq = platform_get_irq(pdev, 0);
+		if (jpeg_irq < 0)
+			return jpeg_irq;
 
-	ret = devm_clk_bulk_get(jpeg->dev, jpeg->variant->num_clks,
-				jpeg->variant->clks);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to init clk, err %d\n", ret);
-		goto err_clk_init;
+		ret = devm_request_irq(&pdev->dev,
+				       jpeg_irq,
+				       jpeg->variant->irq_handler,
+				       0,
+				       pdev->name, jpeg);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
+				jpeg_irq, ret);
+			goto err_req_irq;
+		}
+
+		ret = devm_clk_bulk_get(jpeg->dev,
+					jpeg->variant->num_clks,
+					jpeg->variant->clks);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to init clk\n");
+			goto err_clk_init;
+		}
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
@@ -1383,6 +1391,14 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		  jpeg->variant->dev_name, jpeg->vdev->num,
 		  VIDEO_MAJOR, jpeg->vdev->minor);
 
+	if (jpeg->variant->is_multihw) {
+		ret = devm_of_platform_populate(&pdev->dev);
+		if (ret) {
+			v4l2_err(&jpeg->v4l2_dev, "Master of platform populate failed.");
+			goto err_vfd_jpeg_register;
+		}
+	}
+
 	platform_set_drvdata(pdev, jpeg);
 
 	pm_runtime_enable(&pdev->dev);
@@ -1494,6 +1510,19 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 };
 
+static const struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
+	.is_multihw = true,
+	.formats = mtk_jpeg_enc_formats,
+	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
+	.qops = &mtk_jpeg_enc_qops,
+	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
+	.dev_name = "mtk-jpeg-enc",
+	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+};
+
+#if defined(CONFIG_OF)
 static const struct of_device_id mtk_jpeg_match[] = {
 	{
 		.compatible = "mediatek,mt8173-jpgdec",
@@ -1507,10 +1536,15 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mtk-jpgenc",
 		.data = &mtk_jpeg_drvdata,
 	},
+	{
+		.compatible = "mediatek,mt8195-jpgenc",
+		.data = &mtk8195_jpegenc_drvdata,
+	},
 	{},
 };
 
 MODULE_DEVICE_TABLE(of, mtk_jpeg_match);
+#endif
 
 static struct platform_driver mtk_jpeg_driver = {
 	.probe = mtk_jpeg_probe,
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 3e4811a41ba2..f6e980fde4ef 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -9,6 +9,7 @@
 #ifndef _MTK_JPEG_CORE_H
 #define _MTK_JPEG_CORE_H
 
+#include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -60,6 +61,7 @@ enum mtk_jpeg_ctx_state {
  * @cap_q_default_fourcc:	capture queue default fourcc
  */
 struct mtk_jpeg_variant {
+	bool is_multihw;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	struct mtk_jpeg_fmt *formats;
@@ -74,6 +76,39 @@ struct mtk_jpeg_variant {
 	u32 cap_q_default_fourcc;
 };
 
+enum mtk_jpegenc_hw_id {
+	MTK_JPEGENC_HW0,
+	MTK_JPEGENC_HW1,
+	MTK_JPEGENC_HW_MAX,
+};
+
+/**
+ * struct mtk_vcodec_clk - Structure used to store vcodec clock information
+ */
+struct mtk_jpegenc_clk {
+	struct clk_bulk_data *clks;
+	int clk_num;
+};
+
+/**
+ * struct mtk_jpegenc_comp_dev - JPEG COREX abstraction
+ * @dev:		        JPEG device
+ * @plat_dev:		    platform device data
+ * @reg_base:		    JPEG registers mapping
+ * @master_dev:		    mtk_jpeg_dev device
+ * @pm:	                mtk_jpegenc_pm
+ * @jpegenc_irq:	    jpeg encode irq num
+ */
+struct mtk_jpegenc_comp_dev {
+	struct device *dev;
+	struct platform_device *plat_dev;
+	void __iomem *reg_base;
+	struct mtk_jpeg_dev *master_dev;
+	struct mtk_jpegenc_clk venc_clk;
+	int jpegenc_irq;
+	int hw_id;
+};
+
 /**
  * struct mtk_jpeg_dev - JPEG IP abstraction
  * @lock:		the mutex protecting this structure
@@ -100,6 +135,9 @@ struct mtk_jpeg_dev {
 	void __iomem		*reg_base;
 	struct delayed_work job_timeout_work;
 	const struct mtk_jpeg_variant *variant;
+
+	void __iomem *reg_encbase[MTK_JPEGENC_HW_MAX];
+	struct mtk_jpegenc_comp_dev *enc_hw_dev[MTK_JPEGENC_HW_MAX];
 };
 
 /**
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
index a2b6e1f85c2d..e60aa0183c46 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
@@ -5,11 +5,27 @@
  *
  */
 
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <media/media-device.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-event.h>
 
+#include "mtk_jpeg_core.h"
 #include "mtk_jpeg_enc_hw.h"
 
 static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
@@ -30,6 +46,16 @@ static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
 	{.quality_param = 97, .hardware_value = JPEG_ENC_QUALITY_Q97},
 };
 
+#if defined(CONFIG_OF)
+static const struct of_device_id mtk_jpegenc_drv_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-jpgenc",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);
+#endif
+
 void mtk_jpeg_enc_reset(void __iomem *base)
 {
 	writel(0, base + JPEG_ENC_RSTB);
@@ -159,3 +185,134 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_params);
 
+static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
+{
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	enum vb2_buffer_state buf_state;
+	struct mtk_jpeg_ctx *ctx;
+	u32 result_size;
+	u32 irq_status;
+
+	struct mtk_jpegenc_comp_dev *jpeg = priv;
+	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
+
+	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
+		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
+	if (irq_status)
+		writel(0, jpeg->reg_base + JPEG_ENC_INT_STS);
+	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
+		return IRQ_NONE;
+
+	ctx = v4l2_m2m_get_curr_priv(master_jpeg->m2m_dev);
+	if (!ctx) {
+		v4l2_err(&master_jpeg->v4l2_dev, "Context is NULL\n");
+		return IRQ_HANDLED;
+	}
+
+	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
+	buf_state = VB2_BUF_STATE_DONE;
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	v4l2_m2m_buf_done(dst_buf, buf_state);
+	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	pm_runtime_put(ctx->jpeg->dev);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int ret;
+
+	dev->jpegenc_irq = platform_get_irq(pdev, 0);
+	if (dev->jpegenc_irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq resource");
+		return dev->jpegenc_irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev,
+			       dev->jpegenc_irq,
+			       mtk_jpegenc_hw_irq_handler,
+			       0,
+			       pdev->name, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to devm_request_irq %d (%d)",
+			dev->jpegenc_irq, ret);
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
+{
+	struct mtk_jpegenc_clk *jpegenc_clk;
+	struct mtk_jpeg_dev *master_dev;
+	struct mtk_jpegenc_comp_dev *dev;
+	int ret;
+
+	struct device *decs = &pdev->dev;
+
+	if (!decs->parent)
+		return -EPROBE_DEFER;
+
+	master_dev = dev_get_drvdata(decs->parent);
+	if (!master_dev)
+		return -EPROBE_DEFER;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->plat_dev = pdev;
+
+	jpegenc_clk = &dev->venc_clk;
+
+	jpegenc_clk->clk_num = devm_clk_bulk_get_all(&pdev->dev,
+						     &jpegenc_clk->clks);
+	if (jpegenc_clk->clk_num < 0)
+		return dev_err_probe(&pdev->dev, jpegenc_clk->clk_num,
+				     "Failed to get jpegenc clock count\n");
+
+	dev->reg_base =
+		devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->reg_base))
+		return PTR_ERR(dev->reg_base);
+
+	ret = mtk_jpegenc_hw_init_irq(dev);
+	if (ret)
+		return ret;
+
+	of_property_read_u32(decs->of_node, "mediatek,hw-id",
+			     &dev->hw_id);
+
+	if (dev->hw_id >= 0 || dev->hw_id < MTK_JPEGENC_HW_MAX) {
+		master_dev->enc_hw_dev[dev->hw_id] = dev;
+		master_dev->reg_encbase[dev->hw_id] = dev->reg_base;
+		dev->master_dev = master_dev;
+	} else {
+		return dev_err_probe(&pdev->dev, dev->hw_id,
+				     "Invalid hw id\n");
+	}
+
+	platform_set_drvdata(pdev, dev);
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+struct platform_driver mtk_jpegenc_hw_driver = {
+	.probe = mtk_jpegenc_hw_probe,
+	.driver = {
+		.name = "mtk-jpegenc-hw",
+		.of_match_table = of_match_ptr(mtk_jpegenc_drv_ids),
+	},
+};
+
+module_platform_driver(mtk_jpegenc_hw_driver);
+
+MODULE_DESCRIPTION("MediaTek JPEG encode HW driver");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
