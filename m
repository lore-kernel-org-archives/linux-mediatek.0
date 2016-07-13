From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH v2] [media] mtk-vcodec: fix more type mismatches
Date: Wed, 13 Jul 2016 10:47:40 +0200
Message-ID: <20160713084916.2765651-1-arnd@arndb.de>
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
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, PoChun Lin <pochun.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

The newly added mtk-vcodec driver produces a number of warnings in an ARM
allmodconfig build, mainly since it assumes that dma_addr_t is 32-bit wide:

mtk-vcodec/venc/venc_vp8_if.c: In function 'vp8_enc_alloc_work_buf':
mtk-vcodec/venc/venc_vp8_if.c:212:191: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
mtk-vcodec/venc/venc_h264_if.c: In function 'h264_enc_alloc_work_buf':
mtk-vcodec/venc/venc_h264_if.c:297:190: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]

This rearranges the format strings and type casts to what they should have been
in order to avoid the warnings. e0f80d8d62f5 ("[media] mtk-vcodec: fix two compiler
warnings") fixed some of the problems that were introduced at the same time, but
missed two others.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c | 4 ++--
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index f4e18bb44cb9..9a600525b3c1 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -295,9 +295,9 @@ static int h264_enc_alloc_work_buf(struct venc_h264_inst *inst)
 		wb[i].iova = inst->work_bufs[i].dma_addr;
 
 		mtk_vcodec_debug(inst,
-				 "work_buf[%d] va=0x%p iova=0x%p size=%zu",
+				 "work_buf[%d] va=0x%p iova=%pad size=%zu",
 				 i, inst->work_bufs[i].va,
-				 (void *)inst->work_bufs[i].dma_addr,
+				 &inst->work_bufs[i].dma_addr,
 				 inst->work_bufs[i].size);
 	}
 
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 5b4ef0f1740c..60bbcd2a0510 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -210,9 +210,9 @@ static int vp8_enc_alloc_work_buf(struct venc_vp8_inst *inst)
 		wb[i].iova = inst->work_bufs[i].dma_addr;
 
 		mtk_vcodec_debug(inst,
-				 "work_bufs[%d] va=0x%p,iova=0x%p,size=%zu",
+				 "work_bufs[%d] va=0x%p,iova=%pad,size=%zu",
 				 i, inst->work_bufs[i].va,
-				 (void *)inst->work_bufs[i].dma_addr,
+				 &inst->work_bufs[i].dma_addr,
 				 inst->work_bufs[i].size);
 	}
 
-- 
2.9.0
