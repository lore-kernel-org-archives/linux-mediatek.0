Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DA3C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D4261076
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D4261076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBi/gEH40y699qBbthXqjHdRXzZJNCZfBx7xbefvmzY=; b=auvuVUvtGoubc4
	voQCr500+eacqmv4puGkyQ46ftKw1/FAEYuxv2WRla1iLl/xaJ7EvOUlx3Z0IiVI/szE3LlKQdXmv
	1c2AdlLlMLuPGTGeGZxhLJBTsWX94KVbPoigFDlDOLpnyHjkwxGYWQEJ4Sn4CLDkqiRbCmbs6qMIS
	TLm2+Y9VnAMAIEVwyTOsJvphGhxJA+tCuhTSbXxohoWNKaMs+FVd374O0ZFHeep9lvDqLHQRvdhtv
	VEeK1cFdDpqDB/zbmcvcaGp52wk7jyPKdZaltwyuXw1+d7grs+48n2zcgh3TJu80MawuJbUHXYyqh
	bviTVZ/hfLR/TLEexVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvxEW-009iJr-QY; Wed, 23 Jun 2021 07:23:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvxEG-009iH9-6x; Wed, 23 Jun 2021 07:23:22 +0000
X-UUID: af39d867ccb04969b144235a1fc60c96-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SnV0q6t+SVdGtYcHBr1bfX/l9ez7M1wraZaDy//yc1A=; 
 b=na+YkDHRg1h8yTpP+tEx9auS+bZGxnXiz5pTiqrEB95mocJwyVtmbIWvLDvHYwE31qA895yqm8OZ+0t7ADH9zpAeDqKBAinslep7q/dTeTxdws/YDWy+KBavNHev/8/wKsVwHsAtQl5HMt8N/uqzAPxLrG+CEiY4T58XVABdcPE=;
X-UUID: af39d867ccb04969b144235a1fc60c96-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 217467879; Wed, 23 Jun 2021 00:23:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:13:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:13:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 15:13:11 +0800
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
Subject: [PATCH 3/3] media: mtk-jpegdec: design SW algorithm for using
 multi-HW of jpegdec
Date: Wed, 23 Jun 2021 15:13:03 +0800
Message-ID: <1624432383-2428-4-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1624432383-2428-1-git-send-email-kyrie.wu@mediatek.com>
References: <1624432383-2428-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_002320_320224_EE78112C 
X-CRM114-Status: GOOD (  24.90  )
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
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 274 ++++++++++++---------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c  |  92 +++++--
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h  |  14 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h |   1 +
 4 files changed, 238 insertions(+), 143 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index faa01b5..fe53356 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -338,6 +338,31 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 	return 0;
 }
 
+static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct v4l2_fh *fh = file->private_data;
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct vb2_queue *vq;
+	struct vb2_buffer *vb;
+	struct mtk_jpeg_src_buf *jpeg_src_buf;
+
+	if (buf->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		goto end;
+
+	vq = v4l2_m2m_get_vq(fh->m2m_ctx, buf->type);
+	if (buf->index >= vq->num_buffers) {
+		dev_err(ctx->jpeg->dev, "buffer index out of range\n");
+		return -EINVAL;
+	}
+
+	vb = vq->bufs[buf->index];
+	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(vb);
+	jpeg_src_buf->bs_size = buf->m.planes[0].bytesused;
+
+end:
+	return v4l2_m2m_qbuf(file, fh->m2m_ctx, buf);
+}
+
 static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
