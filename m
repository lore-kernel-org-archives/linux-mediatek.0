Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AD8C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 18:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xGo/RSHXFQxxeAHb60fp+qI3rgJ8vq/VvfvuCl6dgPY=; b=tPDB8qg/x0Z7zEAsKUeraWHgOx
	z68QbQUDJ6aOEk7BInS4U+h3GfpW4vwbze9ItYmbtCvg77hyVIojXelitNWzljuXYkWe/cuet5pUq
	vZO9zWMUqjNOYhbwCCKIgFvS/KG3+MyDxbUJwma2yIHpIXeD3lQa5xToJkCJCV3cy0uvpNz8YAr1B
	u/Ft4EiEAkj1fonWcR/XwcN6sCMBS1+2qA+rNlMtulMibxcH6yGowfE7ZApCdDt8S7a/nFcUEb+1r
	EXIxa3RYptMOA6AvhPtlapxuBGL41k2B5PPOFjiw1SNWAjI6RCRBMjdJgUk6Y9YhJux7LP/69QDcX
	kA3cqvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prNd4-001y3h-05;
	Tue, 25 Apr 2023 18:43:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prNd1-001y2g-0O
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 18:43:04 +0000
X-UUID: fd72cbe4e39811edb7d8d11f642b8e78-20230425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xGo/RSHXFQxxeAHb60fp+qI3rgJ8vq/VvfvuCl6dgPY=;
	b=E6CuV+LmmSQh8BIoq3peCP4Yn5BL62EFDhDMawhGd308Dd/lJJzKjk0YU0qVscXRqbyzCxQoPoXh7ARnzaInOezuvazHULm/wpqluDFqyv3kF+x+mGgtuTn14EdxpEuFOR0O1BItKaT9Gs48LnSxlwyJvPt5lay0VVEm36kU0X8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:b6651cad-0203-4fa2-9eca-160bb4ea6502,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:03691eec-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: fd72cbe4e39811edb7d8d11f642b8e78-20230425
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 861940270; Tue, 25 Apr 2023 11:42:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Apr 2023 02:32:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 26 Apr 2023 02:32:16 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 1/3] wifi: mt76: mt7915: rework tx packets counting when WED is active
Date: Wed, 26 Apr 2023 02:32:13 +0800
Message-ID: <8febf5d1f44e7f0b1e9f6ca099bd5ffcc8816f86.1682446940.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_114303_164011_DBCBD81F 
X-CRM114-Status: GOOD (  17.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Chiu <chui-hao.chiu@mediatek.com>

PPDU TxS can only report MPDU count whereas mac80211 requires MSDU scale
(NL80211_STA_INFO_TX_PACKETS), so switch to get MSDU counts from WA
statistic.

Note that mt7915 WA firmware only counts tx_packet for WED path, so driver
needs to take care of host path additionally.

Fixes: 43eaa3689507 ("wifi: mt76: add PPDU based TxS support for WED device")
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
change since v2
- split to small patch mt7921 crashes
- swap wcid->stats.tx_packets check condition to avoid mt7921 crash
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  2 +-
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |  6 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  6 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 74 +++++++++++++++++--
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 6 files changed, 77 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 6b07b8fafec2..0e9f4197213a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -277,7 +277,7 @@ struct mt76_sta_stats {
 	u64 tx_mcs[16];		/* mcs idx */
 	u64 tx_bytes;
 	/* WED TX */
-	u32 tx_packets;
+	u32 tx_packets;		/* unit: MSDU */
 	u32 tx_retries;
 	u32 tx_failed;
 	/* WED RX */
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index d39a3cc5e381..f2237ae7c4d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -523,7 +523,9 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 
 		/* counting non-offloading skbs */
 		wcid->stats.tx_bytes += skb->len;
-		wcid->stats.tx_packets++;
+		/* mt7915 WA only counts WED path */
+		if (is_mt7915(dev) && mtk_wed_device_active(&dev->mmio.wed))
+			wcid->stats.tx_packets++;
 	}
 
 	val = FIELD_PREP(MT_TXD0_TX_BYTES, skb->len + sz_txd) |
@@ -610,8 +612,6 @@ bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, struct mt76_wcid *wcid,
 		stats->tx_bytes +=
 			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_BYTE) -
 			le32_get_bits(txs_data[7], MT_TXS7_MPDU_RETRY_BYTE);
