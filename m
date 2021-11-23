Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E56DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8PHPjNxT9IblqkoiOFv5YuDz6BVqckILM3ZCbJ5j5E=; b=ZjGwu9PNKRewVl
	uuoAOPSxai5EjY8mojvMbPG7KPB3Mz08KJ59IBWr8frl9FCBkCC1/O4MYnquZXrFEOAI4EYZV4GSO
	rZ4myFqCzVf3YuyqXFTVqXOeSIkH/VeBf4LO5rkz60/8xfXZOfxyZPS7FXRY0O2OWcpwPk7zGeH6F
	1o4GHvDaW1u60iA9DFcPP+r5pmNjCMlsikhK+AHqM6VSt1FV3ptZ/+sWoIXfrxk533Rd/fDtRTDZ/
	DyIHEtz74x2CzqwALJS5tXkqvxjqDRgt1mHzvPZdvYGbLWViWzr3xfBCsx8rxFHFHBN1tHRAiqXFC
	CNFcWSocLpni/x4PG4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpQvw-001DKI-2E; Tue, 23 Nov 2021 08:13:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpQjN-0019o6-8f
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 08:00:47 +0000
X-UUID: 4031770b8be34b13baf44bdc827edbf9-20211123
X-UUID: 4031770b8be34b13baf44bdc827edbf9-20211123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1120281185; Tue, 23 Nov 2021 01:00:38 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 23:50:36 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Nov 2021 15:50:33 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 23 Nov 2021 15:50:33 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v3 07/11] mt76: mt7915: add txfree event v3
Date: Tue, 23 Nov 2021 15:49:51 +0800
Message-ID: <2c6668948989a1f1d5938da7d34df3568686eec1.1637652742.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1637652742.git.Bo.Jiao@mediatek.com>
References: <cover.1637652742.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_000045_396124_AB16EC56 
X-CRM114-Status: GOOD (  16.38  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

Update txfree v3 format.
This is an intermediate patch to add mt7916 support.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 42 ++++++++++++-------
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  8 ++--
 2 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 40e8252..8e3901b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1366,8 +1366,10 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
 	struct ieee80211_sta *sta = NULL;
 	LIST_HEAD(free_list);
 	struct sk_buff *tmp;
-	u8 i, count;
-	bool wake = false;
+	bool v3, wake = false;
+	u16 total, count = 0;
+	u32 txd = le32_to_cpu(free->txd);
+	u32 *cur_info;
 
 	/* clean DMA queues and unmap buffers first */
 	mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[MT_TXQ_PSD], false);
@@ -1377,14 +1379,12 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
 		mt76_queue_tx_cleanup(dev, mphy_ext->q_tx[MT_TXQ_BE], false);
 	}
 
-	/*
-	 * TODO: MT_TX_FREE_LATENCY is msdu time from the TXD is queued into PLE,
-	 * to the time ack is received or dropped by hw (air + hw queue time).
-	 * Should avoid accessing WTBL to get Tx airtime, and use it instead.
-	 */
-	count = FIELD_GET(MT_TX_FREE_MSDU_CNT, le16_to_cpu(free->ctrl));
-	for (i = 0; i < count; i++) {
-		u32 msdu, info = le32_to_cpu(free->info[i]);
+	total = FIELD_GET(MT_TX_FREE_MSDU_CNT, le16_to_cpu(free->ctrl));
+	v3 = (FIELD_GET(MT_TX_FREE_VER, txd) == 0x4);
+
+	for (cur_info = &free->info[0]; count < total; cur_info++) {
+		u32 msdu, info = le32_to_cpu(*cur_info);
+		u8 i;
 
 		/*
 		 * 1'b1: new wcid pair.
@@ -1395,7 +1395,6 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
 			struct mt76_wcid *wcid;
 			u16 idx;
 
-			count++;
 			idx = FIELD_GET(MT_TX_FREE_WLAN_ID, info);
 			wcid = rcu_dereference(dev->mt76.wcid[idx]);
 			sta = wcid_to_sta(wcid);
@@ -1410,12 +1409,25 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
 			continue;
 		}
 
-		msdu = FIELD_GET(MT_TX_FREE_MSDU_ID, info);
-		txwi = mt76_token_release(mdev, msdu, &wake);
-		if (!txwi)
+		if (v3 && (info & MT_TX_FREE_MPDU_HEADER))
 			continue;
 
-		mt7915_txwi_free(dev, txwi, sta, &free_list);
+		for (i = 0; i < 1 + v3; i++) {
+			if (v3) {
+				msdu = (info >> (15 * i)) & MT_TX_FREE_MSDU_ID_V3;
+				if (msdu == MT_TX_FREE_MSDU_ID_V3)
+					continue;
+			} else {
+				msdu = FIELD_GET(MT_TX_FREE_MSDU_ID, info);
+			}
+
+			txwi = mt76_token_release(mdev, msdu, &wake);
+			if (!txwi)
+				continue;
+
+			mt7915_txwi_free(dev, txwi, sta, &free_list);
+			count++;
+		}
 	}
 
 	mt7915_mac_sta_poll(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index 7a2c740..4504ebc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -298,18 +298,20 @@ struct mt7915_txp {
 struct mt7915_tx_free {
 	__le16 rx_byte_cnt;
 	__le16 ctrl;
-	u8 txd_cnt;
-	u8 rsv[3];
+	__le32 txd;
 	__le32 info[];
 } __packed __aligned(4);
 
+#define MT_TX_FREE_VER			GENMASK(18, 16)
 #define MT_TX_FREE_MSDU_CNT		GENMASK(9, 0)
 #define MT_TX_FREE_WLAN_ID		GENMASK(23, 14)
 #define MT_TX_FREE_LATENCY		GENMASK(12, 0)
 /* 0: success, others: dropped */
-#define MT_TX_FREE_STATUS		GENMASK(14, 13)
 #define MT_TX_FREE_MSDU_ID		GENMASK(30, 16)
 #define MT_TX_FREE_PAIR			BIT(31)
+#define MT_TX_FREE_MPDU_HEADER		BIT(30)
+#define MT_TX_FREE_MSDU_ID_V3		GENMASK(14, 0)
+
 /* will support this field in further revision */
 #define MT_TX_FREE_RATE			GENMASK(13, 0)
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
