Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7206C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:38:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 782B861D1B
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 782B861D1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Px9yIIevgA01obLvXBwsQEYWxfI8dKsO0f+h08+mtR0=; b=1yXpzOi5aGXqhn
	OvQC3bNmsMnaOaFAe8C8VMfLuppxT0XGJGqhRBL77HPQkkclvE6XEVOPGWRhyxW62KdLvA0IAiFfK
	KBD7H1iLJt2naFqqz9i9Esruq6YdIbm2Lc7LuXe5Y3o9D3MNzTFbvqM6M54B6suHWPmr2Oa+YvZhJ
	6LHnnozUhBsmhBo4yk12mC+Ov9SVTZRyH9dB7+JaH1Q17FrbJTNdBAx/Dr4/u8dib2smpaxZcnpqJ
	bQlmkjGGwjmkoz+6VoRk1olgJUxjiIJcWrp/juSfnHD6gFmfoTCsTU2KZIyTbmoEv2sVhuQt7f6Pe
	Y7Sgykp4DVaS9SUDwWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUnX-00D8LN-P8; Wed, 30 Jun 2021 07:38:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUnS-00D8GR-Jw; Wed, 30 Jun 2021 07:38:13 +0000
X-UUID: 1a321beb902d417696aa46e049cd8b17-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zQP9kwR3awu+9hP79tQ4HH5oe/ZbOFV6NkDP9AkHEiA=; 
 b=YIjE5QG+GemwujAaGwpsT7TVuN3IyU1zQv3BiU3oNNzra97YLQHyLA2bNjeMaH8Bz//zjAxaO3pUACMs6zk0o4y3IlsikWT76831QvVn8AAtIjsBa73/TZ9I6YUMu5nYTYC3xLfOw6b/h9ufQpS5rx9vPLLYeRavzhOKyCxk80c=;
X-UUID: 1a321beb902d417696aa46e049cd8b17-20210630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1051852373; Wed, 30 Jun 2021 00:38:08 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 00:28:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 15:28:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 15:28:18 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bin Liu
 <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2,
 7/9] media: mtk-jpegenc: Use component framework to manage each
 hardware information
Date: Wed, 30 Jun 2021 15:27:57 +0800
Message-ID: <1625038079-25815-8-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_003810_730261_F99A55D5 
X-CRM114-Status: GOOD (  26.47  )
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

Uses component framework to manage each hardware information which
includes irq/power/clk. The hardware includes jpegenc0, jpegenc1.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 185 +++++++++++++++++---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  16 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 196 ++++++++++++++++++++++
 3 files changed, 372 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 39101d1..bf519ba 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/component.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -1493,12 +1494,99 @@ static inline void mtk_jpeg_clk_release(struct mtk_jpeg_dev *jpeg)
 	put_device(jpeg->larb);
 }
 
