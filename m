Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95730C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:28:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F317520639
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iBnegtxD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QQDhNcV9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F317520639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tp2Cq5JqQD2cV2cxzGrNugp9prshLzbCWUqK3ayKw4E=; b=iBnegtxDb49hGmj09hH5dNaqm
	fqsbhgSb0c7gsSxTBffkjcLuDjUC7W33zIEHXLZBh2aU+qru581moVLpeBEhAhy2nyClXYqomQbLq
	tLqW8mvkHQdInqQWiplTob+AA97OsxXGw1mntiNiIVWWiR1Oh5KN7TiRkGvUJmyodA6smmQzDktzS
	CvH8w4P7I0XtmqvbaEI4bxSssDooQfW0yeH6rxDKz+myU9pvbybO8eeVYbK9aCk0YHXUfsAo4R9fn
	YEXO+CQbu81MnQJomvuDKjpbdz21mSzRw4dzelUcGmbC54L2SAoemtEXNmA9mjvXCkwjouj3jiLOE
	Qsh3+31aA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6U8c-0006ck-LA; Fri, 14 Aug 2020 07:28:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6U3x-0003N6-9r; Fri, 14 Aug 2020 07:23:45 +0000
X-UUID: 8e5c3bd6a516458ab30ca3a2da6abe9d-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zkQYyfwS9UgwXr6JLjB5UfXEi9ckyZqx+wdM0FayS18=; 
 b=QQDhNcV9pW/+PUFQZhwErT+W8WpWtxChl/9NuWcIWmdxHJ+1+fn+QTvo7DW9pHjrDab5vzfkxWooin3LrCRHMlG+i9rAB8xNjkprCDF7AkDN6fnhQ4GC8i5jjee81LGF811BY1SBdSBAqGgGLPSx0+yJ/1MhifRO2jh9W2LeM/c=;
X-UUID: 8e5c3bd6a516458ab30ca3a2da6abe9d-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1094465950; Thu, 13 Aug 2020 23:23:16 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 00:13:39 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:34 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v12 27/29] media: platform: Rename existing
 functions/defines/variables
