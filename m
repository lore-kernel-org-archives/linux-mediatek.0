Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAEFC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:40:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AF661CB3
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31AF661CB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGDFPEYoCvxItbbXj9qP8vE4DIqxuKzqH5GZS7fesno=; b=0dBTRnbuSWspUI
	xV3GocRjl44Nho2aqiqBS8o2h/lExgB+CmGlTRX9P/Lb5nD//qWQxzfn0mpP4k4Ul9Bxu2+T86+7X
	Nl0Aeh6ZRy5PlCBcxFS7K1aXzXrFAZkEI0MIx6lYNdYqUXZOO0t0d0NMx9okJPQaEqsPK9XytgRKx
	1j2ty3FJAhMiF8lM+cTp7bJhCwR9aDwmUNJ7rMk/D/6TPQocUovHYr/LYWQ4k7TWbOtq2T66m1Vjh
	9/4ITrMVsV1/WiubNBl0f/VH86mXvQzn4whIS6EKBcsn1D3B153UHlvloI4faFvdI6Ug1cU13E3q3
	W9J5PVS1jkKhHnWTG3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m11Du-00DjUt-8o; Wed, 07 Jul 2021 06:39:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m116s-00Dfid-7g; Wed, 07 Jul 2021 06:32:40 +0000
X-UUID: 1efc1ed707804432923dfd1b82ef29cd-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FbikMSrQ3Pcewk41A1duG/5DmerPB42MwtQVV+ujvSY=; 
 b=UsfvKXZoulQfkas3aAFP8lH5ck1LuplSrjk89APXDJLIxF0YhvxxykLsDGtLc2/hXN72aeTq0GYKxwaA6jzj6ZwnoTXvgnNw+L6YElnyiw53ipIYNSWsjIwcZeTIIjyXNe/2yGREeQdm1Wi+K89C4Syb/FXYG2QF/Ph5BK+zYvg=;
X-UUID: 1efc1ed707804432923dfd1b82ef29cd-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1265052742; Tue, 06 Jul 2021 23:32:27 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 23:22:34 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:22 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1,
 06/14] media: mtk-vcodec: Add irq interface for core hardware
Date: Wed, 7 Jul 2021 14:21:49 +0800
Message-ID: <20210707062157.21176-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707062157.21176-1-yunfei.dong@mediatek.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_233238_371172_A3C44616 
X-CRM114-Status: GOOD (  25.91  )
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

Adds irq interface for core hardware.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 27 +++++++++++++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 18 ++++++-----
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  9 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 30 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |  2 ++
 5 files changed, 76 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 8f5b3c9345a4..ab9f06f250cd 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -74,6 +74,16 @@ static void wake_up_ctx(struct mtk_vcodec_ctx *ctx)
 	wake_up_interruptible(&ctx->queue);
 }
 
+static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dev *dev)
+{
+	if (dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
+		return 1;
+	else if (dev->vdec_pdata->hw_arch == MTK_VDEC_LAT_SINGLE_CORE)
+		return 2;
+	else
+		return 0;
+}
+
 static struct component_match *mtk_vcodec_match_add(
 	struct mtk_vcodec_dev *vdec_dev)
 {
@@ -240,7 +250,7 @@ static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
-	int ret = 0;
+	int ret = 0, i, hw_count;
 	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -254,7 +264,19 @@ static int fops_vcodec_open(struct file *file)
 	v4l2_fh_add(&ctx->fh);
 	INIT_LIST_HEAD(&ctx->list);
 	ctx->dev = dev;
-	init_waitqueue_head(&ctx->queue);
+
+	if (ctx->dev->is_support_comp) {
+		hw_count = mtk_vcodec_get_hw_count(dev);
+		if (!hw_count) {
+			ret = -EINVAL;
+			goto err_init_queue;
+		}
+		for (i = 0; i < hw_count; i++)
+			init_waitqueue_head(&ctx->core_queue[i]);
+	} else {
+		init_waitqueue_head(&ctx->queue);
+	}
+
 	mutex_init(&ctx->lock);
 
 	ctx->type = MTK_INST_DECODER;
@@ -311,6 +333,7 @@ static int fops_vcodec_open(struct file *file)
 err_m2m_ctx_init:
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 err_ctrls_setup:
+err_init_queue:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index a97bb1dd2cc4..2763ef298f8a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -58,11 +58,12 @@ static const struct component_ops mtk_vdec_hw_component_ops = {
 	.unbind = mtk_vdec_comp_unbind,
 };
 
-/* Wake up context wait_queue */
-static void mtk_vdec_comp_wake_up_ctx(struct mtk_vcodec_ctx *ctx)
+/* Wake up core context wait_queue */
+static void mtk_vdec_comp_wake_up_ctx(struct mtk_vcodec_ctx *ctx,
+	unsigned int hw_id)
 {
-	ctx->int_cond = 1;
-	wake_up_interruptible(&ctx->queue);
+	ctx->int_core_cond[hw_id] = 1;
+	wake_up_interruptible(&ctx->core_queue[hw_id]);
 }
 
 static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
@@ -93,7 +94,7 @@ static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
 	writel((readl(vdec_misc_addr) | VDEC_IRQ_CFG), vdec_misc_addr);
 	writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR), vdec_misc_addr);
 
