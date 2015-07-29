From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] soc: mediatek: Fix SCPSYS compilation
Date: Wed, 29 Jul 2015 20:03:08 +0200
Message-ID: <1438192988-17115-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: s.hauer@pengutronix.de
Cc: matthias.bgg@gmail.com, djkurtz@chromium.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

SCPSYS driver misses the module.h include which makes it fail
when compiling with allmodconf.

This patch fixes this.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 43a79ed..164a7d8 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
-- 
1.9.1
