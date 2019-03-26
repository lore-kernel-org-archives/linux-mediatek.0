From: Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH] media: mtk-vcodec: remove ready_to_display
Date: Tue, 26 Mar 2019 16:44:46 +0900
Message-ID: <20190326074446.123945-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

This member is never read throughout the code, so remove it.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 5 -----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index e20b340855e7..710dcebb42b3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -133,8 +133,6 @@ static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
 		vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 1,
 					ctx->picinfo.c_bs_sz);
 
-		dstbuf->ready_to_display = true;
-
 		mtk_v4l2_debug(2,
 				"[%d]status=%x queue id=%d to done_list %d",
 				ctx->id, disp_frame_buffer->status,
@@ -1122,11 +1120,9 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
 			v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
 			buf->queued_in_vb2 = true;
 			buf->queued_in_v4l2 = true;
-			buf->ready_to_display = false;
 		} else {
 			buf->queued_in_vb2 = false;
 			buf->queued_in_v4l2 = true;
-			buf->ready_to_display = false;
 		}
 		mutex_unlock(&ctx->lock);
 		return;
@@ -1253,7 +1249,6 @@ static int vb2ops_vdec_buf_init(struct vb2_buffer *vb)
 
 	if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		buf->used = false;
-		buf->ready_to_display = false;
 		buf->queued_in_v4l2 = false;
 	} else {
 		buf->lastframe = false;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index dc4fc1df63c5..e4984edec4f8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -45,7 +45,6 @@ struct vdec_fb {
  * @list:	link list
  * @used:	Capture buffer contain decoded frame data and keep in
  *			codec data structure
- * @ready_to_display:	Capture buffer not display yet
  * @queued_in_vb2:	Capture buffer is queue in vb2
  * @queued_in_v4l2:	Capture buffer is in v4l2 driver, but not in vb2
  *			queue yet
@@ -60,7 +59,6 @@ struct mtk_video_dec_buf {
 	struct list_head	list;
 
 	bool	used;
-	bool	ready_to_display;
 	bool	queued_in_vb2;
 	bool	queued_in_v4l2;
 	bool	lastframe;
-- 
2.21.0.392.gf8f6787159e-goog
