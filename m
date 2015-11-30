From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH] cpufreq: mediatek: Use REGCACHE_RBTREE
Date: Mon, 30 Nov 2015 18:12:18 +0800
Message-ID: <1448878338-28496-1-git-send-email-djkurtz@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Daniel Kurtz <djkurtz@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:VOLTAGE AND CURRENT REGULATOR
	FRAMEWORK" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
	support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
	support" <linux-mediatek@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

This regulator is on a slow i2c bus.  Register accesses are very simple,
they all either enable/disable a regulator channel, or select a new
voltage level.  Thus, reading registers from the device will always
return what was last written.

Therefore we can save a lot of time when reading registers by using a
regmap_cache.  Since the register map is relatively large, but we only
ever access a few of them, we use an RBTREE cache.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 drivers/regulator/mt6311-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/mt6311-regulator.c b/drivers/regulator/mt6311-regulator.c
index 02c4e5f..0495716 100644
--- a/drivers/regulator/mt6311-regulator.c
+++ b/drivers/regulator/mt6311-regulator.c
@@ -30,6 +30,7 @@ static const struct regmap_config mt6311_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = MT6311_FQMTR_CON4,
+	.cache_type = REGCACHE_RBTREE,
 };
 
 /* Default limits measured in millivolts and milliamps */
-- 
2.6.0.rc2.230.g3dd15c0
