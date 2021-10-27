Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BABBC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:20:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A2460F56
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15A2460F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u17H0wAvr0GBApJXz2rg2SC+G11bEmmaOQ1PalZlhIo=; b=3jCEBtzwgGmPZH
	d6+0PXYVwvnYRrxahiGV1DTPJ/P3OZ/r0Qi4/su/ZTjeJ6+9hlopmZ8I+EkAFc7EVcwDRKzZn8F6z
	qYUvk83YrRyjZjHLf7k7FLaAcTfIIVCZWd3HrCgO+kC6UtkwM7ea+tQysgNX33I4BE3XcjImoSXTS
	CieFb3SkkTgtmfmmhHsrJ6Y118US39KjUIIejlHXDSOVEVibo5xE0Vmot8E7wCR1nNmdIOA4q8E8M
	sIn9IjHFEDKiXX+fJfr8XvCGkdHCKwZpanBU9Vu7s9iOb+VXDctcaQ8/SeiYAXwGhwwA4HHrEZicb
	wP5u5wTe1/R6FUE0wztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mff67-004PFo-5z; Wed, 27 Oct 2021 09:19:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mff64-004PEl-F7
 for linux-mediatek@lists.infradead.org; Wed, 27 Oct 2021 09:19:50 +0000
X-UUID: abc3b56e296843128fe0ba448d1889f2-20211027
X-UUID: abc3b56e296843128fe0ba448d1889f2-20211027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 860948901; Wed, 27 Oct 2021 02:19:45 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 02:09:47 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Oct 2021 16:40:36 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 27 Oct 2021 16:40:36 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH 07/11] mt76: mt7915: add txfree event v3
Date: Wed, 27 Oct 2021 16:40:15 +0800
Message-ID: <32a32da281122974643ff10926ed1035414c1a1f.1635323366.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1635323366.git.Bo.Jiao@mediatek.com>
References: <cover.1635323366.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_021948_539881_0004DD1E 
X-CRM114-Status: GOOD (  15.66  )
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
index 4212dbb..d2f0537 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1282,8 +1282,10 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
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
@@ -1293,14 +1295,12 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
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
@@ -1311,7 +1311,6 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
 			struct mt76_wcid *wcid;
 			u16 idx;
 
-			count++;
 			idx = FIELD_GET(MT_TX_FREE_WLAN_ID, info);
 			wcid = rcu_dereference(dev->mt76.wcid[idx]);
 			sta = wcid_to_sta(wcid);
@@ -1326,12 +1325,25 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb)
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
