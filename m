From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mt7615: add TX/RX antenna pattern capabilities
Date: Fri, 26 Apr 2019 11:36:17 +0800
Message-ID: <4f0780666982b3e935f46abcfe434bc68c232fb0.1556249572.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>
Cc: Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Announce antenna pattern cap to adapt PHY and baseband settings.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
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
