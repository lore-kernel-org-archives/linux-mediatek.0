Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFA0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 03:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKPUeCHMsAQ+Jh9S/8xBo6zxZW4K/CoNdBwm9IsH7n8=; b=BLtkm6+Un2i8Cz
	Oz/5PfyIdLsjcP40mOivhqhy5FS0wIaABWHM87vwFctA/siTrtkvv22aLeOH+f9MXJqBvAPCkQ2iV
	zOW6EOmUWPSacUw6/KD7nTCuUYM0WTDkS554Umh593Bumli4p29hnYhj51ED7YBkgYhTzWGXP+7PC
	6h3yv2a2aB3T1nI6qIed+BjMTzqErZFuHqnZdntmSLc8YMasGRLHgDMeDsdb7OCVki8IcjZO4PomW
	cpy9icmvkzlkW34MEISpVWim/RpOCijZVvpI9Gi5ZvBZYKo17FHmSSNL+cm14aDwwX/byFs4kU/Nq
	+c6AtsdHb9qvyLX5wJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msz23-00E8oA-EU; Fri, 03 Dec 2021 03:14:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msz1W-00E8aD-OM; Fri, 03 Dec 2021 03:14:13 +0000
X-UUID: 95be8deb48c547eeb7e126675aea4615-20211202
X-UUID: 95be8deb48c547eeb7e126675aea4615-20211202
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1057393301; Thu, 02 Dec 2021 20:14:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 19:14:03 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 3 Dec 2021 11:14:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 3 Dec 2021 11:14:01 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <kyrie.wu@mediatek.com>, <irui.wang@mediatek.com>
Subject: [PATCH V6,  2/5] media: mtk-jpegenc: manage jpegenc multi-hardware
Date: Fri, 3 Dec 2021 11:13:47 +0800
Message-ID: <1638501230-13417-3-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_191410_876579_5F2CF049 
X-CRM114-Status: GOOD (  25.69  )
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

manage each hardware information, including irq/clk/power.
the hardware includes HW0 and HW1.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
V6: use of_platform_populate to replace component framework
to manage multi-hardware
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 103 +++++++---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  55 +++++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 232 +++++++++++++++++++++-
 3 files changed, 362 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index a89c7b2..da7eb84 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1353,33 +1353,40 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	spin_lock_init(&jpeg->hw_lock);
 	jpeg->dev = &pdev->dev;
 	jpeg->variant = of_device_get_match_data(jpeg->dev);
-	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(jpeg->reg_base)) {
-		ret = PTR_ERR(jpeg->reg_base);
-		return ret;
-	}
+	if (!jpeg->variant->is_encoder) {
+		INIT_DELAYED_WORK(&jpeg->job_timeout_work,
+				mtk_jpeg_job_timeout_work);
 
-	jpeg_irq = platform_get_irq(pdev, 0);
-	if (jpeg_irq < 0) {
-		dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n", jpeg_irq);
-		return jpeg_irq;
-	}
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
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
+		if (jpeg_irq < 0) {
+			dev_err(&pdev->dev, "Failed to get jpeg_irq.\n");
+			return jpeg_irq;
+		}
 
-	ret = mtk_jpeg_clk_init(jpeg);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to init clk, err %d\n", ret);
-		goto err_clk_init;
+		ret = devm_request_irq(&pdev->dev, jpeg_irq,
+				       jpeg->variant->irq_handler,
+					   0, pdev->name, jpeg);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
+				jpeg_irq, ret);
+			goto err_req_irq;
+		}
+
+		ret = mtk_jpeg_clk_init(jpeg);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to init clk(%d)\n", ret);
+			goto err_clk_init;
+		}
+
+		pm_runtime_enable(&pdev->dev);
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
@@ -1426,9 +1433,16 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		  jpeg->variant->dev_name, jpeg->vdev->num,
 		  VIDEO_MAJOR, jpeg->vdev->minor);
 
-	platform_set_drvdata(pdev, jpeg);
+	if (jpeg->variant->is_encoder) {
+		ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
+			&pdev->dev);
+		if (ret) {
+			v4l2_err(&jpeg->v4l2_dev, "Master of platform populate failed.");
+			goto err_vfd_jpeg_register;
+		}
+	}
 
-	pm_runtime_enable(&pdev->dev);
+	platform_set_drvdata(pdev, jpeg);
 
 	return 0;
 
@@ -1539,6 +1553,19 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 };
 
+static const struct mtk_jpeg_variant mtk_jpegenc_drvdata = {
+	.is_encoder = true,
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
@@ -1552,10 +1579,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mtk-jpgenc",
 		.data = &mtk_jpeg_drvdata,
 	},
