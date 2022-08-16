Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ACEC28B2B
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 00:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kks1+04ffNeywQT8IduI0FRGW381wiMWLT2c4yfAG/o=; b=PFFDwLAAc9+WskAtQvcbVPz/vg
	hMRUtU3S9hoS5YKbgSS9lwSmu8Fg6FDQbjvUdJejRn4sTVbJ1PL18erL3En3qTLsAxkCAQFsoVTka
	cpfMQyUZ1rdvxyLgNUvvf6cvcmAr8OJz8ap8hPu4Q2Jx1qF2OQsk4/inZrYg3YNuuapLVOKDHJlA0
	FicNYFDv3KGLS2b4TTU93DBHSf9U+gTNwyN499T72S6jSiG7dX8r16b/Wwp9BuRDdjgul1LKdJqN6
	XxgmZ0+RM++3n6haOPwPQb7Snq68q6Oj43omsCxwy8gA4d+NiN8Ow3NEY3Ee0iGaHcJXWZCtPelsJ
	R7zkQQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNk4j-007lMp-IR; Tue, 16 Aug 2022 00:04:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNk4d-007lEa-FC
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 00:04:51 +0000
X-UUID: acb26c3bfd5e4a20a74814170968999a-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Kks1+04ffNeywQT8IduI0FRGW381wiMWLT2c4yfAG/o=;
	b=QyBNijFNMzRAfYqRTGJg7dUNduHC8oxvkk22rtuB1PPq8m+hRDTsTmPIdM1NAYYX3kVt90zQpZFk7yo3D8s1+pJ27xaD4yrCSGL54yrNqUUOXFLwdzvLwPez+q0g58rRDmK2NoRDc7wMAQIzfrkr5LJuV69H8yyd2KfT9vEwsuw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:a6c2f445-f2ba-4027-aebc-364fc40c33b8,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:5
X-CID-META: VersionHash:3d8acc9,CLOUDID:7d1663fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: acb26c3bfd5e4a20a74814170968999a-20220815
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1098706431; Mon, 15 Aug 2022 17:04:39 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Aug 2022 08:04:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 08:04:17 +0800
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
Subject: [PATCH 6/9] wifi: mt76: mt7921: drop ieee80211_[start, stop]_queues in driver
Date: Tue, 16 Aug 2022 08:03:44 +0800
Message-ID: <44acac2a0c1ce4a5d554a24227f80c6ccb3af878.1660606893.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1660606893.git.objelf@gmail.com>
References: <cover.1660606893.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_170447_606134_53AD8DC4 
X-CRM114-Status: GOOD (  10.15  )
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
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 76c8afc00c24..05b625e02265 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -175,15 +175,13 @@ mt7921_mcu_connection_loss_event(struct mt7921_dev *dev, struct sk_buff *skb)
 static void
 mt7921_mcu_bss_event(struct mt7921_dev *dev, struct sk_buff *skb)
 {
-	struct mt76_phy *mphy = &dev->mt76.phy;
 	struct mt76_connac_mcu_bss_event *event;
 
 	skb_pull(skb, sizeof(struct mt76_connac2_mcu_rxd));
 	event = (struct mt76_connac_mcu_bss_event *)skb->data;
-	if (event->is_absent)
-		ieee80211_stop_queues(mphy->hw);
-	else
-		ieee80211_wake_queues(mphy->hw);
+
+	dev_dbg(dev->mt76.dev, "BSS %d is %s\n", event->bss_idx,
+		event->is_absent ? "Absent" : "Present");
 }
 
 static void
-- 
2.25.1


