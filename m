From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/2] mt76: mt7615: fix incorrect settings in mesh mode
Date: Thu, 13 Jun 2019 15:13:30 +0800
Message-ID: <3065a01998dfa04a5d2d680e820a17cb5c110d0f.1560330906.git.ryder.lee@mediatek.com>
References: <ec6ccb9ad8e083bbc960c84adcb3164a4e190c7c.1560338170.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <ec6ccb9ad8e083bbc960c84adcb3164a4e190c7c.1560338170.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Fix wrong settings that will drop packets due to hardware's RX table
searching flow.

Fixes: f072c7ba2150 ("mt76: mt7615: enable support for mesh")
Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
