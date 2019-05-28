From: Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 02/12] media: mtk-vcodec: remove unneeded proxy functions
Date: Tue, 28 May 2019 14:56:25 +0900
Message-ID: <20190528055635.12109-3-acourbot@chromium.org>
References: <20190528055635.12109-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

We were getting the codec interface through a proxy function that does
not bring anything compared to just accessing the interface definition
directly, so just do that. Also make the decoder interfaces const.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c    |  9 +--------
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c |  9 +--------
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c |  9 +--------
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c      | 12 ++++++------
 .../media/platform/mtk-vcodec/venc/venc_h264_if.c    |  9 +--------
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c |  9 +--------
 drivers/media/platform/mtk-vcodec/venc_drv_if.c      |  8 ++++----
 7 files changed, 15 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index 2b29e004575d..185d8e7bdc87 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -493,16 +493,9 @@ static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
 	return 0;
 }
 
-static struct vdec_common_if vdec_h264_if = {
+const struct vdec_common_if vdec_h264_if = {
 	.init		= vdec_h264_init,
 	.decode		= vdec_h264_decode,
 	.get_param	= vdec_h264_get_param,
 	.deinit		= vdec_h264_deinit,
 };
-
-struct vdec_common_if *get_h264_dec_comm_if(void);
-
-struct vdec_common_if *get_h264_dec_comm_if(void)
-{
-	return &vdec_h264_if;
-}
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
index a13253242e90..28475b8d27fe 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
@@ -618,16 +618,9 @@ static void vdec_vp8_deinit(void *h_vdec)
 	kfree(inst);
 }
 
-static struct vdec_common_if vdec_vp8_if = {
+const struct vdec_common_if vdec_vp8_if = {
 	.init		= vdec_vp8_init,
 	.decode		= vdec_vp8_decode,
 	.get_param	= vdec_vp8_get_param,
 	.deinit		= vdec_vp8_deinit,
 };
-
-struct vdec_common_if *get_vp8_dec_comm_if(void);
-
-struct vdec_common_if *get_vp8_dec_comm_if(void)
-{
-	return &vdec_vp8_if;
-}
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 65b88a2bef4c..f4af69c543ba 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -1008,16 +1008,9 @@ static int vdec_vp9_get_param(void *h_vdec, enum vdec_get_param_type type,
 	return ret;
 }
 
-static struct vdec_common_if vdec_vp9_if = {
+const struct vdec_common_if vdec_vp9_if = {
 	.init		= vdec_vp9_init,
 	.decode		= vdec_vp9_decode,
 	.get_param	= vdec_vp9_get_param,
 	.deinit		= vdec_vp9_deinit,
 };
-
-struct vdec_common_if *get_vp9_dec_comm_if(void);
-
-struct vdec_common_if *get_vp9_dec_comm_if(void)
-{
-	return &vdec_vp9_if;
-}
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index 1e3778738f3b..dfe63bb39dbb 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -23,9 +23,9 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vpu.h"
 
-const struct vdec_common_if *get_h264_dec_comm_if(void);
-const struct vdec_common_if *get_vp8_dec_comm_if(void);
-const struct vdec_common_if *get_vp9_dec_comm_if(void);
+extern const struct vdec_common_if vdec_h264_if;
+extern const struct vdec_common_if vdec_vp8_if;
+extern const struct vdec_common_if vdec_vp9_if;
 
 int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 {
@@ -33,13 +33,13 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 
 	switch (fourcc) {
 	case V4L2_PIX_FMT_H264:
-		ctx->dec_if = get_h264_dec_comm_if();
+		ctx->dec_if = &vdec_h264_if;
 		break;
 	case V4L2_PIX_FMT_VP8:
-		ctx->dec_if = get_vp8_dec_comm_if();
+		ctx->dec_if = &vdec_vp8_if;
 		break;
 	case V4L2_PIX_FMT_VP9:
-		ctx->dec_if = get_vp9_dec_comm_if();
+		ctx->dec_if = &vdec_vp9_if;
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index b6feb786bebf..eb015ce0fd3e 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -664,16 +664,9 @@ static int h264_enc_deinit(void *handle)
 	return ret;
 }
 
-static const struct venc_common_if venc_h264_if = {
+const struct venc_common_if venc_h264_if = {
 	.init = h264_enc_init,
 	.encode = h264_enc_encode,
 	.set_param = h264_enc_set_param,
 	.deinit = h264_enc_deinit,
 };
-
-const struct venc_common_if *get_h264_enc_comm_if(void);
-
-const struct venc_common_if *get_h264_enc_comm_if(void)
-{
-	return &venc_h264_if;
-}
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 8656d89369bc..ad8008c865db 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -469,16 +469,9 @@ static int vp8_enc_deinit(void *handle)
 	return ret;
 }
 
-static const struct venc_common_if venc_vp8_if = {
+const struct venc_common_if venc_vp8_if = {
 	.init = vp8_enc_init,
 	.encode = vp8_enc_encode,
 	.set_param = vp8_enc_set_param,
 	.deinit = vp8_enc_deinit,
 };
-
-const struct venc_common_if *get_vp8_enc_comm_if(void);
-
-const struct venc_common_if *get_vp8_enc_comm_if(void)
-{
-	return &venc_vp8_if;
-}
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index 4b04652be6de..94bb530f7d2d 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -26,8 +26,8 @@
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vpu.h"
 
-const struct venc_common_if *get_h264_enc_comm_if(void);
-const struct venc_common_if *get_vp8_enc_comm_if(void);
+extern const struct venc_common_if venc_h264_if;
+extern const struct venc_common_if venc_vp8_if;
 
 int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 {
@@ -35,10 +35,10 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 
 	switch (fourcc) {
 	case V4L2_PIX_FMT_VP8:
-		ctx->enc_if = get_vp8_enc_comm_if();
+		ctx->enc_if = &venc_vp8_if;
 		break;
 	case V4L2_PIX_FMT_H264:
-		ctx->enc_if = get_h264_enc_comm_if();
+		ctx->enc_if = &venc_h264_if;
 		break;
 	default:
 		return -EINVAL;
-- 
2.22.0.rc1.257.g3120a18244-goog
