Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04F7C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8QTO1WD8W7HV/SL8ZRpB5UQg+fY0vtSUDxlHLxfK2dU=; b=EsyFF+jOePVUU7KHPGZPO1UMWo
	8C1hYO4yUQuULWNr1x0h2FwdrzX0modjXXWrdTv2L4SBwr5XuJKl3WHtyafmxcXt1UPY8863+EPjN
	ZrsJ2/hak8DJ1B4qXtK9/qBhEVl3c5H3XPL4IiNN6SbvGRZCPb2sF8Ra9WuYLaQzJ2fDuinI5iMOr
	ThUA+3eQXwrYNd0ic1QBu7pUjcgnAS9heKxhiBUUIcNDR3jRRwb+ZdsTtM++F0HaPlpn8fYuILWeR
	wez0pdUNTwY+YyX92V4G32sa98kYqYqZULPYdogFTNZ90pFAXtdEOUtLtkyCcK/A77N5MjgVyJxrD
	rxAZ6D6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psVaS-00BnEZ-17;
	Fri, 28 Apr 2023 21:25:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psVaP-00BnCX-2m
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Apr 2023 21:25:03 +0000
X-UUID: 1e2accc8e60b11ed912e1518a6540028-20230428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8QTO1WD8W7HV/SL8ZRpB5UQg+fY0vtSUDxlHLxfK2dU=;
	b=KhbKXlmuh2xpeoxTHGfABwEBtK7HJwGtRF3mAi0Z0qDq5TAwTyLNTdMGad445FUc8MUwG/8NSeYGdfekf3g4Fllk9D91ettcOb3fi4viNicwOcG6G12MzQz9WRRp1QPDUVrox2tdDN9KXnaa6AlBBhDHDhiqf1CIqFV0DLh89Ps=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:c733629c-6e08-424a-8464-6e99911a4e90,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:ba87416a-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 1e2accc8e60b11ed912e1518a6540028-20230428
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 881163559; Fri, 28 Apr 2023 14:24:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Sat, 29 Apr 2023 05:04:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 29 Apr 2023 05:04:51 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v4] wifi: mt76: mt7915: report tx retries/failed counts for non-WED path
Date: Sat, 29 Apr 2023 05:04:49 +0800
Message-ID: <285a241e695a10d108435a7b624c90f3c66f379b.1682715662.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_142502_045517_B587BC13 
X-CRM114-Status: GOOD (  16.14  )
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

Get missing tx retries/failed counts from txfree done events and report
them via mt7915_sta_statistics().

Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v4 - switch from Tx latency report to enable Tx count in txfree path for non-v3 format
v3 - add a missing check for mt7921
v2 - add a missing check for non-v3 format
---
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |  4 +++-
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  2 ++
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 22 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  7 +++++-
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 12 +++++-----
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  3 +++
 6 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index d39a3cc5e381..1fd36f9375ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -738,7 +738,9 @@ bool mt76_connac2_mac_add_txs_skb(struct mt76_dev *dev, struct mt76_wcid *wcid,
 		info->status.ampdu_ack_len = !noacked;
 		info->status.rates[0].idx = -1;
 
-		wcid->stats.tx_failed += noacked;
+		/* avoid double counting if dev supports txfree event */
+		if (is_mt7921(dev))
+			wcid->stats.tx_failed += noacked;
 
 		mt76_connac2_mac_fill_txs(dev, wcid, txs_data);
 		mt76_tx_status_skb_done(dev, skb, &list);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index ac2049f49bb3..8d6e09605dc4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -581,6 +581,8 @@ void mt7915_mac_init(struct mt7915_dev *dev)
 
 	if (!is_mt7915(&dev->mt76))
 		mt76_clear(dev, MT_MDP_DCR2, MT_MDP_DCR2_RX_TRANS_SHORT);
+	else
+		mt76_clear(dev, MT_PLE_HOST_RPT0, MT_PLE_HOST_RPT0_TX_LATENCY);
 
 	/* enable hardware de-agg */
 	mt76_set(dev, MT_MDP_DCR0, MT_MDP_DCR0_DAMSDU_EN);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 7df8d95fc3fb..9b2ccd99854e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -951,6 +951,7 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, void *data, int len)
 	struct mt76_dev *mdev = &dev->mt76;
 	struct mt76_txwi_cache *txwi;
 	struct ieee80211_sta *sta = NULL;
+	struct mt76_wcid *wcid = NULL;
 	LIST_HEAD(free_list);
 	void *end = data + len;
 	bool v3, wake = false;
