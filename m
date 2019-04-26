From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] mt76: mt7615: add TX/RX antenna pattern capabilities
Date: Fri, 26 Apr 2019 13:23:08 +0800
Message-ID: <4f7160cb9f52335ce15fccac087fec25e7650884.1556255852.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Announce antenna pattern cap to adapt PHY and baseband settings.

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
Changes since v2:
- Add a prefix mt76 in the title.
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 3ab3ff553ef2..122f7a565540 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -190,6 +190,8 @@ int mt7615_register_device(struct mt7615_dev *dev)
 			IEEE80211_VHT_CAP_SHORT_GI_160 |
 			IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454 |
 			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK |
+			IEEE80211_VHT_CAP_RX_ANTENNA_PATTERN |
+			IEEE80211_VHT_CAP_TX_ANTENNA_PATTERN |
 			IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ;
 	dev->mt76.chainmask = 0x404;
 	dev->mt76.antenna_mask = 0xf;
-- 
2.18.0
