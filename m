From: Henry Chen <henryc.chen@mediatek.com>
Subject: [PATCH] regmap: Add function check before called format_val
Date: Mon, 20 Jul 2015 20:41:50 +0800
Message-ID: <1437396110-5192-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, henryc.chen@mediatek.com, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

The regmap_format will not be initialize since regmap_bus is not assgined 
on regmap_init(). It should has a function check before using 
format_val() to avoid null function called on regmap_bulk_read().

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
Based on v4.2rc1
---
 drivers/base/regmap/regmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 7111d04..c1e8c32 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2317,7 +2317,10 @@ int regmap_bulk_read(struct regmap *map, unsigned int reg, void *val,
 					  &ival);
 			if (ret != 0)
 				return ret;
-			map->format.format_val(val + (i * val_bytes), ival, 0);
+			if (map->format.format_val)
+				map->format.format_val(val + (i * val_bytes), ival, 0);
+			else
+				memcpy(val + (i * val_bytes), &ival, val_bytes);
 		}
 	}
 
-- 
1.8.1.1.dirty
