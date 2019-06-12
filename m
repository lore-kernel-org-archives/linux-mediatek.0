From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] mt76: mt7615: fix incorrect settings in mesh mode
Date: Wed, 12 Jun 2019 11:12:33 +0800
Message-ID: <3065a01998dfa04a5d2d680e820a17cb5c110d0f.1560221172.git.ryder.lee@mediatek.com>
References: <22e5caff3581dc92fd6fec2f25966d86b7276bba.1560220443.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22e5caff3581dc92fd6fec2f25966d86b7276bba.1560220443.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Fix wrong settings that will drop packets due to hardware's RX table
searching flow.

Fixes: f072c7ba2150 ("mt76: mt7615: enable support for mesh")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 76431d00a8ac..e82086eb8aa4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -970,7 +970,7 @@ int mt7615_mcu_add_wtbl(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 		.rx_wtbl = {
 			.tag = cpu_to_le16(WTBL_RX),
 			.len = cpu_to_le16(sizeof(struct wtbl_rx)),
-			.rca1 = vif->type == NL80211_IFTYPE_STATION,
+			.rca1 = vif->type != NL80211_IFTYPE_AP,
 			.rca2 = 1,
 			.rv = 1,
 		},
-- 
2.18.0
