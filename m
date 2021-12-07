Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6ADC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rFt2bg692h0OiLEvN2LyMkQLZXk/3LyX4SQ8bgF3XE8=; b=NYR2+BldWP4u1u
	eRO35waYlDcWe5IJ/p5/6TsNbSV7aI2gTcd5Q33rEwxE6unCrFKUfzSWxyr9Xp4icKPZhTAB2GyRi
	gaon7ORWv+xOCcKaJTQBMTWFxzDcWUCWxCRE7tC5BzNPNjazDx+cF9il6P0mKfEMcZwtnRLFPhAkP
	8Tmf964Dg2o5GQVVgpHEnzW23RLr5kCk+qep+xJoR8tcxa0ZJI3HeuIGPRQqxCW5aQr79silpG8kW
	Ix0CnqTSaPHBl2nPmSWVDfSMssXOkWg13+LdIXCrdc8wwqz/h8AJcewimYduKQU7sv8Cgjdp7t3jJ
	/o3HNP1/kbSV8E/3kE3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mudtw-009Vyn-Gh; Tue, 07 Dec 2021 17:05:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mudts-009Vxv-BN
 for linux-mediatek@lists.infradead.org; Tue, 07 Dec 2021 17:05:11 +0000
X-UUID: 51a63a9d60354bd8990633f9a9dc7fbc-20211207
X-UUID: 51a63a9d60354bd8990633f9a9dc7fbc-20211207
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 482295996; Tue, 07 Dec 2021 10:05:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 09:05:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Dec 2021 01:05:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Dec 2021 01:05:00 +0800
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
Subject: [PATCH] mt76: mt7921: fix network buffer leak by txs missing
Date: Wed, 8 Dec 2021 01:04:44 +0800
Message-ID: <7f6efbd8e749b21bec2257c54b8258ebe89738fe.1638795555.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_090508_425858_74EBF43C 
X-CRM114-Status: GOOD (  12.98  )
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
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 17 ++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 27 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 +
 4 files changed, 46 insertions(+), 1 deletion(-)

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
index 1227d626e9d3..8f58af4e29c6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -418,6 +418,20 @@ mt7921_mcu_low_power_event(struct mt7921_dev *dev, struct sk_buff *skb)
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
+	if (event->pid < MT_PACKET_ID_FIRST)
+		return;
+
+	mt7921_mac_add_txs(dev, event->txs);
+}
+
 static void
 mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct sk_buff *skb)
 {
@@ -445,6 +459,9 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct sk_buff *skb)
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
index edc0c73f8c01..821af6e8d99a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
@@ -91,6 +91,33 @@ enum {
 	MCU_EVENT_COREDUMP = 0xf0,
 };
 
+struct mt7921_mcu_tx_done_event {
+	u8 pid;
+	u8 status;
+	u16 seq;
+
+	u8 wlan_idx;
+	u8 tx_cnt;
+	u16 tx_rate;
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
+	u32 delay;
+	u32 timestamp;
+	u32 applied_flag;
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
