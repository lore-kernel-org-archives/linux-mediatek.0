Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33868C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:43:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F81C20A8B
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t0M/HJLp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e4ounLHD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F81C20A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ATUsrqvlU/M/rTUnappah7yWmMAJVKXCYVBRL54ZFus=; b=t0M/HJLpMiSGi/izbGNPSRnvZ
	Y0aSbzGUdW6s5b+JEQw+y7W/C6B19g+3smUA9842L+U4sRUNdGQGb4FlJ4wFNloca99K7vjGVzY4H
	2ecWzm9Vr+C6wsxaZ38bIPFTWKziN6Fb6O2+bNmtcKhfrE3YYQ0qIKv7TrUKPUhxmRzP0awasllPy
	btQax/I34UTqZHp+mNcpeqxzhuRh61LLeg+cxY+UYzwnkdmVNXzG+5dhQP0wqPCPiBRIY82T9oyfj
	YToaRkjQbD2L2XMJ/oQ8waKkqcVSt4KAVlwGw1uRDuUrNtx4t7kvCWIbrKZFPjXX9ey174vYFvkCi
	033X7iB/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2nrL-0006Wo-5V; Tue, 04 Aug 2020 03:43:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2nqu-0006AW-Kp; Tue, 04 Aug 2020 03:43:02 +0000
X-UUID: 081cddff5eee4b51b731114d66cbafaf-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/GuxYq6j4LMI0C3oIC5wBdIcBp2xB3j+Ehv2Je4DsIQ=; 
 b=e4ounLHDHwuQOvwyDQKXI+LvHIL6yjls2QCK70YNqUNpialAAI4Fca1rmgpbA32w5Qed6FkEbIN68fEW8OCNtObA43rCWXuSfnmXJtuiSqpudDlNI3UjWCpI7p+PbQsz1bY9Kj6ML9DDj3qc5FFSNvDAeZuvKJXC9pDv8Q/TT0I=;
X-UUID: 081cddff5eee4b51b731114d66cbafaf-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2085967572; Mon, 03 Aug 2020 19:42:51 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 20:42:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:42:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:42:03 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v11 19/28] media: platform: Redefinition of mtk_jpeg_q_data
 structure
Date: Tue, 4 Aug 2020 11:40:53 +0800
Message-ID: <20200804034102.22983-20-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_234300_912658_BD3CA41B 
X-CRM114-Status: GOOD (  17.45  )
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

The standard v4l2_pix_format_mplane structure contains width/height/
sizeimage/bytesperline, so use v4l2_pix_format_mplane to replace them.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v11: no changes
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 101 ++++++++++--------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  20 +---
 2 files changed, 57 insertions(+), 64 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index b3e38ffd4e81..01f4656fe2b3 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -207,15 +207,15 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 
 	q_data = mtk_jpeg_get_q_data(ctx, f->type);
 
-	pix_mp->width = q_data->w;
-	pix_mp->height = q_data->h;
+	pix_mp->width = q_data->pix_mp.width;
+	pix_mp->height = q_data->pix_mp.height;
 	pix_mp->field = V4L2_FIELD_NONE;
 	pix_mp->pixelformat = q_data->fmt->fourcc;
 	pix_mp->num_planes = q_data->fmt->colplanes;
