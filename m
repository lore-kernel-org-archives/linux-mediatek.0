From: Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 01/13] media: mtk-vcodec: vdec: fix incorrect pointer dereference
Date: Fri,  6 Sep 2019 20:55:01 +0900
Message-ID: <20190906115513.159705-2-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

mtk_q_data::fmt is actually a pointer and must be dereferenced as such.
This went under the radar because mtk_v4l2_debug() evaluates to nothing
unless DEBUG is defined.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: split into its own commit]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 26a55c3e807e..653f111532ab 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -284,7 +284,7 @@ static void mtk_vdec_update_fmt(struct mtk_vcodec_ctx *ctx,
 		fmt = &mtk_video_formats[k];
 		if (fmt->fourcc == pixelformat) {
 			mtk_v4l2_debug(1, "Update cap fourcc(%d -> %d)",
-				dst_q_data->fmt.fourcc, pixelformat);
+				dst_q_data->fmt->fourcc, pixelformat);
 			dst_q_data->fmt = fmt;
 			return;
 		}
-- 
2.23.0.187.g17f5b7556c-goog
