From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] mt76: Use the correct hweight8() function again
Date: Sun, 17 Mar 2019 11:32:28 +0900
Message-ID: <1552789948-31564-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Commit d0ff23c1107e ("mt76: Use the correct hweight8() function")
fixed the wrong use of __sw_hweight8().

Just a week later, commit c8846e101502 ("mt76: add driver for MT7603E
and MT7628/7688") was applid, introducing __sw_hweight8() again.

Fixes: c8846e101502 ("mt76: add driver for MT7603E and MT7628/7688")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/net/wireless/mediatek/mt76/mt7603/beacon.c | 3 +--
 drivers/net/wireless/mediatek/mt76/mt7603/init.c   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/mcu.c    | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
index afcd86f..4dcb465 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
@@ -135,8 +135,7 @@ void mt7603_pre_tbtt_tasklet(unsigned long arg)
 
 out:
 	mt76_queue_tx_cleanup(dev, MT_TXQ_BEACON, false);
-	if (dev->mt76.q_tx[MT_TXQ_BEACON].queued >
-	    __sw_hweight8(dev->beacon_mask))
+	if (dev->mt76.q_tx[MT_TXQ_BEACON].queued > hweight8(dev->beacon_mask))
 		dev->beacon_check++;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index 15cc8f3..d54dda6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -112,7 +112,7 @@ static void
 mt7603_phy_init(struct mt7603_dev *dev)
 {
 	int rx_chains = dev->mt76.antenna_mask;
-	int tx_chains = __sw_hweight8(rx_chains) - 1;
+	int tx_chains = hweight8(rx_chains) - 1;
 
 	mt76_rmw(dev, MT_WF_RMAC_RMCR,
 		 (MT_WF_RMAC_RMCR_SMPS_MODE |
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
index 4b0713f..d06905e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
@@ -433,7 +433,7 @@ int mt7603_mcu_set_channel(struct mt7603_dev *dev)
 {
 	struct cfg80211_chan_def *chandef = &dev->mt76.chandef;
 	struct ieee80211_hw *hw = mt76_hw(dev);
-	int n_chains = __sw_hweight8(dev->mt76.antenna_mask);
+	int n_chains = hweight8(dev->mt76.antenna_mask);
 	struct {
 		u8 control_chan;
 		u8 center_chan;
-- 
2.7.4