-	pix_mp->colorspace = ctx->colorspace;
-	pix_mp->ycbcr_enc = ctx->ycbcr_enc;
-	pix_mp->xfer_func = ctx->xfer_func;
-	pix_mp->quantization = ctx->quantization;
+	pix_mp->colorspace = q_data->pix_mp.colorspace;
+	pix_mp->ycbcr_enc = q_data->pix_mp.ycbcr_enc;
+	pix_mp->xfer_func = q_data->pix_mp.xfer_func;
+	pix_mp->quantization = q_data->pix_mp.quantization;
 
 	v4l2_dbg(1, debug, &jpeg->v4l2_dev, "(%d) g_fmt:%c%c%c%c wxh:%ux%u\n",
 		 f->type,
@@ -228,8 +228,8 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 	for (i = 0; i < pix_mp->num_planes; i++) {
 		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[i];
 
-		pfmt->bytesperline = q_data->bytesperline[i];
-		pfmt->sizeimage = q_data->sizeimage[i];
+		pfmt->bytesperline = q_data->pix_mp.plane_fmt[i].bytesperline;
+		pfmt->sizeimage = q_data->pix_mp.plane_fmt[i].sizeimage;
 
 		v4l2_dbg(1, debug, &jpeg->v4l2_dev,
 			 "plane[%d] bpl=%u, size=%u\n",
@@ -318,12 +318,12 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 	q_data->fmt = mtk_jpeg_find_format(mtk_jpeg_formats,
 					   MTK_JPEG_NUM_FORMATS,
 					   pix_mp->pixelformat, fmt_type);
-	q_data->w = pix_mp->width;
-	q_data->h = pix_mp->height;
-	ctx->colorspace = pix_mp->colorspace;
-	ctx->ycbcr_enc = pix_mp->ycbcr_enc;
-	ctx->xfer_func = pix_mp->xfer_func;
-	ctx->quantization = pix_mp->quantization;
+	q_data->pix_mp.width = pix_mp->width;
+	q_data->pix_mp.height = pix_mp->height;
+	q_data->pix_mp.colorspace = pix_mp->colorspace;
+	q_data->pix_mp.ycbcr_enc = pix_mp->ycbcr_enc;
+	q_data->pix_mp.xfer_func = pix_mp->xfer_func;
+	q_data->pix_mp.quantization = pix_mp->quantization;
 
 	v4l2_dbg(1, debug, &jpeg->v4l2_dev, "(%d) s_fmt:%c%c%c%c wxh:%ux%u\n",
 		 f->type,
@@ -331,15 +331,18 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 		 (q_data->fmt->fourcc >>  8 & 0xff),
 		 (q_data->fmt->fourcc >> 16 & 0xff),
 		 (q_data->fmt->fourcc >> 24 & 0xff),
-		 q_data->w, q_data->h);
+		 q_data->pix_mp.width, q_data->pix_mp.height);
 
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
-		q_data->bytesperline[i] = pix_mp->plane_fmt[i].bytesperline;
-		q_data->sizeimage[i] = pix_mp->plane_fmt[i].sizeimage;
+		q_data->pix_mp.plane_fmt[i].bytesperline =
+					pix_mp->plane_fmt[i].bytesperline;
+		q_data->pix_mp.plane_fmt[i].sizeimage =
+					pix_mp->plane_fmt[i].sizeimage;
 
 		v4l2_dbg(1, debug, &jpeg->v4l2_dev,
 			 "plane[%d] bpl=%u, size=%u\n",
-			 i, q_data->bytesperline[i], q_data->sizeimage[i]);
+			 i, q_data->pix_mp.plane_fmt[i].bytesperline,
+			 q_data->pix_mp.plane_fmt[i].sizeimage);
 	}
 
 	return 0;
@@ -404,15 +407,15 @@ static int mtk_jpeg_g_selection(struct file *file, void *priv,
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE:
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
-		s->r.width = ctx->out_q.w;
-		s->r.height = ctx->out_q.h;
+		s->r.width = ctx->out_q.pix_mp.width;
+		s->r.height = ctx->out_q.pix_mp.height;
 		s->r.left = 0;
 		s->r.top = 0;
 		break;
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 	case V4L2_SEL_TGT_COMPOSE_PADDED:
-		s->r.width = ctx->cap_q.w;
-		s->r.height = ctx->cap_q.h;
+		s->r.width = ctx->cap_q.pix_mp.width;
+		s->r.height = ctx->cap_q.pix_mp.height;
 		s->r.left = 0;
 		s->r.top = 0;
 		break;
@@ -468,14 +471,14 @@ static int mtk_jpeg_queue_setup(struct vb2_queue *q,
 
 	if (*num_planes) {
 		for (i = 0; i < *num_planes; i++)
-			if (sizes[i] < q_data->sizeimage[i])
+			if (sizes[i] < q_data->pix_mp.plane_fmt[i].sizeimage)
 				return -EINVAL;
 		return 0;
 	}
 
 	*num_planes = q_data->fmt->colplanes;
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
-		sizes[i] = q_data->sizeimage[i];
+		sizes[i] =  q_data->pix_mp.plane_fmt[i].sizeimage;
 		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "sizeimage[%d]=%u\n",
 			 i, sizes[i]);
 	}
@@ -494,7 +497,8 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 		return -EINVAL;
 
 	for (i = 0; i < q_data->fmt->colplanes; i++)
-		vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
+		vb2_set_plane_payload(vb, i,
+				      q_data->pix_mp.plane_fmt[i].sizeimage);
 
 	return 0;
 }