@@ -662,7 +687,7 @@ static const struct v4l2_ioctl_ops mtk_jpeg_dec_ioctl_ops = {
 	.vidioc_g_fmt_vid_out_mplane    = mtk_jpeg_g_fmt_vid_mplane,
 	.vidioc_s_fmt_vid_cap_mplane    = mtk_jpeg_s_fmt_vid_cap_mplane,
 	.vidioc_s_fmt_vid_out_mplane    = mtk_jpeg_s_fmt_vid_out_mplane,
-	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
+	.vidioc_qbuf                    = mtk_jpeg_qbuf,
 	.vidioc_subscribe_event         = mtk_jpeg_subscribe_event,
 	.vidioc_g_selection		= mtk_jpeg_dec_g_selection,
 
@@ -907,54 +932,22 @@ static const struct vb2_ops mtk_jpeg_enc_qops = {
 	.stop_streaming     = mtk_jpeg_enc_stop_streaming,
 };
 
-static void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
-				 struct vb2_buffer *src_buf,
-				 struct mtk_jpeg_bs *bs)
-{
-	bs->str_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-	bs->end_addr = bs->str_addr +
-		       round_up(vb2_get_plane_payload(src_buf, 0), 16);
-	bs->size = round_up(vb2_plane_size(src_buf, 0), 128);
-}
-
-static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
-				struct mtk_jpeg_dec_param *param,
-				struct vb2_buffer *dst_buf,
-				struct mtk_jpeg_fb *fb)
-{
-	int i;
-
-	if (param->comp_num != dst_buf->num_planes) {
-		dev_err(ctx->jpeg->dev, "plane number mismatch (%u != %u)\n",
-			param->comp_num, dst_buf->num_planes);
-		return -EINVAL;
-	}
-
-	for (i = 0; i < dst_buf->num_planes; i++) {
-		if (vb2_plane_size(dst_buf, i) < param->comp_size[i]) {
-			dev_err(ctx->jpeg->dev,
-				"buffer size is underflow (%lu < %u)\n",
-				vb2_plane_size(dst_buf, 0),
-				param->comp_size[i]);
-			return -EINVAL;
-		}
-		fb->plane_addr[i] = vb2_dma_contig_plane_dma_addr(dst_buf, i);
-	}
-
-	return 0;
-}
-
 static int mtk_jpeg_select_hw(struct mtk_jpeg_ctx *ctx)
 {
 	int hw_id = -1;
-	int i;
+	int i, num_hw = 0;
 	unsigned long flags;
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg, *comp_jpeg = NULL;
 
+	if (jpeg->variant->is_encoder)
+		num_hw = MTK_JPEGENC_HW_MAX;
+	else
+		num_hw = MTK_JPEGDEC_HW_MAX;
+
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+	for (i = 0; i < num_hw; i++) {
 		comp_jpeg = jpeg->hw_dev[i];
-		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
+		if (comp_jpeg && comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
 			comp_jpeg->hw_state = MTK_JPEG_HW_BUSY;
 			break;
@@ -1001,12 +994,15 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	unsigned long flags;
 	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
 	int ret, i, hw_id = 0;
-	atomic_t *hw_rdy[MTK_JPEGENC_HW_MAX];
+	atomic_t *hw[MTK_JPEGENC_HW_MAX];
 	struct clk *jpegenc_clk;
 
 	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
 		comp_jpeg[i] = jpeg->hw_dev[i];
-		hw_rdy[i] = &comp_jpeg[i]->hw_rdy;
+		if (comp_jpeg[i])
+			hw[i] = &comp_jpeg[i]->hw_rdy;
+		else
+			hw[i] = NULL;
 	}
 
 retry_select:
@@ -1014,8 +1010,8 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	if (hw_id < 0) {
 		//wait hw idle
 		ret = wait_event_interruptible(jpeg->hw_wq,
-					       (atomic_read(hw_rdy[0]) ||
-					       atomic_read(hw_rdy[1])) > 0);
+			((hw[0] ? atomic_read(hw[0]) : 1) ||
+			(hw[1] ? atomic_read(hw[1]) : 1)) > 0);
 		if (ret != 0) {
 			pr_err("%s : %d, all HW are busy\n",
 			       __func__, __LINE__);
@@ -1091,8 +1087,6 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	return;
 
 enc_end:
-	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 getbuf_fail:
@@ -1101,67 +1095,152 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
 
-static void mtk_jpeg_enc_device_run(void *priv)
+static void mtk_jpegdec_worker(struct work_struct *work)
 {
-	struct mtk_jpeg_ctx *ctx = priv;
-	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
-
-	queue_work(jpeg->workqueue, &ctx->jpeg_work);
-}
-
-static void mtk_jpeg_dec_device_run(void *priv)
-{
-	struct mtk_jpeg_ctx *ctx = priv;
+	struct mtk_jpeg_ctx *ctx = container_of(work, struct mtk_jpeg_ctx,
+		jpeg_work);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+	struct mtk_jpeg_dev *comp_jpeg[MTK_JPEGDEC_HW_MAX];
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 	unsigned long flags;
-	struct mtk_jpeg_src_buf *jpeg_src_buf;
+	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
+	int ret, i, hw_id = 0;
+	atomic_t *h[MTK_JPEGDEC_HW_MAX];
+	struct clk *jpegdec_clk;
 	struct mtk_jpeg_bs bs;
 	struct mtk_jpeg_fb fb;
-	int ret;
+
+	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+		comp_jpeg[i] = jpeg->hw_dev[i];
+		if (comp_jpeg[i])
+			h[i] = &comp_jpeg[i]->hw_rdy;
+		else
+			h[i] = NULL;
+	}
+
+retry_select:
+	hw_id = mtk_jpeg_select_hw(ctx);
+	if (hw_id < 0) {
+		//wait hw idle
+		ret = wait_event_interruptible(jpeg->hw_wq,
+					       (h[0] ? atomic_read(h[0]) : 1 ||
+					       h[1] ? atomic_read(h[1]) : 1 ||
+					       h[2] ? atomic_read(h[2]) : 1)
+					       > 0);
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
+
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
+	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
 
 	if (mtk_jpeg_check_resolution_change(ctx,
 					     &jpeg_src_buf->dec_param)) {
 		mtk_jpeg_queue_src_chg_event(ctx);
 		ctx->state = MTK_JPEG_SOURCE_CHANGE;
-		v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-		return;
+		goto getbuf_fail;
 	}
 
-	ret = pm_runtime_get_sync(jpeg->dev);
-	if (ret < 0)
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
+	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->dec_pm.dev);
+	if (ret < 0) {
+		pr_err("%s : %d, pm_runtime_get_sync fail !!!\n",
+		       __func__, __LINE__);
 		goto dec_end;
+	}
+
+	jpegdec_clk = comp_jpeg[hw_id]->dec_pm.dec_clk.clk_info->jpegdec_clk;
+	ret = clk_prepare_enable(jpegdec_clk);
+	if (ret) {
+		pr_err("%s : %d, jpegdec clk_prepare_enable fail\n",
+		       __func__, __LINE__);
+		goto clk_end;
+	}
 
-	schedule_delayed_work(&jpeg->job_timeout_work,
+	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
+	/*
+	 * Resetting the hardware every frame is to ensure that all the
+	 * registers are cleared. This is a hardware requirement.
+	 */
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param,
-				 &dst_buf->vb2_buf, &fb))
-		goto dec_end;
-
-	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	mtk_jpeg_dec_reset(jpeg->reg_base);
-	mtk_jpeg_dec_set_config(jpeg->reg_base,
-				&jpeg_src_buf->dec_param, &bs, &fb);
-
-	mtk_jpeg_dec_start(jpeg->reg_base);
-	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
+	   &dst_buf->vb2_buf, &fb)) {
+		pr_err("%s : %d, mtk_jpeg_set_dec_dst fail\n",
+		       __func__, __LINE__);
+		goto setdst_end;
+	}
+	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
+	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base[0]);
+	mtk_jpeg_dec_set_config(jpeg->reg_base[0], &jpeg_src_buf->dec_param,
+				jpeg_src_buf->bs_size,
+				&bs, &fb);
+	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base[0]);
+	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
 	return;
 
