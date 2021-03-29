Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE404C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:56:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2EFB61924
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2EFB61924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aKMQZcPDVSHHtdgbMkWlhhlqkgeMxsZo2lWKOYx8W5g=; b=BbodmIskFH1BXzyYlXdGLF4Wrd
	o5TkapIt/K0qd6gn7Xr43brab+lbJnesBPVBwhEdqPgL0uXh6OuGO8/tZPYCGp0BQL+Y2s2WxSRRk
	PpCPL/DffK7o9WPn5bC98UmlcTO0492kSewXSaVKy3htzAsHEQNqYSWnW5dCYBf1fQuCG5d3E5E4c
	J2MRQMac9aa/Fj6r8bG8xzk2jsU3LJpm5nTVjQbIP+vSL7k3Ht1qL8soZMAYtYL0gKhW1nOcqqcOH
	my0yl8H5f2V4BxiBA/lDJIddBcAyzT6Vt+IkJ0MVztfv6UruccSMTDWAPjuXlHnIX2nc64ac2/wOW
	mZjAogWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1jU-0024XQ-QL; Mon, 29 Mar 2021 23:55:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQvnE-000vJB-Ba
 for linux-mediatek@lists.infradead.org; Mon, 29 Mar 2021 17:35:15 +0000
X-UUID: 1628c70537534538ae2237c68ba4528b-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6+RSnwQGOqFEVtCoHOMRyKuH256+JJ0qGBSjX2C+e/g=; 
 b=RrwTuboYkJrZgry1m1OhLJyZn36G4He6IVjFVY9RGkWLWDzE4uNrrw4IqZbSkeOvwsAF+NwQqeF/QIll1FUhog57bffmeVBegY4yxo1VP9YtZckuzlC0Y0NVnUCSxtMIvjt0Z82VcIlfCJRim6/Khwi+AlaDOpQBsRFZzc8RV9Q=;
