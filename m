Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A6CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 12:09:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF1CA60F24
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 12:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF1CA60F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsMm6JZOnK+xNDyFQz+34qyz+nsYq2oPMmm8NdI9s1M=; b=1S3h2k9crynwoJ
	YoKC0NCK+82UdMUqzkppPxtVbFahhlK04YZh2IQsaz23q1/9LnDpEq9e9BxKmZ1UZgsPkRk6B+8nt
	so3KLpJlrl9PduEiLoYShhNX5jFIRSFtRkRK/4crUtN8azXCykPF9q5KqzxSm6XpF3edbceAVJG55
	nbqgnQp4GfqhookXumksHrDMdg2zP/nTvfUj/XNu2s+jVKk6tkrStoo+FIJCV8RMG/sqdVuy1MOip
	KsbjtqMJVEGZueA6lchlybFvNcEwHADzfNW4yr6Ckshh1VlbTTYMBUD2GE+o6+dw4tDXbT5aOJW7E
	mIPXFi2oH1t3D0Pr0/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhW7z-00GJbx-4z; Mon, 01 Nov 2021 12:09:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhW6n-00GIzs-Dj; Mon, 01 Nov 2021 12:08:15 +0000
X-UUID: e13caaaf678c44128c81f1aa7d13d9ba-20211101
X-UUID: e13caaaf678c44128c81f1aa7d13d9ba-20211101
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1868328631; Mon, 01 Nov 2021 05:08:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 05:08:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 1 Nov 2021 20:08:03 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Nov 2021 20:08:02 +0800
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
Subject: [PATCH V5,4/5] media: mtk-jpegenc: add jpeg encode worker interface
Date: Mon, 1 Nov 2021 20:07:49 +0800
Message-ID: <1635768470-24178-5-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1635768470-24178-1-git-send-email-kyrie.wu@mediatek.com>
References: <1635768470-24178-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_050813_497225_0D683A99 
X-CRM114-Status: GOOD (  28.47  )
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

Add jpeg encoding worker to ensure that two HWs
run in parallel in MT8195.
1. In the traditional jpeg encode process of a single HW,
after putting buf to input queue, m2m_dev->curr_ctx
will be judged is null;
2. If m2m_dev->curr_ctx == null,
call the function of mtk_jpeg_enc_device_run for encoding;
Otherwise, it means that HW is currently
running and the program returns directly;
3. m2m_dev->curr_ctx is set to non-null
before calling mtk_jpeg_enc_device_run,
and is set to null after encoding is completed
in irq handler function;
4. m2m_dev->curr_ctx, defined in v4l2 architecture,
is a structure pointer variable,
not a pointer array, and cannot be valued multiple
times at the same time;
5. There are two encode HWs in mt8195.
Because the component framework is used to manage HWs,
only one v4l2 sub-device is registered,
so that there is only one m2m_dev->curr_ctx can be used,
but the two HWs need to run in parallel,
which is conflicts with the traditional jpeg encoding flow;
6. Add an encoding worker to solve this conflict.
The software operation process is as follows:
1) Only schedule worker operation is
performed in mtk_jpeg_enc_device_run,
and all encoding settings are changed to the worker function;
2) After the completion of encoding setting
and trigger HW in the worker function,
set m2m_dev->curr_ctx to null without waiting
for such operation in irq handler function;
3) If two HWs are busy at the same time,
and the program returns directly,
judge whether the input queue is empty
in the irq handler function.
If not, schedule worker ensures
that each input image will be encoded.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
V5: no change
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 176 +++++++++++++++++++---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  12 ++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c |  17 +++
 3 files changed, 186 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 3d8bee0..64353c9 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -111,6 +111,9 @@ struct mtk_jpeg_src_buf {
 	struct vb2_v4l2_buffer b;
 	struct list_head list;
 	struct mtk_jpeg_dec_param dec_param;
+
+	struct mtk_jpeg_ctx *curr_ctx;
+	u32 frame_num;
 };
 
 static int debug;
@@ -909,38 +912,145 @@ static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
 	return 0;
 }
 
