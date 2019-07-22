From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 2/2] mt76: mt7615: update cw_min/max related settings
Date: Mon, 22 Jul 2019 16:50:09 +0800
Message-ID: <dd1438cdf392409179ea82bb2f32e8fcbf074057.1563779728.git.ryder.lee@mediatek.com>
References: <f5c814ad88a8d959376fc77930531582eedf1a63.1563779728.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f5c814ad88a8d959376fc77930531582eedf1a63.1563779728.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Add default values of cw_min/max and use fls() for configuration.

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
Changes since v1:
- Restore each WMM_* bit and add WMM_PARAM_SET.
- Use fls().
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 5fd162be3654..3563ddf17aad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -626,6 +626,8 @@ int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
 #define WMM_CW_MIN_SET	BIT(1)
 #define WMM_CW_MAX_SET	BIT(2)
 #define WMM_TXOP_SET	BIT(3)
+#define WMM_PARAM_SET	(WMM_AIFS_SET | WMM_CW_MIN_SET | \
+			 WMM_CW_MAX_SET | WMM_TXOP_SET)
 	struct req_data {
 		u8 number;
 		u8 rsv[3];
@@ -638,19 +640,17 @@ int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
 	} __packed req = {
 		.number = 1,
 		.queue = queue,
-		.valid = WMM_AIFS_SET | WMM_TXOP_SET,
+		.valid = WMM_PARAM_SET,
 		.aifs = params->aifs,
+		.cw_min = 5,
+		.cw_max = cpu_to_le16(10),
 		.txop = cpu_to_le16(params->txop),
 	};
 
-	if (params->cw_min) {
-		req.valid |= WMM_CW_MIN_SET;
-		req.cw_min = params->cw_min;
-	}
-	if (params->cw_max) {
-		req.valid |= WMM_CW_MAX_SET;
-		req.cw_max = cpu_to_le16(params->cw_max);
-	}
+	if (params->cw_min)
+		req.cw_min = fls(params->cw_min);
+	if (params->cw_max)
+		req.cw_max = cpu_to_le16(fls(params->cw_max));
 
 	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE,
 				   &req, sizeof(req), true);
-- 
2.18.0
