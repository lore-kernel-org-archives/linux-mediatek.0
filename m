From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/3] mt76: mt7615: add cwmin/cwmax initial values
Date: Fri, 19 Jul 2019 14:55:36 +0800
Message-ID: <c83e14787bc86f8f8062e0aa44e03ef80c3fd38a.1563518381.git.ryder.lee@mediatek.com>
References: <50d28c9b0f9e7d6b277d36fc93f55142d7535259.1563518381.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <50d28c9b0f9e7d6b277d36fc93f55142d7535259.1563518381.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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

Add initial values in mt7615_mcu_set_wmm() to cleanup setup flow.

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 5fd162be3654..154c09428b69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -622,10 +622,7 @@ int mt7615_mcu_set_rts_thresh(struct mt7615_dev *dev, u32 val)
 int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
 		       const struct ieee80211_tx_queue_params *params)
 {
-#define WMM_AIFS_SET	BIT(0)
-#define WMM_CW_MIN_SET	BIT(1)
-#define WMM_CW_MAX_SET	BIT(2)
-#define WMM_TXOP_SET	BIT(3)
+#define WMM_PARAM_SET	GENMASK(3, 0)
 	struct req_data {
 		u8 number;
 		u8 rsv[3];
@@ -638,19 +635,17 @@ int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
 	} __packed req = {
 		.number = 1,
 		.queue = queue,
-		.valid = WMM_AIFS_SET | WMM_TXOP_SET,
+		.valid = WMM_PARAM_SET,
 		.aifs = params->aifs,
+		.cw_min = BIT(5) - 1,
+		.cw_max = cpu_to_le16(BIT(10) - 1),
 		.txop = cpu_to_le16(params->txop),
 	};
 
-	if (params->cw_min) {
-		req.valid |= WMM_CW_MIN_SET;
+	if (params->cw_min)
 		req.cw_min = params->cw_min;
-	}
-	if (params->cw_max) {
-		req.valid |= WMM_CW_MAX_SET;
+	if (params->cw_max)
 		req.cw_max = cpu_to_le16(params->cw_max);
-	}
 
 	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE,
 				   &req, sizeof(req), true);
-- 
2.18.0
