Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F03C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 08:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJmKPf79xrWLo6hNJrnVxk2UkyfQsWBN1iQKAjDoRl8=; b=sjVD54lqF6Bq1z
	aYRBpxVQOypzySV3zuVnSxey7MwdtAo1mT0iEcs9pTzisiUv1FMQlCfoSP6cvCz9AGiyB7J+Zuwm4
	nxFsC11/4qOodw+py2DxXJWhM65P3T95LDVf+Lg98CS7tcu7eyl0aypDBpWSo0Nl7MRMNHH6kWAwY
	7uaMBuhbOSOgCWqdvRs/B9bhv5Eb5jSVvNck5meVw4iAp9fyZkF2BBw2HUUsQYzs0vjm6Kcla3BSx
	7U6c6n5gQVES8nFlMGLfsVrDK4cf8YU3sww6TtwSIKge0EeS7JzhVyvSxk6NyG84U9txr+9hZznIv
	edY3I/tUbjAED+IwhtDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qIP-009zpn-AI; Mon, 10 Jan 2022 08:44:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6q9n-009uwU-Qm; Mon, 10 Jan 2022 08:36:02 +0000
X-UUID: 56bdc1fe81b44b948f0c3656c2f0904f-20220110
X-UUID: 56bdc1fe81b44b948f0c3656c2f0904f-20220110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1767144917; Mon, 10 Jan 2022 01:35:56 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 00:34:58 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 10 Jan 2022 16:34:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Jan 2022 16:34:54 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Steve Cho <stevecho@chromium.org>, 
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,
 07/15] media: mtk-vcodec: Refactor supported vdec formats and
 framesizes
Date: Mon, 10 Jan 2022 16:34:34 +0800
Message-ID: <20220110083442.32604-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110083442.32604-1-yunfei.dong@mediatek.com>
References: <20220110083442.32604-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_003559_915156_C2FC8A95 
X-CRM114-Status: GOOD (  23.31  )
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

