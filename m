From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] mt76x0: run vco calibration for each channel configuration
Date: Fri,  7 Sep 2018 23:13:12 +0200
Message-ID: <20180907211312.17918-1-lorenzo.bianconi@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: nbd-Vt+b4OUoWG0@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

According to vendor sdk, vco calibration has to be executed
for each channel configuration whereas mcu calibration has to be
performed during channel scanning. This patch fixes the mt76x0
monitor mode issue since in that configuration vco calibration
was never executed

Fixes: 10de7a8b4ab9 ("mt76x0: phy files")
Tested-by: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/phy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
index 5da7bfbe907f..14e8c575f6c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
@@ -757,10 +757,10 @@ __mt76x0_phy_set_channel(struct mt76x0_dev *dev,
 	/* Vendor driver don't do it */
 	/* mt76x0_phy_set_tx_power(dev, channel, rf_bw_band); */
 
+	mt76x0_vco_cal(dev, channel);
 	if (scan)
-		mt76x0_vco_cal(dev, channel);
+		mt76x0_mcu_calibrate(dev, MCU_CAL_RXDCOC, 1);
 
-	mt76x0_mcu_calibrate(dev, MCU_CAL_RXDCOC, 1);
 	mt76x0_phy_set_chan_pwr(dev, channel);
 
 	dev->mt76.chandef = *chandef;
-- 
2.18.0
