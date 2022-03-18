Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25F4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cadX9VlUx0tXVVfoK6zTLIlj2tDN6X22ECtzDpTjnHg=; b=eCKsM3MdJISXwH
	ZmgnRgHj9L3X1UyPeX/G9/W2zpK+MMTrmS+WhXBX4nl1lij3RazLES+XkhwQETEqP4Vqa3nBFa9/v
	bvdt/4zNgOVQgt2ZMpGRx48E1Ls1XI/L0Ztaeo8+F/YAviOPl5a9TTiHVP818zO6+Fc5sRlSajwtn
	Kolj/U7MkooS9FDyStqla0+P+8cfHSp2W2U2CFkOVBWP9eScxz94INgyTVNq6z3wBOxiQn3LkODjL
	j1bIZobU6Zi5lwaonWWVcEB4zNEDCA4CEjx7J6fEkpJz3+S+9c4jp5mFHclnGQ8ls//srB7iYCZ8U
	tU4yKrbfBaH1wIMWxhrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV76S-000cOM-4o; Fri, 18 Mar 2022 07:32:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV75F-000blZ-Oe; Fri, 18 Mar 2022 07:31:39 +0000
X-UUID: 0917d585545b4ba388445bfea0e045a0-20220318
X-UUID: 0917d585545b4ba388445bfea0e045a0-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 420719760; Fri, 18 Mar 2022 00:31:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 00:28:03 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 18 Mar 2022 15:28:01 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 15:27:59 +0800
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
Subject: [V2,5/7] media: mtk-jpegdec: add jpeg decode worker interface
Date: Fri, 18 Mar 2022 15:27:44 +0800
Message-ID: <1647588466-761-6-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1647588466-761-1-git-send-email-kyrie.wu@mediatek.com>
References: <1647588466-761-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_003137_836616_3DC6BD9A 
X-CRM114-Status: GOOD (  21.80  )
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

Add jpeg decoding worker to ensure that three HWs
run in parallel in MT8195.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 234 +++++++++++++++++-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |   6 +
 .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c |  17 ++
 3 files changed, 246 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index b764540a5e93..7ddbfbf0556f 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1098,6 +1098,180 @@ static void mtk_jpeg_enc_device_run(void *priv)
 	}
 }
 
