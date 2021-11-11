Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 04:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 913626134F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 04:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 913626134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbbgAqe1OWINLPm01bH2TyCdlArudBzBuYgF499XILg=; b=AbgvzM9SSQHmqs
	jtgjEk93BzdQVjUPewQDZlHrAoANeQ1mKrZEcH+bmlHVTkvcJXyJjqq2jvrB6NmXHyU8mo1BG3VzF
	IeGKbv3dTjiQGoP8H0TNNJ49vRUlggJCbom6B+z7cLErjLLaU0tPo7nLgJQxLVS1Psk29DTvcD9yl
	g2ghosUNLRExQQxx/zA1BXrptazvFzRbE4+886pZNTOKX6O7ctVWJg3hPyBXu5x/ZUVB2ySyhbVxs
	NN6gDY28h4JH7VfERjna1wyt360ZN1g6s/RxoUVJ/lACJsa1KiRKPxTQJs/E16Q79LGFnOBrYxV+N
	XTL8PEuz5Vik+sgzagGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml1aJ-00739P-WE; Thu, 11 Nov 2021 04:21:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml1Uf-006zuO-7c; Thu, 11 Nov 2021 04:15:31 +0000
X-UUID: d1e62377411446aabf45be9da46a4ceb-20211110
X-UUID: d1e62377411446aabf45be9da46a4ceb-20211110
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 924875499; Wed, 10 Nov 2021 21:15:19 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Nov 2021 20:15:18 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 12:15:17 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 11 Nov 2021 12:15:16 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v10,
 11/19] media: mtk-vcodec: Generalize power and clock on/off interfaces
Date: Thu, 11 Nov 2021 12:14:52 +0800
Message-ID: <20211111041500.17363-12-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111041500.17363-1-yunfei.dong@mediatek.com>
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_201521_365430_07EE2C1D 
X-CRM114-Status: GOOD (  22.10  )
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

Generalizes power and clock on/off interfaces to support different hardware.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  2 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  4 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 76 ++++++++++++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  8 +-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
 .../platform/mtk-vcodec/mtk_vcodec_util.c     | 87 ++++++++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |  8 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   | 21 ++---
 9 files changed, 174 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index b49ca8240185..652a5a141887 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -86,7 +86,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_MISC] +
 					VDEC_IRQ_CFG_REG;
 
-	ctx = mtk_vcodec_get_curr_ctx(dev);
+	ctx = mtk_vcodec_get_curr_ctx(dev, MTK_VDEC_CORE);
 
 	/* check if HW active or not */
 	cg_status = readl(dev->reg_base[0]);
@@ -236,7 +236,7 @@ static int fops_vcodec_open(struct file *file)
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-		ret = mtk_vcodec_dec_pw_on(&dev->pm);
+		ret = mtk_vcodec_dec_pw_on(dev, MTK_VDEC_LAT0);
 		if (ret < 0)
 			goto err_load_fw;
 		/*
@@ -297,7 +297,7 @@ static int fops_vcodec_release(struct file *file)
 	mtk_vcodec_dec_release(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh))
-		mtk_vcodec_dec_pw_off(&dev->pm);
+		mtk_vcodec_dec_pw_off(dev, MTK_VDEC_LAT0);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index 9f294470c06d..3b863f980e56 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -42,7 +42,7 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_HW_MISC] +
 					VDEC_IRQ_CFG_REG;
 
-	ctx = mtk_vcodec_get_curr_ctx(dev->main_dev);
+	ctx = mtk_vcodec_get_curr_ctx(dev->main_dev, dev->hw_idx);
 
 	/* check if HW active or not */
 	cg_status = readl(dev->reg_base[VDEC_HW_SYS]);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
index f7f36790629d..fdf1435fc932 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
@@ -34,6 +34,8 @@ enum mtk_vdec_hw_reg_idx {
  * @main_dev: main device
  * @reg_base: Mapped address of MTK Vcodec registers.
  *
+ * @curr_ctx: the context that is waiting for codec hardware
+ *
  * @dec_irq: decoder irq resource
  * @pm: power management control
  * @hw_idx: each hardware index
@@ -43,6 +45,8 @@ struct mtk_vdec_hw_dev {
 	struct mtk_vcodec_dev *main_dev;
 	void __iomem *reg_base[VDEC_HW_MAX];
 
+	struct mtk_vcodec_ctx *curr_ctx;
+
 	int dec_irq;
 	struct mtk_vcodec_pm pm;
 	int hw_idx;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 221cf60e9fbf..4cf03d38d141 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -5,11 +5,13 @@
  */
 
 #include <linux/clk.h>
+#include <linux/interrupt.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <soc/mediatek/smi.h>
 
+#include "mtk_vcodec_dec_hw.h"
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
 
@@ -86,10 +88,23 @@ void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
 
-int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
+int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
+	struct mtk_vdec_hw_dev *subdev_dev;
+	struct mtk_vcodec_pm *pm;
 	int ret;
 
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return -EINVAL;
+		}
+		pm = &subdev_dev->pm;
+	} else {
+		pm = &vdec_dev->pm;
+	}
+
 	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
