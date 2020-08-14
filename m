Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEC0C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:26:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1412120639
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cL/VMxLb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZL67253B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1412120639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fyBrsvJ1TohOzPH8l0Nh9ARkViS6f1AN9RGWlA7y/ho=; b=cL/VMxLbo5IX08gqTCC4c0zqM
	o1FdJRHpD7Xg+QF9QqgTiLuipcjnAieL2lhzQAZqCEC3c7dmhPbGIIhG0NUxkb642H7fUa7++BTOc
	7HcEkzFQ7BwXaryD0xhfn8NKdL+gkPO2aup0nQzWkuDhVHdtSNqOrVi/ihG8C9Nkk1G5CsfsPjGyL
	iqwMh3TN+kCP25fPRa/E3pbWVKCknpBU2A/AOECt3IBY5PQyPQPG8VkbXsIoUDwyUEECL/+Wb5Yg/
	hEFr5EnQv0TEt/2/SDOrb6KKC2/TPiRyZVj7R6sguMXYYLNwQox1o20utSx22fHJo2rNDVbIcy8+z
	haCpX+Vlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6U6i-0005HJ-Lf; Fri, 14 Aug 2020 07:26:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6U3i-0003N2-Qm; Fri, 14 Aug 2020 07:23:38 +0000
X-UUID: 5ae5ff5620e54cad887e6f7ed530c82d-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rKRkfrldeTMdwzNxOIDH+OtOLPDraRIgEh2l5wXR8XI=; 
 b=ZL67253BG4FitSXufxtwqCoZz8zxcDJkBGf1GBIrFNd6DwoD3WV3OIZTFD3hfcEo0Y3ZrcJBowo3VfCBarvnzhfqXO19VWxQv448ROeWAX87/xz7By5ce3qq4iTQuKEkkytTO+CpAhqN+VecIvMlqskLJOOGI7MFgYEJZ917Bck=;
X-UUID: 5ae5ff5620e54cad887e6f7ed530c82d-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 996701782; Thu, 13 Aug 2020 23:23:11 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 00:13:43 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:37 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v12 29/29] media: platform: Add jpeg enc feature
Date: Fri, 14 Aug 2020 15:12:02 +0800
Message-ID: <20200814071202.25067-31-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_032328_174018_C6C4F4E0 
X-CRM114-Status: GOOD (  22.73  )
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

Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jpeg
decode and encode have great similarities with function operation.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v12: fix the compile warnings
---
 drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 350 +++++++++++++++++-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  15 +
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 154 ++++++++
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  91 +++++
 5 files changed, 611 insertions(+), 4 deletions(-)
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h

diff --git a/drivers/media/platform/mtk-jpeg/Makefile b/drivers/media/platform/mtk-jpeg/Makefile
index 48516dcf96e6..76c33aad0f3f 100644
--- a/drivers/media/platform/mtk-jpeg/Makefile
+++ b/drivers/media/platform/mtk-jpeg/Makefile
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mtk_jpeg-objs := mtk_jpeg_core.o mtk_jpeg_dec_hw.o mtk_jpeg_dec_parse.o
+mtk_jpeg-objs := mtk_jpeg_core.o \
+		 mtk_jpeg_dec_hw.o \
+		 mtk_jpeg_dec_parse.o \
+		 mtk_jpeg_enc_hw.o
 obj-$(CONFIG_VIDEO_MEDIATEK_JPEG) += mtk_jpeg.o
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 3d95c7f0a22d..8d6d324ab113 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016 MediaTek Inc.
  * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
  *         Rick Chang <rick.chang@mediatek.com>
+ *         Xia Jiang <xia.jiang@mediatek.com>
  */
 
 #include <linux/clk.h>
@@ -23,10 +24,59 @@
 #include <media/videobuf2-dma-contig.h>
 #include <soc/mediatek/smi.h>
 
+#include "mtk_jpeg_enc_hw.h"
 #include "mtk_jpeg_dec_hw.h"
 #include "mtk_jpeg_core.h"
 #include "mtk_jpeg_dec_parse.h"
 
