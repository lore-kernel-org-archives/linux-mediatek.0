Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F57C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5554613BD
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5554613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4va56FAk6cwrgaWWaBEYjwe26a4ZrTt1IjWlPLtxfRc=; b=MbLcfRSKta9+Z3gml74g+hjE/
	FZq3svd85kLjOGV2Scl8F5UZdM0BZngtnRgP91XzFloiXEyMgvaWuZ2Vby/P1oBm0wYmZWgCQQV54
	un5Va6jSPZ6K/NNKzb+UBF7NkfIrJ4XH/tkTsnDIZN5U+ye3D3ydaR3V4w4XJJvyHMTg3lb5hCHB0
	6clhq88rURk4oGBTIr3Q+Z0M2JhwuRoRlAnheoJI/G4vJcqSB9cjEZQmotabzMII1/u1pLPmm6J9p
	9sWzNHqgcqZ0hYjHTgdqsgMIcg8ZnjKgzTKwnyeq7Nd4E8jZsXHOu/FZPdLX/J3MDG9/Wn5WISj85
	DdXXHtA/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLhf-001Tv2-Fa; Tue, 27 Apr 2021 11:16:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhR-001TpV-JF
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 11:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1cY8ngUj/BlLIUQtt7qDM/XZnokCC9Y22DkExP4iaa4=; b=tv4rySYwxZzeEXaXHvSyShbAPk
 z+TZMrcB6tEMnENQh6arZsw0x4L/ZMHoplxbrmW88zy2YWgYJmICiymCaLuc6he8/25cUSONKuFxv
 IRKjGfZU8oLaz6W59VzWoMmopdJp52mPY8ln5V9H/khV5h8vg6LYJW8lg1Ui66qCRmiMpLDoaTOBR
 nxl/ECgEhg1M6HrrzeUHfT6LrgB6gX4Lc00W1jdXzah3jvCgAavRoQMiyVdCVDmkBTul5U97X4SZV
 09GzNihuRVei1bDVxyepkUNNVhg1Wqhr/pftuL70n18SC/pbhNSeiDh9tRJW9TwtMNy875RFSO64+
 u3kYe4Ng==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhN-00GgI4-OY
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 11:16:16 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d124so41093394pfa.13
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 04:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1cY8ngUj/BlLIUQtt7qDM/XZnokCC9Y22DkExP4iaa4=;
 b=Fldhd2fZZoQXQWwiZGEhdMEL4ZkG+yah3n4a5nALMFaatuj6W2PbZLkIS+tRxUTdni
 oOjkSb6ekHAmF6egVCaF+B37zn5kNvg+1JP4IMHEGIqbKummHjYg6aeTjemWQKDlewat
 Krs5pjeq2MwLPuToHIhMAL4otdzRDMMeTcq3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1cY8ngUj/BlLIUQtt7qDM/XZnokCC9Y22DkExP4iaa4=;
 b=L7ATYeMBVRHVKNjFSibLRC95UI5idcauC/laHwzGO1c7WPv/ACNAimeLDnSAdPyciV
 OVZtSb3hoDElq4cxJezZJ+zO1HLy8BE4FlkVa/2ZJ8bL7rN6D0o/bdowFHZ1eW9WwKHM
 F3JgNqrMXT+w8AJL+MLY6KSKzIQFH9wDmyo63r/iZ6P5GLjoY1hKJuAZey2v+k9TJNXv
 SVaEcJbyFwz+wc8STNCggj5BWRnOa/asD6tgvj/CixSV6i5HdNY84dsmcWMbEafDBVI3
 bDv1R0moaBMs84Nt6ChHmAPZshqlAXM5mOW30p9JapzFwTrD6uBhnWj8Kg0RhRs2PELB
 iiSw==
X-Gm-Message-State: AOAM533gPsoau/IkI1D1pK73qzLhoY6GE7PYep6T8mSAmVNeR1YDBiMf
 YCVD2INYhnve2pA+SE4+PyPl/w==
