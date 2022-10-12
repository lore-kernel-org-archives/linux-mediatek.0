Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD01C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 00:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gotXpdlU/PAS/RGYbhW5477ksHxMEs91rAGu5DbfOWo=; b=kh/Lu23PIX+VZe4S4uL/rnoif1
	adhF9SkBrU59ttUDpirzIIMsLpxwR/pN/dd+R+BwpzKIQCMto+ZbI4CVV7OHes9ZrseMBY0IMCDoi
	rSifqAClwwTw3WSLJQaKau/gx5aLl9H2ZvuZqi57t+PG41T/u9gfZtnDqjCW7TaZlJfyWgQPpvGkm
	d4OI1+6gAn4pqlWMYmVmivOlWHjH74JUQD3TqHM+oJsu4w4wxp4nyunepg21LoZhnSL/o5ybkhdMK
	Jh5cQDn87E706B0G/NO2/COul/oeDqUqqi6VF6N2WB0F4hQxDK9/u/Ea2gAv167Kt8hDIb7SStrCn
	5FZptewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiPQc-006JKc-5z; Wed, 12 Oct 2022 00:16:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiPQZ-006JJW-IO
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 00:16:52 +0000
X-UUID: 57f2942735cf4abebae8b748cbacefe7-20221011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gotXpdlU/PAS/RGYbhW5477ksHxMEs91rAGu5DbfOWo=;
	b=psXHsSvzm1PlzzjLbGVgkFPa8E8bs2wF3fSNh8VX0a08HXhinWejRr0bsvh2GOqsND+zbUdnhazK64la0CgD2HdR5/rBcXViqZlsOdNNgXchwNNgSR1eCApSbmYVWYe+v7qjfGEL+IHM7KkcVQkbAk0L14UcFc/3/W/aKGNB+W4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3c69a635-b442-4968-80c9-999e136a7c22,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:04c72a01-cdeb-479d-93af-53f947adce9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 57f2942735cf4abebae8b748cbacefe7-20221011
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1476404045; Tue, 11 Oct 2022 17:16:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 12 Oct 2022 08:16:28 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 12 Oct 2022 08:16:28 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 4/7] wifi: mt76: mt7921: drop ieee80211_[start, stop]_queues in driver
Date: Wed, 12 Oct 2022 08:16:18 +0800
Message-ID: <37425af2d0f923c9230154f303f1e0a040bce0ba.1665533390.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8d784dba38cfb2183af2e4d9fc822a27ef34dcd2.1665533390.git.objelf@gmail.com>
References: <8d784dba38cfb2183af2e4d9fc822a27ef34dcd2.1665533390.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_171651_647894_8BE9E505 
X-CRM114-Status: GOOD (  10.04  )
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

From: Sean Wang <sean.wang@mediatek.com>

The firmware would be in charge of braking and continuing the traffic while
the channel contexts are switching between different BSS and HW SCAN in the
background.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: drop mt7921_mcu_bss_event that is unused any more
---
 .../net/wireless/mediatek/mt76/mt7921/mcu.c    | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 2b36c5f6eb40..7a74abecb269 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -199,20 +199,6 @@ mt7921_mcu_connection_loss_event(struct mt7921_dev *dev, struct sk_buff *skb)
 					mt7921_mcu_connection_loss_iter, event);
 }
 
-static void
-mt7921_mcu_bss_event(struct mt7921_dev *dev, struct sk_buff *skb)
-{
-	struct mt76_phy *mphy = &dev->mt76.phy;
-	struct mt76_connac_mcu_bss_event *event;
-
-	skb_pull(skb, sizeof(struct mt76_connac2_mcu_rxd));
-	event = (struct mt76_connac_mcu_bss_event *)skb->data;
-	if (event->is_absent)
-		ieee80211_stop_queues(mphy->hw);
-	else
-		ieee80211_wake_queues(mphy->hw);
-}
-
 static void
 mt7921_mcu_debug_msg_event(struct mt7921_dev *dev, struct sk_buff *skb)
 {
@@ -279,9 +265,6 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct sk_buff *skb)
 	case MCU_EVENT_SCAN_DONE:
 		mt7921_mcu_scan_event(dev, skb);
 		return;
-	case MCU_EVENT_BSS_ABSENCE:
-		mt7921_mcu_bss_event(dev, skb);
-		break;
 	case MCU_EVENT_DBG_MSG:
 		mt7921_mcu_debug_msg_event(dev, skb);
 		break;
@@ -341,7 +324,6 @@ void mt7921_mcu_rx_event(struct mt7921_dev *dev, struct sk_buff *skb)
 	if (rxd->ext_eid == MCU_EXT_EVENT_RATE_REPORT ||
 	    rxd->eid == MCU_EVENT_BSS_BEACON_LOSS ||
 	    rxd->eid == MCU_EVENT_SCHED_SCAN_DONE ||
-	    rxd->eid == MCU_EVENT_BSS_ABSENCE ||
 	    rxd->eid == MCU_EVENT_SCAN_DONE ||
 	    rxd->eid == MCU_EVENT_TX_DONE ||
 	    rxd->eid == MCU_EVENT_DBG_MSG ||
-- 
2.25.1