-static void mtk_jpeg_enc_device_run(void *priv)
+static int mtk_jpeg_select_hw(struct mtk_jpeg_ctx *ctx)
 {
-	struct mtk_jpeg_ctx *ctx = priv;
+	struct mtk_jpegenc_comp_dev *comp_jpeg;
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+	unsigned long flags;
+	int hw_id = -1;
+	int i;
+
+	spin_lock_irqsave(&jpeg->hw_lock, flags);
+	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+		comp_jpeg = jpeg->hw_dev[i];
+		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
+			hw_id = i;
+			comp_jpeg->hw_state = MTK_JPEG_HW_BUSY;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
+
+	return hw_id;
+}
+
+static int mtk_jpeg_deselect_hw(struct mtk_jpeg_dev *jpeg, int hw_id)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&jpeg->hw_lock, flags);
+	jpeg->hw_dev[hw_id]->hw_state = MTK_JPEG_HW_IDLE;
+	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
+
+	return 0;
+}
+
+static int mtk_jpeg_set_hw_param(struct mtk_jpeg_ctx *ctx,
+	int hw_id,
+	struct vb2_v4l2_buffer *src_buf,
+	struct vb2_v4l2_buffer *dst_buf)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = ctx->jpeg->hw_dev[hw_id];
+
+	jpeg->hw_param.curr_ctx = ctx;
+	jpeg->hw_param.src_buffer = src_buf;
+	jpeg->hw_param.dst_buffer = dst_buf;
+
+	return 0;
+}
+
+static void mtk_jpegenc_worker(struct work_struct *work)
+{
+	struct mtk_jpeg_ctx *ctx = container_of(work, struct mtk_jpeg_ctx,
+		jpeg_work);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 	unsigned long flags;
-	int ret;
+	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
+	int ret, i, hw_id = 0;
+	atomic_t *hw_rdy[MTK_JPEGENC_HW_MAX];
+	struct clk *jpegenc_clk;
+
+	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+		comp_jpeg[i] = jpeg->hw_dev[i];
+		hw_rdy[i] = &comp_jpeg[i]->hw_rdy;
+	}
+
+retry_select:
+	hw_id = mtk_jpeg_select_hw(ctx);
+	if (hw_id < 0) {
+		ret = wait_event_interruptible(jpeg->hw_wq,
+			(atomic_read(hw_rdy[0]) ||
+			atomic_read(hw_rdy[1])) > 0);
+		if (ret != 0) {
+			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
+				__func__, __LINE__);
+			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+			return;
+		}
 
+		pr_info("%s : %d, NEW HW IDLE, please retry selcet!!!\n",
+			__func__, __LINE__);
+		goto retry_select;
+	}
+
+	atomic_dec(&comp_jpeg[hw_id]->hw_rdy);
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	if (!src_buf) {
+		pr_info("%s : %d, get src_buf fail !!!\n", __func__, __LINE__);
+		goto getbuf_fail;
+	}
+
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	if (!dst_buf) {
+		pr_info("%s : %d, get dst_buf fail !!!\n", __func__, __LINE__);
+		goto getbuf_fail;
+	}
 
-	ret = pm_runtime_resume_and_get(jpeg->dev);
-	if (ret < 0)
-		goto enc_end;
+	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
+	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
+	jpeg_src_buf->curr_ctx = ctx;
+	jpeg_src_buf->frame_num = ctx->total_frame_num;
+	jpeg_dst_buf->curr_ctx = ctx;
+	jpeg_dst_buf->frame_num = ctx->total_frame_num;
+	ctx->total_frame_num++;
 
-	schedule_delayed_work(&jpeg->job_timeout_work,
-			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	mtk_jpeg_set_hw_param(ctx, hw_id, src_buf, dst_buf);
+	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->pm.dev);
+	if (ret < 0) {
+		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
+			__func__, __LINE__);
+		goto enc_end;
+	}
 
-	spin_lock_irqsave(&jpeg->hw_lock, flags);
+	jpegenc_clk = comp_jpeg[hw_id]->pm.venc_clk.clk_info->jpegenc_clk;
+	ret = clk_prepare_enable(jpegenc_clk);
+	if (ret) {
+		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
+			__func__, __LINE__);
+		goto enc_end;
+	}
 
-	/*
-	 * Resetting the hardware every frame is to ensure that all the
-	 * registers are cleared. This is a hardware requirement.
-	 */
-	mtk_jpeg_enc_reset(jpeg->reg_base);
+	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
+		msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
+
+	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
+	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
+	mtk_jpeg_set_enc_dst(ctx,
+		comp_jpeg[hw_id]->reg_base,
+		&dst_buf->vb2_buf);
+	mtk_jpeg_set_enc_src(ctx,
+		comp_jpeg[hw_id]->reg_base,
+		&src_buf->vb2_buf);
+	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
+	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
+	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
 
-	mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf);
-	mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf);
-	mtk_jpeg_set_enc_params(ctx, jpeg->reg_base);
-	mtk_jpeg_enc_start(jpeg->reg_base);
-	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
 	return;
 
 enc_end:
@@ -948,9 +1058,20 @@ static void mtk_jpeg_enc_device_run(void *priv)
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
+getbuf_fail:
+	atomic_inc(&comp_jpeg[hw_id]->hw_rdy);
+	mtk_jpeg_deselect_hw(jpeg, hw_id);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
 
