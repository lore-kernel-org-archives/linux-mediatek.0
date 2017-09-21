From: <sean.wang@mediatek.com>
Subject: [PATCH] soc: mediatek: place Kconfig for all SoC driver under menu
Date: Thu, 21 Sep 2017 16:46:35 +0800
Message-ID: <b7aeda2773ebd2f030ddd782b31a594a05fdef2c.1505982942.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, jdelvare@suse.de, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Add cleanup for placing all Kconfig for all MediaTek SoC drivers under
the independent menu as other SoCs vendor usually did.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/soc/mediatek/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 609bb34..a2fcd7f 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -1,6 +1,8 @@
 #
 # MediaTek SoC drivers
 #
+menu "MediaTek SoC drivers"
+
 config MTK_INFRACFG
 	bool "MediaTek INFRACFG Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
@@ -30,3 +32,5 @@ config MTK_SCPSYS
 	help
 	  Say yes here to add support for the MediaTek SCPSYS power domain
 	  driver.
+
+endmenu
-- 
2.7.4
