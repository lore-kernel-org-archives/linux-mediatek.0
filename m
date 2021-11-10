Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4633FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 04:19:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA17B61181
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 04:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA17B61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3PvwB10ebr3xRzg+pj/6ZaKNDS3h77EfVJysGb0paVE=; b=fE/93c1b5iBJbU
	i9Y1vofnS14iqQxhbXlOgkcNac3eyzcbSJDe/jNZKu/TfH9wYNA5UPlULR1L7pqykiT026Usvb1o1
	f/gdZfmfGx/z+MIT9pHZ+atiI4yy0SU9EQq4Pe+uqyWBweNDPaJZMymCT3qOwzfgX4BMGJo+Nm7IF
	oA28JO6wrOxk7fg9QXwIdKfexPZPcTksv+tFjf+Fr0tvKn2KQ4mFf1Q0PytNuXHEBiEOqrBisxbkw
	vWA94KlaBtM9pUzyC7GzYUFyQqA7eCHFxAtH/tUIAamlrmVQ/yScPOFNeHWdhN9giTtnwscCzPHkq
	j9xkSqOgzRz4hQzluerg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkf5T-004RDD-3p; Wed, 10 Nov 2021 04:19:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkf5O-004RCp-8J
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 04:19:49 +0000
X-UUID: ef3951bc1de34036b96501314cbcd8fe-20211109
X-UUID: ef3951bc1de34036b96501314cbcd8fe-20211109
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xing.song@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1482777939; Tue, 09 Nov 2021 21:19:43 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 20:19:41 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 10 Nov 2021 12:19:40 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 10 Nov 2021 12:19:39 +0800
From: Xing Song <xing.song@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Xing Song <xing.song@mediatek.com>
Subject: [PATCH] mt76: reverse the first fragmented frame to 802.11
Date: Wed, 10 Nov 2021 12:19:31 +0800
Message-ID: <20211110041931.176788-1-xing.song@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_201946_339262_C27E6240 
X-CRM114-Status: GOOD (  17.19  )
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

The HW can apply header translation to first fragmented frame, and
ramaining fragmented frame can only keep 802.11 format. Check and
reverse the first fragmented frame to  802.11 format to make sure
them can be defragmented by mac80211.

Signed-off-by: Xing Song <xing.song@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 90 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |  2 +
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 90 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 90 ++++++++++++++++++-
 4 files changed, 263 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 423f69015e3e..bd361c19557d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -249,6 +249,82 @@ static void mt7615_mac_fill_tm_rx(struct mt7615_phy *phy, __le32 *rxv)
 #endif
 }
 
