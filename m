From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v3] mt76: add TX/RX antenna pattern capabilities
Date: Tue, 30 Apr 2019 21:55:38 +0800
Message-ID: <1e054441bab22ee28fdad597ca36d891500b4a66.1556624322.git.ryder.lee@mediatek.com>
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
Changes since v3:
- Move these flags to common code.
Changes since v2:
- Add a prefix mt76 in the title.
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 851caabbecda..26a336ef86c5 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -214,6 +214,8 @@ mt76_init_sband(struct mt76_dev *dev, struct mt76_sband *msband,
 	vht_cap->cap |= IEEE80211_VHT_CAP_RXLDPC |
 			IEEE80211_VHT_CAP_RXSTBC_1 |
 			IEEE80211_VHT_CAP_SHORT_GI_80 |
+			IEEE80211_VHT_CAP_RX_ANTENNA_PATTERN |
+			IEEE80211_VHT_CAP_TX_ANTENNA_PATTERN |
 			(3 << IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_SHIFT);
 
 	return 0;
-- 
2.18.0
