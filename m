From: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] [media] mtk-vcodec: fix default OUTPUT buffer size
Date: Wed, 13 Jul 2016 16:05:23 +0800
Message-ID: <1468397123-9808-1-git-send-email-tiffany.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

When calculate OUTPUT buffer size in vidioc_try_fmt, it will
add more size hw need in each plane.
But in mtk_vcodec_enc_set_default_params, it do not add
same size in each plane.
This makes v4l2-compliance test fail.
This patch fix the issue.

Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 907a6d1..3ed3f2d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -328,10 +328,11 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct mtk_video_fmt *fmt)
 			pix_fmt_mp->height += 32;
 
 		mtk_v4l2_debug(0,
-			"before resize width=%d, height=%d, after resize width=%d, height=%d, sizeimage=%d",
+			"before resize width=%d, height=%d, after resize width=%d, height=%d, sizeimage=%d %d",
 			tmp_w, tmp_h, pix_fmt_mp->width,
 			pix_fmt_mp->height,
-			pix_fmt_mp->width * pix_fmt_mp->height);
+			pix_fmt_mp->plane_fmt[0].sizeimage,
+			pix_fmt_mp->plane_fmt[1].sizeimage);
 
 		pix_fmt_mp->num_planes = fmt->num_planes;
 		pix_fmt_mp->plane_fmt[0].sizeimage =
@@ -1166,9 +1167,13 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
 		(q_data->coded_height + 32) <= MTK_VENC_MAX_H)
 		q_data->coded_height += 32;
 
-	q_data->sizeimage[0] = q_data->coded_width * q_data->coded_height;
+	q_data->sizeimage[0] =
+		q_data->coded_width * q_data->coded_height+
+		((ALIGN(q_data->coded_width, 16) * 2) * 16);
 	q_data->bytesperline[0] = q_data->coded_width;
-	q_data->sizeimage[1] = q_data->sizeimage[0] / 2;
+	q_data->sizeimage[1] =
+		(q_data->coded_width * q_data->coded_height) / 2 +
+		(ALIGN(q_data->coded_width, 16) * 16);
 	q_data->bytesperline[1] = q_data->coded_width;
 
 	q_data = &ctx->q_data[MTK_Q_DATA_DST];
-- 
1.7.9.5