+setdst_end:
+	clk_disable_unprepare(jpegdec_clk);
+clk_end:
+	pm_runtime_put(comp_jpeg[hw_id]->dec_pm.dev);
 dec_end:
-	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
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
+static void mtk_jpeg_dec_device_run(void *priv)
+{
+	struct mtk_jpeg_ctx *ctx = priv;
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+
+	queue_work(jpeg->workqueue, &ctx->jpeg_work);
+}
+
 static int mtk_jpeg_dec_job_ready(void *priv)
 {
 	struct mtk_jpeg_ctx *ctx = priv;
@@ -1357,8 +1436,11 @@ static int mtk_jpeg_open(struct file *file)
 
 	if (jpeg->variant->is_encoder) {
 		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
-		INIT_LIST_HEAD(&ctx->dst_done_queue);
+	} else if (!jpeg->variant->is_encoder) {
+		INIT_WORK(&ctx->jpeg_work, mtk_jpegdec_worker);
 	}
+	spin_lock_init(&ctx->done_queue_lock);
+	INIT_LIST_HEAD(&ctx->dst_done_queue);
 
 	v4l2_fh_init(&ctx->fh, vfd);
 	file->private_data = &ctx->fh;
@@ -1427,35 +1509,6 @@ static struct clk_bulk_data mtk_jpeg_clocks[] = {
 	{ .id = "jpgenc" },
 };
 
-static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
-{
-	struct device_node *node;
-	struct platform_device *pdev;
-	int ret;
-
-	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
-	if (!node)
-		return -EINVAL;
-	pdev = of_find_device_by_node(node);
-	if (WARN_ON(!pdev)) {
-		of_node_put(node);
-		return -EINVAL;
-	}
-	of_node_put(node);
-
-	jpeg->larb = &pdev->dev;
-
-	ret = devm_clk_bulk_get(jpeg->dev, jpeg->variant->num_clks,
-				jpeg->variant->clks);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get jpeg clock:%d\n", ret);
-		put_device(&pdev->dev);
-		return ret;
-	}
-
-	return 0;
-}
-
 void mtk_jpeg_put_buf(struct mtk_jpeg_dev *jpeg)
 {
 	struct mtk_jpeg_ctx *ctx = NULL;
@@ -1507,7 +1560,6 @@ irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	struct mtk_jpeg_ctx *ctx;
 	struct mtk_jpeg_dev *master_jpeg;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	struct mtk_jpeg_src_buf *jpeg_dst_buf;
 
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 	u32 result_size;
@@ -1519,7 +1571,6 @@ irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	dst_buf = jpeg->hw_param.dst_buffer;
 	ctx = jpeg->hw_param.curr_ctx;
 	master_jpeg = ctx->jpeg;
-	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
 	irq_status = readl(jpeg->reg_base[MTK_JPEGENC_HW0] + JPEG_ENC_INT_STS) &
 		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
 	if (irq_status)
@@ -1611,12 +1662,10 @@ void mtk_jpegenc_timeout_work(struct work_struct *work)
 		job_timeout_work.work);
 	struct mtk_jpeg_ctx *ctx = NULL;
 	struct mtk_jpeg_dev *master_jpeg;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