Date: Fri, 14 Aug 2020 15:12:00 +0800
Message-ID: <20200814071202.25067-29-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_032341_592044_AD6E348F 
X-CRM114-Status: GOOD (  18.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rename existing functions/defines/variables with a  _dec prefix and
without dec_ prefix to prepare for the addition of the jpeg encoder
feature.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v12: no changes
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 172 +++++++++---------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  12 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   5 +-
 3 files changed, 97 insertions(+), 92 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 5e57aed2e90f..3d1383d2eac4 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -27,11 +27,11 @@
 #include "mtk_jpeg_core.h"
 #include "mtk_jpeg_dec_parse.h"
 
-static struct mtk_jpeg_fmt mtk_jpeg_formats[] = {
+static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_JPEG,
 		.colplanes	= 1,
-		.flags		= MTK_JPEG_FMT_FLAG_DEC_OUTPUT,
+		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_YUV420M,
@@ -40,7 +40,7 @@ static struct mtk_jpeg_fmt mtk_jpeg_formats[] = {
 		.colplanes	= 3,
 		.h_align	= 5,
 		.v_align	= 4,
-		.flags		= MTK_JPEG_FMT_FLAG_DEC_CAPTURE,
+		.flags		= MTK_JPEG_FMT_FLAG_CAPTURE,
 	},
 	{
 		.fourcc		= V4L2_PIX_FMT_YUV422M,
@@ -49,11 +49,11 @@ static struct mtk_jpeg_fmt mtk_jpeg_formats[] = {
 		.colplanes	= 3,
 		.h_align	= 5,
 		.v_align	= 3,
-		.flags		= MTK_JPEG_FMT_FLAG_DEC_CAPTURE,
+		.flags		= MTK_JPEG_FMT_FLAG_CAPTURE,
 	},
 };
 
-#define MTK_JPEG_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_formats)
+#define MTK_JPEG_DEC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_dec_formats)
 
 struct mtk_jpeg_src_buf {
 	struct vb2_v4l2_buffer b;
@@ -112,15 +112,15 @@ static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
 static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	return mtk_jpeg_enum_fmt(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS, f,
-				 MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
+	return mtk_jpeg_enum_fmt(mtk_jpeg_dec_formats, MTK_JPEG_DEC_NUM_FORMATS,
+				 f, MTK_JPEG_FMT_FLAG_CAPTURE);
 }
 
 static int mtk_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	return mtk_jpeg_enum_fmt(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS, f,
-				 MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
+	return mtk_jpeg_enum_fmt(mtk_jpeg_dec_formats, MTK_JPEG_DEC_NUM_FORMATS,
+				 f, MTK_JPEG_FMT_FLAG_OUTPUT);
 }
 
 static struct mtk_jpeg_q_data *mtk_jpeg_get_q_data(struct mtk_jpeg_ctx *ctx,
@@ -246,9 +246,10 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
 	struct mtk_jpeg_fmt *fmt;
 
-	fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
+	fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
+				   MTK_JPEG_DEC_NUM_FORMATS,
 				   f->fmt.pix_mp.pixelformat,
-				   MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
+				   MTK_JPEG_FMT_FLAG_CAPTURE);
 	if (!fmt)
 		fmt = ctx->cap_q.fmt;
 
@@ -273,9 +274,10 @@ static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
 	struct mtk_jpeg_fmt *fmt;
 
-	fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
+	fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
+				   MTK_JPEG_DEC_NUM_FORMATS,
 				   f->fmt.pix_mp.pixelformat,
-				   MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
+				   MTK_JPEG_FMT_FLAG_OUTPUT);
 	if (!fmt)
 		fmt = ctx->out_q.fmt;
 
@@ -315,8 +317,8 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 	}
 
 
-	q_data->fmt = mtk_jpeg_find_format(mtk_jpeg_formats,
-					   MTK_JPEG_NUM_FORMATS,
+	q_data->fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
+					   MTK_JPEG_DEC_NUM_FORMATS,
 					   pix_mp->pixelformat, fmt_type);
 	q_data->pix_mp.width = pix_mp->width;
 	q_data->pix_mp.height = pix_mp->height;
@@ -358,7 +360,7 @@ static int mtk_jpeg_s_fmt_vid_out_mplane(struct file *file, void *priv,
 		return ret;
 
 	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
-				     MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
+				     MTK_JPEG_FMT_FLAG_OUTPUT);
 }
 
 static int mtk_jpeg_s_fmt_vid_cap_mplane(struct file *file, void *priv,
@@ -371,7 +373,7 @@ static int mtk_jpeg_s_fmt_vid_cap_mplane(struct file *file, void *priv,
 		return ret;
 
 	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
-				     MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
+				     MTK_JPEG_FMT_FLAG_CAPTURE);
 }
 
 static void mtk_jpeg_queue_src_chg_event(struct mtk_jpeg_ctx *ctx)
@@ -396,8 +398,8 @@ static int mtk_jpeg_subscribe_event(struct v4l2_fh *fh,
 	return v4l2_ctrl_subscribe_event(fh, sub);
 }
 
-static int mtk_jpeg_g_selection(struct file *file, void *priv,
-				struct v4l2_selection *s)
+static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
+				    struct v4l2_selection *s)
 {
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
 
@@ -425,7 +427,7 @@ static int mtk_jpeg_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static const struct v4l2_ioctl_ops mtk_jpeg_ioctl_ops = {
+static const struct v4l2_ioctl_ops mtk_jpeg_dec_ioctl_ops = {
 	.vidioc_querycap                = mtk_jpeg_querycap,
 	.vidioc_enum_fmt_vid_cap	= mtk_jpeg_enum_fmt_vid_cap,
 	.vidioc_enum_fmt_vid_out	= mtk_jpeg_enum_fmt_vid_out,
@@ -437,7 +439,7 @@ static const struct v4l2_ioctl_ops mtk_jpeg_ioctl_ops = {
 	.vidioc_s_fmt_vid_out_mplane    = mtk_jpeg_s_fmt_vid_out_mplane,
 	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
 	.vidioc_subscribe_event         = mtk_jpeg_subscribe_event,
-	.vidioc_g_selection		= mtk_jpeg_g_selection,
+	.vidioc_g_selection		= mtk_jpeg_dec_g_selection,
 
 	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
 	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
@@ -517,9 +519,9 @@ static bool mtk_jpeg_check_resolution_change(struct mtk_jpeg_ctx *ctx,
 	}
 
 	q_data = &ctx->cap_q;
-	if (q_data->fmt != mtk_jpeg_find_format(mtk_jpeg_formats,
-			MTK_JPEG_NUM_FORMATS, param->dst_fourcc,
-			MTK_JPEG_FMT_FLAG_DEC_CAPTURE)) {
+	if (q_data->fmt != mtk_jpeg_find_format(mtk_jpeg_dec_formats,
+			MTK_JPEG_DEC_NUM_FORMATS, param->dst_fourcc,
+			MTK_JPEG_FMT_FLAG_CAPTURE)) {
 		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "format change\n");
 		return true;
 	}
@@ -540,10 +542,10 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
 	q_data = &ctx->cap_q;
 	q_data->pix_mp.width = param->dec_w;
 	q_data->pix_mp.height = param->dec_h;
-	q_data->fmt = mtk_jpeg_find_format(mtk_jpeg_formats,
-					   MTK_JPEG_NUM_FORMATS,
+	q_data->fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
+					   MTK_JPEG_DEC_NUM_FORMATS,
 					   param->dst_fourcc,
-					   MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
+					   MTK_JPEG_FMT_FLAG_CAPTURE);
 
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
 		q_data->pix_mp.plane_fmt[i].bytesperline = param->mem_stride[i];
@@ -560,7 +562,7 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
 		 param->dec_w, param->dec_h);
 }
 
-static void mtk_jpeg_buf_queue(struct vb2_buffer *vb)
+static void mtk_jpeg_dec_buf_queue(struct vb2_buffer *vb)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct mtk_jpeg_dec_param *param;
@@ -608,7 +610,7 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
 		return v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 }
 
-static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
+static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
 	struct vb2_v4l2_buffer *vb;
@@ -634,13 +636,13 @@ static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
 		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
 }
 