+static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
+	{
+		.fourcc		= V4L2_PIX_FMT_JPEG,
+		.colplanes	= 1,
+		.flags		= MTK_JPEG_FMT_FLAG_CAPTURE,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_NV12M,
+		.hw_format	= JPEG_ENC_YUV_FORMAT_NV12,
+		.h_sample	= {4, 4},
+		.v_sample	= {4, 2},
+		.colplanes	= 2,
+		.h_align	= 4,
+		.v_align	= 4,
+		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_NV21M,
+		.hw_format	= JEPG_ENC_YUV_FORMAT_NV21,
+		.h_sample	= {4, 4},
+		.v_sample	= {4, 2},
+		.colplanes	= 2,
+		.h_align	= 4,
+		.v_align	= 4,
+		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.hw_format	= JPEG_ENC_YUV_FORMAT_YUYV,
+		.h_sample	= {8},
+		.v_sample	= {4},
+		.colplanes	= 1,
+		.h_align	= 5,
+		.v_align	= 3,
+		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_YVYU,
+		.hw_format	= JPEG_ENC_YUV_FORMAT_YVYU,
+		.h_sample	= {8},
+		.v_sample	= {4},
+		.colplanes	= 1,
+		.h_align	= 5,
+		.v_align	= 3,
+		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
+	},
+};
+
 static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_JPEG,
@@ -53,6 +103,7 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
 	},
 };
 
+#define MTK_JPEG_ENC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_enc_formats)
 #define MTK_JPEG_DEC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_dec_formats)
 
 struct mtk_jpeg_src_buf {
@@ -64,6 +115,11 @@ struct mtk_jpeg_src_buf {
 static int debug;
 module_param(debug, int, 0644);
 
+static inline struct mtk_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct mtk_jpeg_ctx, ctrl_hdl);
+}
+
 static inline struct mtk_jpeg_ctx *mtk_jpeg_fh_to_ctx(struct v4l2_fh *fh)
 {
 	return container_of(fh, struct mtk_jpeg_ctx, fh);
@@ -88,6 +144,53 @@ static int mtk_jpeg_querycap(struct file *file, void *priv,
 	return 0;
 }
 
+static int vidioc_jpeg_enc_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mtk_jpeg_ctx *ctx = ctrl_to_ctx(ctrl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_JPEG_RESTART_INTERVAL:
+		ctx->restart_interval = ctrl->val;
+		break;
+	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
+		ctx->enc_quality = ctrl->val;
+		break;
+	case V4L2_CID_JPEG_ACTIVE_MARKER:
+		ctx->enable_exif = ctrl->val & V4L2_JPEG_ACTIVE_MARKER_APP1;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops mtk_jpeg_enc_ctrl_ops = {
+	.s_ctrl = vidioc_jpeg_enc_s_ctrl,
+};
+
+static int mtk_jpeg_enc_ctrls_setup(struct mtk_jpeg_ctx *ctx)
+{
+	const struct v4l2_ctrl_ops *ops = &mtk_jpeg_enc_ctrl_ops;
+	struct v4l2_ctrl_handler *handler = &ctx->ctrl_hdl;
+
+	v4l2_ctrl_handler_init(handler, 3);
+
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_JPEG_RESTART_INTERVAL, 0, 100,
+			  1, 0);
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_JPEG_COMPRESSION_QUALITY, 48,
+			  100, 1, 90);
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_JPEG_ACTIVE_MARKER, 0,
+			  V4L2_JPEG_ACTIVE_MARKER_APP1, 0, 0);
+
+	if (handler->error) {
+		v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+		return handler->error;
+	}
+
+	v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
+
+	return 0;
+}
+
 static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
 			     struct v4l2_fmtdesc *f, u32 type)
 {
@@ -331,6 +434,8 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 					   pix_mp->pixelformat, fmt_type);
 	q_data->pix_mp.width = pix_mp->width;
 	q_data->pix_mp.height = pix_mp->height;
+	q_data->enc_crop_rect.width = pix_mp->width;
+	q_data->enc_crop_rect.height = pix_mp->height;
 	q_data->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
 	q_data->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
 	q_data->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
