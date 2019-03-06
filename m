From: Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH] media: mtk-vcodec: fix access to vb2_v4l2_buffer struct
Date: Wed,  6 Mar 2019 15:15:02 +0900
Message-ID: <20190306061502.126904-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

Commit 0650a91499e0 ("media: mtk-vcodec: Correct return type for mem2mem
buffer helpers") fixed the return types for mem2mem buffer helper
functions, but omitted two occurrences that are accessed in the
mtk_v4l2_debug() macro. These only trigger compiler errors when DEBUG is
defined.

Fixes: 0650a91499e0 ("media: mtk-vcodec: Correct return type for mem2mem buffer helpers")
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index d022c65bb34c..a85c7cc8328e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -1158,7 +1158,7 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
 	src_mem.size = (size_t)src_buf->planes[0].bytesused;
 	mtk_v4l2_debug(2,
 			"[%d] buf id=%d va=%p dma=%pad size=%zx",
-			ctx->id, src_buf->index,
+			ctx->id, src_buf->vb2_buf.index,
 			src_mem.va, &src_mem.dma_addr,
 			src_mem.size);
 
@@ -1182,7 +1182,7 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
 		}
 		mtk_v4l2_debug(ret ? 0 : 1,
 			       "[%d] vdec_if_decode() src_buf=%d, size=%zu, fail=%d, res_chg=%d",
-			       ctx->id, src_buf->index,
+			       ctx->id, src_buf->vb2_buf.index,
 			       src_mem.size, ret, res_chg);
 		return;
 	}
-- 
2.21.0.352.gf09ad66450-goog
