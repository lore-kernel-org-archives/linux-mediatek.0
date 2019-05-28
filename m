From: Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [RFCv1 05/12] media: mtk-vcodec: support single-buffer frames
Date: Tue, 28 May 2019 14:56:28 +0900
Message-ID: <20190528055635.12109-6-acourbot@chromium.org>
References: <20190528055635.12109-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190528055635.12109-1-acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Yunfei Dong <yunfei.dong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Yunfei Dong <yunfei.dong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

MT8183 will use a multi-planar format backed by a single buffer. Adapt
the existing code to be able to handle such frames instead of assuming
each frame is backed by two buffers.

Signed-off-by: Yunfei Dong <yunfei.dong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Co-developed-by: Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
[acourbot: refactor, cleanup and split]
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 2175883e22d4..2fdf23ce8ac4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -130,8 +130,9 @@ static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
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
@@ -402,7 +403,8 @@ static void mtk_vdec_worker(struct work_struct *work)
 		vdec_if_decode(ctx, NULL, NULL, &res_chg);
 		clean_display_buffer(ctx);
 		vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 0, 0);
-		vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 1, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 1, 0);
 		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
 		v4l2_m2m_buf_done(&dst_buf_info->vb, VB2_BUF_STATE_DONE);
 		clean_free_buffer(ctx);
@@ -1333,7 +1335,8 @@ static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 
 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
-		vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
 		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 	}
 
-- 
2.22.0.rc1.257.g3120a18244-goog