+static  const struct of_device_id mtk_jpegenc_drv_ids[] = {
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
+
+static inline int mtk_vdec_compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static inline void mtk_vdec_release_of(struct device *dev, void *data)
+{
+	of_node_put(data);
+}
+
+static inline int mtk_jpegenc_bind(struct device *dev)
+{
+	struct mtk_jpeg_dev *data = dev_get_drvdata(dev);
+
+	return component_bind_all(dev, data);
+}
+
+static inline void mtk_jpegenc_unbind(struct device *dev)
+{
+	struct mtk_jpeg_dev *data = dev_get_drvdata(dev);
+
+	component_unbind_all(dev, data);
+}
+
+static const struct component_master_ops mtk_jpegenc_ops = {
+	.bind = mtk_jpegenc_bind,
+	.unbind = mtk_jpegenc_unbind,
+};
+
+static struct component_match *mtk_jpegenc_match_add(struct mtk_jpeg_dev *jpeg)
+{
+	struct device *dev = jpeg->dev;
+	struct component_match *match = NULL;
+	int i;
+	char compatible[128] = {0};
+
+	for (i = 0; i < ARRAY_SIZE(mtk_jpegenc_drv_ids); i++) {
+		struct device_node *comp_node;
+		enum mtk_jpegenc_hw_id comp_idx;
+		const struct of_device_id *of_id;
+
+		memcpy(compatible, mtk_jpegenc_drv_ids[i].compatible,
+		       sizeof(mtk_jpegenc_drv_ids[i].compatible));
+
+		comp_node = of_find_compatible_node(NULL, NULL,
+						    compatible);
+		if (!comp_node)
+			continue;
+
+		if (!of_device_is_available(comp_node)) {
+			of_node_put(comp_node);
+			v4l2_err(&jpeg->v4l2_dev, "Fail to get jpeg enc HW node\n");
+			continue;
+		}
+
+		of_id = of_match_node(mtk_jpegenc_drv_ids, comp_node);
+		if (!of_id) {
+			v4l2_err(&jpeg->v4l2_dev, "Failed to get match node\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		comp_idx = (enum mtk_jpegenc_hw_id)of_id->data;
+		v4l2_info(&jpeg->v4l2_dev, "Get component:hw_id(%d),jpeg_dev(0x%p),comp_node(0x%p)\n",
+			  comp_idx, jpeg, comp_node);
+
+		jpeg->component_node[comp_idx] = comp_node;
+
+		component_match_add_release(dev, &match, mtk_vdec_release_of,
+					    mtk_vdec_compare_of, comp_node);
+	}
+
+	return match;
+}
+
 static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
 	struct resource *res;
 	int jpeg_irq;
 	int ret;
+	struct component_match *match;
 
 	jpeg = devm_kzalloc(&pdev->dev, sizeof(*jpeg), GFP_KERNEL);
 	if (!jpeg)
@@ -1510,31 +1598,47 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	jpeg->variant = of_device_get_match_data(jpeg->dev);
 	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	jpeg->reg_base[0] = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(jpeg->reg_base)) {
-		ret = PTR_ERR(jpeg->reg_base);
-		return ret;
-	}
+	if (!jpeg->variant->is_encoder) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		jpeg->reg_base[MTK_JPEGENC_HW0] =
+			devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(jpeg->reg_base[MTK_JPEGENC_HW0])) {
+			ret = PTR_ERR(jpeg->reg_base[MTK_JPEGENC_HW0]);
+			return ret;
+		}
 
-	jpeg_irq = platform_get_irq(pdev, 0);
-	if (jpeg_irq < 0) {
-		dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n", jpeg_irq);
-		return jpeg_irq;
-	}
+		jpeg_irq = platform_get_irq(pdev, 0);
+		if (jpeg_irq < 0) {
+			dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n",
+				jpeg_irq);
+			return jpeg_irq;
+		}
 
-	ret = devm_request_irq(&pdev->dev, jpeg_irq,
-			       jpeg->variant->irq_handler, 0, pdev->name, jpeg);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
-			jpeg_irq, ret);
-		goto err_req_irq;
-	}
+		ret = devm_request_irq(&pdev->dev, jpeg_irq,
+				       jpeg->variant->irq_handler,
+				       0, pdev->name, jpeg);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
+				jpeg_irq, ret);
+			goto err_req_irq;
+		}
 
-	ret = mtk_jpeg_clk_init(jpeg);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to init clk, err %d\n", ret);
-		goto err_clk_init;
+		ret = mtk_jpeg_clk_init(jpeg);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to init clk\n");
+			goto err_clk_init;
+		}
+	} else {
+		init_waitqueue_head(&jpeg->hw_wq);
+
+		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
+							  WQ_MEM_RECLAIM |
+							  WQ_FREEZABLE);
+		if (!jpeg->workqueue) {
+			dev_err(&pdev->dev, "Failed to create jpeg workqueue!\n");
+			ret = -EINVAL;
+			goto err_alloc_workqueue;
+		}
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
@@ -1583,7 +1687,20 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, jpeg);
 
-	pm_runtime_enable(&pdev->dev);
+	if (jpeg->variant->is_encoder) {
+		match = mtk_jpegenc_match_add(jpeg);
+		if (IS_ERR_OR_NULL(match))
+			goto err_vfd_jpeg_register;
+
+		video_set_drvdata(jpeg->vdev, jpeg);
+		platform_set_drvdata(pdev, jpeg);
+		ret = component_master_add_with_match(&pdev->dev,
+						      &mtk_jpegenc_ops, match);
+		if (ret < 0)
+			goto err_vfd_jpeg_register;
+	} else {
+		pm_runtime_enable(&pdev->dev);
+	}
 
 	return 0;
 
@@ -1601,6 +1718,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 
 err_clk_init:
 
+err_alloc_workqueue:
+
 err_req_irq:
 
 	return ret;
@@ -1721,7 +1840,25 @@ static struct platform_driver mtk_jpeg_driver = {
 	},
 };
 
