Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F034EC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50078613C6
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50078613C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SmJU8jdhHLT/OnKtgVFiIj6He1FpseW0P3Vbq+/cW3c=; b=lU7GeGvghfZca4RYpRk1NhCvW
	kbKjwgXOB27KwaGk8yNhLBfU9nad4eOuxAMJeD48LxIWQTIEDRC6bBCqiR8Qrk+W1d1aqXTHE1OoP
	BsFraHt8rQR9Kd4vU01MoQo42MOyRXQENCZ8hwQFpO+OxfwyjFMPe0bm28vDHDRqvvxyS1zPXSOeL
	PhSIQD+kcaGFmuneQfLet0hKjaSc4jWqFhik57AY4IoSaJt5FRkLRhpRTK2Wy+ge1F8fVfU3EHUbm
	6uJ2Y9CwBuM5Ka9KN3Lgg+yAu4JO8u34OJlThoMElGdkdgCnmaTitgO0N4NDejylcr6yUPCo5wFNv
	7lGjkwmxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLhg-001TvV-Nh; Tue, 27 Apr 2021 11:16:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhT-001TqR-CT
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 11:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=y245BjsBBoBDMhp2Hq7RuZw66md7jkGOZPH/qXHFLTc=; b=Cn+BnNxlJ8r84LiL7ii7ABKrnx
 nDvGbqGMq7mpKLwPGg4CvlSZUP6C4U+/IluDgfqECR3Wd9Cbb5q36aPFlyJCtgXpCRLygezIGYbNF
 UB2ggox+h1D84CGMAJJ4xwOnXLZChTGshMVaVLC6yrMeEhGrMjvZfilHhn2uuAfYYdDIr3iKfsR/q
 gVyEL9JUcTv3lRlkIXPs2pV2NkclC8aIQNOH82kYgMSo3U4MrNXqUTZEjJ7aybnnH6sbgcdhFvC0k
 STUU87kdXtZKIrVWanvBUKR+Mose/FwZjYmagzLZ1mFHJLuZElgb6E5IpBvHSV8/U/N459lo6R53l
 uDbT0AlQ==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhQ-00GgIk-GN
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 11:16:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id b21so2181118plz.0
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 04:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y245BjsBBoBDMhp2Hq7RuZw66md7jkGOZPH/qXHFLTc=;
 b=Ll7JiSsyTowxg9GU0xEzlSZqZ5CShh41qc1CI04juF3EIUHDkz1fEngw+5y0rfBfce
 lI53h2LDp6hJiz4sg1hPxQ7qeA8PHRD7NPH3oM7fXhoaCzLHZiey0+tDs3WWH6yjDLHd
 qOUvzx5mwX5KgFcyOSPZ+dI1xN+OQTiMy/emo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y245BjsBBoBDMhp2Hq7RuZw66md7jkGOZPH/qXHFLTc=;
 b=Jth4VhN7RNiirMTu1tLT7FmWZihFfmVRfQ8nvEfNzBjC1ZTlfaOlnW6yE3tb6DdVjb
 caaSkjEZmhJO+QiJsv5nIyTcH7Whg4rOvcinayHwf3VsbPFkjpE95+gHPV/R8VCCDGY6
 RFTcD7YUUsUpnJVpf444bjaB643v2JreJaAZg0koCGQeOLL/V9K1QnausKb3VShflh+V
 2vSm+SkiMdan6syNVIofD/XLkj7UzdIeL8y+msYSsb0vBzGQRaDNVQTJ5g0eHUb/+Ul6
 jWymv1b3a/Eqmx9RJWA4NPHjR/D1KU8blUAflusfDX5gmlbqFVRFQtTBCWC7Mg6xgf8g
 dS1A==
X-Gm-Message-State: AOAM532ltQQunYpx3vRTnbBnfLz+N+MZpmDip9jMvqauDPh138Mjb/m/
 nXa1ZiQALZIYe1gpkFwBu/Hjbg==
X-Google-Smtp-Source: ABdhPJzNo6PhHgHEhisSVqz6a9twVXvVYg1xIl0eLawZniTXM93PXxY+b89jNm4VDZ8DCJKUiJy2uA==
X-Received: by 2002:a17:902:8685:b029:e6:5ff6:f7df with SMTP id
 g5-20020a1709028685b02900e65ff6f7dfmr23693092plo.40.1619522175746; 
 Tue, 27 Apr 2021 04:16:15 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:b182:d363:32d0:53a2])
 by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:16:15 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 14/15] media: mtk-vcodec: venc: support START and STOP
 commands
Date: Tue, 27 Apr 2021 20:15:25 +0900
Message-Id: <20210427111526.1772293-15-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_041616_569903_98FE8162 
X-CRM114-Status: GOOD (  28.16  )
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
index c2f4cad6cfc2..1b61d722d313 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -252,6 +252,7 @@ struct vdec_pic_info {
  * @last_decoded_picinfo: pic information get from latest decode
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Only
  *		     to be used with encoder and stateful decoder.
+ * @is_flushing: set to true if flushing is in progress.
  * @current_codec: current set input codec, in V4L2 pixel format
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
@@ -291,6 +292,7 @@ struct mtk_vcodec_ctx {
 	struct work_struct encode_work;
 	struct vdec_pic_info last_decoded_picinfo;
 	struct v4l2_m2m_buffer empty_flush_buf;
+	bool is_flushing;
 
 	u32 current_codec;
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 4831052f475d..8058331dc553 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -659,6 +659,7 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
 			     struct v4l2_buffer *buf)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	int ret;
 
 	if (ctx->state == MTK_STATE_ABORT) {
 		mtk_v4l2_err("[%d] Call on QBUF after unrecoverable error",
@@ -666,7 +667,77 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
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
@@ -702,6 +773,9 @@ const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
 
 	.vidioc_g_selection		= vidioc_venc_g_selection,
 	.vidioc_s_selection		= vidioc_venc_s_selection,
+
+	.vidioc_encoder_cmd		= vidioc_encoder_cmd,
+	.vidioc_try_encoder_cmd		= v4l2_m2m_ioctl_try_encoder_cmd,
 };
 
 static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
@@ -869,9 +943,27 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
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
@@ -971,12 +1063,15 @@ static int mtk_venc_param_change(struct mtk_vcodec_ctx *ctx)
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
@@ -1062,6 +1157,20 @@ static void mtk_venc_worker(struct work_struct *work)
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
index 7d7b8cfc2cc5..2dd6fef896df 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -131,6 +131,7 @@ static int fops_vcodec_open(struct file *file)
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
 	int ret = 0;
+	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -164,6 +165,9 @@ static int fops_vcodec_open(struct file *file)
 				ret);
 		goto err_m2m_ctx_init;
 	}
+	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
+				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	ctx->empty_flush_buf.vb.vb2_buf.vb2_queue = src_vq;
 	mtk_vcodec_enc_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
