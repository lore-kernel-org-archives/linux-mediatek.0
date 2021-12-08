Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A311CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SStvFicyO/mzMjheLZAtjhAwkrq+JI1XVb+ZqB2L/Hs=; b=X5TfO+GiN3gqR5
	HkiEEOGpNdqVMGcmxpLzWZKjlYeVGl2Oi7XEuBOlTr3Kp8w39Jl/pNSvjabatiQf08zj6S1u//lGr
	IUwIm6XqzGfRIQMechcunpzcD6dPlvff/SriN26407GD3Bl3w0TC7+UPf7l23ZKcexJhwnQeLdVFP
	T7m9TjyaJo2X+yk5wnXucxN6OVn9GjEs33m510kG2XAkiQhmaW41Q5S2SxDjetFOlgwh6eNlzRXL7
	N6R0DHihLwDy+4eEsFtyf5/jEOmhThh20FAw6f+O8s//VRoKLGUuRoGUmMVv/48Zmu7OVJI0EBHYO
	t0j7EoHacdvvljYlH98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muyQm-00D5HT-3D; Wed, 08 Dec 2021 15:00:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muyQj-00D5GY-LL
 for linux-mediatek@lists.infradead.org; Wed, 08 Dec 2021 15:00:27 +0000
X-UUID: e57cdcf89fdf45f590dcee65c8634554-20211208
X-UUID: e57cdcf89fdf45f590dcee65c8634554-20211208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1931438328; Wed, 08 Dec 2021 08:00:20 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 07:00:18 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 8 Dec 2021 23:00:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Dec 2021 23:00:10 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2] mt76: mt7921: fix network buffer leak by txs missing
Date: Wed, 8 Dec 2021 22:59:55 +0800
Message-ID: <f7ea8ae1ec5b7247b105818f981b67bcd61ac4f6.1638975314.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_070025_733360_1CBB649E 
X-CRM114-Status: GOOD (  11.80  )
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

From: Deren Wu <deren.wu@mediatek.com>

TXS in mt7921 may be forwared to tx_done event. Should try to catch
TXS information in tx_done event as well.

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
v2:
  * remove redundant pid check
  * fix endianness of mt7921_mcu_tx_done_event
---
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 14 ++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 27 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 +
 4 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index edf54b192f37..2514708e9ac8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1150,7 +1150,7 @@ mt7921_mac_add_txs_skb(struct mt7921_dev *dev, struct mt76_wcid *wcid, int pid,
 	return !!skb;
 }
 
-static void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data)
+void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data)
 {
 	struct mt7921_sta *msta = NULL;
 	struct mt76_wcid *wcid;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 1227d626e9d3..0412aa9676e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -418,6 +418,17 @@ mt7921_mcu_low_power_event(struct mt7921_dev *dev, struct sk_buff *skb)
 	trace_lp_event(dev, event->state);
 }
 
+static void
+mt7921_mcu_tx_done_event(struct mt7921_dev *dev, struct sk_buff *skb)
+{
+	struct mt7921_mcu_tx_done_event *event;
+
+	skb_pull(skb, sizeof(struct mt7921_mcu_rxd));
+	event = (struct mt7921_mcu_tx_done_event *)skb->data;
+
+	mt7921_mac_add_txs(dev, event->txs);
+}
+
 static void
 mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct sk_buff *skb)
 {
@@ -445,6 +456,9 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct sk_buff *skb)
 	case MCU_EVENT_LP_INFO:
 		mt7921_mcu_low_power_event(dev, skb);
 		break;
+	case MCU_EVENT_TX_DONE:
+		mt7921_mcu_tx_done_event(dev, skb);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
index edc0c73f8c01..68cb0ce013db 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
@@ -91,6 +91,33 @@ enum {
 	MCU_EVENT_COREDUMP = 0xf0,
 };
 
+struct mt7921_mcu_tx_done_event {
+	u8 pid;
+	u8 status;
+	__le16 seq;
+
+	u8 wlan_idx;
+	u8 tx_cnt;
+	__le16 tx_rate;
+
+	u8 flag;
+	u8 tid;
+	u8 rsp_rate;
+	u8 mcs;
+
+	u8 bw;
+	u8 tx_pwr;
+	u8 reason;
+	u8 rsv0[1];
+
+	__le32 delay;
+	__le32 timestamp;
+	__le32 applied_flag;
+	u8 txs[28];
+
+	u8 rsv1[32];
+} __packed;
+
 /* ext event table */
 enum {
 	MCU_EXT_EVENT_RATE_REPORT = 0x87,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index d6b823713ba3..96647801850a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -464,4 +464,5 @@ int mt7921s_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 			   struct mt76_tx_info *tx_info);
 void mt7921s_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e);
 bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update);
+void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data);
 #endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
