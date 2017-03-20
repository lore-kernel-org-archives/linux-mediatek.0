From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] [media] vcodec: mediatek: add missing linux/slab.h include
Date: Mon, 20 Mar 2017 10:47:54 +0100
Message-ID: <20170320094812.1365229-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rick Chang <rick.chang@mediatek.com>, Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <matthias.bgg@gmail.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Ricky Liang <jcliang@chromium.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

With the newly added driver, I have run into randconfig failures like:

drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c: In function 'mtk_jpeg_open':
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1017:8: error: implicit declaration of function 'kzalloc';did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]

Including the header with the declaration solves the problem.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index b10183f7942b..f9bd58ce7d32 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -22,6 +22,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
-- 
2.9.0