-		stats->tx_packets +=
-			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_CNT);
 		stats->tx_failed +=
 			le32_get_bits(txs_data[6], MT_TXS6_MPDU_FAIL_CNT);
 		stats->tx_retries +=
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index ca1ce97a6d2f..7a52b68491b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -998,6 +998,7 @@ enum {
 	MCU_EXT_EVENT_ASSERT_DUMP = 0x23,
 	MCU_EXT_EVENT_RDD_REPORT = 0x3a,
 	MCU_EXT_EVENT_CSA_NOTIFY = 0x4f,
+	MCU_EXT_EVENT_WA_TX_STAT = 0x74,
 	MCU_EXT_EVENT_BCC_NOTIFY = 0x75,
 	MCU_EXT_EVENT_MURU_CTRL = 0x9f,
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 61157248d742..b306a4fae1fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1043,8 +1043,10 @@ static void mt7915_sta_statistics(struct ieee80211_hw *hw,
 		sinfo->tx_bytes = msta->wcid.stats.tx_bytes;
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BYTES64);
 
-		sinfo->tx_packets = msta->wcid.stats.tx_packets;
-		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_PACKETS);
+		if (!mt7915_mcu_wed_wa_tx_stats(phy->dev, msta->wcid.idx)) {
+			sinfo->tx_packets = msta->wcid.stats.tx_packets;
+			sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_PACKETS);
+		}
 
 		if (mtk_wed_get_rx_capa(&phy->dev->mt76.mmio.wed)) {
 			sinfo->rx_bytes = msta->wcid.stats.rx_bytes;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 9fcb22fa1f97..5916dcaa8c7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -164,7 +164,9 @@ mt7915_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 	}
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
-	if (seq != rxd->seq)
+	if (seq != rxd->seq &&
+	    !(rxd->eid == MCU_CMD_EXT_CID &&
+	      rxd->ext_eid == MCU_EXT_EVENT_WA_TX_STAT))
 		return -EAGAIN;
 
 	if (cmd == MCU_CMD(PATCH_SEM_CONTROL)) {
@@ -395,12 +397,14 @@ void mt7915_mcu_rx_event(struct mt7915_dev *dev, struct sk_buff *skb)
 	struct mt76_connac2_mcu_rxd *rxd;
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
-	if (rxd->ext_eid == MCU_EXT_EVENT_THERMAL_PROTECT ||
-	    rxd->ext_eid == MCU_EXT_EVENT_FW_LOG_2_HOST ||
-	    rxd->ext_eid == MCU_EXT_EVENT_ASSERT_DUMP ||
-	    rxd->ext_eid == MCU_EXT_EVENT_PS_SYNC ||
-	    rxd->ext_eid == MCU_EXT_EVENT_BCC_NOTIFY ||
-	    !rxd->seq)
+	if ((rxd->ext_eid == MCU_EXT_EVENT_THERMAL_PROTECT ||
+	     rxd->ext_eid == MCU_EXT_EVENT_FW_LOG_2_HOST ||
+	     rxd->ext_eid == MCU_EXT_EVENT_ASSERT_DUMP ||
+	     rxd->ext_eid == MCU_EXT_EVENT_PS_SYNC ||
+	     rxd->ext_eid == MCU_EXT_EVENT_BCC_NOTIFY ||
+	     !rxd->seq) &&
+	     !(rxd->eid == MCU_CMD_EXT_CID &&
+	       rxd->ext_eid == MCU_EXT_EVENT_WA_TX_STAT))
 		mt7915_mcu_rx_unsolicited_event(dev, skb);
 	else
 		mt76_mcu_rx_event(&dev->mt76, skb);
@@ -3733,6 +3737,62 @@ int mt7915_mcu_twt_agrt_update(struct mt7915_dev *dev,
 				 &req, sizeof(req), true);
 }
 
+int mt7915_mcu_wed_wa_tx_stats(struct mt7915_dev *dev, u16 wlan_idx)
+{
+	struct {
+		__le32 cmd;
+		__le32 num;
+		__le32 __rsv;
+		__le16 wlan_idx;
+	} req = {
+		.cmd = cpu_to_le32(0x15),
+		.num = cpu_to_le32(1),
+		.wlan_idx = cpu_to_le16(wlan_idx),
+	};
+	struct mt7915_mcu_wa_tx_stat {
+		__le16 wlan_idx;
+		u8 __rsv[2];
+
+		/* tx_bytes is deprecated since WA byte counter uses u32,
+		 * which easily leads to overflow.
+		 */
+		__le32 tx_bytes;
+		__le32 tx_packets;
+	} *res;
+	struct mt76_wcid *wcid;
+	struct sk_buff *skb;
+	int ret;
+
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_WA_PARAM_CMD(QUERY),
+					&req, sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+
+	if (!is_mt7915(&dev->mt76))
+		skb_pull(skb, 4);
+
+	res = (struct mt7915_mcu_wa_tx_stat *)skb->data;
+
+	if (le16_to_cpu(res->wlan_idx) != wlan_idx) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	rcu_read_lock();
+
+	wcid = rcu_dereference(dev->mt76.wcid[wlan_idx]);
+	if (wcid)
+		wcid->stats.tx_packets += le32_to_cpu(res->tx_packets);
+	else
+		ret = -EINVAL;
+
+	rcu_read_unlock();
+out:
+	dev_kfree_skb(skb);
+
+	return ret;
+}
+
 int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u32 regidx, u32 *val, bool set)
 {
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index b3ead3530740..3053f4abf7db 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -539,6 +539,7 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
 int mt7915_mcu_rdd_background_enable(struct mt7915_phy *phy,
 				     struct cfg80211_chan_def *chandef);
+int mt7915_mcu_wed_wa_tx_stats(struct mt7915_dev *dev, u16 wcid);
 int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u32 regidx, u32 *val, bool set);
 int mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3);
 int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 type, u8 ctrl);
-- 
2.18.0


