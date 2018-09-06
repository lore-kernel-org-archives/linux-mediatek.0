From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 30/42] mt76x0: alloc mcu buffers first in mt76x0_mcu_cmd_init
Date: Thu,  6 Sep 2018 11:18:46 +0200
Message-ID: <1536225538-16454-31-git-send-email-sgruszka@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

swap mt76u_mcu_init_rx and mt76x0_mcu_function_select in
mt76x0_mcu_cmd_init routine in order to allocate mcu buffers
first and then send mcu commands

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
index 0a0deaf1c65d..7be2835f3b4f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
@@ -387,9 +387,11 @@ int mt76x0_mcu_init(struct mt76x0_dev *dev)
 
 int mt76x0_mcu_cmd_init(struct mt76x0_dev *dev)
 {
-	int ret = mt76x0_mcu_function_select(dev, Q_SELECT, 1);
+	int ret;
+
+	ret = mt76u_mcu_init_rx(&dev->mt76);
 	if (ret)
 		return ret;
 
-	return mt76u_mcu_init_rx(&dev->mt76);
+	return mt76x0_mcu_function_select(dev, Q_SELECT, 1);
 }
-- 
2.7.5