@@ -977,7 +978,6 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, void *data, int len)
 		info = le32_to_cpu(*cur_info);
 		if (info & MT_TX_FREE_PAIR) {
 			struct mt7915_sta *msta;
-			struct mt76_wcid *wcid;
 			u16 idx;
 
 			idx = FIELD_GET(MT_TX_FREE_WLAN_ID, info);
@@ -994,7 +994,25 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, void *data, int len)
 			continue;
 		}
 
-		if (v3 && (info & MT_TX_FREE_MPDU_HEADER))
+		if (!mtk_wed_device_active(&mdev->mmio.wed) && wcid) {
+			u32 tx_retries = 0, tx_failed = 0;
+
+			if (v3 && (info & MT_TX_FREE_MPDU_HEADER_V3)) {
+				tx_retries =
+					FIELD_GET(MT_TX_FREE_COUNT_V3, info) - 1;
+				tx_failed = tx_retries +
+					!!FIELD_GET(MT_TX_FREE_STAT_V3, info);
+			} else if (!v3 && (info & MT_TX_FREE_MPDU_HEADER)) {
+				tx_retries =
+					FIELD_GET(MT_TX_FREE_COUNT, info) - 1;
+				tx_failed = tx_retries +
+					!!FIELD_GET(MT_TX_FREE_STAT, info);
+			}
+			wcid->stats.tx_retries += tx_retries;
+			wcid->stats.tx_failed += tx_failed;
+		}
+
+		if (v3 && (info & MT_TX_FREE_MPDU_HEADER_V3))
 			continue;
 
 		for (i = 0; i < 1 + v3; i++) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index ce94f87e2042..448b1b380190 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -9,7 +9,12 @@
 #define MT_TX_FREE_VER			GENMASK(18, 16)
 #define MT_TX_FREE_MSDU_CNT_V0		GENMASK(6, 0)
 /* 0: success, others: dropped */
-#define MT_TX_FREE_MPDU_HEADER		BIT(30)
+#define MT_TX_FREE_COUNT		GENMASK(12, 0)
+#define MT_TX_FREE_COUNT_V3		GENMASK(27, 24)
+#define MT_TX_FREE_STAT			GENMASK(14, 13)
+#define MT_TX_FREE_STAT_V3		GENMASK(29, 28)
+#define MT_TX_FREE_MPDU_HEADER		BIT(15)
+#define MT_TX_FREE_MPDU_HEADER_V3	BIT(30)
 #define MT_TX_FREE_MSDU_ID_V3		GENMASK(14, 0)
 
 #define MT_TXS5_F0_FINAL_MPDU		BIT(31)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 2ada2806de66..61157248d742 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1046,12 +1046,6 @@ static void mt7915_sta_statistics(struct ieee80211_hw *hw,
 		sinfo->tx_packets = msta->wcid.stats.tx_packets;
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_PACKETS);
 
-		sinfo->tx_failed = msta->wcid.stats.tx_failed;
-		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
-
-		sinfo->tx_retries = msta->wcid.stats.tx_retries;
-		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
-
 		if (mtk_wed_get_rx_capa(&phy->dev->mt76.mmio.wed)) {
 			sinfo->rx_bytes = msta->wcid.stats.rx_bytes;
 			sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_BYTES64);
@@ -1061,6 +1055,12 @@ static void mt7915_sta_statistics(struct ieee80211_hw *hw,
 		}
 	}
 
+	sinfo->tx_failed = msta->wcid.stats.tx_failed;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
+
+	sinfo->tx_retries = msta->wcid.stats.tx_retries;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
+
 	sinfo->ack_signal = (s8)msta->ack_signal;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index c8e478a55081..71fa9576ad0e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -145,6 +145,9 @@ enum offs_rev {
 #define MT_PLE_BASE			0x820c0000
 #define MT_PLE(ofs)			(MT_PLE_BASE + (ofs))
 
+#define MT_PLE_HOST_RPT0		MT_PLE(0x030)
+#define MT_PLE_HOST_RPT0_TX_LATENCY	BIT(3)
+
 #define MT_FL_Q_EMPTY			MT_PLE(__OFFS(PLE_FL_Q_EMPTY))
 #define MT_FL_Q0_CTRL			MT_PLE(__OFFS(PLE_FL_Q_CTRL))
 #define MT_FL_Q2_CTRL			MT_PLE(__OFFS(PLE_FL_Q_CTRL) + 0x8)
-- 
2.18.0


