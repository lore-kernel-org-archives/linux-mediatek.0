From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] rtc: mt6397: Remove plaform module alias
Date: Wed, 24 Feb 2016 14:26:20 -0300
Message-ID: <1456334780-17380-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

The driver uses the MODULE_ALIAS() macro to export a platform module alias
to allow the module to be autoloaded if the device is registered using the
legacy platform registration mechanism but the driver is always used by OF
only machines so the alias is not needed and should just be removed.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---
Hello,

This patch supersedes "rtc: mt6397: Add platform device ID table":
https://lkml.org/lkml/2016/2/9/192.

Best regards,
Javier

 drivers/rtc/rtc-mt6397.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 06a5c52b292f..44f622c3e048 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -419,4 +419,3 @@ module_platform_driver(mtk_rtc_driver);
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Tianping Fang <tianping.fang@mediatek.com>");
 MODULE_DESCRIPTION("RTC Driver for MediaTek MT6397 PMIC");
-MODULE_ALIAS("platform:mt6397-rtc");
-- 
2.5.0
