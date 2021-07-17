Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCDDC636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 08:14:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD2D613C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 08:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAD2D613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bjh81Mbogc/bdpHhKT01dzCjLp6hExSXzzzW0oQwwfo=; b=f5eE/xZDOfjq05
	br8zkYsYZvVgHqu4zSDXxg2DA7gtD13CmMMAGtidKiClfR1mBXjArnFCo8RzP3OG+nC/zyzMWAp2e
	fy+BSkzPWkPz03JRez5zaaftzMbNj0/shiT2o2ISlaBMtFTk/KDcBqbdqHDn1Fj8iA5TgIu8PWp23
	hkehLPR30id5Izv63rSearPaLp30aM/rntuyu59qOo57j42TnMFKclGyv3jZ/ySjJnk0oOmT7WKCX
	lz/RKfb6A08mjJTbZuIfiTJTdy0OzTmbq1ueItbDSre9IlumMVx2m9dT8YRdvfF9lIFG8uwNux9hm
	OMDz5jD0bNvETWIPvP0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4fSV-0068lo-Og; Sat, 17 Jul 2021 08:14:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4fRJ-0068GO-IP; Sat, 17 Jul 2021 08:12:53 +0000
X-UUID: 1793224233244319ae473111559f1c62-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Xuxd1rJzS9vAl5fjBxAkrf+Pye1s8c//C3kfDJ2ErgY=; 
 b=Gfqq+BpOkkMOF49YnMkNiPt6DzMBBbHV52yKrBlFBUhUwTcO3anwWAGy+5pFwFWhA1CPf1OaHDd2/0o5SbASMZhY2yXBN2MDZ8o7u7eFWcUZRyZpyXkGx/7o7MDzFRf5gcJ8MZPPs0ueceV9ViT9WVNMDNnF+oiaVDL/gxilf/Y=;
X-UUID: 1793224233244319ae473111559f1c62-20210717
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1662167679; Sat, 17 Jul 2021 01:12:47 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 01:12:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 16:12:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 16:12:42 +0800
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
Subject: [PATCH v2,
 06/14] media: mtk-vcodec: Add irq interface for core hardware
Date: Sat, 17 Jul 2021 16:12:25 +0800
Message-ID: <20210717081233.7809-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717081233.7809-1-yunfei.dong@mediatek.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_011249_664215_C362E314 
X-CRM114-Status: GOOD (  23.15  )
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
v2: Using enum mtk_vdec_hw_count instead of magic numbers
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 31 ++++++++++++++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 11 ++++---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 19 +++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 32 ++++++++++++++++++-
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |  4 ++-
 5 files changed, 88 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e7f60e948fe8..d1c4124f6092 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -75,6 +75,20 @@ static void wake_up_ctx(struct mtk_vcodec_ctx *ctx)
 	wake_up_interruptible(&ctx->queue);
 }
 
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
@@ -246,7 +260,7 @@ static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
-	int ret = 0;
+	int ret = 0, i, hw_count;
 	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -260,7 +274,19 @@ static int fops_vcodec_open(struct file *file)
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
@@ -317,6 +343,7 @@ static int fops_vcodec_open(struct file *file)
 err_m2m_ctx_init:
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 err_ctrls_setup:
+err_init_queue:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index ea6d289d9773..34d51fe409c6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -59,11 +59,12 @@ static const struct component_ops mtk_vdec_hw_component_ops = {
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
@@ -94,7 +95,7 @@ static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
 	writel(readl(vdec_misc_addr) | VDEC_IRQ_CFG, vdec_misc_addr);
 	writel(readl(vdec_misc_addr) & ~VDEC_IRQ_CLR, vdec_misc_addr);
 
-	mtk_vdec_comp_wake_up_ctx(ctx);
+	mtk_vdec_comp_wake_up_ctx(ctx, dev->comp_idx);
 
 	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
 		ctx->id, dec_done_status);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 9d05ee72b2a7..76160b6f4152 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -109,6 +109,16 @@ enum mtk_vdec_hw_id {
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
@@ -261,6 +271,11 @@ struct vdec_pic_info {
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
@@ -303,6 +318,10 @@ struct mtk_vcodec_ctx {
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
index 70580c2525ba..306358d9bef0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
@@ -11,7 +11,7 @@
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
+int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx, int command,
 				 unsigned int timeout_ms)
 {
 	wait_queue_head_t *waitqueue;
@@ -43,3 +43,33 @@ int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
 	return status;
 }
 EXPORT_SYMBOL(mtk_vcodec_wait_for_done_ctx);
+
+int mtk_vcodec_wait_for_comp_done_ctx(struct mtk_vcodec_ctx *ctx,
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
index 638cd1f3526a..5ca611a1ddab 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
@@ -12,7 +12,9 @@
 struct mtk_vcodec_ctx;
 
 /* timeout is ms */
-int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *data, int command,
+int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx, int command,
 				unsigned int timeout_ms);
+int mtk_vcodec_wait_for_comp_done_ctx(struct mtk_vcodec_ctx *ctx,
+				int command, unsigned int timeout_ms, unsigned int hw_id);
 
 #endif /* _MTK_VCODEC_INTR_H_ */
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