@@ -506,7 +510,8 @@ static bool mtk_jpeg_check_resolution_change(struct mtk_jpeg_ctx *ctx,
 	struct mtk_jpeg_q_data *q_data;
 
 	q_data = &ctx->out_q;
-	if (q_data->w != param->pic_w || q_data->h != param->pic_h) {
+	if (q_data->pix_mp.width != param->pic_w ||
+	    q_data->pix_mp.height != param->pic_h) {
 		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "Picture size change\n");
 		return true;
 	}
@@ -529,20 +534,20 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
 	int i;
 
 	q_data = &ctx->out_q;
-	q_data->w = param->pic_w;
-	q_data->h = param->pic_h;
+	q_data->pix_mp.width = param->pic_w;
+	q_data->pix_mp.height = param->pic_h;
 
 	q_data = &ctx->cap_q;
-	q_data->w = param->dec_w;
-	q_data->h = param->dec_h;
+	q_data->pix_mp.width = param->dec_w;
+	q_data->pix_mp.height = param->dec_h;
 	q_data->fmt = mtk_jpeg_find_format(mtk_jpeg_formats,
 					   MTK_JPEG_NUM_FORMATS,
 					   param->dst_fourcc,
 					   MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
 
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
-		q_data->bytesperline[i] = param->mem_stride[i];
-		q_data->sizeimage[i] = param->comp_size[i];
+		q_data->pix_mp.plane_fmt[i].bytesperline = param->mem_stride[i];
+		q_data->pix_mp.plane_fmt[i].sizeimage = param->comp_size[i];
 	}
 
 	v4l2_dbg(1, debug, &jpeg->v4l2_dev,
@@ -841,32 +846,36 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 	struct mtk_jpeg_q_data *q = &ctx->out_q;
 	int i;
 
-	ctx->colorspace = V4L2_COLORSPACE_JPEG,
-	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
-	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	q->pix_mp.colorspace = V4L2_COLORSPACE_JPEG,
+	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	q->pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	q->pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
 				      V4L2_PIX_FMT_JPEG,
 				      MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
-	q->w = MTK_JPEG_MIN_WIDTH;
-	q->h = MTK_JPEG_MIN_HEIGHT;
-	q->bytesperline[0] = 0;
-	q->sizeimage[0] = MTK_JPEG_DEFAULT_SIZEIMAGE;
+	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
+	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
+	q->pix_mp.plane_fmt[0].bytesperline = 0;
+	q->pix_mp.plane_fmt[0].sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
 
 	q = &ctx->cap_q;
 	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
 				      V4L2_PIX_FMT_YUV420M,
 				      MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
-	q->w = MTK_JPEG_MIN_WIDTH;
-	q->h = MTK_JPEG_MIN_HEIGHT;
+	q->pix_mp.colorspace = V4L2_COLORSPACE_JPEG,
+	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	q->pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	q->pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
+	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
 
 	for (i = 0; i < q->fmt->colplanes; i++) {
-		u32 stride = q->w * q->fmt->h_sample[i] / 4;
-		u32 h = q->h * q->fmt->v_sample[i] / 4;
+		u32 stride = q->pix_mp.width * q->fmt->h_sample[i] / 4;
+		u32 h = q->pix_mp.height * q->fmt->v_sample[i] / 4;
 
-		q->bytesperline[i] = stride;
-		q->sizeimage[i] = stride * h;
+		q->pix_mp.plane_fmt[i].bytesperline = stride;
+		q->pix_mp.plane_fmt[i].sizeimage = stride * h;
 	}
 }
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 192ee488a50a..4c76a9dcc4b7 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -96,18 +96,11 @@ struct mtk_jpeg_fmt {
 /**
  * mtk_jpeg_q_data - parameters of one queue
  * @fmt:	  driver-specific format of this queue
- * @w:		  image width
- * @h:		  image height
- * @bytesperline: distance in bytes between the leftmost pixels in two adjacent
- *                lines
- * @sizeimage:	  image buffer size in bytes
+ * @pix_mp:	  multiplanar format
  */
 struct mtk_jpeg_q_data {
 	struct mtk_jpeg_fmt	*fmt;
-	u32			w;
-	u32			h;
-	u32			bytesperline[VIDEO_MAX_PLANES];
-	u32			sizeimage[VIDEO_MAX_PLANES];
+	struct v4l2_pix_format_mplane pix_mp;
 };
 
 /**
@@ -117,10 +110,6 @@ struct mtk_jpeg_q_data {
  * @cap_q:		destination (capture) queue queue information
  * @fh:			V4L2 file handle
  * @state:		state of the context
- * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
- * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
- * @quantization: enum v4l2_quantization, colorspace quantization
- * @xfer_func: enum v4l2_xfer_func, colorspace transfer function
  */
 struct mtk_jpeg_ctx {
 	struct mtk_jpeg_dev		*jpeg;
@@ -128,11 +117,6 @@ struct mtk_jpeg_ctx {
 	struct mtk_jpeg_q_data		cap_q;
 	struct v4l2_fh			fh;
 	enum mtk_jpeg_ctx_state		state;
-
-	enum v4l2_colorspace colorspace;
-	enum v4l2_ycbcr_encoding ycbcr_enc;
-	enum v4l2_quantization quantization;
-	enum v4l2_xfer_func xfer_func;
 };
 
 #endif /* _MTK_JPEG_CORE_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
