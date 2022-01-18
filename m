Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F4BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 02:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9cI2eHfuhawgvO8sDXnfC2GufIwCgARlrHLqvuOW74=; b=TQpsrz9RX/l689
	s7tkVQstIThmR4eBv4/qfTuGfSVYaBDhV+8t5W3NB4Pq82A2H7mqDCC12sA4prv+eBHm6v78JYHkJ
	U4JcNtqoacT8lflSqliMiUfeKq6sBkdpQYdqip/hzEtJO13GaOojIGjdLmWMJD6m2Y+UvmJtCFCcp
	61IjPlnO5KaEZMsKpj+oo7Qf+EQmCKgIRqhhLx3+UUkqjhmxxd/0kHdFOoSyc1o9kkRj2Ay0BkLUX
	h/2wD0v++sziUAmywUv+aFFqWc8AIIkD1hjZRHTGP4olsc0agl/5ljbU5ESsb7FSv+H7igNei2DtM
	A6qCq/5VwgpPoSCJE7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9eQF-00H36r-8W; Tue, 18 Jan 2022 02:40:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eER-00GwjG-Eg; Tue, 18 Jan 2022 02:28:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2E3860AB1;
 Tue, 18 Jan 2022 02:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C1CC36AEF;
 Tue, 18 Jan 2022 02:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472902;
 bh=v+u+FK55eeNns6Q4kPKeSccsEGXeFL+oJr9NAaPDubA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eh40pJBmfGjObfNL8T8grpl6u2nXgr+ZxOR1yeUXkXCBQ8Jx9xhJKRWG4cK18Gvxn
 FWNcVY7K0Qy2HHntcW1q6CsMwWxggReF4xt8AnSoc3MgW3yPgK4GpsAL6TDA9RqQ+1
 QNo9YjdDEYLRIfsZrMMcGczB0L6i9rsdWSd1CuPPBagI2GTEvMCQJ70dI1krnP4I2v
 D0MbIFC4JVMZqObvSqH+JVYtsPlHpcvyzucta94FNkxTt/rYkNoqJq6qLWPRG2Zdnh
 HJEbL7UnIVza6GwOYdQff/6h8JRbmI/TWIr+FWq0kw/ibNuBit3oG4ttj5/eDL2LQa
 8sPFEDMpi0wkQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Deren Wu <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, sean.wang@mediatek.com,
 Soul.Huang@mediatek.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 157/217] mt76: mt7921: fix network buffer leak by
 txs missing
Date: Mon, 17 Jan 2022 21:18:40 -0500
Message-Id: <20220118021940.1942199-157-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_182823_629455_74E5BFC3 
X-CRM114-Status: GOOD (  14.25  )
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

[ Upstream commit e0bf699ad8e52330d848144a9624a067ad588bd6 ]

TXS in mt7921 may be forwared to tx_done event. Should try to catch
TXS information in tx_done event as well.

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 14 ++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 27 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 +
 4 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 27550385c35f9..4df272f93dd47 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1072,7 +1072,7 @@ mt7921_mac_add_txs_skb(struct mt7921_dev *dev, struct mt76_wcid *wcid, int pid,
 	return !!skb;
 }
 
-static void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data)
+void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data)
 {
 	struct mt7921_sta *msta = NULL;
 	struct mt76_wcid *wcid;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 6ada1ebe7d68b..46ec9f713d772 100644
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
index edc0c73f8c01c..68cb0ce013dbd 100644
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
index e9c7c3a195076..7a6c38fbb940a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -463,4 +463,5 @@ int mt7921s_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 			   struct mt76_tx_info *tx_info);
 void mt7921s_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e);
 bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update);
+void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data);
 #endif
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
