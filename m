From: Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 5/5] media: mtk-vcodec: support single-buffer frames
Date: Tue,  4 Jun 2019 18:37:37 +0900
Message-ID: <20190604093737.172599-6-acourbot@chromium.org>
References: <20190604093737.172599-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604093737.172599-1-acourbot@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

MT8183 will use a multi-planar format backed by a single buffer. Adapt
the existing code to be able to handle such frames instead of assuming
each frame is backed by two buffers.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
[acourbot: refactor, cleanup and split]
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 131a8117ece2..6b99b877a3b4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -117,8 +117,9 @@ static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
 	if (dstbuf->used) {
 		vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 0,
 					ctx->picinfo.fb_sz[0]);
-		vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 1,
-					ctx->picinfo.fb_sz[1]);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 1,
+						ctx->picinfo.fb_sz[1]);
 
 		mtk_v4l2_debug(2,
 				"[%d]status=%x queue id=%d to done_list %d",
@@ -389,7 +390,8 @@ static void mtk_vdec_worker(struct work_struct *work)
 		vdec_if_decode(ctx, NULL, NULL, &res_chg);
 		clean_display_buffer(ctx);
 		vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 0, 0);
-		vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 1, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 1, 0);
 		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
 		v4l2_m2m_buf_done(&dst_buf_info->vb, VB2_BUF_STATE_DONE);
 		clean_free_buffer(ctx);
@@ -1320,7 +1322,8 @@ static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 
 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
-		vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
 		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 	}
 
-- 
2.22.0.rc1.311.g5d7573a151-goog
