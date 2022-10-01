Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9246BC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Oct 2022 01:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3IDpacDLG3U9QfoJhJxhKp3+hjn1ByomaRUfafFkJLQ=; b=euGa4jHrjsFZ40L9gcbp6Xyz+8
	UzzEDk2rm997B54MPn658IWrxFaS3Fs+RJd6glP58NeAxq7e1Rr13XOwyz8P1BE6kX1o+A2nyOPrB
	xbL/+MnNoH0ledwfbnNtmqEcbjUkCXUjse63Mmc0bTvQ6FC9Zs3Py9SU6QpUPoY4ICujvoCSNCqla
	wZ60E4maHXt+ocVgsIvNAIMCZT6sj3jAm8uBbD+mDLRuWiX5/FIlM8CJjXK95+Z2XvhdYReRlnJjh
	e1N0Z6vqMr0Ka0w8gNOt4loT82vqubK/9sODDB6km9yLSlhyqFcp5/Q0+uVj3IZmAuw5KUJC3iEfp
	YQ/4N0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeRX6-00CX20-I4; Sat, 01 Oct 2022 01:43:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeRX1-00CWvm-Lc
	for linux-mediatek@lists.infradead.org; Sat, 01 Oct 2022 01:43:10 +0000
X-UUID: 4582085364504a8d8a9f3fd706812a32-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3IDpacDLG3U9QfoJhJxhKp3+hjn1ByomaRUfafFkJLQ=;
	b=hEo1D8D/hzOmpc1/QGocKfYOLrD1a2MJWpB7duvkw9MrOdp1wjm0/QBKrRPmCC5pFFeaitSmft84XNbcPGrndzrhW2ODCWNhI77e89ajBghXmzcfYoPUHGOoitaGORjOc+Ryn2qX/X+UgpnEQ94Q1H9UbMCc331KYK9U8MHpK6s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:d08b15e8-c94c-4cc8-96c9-fc93bb8f8bb9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:fa19aea3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4582085364504a8d8a9f3fd706812a32-20220930
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 878209805; Fri, 30 Sep 2022 18:42:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sat, 1 Oct 2022 09:42:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 1 Oct 2022 09:42:45 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7915: fix mt7915_mac_set_timing()
Date: Sat, 1 Oct 2022 09:42:44 +0800
Message-ID: <70f35a832f5b6790d311c14705c501d0b16eee43.1664588187.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_184308_023361_32845623 
X-CRM114-Status: UNSURE (   9.98  )
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

Correct mac timiing settings for different hardware generations.
This improves 40-60Mbps performance.

Fixes: 9aac2969fe5f ("mt76: mt7915: update mac timing settings")
Reported-By: Carson Vandegriffe <carson.vandegriffe@candelatech.com>
Tested-by: Chad Monroe <chad.monroe@smartrg.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - add missing settings
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index be97dede2634..8892bc9a9ad1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1149,7 +1149,7 @@ void mt7915_mac_set_timing(struct mt7915_phy *phy)
 		  FIELD_PREP(MT_TIMEOUT_VAL_CCA, 48);
 	u32 ofdm = FIELD_PREP(MT_TIMEOUT_VAL_PLCP, 60) |
 		   FIELD_PREP(MT_TIMEOUT_VAL_CCA, 28);
-	int offset;
+	int eifs_ofdm = 360, sifs = 10, offset;
 	bool a_band = !(phy->mt76->chandef.chan->band == NL80211_BAND_2GHZ);
 
 	if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
@@ -1167,17 +1167,26 @@ void mt7915_mac_set_timing(struct mt7915_phy *phy)
 	reg_offset = FIELD_PREP(MT_TIMEOUT_VAL_PLCP, offset) |
 		     FIELD_PREP(MT_TIMEOUT_VAL_CCA, offset);
 
+	if (!is_mt7915(&dev->mt76)) {
+		if (!a_band) {
+			mt76_wr(dev, MT_TMAC_ICR1(phy->band_idx),
+				FIELD_PREP(MT_IFS_EIFS_CCK, 314));
+			eifs_ofdm = 78;
+		} else {
+			eifs_ofdm = 84;
+		}
+	} else if (a_band) {
+		sifs = 16;
+	}
+
 	mt76_wr(dev, MT_TMAC_CDTR(phy->band_idx), cck + reg_offset);
 	mt76_wr(dev, MT_TMAC_ODTR(phy->band_idx), ofdm + reg_offset);
 	mt76_wr(dev, MT_TMAC_ICR0(phy->band_idx),
-		FIELD_PREP(MT_IFS_EIFS_OFDM, a_band ? 84 : 78) |
+		FIELD_PREP(MT_IFS_EIFS_OFDM, eifs_ofdm) |
 		FIELD_PREP(MT_IFS_RIFS, 2) |
-		FIELD_PREP(MT_IFS_SIFS, 10) |
+		FIELD_PREP(MT_IFS_SIFS, sifs) |
 		FIELD_PREP(MT_IFS_SLOT, phy->slottime));
 
-	mt76_wr(dev, MT_TMAC_ICR1(phy->band_idx),
-		FIELD_PREP(MT_IFS_EIFS_CCK, 314));
-
 	if (phy->slottime < 20 || a_band)
 		val = MT7915_CFEND_RATE_DEFAULT;
 	else
-- 
2.36.1


