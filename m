Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA451C83F29
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 06:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFT99+z2/vpIbfLokQbVWLJxcppLvQbX9e6U3+V5HfE=; b=Z8jtFyj5lENt3EDbsrbjlUg0yl
	R1bhvTAKfGLeYHeO5Ov25ja8Mj9USjrKzJpree2QiqFSUZE7V1J5pKXNc2KF870R/6xYEp16y5nL+
	+hRWUrC017yf83N5XASFazG+iBXroIK1IpCxytVyrJ6RBfk6O06Xz/qi0Rifzqa49Tw67FswrhaHF
	SBusq6T5UBcML+2LRNH+lKK+CSBZTH4lwn2rw4JUqEzKh83ug5Z7Qaw2EVkxUGdNAvosZp4Mhlpfg
	1yBwGupgq4JIwZrDuUzSyomPTPW7Qo1AaWgal9Jy0l86lRbVcgIL+yiVAtjbUCgsQoSxtzLe1Rdzc
	+jtCTDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbb6J-00EkcB-2L;
	Thu, 31 Aug 2023 06:24:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbb6I-00Ekbn-0K
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 06:24:19 +0000
X-UUID: 000d379e47c711ee83ed1395ce914268-20230830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WFT99+z2/vpIbfLokQbVWLJxcppLvQbX9e6U3+V5HfE=;
	b=ZXsnlrqADyD0e0kxjuLINcr2VbTArygs2Dc8wtG15yN55h2gdUPdpCQ5sbOnoURITm8a6gh7XbawX9teyZ+6haeWb19f77kKSL/sRtOmAUjWQor8Ze7E1GRB9dK0hSmy4v9Eqja7ij0nm8ph7cUwMcfPkt7pZjweObX/KsEsI6k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:c84f82e6-fe61-4f57-9e63-6837d06be8c1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:4e5a26ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 000d379e47c711ee83ed1395ce914268-20230830
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1337211990; Wed, 30 Aug 2023 23:24:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 31 Aug 2023 14:23:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 31 Aug 2023 14:23:38 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 8/9] wifi: mt76: mt7915: update mpdu density capability
Date: Thu, 31 Aug 2023 14:22:20 +0800
Message-ID: <20230831062221.20027-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230831062221.20027-1-shayne.chen@mediatek.com>
References: <20230831062221.20027-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_232418_145436_06EBAB7B 
X-CRM114-Status: GOOD (  11.15  )
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

Set mpdu density to 2 usec for non-mt7915 Wi-Fi 6 generation chipsets
to align to the hardware capability which improves the throughput.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 78552f10b377..08989e00facb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -392,8 +392,12 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
 		phy->mt76->sband_2g.sband.ht_cap.cap |=
 			IEEE80211_HT_CAP_LDPC_CODING |
 			IEEE80211_HT_CAP_MAX_AMSDU;
-		phy->mt76->sband_2g.sband.ht_cap.ampdu_density =
-			IEEE80211_HT_MPDU_DENSITY_4;
+		if (is_mt7915(&dev->mt76))
+			phy->mt76->sband_2g.sband.ht_cap.ampdu_density =
+				IEEE80211_HT_MPDU_DENSITY_4;
+		else
+			phy->mt76->sband_2g.sband.ht_cap.ampdu_density =
+				IEEE80211_HT_MPDU_DENSITY_2;
 	}
 
 	if (phy->mt76->cap.has_5ghz) {
@@ -403,10 +407,11 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
 		phy->mt76->sband_5g.sband.ht_cap.cap |=
 			IEEE80211_HT_CAP_LDPC_CODING |
 			IEEE80211_HT_CAP_MAX_AMSDU;
-		phy->mt76->sband_5g.sband.ht_cap.ampdu_density =
-			IEEE80211_HT_MPDU_DENSITY_4;
 
 		if (is_mt7915(&dev->mt76)) {
+			phy->mt76->sband_5g.sband.ht_cap.ampdu_density =
+				IEEE80211_HT_MPDU_DENSITY_4;
+
 			vht_cap->cap |=
 				IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_7991 |
 				IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
@@ -416,6 +421,9 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
 					IEEE80211_VHT_CAP_SHORT_GI_160 |
 					FIELD_PREP(IEEE80211_VHT_CAP_EXT_NSS_BW_MASK, 1);
 		} else {
+			phy->mt76->sband_5g.sband.ht_cap.ampdu_density =
+				IEEE80211_HT_MPDU_DENSITY_2;
+
 			vht_cap->cap |=
 				IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454 |
 				IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
-- 
2.39.2


