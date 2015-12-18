From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [RESEND PATCH] regulator: mt6311: Use REGCACHE_RBTREE
Date: Fri, 18 Dec 2015 15:11:33 +0800
Message-ID: <1450422693-371-1-git-send-email-djkurtz@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "open list:VOLTAGE AND CURRENT REGULATOR
	FRAMEWORK" <linux-kernel@vger.kernel.org>
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
I used the wrong commit message subject in the first attempt.
Maybe this time someone will review it ;-).
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