+	{
+		.compatible = "mediatek,mt8195-jpgenc",
+		.data = &mtk_jpegenc_drvdata,
+	},
 	{},
 };
-
 MODULE_DEVICE_TABLE(of, mtk_jpeg_match);
+#endif
 
 static struct platform_driver mtk_jpeg_driver = {
 	.probe = mtk_jpeg_probe,
@@ -1567,7 +1598,25 @@ static struct platform_driver mtk_jpeg_driver = {
 	},
 };
 
-module_platform_driver(mtk_jpeg_driver);
+static struct platform_driver * const mtk_jpeg_source_drivers[] = {
+	&mtk_jpegenc_hw_driver,
+	&mtk_jpeg_driver,
+};
+static int __init mtk_jpeg_init(void)
+{
+	return platform_register_drivers(mtk_jpeg_source_drivers,
+		ARRAY_SIZE(mtk_jpeg_source_drivers));
+}
+
+static void __exit mtk_jpeg_exit(void)
+{
+	platform_unregister_drivers(mtk_jpeg_source_drivers,
+		ARRAY_SIZE(mtk_jpeg_source_drivers));
+}
+
+module_init(mtk_jpeg_init);
+module_exit(mtk_jpeg_exit);
+
 
 MODULE_DESCRIPTION("MediaTek JPEG codec driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 595f7f1..7d013de 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -60,6 +60,7 @@ enum mtk_jpeg_ctx_state {
  * @cap_q_default_fourcc:	capture queue default fourcc
  */
 struct mtk_jpeg_variant {
+	bool is_encoder;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	struct mtk_jpeg_fmt *formats;
@@ -74,6 +75,55 @@ struct mtk_jpeg_variant {
 	u32 cap_q_default_fourcc;
 };
 
+enum mtk_jpegenc_hw_id {
+	MTK_JPEGENC_HW0,
+	MTK_JPEGENC_HW1,
+	MTK_JPEGENC_HW_MAX,
+};
+
+/**
+ * struct mtk_jpegenc_clk_info - Structure used to store clock name
+ */
+struct mtk_jpegenc_clk_info {
+	const char	*clk_name;
+	struct clk	*jpegenc_clk;
+};
+
+/**
+ * struct mtk_vcodec_clk - Structure used to store vcodec clock information
+ */
+struct mtk_jpegenc_clk {
+	struct mtk_jpegenc_clk_info	*clk_info;
+	int	clk_num;
+};
+
+/**
+ * struct mtk_vcodec_pm - Power management data structure
+ */
+struct mtk_jpegenc_pm {
+	struct mtk_jpegenc_clk	venc_clk;
+	struct device	*dev;
+	struct mtk_jpegenc_comp_dev	*mtkdev;
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
+	struct device		*dev;
+	struct platform_device *plat_dev;
+	void __iomem		*reg_base;
+	struct mtk_jpeg_dev *master_dev;
+	struct mtk_jpegenc_pm pm;
+	int jpegenc_irq;
+};
+
 /**
  * struct mtk_jpeg_dev - JPEG IP abstraction
  * @lock:		the mutex protecting this structure
@@ -102,6 +152,9 @@ struct mtk_jpeg_dev {
 	struct device		*larb;
 	struct delayed_work job_timeout_work;
 	const struct mtk_jpeg_variant *variant;
+
+	void __iomem *reg_encbase[MTK_JPEGENC_HW_MAX];
+	struct mtk_jpegenc_comp_dev *enc_hw_dev[MTK_JPEGENC_HW_MAX];
 };
 
 /**
@@ -162,4 +215,6 @@ struct mtk_jpeg_ctx {
 	struct v4l2_ctrl_handler ctrl_hdl;
 };
 
+extern struct platform_driver mtk_jpegenc_hw_driver;
+
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
index 1cf037b..4ccda1d 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
@@ -4,12 +4,27 @@
  * Author: Xia Jiang <xia.jiang@mediatek.com>
  *
  */
-
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
@@ -30,6 +45,21 @@ static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
 	{.quality_param = 97, .hardware_value = JPEG_ENC_QUALITY_Q97},
 };
 
+#if defined(CONFIG_OF)
+static const struct of_device_id mtk_jpegenc_drv_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-jpgenc0",
+		.data = (void *)MTK_JPEGENC_HW0,
+	},
+	{
+		.compatible = "mediatek,mt8195-jpgenc1",
+		.data = (void *)MTK_JPEGENC_HW1,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);
+#endif
+
 void mtk_jpeg_enc_reset(void __iomem *base)
 {
 	writel(0, base + JPEG_ENC_RSTB);
@@ -152,3 +182,203 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 
 	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
 }