+	struct vb2_v4l2_buffer *src_buf;
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 
 	src_buf = jpeg->hw_param.src_buffer;
-	dst_buf = jpeg->hw_param.dst_buffer;
 	ctx = jpeg->hw_param.curr_ctx;
 	if (!ctx) {
 		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
@@ -1629,9 +1678,6 @@ void mtk_jpegenc_timeout_work(struct work_struct *work)
 		return;
 	}
 
-	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
-	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
-
 	mtk_jpeg_enc_reset(jpeg->reg_base[MTK_JPEGENC_HW0]);
 	pm_runtime_put(jpeg->pm.dev);
 	clk_disable_unprepare(jpeg->pm.venc_clk.clk_info->jpegenc_clk);
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
index c1a5d08..491ff25 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
@@ -345,6 +345,43 @@ void mtk_jpeg_dec_reset(void __iomem *base)
 	mtk_jpeg_dec_hard_reset(base);
 }
 
+void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
+			  struct vb2_buffer *src_buf,
+			  struct mtk_jpeg_bs *bs)
+{
+	bs->str_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
+	bs->end_addr = bs->str_addr +
+		       round_up(vb2_get_plane_payload(src_buf, 0), 16);
+	bs->size = round_up(vb2_plane_size(src_buf, 0), 128);
+}
+
+int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
+			 struct mtk_jpeg_dec_param *parm,
+			 struct vb2_buffer *dst_buf,
+			 struct mtk_jpeg_fb *fb)
+{
+	int i;
+
+	if (parm->comp_num != dst_buf->num_planes) {
+		dev_err(ctx->jpeg->dev, "plane number mismatch (%u != %u)\n",
+			parm->comp_num, dst_buf->num_planes);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < dst_buf->num_planes; i++) {
+		if (vb2_plane_size(dst_buf, i) < parm->comp_size[i]) {
+			dev_err(ctx->jpeg->dev,
+				"buffer size is underflow (%lu < %u)\n",
+				vb2_plane_size(dst_buf, 0),
+				parm->comp_size[i]);
+			return -EINVAL;
+		}
+		fb->plane_addr[i] = vb2_dma_contig_plane_dma_addr(dst_buf, i);
+	}
+
+	return 0;
+}
+
 static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
 					u8 yscale_h, u8 uvscale_w, u8 uvscale_h)
 {
@@ -404,12 +441,14 @@ static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base, u32 ptr)
 	writel(ptr, base + JPGDEC_REG_FILE_BRP);
 }
 