X-UUID: 1628c70537534538ae2237c68ba4528b-20210329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1874967472; Mon, 29 Mar 2021 09:35:04 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 10:25:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 01:25:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Mar 2021 01:25:00 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v3] mt76: report Rx timestamp
Date: Tue, 30 Mar 2021 01:25:00 +0800
Message-ID: <46b0ccc6e37a6f4799f08ea4841fc3af067131b2.1617038163.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_183513_136486_927F3760 
X-CRM114-Status: GOOD (  15.13  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Frame reception timestamp (low 32-bits) that indicates the value of the
local TSF timer value at the time the first bit of the MAC header in the
received frame (PPDU unit) arriving at the MAC.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v3 - add device_timestamp
change since v2 - use time_after32()
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c   |  6 ++--
 drivers/net/wireless/mediatek/mt76/mac80211.c |  2 ++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  3 +-
 .../net/wireless/mediatek/mt76/mt7603/init.c  |  3 ++
 .../net/wireless/mediatek/mt76/mt7603/mac.c   | 31 ++++++++++--------
 .../wireless/mediatek/mt76/mt7603/mt7603.h    |  2 +-
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  3 ++
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 32 ++++++++++---------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  3 ++
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 29 +++++++++--------
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  3 ++
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 29 +++++++++--------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +-
 15 files changed, 89 insertions(+), 63 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index 144e8a8910ba..72622220051b 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -76,9 +76,9 @@ mt76_rx_aggr_check_release(struct mt76_rx_tid *tid, struct sk_buff_head *frames)
 
 		nframes--;
 		status = (struct mt76_rx_status *)skb->cb;
-		if (!time_after(jiffies,
-				status->reorder_time +
-				mt76_aggr_tid_to_timeo(tid->num)))
+		if (!time_after32(jiffies,
+				  status->reorder_time +
+				  mt76_aggr_tid_to_timeo(tid->num)))
 			continue;
 
 		mt76_rx_aggr_release_frames(tid, frames, status->seqno);
diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 7684a8cf00fb..e64ae0106e78 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -761,6 +761,8 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
 	status->signal = mstat.signal;
 	status->chains = mstat.chains;
 	status->ampdu_reference = mstat.ampdu_ref;
+	status->device_timestamp = mstat.timestamp;
+	status->mactime = mstat.timestamp;
 
 	BUILD_BUG_ON(sizeof(mstat) > sizeof(skb->cb));
 	BUILD_BUG_ON(sizeof(status->chain_signal) !=
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index b09b0f5ffd6d..d121c176c37c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -498,9 +498,10 @@ struct mt76_rx_status {
 		u16 wcid_idx;
 	};
 
-	unsigned long reorder_time;
+	u32 reorder_time;
 
 	u32 ampdu_ref;
+	u32 timestamp;
 
 	u8 iv[6];
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index f0b879c3eba8..e1b2cfa56074 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -548,6 +548,9 @@ int mt7603_register_device(struct mt7603_dev *dev)
 	hw->max_report_rates = 7;
 	hw->max_rate_tries = 11;
 
+	hw->radiotap_timestamp.units_pos =
+		IEEE80211_RADIOTAP_TIMESTAMP_UNIT_US;
+
 	hw->sta_data_size = sizeof(struct mt7603_sta);
 	hw->vif_data_size = sizeof(struct mt7603_vif);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index c29b60a87819..e3a9dd6fbd87 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -532,20 +532,6 @@ mt7603_mac_fill_rx(struct mt7603_dev *dev, struct sk_buff *skb)
 		status->flag |= RX_FLAG_MMIC_STRIPPED | RX_FLAG_MIC_STRIPPED;
 	}
 
-	if (!(rxd2 & (MT_RXD2_NORMAL_NON_AMPDU_SUB |
-		      MT_RXD2_NORMAL_NON_AMPDU))) {
-		status->flag |= RX_FLAG_AMPDU_DETAILS;
-
-		/* all subframes of an A-MPDU have the same timestamp */
-		if (dev->rx_ampdu_ts != rxd[12]) {
-			if (!++dev->ampdu_ref)
-				dev->ampdu_ref++;
-		}
-		dev->rx_ampdu_ts = rxd[12];
-
-		status->ampdu_ref = dev->ampdu_ref;
-	}
-
 	remove_pad = rxd1 & MT_RXD1_NORMAL_HDR_OFFSET;
 
 	if (rxd2 & MT_RXD2_NORMAL_MAX_LEN_ERROR)
@@ -579,6 +565,23 @@ mt7603_mac_fill_rx(struct mt7603_dev *dev, struct sk_buff *skb)
 			return -EINVAL;
 	}
 	if (rxd0 & MT_RXD0_NORMAL_GROUP_2) {
+		status->timestamp = le32_to_cpu(rxd[0]);
+		status->flag |= RX_FLAG_MACTIME_START;
+
+		if (!(rxd2 & (MT_RXD2_NORMAL_NON_AMPDU_SUB |
+			      MT_RXD2_NORMAL_NON_AMPDU))) {
+			status->flag |= RX_FLAG_AMPDU_DETAILS;
+
+			/* all subframes of an A-MPDU have the same timestamp */
+			if (dev->rx_ampdu_ts != status->timestamp) {
+				if (!++dev->ampdu_ref)
+					dev->ampdu_ref++;
+			}
+			dev->rx_ampdu_ts = status->timestamp;
+
+			status->ampdu_ref = dev->ampdu_ref;
+		}
+
 		rxd += 2;
 		if ((u8 *)rxd - skb->data >= skb->len)
 			return -EINVAL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index b787c56fd8d6..1df5b9fed2bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -120,7 +120,7 @@ struct mt7603_dev {
 	unsigned long last_cca_adj;
 
 	u32 ampdu_ref;
-	__le32 rx_ampdu_ts;
+	u32 rx_ampdu_ts;
 	u8 rssi_offset[3];
 
 	u8 slottime;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 857fb4918975..1e418740c17b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -333,6 +333,9 @@ mt7615_init_wiphy(struct ieee80211_hw *hw)
 	hw->max_rate_tries = 11;
 	hw->netdev_features = NETIF_F_RXCSUM;
 
+	hw->radiotap_timestamp.units_pos =
+		IEEE80211_RADIOTAP_TIMESTAMP_UNIT_US;
+
 	phy->slottime = 9;
 
 	hw->sta_data_size = sizeof(struct mt7615_sta);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 6a1395de3066..005c2829d3df 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -235,7 +235,6 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	u32 rxd1 = le32_to_cpu(rxd[1]);
 	u32 rxd2 = le32_to_cpu(rxd[2]);
 	u32 csum_mask = MT_RXD0_NORMAL_IP_SUM | MT_RXD0_NORMAL_UDP_TCP_SUM;
-	__le32 rxd12 = rxd[12];
 	bool unicast, hdr_trans, remove_pad, insert_ccmp_hdr = false;
 	int phy_idx;
 	int i, idx;
@@ -329,6 +328,23 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	}
 
 	if (rxd0 & MT_RXD0_NORMAL_GROUP_2) {
+		status->timestamp = le32_to_cpu(rxd[0]);
+		status->flag |= RX_FLAG_MACTIME_START;
+
+		if (!(rxd2 & (MT_RXD2_NORMAL_NON_AMPDU_SUB |
+			      MT_RXD2_NORMAL_NON_AMPDU))) {
+			status->flag |= RX_FLAG_AMPDU_DETAILS;
+
+			/* all subframes of an A-MPDU have the same timestamp */
+			if (phy->rx_ampdu_ts != status->timestamp) {
+				if (!++phy->ampdu_ref)
+					phy->ampdu_ref++;
+			}
+			phy->rx_ampdu_ts = status->timestamp;
+
+			status->ampdu_ref = phy->ampdu_ref;
+		}
+
 		rxd += 2;
 		if ((u8 *)rxd - skb->data >= skb->len)
 			return -EINVAL;
@@ -372,20 +388,6 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	if (!sband->channels)
 		return -EINVAL;
 
-	if (!(rxd2 & (MT_RXD2_NORMAL_NON_AMPDU_SUB |
-		      MT_RXD2_NORMAL_NON_AMPDU))) {
-		status->flag |= RX_FLAG_AMPDU_DETAILS;
-
-		/* all subframes of an A-MPDU have the same timestamp */
-		if (phy->rx_ampdu_ts != rxd12) {
-			if (!++phy->ampdu_ref)
-				phy->ampdu_ref++;
-		}
-		phy->rx_ampdu_ts = rxd12;
-
-		status->ampdu_ref = phy->ampdu_ref;
-	}
-
 	if (rxd0 & MT_RXD0_NORMAL_GROUP_3) {
 		u32 rxdg0 = le32_to_cpu(rxd[0]);
 		u32 rxdg1 = le32_to_cpu(rxd[1]);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index dbabdeef4e0b..6a50338ec9f5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -168,7 +168,7 @@ struct mt7615_phy {
 	u8 rdd_state;
 	int dfs_state;
 
-	__le32 rx_ampdu_ts;
+	u32 rx_ampdu_ts;
 	u32 ampdu_ref;
 
 	struct mib_stats mib;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 2ffadd22c259..882d67296f06 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -95,6 +95,9 @@ mt7915_init_wiphy(struct ieee80211_hw *hw)
 	hw->max_tx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF;
 	hw->netdev_features = NETIF_F_RXCSUM;
 
+	hw->radiotap_timestamp.units_pos =
+		IEEE80211_RADIOTAP_TIMESTAMP_UNIT_US;
+
 	phy->slottime = 9;
 
 	hw->sta_data_size = sizeof(struct mt7915_sta);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 0924ae074db2..11596e74712a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -389,19 +389,6 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 		status->flag |= RX_FLAG_MMIC_STRIPPED | RX_FLAG_MIC_STRIPPED;
 	}
 
-	if (!(rxd2 & MT_RXD2_NORMAL_NON_AMPDU)) {
-		status->flag |= RX_FLAG_AMPDU_DETAILS;
-
-		/* all subframes of an A-MPDU have the same timestamp */
-		if (phy->rx_ampdu_ts != rxd[14]) {
-			if (!++phy->ampdu_ref)
-				phy->ampdu_ref++;
-		}
-		phy->rx_ampdu_ts = rxd[14];
-
-		status->ampdu_ref = phy->ampdu_ref;
-	}
-
 	remove_pad = FIELD_GET(MT_RXD2_NORMAL_HDR_OFFSET, rxd2);
 
 	if (rxd2 & MT_RXD2_NORMAL_MAX_LEN_ERROR)
@@ -440,6 +427,22 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 	}
 
 	if (rxd1 & MT_RXD1_NORMAL_GROUP_2) {
+		status->timestamp = le32_to_cpu(rxd[0]);
+		status->flag |= RX_FLAG_MACTIME_START;
+
+		if (!(rxd2 & MT_RXD2_NORMAL_NON_AMPDU)) {
+			status->flag |= RX_FLAG_AMPDU_DETAILS;
+
+			/* all subframes of an A-MPDU have the same timestamp */
+			if (phy->rx_ampdu_ts != status->timestamp) {
+				if (!++phy->ampdu_ref)
+					phy->ampdu_ref++;
+			}
+			phy->rx_ampdu_ts = status->timestamp;
+
+			status->ampdu_ref = phy->ampdu_ref;
+		}
+
 		rxd += 2;
 		if ((u8 *)rxd - skb->data >= skb->len)
 			return -EINVAL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 1160d1bf8a7c..455c84cd99c2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -142,7 +142,7 @@ struct mt7915_phy {
 	u8 rdd_state;
 	int dfs_state;
 
-	__le32 rx_ampdu_ts;
+	u32 rx_ampdu_ts;
 	u32 ampdu_ref;
 
 	struct mib_stats mib;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 262c9d150bf0..6de8cfe26404 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -77,6 +77,9 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF;
 	hw->max_tx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF;
 
+	hw->radiotap_timestamp.units_pos =
+		IEEE80211_RADIOTAP_TIMESTAMP_UNIT_US;
+
 	phy->slottime = 9;
 
 	hw->sta_data_size = sizeof(struct mt7921_sta);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 6f13eef96078..cf742346f65d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -370,19 +370,6 @@ int mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 		status->flag |= RX_FLAG_MMIC_STRIPPED | RX_FLAG_MIC_STRIPPED;
 	}
 
-	if (!(rxd2 & MT_RXD2_NORMAL_NON_AMPDU)) {
-		status->flag |= RX_FLAG_AMPDU_DETAILS;
-
-		/* all subframes of an A-MPDU have the same timestamp */
-		if (phy->rx_ampdu_ts != rxd[14]) {
-			if (!++phy->ampdu_ref)
-				phy->ampdu_ref++;
-		}
-		phy->rx_ampdu_ts = rxd[14];
-
-		status->ampdu_ref = phy->ampdu_ref;
-	}
-
 	remove_pad = FIELD_GET(MT_RXD2_NORMAL_HDR_OFFSET, rxd2);
 
 	if (rxd2 & MT_RXD2_NORMAL_MAX_LEN_ERROR)
@@ -414,6 +401,22 @@ int mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 	}
 
 	if (rxd1 & MT_RXD1_NORMAL_GROUP_2) {
+		status->timestamp = le32_to_cpu(rxd[0]);
+		status->flag |= RX_FLAG_MACTIME_START;
+
+		if (!(rxd2 & MT_RXD2_NORMAL_NON_AMPDU)) {
+			status->flag |= RX_FLAG_AMPDU_DETAILS;
+
+			/* all subframes of an A-MPDU have the same timestamp */
+			if (phy->rx_ampdu_ts != status->timestamp) {
+				if (!++phy->ampdu_ref)
+					phy->ampdu_ref++;
+			}
+			phy->rx_ampdu_ts = status->timestamp;
+
+			status->ampdu_ref = phy->ampdu_ref;
+		}
+
 		rxd += 2;
 		if ((u8 *)rxd - skb->data >= skb->len)
 			return -EINVAL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 5cedefc41416..816d54374e8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -132,7 +132,7 @@ struct mt7921_phy {
 	s16 coverage_class;
 	u8 slottime;
 
-	__le32 rx_ampdu_ts;
+	u32 rx_ampdu_ts;
 	u32 ampdu_ref;
 
 	struct mib_stats mib;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
