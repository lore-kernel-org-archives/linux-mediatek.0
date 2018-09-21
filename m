From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH 02/20] mt76: add stbc entries to mt76_rate_power
Date: Fri, 21 Sep 2018 18:09:37 +0200
Message-ID: <73834a66-5d00-d7b2-b46c-6ab360588fd4@nbd.name>
References: <cover.1537433365.git.lorenzo.bianconi@redhat.com>
 <15d756db7fef57befcc2e2e28e640be10493df88.1537433365.git.lorenzo.bianconi@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <15d756db7fef57befcc2e2e28e640be10493df88.1537433365.git.lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 2018-09-20 11:11, Lorenzo Bianconi wrote:
> From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
> 
> Add stbc tx power eeprom parsing support for mt76x2 driver.
> 
> Signed-off-by: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
I folded in the following extra change, and changed the description.
VHT8/9 also have STBC specific entries in the power registers.
I also added a distinction between vht[8/9] and ofdm[6/7], which
come from the same EEPROM value but have distinct register fields.

- Felix

---
--- a/mt76.h
+++ b/mt76.h
@@ -423,11 +423,11 @@ struct mt76_rate_power {
 		struct {
 			s8 cck[4];
 			s8 ofdm[8];
-			s8 stbc[8];
+			s8 stbc[10];
 			s8 ht[16];
 			s8 vht[10];
 		};
-		s8 all[46];
+		s8 all[48];
 	};
 };
 
--- a/mt76x2_eeprom.c
+++ b/mt76x2_eeprom.c
@@ -353,7 +353,6 @@ void mt76x2_get_rate_power(struct mt76x2_dev *dev, struct mt76_rate_power *t,
 	val = mt76x02_eeprom_get(&dev->mt76, MT_EE_TX_POWER_HT_MCS4);
 	t->ht[4] = t->ht[5] = mt76x2_rate_power_val(val);
 	t->ht[6] = t->ht[7] = mt76x2_rate_power_val(val >> 8);
-	memcpy(t->stbc, t->ht, sizeof(t->stbc));
 
 	val = mt76x02_eeprom_get(&dev->mt76, MT_EE_TX_POWER_HT_MCS8);
 	t->ht[8] = t->ht[9] = mt76x2_rate_power_val(val);
@@ -375,6 +374,10 @@ void mt76x2_get_rate_power(struct mt76x2_dev *dev, struct mt76_rate_power *t,
 	if (!is_5ghz)
 		val >>= 8;
 	t->vht[8] = t->vht[9] = mt76x2_rate_power_val(val >> 8);
+
+	memcpy(t->stbc, t->ht, sizeof(t->stbc[0]) * 8);
+	t->stbc[8] = t->vht[8];
+	t->stbc[9] = t->vht[9];
 }
 EXPORT_SYMBOL_GPL(mt76x2_get_rate_power);
 
--- a/mt76x2_phy_common.c
+++ b/mt76x2_phy_common.c
@@ -231,11 +231,11 @@ void mt76x2_phy_set_txpower(struct mt76x2_dev *dev)
 	mt76_wr(dev, MT_TX_PWR_CFG_4,
 		mt76x2_tx_power_mask(t.stbc[4], t.stbc[6], 0, 0));
 	mt76_wr(dev, MT_TX_PWR_CFG_7,
-		mt76x2_tx_power_mask(t.ofdm[6], t.vht[8], t.ht[6], t.vht[8]));
+		mt76x2_tx_power_mask(t.ofdm[7], t.vht[8], t.ht[7], t.vht[9]));
 	mt76_wr(dev, MT_TX_PWR_CFG_8,
-		mt76x2_tx_power_mask(t.ht[14], 0, t.vht[8], t.vht[8]));
+		mt76x2_tx_power_mask(t.ht[14], 0, t.vht[8], t.vht[9]));
 	mt76_wr(dev, MT_TX_PWR_CFG_9,
-		mt76x2_tx_power_mask(t.ht[6], 0, t.vht[8], t.vht[8]));
+		mt76x2_tx_power_mask(t.ht[7], 0, t.stbc[8], t.stbc[9]));
 }
 EXPORT_SYMBOL_GPL(mt76x2_phy_set_txpower);
 
