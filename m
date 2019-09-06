From: Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 03/13] media: mtk-vcodec: vdec: clean up vidioc_vdec_s_fmt a bit
Date: Fri,  6 Sep 2019 20:55:03 +0900
Message-ID: <20190906115513.159705-4-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

Check for a potentially NULL pointer that was overlooked and use shorter
accessors to the same data. While we are at it, sprinkle a few comments.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 653f111532ab..858727824889 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -841,12 +841,20 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		return -EINVAL;
 
 	pix_mp = &f->fmt.pix_mp;
+	/*
+	 * Setting OUTPUT format after OUTPUT buffers are allocated is invalid
+	 * if using the stateful API.
+	 */
 	if ((f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
 		mtk_v4l2_err("out_q_ctx buffers already requested");
 		ret = -EBUSY;
 	}
 
+	/*
+	 * Setting CAPTURE format after CAPTURE buffers are allocated is
+	 * invalid.
+	 */
 	if ((f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->cap_q_ctx.q)) {
 		mtk_v4l2_err("cap_q_ctx buffers already requested");
@@ -865,6 +873,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 			fmt = mtk_vdec_find_format(f);
 		}
 	}
+	if (fmt == NULL)
+		return -EINVAL;
 
 	q_data->fmt = fmt;
 	vidioc_try_fmt(f, q_data->fmt);
@@ -873,10 +883,10 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		q_data->coded_width = pix_mp->width;
 		q_data->coded_height = pix_mp->height;
 
-		ctx->colorspace = f->fmt.pix_mp.colorspace;
-		ctx->ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
-		ctx->quantization = f->fmt.pix_mp.quantization;
-		ctx->xfer_func = f->fmt.pix_mp.xfer_func;
+		ctx->colorspace = pix_mp->colorspace;
+		ctx->ycbcr_enc = pix_mp->ycbcr_enc;
+		ctx->quantization = pix_mp->quantization;
+		ctx->xfer_func = pix_mp->xfer_func;
 
 		if (ctx->state == MTK_STATE_FREE) {
 			ret = vdec_if_init(ctx, q_data->fmt->fourcc);
-- 
2.23.0.187.g17f5b7556c-goog
