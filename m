From: <sean.wang@mediatek.com>
Subject: [PATCH] soc: mediatek: turn MTK_PMIC_WRAP into visible symbols
Date: Thu, 21 Sep 2017 17:01:05 +0800
Message-ID: <6c1696cf9f860cc8151a906ecbc799121b5aeeab.1505984256.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, jdelvare@suse.de, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

MTK_PMIC_WRAP is the basic and required configuration for those various
MediaTek PMICs, so turning MTK_PMIC_WRAP into visible symbols easily
allows users tending to have the enablement for those PMICs.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index a2fcd7f..d513629 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -15,7 +15,7 @@ config MTK_INFRACFG
 config MTK_PMIC_WRAP
 	tristate "MediaTek PMIC Wrapper Support"
 	depends on ARCH_MEDIATEK
-	depends on RESET_CONTROLLER
+	select RESET_CONTROLLER
 	select REGMAP
 	help
 	  Say yes here to add support for MediaTek PMIC Wrapper found
-- 
2.7.4
