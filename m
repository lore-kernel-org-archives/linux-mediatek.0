From: Henry Chen <henryc.chen@mediatek.com>
Subject: [PATCH] mfd: mt6397: convert to arch_initcall
Date: Wed, 23 Dec 2015 17:25:11 +0800
Message-ID: <1450862711-22124-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Flora Fu <flora.fu@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Since pinctrl or regulator of mt6396 need to initialize earlier to avoid
probe deferring, also change the core driver to arch_init.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/mfd/mt6397-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 1749c1c..af98b4b 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -285,7 +285,11 @@ static struct platform_driver mt6397_driver = {
 	},
 };
 
-module_platform_driver(mt6397_driver);
+static int __init mt6397_core_init(void)
+{
+	return platform_driver_register(&mt6397_driver);
+}
+arch_initcall(mt6397_core_init);
 
 MODULE_AUTHOR("Flora Fu, MediaTek");
 MODULE_DESCRIPTION("Driver for MediaTek MT6397 PMIC");
-- 
1.9.1