@@ -98,21 +113,50 @@ int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_on);
 
-void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
+	struct mtk_vdec_hw_dev *subdev_dev;
+	struct mtk_vcodec_pm *pm;
 	int ret;
 
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return;
+		}
+		pm = &subdev_dev->pm;
+	} else {
+		pm = &vdec_dev->pm;
+	}
+
 	ret = pm_runtime_put_sync(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_off);
 
-void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
-	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
-	int ret, i = 0;
+	struct mtk_vdec_hw_dev *subdev_dev;
+	struct mtk_vcodec_pm *pm;
+	struct mtk_vcodec_clk *dec_clk;
+	int ret, i;
+
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return;
+		}
+		pm = &subdev_dev->pm;
+		enable_irq(subdev_dev->dec_irq);
+	} else {
+		pm = &vdec_dev->pm;
+		enable_irq(vdec_dev->dec_irq);
+	}
 
+	dec_clk = &pm->vdec_clk;
 	for (i = 0; i < dec_clk->clk_num; i++) {
 		ret = clk_prepare_enable(dec_clk->clk_info[i].vcodec_clk);
 		if (ret) {
@@ -135,11 +179,27 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_on);
 
-void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
-	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
-	int i = 0;
+	struct mtk_vdec_hw_dev *subdev_dev;
+	struct mtk_vcodec_pm *pm;
+	struct mtk_vcodec_clk *dec_clk;
+	int i;
 
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev\n");
+			return;
+		}
+		pm = &subdev_dev->pm;
+		disable_irq(subdev_dev->dec_irq);
+	} else {
+		pm = &vdec_dev->pm;
+		disable_irq(vdec_dev->dec_irq);
+	}
+
+	dec_clk = &pm->vdec_clk;
 	mtk_smi_larb_put(pm->larbvdec);
 	for (i = dec_clk->clk_num - 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index a3df6aef6cb9..6ae29fea4e7f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -13,9 +13,9 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm);
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
 
-int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm);
+int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
+void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
+void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
+void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
 
 #endif /* _MTK_VCODEC_DEC_PM_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 2478c004c02f..012509670af4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -284,6 +284,7 @@ struct vdec_pic_info {
  * @decoded_frame_cnt: number of decoded frames
  * @lock: protect variables accessed by V4L2 threads and worker thread such as
  *	  mtk_video_dec_buf.
+ * @hw_id: hardware index used to identify different hardware.
  *
  * @msg_queue: msg queue used to store lat buffer information.
  */
@@ -328,6 +329,7 @@ struct mtk_vcodec_ctx {
 
 	int decoded_frame_cnt;
 	struct mutex lock;
+	int hw_id;
 
 	struct vdec_msg_queue msg_queue;
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
index ac5973b6735f..2b6b454aced3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
@@ -6,7 +6,10 @@
 */
 
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
+#include "mtk_vcodec_dec_hw.h"
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_util.h"
 
@@ -81,25 +84,87 @@ void mtk_vcodec_mem_free(struct mtk_vcodec_ctx *data,
 }
 EXPORT_SYMBOL(mtk_vcodec_mem_free);
 
-void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *dev,
-	struct mtk_vcodec_ctx *ctx)
+void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dev *dev, int hw_idx)
 {
-	unsigned long flags;
+	struct platform_device *hw_pdev;
+	struct device_node *node;
+	struct mtk_vdec_hw_dev *main_dev;
+
+	if (hw_idx >= MTK_VDEC_HW_MAX || hw_idx < 0) {
+		mtk_v4l2_err("hw idx is out of range:%d", hw_idx);
+		return NULL;
+	}
+
+	if (dev->subdev_dev[hw_idx])
+		return dev->subdev_dev[hw_idx];
+
+	node = dev->subdev_node[hw_idx];
+	if (!node) {
+		mtk_v4l2_err("Get lat node fail:%d", hw_idx);
+		return NULL;
+	}
+
+	hw_pdev = of_find_device_by_node(node);
+	of_node_put(node);
+
+	if (WARN_ON(!hw_pdev)) {
+		mtk_v4l2_err("Get hw id(%d) node fail", hw_idx);
+		return NULL;
+	}
+
+	main_dev = platform_get_drvdata(hw_pdev);
+	if (!main_dev) {
+		mtk_v4l2_err("Get hw id(%d) pdev fail", hw_idx);
+		return NULL;
+	}
 
-	spin_lock_irqsave(&dev->irqlock, flags);
-	dev->curr_ctx = ctx;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
+	dev->subdev_dev[main_dev->hw_idx] = main_dev;
+	return main_dev;
+}
+EXPORT_SYMBOL(mtk_vcodec_get_hw_dev);
+
+void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+	struct mtk_vcodec_ctx *ctx, int hw_idx)
+{
+	unsigned long flags;
+	struct mtk_vdec_hw_dev *subdev_dev;
+
+	spin_lock_irqsave(&vdec_dev->irqlock, flags);
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev");
+			spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
+			return;
+		}
+		subdev_dev->curr_ctx = ctx;
+	} else {
+		vdec_dev->curr_ctx = ctx;
+	}
+	spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
 }
 EXPORT_SYMBOL(mtk_vcodec_set_curr_ctx);
 
-struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *dev)
+struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+	unsigned int hw_idx)
 {
 	unsigned long flags;
 	struct mtk_vcodec_ctx *ctx;
-
-	spin_lock_irqsave(&dev->irqlock, flags);
-	ctx = dev->curr_ctx;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
+	struct mtk_vdec_hw_dev *subdev_dev;
+
+	spin_lock_irqsave(&vdec_dev->irqlock, flags);
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (!subdev_dev) {
+			mtk_v4l2_err("Failed to get hw dev");
+			spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
+			return NULL;
+		}
+		ctx = subdev_dev->curr_ctx;
+	} else {
+		ctx = vdec_dev->curr_ctx;
+	}
+	spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
 	return ctx;
 }
 EXPORT_SYMBOL(mtk_vcodec_get_curr_ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
index b999d7b84ed1..fc5d37e56bb1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
@@ -79,8 +79,10 @@ int mtk_vcodec_mem_alloc(struct mtk_vcodec_ctx *data,
 				struct mtk_vcodec_mem *mem);
 void mtk_vcodec_mem_free(struct mtk_vcodec_ctx *data,
 				struct mtk_vcodec_mem *mem);
-void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *dev,
-	struct mtk_vcodec_ctx *ctx);
-struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *dev);
+void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+				struct mtk_vcodec_ctx *ctx, int hw_idx);
+struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
+				unsigned int hw_idx);
+void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dev *dev, int hw_idx);
 
 #endif /* _MTK_VCODEC_UTIL_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index 42008243ceac..05a5b240e906 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -24,21 +24,24 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 		break;
 	case V4L2_PIX_FMT_H264:
 		ctx->dec_if = &vdec_h264_if;
+		ctx->hw_id = MTK_VDEC_CORE;
 		break;
 	case V4L2_PIX_FMT_VP8:
 		ctx->dec_if = &vdec_vp8_if;
+		ctx->hw_id = MTK_VDEC_CORE;
 		break;
 	case V4L2_PIX_FMT_VP9:
 		ctx->dec_if = &vdec_vp9_if;
+		ctx->hw_id = MTK_VDEC_CORE;
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	mtk_vdec_lock(ctx);
-	mtk_vcodec_dec_clock_on(&ctx->dev->pm);
+	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
 	ret = ctx->dec_if->init(ctx);
-	mtk_vcodec_dec_clock_off(&ctx->dev->pm);
+	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
 	mtk_vdec_unlock(ctx);
 
 	return ret;
@@ -69,13 +72,11 @@ int vdec_if_decode(struct mtk_vcodec_ctx *ctx, struct mtk_vcodec_mem *bs,
 
 	mtk_vdec_lock(ctx);
 
-	mtk_vcodec_set_curr_ctx(ctx->dev, ctx);
-	mtk_vcodec_dec_clock_on(&ctx->dev->pm);
-	enable_irq(ctx->dev->dec_irq);
+	mtk_vcodec_set_curr_ctx(ctx->dev, ctx, ctx->hw_id);
+	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
 	ret = ctx->dec_if->decode(ctx->drv_handle, bs, fb, res_chg);
-	disable_irq(ctx->dev->dec_irq);
-	mtk_vcodec_dec_clock_off(&ctx->dev->pm);
-	mtk_vcodec_set_curr_ctx(ctx->dev, NULL);
+	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
+	mtk_vcodec_set_curr_ctx(ctx->dev, NULL, ctx->hw_id);
 
 	mtk_vdec_unlock(ctx);
 
@@ -103,9 +104,9 @@ void vdec_if_deinit(struct mtk_vcodec_ctx *ctx)
 		return;
 
 	mtk_vdec_lock(ctx);
-	mtk_vcodec_dec_clock_on(&ctx->dev->pm);
+	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
 	ctx->dec_if->deinit(ctx->drv_handle);
-	mtk_vcodec_dec_clock_off(&ctx->dev->pm);
+	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
 	mtk_vdec_unlock(ctx);
 
 	ctx->drv_handle = NULL;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
