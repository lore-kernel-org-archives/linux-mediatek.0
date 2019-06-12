From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] mt76: mt7615: update peer's bssid when state transition
 changes
Date: Wed, 12 Jun 2019 11:12:34 +0800
Message-ID: <449fee28c558b6f02b62275f9beefaab02b47efc.1560221172.git.ryder.lee@mediatek.com>
References: <3065a01998dfa04a5d2d680e820a17cb5c110d0f.1560221172.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <3065a01998dfa04a5d2d680e820a17cb5c110d0f.1560221172.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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

Driver should update peer's bssid and bss information when
state transition changes.

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  5 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 49 ++++++++++---------
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index d21407ddda31..e0824392c019 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -283,9 +283,8 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 
 	mutex_lock(&dev->mt76.mutex);
 
-	/* TODO: sta mode connect/disconnect
-	 * BSS_CHANGED_ASSOC | BSS_CHANGED_BSSID
-	 */
+	if (changed & BSS_CHANGED_ASSOC)
+		mt7615_mcu_set_bss_info(dev, vif, info->assoc);
 
 	/* TODO: update beacon content
 	 * BSS_CHANGED_BEACON
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index e82086eb8aa4..8fc12cd37906 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -741,17 +741,6 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
 	u8 *buf, *data, tx_wlan_idx = 0;
 	struct req_hdr *hdr;
 
-	if (en) {
-		len += sizeof(struct bss_info_omac);
-		features |= BIT(BSS_INFO_OMAC);
-		if (mvif->omac_idx > EXT_BSSID_START) {
-			len += sizeof(struct bss_info_ext_bss);
-			features |= BIT(BSS_INFO_EXT_BSS);
-			ntlv++;
-		}
-		ntlv++;
-	}
-
 	switch (vif->type) {
 	case NL80211_IFTYPE_AP:
 	case NL80211_IFTYPE_MESH_POINT:
@@ -759,22 +748,23 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
 		conn_type = CONNECTION_INFRA_AP;
 		break;
 	case NL80211_IFTYPE_STATION: {
-		struct ieee80211_sta *sta;
-		struct mt7615_sta *msta;
-
-		rcu_read_lock();
-
-		sta = ieee80211_find_sta(vif, vif->bss_conf.bssid);
-		if (!sta) {
+		/* TODO: enable BSS_INFO_UAPSD & BSS_INFO_PM */
+		if (en) {
+			struct ieee80211_sta *sta;
+			struct mt7615_sta *msta;
+
+			rcu_read_lock();
+			sta = ieee80211_find_sta(vif, vif->bss_conf.bssid);
+			if (!sta) {
+				rcu_read_unlock();
+				return -EINVAL;
+			}
+
+			msta = (struct mt7615_sta *)sta->drv_priv;
+			tx_wlan_idx = msta->wcid.idx;
 			rcu_read_unlock();
-			return -EINVAL;
 		}
-
-		msta = (struct mt7615_sta *)sta->drv_priv;
-		tx_wlan_idx = msta->wcid.idx;
 		conn_type = CONNECTION_INFRA_STA;
-
-		rcu_read_unlock();
 		break;
 	}
 	default:
@@ -782,6 +772,17 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
 		break;
 	}
 
+	if (en) {
+		len += sizeof(struct bss_info_omac);
+		features |= BIT(BSS_INFO_OMAC);
+		if (mvif->omac_idx > EXT_BSSID_START) {
+			len += sizeof(struct bss_info_ext_bss);
+			features |= BIT(BSS_INFO_EXT_BSS);
+			ntlv++;
+		}
+		ntlv++;
+	}
+
 	buf = kzalloc(len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.18.0
