From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] [media] VPU: mediatek: Fix return value in case of error
Date: Fri, 23 Sep 2016 23:19:01 +0200
Message-ID: <1474665541-7454-1-git-send-email-christophe.jaillet@wanadoo.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, matthias.bgg@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-Id: linux-mediatek@lists.infradead.org

If 'dma_alloc_coherent()' returns NULL, 'vpu_alloc_ext_mem()' will
return 0 which means success.
Return -ENOMEM instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index c9bf58c97878..3edb5ed852e6 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -674,7 +674,7 @@ static int vpu_alloc_ext_mem(struct mtk_vpu *vpu, u32 fw_type)
 					       GFP_KERNEL);
 	if (!vpu->extmem[fw_type].va) {
 		dev_err(dev, "Failed to allocate the extended program memory\n");
-		return PTR_ERR(vpu->extmem[fw_type].va);
+		return -ENOMEM;
 	}
 
 	/* Disable extend0. Enable extend1 */
-- 
2.7.4