+/* The HW does not translate the mac header to 802.3 for mesh point */
+static int mt7615_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
+{
+	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
+	struct mt7615_sta *msta = (struct mt7615_sta *)status->wcid;
+	struct ieee80211_sta *sta;
+	struct ieee80211_vif *vif;
+	struct ieee80211_hdr hdr;
+	struct ethhdr eth_hdr;
+	__le32 *rxd = (__le32 *)skb->data;
+	__le32 qos_ctrl, ht_ctrl;
+
+	if (FIELD_GET(MT_RXD1_NORMAL_ADDR_TYPE, le32_to_cpu(rxd[1])) !=
+	    MT_RXD1_NORMAL_U2M)
+		return -EINVAL;
+
+	if (!(le32_to_cpu(rxd[0]) & MT_RXD0_NORMAL_GROUP_4))
+		return -EINVAL;
+
+	if (!msta || !msta->vif)
+		return -EINVAL;
+
+	sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
+	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+
+	/* store the info from RXD and ethhdr to avoid being overridden */
+	memcpy(&eth_hdr, skb->data + hdr_gap, sizeof(eth_hdr));
+	hdr.frame_control = FIELD_GET(MT_RXD4_FRAME_CONTROL, rxd[4]);
+	hdr.seq_ctrl = FIELD_GET(MT_RXD6_SEQ_CTRL, rxd[6]);
+	qos_ctrl = FIELD_GET(MT_RXD6_QOS_CTL, rxd[6]);
+	ht_ctrl = FIELD_GET(MT_RXD7_HT_CONTROL, rxd[7]);
+
+	hdr.duration_id = 0;
+	ether_addr_copy(hdr.addr1, vif->addr);
+	ether_addr_copy(hdr.addr2, sta->addr);
+	switch (le16_to_cpu(hdr.frame_control) &
+		(IEEE80211_FCTL_TODS | IEEE80211_FCTL_FROMDS)) {
+	case 0:
+		ether_addr_copy(hdr.addr3, vif->bss_conf.bssid);
+		break;
+	case IEEE80211_FCTL_FROMDS:
+		ether_addr_copy(hdr.addr3, eth_hdr.h_source);
+		break;
+	case IEEE80211_FCTL_TODS:
+		ether_addr_copy(hdr.addr3, eth_hdr.h_dest);
+		break;
+	case IEEE80211_FCTL_TODS | IEEE80211_FCTL_FROMDS:
+		ether_addr_copy(hdr.addr3, eth_hdr.h_dest);
+		ether_addr_copy(hdr.addr4, eth_hdr.h_source);
+		break;
+	default:
+		break;
+	}
+
+	skb_pull(skb, hdr_gap + sizeof(struct ethhdr) - 2);
+	if (eth_hdr.h_proto == htons(ETH_P_AARP) ||
+	    eth_hdr.h_proto == htons(ETH_P_IPX))
+		ether_addr_copy(skb_push(skb, ETH_ALEN), bridge_tunnel_header);
+	else if (eth_hdr.h_proto >= htons(ETH_P_802_3_MIN))
+		ether_addr_copy(skb_push(skb, ETH_ALEN), rfc1042_header);
+	else
+		skb_pull(skb, 2);
+
+	if (ieee80211_has_order(hdr.frame_control))
+		memcpy(skb_push(skb, 2), &ht_ctrl, 2);
+	if (ieee80211_is_data_qos(hdr.frame_control))
+		memcpy(skb_push(skb, 2), &qos_ctrl, 2);
+	if (ieee80211_has_a4(hdr.frame_control))
+		memcpy(skb_push(skb, sizeof(hdr)), &hdr, sizeof(hdr));
+	else
+		memcpy(skb_push(skb, sizeof(hdr) - 6), &hdr, sizeof(hdr) - 6);
+
+	status->flag &= ~(RX_FLAG_RADIOTAP_HE | RX_FLAG_RADIOTAP_HE_MU);
+	return 0;
+}
+
 static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 {
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
@@ -263,6 +339,7 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	u32 rxd2 = le32_to_cpu(rxd[2]);
 	u32 csum_mask = MT_RXD0_NORMAL_IP_SUM | MT_RXD0_NORMAL_UDP_TCP_SUM;
 	bool unicast, hdr_trans, remove_pad, insert_ccmp_hdr = false;
+	u16 hdr_gap;
 	int phy_idx;
 	int i, idx;
 	u8 chfreq, amsdu_info, qos_ctl = 0;
@@ -503,14 +580,21 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 			return -EINVAL;
 	}
 
