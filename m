Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11516C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:33:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17C8613DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D17C8613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02C3r8dWMHxBWemwnRfkvfKbeuWy8aaVHfFOafyTkQI=; b=QDE5HaFAQDySS4
	rk/TPONTOjzfh9zqeO9VAok4uHB9EN8l0Oxz09ETfJb7ZdoQTApzgBH3vtlSAXCF2fTp5r58BhKJQ
	DOMljsb1oRilW4DKvMHre1v7EaaqkXVOAkn36OkIMZ0TWCDKNeYqt7ewYZoPu78jUl2NHYGqcrToE
	6RfRNx+m0V3E/hMehzf3WqKxon7az3m8gkWd0hJs5BQS6Tex0B85qhu5x4pN/gkhT461DHeTHLPuo
	SbnY5hmYxeu3q9IZvTAYFGFbGghGEiiUBYgFnP/uA90pdfcDVRIcx7PY2iVwUIGK6Ko4CskPdoZe0
	wMRsE+D3jZiDAjq3/iFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HEe-007qNW-5l; Mon, 05 Jul 2021 05:33:36 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HEa-007qKL-O3
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:33:34 +0000
Received: by mail-pg1-x532.google.com with SMTP id f5so7922839pgv.3
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/iq39xanR+np3JTP99hzwqOOEzqUU4t0BZOBeMWeOw=;
 b=JCWYfvZzwyAf3mGBsLtlYle5K8IIYcAhPGlqnxi2codcXVEqqBBSk4VlKP1TxkYegr
 1CLwjznDYH9lNod8yMCh1ByhT+bI2ILyym2r0UItEFNKAs0ajdufmjfmCoHqlDpWKJpd
 Mz3hkOuiQLOBB1Mj59FQCOdkOwHSnvOwq/cXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/iq39xanR+np3JTP99hzwqOOEzqUU4t0BZOBeMWeOw=;
 b=jfKCZpLk9JY+IGqlFCMJ8res9lQaKpow+8mowARYB6jcpyFrlsJlpvBe3CR9+CIiZs
 e013bw37K0wCurYqwUEAx7cMIY69173+uLSFcg5kkoOKUMNfjZtNr8fshuXrBP2lKGFv
 +E4pxQfY+JNwRYJBHDYBvmjUMdfmG62xrF6GtDAqoKuncCATgKCWC3NZZroxFfCHh9bn
 rABFyTkhXmnYStcdLR/B7h0MUilYQD/l2wPoB/sNtRCv/TrnVHF6Git0TTdfXfXKP0lj
 IeiCqgI+nU2uCZ+eMjFJJiB4cL46Tj8YJ69AiD69V+jGTd9u3mGEz3yqoLpka/niECHg
 o//A==
X-Gm-Message-State: AOAM531zq8vTA7iIpr1PLLD3FZUDpzJ4BxVq1g3w3aosGoz4a50hvape
 URPHHeTncy6QHPc4Ghf82hYrHw==
X-Google-Smtp-Source: ABdhPJyWxg7uyKPoXeKc5QuU9k0GAJFXorYw1aOO7QqXfzGOTzBSEcWhhwJMLzXk8wchkg9sXrAT+A==
X-Received: by 2002:a62:e111:0:b029:31b:8150:38b4 with SMTP id
 q17-20020a62e1110000b029031b815038b4mr8532393pfh.48.1625463211999; 
 Sun, 04 Jul 2021 22:33:31 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:3fed:7130:60f:265a])
 by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 22:33:31 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v6 04/14] media: mtk-vcodec: make flush buffer reusable by
 encoder
Date: Mon,  5 Jul 2021 14:32:48 +0900
Message-Id: <20210705053258.1614177-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223332_817294_1761062A 
X-CRM114-Status: GOOD (  19.65  )
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
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 24 +++++++++----------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  2 --
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 12 +---------
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  6 +++--
 4 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 16e057f73789..7edd6266dc6a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -368,8 +368,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 		return;
 	}
 
-	src_buf_info = container_of(src_buf, struct mtk_video_dec_buf,
-				    m2m_buf.vb);
 	dst_buf_info = container_of(dst_buf, struct mtk_video_dec_buf,
 				    m2m_buf.vb);
 
@@ -390,7 +388,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 			pfb->base_y.va, &pfb->base_y.dma_addr,
 			&pfb->base_c.dma_addr, pfb->base_y.size);
 
