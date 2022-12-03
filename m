Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC23C352A1
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 19:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dkqrim5MMKDqnuM1SehC9SWivtj3cFY8upiktgS3Xn4=; b=ewWnM4IMtcBwmvL5B9xeLRpG6t
	EV0IlHSA2YpNvV5HJpIx8yhiXEhlNnVDEWeuDPNMH9kuUegCGmhivEG+B9wJzYx4gTjp9RH8Fg0ev
	5mTBCbO/d83morBPcY/QPtzXG0FJ0pCcG9LRjnpsivWU1II7fjyR2IlmPq9yLg5wYgMKw20tHNKXk
	/qBQvceEFQvtH5VgAu1X9BP08OTEGR+HBZwf0vqC5SUB02l6Uu3Ht7HiMsZLrsFfjOdupEa7AA7Oh
	Mblwjp2XEYuCMnNaGWjEHHuxvwARKnv+02HS/prrRH/OtLmdcPFSP35xH25MtKhu/xbwa5OOpwT9R
	r3SbjgWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1YDe-004u0l-BQ; Sat, 03 Dec 2022 19:30:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1YDa-004tz7-Rs
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 19:30:36 +0000
X-UUID: d2c6d6a60f3648dfa8b8727f487293b3-20221203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Dkqrim5MMKDqnuM1SehC9SWivtj3cFY8upiktgS3Xn4=;
	b=NFQ4vKKGDuE7txP71cniMD9muOZLj4N77SPUcqn/1Q7JXfboybcFltQ9GLYDEBFA26nYCoHI7suWr4JOSOKVGZ3zejzPj5qyIu9ZrwB1Jww3acbxlb/hv+EPMPP+vdYcB/UKTJWqhyLj2hYedv/QkisnzPSzarIWqqbw5BL7IPM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:a61d9f13-d4b0-4fce-b1b2-639fa0b97ff7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:a61d9f13-d4b0-4fce-b1b2-639fa0b97ff7,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:ce2c766c-41fe-47b6-8eb4-ec192dedaf7d,B
	ulkID:221204032924B55VSVO2,BulkQuantity:3,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: d2c6d6a60f3648dfa8b8727f487293b3-20221203
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 774885661; Sat, 03 Dec 2022 12:30:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sun, 4 Dec 2022 03:29:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 4 Dec 2022 03:29:23 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 3/3] wifi: mt76: mt7915: check the correctness of event data first
Date: Sun, 4 Dec 2022 03:29:19 +0800
Message-ID: <57af9227896a13eadc062b52d238f179d4ebd049.1670095617.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <ba197e342d4d99d2e1be2e731ae989f57f5cf8a9.1670095617.git.ryder.lee@mediatek.com>
References: <ba197e342d4d99d2e1be2e731ae989f57f5cf8a9.1670095617.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_113035_236136_A34DE1D5 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

The mcu event might not be reliable, so check the correctness of data
before handling it.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index f9e4c3e80af0..7cb45cd55ada 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -232,8 +232,11 @@ mt7915_mcu_rx_csa_notify(struct mt7915_dev *dev, struct sk_buff *skb)
 
 	c = (struct mt7915_mcu_csa_notify *)skb->data;
 
+	if (c->band_idx > MT_BAND1)
+		return;
+
 	if ((c->band_idx && !dev->phy.mt76->band_idx) &&
-	     dev->mt76.phys[MT_BAND1])
+	    dev->mt76.phys[MT_BAND1])
 		mphy = dev->mt76.phys[MT_BAND1];
 
 	ieee80211_iterate_active_interfaces_atomic(mphy->hw,
@@ -252,8 +255,11 @@ mt7915_mcu_rx_thermal_notify(struct mt7915_dev *dev, struct sk_buff *skb)
 	if (t->ctrl.ctrl_id != THERMAL_PROTECT_ENABLE)
 		return;
 
+	if (t->ctrl.band_idx > MT_BAND1)
+		return;
+
 	if ((t->ctrl.band_idx && !dev->phy.mt76->band_idx) &&
-	     dev->mt76.phys[MT_BAND1])
+	    dev->mt76.phys[MT_BAND1])
 		mphy = dev->mt76.phys[MT_BAND1];
 
 	phy = (struct mt7915_phy *)mphy->priv;
@@ -268,8 +274,11 @@ mt7915_mcu_rx_radar_detected(struct mt7915_dev *dev, struct sk_buff *skb)
 
 	r = (struct mt7915_mcu_rdd_report *)skb->data;
 
+	if (r->band_idx > MT_BAND1)
+		return;
+
 	if ((r->band_idx && !dev->phy.mt76->band_idx) &&
-	     dev->mt76.phys[MT_BAND1])
+	    dev->mt76.phys[MT_BAND1])
 		mphy = dev->mt76.phys[MT_BAND1];
 
 	if (r->band_idx == MT_RX_SEL2)
@@ -326,7 +335,11 @@ mt7915_mcu_rx_bcc_notify(struct mt7915_dev *dev, struct sk_buff *skb)
 
 	b = (struct mt7915_mcu_bcc_notify *)skb->data;
 
-	if ((b->band_idx && !dev->phy.mt76->band_idx) && dev->mt76.phys[MT_BAND1])
+	if (b->band_idx > MT_BAND1)
+		return;
+
+	if ((b->band_idx && !dev->phy.mt76->band_idx) &&
+	    dev->mt76.phys[MT_BAND1])
 		mphy = dev->mt76.phys[MT_BAND1];
 
 	ieee80211_iterate_active_interfaces_atomic(mphy->hw,
-- 
2.18.0