X-Google-Smtp-Source: ABdhPJwTZ5oRt/oTU9HLYIA/LpzNAgAE2r0cTUKK1H345jnXiIZ1IePRqdI42Ou1fqHpEigTUaY6dg==
X-Received: by 2002:a63:5466:: with SMTP id e38mr21388182pgm.172.1619522173013; 
 Tue, 27 Apr 2021 04:16:13 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:b182:d363:32d0:53a2])
 by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:16:12 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 13/15] media: mtk-vcodec: make flush buffer reusable by
 encoder
Date: Tue, 27 Apr 2021 20:15:24 +0900
Message-Id: <20210427111526.1772293-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_041613_823934_20C8E5F9 
X-CRM114-Status: GOOD (  19.44  )
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

The flush buffer is a special buffer that tells the decoder driver to
send an empty CAPTURE frame to the client with V4L2_BUF_FLAG_LAST set.

We need similar functionality for the encoder ; however currently the
flush buffer depends on decoder-specific structures and thus cannot be
reused with the encoder.

Fix this by testing for this buffer by its VB2 address, and not through
a dedicated flag stored in a higher-level decoder structure. This also
allows us to remove said flag and simplify the code a bit.

Since the flush buffer should never be used in the stateless decoder,
also add safeguards to check against it.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.c    |  9 ++-------
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.h    |  2 --
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c      | 12 +-----------
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateful.c | 15 +++++++++------
 .../media/platform/mtk-vcodec/mtk_vcodec_drv.h    |  6 ++++--
 5 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 0fafe8f9e1b9..914b1c526943 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -86,8 +86,7 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 			mtk_v4l2_debug(1, "Capture stream is off. No need to flush.");
 			return 0;
 		}
-		v4l2_m2m_buf_queue(ctx->m2m_ctx,
-				   &ctx->empty_flush_buf->m2m_buf.vb);
+		v4l2_m2m_buf_queue(ctx->m2m_ctx, &ctx->empty_flush_buf.vb);
 		v4l2_m2m_try_schedule(ctx->m2m_ctx);
 		break;
 
@@ -779,8 +778,6 @@ int vb2ops_vdec_buf_init(struct vb2_buffer *vb)
 	if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		buf->used = false;
 		buf->queued_in_v4l2 = false;
-	} else {
-		buf->lastframe = false;
 	}
 
 	return 0;
