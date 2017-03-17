From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] [media] vcodec: mediatek: Remove double parentheses
Date: Fri, 17 Mar 2017 14:01:33 -0700
Message-ID: <20170317210133.9662-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, Matthias Kaehlcke <mka@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>, PoChun Lin <pochun.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

The extra pairs of parentheses are not needed and cause clang
warnings like this:

drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c:158:32: error: equality comparison with extraneous parentheses [-Werror,-Wparentheses-equality]
                if ((inst->work_bufs[i].size == 0))
                     ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c:158:32: note: remove extraneous parentheses around the comparison to silence this warning
                if ((inst->work_bufs[i].size == 0))
                    ~                        ^   ~
drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c:158:32: note: use '=' to turn this equality comparison into an assignment
                if ((inst->work_bufs[i].size == 0))
                                             ^~
                                             =

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 544f57186243..129cc74b4fe4 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -155,7 +155,7 @@ static void vp8_enc_free_work_buf(struct venc_vp8_inst *inst)
 
 	/* Buffers need to be freed by AP. */
 	for (i = 0; i < VENC_VP8_VPU_WORK_BUF_MAX; i++) {
-		if ((inst->work_bufs[i].size == 0))
+		if (inst->work_bufs[i].size == 0)
 			continue;
 		mtk_vcodec_mem_free(inst->ctx, &inst->work_bufs[i]);
 	}
@@ -172,7 +172,7 @@ static int vp8_enc_alloc_work_buf(struct venc_vp8_inst *inst)
 	mtk_vcodec_debug_enter(inst);
 
 	for (i = 0; i < VENC_VP8_VPU_WORK_BUF_MAX; i++) {
-		if ((wb[i].size == 0))
+		if (wb[i].size == 0)
 			continue;
 		/*
 		 * This 'wb' structure is set by VPU side and shared to AP for
-- 
2.12.0.367.g23dc2f6d3c-goog