-static void mtk_jpeg_dec_set_bs_info(void __iomem *base, u32 addr, u32 size)
+static void mtk_jpeg_dec_set_bs_info(void __iomem *base, u32 addr, u32 size,
+				     u32 bitstream_size)
 {
 	mtk_jpeg_verify_align(addr, 16, JPGDEC_REG_FILE_ADDR);
 	mtk_jpeg_verify_align(size, 128, JPGDEC_REG_FILE_TOTAL_SIZE);
 	writel(addr, base + JPGDEC_REG_FILE_ADDR);
 	writel(size, base + JPGDEC_REG_FILE_TOTAL_SIZE);
+	writel(bitstream_size, base + JPGDEC_REG_BIT_STREAM_SIZE);
 }
 
 static void mtk_jpeg_dec_set_comp_id(void __iomem *base, u32 id_y, u32 id_u,
@@ -478,39 +517,40 @@ static void mtk_jpeg_dec_set_sampling_factor(void __iomem *base, u32 comp_num,
 }
 
 void mtk_jpeg_dec_set_config(void __iomem *base,
-			     struct mtk_jpeg_dec_param *config,
+			     struct mtk_jpeg_dec_param *cfg,
+			      u32 bitstream_size,
 			     struct mtk_jpeg_bs *bs,
 			     struct mtk_jpeg_fb *fb)
 {
-	mtk_jpeg_dec_set_brz_factor(base, 0, 0, config->uv_brz_w, 0);
+	mtk_jpeg_dec_set_brz_factor(base, 0, 0, cfg->uv_brz_w, 0);
 	mtk_jpeg_dec_set_dec_mode(base, 0);
-	mtk_jpeg_dec_set_comp0_du(base, config->unit_num);
-	mtk_jpeg_dec_set_total_mcu(base, config->total_mcu);
-	mtk_jpeg_dec_set_bs_info(base, bs->str_addr, bs->size);
+	mtk_jpeg_dec_set_comp0_du(base, cfg->unit_num);
+	mtk_jpeg_dec_set_total_mcu(base, cfg->total_mcu);
+	mtk_jpeg_dec_set_bs_info(base, bs->str_addr, bs->size, bitstream_size);
 	mtk_jpeg_dec_set_bs_write_ptr(base, bs->end_addr);
-	mtk_jpeg_dec_set_du_membership(base, config->membership, 1,
-				       (config->comp_num == 1) ? 1 : 0);
-	mtk_jpeg_dec_set_comp_id(base, config->comp_id[0], config->comp_id[1],
-				 config->comp_id[2]);
-	mtk_jpeg_dec_set_q_table(base, config->qtbl_num[0],
-				 config->qtbl_num[1], config->qtbl_num[2]);
-	mtk_jpeg_dec_set_sampling_factor(base, config->comp_num,
-					 config->sampling_w[0],
-					 config->sampling_h[0],
-					 config->sampling_w[1],
-					 config->sampling_h[1],
-					 config->sampling_w[2],
-					 config->sampling_h[2]);
-	mtk_jpeg_dec_set_mem_stride(base, config->mem_stride[0],
-				    config->mem_stride[1]);
-	mtk_jpeg_dec_set_img_stride(base, config->img_stride[0],
-				    config->img_stride[1]);
+	mtk_jpeg_dec_set_du_membership(base, cfg->membership, 1,
+				       (cfg->comp_num == 1) ? 1 : 0);
+	mtk_jpeg_dec_set_comp_id(base, cfg->comp_id[0], cfg->comp_id[1],
+				 cfg->comp_id[2]);
+	mtk_jpeg_dec_set_q_table(base, cfg->qtbl_num[0],
+				 cfg->qtbl_num[1], cfg->qtbl_num[2]);
+	mtk_jpeg_dec_set_sampling_factor(base, cfg->comp_num,
+					 cfg->sampling_w[0],
+					 cfg->sampling_h[0],
+					 cfg->sampling_w[1],
+					 cfg->sampling_h[1],
+					 cfg->sampling_w[2],
+					 cfg->sampling_h[2]);
+	mtk_jpeg_dec_set_mem_stride(base, cfg->mem_stride[0],
+				    cfg->mem_stride[1]);
+	mtk_jpeg_dec_set_img_stride(base, cfg->img_stride[0],
+				    cfg->img_stride[1]);
 	mtk_jpeg_dec_set_dst_bank0(base, fb->plane_addr[0],
 				   fb->plane_addr[1], fb->plane_addr[2]);
 	mtk_jpeg_dec_set_dst_bank1(base, 0, 0, 0);
-	mtk_jpeg_dec_set_dma_group(base, config->dma_mcu, config->dma_group,
-				   config->dma_last_mcu);
-	mtk_jpeg_dec_set_pause_mcu_idx(base, config->total_mcu);
+	mtk_jpeg_dec_set_dma_group(base, cfg->dma_mcu, cfg->dma_group,
+				   cfg->dma_last_mcu);
+	mtk_jpeg_dec_set_pause_mcu_idx(base, cfg->total_mcu);
 }
 
 static int mtk_jpegdec_hw_init_irq(struct mtk_jpeg_dev *dev,
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
index fa0d45f..3613046 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
@@ -70,10 +70,18 @@ int mtk_jpeg_dec_fill_param(struct mtk_jpeg_dec_param *param);
 u32 mtk_jpeg_dec_get_int_status(void __iomem *dec_reg_base);
 u32 mtk_jpeg_dec_enum_result(u32 irq_result);
 void mtk_jpeg_dec_set_config(void __iomem *base,
-			     struct mtk_jpeg_dec_param *config,
-			     struct mtk_jpeg_bs *bs,
-			     struct mtk_jpeg_fb *fb);
+			    struct mtk_jpeg_dec_param *cfg,
+			    u32 bitstream_size,
+			    struct mtk_jpeg_bs *bs,
+			    struct mtk_jpeg_fb *fb);
 void mtk_jpeg_dec_reset(void __iomem *dec_reg_base);
 void mtk_jpeg_dec_start(void __iomem *dec_reg_base);
+void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
+			  struct vb2_buffer *src_buf,
+			  struct mtk_jpeg_bs *bs);
+int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
+			 struct mtk_jpeg_dec_param *parm,
+			 struct vb2_buffer *dst_buf,
+			 struct mtk_jpeg_fb *fb);
 
 #endif /* _MTK_JPEG_HW_H */
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
index 21ec8f9..27b7711 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
@@ -45,5 +45,6 @@
 #define JPGDEC_REG_QT_ID		0x0270
 #define JPGDEC_REG_INTERRUPT_STATUS	0x0274
 #define JPGDEC_REG_STATUS		0x0278
+#define JPGDEC_REG_BIT_STREAM_SIZE	0x0344
 
 #endif /* _MTK_JPEG_REG_H */
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