+
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
+	ret = devm_request_irq(&pdev->dev, dev->jpegenc_irq,
+		mtk_jpegenc_hw_irq_handler, 0, pdev->name, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to devm_request_irq %d (%d)",
+			dev->jpegenc_irq, ret);
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+int mtk_jpegenc_init_pm(struct mtk_jpegenc_comp_dev *mtkdev)
+{
+	struct mtk_jpegenc_clk_info *clk_info;
+	struct mtk_jpegenc_clk *jpegenc_clk;
+	struct platform_device *pdev;
+	struct mtk_jpegenc_pm *pm;
+	int i, ret;
+
+	pdev = mtkdev->plat_dev;
+	pm = &mtkdev->pm;
+	pm->dev = &pdev->dev;
+	pm->mtkdev = mtkdev;
+	jpegenc_clk = &pm->venc_clk;
+	jpegenc_clk->clk_num =
+		of_property_count_strings(pdev->dev.of_node, "clock-names");
+	if (!jpegenc_clk->clk_num) {
+		dev_err(&pdev->dev, "Failed to get jpegenc clock count\n");
+		return -EINVAL;
+	}
+
+	jpegenc_clk->clk_info = devm_kcalloc(&pdev->dev,
+		jpegenc_clk->clk_num,
+		sizeof(*clk_info),
+		GFP_KERNEL);
+	if (!jpegenc_clk->clk_info)
+		return -ENOMEM;
+
+	for (i = 0; i < jpegenc_clk->clk_num; i++) {
+		clk_info = &jpegenc_clk->clk_info[i];
+		ret = of_property_read_string_index(pdev->dev.of_node,
+			"clock-names", i,
+			&clk_info->clk_name);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to get jpegenc clock name\n");
+			return ret;
+		}
+
+		clk_info->jpegenc_clk = devm_clk_get(&pdev->dev,
+			clk_info->clk_name);
+		if (IS_ERR(clk_info->jpegenc_clk)) {
+			dev_err(&pdev->dev, "devm_clk_get (%d)%s fail",
+				i, clk_info->clk_name);
+			return PTR_ERR(clk_info->jpegenc_clk);
+		}
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	return ret;
+}
+
+void mtk_jpegenc_release_pm(struct mtk_jpegenc_comp_dev *mtkdev)
+{
+	struct platform_device *pdev = mtkdev->plat_dev;
+
+	pm_runtime_disable(&pdev->dev);
+}
+
+static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
+{
+	struct mtk_jpeg_dev *master_dev;
+	const struct of_device_id *of_id;
+	struct mtk_jpegenc_comp_dev *dev;
+	int ret, comp_idx;
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
+	ret = mtk_jpegenc_init_pm(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get jpeg enc clock source");
+		return ret;
+	}
+
+	dev->reg_base =
+		devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->reg_base)) {
+		ret = PTR_ERR(dev->reg_base);
+		goto err;
+	}
+
+	ret = mtk_jpegenc_hw_init_irq(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register JPEGENC irq handler.\n");
+		goto err;
+	}
+
+	of_id = of_match_device(mtk_jpegenc_drv_ids, decs);
+	if (!of_id) {
+		dev_err(&pdev->dev, "Can't get vdec comp device id.\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	comp_idx = (enum mtk_jpegenc_hw_id)of_id->data;
+	if (comp_idx < MTK_JPEGENC_HW_MAX) {
+		master_dev->enc_hw_dev[comp_idx] = dev;
+		master_dev->reg_encbase[comp_idx] = dev->reg_base;
+		dev->master_dev = master_dev;
+	}
+
+	platform_set_drvdata(pdev, dev);
+
+	return 0;
+
+err:
+	mtk_jpegenc_release_pm(dev);
+	return ret;
+}
+
+
+static int mtk_jpegenc_remove(struct platform_device *pdev)
+{
+	struct mtk_jpegenc_comp_dev *dev = platform_get_drvdata(pdev);
+
+	mtk_jpegenc_release_pm(dev);
+
+	return 0;
+}
+
+struct platform_driver mtk_jpegenc_hw_driver = {
+	.probe = mtk_jpegenc_hw_probe,
+	.remove = mtk_jpegenc_remove,
+	.driver = {
+		.name = "mtk-jpegenc-hw",
+		.of_match_table = of_match_ptr(mtk_jpegenc_drv_ids),
+	},
+};
-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
