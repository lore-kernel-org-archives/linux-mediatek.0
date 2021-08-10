Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38F7C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:38:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6735F60ED8
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6735F60ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhSVFaBUrh0TUWdX34FQyiI/Vwi8VqcjxUR2RkFRciM=; b=H+KlXeQmbQCA/K
	jQO9rYd7LImDOK0qtKq/3jGhuLYT9C0EZXYJMFjKGAR5ZrDk9Gec7pEdAPnAA4GhKdiaJstTmmZnn
	jH9DMq2PLS5MqevxRuI8bEfWT6beiQDFmikD2rRr5YOonxYIJ5LxgBRqMXKYIx6fd91ZvZSs+jbnX
	8wQqheA4yRDvA+oa2pBJTwmoTe4FWLrJgQN+QzGpwXLd7czc/uPWcoWogbiI+qvDo48U5kW2FCsW7
	Zj4d/T5hYw+Y7vt51gv2RIr+Aua8NevBxbUhOLJMp+6Eoqa0cgfylY27JRLiZwY/t8ihWn/UNxGHr
	ywaSJaNI8oGjN2aQVPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNH9-0034Ph-TN; Tue, 10 Aug 2021 08:38:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDNDC-0032Cb-Ia; Tue, 10 Aug 2021 08:34:17 +0000
X-UUID: 3a51ebf4eb13458ba1356f04e366ddb3-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CPvEVMUYgib5GIcgJZtc61L5ZP7yacUPL6cN8acfnM0=; 
 b=cjDK4/ZD3oPC33cHtseBNOe23yXtaztPjGxPtoNibe9zjP5H2aGL9tD5rKNted4NEUp8S0pLP87dJUmzzu16yEe5hyQIubXAa26HFqiBR4sWBdAP2gA75+WnLvr6lv940ZzjC7+moR+IMy0IvIIHSW/9RT0rjRL0Mt/YkPKlguo=;
X-UUID: 3a51ebf4eb13458ba1356f04e366ddb3-20210810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1661512651; Tue, 10 Aug 2021 01:33:58 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 01:31:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:31:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:31:28 +0800
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, George Sun
 <george.sun@mediatek.com>
Subject: [PATCH v4,
 07/15] media: mtk-vcodec: Add irq interface for multi hardware
Date: Tue, 10 Aug 2021 16:30:39 +0800
Message-ID: <20210810083047.16693-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210810083047.16693-1-yunfei.dong@mediatek.com>
References: <20210810083047.16693-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_013414_709514_83FFBF78 
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

Adds irq interface for multi hardware.

Change-Id: I9ed8f9538c83d9376a70bc125f77686ac85cedb9
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v4: no change
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 33 +++++++++++++++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  2 +-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 25 ++++++++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  4 +--
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 27 +++++++--------
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |  4 +--
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |  2 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |  2 +-
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |  2 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  2 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  2 +-
 12 files changed, 71 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index d93ea5c63e1e..d52e975292dc 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -68,6 +68,20 @@ static const struct component_master_ops mtk_vdec_ops = {
    .unbind = mtk_vdec_unbind,
 };
 
+static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dev *dev)
+{
+	switch (dev->vdec_pdata->hw_arch) {
+	case MTK_VDEC_PURE_SINGLE_CORE:
+		return MTK_VDEC_ONE_CORE;
+	case MTK_VDEC_LAT_SINGLE_CORE:
+		return MTK_VDEC_ONE_LAT_ONE_CORE;
+	default:
+		mtk_v4l2_err("not support hw arch:%d",
+			dev->vdec_pdata->hw_arch);
+		return MTK_VDEC_NO_HW;
+	}
+}
+
 static struct component_match *mtk_vcodec_match_add(
 	struct mtk_vcodec_dev *vdec_dev)
  {
@@ -134,7 +148,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 	writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR),
 		dev->reg_base[VDEC_MISC] + VDEC_IRQ_CFG_REG);
 