+static void mtk_jpeg_enc_device_run(void *priv)
+{
+	struct mtk_jpeg_ctx *ctx = priv;
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+
+	queue_work(jpeg->workqueue, &ctx->jpeg_work);
+}
+
 static void mtk_jpeg_dec_device_run(void *priv)
 {
 	struct mtk_jpeg_ctx *ctx = priv;
@@ -1218,6 +1339,9 @@ static int mtk_jpeg_open(struct file *file)
 		goto free;
 	}
 
+	if (jpeg->variant->is_encoder)
+		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
+
 	v4l2_fh_init(&ctx->fh, vfd);
 	file->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
@@ -1470,6 +1594,16 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to init clk\n");
 			goto err_clk_init;
 		}
+	} else {
+		init_waitqueue_head(&jpeg->hw_wq);
+
+		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
+			WQ_MEM_RECLAIM | WQ_FREEZABLE);
+		if (!jpeg->workqueue) {
+			dev_err(&pdev->dev, "Failed to create jpeg workqueue!\n");
+			ret = -EINVAL;
+			goto err_alloc_workqueue;
+		}
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
@@ -1549,6 +1683,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 
 err_clk_init:
 
+err_alloc_workqueue:
+
 err_req_irq:
 
 	return ret;
@@ -1564,6 +1700,8 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 	mtk_jpeg_clk_release(jpeg);
+	flush_workqueue(jpeg->workqueue);
+	destroy_workqueue(jpeg->workqueue);
 
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 0689bcb..a9000da 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -75,6 +75,11 @@ struct mtk_jpeg_variant {
 	u32 cap_q_default_fourcc;
 };
 
+enum mtk_jpeg_hw_state {
+	MTK_JPEG_HW_IDLE = 0,
+	MTK_JPEG_HW_BUSY = 1,
+};
+
 struct mtk_jpeg_hw_param {
 	struct vb2_v4l2_buffer *src_buffer;
 	struct vb2_v4l2_buffer *dst_buffer;
@@ -128,6 +133,9 @@ struct mtk_jpegenc_comp_dev {
 	int jpegenc_irq;
 	struct delayed_work job_timeout_work;
 	struct mtk_jpeg_hw_param hw_param;
+	atomic_t hw_rdy;
+	enum mtk_jpeg_hw_state hw_state;
+	spinlock_t		hw_lock;
 };
 
 /**
@@ -163,6 +171,7 @@ struct mtk_jpeg_dev {
 	struct mtk_jpegenc_comp_dev *hw_dev[MTK_JPEGENC_HW_MAX];
 	struct device_node *component_node[MTK_JPEGENC_HW_MAX];
 	int comp_idx;
+	wait_queue_head_t hw_wq;
 };
 
 /**
@@ -221,6 +230,9 @@ struct mtk_jpeg_ctx {
 	u8 enc_quality;
 	u8 restart_interval;
 	struct v4l2_ctrl_handler ctrl_hdl;
+
+	struct work_struct jpeg_work;
+	u32 total_frame_num;
 };
 
 extern struct platform_driver mtk_jpegenc_hw_driver;
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
index c3feb3a0..7b758fe 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
@@ -278,6 +278,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	struct mtk_jpegenc_comp_dev *cjpeg =
 		container_of(Pwork, struct mtk_jpegenc_comp_dev,
 		job_timeout_work);
+	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	struct vb2_v4l2_buffer *src_buf;
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 
@@ -286,6 +287,9 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
 	clk_disable_unprepare(cjpeg->pm.venc_clk.clk_info->jpegenc_clk);
 	pm_runtime_put(cjpeg->pm.dev);
+	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
+	atomic_inc(&cjpeg->hw_rdy);
+	wake_up(&master_jpeg->hw_wq);
 
 	v4l2_m2m_buf_done(src_buf, buf_state);
 }
@@ -327,7 +331,17 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	clk_disable_unprepare(jpeg->pm.venc_clk.clk_info->jpegenc_clk);
 	pm_runtime_put(ctx->jpeg->dev);
+	if (ctx->fh.m2m_ctx &&
+		(!list_empty(&ctx->fh.m2m_ctx->out_q_ctx.rdy_queue) ||
+		!list_empty(&ctx->fh.m2m_ctx->cap_q_ctx.rdy_queue))) {
+		queue_work(master_jpeg->workqueue, &ctx->jpeg_work);
+	}
+
+	jpeg->hw_state = MTK_JPEG_HW_IDLE;
+	wake_up(&master_jpeg->hw_wq);
+	atomic_inc(&jpeg->hw_rdy);
 
 	return IRQ_HANDLED;
 }
@@ -364,6 +378,9 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev->plat_dev = pdev;
+	atomic_set(&dev->hw_rdy, 1U);
+	spin_lock_init(&dev->hw_lock);
+	dev->hw_state = MTK_JPEG_HW_IDLE;
 
 	INIT_DELAYED_WORK(&dev->job_timeout_work, mtk_jpegenc_timeout_work);
 
-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