-	if (src_buf_info->lastframe) {
+	if (src_buf == &ctx->empty_flush_buf.vb) {
 		mtk_v4l2_debug(1, "Got empty flush input buffer.");
 		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
 
@@ -411,6 +409,10 @@ static void mtk_vdec_worker(struct work_struct *work)
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
@@ -514,8 +516,7 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 			mtk_v4l2_debug(1, "Capture stream is off. No need to flush.");
 			return 0;
 		}
-		v4l2_m2m_buf_queue(ctx->m2m_ctx,
-				   &ctx->empty_flush_buf->m2m_buf.vb);
+		v4l2_m2m_buf_queue(ctx->m2m_ctx, &ctx->empty_flush_buf.vb);
 		v4l2_m2m_try_schedule(ctx->m2m_ctx);
 		break;
 
@@ -1122,7 +1123,6 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
 	unsigned int dpbsize = 1, i = 0;
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vb2_v4l2 = NULL;
-	struct mtk_video_dec_buf *buf = NULL;
 	struct mtk_q_data *dst_q_data;
 
 	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
@@ -1132,6 +1132,8 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
 	 * check if this buffer is ready to be used after decode
 	 */
 	if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		struct mtk_video_dec_buf *buf;
+
 		vb2_v4l2 = to_vb2_v4l2_buffer(vb);
 		buf = container_of(vb2_v4l2, struct mtk_video_dec_buf,
 				   m2m_buf.vb);
@@ -1161,8 +1163,8 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
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
@@ -1267,8 +1269,6 @@ static int vb2ops_vdec_buf_init(struct vb2_buffer *vb)
 	if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		buf->used = false;
 		buf->queued_in_v4l2 = false;
-	} else {
-		buf->lastframe = false;
 	}
 
 	return 0;
@@ -1294,9 +1294,7 @@ static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
-			struct mtk_video_dec_buf *buf_info = container_of(
-				 src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
-			if (!buf_info->lastframe)
+			if (src_buf != &ctx->empty_flush_buf.vb)
 				v4l2_m2m_buf_done(src_buf,
 						VB2_BUF_STATE_ERROR);
 		}
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index cf26b6c1486a..1f8b7300dce6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -40,7 +40,6 @@ struct vdec_fb {
  * @queued_in_vb2:	Capture buffer is queue in vb2
  * @queued_in_v4l2:	Capture buffer is in v4l2 driver, but not in vb2
  *			queue yet
- * @lastframe:		Intput buffer is last buffer - EOS
  * @error:		An unrecoverable error occurs on this buffer.
  * @frame_buffer:	Decode status, and buffer information of Capture buffer
  *
@@ -52,7 +51,6 @@ struct mtk_video_dec_buf {
 	bool	used;
 	bool	queued_in_vb2;
 	bool	queued_in_v4l2;
-	bool	lastframe;
 	bool	error;
 	struct vdec_fb	frame_buffer;
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index f87dc47d9e63..5ce7f1b83e4e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -81,21 +81,14 @@ static int fops_vcodec_open(struct file *file)
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
@@ -121,8 +114,7 @@ static int fops_vcodec_open(struct file *file)
 	}
 	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
 				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	ctx->empty_flush_buf->m2m_buf.vb.vb2_buf.vb2_queue = src_vq;
-	ctx->empty_flush_buf->lastframe = true;
+	ctx->empty_flush_buf.vb.vb2_buf.vb2_queue = src_vq;
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
@@ -162,7 +154,6 @@ static int fops_vcodec_open(struct file *file)
 err_ctrls_setup:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
-	kfree(ctx->empty_flush_buf);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 
@@ -193,7 +184,6 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
 	list_del_init(&ctx->list);
-	kfree(ctx->empty_flush_buf);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 	return 0;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index c6c7672fecfb..cad52d8b1463 100644
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
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
  * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
@@ -288,7 +290,7 @@ struct mtk_vcodec_ctx {
 	struct work_struct decode_work;
 	struct work_struct encode_work;
 	struct vdec_pic_info last_decoded_picinfo;
-	struct mtk_video_dec_buf *empty_flush_buf;
+	struct v4l2_m2m_buffer empty_flush_buf;
 
 	enum v4l2_colorspace colorspace;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