-module_platform_driver(mtk_jpeg_driver);
+static struct platform_driver * const mtk_jpeg_source_drivers[] = {
+	&mtk_jpegenc_hw_driver,
+	&mtk_jpeg_driver,
+};
+
+static int __init mtk_jpeg_init(void)
+{
+	return platform_register_drivers(mtk_jpeg_source_drivers,
+					 ARRAY_SIZE(mtk_jpeg_source_drivers));
+}
+
+static void __exit mtk_jpeg_exit(void)
+{
+	platform_unregister_drivers(mtk_jpeg_source_drivers,
+				    ARRAY_SIZE(mtk_jpeg_source_drivers));
+}
+
+module_init(mtk_jpeg_init);
+module_exit(mtk_jpeg_exit);
 
 MODULE_DESCRIPTION("MediaTek JPEG codec driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 03ff060..03ef719 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -125,6 +125,8 @@ struct mtk_jpegenc_pm {
  * @larb:		SMI device
  * @job_timeout_work:	IRQ timeout structure
  * @variant:		driver variant to be used
+ * @irqlock:		spinlock protecting for irq
+ * @dev_mutex:		the mutex protecting for device
  */
 struct mtk_jpeg_dev {
 	struct mutex		lock;
@@ -136,12 +138,18 @@ struct mtk_jpeg_dev {
 	void			*alloc_ctx;
 	struct video_device	*vdev;
 	struct device		*larb;
-	struct delayed_work job_timeout_work;
 	const struct mtk_jpeg_variant *variant;
 
+	struct clk		*clk_jpeg;
+	struct delayed_work job_timeout_work;
+	struct platform_device *plat_dev;
+	spinlock_t irqlock;	/* spinlock protecting for irq */
+	struct mutex dev_mutex;	/* the mutex protecting for device */
 	void __iomem *reg_base[MTK_JPEGENC_HW_MAX];
 	int jpegenc_irq;
 	struct mtk_jpeg_dev *hw_dev[MTK_JPEGENC_HW_MAX];
+	struct device_node *component_node[MTK_JPEGENC_HW_MAX];
+	int comp_idx;
 	struct mtk_jpegenc_pm pm;
 	enum mtk_jpeg_hw_state hw_state;
 	struct mtk_jpeg_hw_param hw_param;
@@ -149,6 +157,8 @@ struct mtk_jpeg_dev {
 	atomic_t hw_rdy;
 };
 
+extern struct platform_driver mtk_jpegenc_hw_driver;
+
 /**
  * struct mtk_jpeg_fmt - driver's internal color format data
  * @fourcc:	the fourcc code, 0 if not applicable
@@ -194,6 +204,7 @@ struct mtk_jpeg_q_data {
  * @enc_quality:	jpeg encoder quality
  * @restart_interval:	jpeg encoder restart interval
  * @ctrl_hdl:		controls handler
+ * @done_queue_lock:	spinlock protecting for buffer done queue
  */
 struct mtk_jpeg_ctx {
 	struct mtk_jpeg_dev		*jpeg;
@@ -213,4 +224,7 @@ struct mtk_jpeg_ctx {
 	struct work_struct jpeg_work;
 };
 
+void mtk_jpegenc_timeout_work(struct work_struct *work);
+irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv);
+
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
index 3da1011..9dc6d99 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
@@ -5,11 +5,21 @@
  *
  */
 
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "mtk_jpeg_core.h"
 #include "mtk_jpeg_enc_hw.h"
 
 static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
@@ -153,6 +163,182 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
 }
 
+static int mtk_jpegenc_hw_bind(struct device *dev,
+			       struct device *master, void *data)
+{
+	struct mtk_jpeg_dev *comp_priv = dev_get_drvdata(dev);
+	struct mtk_jpeg_dev *master_priv = data;
+	int i;
+
+	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+		if (dev->of_node != master_priv->component_node[i])
+			continue;
+		master_priv->hw_dev[i] = comp_priv;
+		comp_priv->comp_idx = i;
+		master_priv->reg_base[i] = comp_priv->reg_base[MTK_JPEGENC_HW0];
+		break;
+	}
+	if (i == MTK_JPEGENC_HW_MAX) {
+		dev_err(dev, "Failed to get component node\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static void mtk_jpegenc_hw_unbind(struct device *dev,
+				  struct device *master, void *data)
+{
+	struct mtk_jpeg_dev *comp_priv = dev_get_drvdata(dev);
+
+	comp_priv->reg_base[MTK_JPEGENC_HW0] = 0;
+}
+
+static const struct component_ops mtk_jpegenc_hw_component_ops = {
+	.bind = mtk_jpegenc_hw_bind,
+	.unbind = mtk_jpegenc_hw_unbind,
+};
+
+int mtk_jpegenc_init_pm(struct mtk_jpeg_dev *mtkdev)
+{
+	struct platform_device *pdev;
+	struct mtk_jpegenc_pm *pm;
+	struct mtk_jpegenc_clk *jpegenc_clk;
+	struct mtk_jpegenc_clk_info *clk_info;
+	int i, ret;
+
+	pdev = mtkdev->plat_dev;
+	pm->dev = &pdev->dev;
+	pm = &mtkdev->pm;
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
+			jpegenc_clk->clk_num,
+			sizeof(*clk_info),
+			GFP_KERNEL);
+	if (!jpegenc_clk->clk_info)
+		return -ENOMEM;
+
+	for (i = 0; i < jpegenc_clk->clk_num; i++) {
+		clk_info = &jpegenc_clk->clk_info[i];
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "clock-names", i,
+						    &clk_info->clk_name);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to get jpegenc clock name\n");
+			return ret;
+		}
+
+		clk_info->jpegenc_clk = devm_clk_get(&pdev->dev,
+						     clk_info->clk_name);
+		if (IS_ERR(clk_info->jpegenc_clk)) {
+			dev_err(&pdev->dev, "devm_clk_get (%d)%s fail",
+			       i, clk_info->clk_name);
+			return PTR_ERR(clk_info->jpegenc_clk);
+		}
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	return ret;
+}
+
+void mtk_jpegenc_release_pm(struct mtk_jpeg_dev *mtkdev)
+{
+	struct platform_device *pdev = mtkdev->plat_dev;
+
+	pm_runtime_disable(&pdev->dev);
+}
+
+static int mtk_jpegenc_hw_init_irq(struct mtk_jpeg_dev *dev)
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
+			       mtk_jpegenc_hw_irq_handler, 0, pdev->name, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to devm_request_irq %d (%d)",
+			dev->jpegenc_irq, ret);
+
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
+{
+	struct mtk_jpeg_dev *dev;
+	int ret;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+	dev->plat_dev = pdev;
+	spin_lock_init(&dev->irqlock);
+	mutex_init(&dev->dev_mutex);
+	atomic_set(&dev->hw_rdy, 1U);
+	spin_lock_init(&dev->hw_lock);
+
+	dev->hw_state = MTK_JPEG_HW_IDLE;
+	INIT_DELAYED_WORK(&dev->job_timeout_work, mtk_jpegenc_timeout_work);
+
+	ret = mtk_jpegenc_init_pm(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get jpeg enc clock source");
+		return ret;
+	}
+
+	dev->reg_base[MTK_JPEGENC_HW0] =
+		devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR((__force void *)dev->reg_base[MTK_JPEGENC_HW0])) {
+		ret = PTR_ERR((__force void *)dev->reg_base[MTK_JPEGENC_HW0]);
+		goto err;
+	}
+
+	ret = mtk_jpegenc_hw_init_irq(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register JPEGENC irq handler.\n");
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, dev);
+
+	ret = component_add(&pdev->dev, &mtk_jpegenc_hw_component_ops);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to component_add: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	mtk_jpegenc_release_pm(dev);
+	return ret;
+}
+
+static int mtk_jpegenc_remove(struct platform_device *pdev)
+{
+	struct mtk_jpeg_dev *dev = platform_get_drvdata(pdev);
+
+	mtk_jpegenc_release_pm(dev);
+
+	return 0;
+}
+
 #if defined(CONFIG_OF)
 static const struct of_device_id mtk_jpegenc_hw_ids[] = {
 	{
@@ -164,3 +350,13 @@ static const struct of_device_id mtk_jpegenc_hw_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_jpegenc_hw_ids);
 #endif
+
+struct platform_driver mtk_jpegenc_hw_driver = {
+	.probe	= mtk_jpegenc_hw_probe,
+	.remove = mtk_jpegenc_remove,
+	.driver	= {
+		.name	= "mtk-jpegenc-hw",
+		.of_match_table = of_match_ptr(mtk_jpegenc_hw_ids),
+	},
+};
+
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
