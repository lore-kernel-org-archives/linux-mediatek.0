From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 3/4] mt76: use macro for sn and seq_ctrl conversion
Date: Tue, 26 Mar 2019 22:28:09 +0800
Message-ID: <7b4aa870b4f1da720ce8b93ee1d9e4a6e254737d.1553607739.git.ryder.lee@mediatek.com>
References: <cover.1553607739.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1553607739.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>
Cc: Roy Luo <royluo@google.com>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, YF Luo <yf.luo@mediatek.com>, Kai Lin <kai.lin@mediatek.com>, Rorscha Yang <rorscha.yang@mediatek.com>, Kyle Lee <kyle.lee@mediatek.com>, Miller Shen <miller.shen@mediatek.com>, Haipin Liang <haipin.liang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Use macro to convert sn and seq_ctrl for better readability.

Signed-off-by: Roy Luo <royluo@google.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c       | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c   | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/main.c  | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x02_util.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index 73c8b28..27e3ff0 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -135,7 +135,7 @@
 		return;
 
 	status->tid = le16_to_cpu(bar->control) >> 12;
-	seqno = le16_to_cpu(bar->start_seq_num) >> 4;
+	seqno = IEEE80211_SEQ_TO_SN(le16_to_cpu(bar->start_seq_num));
 	tid = rcu_dereference(wcid->aggr[status->tid]);
 	if (!tid)
 		return;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index e498169..2f2961e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -627,7 +627,7 @@ void mt7603_mac_tx_ba_reset(struct mt7603_dev *dev, int wcid, int tid, int ssn,
 	status->aggr = unicast &&
 		       !ieee80211_is_qos_nullfunc(hdr->frame_control);
 	status->tid = *ieee80211_get_qos_ctl(hdr) & IEEE80211_QOS_CTL_TID_MASK;
-	status->seqno = hdr->seq_ctrl >> 4;
+	status->seqno = IEEE80211_SEQ_TO_SN(hdr->seq_ctrl);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/main.c b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
index 5d38392..0c78044 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
@@ -594,7 +594,7 @@
 		mt7603_mac_tx_ba_reset(dev, msta->wcid.idx, tid, *ssn, -1);
 		break;
 	case IEEE80211_AMPDU_TX_START:
-		mtxq->agg_ssn = *ssn << 4;
+		mtxq->agg_ssn = IEEE80211_SN_TO_SEQ(*ssn);
 		ieee80211_start_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	case IEEE80211_AMPDU_TX_STOP_CONT:
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
index b137ce8..f0e1e12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_util.c
@@ -378,7 +378,7 @@ int mt76x02_ampdu_action(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		ieee80211_send_bar(vif, sta->addr, tid, mtxq->agg_ssn);
 		break;
 	case IEEE80211_AMPDU_TX_START:
-		mtxq->agg_ssn = *ssn << 4;
+		mtxq->agg_ssn = IEEE80211_SN_TO_SEQ(*ssn);
 		ieee80211_start_tx_ba_cb_irqsafe(vif, sta->addr, tid);
 		break;
 	case IEEE80211_AMPDU_TX_STOP_CONT:
-- 
1.9.1