@@ -407,6 +512,31 @@ static int mtk_jpeg_subscribe_event(struct v4l2_fh *fh,
 	return v4l2_ctrl_subscribe_event(fh, sub);
 }
 
+static int mtk_jpeg_enc_g_selection(struct file *file, void *priv,
+				    struct v4l2_selection *s)
+{
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		s->r = ctx->out_q.enc_crop_rect;
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		s->r.width = ctx->out_q.pix_mp.width;
+		s->r.height = ctx->out_q.pix_mp.height;
+		s->r.left = 0;
+		s->r.top = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
 				    struct v4l2_selection *s)
 {
@@ -436,6 +566,56 @@ static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
+static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
+				    struct v4l2_selection *s)
+{
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = min(s->r.width, ctx->out_q.pix_mp.width);
+		s->r.height = min(s->r.height, ctx->out_q.pix_mp.height);
+		ctx->out_q.enc_crop_rect = s->r;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mtk_jpeg_enc_ioctl_ops = {
+	.vidioc_querycap                = mtk_jpeg_querycap,
+	.vidioc_enum_fmt_vid_cap	= mtk_jpeg_enum_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_out	= mtk_jpeg_enum_fmt_vid_out,
+	.vidioc_try_fmt_vid_cap_mplane	= mtk_jpeg_try_fmt_vid_cap_mplane,
+	.vidioc_try_fmt_vid_out_mplane	= mtk_jpeg_try_fmt_vid_out_mplane,
+	.vidioc_g_fmt_vid_cap_mplane    = mtk_jpeg_g_fmt_vid_mplane,
+	.vidioc_g_fmt_vid_out_mplane    = mtk_jpeg_g_fmt_vid_mplane,
+	.vidioc_s_fmt_vid_cap_mplane    = mtk_jpeg_s_fmt_vid_cap_mplane,
+	.vidioc_s_fmt_vid_out_mplane    = mtk_jpeg_s_fmt_vid_out_mplane,
+	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
+	.vidioc_subscribe_event         = mtk_jpeg_subscribe_event,
+	.vidioc_g_selection		= mtk_jpeg_enc_g_selection,
+	.vidioc_s_selection		= mtk_jpeg_enc_s_selection,
+
+	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf                = v4l2_m2m_ioctl_querybuf,
+	.vidioc_dqbuf                   = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_expbuf                  = v4l2_m2m_ioctl_expbuf,
+	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
 static const struct v4l2_ioctl_ops mtk_jpeg_dec_ioctl_ops = {
 	.vidioc_querycap                = mtk_jpeg_querycap,
 	.vidioc_enum_fmt_vid_cap	= mtk_jpeg_enum_fmt_vid_cap,
@@ -501,15 +681,22 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct mtk_jpeg_q_data *q_data = NULL;
+	struct v4l2_plane_pix_format plane_fmt = {};
 	int i;
 
 	q_data = mtk_jpeg_get_q_data(ctx, vb->vb2_queue->type);
 	if (!q_data)
 		return -EINVAL;
 
-	for (i = 0; i < q_data->fmt->colplanes; i++)
-		vb2_set_plane_payload(vb, i,
-				      q_data->pix_mp.plane_fmt[i].sizeimage);
+	for (i = 0; i < q_data->fmt->colplanes; i++) {
+		plane_fmt = q_data->pix_mp.plane_fmt[i];
+		if (ctx->enable_exif &&
+		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
+			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
+					      MTK_JPEG_MAX_EXIF_SIZE);
+		else
+			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
+	}
 
 	return 0;
 }
@@ -572,6 +759,17 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
 		 param->dec_w, param->dec_h);
 }
 
+static void mtk_jpeg_enc_buf_queue(struct vb2_buffer *vb)
+{
+	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+
+	v4l2_dbg(2, debug, &jpeg->v4l2_dev, "(%d) buf_q id=%d, vb=%p\n",
+		 vb->vb2_queue->type, vb->index, vb);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, to_vb2_v4l2_buffer(vb));
+}
+
 static void mtk_jpeg_dec_buf_queue(struct vb2_buffer *vb)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
@@ -620,6 +818,15 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
 		return v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 }
 
+static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
+{
+	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct vb2_v4l2_buffer *vb;
+
+	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
+}
+
 static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
