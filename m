Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A52C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F1A611C6
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2F1A611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+LVM+g6YUWWLtYpK6E4vxW+X5mYwU64UsxAlg81obHE=; b=mtIw2SGtZc1iODgSNUBZ5ur59t
	eO8/OI/WpSDWfVGUCrKuZVkyCuqRiZBLsgKGO7G/mUoTL2ITLUItOuPk4EixoW1A9/s0j3HmR8oQx
	oZZocMaPwGSuj55sy/lmTYVn188ltym/mFVKzT3TUSjz8O700eojUbtsR3qW+gWog+ch7hagfqmlN
	NgEh7TrjxjnoNB7GkcAmtqQTmM9grLxC5zTY7wvvJyeGbP8YXsH0dR4bbryBdZZXNHvwiHhLvcwAH
	7YT/WtVF7Ztewv6+vYxZqOTAyyjCLvOYxPNVp/5QG12V/5POKDCv+anT/xVgTHu1hD+hpFQ0YhJhN
	j//dB/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBrIY-00BThO-Am; Fri, 06 Aug 2021 04:17:30 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBrHH-00BSvs-SZ
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 04:16:13 +0000
Received: by mail-qt1-x84a.google.com with SMTP id
 i8-20020ac85c080000b029026ae3f4adc9so3760601qti.13
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 21:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=051WVDzFkrbf0YEHzSxCZ97mCd1m32E+Jb6OrfqpVzE=;
 b=LIm/3uNLQXpaFzuqj01FdvOZRgZkWSOpY7S4z1EJDHfeP71tCfVOjHmbOPEReR5W8T
 ws9TU/MTo1VzDMQgebtABwcJTo+wMjY3qKbYqLsb7gmZS7KQkaSmFmht5kVbo+BL1P6L
 bRUoiCIg0U36+q8gVnfse0/uNXqVJWkgZ8oHcUfgyX+KfOdtbaobCPtNVml1PMrNOrI3
 dKWohBSWPnbjE68LxeRllCwGd++Q+rjLAN4CPs7HwatwNlAjs2uMR6/HK02o84mAFFwR
 ogWbWAL03yWfom5pE3jNFq98/kExdKDKGh0SO2LdMEYR4Tyh4KNTbsSzI7qRBbxa4rfP
 aqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=051WVDzFkrbf0YEHzSxCZ97mCd1m32E+Jb6OrfqpVzE=;
 b=fpjyy+BzQQh2zBgZkHd4EHqLPNtDD2Lp8lVBLsGIhrtvrlbWTLPP6phVSljYid2AFa
 jbXAi/D+uwe8vrilb4iJPXK8RXDMRfKfpj734mEqYYhgncY2NXgBtoQEI4+u7Ttr8Qsk
 wmrSEgZIoWT6rhUZ2CM1rYvDSJfk4kvLUYHFuXQIN59u8csyPXv5gPTdKBIQLKj2J24S
 jQ0WbaGRzR/RnLeV8hnUvozKYRJvPi8RMYycfoIKCYigSvzF0nB6V474v13pxcOqWk6q
 TOK5tsOjpK8irJ5HqvmQrkupa/iMq0scp8elxNk+ezT0K7T7pCcm4Glzvj/qNXV3beph
 KCpQ==
X-Gm-Message-State: AOAM5335UH0L2VhRTxIP6bzXsqAQXYTAiAndr5Vb/c7sHm6IQmISTXx3
 qWD6waKvFG2oWfa7/ygbzH0Qt/7aHCMl
X-Google-Smtp-Source: ABdhPJwsDi+IsyxfTKYMvq0PS5q9D2EvSQGns+iOwSbLc/teUDOkbJtasdIzm+YJmK9Fjl69FxTt7DFPGf3s
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:2a45:: with SMTP id
 jf5mr9264242qvb.25.1628223370414; Thu, 05 Aug 2021 21:16:10 -0700 (PDT)
Date: Fri,  6 Aug 2021 12:15:21 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-6-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 05/14] media: mtk-vcodec: venc: support START and STOP
 commands
From: Tzung-Bi Shih <tzungbi@google.com>
To: hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com, acourbot@chromium.org
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
 dafna.hirschfeld@collabora.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, tzungbi@google.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_211611_988438_D30DABE2 
