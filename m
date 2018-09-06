From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 35/42] mt76x0: remove has_{2,5}ghz fields of mt76x0_eeprom_params
Date: Thu,  6 Sep 2018 11:18:51 +0200
Message-ID: <1536225538-16454-36-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Remove has_2ghz/has_5ghz fields of mt76x0_eeprom_params data
structure and use mt76_dev ones. This is a preliminary patch
to use shared routines for device allocation

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c | 11 ++++++-----
 drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h |  3 ---
 drivers/net/wireless/mediatek/mt76/mt76x0/init.c   |  4 ++--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
index 36da1e6bc21a..0fd178d84277 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
@@ -123,18 +123,19 @@ mt76x0_set_chip_cap(struct mt76x0_dev *dev, u8 *eeprom)
 
 	switch (FIELD_GET(MT_EE_NIC_CONF_0_BOARD_TYPE, nic_conf0)) {
 	case BOARD_TYPE_5GHZ:
-		dev->ee->has_5ghz = true;
+		dev->mt76.cap.has_5ghz = true;
 		break;
 	case BOARD_TYPE_2GHZ:
-		dev->ee->has_2ghz = true;
+		dev->mt76.cap.has_2ghz = true;
 		break;
 	default:
-		dev->ee->has_2ghz = true;
-		dev->ee->has_5ghz = true;
+		dev->mt76.cap.has_2ghz = true;
+		dev->mt76.cap.has_5ghz = true;
 		break;
 	}
 
-	dev_dbg(dev->mt76.dev, "Has 2GHZ %d 5GHZ %d\n", dev->ee->has_2ghz, dev->ee->has_5ghz);
+	dev_dbg(dev->mt76.dev, "Has 2GHZ %d 5GHZ %d\n",
+		dev->mt76.cap.has_2ghz, dev->mt76.cap.has_5ghz);
 
 	if (!field_valid(nic_conf1 & 0xff))
 		nic_conf1 &= 0xff00;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h
index e37b573aed7b..cd0f14361405 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h
@@ -112,9 +112,6 @@ struct mt76x0_eeprom_params {
 	u8 tx_pwr_per_chan[58];
 
 	struct reg_channel_bounds reg;