+static int mtk_jpegdec_select_hw(struct mtk_jpeg_ctx *ctx)
+{
+	struct mtk_jpegdec_comp_dev *comp_jpeg;
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+	unsigned long flags;
+	int hw_id = -1;
+	int i;
+
+	spin_lock_irqsave(&jpeg->hw_lock, flags);
+	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+		comp_jpeg = jpeg->dec_hw_dev[i];
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
+static int mtk_jpegdec_deselect_hw(struct mtk_jpeg_dev *jpeg, int hw_id)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&jpeg->hw_lock, flags);
+	jpeg->dec_hw_dev[hw_id]->hw_state =
+		MTK_JPEG_HW_IDLE;
+	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
+
+	return 0;
+}
+
+static int mtk_jpegdec_set_hw_param(struct mtk_jpeg_ctx *ctx,
+				    int hw_id,
+				    struct vb2_v4l2_buffer *src_buf,
+				    struct vb2_v4l2_buffer *dst_buf)
+{
+	struct mtk_jpegdec_comp_dev *jpeg =
+		ctx->jpeg->dec_hw_dev[hw_id];
+
+	jpeg->hw_param.curr_ctx = ctx;
+	jpeg->hw_param.src_buffer = src_buf;
+	jpeg->hw_param.dst_buffer = dst_buf;
+
+	return 0;
+}
+
+static void mtk_jpegdec_worker(struct work_struct *work)
+{
+	struct mtk_jpeg_ctx *ctx = container_of(work, struct mtk_jpeg_ctx,
+		jpeg_work);
+	struct mtk_jpegdec_comp_dev *comp_jpeg[MTK_JPEGDEC_HW_MAX];
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
+	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+	atomic_t *hw_rdy[MTK_JPEGDEC_HW_MAX];
+	int ret, i, hw_id = 0;
+	struct mtk_jpeg_bs bs;
+	struct mtk_jpeg_fb fb;
+	unsigned long flags;
+
+	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+		comp_jpeg[i] = jpeg->dec_hw_dev[i];
+		hw_rdy[i] = &comp_jpeg[i]->hw_rdy;
+	}
+
+retry_select:
+	hw_id = mtk_jpegdec_select_hw(ctx);
+	if (hw_id < 0) {
+		ret = wait_event_interruptible_timeout(jpeg->dec_hw_wq,
+						       (atomic_read(hw_rdy[0]) ||
+							atomic_read(hw_rdy[1]) ||
+							atomic_read(hw_rdy[2])) > 0,
+						       MTK_JPEG_HW_TIMEOUT_MSEC);
+		if (ret != 0) {
+			dev_err(jpeg->dev, "%s : %d, all HW are busy\n",
+				__func__, __LINE__);
+			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+			return;
+		}
+
+		dev_err(jpeg->dev, "%s : %d, NEW HW IDLE, please retry selcet!!!\n",
+			__func__, __LINE__);
+		goto retry_select;
+	}
+
+	atomic_dec(&comp_jpeg[hw_id]->hw_rdy);
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	if (!src_buf) {
+		dev_err(jpeg->dev, "%s : %d, get src_buf fail !!!\n",
+			__func__, __LINE__);
+		goto getbuf_fail;
+	}
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	if (!dst_buf) {
+		dev_err(jpeg->dev, "%s : %d, get dst_buf fail !!!\n",
+			__func__, __LINE__);
+		goto getbuf_fail;
+	}
+
+	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
+	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
+
+	if (mtk_jpeg_check_resolution_change(ctx,
+					     &jpeg_src_buf->dec_param)) {
+		mtk_jpeg_queue_src_chg_event(ctx);
+		ctx->state = MTK_JPEG_SOURCE_CHANGE;
+		goto getbuf_fail;
+	}
+
+	jpeg_src_buf->curr_ctx = ctx;
+	jpeg_src_buf->frame_num = ctx->total_frame_num;
+	jpeg_dst_buf->curr_ctx = ctx;
+	jpeg_dst_buf->frame_num = ctx->total_frame_num;
+	ctx->total_frame_num++;
+
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
+	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
+	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
+	if (ret < 0) {
+		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
+			__func__, __LINE__);
+		goto dec_end;
+	}
+
+	ret = clk_prepare_enable(comp_jpeg[hw_id]->jdec_clk.clks->clk);
+	if (ret) {
+		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
+			__func__, __LINE__);
+		goto clk_end;
+	}
+
+	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
+			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
+
+	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
+	if (mtk_jpeg_set_dec_dst(ctx,
+				 &jpeg_src_buf->dec_param,
+				 &dst_buf->vb2_buf, &fb)) {
+		dev_err(jpeg->dev, "%s : %d, mtk_jpeg_set_dec_dst fail\n",
+			__func__, __LINE__);
+		goto setdst_end;
+	}
+
+	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
+	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
+	mtk_jpeg_dec_set_config(jpeg->reg_base,
+				&jpeg_src_buf->dec_param,
+				&bs,
+				&fb);
+	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
+	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
+
+	return;
+
+setdst_end:
+	clk_disable_unprepare(comp_jpeg[hw_id]->jdec_clk.clks->clk);
+clk_end:
+	pm_runtime_put(comp_jpeg[hw_id]->dev);
+dec_end:
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	v4l2_m2m_buf_done(dst_buf, buf_state);
+getbuf_fail:
+	atomic_inc(&comp_jpeg[hw_id]->hw_rdy);
+	mtk_jpegdec_deselect_hw(jpeg, hw_id);
+	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+}
+
 static void mtk_jpeg_dec_device_run(void *priv)
 {
 	struct mtk_jpeg_ctx *ctx = priv;
@@ -1110,6 +1284,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
 	struct mtk_jpeg_fb fb;
 	int ret;
 
+if (!jpeg->variant->is_multihw) {
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
@@ -1147,6 +1322,9 @@ static void mtk_jpeg_dec_device_run(void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+} else {
+	queue_work(jpeg->workqueue, &ctx->jpeg_work);
+}
 }
 
 static int mtk_jpeg_dec_job_ready(void *priv)
@@ -1349,7 +1527,7 @@ static int mtk_jpeg_open(struct file *file)
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
 	struct video_device *vfd = video_devdata(file);
 	struct mtk_jpeg_ctx *ctx;
-	int ret = 0;
+	int ret = 0, i;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -1360,8 +1538,21 @@ static int mtk_jpeg_open(struct file *file)
 		goto free;
 	}
 