-	mtk_vdec_comp_wake_up_ctx(ctx);
+	mtk_vdec_comp_wake_up_ctx(ctx, dev->comp_idx);
 
 	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
 		ctx->id, dec_done_status);
@@ -113,8 +114,7 @@ static int mtk_vdec_comp_init_irq(struct mtk_vdec_comp_dev *dev)
 	}
 
 	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
-				mtk_vdec_comp_irq_handler,
-				0, pdev->name, dev);
+				mtk_vdec_comp_irq_handler, 0, pdev->name, dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d (%d)",
 			dev->dec_irq, ret);
@@ -154,8 +154,10 @@ static int mtk_vdec_comp_probe(struct platform_device *pdev)
 		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
 
 	ret = mtk_vdec_comp_init_irq(dev);
-	if (ret)
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register irq handler.\n");
 		goto err;
+	}
 
 	platform_set_drvdata(pdev, dev);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 0539fc50ad4e..50c87bca3973 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -263,6 +263,11 @@ struct vdec_pic_info {
  *	   finish
  * @irq_status: irq status
  *
+ * @int_core_cond: variable used by the waitqueue  for component arch
+ * @int_core_type: type of the last interrupt for component arch
+ * @core_queue: waitqueue that can be used to wait for this context to
+ *	   finish for component arch
+ *
  * @ctrl_hdl: handler for v4l2 framework
  * @decode_work: worker for the decoding
  * @encode_work: worker for the encoding
@@ -305,6 +310,10 @@ struct mtk_vcodec_ctx {
 	wait_queue_head_t queue;
 	unsigned int irq_status;
 
+	int int_core_cond[MTK_VDEC_HW_MAX];
+	int int_core_type[MTK_VDEC_HW_MAX];
+	wait_queue_head_t core_queue[MTK_VDEC_HW_MAX];
+
 	struct v4l2_ctrl_handler ctrl_hdl;
 	struct work_struct decode_work;
 	struct work_struct encode_work;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
index 70580c2525ba..8411c670a761 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
@@ -43,3 +43,33 @@ int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
 	return status;
 }
 EXPORT_SYMBOL(mtk_vcodec_wait_for_done_ctx);
+
+int mtk_vcodec_wait_for_comp_done_ctx(struct mtk_vcodec_ctx  *ctx,
+	int command, unsigned int timeout_ms, unsigned hw_id)
+{
+	long timeout_jiff, ret;
+	int status = 0;
+
+	timeout_jiff = msecs_to_jiffies(timeout_ms);
+	ret = wait_event_interruptible_timeout(ctx->core_queue[hw_id],
+				ctx->int_core_cond[hw_id],
+				timeout_jiff);
+
+	if (!ret) {
+		status = -1;	/* timeout */
+		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec timeout=%ums (%d %d)",
+				ctx->id, command, ctx->type, timeout_ms,
+				ctx->int_core_cond[hw_id], ctx->int_core_type[hw_id]);
+	} else if (-ERESTARTSYS == ret) {
+		status = -1;
+		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec inter fail (%d %d)",
+				ctx->id, command, ctx->type,
+				ctx->int_core_cond[hw_id], ctx->int_core_type[hw_id]);
+	}
+
+	ctx->int_core_cond[hw_id] = 0;
+	ctx->int_core_type[hw_id] = 0;
+
+	return status;
+}
+EXPORT_SYMBOL(mtk_vcodec_wait_for_comp_done_ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
index 638cd1f3526a..345f63953fa1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
@@ -14,5 +14,7 @@ struct mtk_vcodec_ctx;
 /* timeout is ms */
 int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *data, int command,
 				unsigned int timeout_ms);
+int mtk_vcodec_wait_for_comp_done_ctx(struct mtk_vcodec_ctx  *ctx,
+				int command, unsigned int timeout_ms, unsigned int hw_id);
 
 #endif /* _MTK_VCODEC_INTR_H_ */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