@@ -807,9 +804,7 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
-			struct mtk_video_dec_buf *buf_info = container_of(
-				 src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
-			if (!buf_info->lastframe) {
+			if (src_buf != &ctx->empty_flush_buf.vb) {
 				struct media_request *req =
 					src_buf->vb2_buf.req_obj.req;
 				v4l2_m2m_buf_done(src_buf,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index 6b29d7d9ae15..bb0dfa9795b8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -42,7 +42,6 @@ struct vdec_fb {
  * @queued_in_vb2:	Capture buffer is queue in vb2
  * @queued_in_v4l2:	Capture buffer is in v4l2 driver, but not in vb2
  *			queue yet
- * @lastframe:		Intput buffer is last buffer - EOS
  * @error:		An unrecoverable error occurs on this buffer.
  * @frame_buffer:	Decode status, and buffer information of Capture buffer
  * @bs_buffer:	Output buffer info
@@ -55,7 +54,6 @@ struct mtk_video_dec_buf {
 	bool	used;
 	bool	queued_in_vb2;
 	bool	queued_in_v4l2;
-	bool	lastframe;
 
 	bool	error;
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e0526c0900c8..4789e669c258 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -82,21 +82,14 @@ static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
-	struct mtk_video_dec_buf *mtk_buf = NULL;
 	int ret = 0;
 	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
-	mtk_buf = kzalloc(sizeof(*mtk_buf), GFP_KERNEL);
-	if (!mtk_buf) {
-		kfree(ctx);
-		return -ENOMEM;
-	}
 
 	mutex_lock(&dev->dev_mutex);
-	ctx->empty_flush_buf = mtk_buf;
 	ctx->id = dev->id_counter++;
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
 	file->private_data = &ctx->fh;
@@ -122,8 +115,7 @@ static int fops_vcodec_open(struct file *file)
 	}
 	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
 				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	ctx->empty_flush_buf->m2m_buf.vb.vb2_buf.vb2_queue = src_vq;
-	ctx->empty_flush_buf->lastframe = true;
+	ctx->empty_flush_buf.vb.vb2_buf.vb2_queue = src_vq;
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
@@ -161,7 +153,6 @@ static int fops_vcodec_open(struct file *file)
 err_ctrls_setup:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
-	kfree(ctx->empty_flush_buf);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 
@@ -192,7 +183,6 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
 	list_del_init(&ctx->list);
-	kfree(ctx->empty_flush_buf);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 	return 0;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index d815125c81a4..1f68d92e5c3a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -337,8 +337,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 		return;
 	}
 
-	src_buf_info = container_of(src_buf, struct mtk_video_dec_buf,
-				    m2m_buf.vb);
 	dst_buf_info = container_of(dst_buf, struct mtk_video_dec_buf,
 				    m2m_buf.vb);
 
@@ -359,7 +357,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 			pfb->base_y.va, &pfb->base_y.dma_addr,
 			&pfb->base_c.dma_addr, pfb->base_y.size);
 
-	if (src_buf_info->lastframe) {
+	if (src_buf == &ctx->empty_flush_buf.vb) {
 		mtk_v4l2_debug(1, "Got empty flush input buffer.");
 		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
 
@@ -380,6 +378,10 @@ static void mtk_vdec_worker(struct work_struct *work)
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
+
+	src_buf_info = container_of(src_buf, struct mtk_video_dec_buf,
+				    m2m_buf.vb);
+
 	buf.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
@@ -459,7 +461,6 @@ static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
 	unsigned int dpbsize = 1, i = 0;
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vb2_v4l2 = NULL;
-	struct mtk_video_dec_buf *buf = NULL;
 	struct mtk_q_data *dst_q_data;
 
 	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
@@ -469,6 +470,8 @@ static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
 	 * check if this buffer is ready to be used after decode
 	 */
 	if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		struct mtk_video_dec_buf *buf;
+
 		vb2_v4l2 = to_vb2_v4l2_buffer(vb);
 		buf = container_of(vb2_v4l2, struct mtk_video_dec_buf,
 				   m2m_buf.vb);
@@ -498,8 +501,8 @@ static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
 		mtk_v4l2_err("No src buffer");
 		return;
 	}
-	buf = container_of(src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
-	if (buf->lastframe) {
+
+	if (src_buf == &ctx->empty_flush_buf.vb) {
 		/* This shouldn't happen. Just in case. */
 		mtk_v4l2_err("Invalid flush buffer.");
 		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 10edd238c939..c2f4cad6cfc2 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -13,6 +13,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include "mtk_vcodec_util.h"
 
@@ -249,7 +250,8 @@ struct vdec_pic_info {
  * @decode_work: worker for the decoding
  * @encode_work: worker for the encoding
  * @last_decoded_picinfo: pic information get from latest decode
- * @empty_flush_buf: a fake size-0 capture buffer that indicates flush
+ * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Only
+ *		     to be used with encoder and stateful decoder.
  * @current_codec: current set input codec, in V4L2 pixel format
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
@@ -288,7 +290,7 @@ struct mtk_vcodec_ctx {
 	struct work_struct decode_work;
 	struct work_struct encode_work;
 	struct vdec_pic_info last_decoded_picinfo;
-	struct mtk_video_dec_buf *empty_flush_buf;
+	struct v4l2_m2m_buffer empty_flush_buf;
 
 	u32 current_codec;
 
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