@@ -655,6 +862,15 @@ static const struct vb2_ops mtk_jpeg_dec_qops = {
 	.stop_streaming     = mtk_jpeg_dec_stop_streaming,
 };
 
+static const struct vb2_ops mtk_jpeg_enc_qops = {
+	.queue_setup        = mtk_jpeg_queue_setup,
+	.buf_prepare        = mtk_jpeg_buf_prepare,
+	.buf_queue          = mtk_jpeg_enc_buf_queue,
+	.wait_prepare       = vb2_ops_wait_prepare,
+	.wait_finish        = vb2_ops_wait_finish,
+	.stop_streaming     = mtk_jpeg_enc_stop_streaming,
+};
+
 static void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
 				 struct vb2_buffer *src_buf,
 				 struct mtk_jpeg_bs *bs)
@@ -692,6 +908,48 @@ static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
 	return 0;
 }
 
+static void mtk_jpeg_enc_device_run(void *priv)
+{
+	struct mtk_jpeg_ctx *ctx = priv;
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
+	unsigned long flags;
+	int ret;
+
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	ret = pm_runtime_get_sync(jpeg->dev);
+	if (ret < 0)
+		goto enc_end;
+
+	schedule_delayed_work(&jpeg->job_timeout_work,
+			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
+
+	spin_lock_irqsave(&jpeg->hw_lock, flags);
+
+	/*
+	 * Resetting the hardware every frame is to ensure that all the
+	 * registers are cleared. This is a hardware requirement.
+	 */
+	mtk_jpeg_enc_reset(jpeg->reg_base);
+
+	mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf);
+	mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf);
+	mtk_jpeg_set_enc_params(ctx, jpeg->reg_base);
+	mtk_jpeg_enc_start(jpeg->reg_base);
+	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
+	return;
+
+enc_end:
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	v4l2_m2m_buf_done(dst_buf, buf_state);
+	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+}
+
 static void mtk_jpeg_dec_device_run(void *priv)
 {
 	struct mtk_jpeg_ctx *ctx = priv;
@@ -750,6 +1008,10 @@ static int mtk_jpeg_dec_job_ready(void *priv)
 	return (ctx->state == MTK_JPEG_RUNNING) ? 1 : 0;
 }
 
+static const struct v4l2_m2m_ops mtk_jpeg_enc_m2m_ops = {
+	.device_run = mtk_jpeg_enc_device_run,
+};
+
 static const struct v4l2_m2m_ops mtk_jpeg_dec_m2m_ops = {
 	.device_run = mtk_jpeg_dec_device_run,
 	.job_ready  = mtk_jpeg_dec_job_ready,
@@ -810,6 +1072,54 @@ static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 	mtk_smi_larb_put(jpeg->larb);
 }
 
+static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
+{
+	struct mtk_jpeg_ctx *ctx;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
+	u32 result_size;
+
+	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
+	if (!ctx) {
+		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
+		return IRQ_HANDLED;
+	}
+
+	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
+	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
+
+	buf_state = VB2_BUF_STATE_DONE;
+
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	v4l2_m2m_buf_done(dst_buf, buf_state);
+	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	pm_runtime_put(ctx->jpeg->dev);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mtk_jpeg_enc_irq(int irq, void *priv)
+{
+	struct mtk_jpeg_dev *jpeg = priv;
+	u32 irq_status;
+	irqreturn_t ret = IRQ_NONE;
+
+	cancel_delayed_work(&jpeg->job_timeout_work);
+
+	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
+		     JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
+	if (irq_status)
+		writel(0, jpeg->reg_base + JPEG_ENC_INT_STS);
+
+	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
+		return ret;
+
+	ret = mtk_jpeg_enc_done(jpeg);
+	return ret;
+}
+
 static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 {
 	struct mtk_jpeg_dev *jpeg = priv;
@@ -862,6 +1172,7 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 	struct mtk_jpeg_q_data *q = &ctx->out_q;
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
+	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
 	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
 	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
 	q->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
@@ -918,6 +1229,15 @@ static int mtk_jpeg_open(struct file *file)
 		goto error;
 	}
 
+	if (jpeg->variant->cap_q_default_fourcc == V4L2_PIX_FMT_JPEG) {
+		ret = mtk_jpeg_enc_ctrls_setup(ctx);
+		if (ret) {
+			v4l2_err(&jpeg->v4l2_dev, "Failed to setup jpeg enc controls\n");
+			goto error;
+		}
+	} else {
+		v4l2_ctrl_handler_init(&ctx->ctrl_hdl, 0);
+	}
 	mtk_jpeg_set_default_params(ctx);
 	mutex_unlock(&jpeg->lock);
 	return 0;
@@ -938,6 +1258,7 @@ static int mtk_jpeg_release(struct file *file)
 
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
@@ -959,6 +1280,10 @@ static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
 	{ .id = "jpgdec" },
 };
 