-	skb_pull(skb, (u8 *)rxd - skb->data + 2 * remove_pad);
-
 	amsdu_info = FIELD_GET(MT_RXD1_NORMAL_PAYLOAD_FORMAT, rxd1);
 	status->amsdu = !!amsdu_info;
 	if (status->amsdu) {
 		status->first_amsdu = amsdu_info == MT_RXD1_FIRST_AMSDU_FRAME;
 		status->last_amsdu = amsdu_info == MT_RXD1_LAST_AMSDU_FRAME;
-		if (!hdr_trans) {
+	}
+
+	hdr_gap = (u8 *)rxd - skb->data + 2 * remove_pad;
+	if (hdr_trans && ieee80211_has_morefrags(fc)) {
+		if (mt7615_reverse_frag0_hdr_trans(skb, hdr_gap))
+			return -EINVAL;
+		hdr_trans = false;
+	} else {
+		skb_pull(skb, hdr_gap);
+		if (!hdr_trans && status->amsdu) {
 			memmove(skb->data + 2, skb->data,
 				ieee80211_get_hdrlen_from_skb(skb));
 			skb_pull(skb, 2);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index 46f283eb8d0f..e241c613091c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -86,6 +86,8 @@ enum rx_pkt_type {
 #define MT_RXD6_SEQ_CTRL		GENMASK(15, 0)
 #define MT_RXD6_QOS_CTL			GENMASK(31, 16)
 
+#define MT_RXD7_HT_CONTROL		GENMASK(31, 0)
+
 #define MT_RXV1_ACID_DET_H		BIT(31)
 #define MT_RXV1_ACID_DET_L		BIT(30)
 #define MT_RXV1_VHTA2_B8_B3		GENMASK(29, 24)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 5fcf35f2d9fb..60e8340c8eeb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -384,6 +384,82 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 	}
 }
 
+/* The HW does not translate the mac header to 802.3 for mesh point */
+static int mt7915_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
+{
+	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
+	struct mt7915_sta *msta = (struct mt7915_sta *)status->wcid;
+	struct ieee80211_sta *sta;
+	struct ieee80211_vif *vif;
+	struct ieee80211_hdr hdr;
+	struct ethhdr eth_hdr;
+	__le32 *rxd = (__le32 *)skb->data;
+	__le32 qos_ctrl, ht_ctrl;
+
+	if (FIELD_GET(MT_RXD3_NORMAL_ADDR_TYPE, le32_to_cpu(rxd[3])) !=
+	    MT_RXD3_NORMAL_U2M)
+		return -EINVAL;
+
+	if (!(le32_to_cpu(rxd[1]) & MT_RXD1_NORMAL_GROUP_4))
+		return -EINVAL;
+
+	if (!msta || !msta->vif)
+		return -EINVAL;
+
+	sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
+	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+
+	/* store the info from RXD and ethhdr to avoid being overridden */
+	memcpy(&eth_hdr, skb->data + hdr_gap, sizeof(eth_hdr));
+	hdr.frame_control = FIELD_GET(MT_RXD6_FRAME_CONTROL, rxd[6]);
+	hdr.seq_ctrl = FIELD_GET(MT_RXD8_SEQ_CTRL, rxd[8]);
+	qos_ctrl = FIELD_GET(MT_RXD8_QOS_CTL, rxd[8]);
+	ht_ctrl = FIELD_GET(MT_RXD9_HT_CONTROL, rxd[9]);
+
+	hdr.duration_id = 0;
+	ether_addr_copy(hdr.addr1, vif->addr);
+	ether_addr_copy(hdr.addr2, sta->addr);
+	switch (le16_to_cpu(hdr.frame_control) &
+		(IEEE80211_FCTL_TODS | IEEE80211_FCTL_FROMDS)) {
+	case 0:
+		ether_addr_copy(hdr.addr3, vif->bss_conf.bssid);
+		break;
+	case IEEE80211_FCTL_FROMDS:
+		ether_addr_copy(hdr.addr3, eth_hdr.h_source);
+		break;
+	case IEEE80211_FCTL_TODS:
+		ether_addr_copy(hdr.addr3, eth_hdr.h_dest);
+		break;
+	case IEEE80211_FCTL_TODS | IEEE80211_FCTL_FROMDS:
+		ether_addr_copy(hdr.addr3, eth_hdr.h_dest);
+		ether_addr_copy(hdr.addr4, eth_hdr.h_source);
+		break;
+	default:
+		break;
+	}
+
+	skb_pull(skb, hdr_gap + sizeof(struct ethhdr) - 2);
+	if (eth_hdr.h_proto == htons(ETH_P_AARP) ||
+	    eth_hdr.h_proto == htons(ETH_P_IPX))
+		ether_addr_copy(skb_push(skb, ETH_ALEN), bridge_tunnel_header);
+	else if (eth_hdr.h_proto >= htons(ETH_P_802_3_MIN))
+		ether_addr_copy(skb_push(skb, ETH_ALEN), rfc1042_header);
+	else
+		skb_pull(skb, 2);
+
+	if (ieee80211_has_order(hdr.frame_control))
+		memcpy(skb_push(skb, 2), &ht_ctrl, 2);
+	if (ieee80211_is_data_qos(hdr.frame_control))
+		memcpy(skb_push(skb, 2), &qos_ctrl, 2);
+	if (ieee80211_has_a4(hdr.frame_control))
+		memcpy(skb_push(skb, sizeof(hdr)), &hdr, sizeof(hdr));
+	else
+		memcpy(skb_push(skb, sizeof(hdr) - 6), &hdr, sizeof(hdr) - 6);
+
+	status->flag &= ~(RX_FLAG_RADIOTAP_HE | RX_FLAG_RADIOTAP_HE_MU);
+	return 0;
+}
+
 static int
 mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 {
@@ -404,6 +480,7 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 	bool unicast, insert_ccmp_hdr = false;
 	u8 remove_pad, amsdu_info;
 	bool hdr_trans;
+	u16 hdr_gap;
 	u16 seq_ctrl = 0;
 	u8 qos_ctl = 0;
 	__le16 fc = 0;
@@ -654,14 +731,21 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 		}
 	}
 
-	skb_pull(skb, (u8 *)rxd - skb->data + 2 * remove_pad);
-
 	amsdu_info = FIELD_GET(MT_RXD4_NORMAL_PAYLOAD_FORMAT, rxd4);
 	status->amsdu = !!amsdu_info;
 	if (status->amsdu) {
 		status->first_amsdu = amsdu_info == MT_RXD4_FIRST_AMSDU_FRAME;
 		status->last_amsdu = amsdu_info == MT_RXD4_LAST_AMSDU_FRAME;
-		if (!hdr_trans) {
+	}
+
+	hdr_gap = (u8 *)rxd - skb->data + 2 * remove_pad;
+	if (hdr_trans && ieee80211_has_morefrags(fc)) {
+		if (mt7915_reverse_frag0_hdr_trans(skb, hdr_gap))
+			return -EINVAL;
+		hdr_trans = false;
+	} else {
+		skb_pull(skb, hdr_gap);
+		if (!hdr_trans && status->amsdu) {
 			memmove(skb->data + 2, skb->data,
 				ieee80211_get_hdrlen_from_skb(skb));
 			skb_pull(skb, 2);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index db3302b1576a..d7ab41773035 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -395,6 +395,82 @@ mt7921_mac_assoc_rssi(struct mt7921_dev *dev, struct sk_buff *skb)
 		mt7921_mac_rssi_iter, skb);
 }
 
+/* The HW does not translate the mac header to 802.3 for mesh point */
+static int mt7921_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
+{
+	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
+	struct mt7921_sta *msta = (struct mt7921_sta *)status->wcid;
+	struct ieee80211_sta *sta;
+	struct ieee80211_vif *vif;
+	struct ieee80211_hdr hdr;
+	struct ethhdr eth_hdr;
+	__le32 *rxd = (__le32 *)skb->data;
+	__le32 qos_ctrl, ht_ctrl;
+
+	if (FIELD_GET(MT_RXD3_NORMAL_ADDR_TYPE, le32_to_cpu(rxd[3])) !=
+	    MT_RXD3_NORMAL_U2M)
+		return -EINVAL;
+
+	if (!(le32_to_cpu(rxd[1]) & MT_RXD1_NORMAL_GROUP_4))
+		return -EINVAL;
+
+	if (!msta || !msta->vif)
+		return -EINVAL;
+
+	sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
+	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+
+	/* store the info from RXD and ethhdr to avoid being overridden */
+	memcpy(&eth_hdr, skb->data + hdr_gap, sizeof(eth_hdr));
+	hdr.frame_control = FIELD_GET(MT_RXD6_FRAME_CONTROL, rxd[6]);
+	hdr.seq_ctrl = FIELD_GET(MT_RXD8_SEQ_CTRL, rxd[8]);
+	qos_ctrl = FIELD_GET(MT_RXD8_QOS_CTL, rxd[8]);
+	ht_ctrl = FIELD_GET(MT_RXD9_HT_CONTROL, rxd[9]);
+
+	hdr.duration_id = 0;
+	ether_addr_copy(hdr.addr1, vif->addr);
+	ether_addr_copy(hdr.addr2, sta->addr);
+	switch (le16_to_cpu(hdr.frame_control) &
+		(IEEE80211_FCTL_TODS | IEEE80211_FCTL_FROMDS)) {
+	case 0:
+		ether_addr_copy(hdr.addr3, vif->bss_conf.bssid);
+		break;
+	case IEEE80211_FCTL_FROMDS:
+		ether_addr_copy(hdr.addr3, eth_hdr.h_source);
+		break;
+	case IEEE80211_FCTL_TODS:
+		ether_addr_copy(hdr.addr3, eth_hdr.h_dest);
+		break;
+	case IEEE80211_FCTL_TODS | IEEE80211_FCTL_FROMDS:
+		ether_addr_copy(hdr.addr3, eth_hdr.h_dest);
+		ether_addr_copy(hdr.addr4, eth_hdr.h_source);
+		break;
+	default:
+		break;
+	}
+
+	skb_pull(skb, hdr_gap + sizeof(struct ethhdr) - 2);
+	if (eth_hdr.h_proto == htons(ETH_P_AARP) ||
+	    eth_hdr.h_proto == htons(ETH_P_IPX))
+		ether_addr_copy(skb_push(skb, ETH_ALEN), bridge_tunnel_header);
+	else if (eth_hdr.h_proto >= htons(ETH_P_802_3_MIN))
+		ether_addr_copy(skb_push(skb, ETH_ALEN), rfc1042_header);
+	else
+		skb_pull(skb, 2);
+
+	if (ieee80211_has_order(hdr.frame_control))
+		memcpy(skb_push(skb, 2), &ht_ctrl, 2);
+	if (ieee80211_is_data_qos(hdr.frame_control))
+		memcpy(skb_push(skb, 2), &qos_ctrl, 2);
+	if (ieee80211_has_a4(hdr.frame_control))
+		memcpy(skb_push(skb, sizeof(hdr)), &hdr, sizeof(hdr));
+	else
+		memcpy(skb_push(skb, sizeof(hdr) - 6), &hdr, sizeof(hdr) - 6);
+
+	status->flag &= ~(RX_FLAG_RADIOTAP_HE | RX_FLAG_RADIOTAP_HE_MU);
+	return 0;
+}
+
 static int
 mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 {
@@ -402,6 +478,7 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	bool hdr_trans, unicast, insert_ccmp_hdr = false;
 	u8 chfreq, qos_ctl = 0, remove_pad, amsdu_info;
+	u16 hdr_gap;
 	__le32 *rxv = NULL, *rxd = (__le32 *)skb->data;
 	struct mt76_phy *mphy = &dev->mt76.phy;
 	struct mt7921_phy *phy = &dev->phy;
@@ -668,14 +745,21 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 		}
 	}
 
-	skb_pull(skb, (u8 *)rxd - skb->data + 2 * remove_pad);
-
 	amsdu_info = FIELD_GET(MT_RXD4_NORMAL_PAYLOAD_FORMAT, rxd4);
 	status->amsdu = !!amsdu_info;
 	if (status->amsdu) {
 		status->first_amsdu = amsdu_info == MT_RXD4_FIRST_AMSDU_FRAME;
 		status->last_amsdu = amsdu_info == MT_RXD4_LAST_AMSDU_FRAME;
-		if (!hdr_trans) {
+	}
+
+	hdr_gap = (u8 *)rxd - skb->data + 2 * remove_pad;
+	if (hdr_trans && ieee80211_has_morefrags(fc)) {
+		if (mt7921_reverse_frag0_hdr_trans(skb, hdr_gap))
+			return -EINVAL;
+		hdr_trans = false;
+	} else {
+		skb_pull(skb, hdr_gap);
+		if (!hdr_trans && status->amsdu) {
 			memmove(skb->data + 2, skb->data,
 				ieee80211_get_hdrlen_from_skb(skb));
 			skb_pull(skb, 2);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