X-CRM114-Status: GOOD (  28.05  )
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

From: Alexandre Courbot <acourbot@chromium.org>

The V4L2 encoder specification requires encoders to support the
V4L2_ENC_CMD_START and V4L2_ENC_CMD_STOP commands. Add support for these
to the mtk-vcodec encoder by reusing the same flush buffer as used by
the decoder driver.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
[hsinyi: fix double-free issue if flush buffer was not dequeued by the
time streamoff is called]
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 140 +++++++++++++++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   6 +-
 3 files changed, 140 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index cad52d8b1463..cb248d8daa7b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -252,6 +252,7 @@ struct vdec_pic_info {
  * @last_decoded_picinfo: pic information get from latest decode
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Only
  *		     to be used with encoder and stateful decoder.
+ * @is_flushing: set to true if flushing is in progress.
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
  * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
@@ -291,6 +292,7 @@ struct mtk_vcodec_ctx {
 	struct work_struct encode_work;
 	struct vdec_pic_info last_decoded_picinfo;
 	struct v4l2_m2m_buffer empty_flush_buf;
+	bool is_flushing;
 
 	enum v4l2_colorspace colorspace;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 416f356af363..efa53ea573a2 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -672,6 +672,7 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
 			     struct v4l2_buffer *buf)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	int ret;
 
 	if (ctx->state == MTK_STATE_ABORT) {
 		mtk_v4l2_err("[%d] Call on QBUF after unrecoverable error",
@@ -679,7 +680,83 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
 		return -EIO;
 	}
 
-	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
+	ret = v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
+	if (ret)
+		return ret;
+
+	/*
+	 * Complete flush if the user dequeued the 0-payload LAST buffer.
+	 * We check the payload because a buffer with the LAST flag can also
+	 * be seen during resolution changes. If we happen to be flushing at
+	 * that time, the last buffer before the resolution changes could be
+	 * misinterpreted for the buffer generated by the flush and terminate
+	 * it earlier than we want.
+	 */
+	if (!V4L2_TYPE_IS_OUTPUT(buf->type) &&
+	    buf->flags & V4L2_BUF_FLAG_LAST &&
+	    buf->m.planes[0].bytesused == 0 &&
+	    ctx->is_flushing) {
+		/*
+		 * Last CAPTURE buffer is dequeued, we can allow another flush
+		 * to take place.
+		 */
+		ctx->is_flushing = false;
+	}
+
+	return 0;
+}
+
+static int vidioc_encoder_cmd(struct file *file, void *priv,
+			      struct v4l2_encoder_cmd *cmd)
+{
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct vb2_queue *src_vq, *dst_vq;
+	int ret;
+
+	if (ctx->state == MTK_STATE_ABORT) {
+		mtk_v4l2_err("[%d] Call to CMD after unrecoverable error",
+			     ctx->id);
+		return -EIO;
+	}
+
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, cmd);
+	if (ret)
+		return ret;
+
+	/* Calling START or STOP is invalid if a flush is in progress */
+	if (ctx->is_flushing)
+		return -EBUSY;
+
+	mtk_v4l2_debug(1, "encoder cmd=%u", cmd->cmd);
+
+	dst_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
+				 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	switch (cmd->cmd) {
+	case V4L2_ENC_CMD_STOP:
+		src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
+					 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (!vb2_is_streaming(src_vq)) {
+			mtk_v4l2_debug(1, "Output stream is off. No need to flush.");
+			return 0;
+		}
+		if (!vb2_is_streaming(dst_vq)) {
+			mtk_v4l2_debug(1, "Capture stream is off. No need to flush.");
+			return 0;
+		}
+		ctx->is_flushing = true;
+		v4l2_m2m_buf_queue(ctx->m2m_ctx, &ctx->empty_flush_buf.vb);
+		v4l2_m2m_try_schedule(ctx->m2m_ctx);
+		break;
+
+	case V4L2_ENC_CMD_START:
+		vb2_clear_last_buffer_dequeued(dst_vq);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
@@ -715,6 +792,9 @@ const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
 
 	.vidioc_g_selection		= vidioc_venc_g_selection,
 	.vidioc_s_selection		= vidioc_venc_s_selection,
+
+	.vidioc_encoder_cmd		= vidioc_encoder_cmd,
+	.vidioc_try_encoder_cmd		= v4l2_m2m_ioctl_try_encoder_cmd,
 };
 
 static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
@@ -882,9 +962,38 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 			dst_buf->vb2_buf.planes[0].bytesused = 0;
 			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 		}