-	if (jpeg->variant->is_multihw)
-		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
+	if (jpeg->variant->is_multihw) {
+		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+			if (jpeg->enc_hw_dev[i]) {
+				INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
+				break;
+			}
+		}
+
+		for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+			if (jpeg->dec_hw_dev[i]) {
+				INIT_WORK(&ctx->jpeg_work, mtk_jpegdec_worker);
+				break;
+			}
+		}
+	}
 
 	INIT_LIST_HEAD(&ctx->dst_done_queue);
 	v4l2_fh_init(&ctx->fh, vfd);
@@ -1455,7 +1646,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
 	int jpeg_irq;
-	int ret;
+	int ret, i;
 
 	jpeg = devm_kzalloc(&pdev->dev, sizeof(*jpeg), GFP_KERNEL);
 	if (!jpeg)
@@ -1499,13 +1690,34 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 			goto err_clk_init;
 		}
 	} else {
-		init_waitqueue_head(&jpeg->enc_hw_wq);
-		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
-							  WQ_MEM_RECLAIM | WQ_FREEZABLE);
-		if (!jpeg->workqueue) {
-			dev_err(&pdev->dev, "Failed to create jpeg workqueue!\n");
-			ret = -EINVAL;
-			goto err_alloc_workqueue;
+		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+			if (jpeg->enc_hw_dev[i]) {
+				init_waitqueue_head(&jpeg->enc_hw_wq);
+				jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
+									  WQ_MEM_RECLAIM |
+									  WQ_FREEZABLE);
+				if (!jpeg->workqueue) {
+					dev_err(&pdev->dev, "Failed to create jpegenc workqueue!\n");
+					ret = -EINVAL;
+					goto err_alloc_workqueue;
+				}
+				break;
+			}
+		}
+
+		for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+			if (jpeg->dec_hw_dev[i]) {
+				init_waitqueue_head(&jpeg->dec_hw_wq);
+				jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
+									  WQ_MEM_RECLAIM |
+									  WQ_FREEZABLE);
+				if (!jpeg->dec_workqueue) {
+					dev_err(&pdev->dev, "Failed to create jpegdec workqueue!\n");
+					ret = -EINVAL;
+					goto err_alloc_workqueue;
+				}
+				break;
+			}
 		}
 	}
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 1c75ce45f89a..a9378e88a728 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -175,6 +175,10 @@ struct mtk_jpegdec_comp_dev {
 	int hw_id;
 	struct delayed_work job_timeout_work;
 	struct mtk_jpeg_hw_param hw_param;
+	atomic_t hw_rdy;
+	enum mtk_jpeg_hw_state hw_state;
+	//spinlock protecting the hw device resource
+	spinlock_t hw_lock;
 };
 
 /**
@@ -210,6 +214,8 @@ struct mtk_jpeg_dev {
 
 	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
 	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
+	wait_queue_head_t dec_hw_wq;
+	struct workqueue_struct	*dec_workqueue;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
index 170018e26d49..783118e61701 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
@@ -446,6 +446,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	struct mtk_jpegdec_comp_dev *cjpeg =
 		container_of(work, struct mtk_jpegdec_comp_dev,
 			     job_timeout_work.work);
+	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 
 	src_buf = cjpeg->hw_param.src_buffer;
@@ -454,6 +455,9 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
 	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
 	pm_runtime_put(cjpeg->dev);
+	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
+	atomic_inc(&cjpeg->hw_rdy);
+	wake_up(&master_jpeg->dec_hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 }
@@ -500,8 +504,18 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 	pm_runtime_put(ctx->jpeg->dev);
 
+	if (ctx->fh.m2m_ctx &&
+	    (!list_empty(&ctx->fh.m2m_ctx->out_q_ctx.rdy_queue) ||
+	     !list_empty(&ctx->fh.m2m_ctx->cap_q_ctx.rdy_queue)))
+		queue_work(master_jpeg->workqueue, &ctx->jpeg_work);
+
+	jpeg->hw_state = MTK_JPEG_HW_IDLE;
+	wake_up(&master_jpeg->dec_hw_wq);
+	atomic_inc(&jpeg->hw_rdy);
+
 	return IRQ_HANDLED;
 }
 
@@ -551,6 +565,9 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev->plat_dev = pdev;
+	atomic_set(&dev->hw_rdy, 1U);
+	spin_lock_init(&dev->hw_lock);
+	dev->hw_state = MTK_JPEG_HW_IDLE;
 
 	INIT_DELAYED_WORK(&dev->job_timeout_work,
 			  mtk_jpegdec_timeout_work);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