-	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, 0);
 
 	mtk_v4l2_debug(3,
 			"mtk_vcodec_dec_irq_handler :wake up ctx %d, dec_done_status=%x",
@@ -224,7 +238,7 @@ static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
-	int ret = 0;
+	int ret = 0, i, hw_count;
 	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -238,7 +252,19 @@ static int fops_vcodec_open(struct file *file)
 	v4l2_fh_add(&ctx->fh);
 	INIT_LIST_HEAD(&ctx->list);
 	ctx->dev = dev;
-	init_waitqueue_head(&ctx->queue);
+
+	if (ctx->dev->vdec_pdata->is_comp_supported) {
+		hw_count = mtk_vcodec_get_hw_count(dev);
+		if (!hw_count) {
+			ret = -EINVAL;
+			goto err_init_queue;
+		}
+		for (i = 0; i < hw_count; i++)
+			init_waitqueue_head(&ctx->queue[i]);
+	} else {
+		init_waitqueue_head(&ctx->queue[0]);
+	}
+
 	mutex_init(&ctx->lock);
 
 	ctx->type = MTK_INST_DECODER;
@@ -295,6 +321,7 @@ static int fops_vcodec_open(struct file *file)
 err_m2m_ctx_init:
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 err_ctrls_setup:
+err_init_queue:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index 5e1b7670ba5b..7a31afd294ba 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -87,7 +87,7 @@ static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
 	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
 	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
 
-	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->comp_idx);
 
 	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
 		ctx->id, dec_done_status);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 1d0798fd9adf..08fd43106fc7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -104,6 +104,16 @@ enum mtk_vdec_hw_id {
 	MTK_VDEC_HW_MAX,
 };
 
+/**
+ * struct mtk_vdec_hw_count - Supported hardware count
+ */
+enum mtk_vdec_hw_count {
+	MTK_VDEC_NO_HW = 0,
+	MTK_VDEC_ONE_CORE,
+	MTK_VDEC_ONE_LAT_ONE_CORE,
+	MTK_VDEC_MAX_HW_COUNT,
+};
+
 /*
  * struct mtk_video_fmt - Structure used to store information about pixelformats
  */
@@ -293,9 +303,9 @@ struct mtk_vcodec_ctx {
 	struct vdec_pic_info picinfo;
 	int dpb_size;
 
-	int int_cond;
-	int int_type;
-	wait_queue_head_t queue;
+	int int_cond[MTK_VDEC_HW_MAX];
+	int int_type[MTK_VDEC_HW_MAX];
+	wait_queue_head_t queue[MTK_VDEC_HW_MAX];
 	unsigned int irq_status;
 
 	struct v4l2_ctrl_handler ctrl_hdl;
@@ -501,11 +511,12 @@ static inline struct mtk_vcodec_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
 }
 
 /* Wake up context wait_queue */
-static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
+static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason,
+	unsigned int hw_id)
 {
-	ctx->int_cond = 1;
-	ctx->int_type = reason;
-	wake_up_interruptible(&ctx->queue);
+	ctx->int_cond[hw_id] = 1;
+	ctx->int_type[hw_id] = reason;
+	wake_up_interruptible(&ctx->queue[hw_id]);
 }
 
 #endif /* _MTK_VCODEC_DRV_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 2828df77020c..c7540c0cdcea 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -114,7 +114,7 @@ static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
 
 	clean_irq_status(ctx->irq_status, addr);
 
-	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, 0);
 	return IRQ_HANDLED;
 }
 
@@ -140,7 +140,7 @@ static int fops_vcodec_open(struct file *file)
 	v4l2_fh_add(&ctx->fh);
 	INIT_LIST_HEAD(&ctx->list);
 	ctx->dev = dev;
-	init_waitqueue_head(&ctx->queue);
+	init_waitqueue_head(&ctx->queue[0]);
 
 	ctx->type = MTK_INST_ENCODER;
 	ret = mtk_vcodec_enc_ctrls_setup(ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
index 70580c2525ba..8147533da98b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
@@ -11,34 +11,31 @@
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
-				 unsigned int timeout_ms)
+int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx,
+	int command, unsigned int timeout_ms, unsigned hw_id)
 {
-	wait_queue_head_t *waitqueue;
 	long timeout_jiff, ret;
 	int status = 0;
 
-	waitqueue = (wait_queue_head_t *)&ctx->queue;
 	timeout_jiff = msecs_to_jiffies(timeout_ms);
-
-	ret = wait_event_interruptible_timeout(*waitqueue,
-				ctx->int_cond,
+	ret = wait_event_interruptible_timeout(ctx->queue[hw_id],
+				ctx->int_cond[hw_id],
 				timeout_jiff);
 
 	if (!ret) {
 		status = -1;	/* timeout */
-		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d, wait_event_interruptible_timeout time=%ums out %d %d!",
-			     ctx->id, ctx->type, command, timeout_ms,
-			     ctx->int_cond, ctx->int_type);
+		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec timeout=%ums (%d %d)",
+				ctx->id, command, ctx->type, timeout_ms,
+				ctx->int_cond[hw_id], ctx->int_type[hw_id]);
 	} else if (-ERESTARTSYS == ret) {
-		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d, wait_event_interruptible_timeout interrupted by a signal %d %d",
-			     ctx->id, ctx->type, command, ctx->int_cond,
-			     ctx->int_type);
 		status = -1;
