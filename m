Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8927C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 06:07:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A069B61186
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 06:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A069B61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9cKSn43mPigmSCwrK5eb8kORCte5VK2Bh3HERR5VHnE=; b=Mt5oBL44fIbPmN
	2vGAyJSOnv3dHUYBGCk1OeC+Tu74HDvspeqINkLivdhNBLLj5Hat4JtIerdSD+sFOvwPfqt9gwerf
	6IqvWUTjZlj/9/34aUrFIPksMWaGIYexBWujFnTUwUZBjO5RI0JTXK+jUgO77jQqpZ7ZV08wupx3n
	2SqTpEjyUgF+n1MvF9W/bM5QzLhjmmh0A2sbpZrqA2CIxw1dgdqZpz9G5f0swTT2aNpUvOJXPm3Y0
	ccBisL8NLIkIqPD9HSXFNcs805NbK2C3nE8GLgFpswVOrrZ8NZvbOAb0SGUXA3JGc0fJ7G93ZCsGz
	g6eJe6/39AVE0uE5Y5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvw2e-009Ulg-UN; Wed, 23 Jun 2021 06:07:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvw2D-009Uc7-NF; Wed, 23 Jun 2021 06:06:51 +0000
X-UUID: 6867dd2fe6634c74907b915bdaa7adeb-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AdEuzKQu1jsghgNXGnnPVeA7bHgyMSHbBLtEuwxBp/Y=; 
 b=llvy2FX+W9oaglnDraxXYUZ5zto4z9ApDm6q/65E0pvuyIEzyhDYHePsxop8zvecgRv7W2hM/6AyZYjr9xKX8PP3A1V+alxGgq74EULANv140gGnvnNBTPWRsDxMPK1SvQVawCVC0H8gRVfdp27w4P2qCJvuElQDseLh5L+wjuI=;
X-UUID: 6867dd2fe6634c74907b915bdaa7adeb-20210622
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1492804226; Tue, 22 Jun 2021 23:06:42 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 23:06:40 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 14:06:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 14:06:37 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Rick Chang
 <rick.chang@mediatek.com>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH 3/3] media: mtk-jpegenc: design SW algorithm for using
 multi-HW of jpegenc
Date: Wed, 23 Jun 2021 14:05:50 +0800
Message-ID: <1624428350-1424-4-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
References: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_230649_811960_3E38C052 
X-CRM114-Status: GOOD (  22.40  )
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

the SW algorithm would meet the request of how to use
multi-HW at the same time;
For user process, it only needed to open one device node to use
multi-HW.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 164 +++++++++++++++++++++---
 1 file changed, 147 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index c84815a..b8d1303 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -944,38 +944,150 @@ static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
 	return 0;
 }
 
-static void mtk_jpeg_enc_device_run(void *priv)
+static int mtk_jpeg_select_hw(struct mtk_jpeg_ctx *ctx)
 {
-	struct mtk_jpeg_ctx *ctx = priv;
+	int hw_id = -1;
+	int i;
+	unsigned long flags;
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg, *comp_jpeg = NULL;
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
+				 int hw_id,
+				 struct vb2_v4l2_buffer *src_buf,
+				 struct vb2_v4l2_buffer *dst_buf)
+{
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg->hw_dev[hw_id];
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
+	struct mtk_jpeg_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
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
+		//wait hw idle
+		ret = wait_event_interruptible(jpeg->hw_wq,
+					       (atomic_read(hw_rdy[0]) ||
+					       atomic_read(hw_rdy[1])) > 0);
+		if (ret != 0) {
+			pr_err("%s : %d, all HW are busy\n",
+			       __func__, __LINE__);
+			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+			return;
+		}
+		pr_info("%s : %d, NEW HW IDLE, please retry selcet!!!\n",
+			__func__, __LINE__);
+		goto retry_select;
+	}
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
 
-	ret = pm_runtime_get_sync(jpeg->dev);
-	if (ret < 0)
+	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
+	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
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
+	mtk_jpeg_set_hw_param(ctx, hw_id, src_buf, dst_buf);
+
+	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->pm.dev);
+	if (ret < 0) {
+		pr_err("%s : %d, pm_runtime_get_sync fail !!!\n",
+		       __func__, __LINE__);
 		goto enc_end;
+	}
 
-	schedule_delayed_work(&jpeg->job_timeout_work,
-			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
+	jpegenc_clk = comp_jpeg[hw_id]->pm.venc_clk.clk_info->jpegenc_clk;
+	ret = clk_prepare_enable(jpegenc_clk);
+	if (ret) {
+		pr_err("%s : %d, jpegenc clk_prepare_enable fail\n",
+		       __func__, __LINE__);
+		goto enc_end;
+	}
 
-	spin_lock_irqsave(&jpeg->hw_lock, flags);
+	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
+			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
 	/*
 	 * Resetting the hardware every frame is to ensure that all the
 	 * registers are cleared. This is a hardware requirement.
 	 */
-	mtk_jpeg_enc_reset(jpeg->reg_base);
-
-	mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf);
-	mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf);
-	mtk_jpeg_set_enc_params(ctx, jpeg->reg_base);
-	mtk_jpeg_enc_start(jpeg->reg_base);
-	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
+	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
+	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base[0]);
+	mtk_jpeg_set_enc_dst(ctx,
+			     comp_jpeg[hw_id]->reg_base[0],
+			     &dst_buf->vb2_buf);
+	mtk_jpeg_set_enc_src(ctx,
+			     comp_jpeg[hw_id]->reg_base[0],
+			     &src_buf->vb2_buf);
+	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base[0]);
+	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base[0]);
+	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
 	return;
 
 enc_end:
@@ -983,9 +1095,20 @@ static void mtk_jpeg_enc_device_run(void *priv)
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
@@ -1002,7 +1125,8 @@ static void mtk_jpeg_dec_device_run(void *priv)
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
 
-	if (mtk_jpeg_check_resolution_change(ctx, &jpeg_src_buf->dec_param)) {
+	if (mtk_jpeg_check_resolution_change(ctx,
+					     &jpeg_src_buf->dec_param)) {
 		mtk_jpeg_queue_src_chg_event(ctx);
 		ctx->state = MTK_JPEG_SOURCE_CHANGE;
 		v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
@@ -1017,7 +1141,8 @@ static void mtk_jpeg_dec_device_run(void *priv)
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
-	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
+	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param,
+				 &dst_buf->vb2_buf, &fb))
 		goto dec_end;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
@@ -1248,6 +1373,11 @@ static int mtk_jpeg_open(struct file *file)
 		goto free;
 	}
 
+	if (jpeg->variant->is_encoder) {
+		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
+		INIT_LIST_HEAD(&ctx->dst_done_queue);
+	}
+
 	v4l2_fh_init(&ctx->fh, vfd);
 	file->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
