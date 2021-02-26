Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E54C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:03:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D791A64EF0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D791A64EF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FM4TH+RmsWUaLM1+S7O5h/rwvVBkEo6wz/XwjYjfOPU=; b=pQzAqP295sTMXh5Jf9FPvyx0V
	1TwJAPVpIdsKtHh1oeNSF2a+mZHwPXi8GuFavlKYwCF+UI/PLVD5vMiWHIjxl2ZLrTVPRGalv5NOv
	du5LzUjK1x4OhbD39a9fwuL8KbTphJ0TOrcDq901nAGfeSiEo2ZOB+1pf4vgD1ukoXbdkeK2pBDk5
	8F+o6OvNKnDHgTLbpMGGDEL/qoFyhbMkW7Ii2Aa9/p8XPvL6d1IfZI3r5Al6wAL53FjC49X3eNd4Z
	5Ldn4vLT1vl79SLaI/a2cKpWRqRN9EhgG8erYWxn3yqki531mTjEI4Gso3JLQ3dlwmyfk9Ef1nCpA
	NIL3Sv0GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZxP-0008Dq-Dj; Fri, 26 Feb 2021 10:02:47 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZxL-00088A-EM
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 10:02:44 +0000
Received: by mail-pg1-x529.google.com with SMTP id a4so5898379pgc.11
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 02:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RU3m0vnoHc5l7K5s4IBbXI+lLB4VI5TXPJDbkmiuUIQ=;
 b=muWch6NUQJmt5mo3Y2qo0Skw/PjV9ZDRYVB58BLwQFTaMlpxBL4idvgo2OTfEwpnwx
 85+EhVYM3NYncmzxv/fTR5d3CiytfPDsN9sWGwkNHD6uLfcrybgLvRw6TCcW3tmouXeZ
 vGILIfPc81FO35fIUMkYBxSi8lRPpAjtAicN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RU3m0vnoHc5l7K5s4IBbXI+lLB4VI5TXPJDbkmiuUIQ=;
 b=MycKo2Hai8ni+kv+0IaxI//DdizViY6vISV0AFUD5XCXzCxl30AYN6wUMmw7VXuB1a
 mMCkl9rWD2vxsaA90z4WZEE6pfMdzClMxJYqfbeJHMyOk/JwVBFLruOB/fZ7t0E7djHY
 zHsF7wj+8IxCZX+CA2IpSCUTHP/CzfO0cmGzHTNHWZhATljQLeqI7Xs1shmWlyeWdidJ
 3hDsuz3tbkaAJfEQz8uQIRfacIoDkswudhaQXysKcOj9kDVF2Uewt5vJkbgV3f74ceN+
 MMkq9XxgF5gasjm9XeVXKDii06WI/XJE8I2f6kfkWe5WBr+4CU7n7MvuPci4dTdSkXve
 +ScA==
X-Gm-Message-State: AOAM530KdzBmVCapzjfDCAnnfvOw9DLfzyQCwMVG9edL06PeWNC4Njek
 Q5DuSGIFkvgC2iGxzjIoHyYQSA==
X-Google-Smtp-Source: ABdhPJzngwQ1GRfBMbKgiBiPRI8gnZebc7LNR7FjDiyutN4aU6f/LgtC3VTd1iFLKF83wkpA3Hdz7Q==
X-Received: by 2002:a63:5b5d:: with SMTP id l29mr2245348pgm.272.1614333760899; 
 Fri, 26 Feb 2021 02:02:40 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:02:40 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3 14/15] media: mtk-vcodec: venc: support START and STOP
 commands
Date: Fri, 26 Feb 2021 19:01:47 +0900
Message-Id: <20210226100148.1663389-15-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_050243_533640_506BEBEA 
X-CRM114-Status: GOOD (  25.25  )
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
Cc: Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The V4L2 encoder specification requires encoders to support the
V4L2_ENC_CMD_START and V4L2_ENC_CMD_STOP commands. Add support for these
to the mtk-vcodec encoder by reusing the same flush buffer as used by
the decoder driver.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 123 +++++++++++++++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
 3 files changed, 122 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 8dab9f520283..73da6c7b69a8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -253,6 +253,7 @@ struct vdec_pic_info {
  * @last_decoded_picinfo: pic information get from latest decode
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Only
  *		     to be used with encoder and stateful decoder.
+ * @is_flushing: set to true if flushing is in progress.
  * @current_codec: current set input codec, in V4L2 pixel format
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
@@ -292,6 +293,7 @@ struct mtk_vcodec_ctx {
 	struct work_struct encode_work;
 	struct vdec_pic_info last_decoded_picinfo;
 	struct v4l2_m2m_buffer empty_flush_buf;
+	bool is_flushing;
 
 	u32 current_codec;
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 8c917969c2f1..4de381b522ae 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -658,6 +658,7 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
 			     struct v4l2_buffer *buf)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	int ret;
 
 	if (ctx->state == MTK_STATE_ABORT) {
 		mtk_v4l2_err("[%d] Call on QBUF after unrecoverable error",
@@ -665,7 +666,77 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
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
+				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	switch (cmd->cmd) {
+	case V4L2_ENC_CMD_STOP:
+		src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
+				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
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
@@ -701,6 +772,9 @@ const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
 
 	.vidioc_g_selection		= vidioc_venc_g_selection,
 	.vidioc_s_selection		= vidioc_venc_s_selection,
+
+	.vidioc_encoder_cmd		= vidioc_encoder_cmd,
+	.vidioc_try_encoder_cmd		= v4l2_m2m_ioctl_try_encoder_cmd,
 };
 
 static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
@@ -857,9 +931,27 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 			dst_buf->vb2_buf.planes[0].bytesused = 0;
 			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 		}
+		/* STREAMOFF on the CAPTURE queue completes any ongoing flush */
+		if (ctx->is_flushing) {
+			mtk_v4l2_debug(1, "STREAMOFF called while flushing");
+			v4l2_m2m_buf_remove_by_buf(&ctx->m2m_ctx->out_q_ctx,
+						   &ctx->empty_flush_buf.vb);
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
@@ -955,12 +1047,15 @@ static int mtk_venc_param_change(struct mtk_vcodec_ctx *ctx)
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
@@ -1046,6 +1141,20 @@ static void mtk_venc_worker(struct work_struct *work)
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
index be3842e6ca47..b2ba8db32fea 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -150,6 +150,7 @@ static int fops_vcodec_open(struct file *file)
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
 	int ret = 0;
+	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -183,6 +184,9 @@ static int fops_vcodec_open(struct file *file)
 				ret);
 		goto err_m2m_ctx_init;
 	}
+	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
+				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	ctx->empty_flush_buf.vb.vb2_buf.vb2_queue = src_vq;
 	mtk_vcodec_enc_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