+		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec inter fail (%d %d)",
+				ctx->id, command, ctx->type,
+				ctx->int_cond[hw_id], ctx->int_type[hw_id]);
 	}
 
-	ctx->int_cond = 0;
-	ctx->int_type = 0;
+	ctx->int_cond[hw_id] = 0;
+	ctx->int_type[hw_id] = 0;
 
 	return status;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
index 638cd1f3526a..2bf4cabfaa43 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
@@ -12,7 +12,7 @@
 struct mtk_vcodec_ctx;
 
 /* timeout is ms */
-int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *data, int command,
-				unsigned int timeout_ms);
+int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx,
+				int command, unsigned int timeout_ms, unsigned int hw_id);
 
 #endif /* _MTK_VCODEC_INTR_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index 40d6e6c5ac7a..481655bb6016 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -413,7 +413,7 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		/* wait decoder done interrupt */
 		err = mtk_vcodec_wait_for_done_ctx(inst->ctx,
 						   MTK_INST_IRQ_RECEIVED,
-						   WAIT_INTR_TIMEOUT_MS);
+						   WAIT_INTR_TIMEOUT_MS, 0);
 		if (err)
 			goto err_free_fb_out;
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
index 4dde9ee786b4..d23baa364246 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
@@ -724,7 +724,7 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	/* wait decoder done interrupt */
 	err = mtk_vcodec_wait_for_done_ctx(inst->ctx,
 					   MTK_INST_IRQ_RECEIVED,
-					   WAIT_INTR_TIMEOUT_MS);
+					   WAIT_INTR_TIMEOUT_MS, 0);
 	if (err)
 		goto err_free_fb_out;
 	vpu_dec_end(vpu);
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
index e5393f841080..88c046731754 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
@@ -488,7 +488,7 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	/* wait decoder done interrupt */
 	mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-				     WAIT_INTR_TIMEOUT_MS);
+				     WAIT_INTR_TIMEOUT_MS, 0);
 
 	if (inst->vsi->load_data)
 		load_dec_table(inst);
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 71cdc3ddafcb..70b8383f7c8e 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -539,7 +539,7 @@ static bool vp9_wait_dec_end(struct vdec_vp9_inst *inst)
 
 	mtk_vcodec_wait_for_done_ctx(inst->ctx,
 			MTK_INST_IRQ_RECEIVED,
-			WAIT_INTR_TIMEOUT_MS);
+			WAIT_INTR_TIMEOUT_MS, 0);
 
 	if (ctx->irq_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
 		return true;
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index b6a4f2074fa5..9ae1bd8dbc32 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -335,7 +335,7 @@ static unsigned int h264_enc_wait_venc_done(struct venc_h264_inst *inst)
 	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst->ctx;
 
 	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
-					  WAIT_INTR_TIMEOUT_MS)) {
+					  WAIT_INTR_TIMEOUT_MS, 0)) {
 		irq_status = ctx->irq_status;
 		mtk_vcodec_debug(inst, "irq_status %x <-", irq_status);
 	}
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 8267a9c4fd25..f96564277577 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -222,7 +222,7 @@ static unsigned int vp8_enc_wait_venc_done(struct venc_vp8_inst *inst)
 	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst->ctx;
 
 	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
-					  WAIT_INTR_TIMEOUT_MS)) {
+					  WAIT_INTR_TIMEOUT_MS, 0)) {
 		irq_status = ctx->irq_status;
 		mtk_vcodec_debug(inst, "isr return %x", irq_status);
 	}
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