+		/* STREAMOFF on the CAPTURE queue completes any ongoing flush */
+		if (ctx->is_flushing) {
+			struct v4l2_m2m_buffer *b, *n;
+
+			mtk_v4l2_debug(1, "STREAMOFF called while flushing");
+			/*
+			 * STREAMOFF could be called before the flush buffer is
+			 * dequeued. Check whether empty flush buf is still in
+			 * queue before removing it.
+			 */
+			v4l2_m2m_for_each_src_buf_safe(ctx->m2m_ctx, b, n) {
+				if (b == &ctx->empty_flush_buf) {
+					v4l2_m2m_src_buf_remove_by_buf(ctx->m2m_ctx, &b->vb);
+					break;
+				}
+			}
+			ctx->is_flushing = false;
+		}
 	} else {
-		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
-			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
+			if (src_buf != &ctx->empty_flush_buf.vb)
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		}
+		if (ctx->is_flushing) {
+			/*
+			 * If we are in the middle of a flush, put the flush
+			 * buffer back into the queue so the next CAPTURE
+			 * buffer gets returned with the LAST flag set.
+			 */
+			v4l2_m2m_buf_queue(ctx->m2m_ctx,
+					   &ctx->empty_flush_buf.vb);
+		}
 	}
 
 	if ((q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
@@ -984,12 +1093,15 @@ static int mtk_venc_param_change(struct mtk_vcodec_ctx *ctx)
 {
 	struct venc_enc_param enc_prm;
 	struct vb2_v4l2_buffer *vb2_v4l2 = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
-	struct mtk_video_enc_buf *mtk_buf =
-			container_of(vb2_v4l2, struct mtk_video_enc_buf,
-				     m2m_buf.vb);
-
+	struct mtk_video_enc_buf *mtk_buf;
 	int ret = 0;
 
+	/* Don't upcast the empty flush buffer */
+	if (vb2_v4l2 == &ctx->empty_flush_buf.vb)
+		return 0;
+
+	mtk_buf = container_of(vb2_v4l2, struct mtk_video_enc_buf, m2m_buf.vb);
+
 	memset(&enc_prm, 0, sizeof(enc_prm));
 	if (mtk_buf->param_change == MTK_ENCODE_PARAM_NONE)
 		return 0;
@@ -1075,6 +1187,20 @@ static void mtk_venc_worker(struct work_struct *work)
 	}
 
 	src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+
+	/*
+	 * If we see the flush buffer, send an empty buffer with the LAST flag
+	 * to the client. is_flushing will be reset at the time the buffer
+	 * is dequeued.
+	 */
+	if (src_buf == &ctx->empty_flush_buf.vb) {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
+		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+		v4l2_m2m_job_finish(ctx->dev->m2m_dev_enc, ctx->m2m_ctx);
+		return;
+	}
+
 	memset(&frm_buf, 0, sizeof(frm_buf));
 	for (i = 0; i < src_buf->vb2_buf.num_planes ; i++) {
 		frm_buf.fb_addr[i].dma_addr =
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 45d1870c83dd..4167e865b23f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -131,6 +131,7 @@ static int fops_vcodec_open(struct file *file)
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
 	int ret = 0;
+	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -157,13 +158,16 @@ static int fops_vcodec_open(struct file *file)
 		goto err_ctrls_setup;
 	}
 	ctx->m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev_enc, ctx,
-				&mtk_vcodec_enc_queue_init);
+					 &mtk_vcodec_enc_queue_init);
 	if (IS_ERR((__force void *)ctx->m2m_ctx)) {
 		ret = PTR_ERR((__force void *)ctx->m2m_ctx);
 		mtk_v4l2_err("Failed to v4l2_m2m_ctx_init() (%d)",
 				ret);
 		goto err_m2m_ctx_init;
 	}
+	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
+				 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	ctx->empty_flush_buf.vb.vb2_buf.vb2_queue = src_vq;
 	mtk_vcodec_enc_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-- 
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