Supported output and capture format types for mt8192 are different
with mt8183. Needs to get format types according to decoder capability.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   8 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  13 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 117 +++++++++++++-----
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  13 +-
 4 files changed, 107 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 65a224d788bf..519f2b9d9b5b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -26,7 +26,7 @@ mtk_vdec_find_format(struct v4l2_format *f,
 	const struct mtk_video_fmt *fmt;
 	unsigned int k;
 
-	for (k = 0; k < dec_pdata->num_formats; k++) {
+	for (k = 0; k < *dec_pdata->num_formats; k++) {
 		fmt = &dec_pdata->vdec_formats[k];
 		if (fmt->fourcc == f->fmt.pix_mp.pixelformat)
 			return fmt;
@@ -525,7 +525,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	for (i = 0; i < dec_pdata->num_framesizes; ++i) {
+	for (i = 0; i < *dec_pdata->num_framesizes; ++i) {
 		if (fsize->pixel_format != dec_pdata->vdec_framesizes[i].fourcc)
 			continue;
 
@@ -564,7 +564,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 	const struct mtk_video_fmt *fmt;
 	int i, j = 0;
 
-	for (i = 0; i < dec_pdata->num_formats; i++) {
+	for (i = 0; i < *dec_pdata->num_formats; i++) {
 		if (output_queue &&
 		    dec_pdata->vdec_formats[i].type != MTK_FMT_DEC)
 			continue;
@@ -577,7 +577,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 		++j;
 	}
 
-	if (i == dec_pdata->num_formats)
+	if (i == *dec_pdata->num_formats)
 		return -EINVAL;
 
 	fmt = &dec_pdata->vdec_formats[i];
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index 7966c132be8f..3f33beb9c551 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -37,7 +37,9 @@ static const struct mtk_video_fmt mtk_video_formats[] = {
 	},
 };
 
-#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
+static const unsigned int num_supported_formats =
+	ARRAY_SIZE(mtk_video_formats);
+
 #define DEFAULT_OUT_FMT_IDX 0
 #define DEFAULT_CAP_FMT_IDX 3
 
@@ -59,7 +61,8 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
 	},
 };
 
-#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
+static const unsigned int num_supported_framesize =
+	ARRAY_SIZE(mtk_vdec_framesizes);
 
 /*
  * This function tries to clean all display buffers, the buffers will return
@@ -235,7 +238,7 @@ static void mtk_vdec_update_fmt(struct mtk_vcodec_ctx *ctx,
 	unsigned int k;
 
 	dst_q_data = &ctx->q_data[MTK_Q_DATA_DST];
-	for (k = 0; k < NUM_FORMATS; k++) {
+	for (k = 0; k < num_supported_formats; k++) {
 		fmt = &mtk_video_formats[k];
 		if (fmt->fourcc == pixelformat) {
 			mtk_v4l2_debug(1, "Update cap fourcc(%d -> %d)",
@@ -617,11 +620,11 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = NUM_FORMATS,
+	.num_formats = &num_supported_formats,
 	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
 	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.num_framesizes = &num_supported_framesize,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = false,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index f3036c3f223b..01bb96f3b30e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -81,33 +81,23 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 
 #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
 
-static const struct mtk_video_fmt mtk_video_formats[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_H264_SLICE,
-		.type = MTK_FMT_DEC,
-		.num_planes = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_MM21,
-		.type = MTK_FMT_FRAME,
-		.num_planes = 2,
-	},
+static struct mtk_video_fmt mtk_video_formats[2];
+static struct mtk_codec_framesizes mtk_vdec_framesizes[1];
+
+static struct mtk_video_fmt default_out_format;
+static struct mtk_video_fmt default_cap_format;
+static unsigned int num_formats = 0;
+static unsigned int num_framesizes = 0;
+
+static struct v4l2_frmsize_stepwise stepwise_fhd = {
+	.min_width = MTK_VDEC_MIN_W,
+	.max_width = MTK_VDEC_MAX_W,
+	.step_width = 16,
+	.min_height = MTK_VDEC_MIN_H,
+	.max_height = MTK_VDEC_MAX_H,
+	.step_height = 16
 };
 
-#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
-#define DEFAULT_OUT_FMT_IDX    0
-#define DEFAULT_CAP_FMT_IDX    1
-
-static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
-	{
-		.fourcc	= V4L2_PIX_FMT_H264_SLICE,
-		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
-				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
-	},
-};
-
-#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
-
 static void mtk_vdec_stateless_out_to_done(struct mtk_vcodec_ctx *ctx,
 					   struct mtk_vcodec_mem *bs, int error)
 {
@@ -352,6 +342,63 @@ const struct media_device_ops mtk_vcodec_media_ops = {
 	.req_queue	= v4l2_m2m_request_queue,
 };
 
+static void mtk_vcodec_add_formats(unsigned int fourcc,
+	struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_vcodec_dev *dev = ctx->dev;
+	const struct mtk_vcodec_dec_pdata *pdata = dev->vdec_pdata;
+	int count_formats = *pdata->num_formats;
+	int count_framesizes = *pdata->num_framesizes;
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_H264_SLICE:
+		mtk_video_formats[count_formats].fourcc = fourcc;
+		mtk_video_formats[count_formats].type = MTK_FMT_DEC;
+		mtk_video_formats[count_formats].num_planes = 1;
+
+		mtk_vdec_framesizes[count_framesizes].fourcc = fourcc;
+		mtk_vdec_framesizes[count_framesizes].stepwise = stepwise_fhd;
+		num_framesizes++;
+		break;
+	case V4L2_PIX_FMT_MM21:
+		mtk_video_formats[count_formats].fourcc = fourcc;
+		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
+		mtk_video_formats[count_formats].num_planes = 2;
+		break;
+	default:
+		mtk_v4l2_err("Can not add unsupported format type");
+		return;
+	}
+
+	num_formats++;
+	mtk_v4l2_debug(3, "num_formats: %d num_frames:%d dec_capability: 0x%x",
+		*(pdata->num_formats), *(pdata->num_framesizes),
+		ctx->dev->dec_capability);
+}
+
+static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx *ctx)
+{
+	int cap_format_count = 0, out_format_count = 0;
+
+	if (num_formats && num_framesizes)
+		return;
+
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
+		cap_format_count++;
+	}
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_H264_SLICE) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_H264_SLICE, ctx);
+		out_format_count++;
+	}
+
+	if (cap_format_count)
+		default_cap_format = mtk_video_formats[cap_format_count - 1];
+	if (out_format_count)
+		default_out_format =
+			mtk_video_formats[cap_format_count + out_format_count - 1];
+}
+
 static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
 {
 	struct vb2_queue *src_vq;
@@ -361,6 +408,10 @@ static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
 
 	if (ctx->dev->vdec_pdata->hw_arch != MTK_VDEC_PURE_SINGLE_CORE)
 		v4l2_m2m_set_dst_buffered(ctx->m2m_ctx, 1);
+	else
+		ctx->dev->dec_capability |=
+			MTK_VDEC_FORMAT_H264_SLICE | MTK_VDEC_FORMAT_MM21;
+	mtk_vcodec_get_supported_formats(ctx);
 
 	/* Support request api for output plane */
 	src_vq->supports_requests = true;
@@ -395,11 +446,11 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = NUM_FORMATS,
-	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
-	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.num_framesizes = &num_framesizes,
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
@@ -415,11 +466,11 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
 	.vdec_formats = mtk_video_formats,
-	.num_formats = NUM_FORMATS,
-	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
-	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
+	.num_formats = &num_formats,
+	.default_out_fmt = &default_out_format,
+	.default_cap_fmt = &default_cap_format,
 	.vdec_framesizes = mtk_vdec_framesizes,
-	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.num_framesizes = &num_framesizes,
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 009f9124a57d..cdc0a53eee4e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -347,6 +347,15 @@ enum mtk_vdec_hw_arch {
 	MTK_VDEC_LAT_SINGLE_CORE,
 };
 
+/**
+ * struct mtk_vdec_format_types - Structure used to get supported
+ *		  format types according to decoder capability
+ */
+enum mtk_vdec_format_types {
+	MTK_VDEC_FORMAT_MM21 = 0x20,
+	MTK_VDEC_FORMAT_H264_SLICE = 0x100,
+};
+
 /**
  * struct mtk_vcodec_dec_pdata - compatible data for each IC
  * @init_vdec_params: init vdec params
@@ -382,12 +391,12 @@ struct mtk_vcodec_dec_pdata {
 	struct vb2_ops *vdec_vb2_ops;
 
 	const struct mtk_video_fmt *vdec_formats;
-	const int num_formats;
+	const int *num_formats;
 	const struct mtk_video_fmt *default_out_fmt;
 	const struct mtk_video_fmt *default_cap_fmt;
 
 	const struct mtk_codec_framesizes *vdec_framesizes;
-	const int num_framesizes;
+	const int *num_framesizes;
 
 	enum mtk_vdec_hw_arch hw_arch;
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
