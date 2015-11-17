From: Henry Chen <henryc.chen@mediatek.com>
Subject: [PATCH] regulator: mt6311: MT6311_REGULATOR needs to select REGMAP_I2C
Date: Tue, 17 Nov 2015 16:36:49 +0800
Message-ID: <1447749409-19900-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, henryc.chen@mediatek.com, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

This patch fix the below build error:
drivers/regulator/mt6311-regulator.c:111: undefined reference to `__devm_regmap_init_i2c'

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/regulator/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 8df0b0e..0067620 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -446,6 +446,7 @@ config REGULATOR_MC13892
 config REGULATOR_MT6311
 	tristate "MediaTek MT6311 PMIC"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  Say y here to select this option to enable the power regulator of
 	  MediaTek MT6311 PMIC.
-- 
1.9.1