-static const struct vb2_ops mtk_jpeg_qops = {
+static const struct vb2_ops mtk_jpeg_dec_qops = {
 	.queue_setup        = mtk_jpeg_queue_setup,
 	.buf_prepare        = mtk_jpeg_buf_prepare,
-	.buf_queue          = mtk_jpeg_buf_queue,
+	.buf_queue          = mtk_jpeg_dec_buf_queue,
 	.wait_prepare       = vb2_ops_wait_prepare,
 	.wait_finish        = vb2_ops_wait_finish,
-	.stop_streaming     = mtk_jpeg_stop_streaming,
+	.stop_streaming     = mtk_jpeg_dec_stop_streaming,
 };
 
 static void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
@@ -680,7 +682,7 @@ static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
 	return 0;
 }
 
-static void mtk_jpeg_device_run(void *priv)
+static void mtk_jpeg_dec_device_run(void *priv)
 {
 	struct mtk_jpeg_ctx *ctx = priv;
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
@@ -715,11 +717,11 @@ static void mtk_jpeg_device_run(void *priv)
 		goto dec_end;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
-	mtk_jpeg_dec_set_config(jpeg->dec_reg_base,
+	mtk_jpeg_dec_reset(jpeg->reg_base);
+	mtk_jpeg_dec_set_config(jpeg->reg_base,
 				&jpeg_src_buf->dec_param, &bs, &fb);
 
-	mtk_jpeg_dec_start(jpeg->dec_reg_base);
+	mtk_jpeg_dec_start(jpeg->reg_base);
 	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
 	return;
 
@@ -731,16 +733,16 @@ static void mtk_jpeg_device_run(void *priv)
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
 
-static int mtk_jpeg_job_ready(void *priv)
+static int mtk_jpeg_dec_job_ready(void *priv)
 {
 	struct mtk_jpeg_ctx *ctx = priv;
 
 	return (ctx->state == MTK_JPEG_RUNNING) ? 1 : 0;
 }
 
-static const struct v4l2_m2m_ops mtk_jpeg_m2m_ops = {
-	.device_run = mtk_jpeg_device_run,
-	.job_ready  = mtk_jpeg_job_ready,
+static const struct v4l2_m2m_ops mtk_jpeg_dec_m2m_ops = {
+	.device_run = mtk_jpeg_dec_device_run,
+	.job_ready  = mtk_jpeg_dec_job_ready,
 };
 
 static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
@@ -753,7 +755,7 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->io_modes = VB2_DMABUF | VB2_MMAP;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct mtk_jpeg_src_buf);
-	src_vq->ops = &mtk_jpeg_qops;
+	src_vq->ops = &mtk_jpeg_dec_qops;
 	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &ctx->jpeg->lock;
@@ -766,7 +768,7 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
-	dst_vq->ops = &mtk_jpeg_qops;
+	dst_vq->ops = &mtk_jpeg_dec_qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->jpeg->lock;
@@ -808,7 +810,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 
 	cancel_delayed_work(&jpeg->job_timeout_work);
 
-	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->dec_reg_base);
+	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
 	dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
 	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
 	if (!ctx) {
@@ -821,7 +823,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
 
 	if (dec_irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
-		mtk_jpeg_dec_reset(jpeg->dec_reg_base);
+		mtk_jpeg_dec_reset(jpeg->reg_base);
 
 	if (dec_irq_ret != MTK_JPEG_DEC_RESULT_EOF_DONE) {
 		dev_err(jpeg->dev, "decode failed\n");
@@ -851,17 +853,19 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 	q->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	q->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
 
-	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
+	q->fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
+				      MTK_JPEG_DEC_NUM_FORMATS,
 				      V4L2_PIX_FMT_JPEG,
-				      MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
+				      MTK_JPEG_FMT_FLAG_OUTPUT);
 	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
 	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
 	mtk_jpeg_try_fmt_mplane(&q->pix_mp, q->fmt);
 
 	q = &ctx->cap_q;
-	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
+	q->fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
+				      MTK_JPEG_DEC_NUM_FORMATS,
 				      V4L2_PIX_FMT_YUV420M,
-				      MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
+				      MTK_JPEG_FMT_FLAG_CAPTURE);
 	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
 	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
 	q->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
@@ -981,7 +985,7 @@ static void mtk_jpeg_job_timeout_work(struct work_struct *work)
 	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
-	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
+	mtk_jpeg_dec_reset(jpeg->reg_base);
 
 	pm_runtime_put(jpeg->dev);
 
@@ -993,7 +997,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
 	struct resource *res;
-	int dec_irq;
+	int jpeg_irq;
 	int ret;
 
 	jpeg = devm_kzalloc(&pdev->dev, sizeof(*jpeg), GFP_KERNEL);
@@ -1006,23 +1010,23 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	jpeg->dec_reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(jpeg->dec_reg_base)) {
-		ret = PTR_ERR(jpeg->dec_reg_base);
+	jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(jpeg->reg_base)) {
+		ret = PTR_ERR(jpeg->reg_base);
 		return ret;
 	}
 
-	dec_irq = platform_get_irq(pdev, 0);
-	if (dec_irq < 0) {
-		dev_err(&pdev->dev, "Failed to get dec_irq %d.\n", dec_irq);
-		return dec_irq;
+	jpeg_irq = platform_get_irq(pdev, 0);
+	if (jpeg_irq < 0) {
+		dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n", jpeg_irq);
+		return jpeg_irq;
 	}
 
-	ret = devm_request_irq(&pdev->dev, dec_irq, mtk_jpeg_dec_irq, 0,
+	ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq, 0,
 			       pdev->name, jpeg);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to request dec_irq %d (%d)\n",
-			dec_irq, ret);
+		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
+			jpeg_irq, ret);
 		goto err_req_irq;
 	}
 
