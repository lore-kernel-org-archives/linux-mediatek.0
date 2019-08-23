From: Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] drm/mediatek: fix implicit function declaration
Date: Fri, 23 Aug 2019 13:07:36 +0200
Message-ID: <20190823110736.26117-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

When building mtk_drm_drv.o the following build error is seen:

../drivers/gpu/drm/mediatek/mtk_drm_drv.c: In function ‘mtk_drm_kms_init’:
../drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: implicit declaration of
 function ‘dma_set_max_seg_size’; did you mean ‘drm_rect_adjust_size’? [-Werror=implicit-function-declaration]
  ret = dma_set_max_seg_size(dma_dev, (unsigned int)DMA_BIT_MASK(32));
        ^~~~~~~~~~~~~~~~~~~~
        drm_rect_adjust_size
../drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: implicit declaration of
 function ‘DMA_BIT_MASK’; did you mean ‘BIT_MASK’? [-Werror=implicit-function-declaration]
  ret = dma_set_max_seg_size(dma_dev, (unsigned int)DMA_BIT_MASK(32));
                                                    ^~~~~~~~~~~~
                                                    BIT_MASK

Rework to add a missing include file 'linux/dma-mapping.h', because that
is the (only) header file containing that declaration.

Fixes: 070955558e82 ("drm/mediatek: set DMA max segment size")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 54536176bcbb..352b81a7a670 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -10,6 +10,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
+#include <linux/dma-mapping.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-- 
2.20.1