+static struct clk_bulk_data mtk_jpeg_clocks[] = {
+	{ .id = "jpgenc" },
+};
+
 static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
 {
 	struct device_node *node;
@@ -1190,6 +1515,21 @@ static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 };
 
+static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
+	.clks = mtk_jpeg_clocks,
+	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
+	.formats = mtk_jpeg_enc_formats,
+	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
+	.qops = &mtk_jpeg_enc_qops,
+	.irq_handler = mtk_jpeg_enc_irq,
+	.hw_reset = mtk_jpeg_enc_reset,
+	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
+	.dev_name = "mtk-jpeg-enc",
+	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+};
+
 static const struct of_device_id mtk_jpeg_match[] = {
 	{
 		.compatible = "mediatek,mt8173-jpgdec",
@@ -1199,6 +1539,10 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mt2701-jpgdec",
 		.data = &mt8173_jpeg_drvdata,
 	},
+	{
+		.compatible = "mediatek,mtk-jpgenc",
+		.data = &mtk_jpeg_drvdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index d11d366a247e..68e634f02e00 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -3,6 +3,7 @@
  * Copyright (c) 2016 MediaTek Inc.
  * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
  *         Rick Chang <rick.chang@mediatek.com>
+ *         Xia Jiang <xia.jiang@mediatek.com>
  */
 
 #ifndef _MTK_JPEG_CORE_H
@@ -29,6 +30,8 @@
 
 #define MTK_JPEG_HW_TIMEOUT_MSEC 1000
 
+#define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
+
 /**
  * enum mtk_jpeg_ctx_state - states of the context state machine
  * @MTK_JPEG_INIT:		current state is initialized
@@ -104,6 +107,7 @@ struct mtk_jpeg_dev {
 /**
  * struct jpeg_fmt - driver's internal color format data
  * @fourcc:	the fourcc code, 0 if not applicable
+ * @hw_format:	hardware format value
  * @h_sample:	horizontal sample count of plane in 4 * 4 pixel image
  * @v_sample:	vertical sample count of plane in 4 * 4 pixel image
  * @colplanes:	number of color planes (1 for packed formats)
@@ -113,6 +117,7 @@ struct mtk_jpeg_dev {
  */
 struct mtk_jpeg_fmt {
 	u32	fourcc;
+	u32	hw_format;
 	int	h_sample[VIDEO_MAX_PLANES];
 	int	v_sample[VIDEO_MAX_PLANES];
 	int	colplanes;
@@ -125,10 +130,12 @@ struct mtk_jpeg_fmt {
  * mtk_jpeg_q_data - parameters of one queue
  * @fmt:	  driver-specific format of this queue
  * @pix_mp:	  multiplanar format
+ * @enc_crop_rect:	jpeg encoder crop information
  */
 struct mtk_jpeg_q_data {
 	struct mtk_jpeg_fmt	*fmt;
 	struct v4l2_pix_format_mplane pix_mp;
+	struct v4l2_rect enc_crop_rect;
 };
 
 /**
@@ -138,6 +145,10 @@ struct mtk_jpeg_q_data {
  * @cap_q:		destination (capture) queue queue information
  * @fh:			V4L2 file handle
  * @state:		state of the context
+ * @enable_exif:	enable exif mode of jpeg encoder
+ * @enc_quality:	jpeg encoder quality
+ * @restart_interval:	jpeg encoder restart interval
+ * @ctrl_hdl:		controls handler
  */
 struct mtk_jpeg_ctx {
 	struct mtk_jpeg_dev		*jpeg;
@@ -145,6 +156,10 @@ struct mtk_jpeg_ctx {
 	struct mtk_jpeg_q_data		cap_q;
 	struct v4l2_fh			fh;
 	enum mtk_jpeg_ctx_state		state;
+	bool enable_exif;
+	u8 enc_quality;
+	u8 restart_interval;
+	struct v4l2_ctrl_handler ctrl_hdl;
 };
 
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
new file mode 100644
index 000000000000..1cf037bf72dd
--- /dev/null
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Xia Jiang <xia.jiang@mediatek.com>
+ *
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mtk_jpeg_enc_hw.h"
+
+static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
+	{.quality_param = 34, .hardware_value = JPEG_ENC_QUALITY_Q34},
+	{.quality_param = 39, .hardware_value = JPEG_ENC_QUALITY_Q39},
+	{.quality_param = 48, .hardware_value = JPEG_ENC_QUALITY_Q48},
+	{.quality_param = 60, .hardware_value = JPEG_ENC_QUALITY_Q60},
+	{.quality_param = 64, .hardware_value = JPEG_ENC_QUALITY_Q64},
+	{.quality_param = 68, .hardware_value = JPEG_ENC_QUALITY_Q68},
+	{.quality_param = 74, .hardware_value = JPEG_ENC_QUALITY_Q74},
+	{.quality_param = 80, .hardware_value = JPEG_ENC_QUALITY_Q80},
+	{.quality_param = 82, .hardware_value = JPEG_ENC_QUALITY_Q82},
+	{.quality_param = 84, .hardware_value = JPEG_ENC_QUALITY_Q84},
+	{.quality_param = 87, .hardware_value = JPEG_ENC_QUALITY_Q87},
+	{.quality_param = 90, .hardware_value = JPEG_ENC_QUALITY_Q90},
+	{.quality_param = 92, .hardware_value = JPEG_ENC_QUALITY_Q92},
+	{.quality_param = 95, .hardware_value = JPEG_ENC_QUALITY_Q95},
+	{.quality_param = 97, .hardware_value = JPEG_ENC_QUALITY_Q97},
+};
+
+void mtk_jpeg_enc_reset(void __iomem *base)
+{
+	writel(0, base + JPEG_ENC_RSTB);
+	writel(JPEG_ENC_RESET_BIT, base + JPEG_ENC_RSTB);
+	writel(0, base + JPEG_ENC_CODEC_SEL);
+}
+
+u32 mtk_jpeg_enc_get_file_size(void __iomem *base)
+{
+	return readl(base + JPEG_ENC_DMA_ADDR0) -
+	       readl(base + JPEG_ENC_DST_ADDR0);
+}
+
+void mtk_jpeg_enc_start(void __iomem *base)
+{
+	u32 value;
+
+	value = readl(base + JPEG_ENC_CTRL);
+	value |= JPEG_ENC_CTRL_INT_EN_BIT | JPEG_ENC_CTRL_ENABLE_BIT;
+	writel(value, base + JPEG_ENC_CTRL);
+}
+
+void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
+			  struct vb2_buffer *src_buf)
+{
+	int i;
+	dma_addr_t dma_addr;
+
+	for (i = 0; i < src_buf->num_planes; i++) {
+		dma_addr = vb2_dma_contig_plane_dma_addr(src_buf, i) +
+			   src_buf->planes[i].data_offset;
+		if (!i)
+			writel(dma_addr, base + JPEG_ENC_SRC_LUMA_ADDR);
+		else
+			writel(dma_addr, base + JPEG_ENC_SRC_CHROMA_ADDR);
+	}
+}
+
+void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
+			  struct vb2_buffer *dst_buf)
+{
+	dma_addr_t dma_addr;
+	size_t size;
+	u32 dma_addr_offset;
+	u32 dma_addr_offsetmask;
+
+	dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	dma_addr_offset = ctx->enable_exif ? MTK_JPEG_MAX_EXIF_SIZE : 0;
+	dma_addr_offsetmask = dma_addr & JPEG_ENC_DST_ADDR_OFFSET_MASK;
+	size = vb2_plane_size(dst_buf, 0);
+
+	writel(dma_addr_offset & ~0xf, base + JPEG_ENC_OFFSET_ADDR);
+	writel(dma_addr_offsetmask & 0xf, base + JPEG_ENC_BYTE_OFFSET_MASK);
+	writel(dma_addr & ~0xf, base + JPEG_ENC_DST_ADDR0);
+	writel((dma_addr + size) & ~0xf, base + JPEG_ENC_STALL_ADDR0);
+}
+
+void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
+{
+	u32 value;
+	u32 width = ctx->out_q.enc_crop_rect.width;
+	u32 height = ctx->out_q.enc_crop_rect.height;
+	u32 enc_format = ctx->out_q.fmt->fourcc;
+	u32 bytesperline = ctx->out_q.pix_mp.plane_fmt[0].bytesperline;
+	u32 blk_num;
+	u32 img_stride;
+	u32 mem_stride;
+	u32 i, enc_quality;
+
+	value = width << 16 | height;
+	writel(value, base + JPEG_ENC_IMG_SIZE);
+
+	if (enc_format == V4L2_PIX_FMT_NV12M ||
+	    enc_format == V4L2_PIX_FMT_NV21M)
+	    /*
+	     * Total 8 x 8 block number of luma and chroma.
+	     * The number of blocks is counted from 0.
+	     */
+		blk_num = DIV_ROUND_UP(width, 16) *
+			  DIV_ROUND_UP(height, 16) * 6 - 1;
+	else
+		blk_num = DIV_ROUND_UP(width, 16) *
+			  DIV_ROUND_UP(height, 8) * 4 - 1;
+	writel(blk_num, base + JPEG_ENC_BLK_NUM);
+
+	if (enc_format == V4L2_PIX_FMT_NV12M ||
+	    enc_format == V4L2_PIX_FMT_NV21M) {
+		/* 4:2:0 */
+		img_stride = round_up(width, 16);
+		mem_stride = bytesperline;
+	} else {
+		/* 4:2:2 */
+		img_stride = round_up(width * 2, 32);
+		mem_stride = img_stride;
+	}
+	writel(img_stride, base + JPEG_ENC_IMG_STRIDE);
+	writel(mem_stride, base + JPEG_ENC_STRIDE);
+
+	enc_quality = mtk_jpeg_enc_quality[0].hardware_value;
+	for (i = 0; i < ARRAY_SIZE(mtk_jpeg_enc_quality); i++) {
+		if (ctx->enc_quality <= mtk_jpeg_enc_quality[i].quality_param) {
+			enc_quality = mtk_jpeg_enc_quality[i].hardware_value;
+			break;
+		}
+	}
+	writel(enc_quality, base + JPEG_ENC_QUALITY);
+
+	value = readl(base + JPEG_ENC_CTRL);
+	value &= ~JPEG_ENC_CTRL_YUV_FORMAT_MASK;
+	value |= (ctx->out_q.fmt->hw_format & 3) << 3;
+	if (ctx->enable_exif)
+		value |= JPEG_ENC_CTRL_FILE_FORMAT_BIT;
+	else
+		value &= ~JPEG_ENC_CTRL_FILE_FORMAT_BIT;
+	if (ctx->restart_interval)
+		value |= JPEG_ENC_CTRL_RESTART_EN_BIT;
+	else
+		value &= ~JPEG_ENC_CTRL_RESTART_EN_BIT;
+	writel(value, base + JPEG_ENC_CTRL);
+
+	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
+}
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
new file mode 100644
index 000000000000..61c60e4e58ea
--- /dev/null
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Xia Jiang <xia.jiang@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_JPEG_ENC_HW_H
+#define _MTK_JPEG_ENC_HW_H
+
+#include <media/videobuf2-core.h>
+
+#include "mtk_jpeg_core.h"
+
+#define JPEG_ENC_INT_STATUS_DONE	BIT(0)
+#define JPEG_ENC_INT_STATUS_MASK_ALLIRQ	0x13
+
+#define JPEG_ENC_DST_ADDR_OFFSET_MASK	GENMASK(3, 0)
+
+#define JPEG_ENC_CTRL_YUV_FORMAT_MASK	0x18
+#define JPEG_ENC_CTRL_RESTART_EN_BIT	BIT(10)
+#define JPEG_ENC_CTRL_FILE_FORMAT_BIT	BIT(5)
+#define JPEG_ENC_CTRL_INT_EN_BIT	BIT(2)
+#define JPEG_ENC_CTRL_ENABLE_BIT	BIT(0)
+#define JPEG_ENC_RESET_BIT		BIT(0)
+
+#define JPEG_ENC_YUV_FORMAT_YUYV	0
+#define JPEG_ENC_YUV_FORMAT_YVYU	1
+#define JPEG_ENC_YUV_FORMAT_NV12	2
+#define JEPG_ENC_YUV_FORMAT_NV21	3
+
+#define JPEG_ENC_QUALITY_Q60		0x0
+#define JPEG_ENC_QUALITY_Q80		0x1
+#define JPEG_ENC_QUALITY_Q90		0x2
+#define JPEG_ENC_QUALITY_Q95		0x3
+#define JPEG_ENC_QUALITY_Q39		0x4
+#define JPEG_ENC_QUALITY_Q68		0x5
+#define JPEG_ENC_QUALITY_Q84		0x6
+#define JPEG_ENC_QUALITY_Q92		0x7
+#define JPEG_ENC_QUALITY_Q48		0x8
+#define JPEG_ENC_QUALITY_Q74		0xa
+#define JPEG_ENC_QUALITY_Q87		0xb
+#define JPEG_ENC_QUALITY_Q34		0xc
+#define JPEG_ENC_QUALITY_Q64		0xe
+#define JPEG_ENC_QUALITY_Q82		0xf
+#define JPEG_ENC_QUALITY_Q97		0x10
+
+#define JPEG_ENC_RSTB			0x100
+#define JPEG_ENC_CTRL			0x104
+#define JPEG_ENC_QUALITY		0x108
+#define JPEG_ENC_BLK_NUM		0x10C
+#define JPEG_ENC_BLK_CNT		0x110
+#define JPEG_ENC_INT_STS		0x11c
+#define JPEG_ENC_DST_ADDR0		0x120
+#define JPEG_ENC_DMA_ADDR0		0x124
+#define JPEG_ENC_STALL_ADDR0		0x128
+#define JPEG_ENC_OFFSET_ADDR		0x138
+#define JPEG_ENC_RST_MCU_NUM		0x150
+#define JPEG_ENC_IMG_SIZE		0x154
+#define JPEG_ENC_DEBUG_INFO0		0x160
+#define JPEG_ENC_DEBUG_INFO1		0x164
+#define JPEG_ENC_TOTAL_CYCLE		0x168
+#define JPEG_ENC_BYTE_OFFSET_MASK	0x16c
+#define JPEG_ENC_SRC_LUMA_ADDR		0x170
+#define JPEG_ENC_SRC_CHROMA_ADDR	0x174
+#define JPEG_ENC_STRIDE			0x178
+#define JPEG_ENC_IMG_STRIDE		0x17c
+#define JPEG_ENC_DCM_CTRL		0x300
+#define JPEG_ENC_CODEC_SEL		0x314
+#define JPEG_ENC_ULTRA_THRES		0x318
+
+/**
+ * struct mtk_jpeg_enc_qlt - JPEG encoder quality data
+ * @quality_param:	quality value
+ * @hardware_value:	hardware value of quality
+ */
+struct mtk_jpeg_enc_qlt {
+	u8	quality_param;
+	u8	hardware_value;
+};
+
+void mtk_jpeg_enc_reset(void __iomem *base);
+u32 mtk_jpeg_enc_get_file_size(void __iomem *base);
+void mtk_jpeg_enc_start(void __iomem *enc_reg_base);
+void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
+			  struct vb2_buffer *src_buf);
+void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
+			  struct vb2_buffer *dst_buf);
+void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base);
+
+#endif /* _MTK_JPEG_ENC_HW_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