@@ -1039,40 +1043,40 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		goto err_dev_register;
 	}
 
-	jpeg->m2m_dev = v4l2_m2m_init(&mtk_jpeg_m2m_ops);
+	jpeg->m2m_dev = v4l2_m2m_init(&mtk_jpeg_dec_m2m_ops);
 	if (IS_ERR(jpeg->m2m_dev)) {
 		v4l2_err(&jpeg->v4l2_dev, "Failed to init mem2mem device\n");
 		ret = PTR_ERR(jpeg->m2m_dev);
 		goto err_m2m_init;
 	}
 
-	jpeg->dec_vdev = video_device_alloc();
-	if (!jpeg->dec_vdev) {
+	jpeg->vdev = video_device_alloc();
+	if (!jpeg->vdev) {
 		ret = -ENOMEM;
-		goto err_dec_vdev_alloc;
+		goto err_vfd_jpeg_alloc;
 	}
-	snprintf(jpeg->dec_vdev->name, sizeof(jpeg->dec_vdev->name),
+	snprintf(jpeg->vdev->name, sizeof(jpeg->vdev->name),
 		 "%s-dec", MTK_JPEG_NAME);
-	jpeg->dec_vdev->fops = &mtk_jpeg_fops;
-	jpeg->dec_vdev->ioctl_ops = &mtk_jpeg_ioctl_ops;
-	jpeg->dec_vdev->minor = -1;
-	jpeg->dec_vdev->release = video_device_release;
-	jpeg->dec_vdev->lock = &jpeg->lock;
-	jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
-	jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
-	jpeg->dec_vdev->device_caps = V4L2_CAP_STREAMING |
-				      V4L2_CAP_VIDEO_M2M_MPLANE;
-
-	ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_VIDEO, -1);
+	jpeg->vdev->fops = &mtk_jpeg_fops;
+	jpeg->vdev->ioctl_ops = &mtk_jpeg_dec_ioctl_ops;
+	jpeg->vdev->minor = -1;
+	jpeg->vdev->release = video_device_release;
+	jpeg->vdev->lock = &jpeg->lock;
+	jpeg->vdev->v4l2_dev = &jpeg->v4l2_dev;
+	jpeg->vdev->vfl_dir = VFL_DIR_M2M;
+	jpeg->vdev->device_caps = V4L2_CAP_STREAMING |
+				  V4L2_CAP_VIDEO_M2M_MPLANE;
+
+	ret = video_register_device(jpeg->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
-		goto err_dec_vdev_register;
+		goto err_vfd_jpeg_register;
 	}
 
-	video_set_drvdata(jpeg->dec_vdev, jpeg);
+	video_set_drvdata(jpeg->vdev, jpeg);
 	v4l2_info(&jpeg->v4l2_dev,
 		  "decoder device registered as /dev/video%d (%d,%d)\n",
-		  jpeg->dec_vdev->num, VIDEO_MAJOR, jpeg->dec_vdev->minor);
+		  jpeg->vdev->num, VIDEO_MAJOR, jpeg->vdev->minor);
 
 	platform_set_drvdata(pdev, jpeg);
 
@@ -1080,10 +1084,10 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_dec_vdev_register:
-	video_device_release(jpeg->dec_vdev);
+err_vfd_jpeg_register:
+	video_device_release(jpeg->vdev);
 
-err_dec_vdev_alloc:
+err_vfd_jpeg_alloc:
 	v4l2_m2m_release(jpeg->m2m_dev);
 
 err_m2m_init:
@@ -1103,8 +1107,8 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
 	struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
-	video_unregister_device(jpeg->dec_vdev);
-	video_device_release(jpeg->dec_vdev);
+	video_unregister_device(jpeg->vdev);
+	video_device_release(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index a54e1e82e655..0f27480dd90d 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -17,8 +17,8 @@
 
 #define MTK_JPEG_COMP_MAX		3
 
-#define MTK_JPEG_FMT_FLAG_DEC_OUTPUT	BIT(0)
-#define MTK_JPEG_FMT_FLAG_DEC_CAPTURE	BIT(1)
+#define MTK_JPEG_FMT_FLAG_OUTPUT	BIT(0)
+#define MTK_JPEG_FMT_FLAG_CAPTURE	BIT(1)
 
 #define MTK_JPEG_MIN_WIDTH	32U
 #define MTK_JPEG_MIN_HEIGHT	32U
@@ -50,8 +50,8 @@ enum mtk_jpeg_ctx_state {
  * @v4l2_dev:		v4l2 device for mem2mem mode
  * @m2m_dev:		v4l2 mem2mem device data
  * @alloc_ctx:		videobuf2 memory allocator's context
- * @dec_vdev:		video device node for decoder mem2mem mode
- * @dec_reg_base:	JPEG registers mapping
+ * @vdev:		video device node for jpeg mem2mem mode
+ * @reg_base:		JPEG registers mapping
  * @clks:		clock names
  * @num_clks:		numbers of clock
  * @larb:		SMI device
@@ -65,8 +65,8 @@ struct mtk_jpeg_dev {
 	struct v4l2_device	v4l2_dev;
 	struct v4l2_m2m_dev	*m2m_dev;
 	void			*alloc_ctx;
-	struct video_device	*dec_vdev;
-	void __iomem		*dec_reg_base;
+	struct video_device	*vdev;
+	void __iomem		*reg_base;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	struct device		*larb;
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
index 1cc37dbfc8e7..fa0d45fd7c34 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
@@ -3,10 +3,11 @@
  * Copyright (c) 2016 MediaTek Inc.
  * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
  *         Rick Chang <rick.chang@mediatek.com>
+ *         Xia Jiang <xia.jiang@mediatek.com>
  */
 
-#ifndef _MTK_JPEG_HW_H
-#define _MTK_JPEG_HW_H
+#ifndef _MTK_JPEG_DEC_HW_H
+#define _MTK_JPEG_DEC_HW_H
 
 #include <media/videobuf2-core.h>
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
