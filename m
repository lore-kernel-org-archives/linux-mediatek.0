Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71850C7EE2F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzhBciOktC5LlWot3JMQpeY3vmPHGHWKpnQktZnqMsk=; b=lPCPP+XfUwBMpSlap1rvI9oaf8
	VBfOQ11txheb0MOsJX3CpLvW+vg7CtcrQY9DtnGwsUN1b/1nFAo2dkPM/6BNgUYu/W6BVPtuULXHv
	elkMCyPSwQgBS/m51+kcQb7rK3qwuI7etA8r+GtpELl7LKPhOszKmNTemcwNR7GgKAZoGwCsaE10E
	GKpn2JPY37EUoY54N0vkHqBuhL1uBhwmQpJJC3AeHoM6rSgWc4V2a7a90mW6fOc9APzwJml2WqQ2p
	RWdNUfMrZoLJrL3VdKCrFfF7VMipiAV+8ruQjyEMxy1K06+qB2rq/vOCYJmwigImzkvwAlDOAkK+U
	UaFmlFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0x6-005TC3-NU; Fri, 03 Mar 2023 08:39:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0ue-005RpH-6h
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 08:37:14 +0000
X-UUID: 948bb15ab99e11eda08d4d6090ec5a5c-20230303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IzhBciOktC5LlWot3JMQpeY3vmPHGHWKpnQktZnqMsk=;
	b=na4dtwGFh8lXXFL9BKFFmgISXsOpU++vAPyw40iRLPKz+VQZftbLSPUqoZxzm6o3/sBCoKPAF7B7TApP6TSWngxmPdvK5Jh3gyYgyEpkI+ETpzgPDPNvQ0AmaYvKTsy3CjGx2hZsS8XtFESwps2svQ1GN72p0D14eR2hVHwCBZI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:0b1fbb9e-5335-4cdb-a30b-b38744d2731b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:fa9aa9f4-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 948bb15ab99e11eda08d4d6090ec5a5c-20230303
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1155161546; Fri, 03 Mar 2023 01:37:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 16:36:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 16:36:30 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 5/7] wifi: mt76: mt7996: init mpdu density cap
Date: Fri, 3 Mar 2023 16:35:56 +0800
Message-ID: <20230303083558.3586-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230303083558.3586-1-shayne.chen@mediatek.com>
References: <20230303083558.3586-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_003712_437545_D0F76D87 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Init mpdu density based on the hardware capability to prevent rx drop.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 946da93eed32..de94e151c47b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -196,10 +196,13 @@ mt7996_init_wiphy(struct ieee80211_hw *hw)
 
 	hw->max_tx_fragments = 4;
 
-	if (phy->mt76->cap.has_2ghz)
+	if (phy->mt76->cap.has_2ghz) {
 		phy->mt76->sband_2g.sband.ht_cap.cap |=
 			IEEE80211_HT_CAP_LDPC_CODING |
 			IEEE80211_HT_CAP_MAX_AMSDU;
+		phy->mt76->sband_2g.sband.ht_cap.ampdu_density =
+			IEEE80211_HT_MPDU_DENSITY_2;
+	}
 
 	if (phy->mt76->cap.has_5ghz) {
 		phy->mt76->sband_5g.sband.ht_cap.cap |=
@@ -211,6 +214,8 @@ mt7996_init_wiphy(struct ieee80211_hw *hw)
 			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK |
 			IEEE80211_VHT_CAP_SHORT_GI_160 |
 			IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ;
+		phy->mt76->sband_5g.sband.ht_cap.ampdu_density =
+			IEEE80211_HT_MPDU_DENSITY_1;
 	}
 
 	mt76_set_stream_caps(phy->mt76, true);
@@ -689,7 +694,7 @@ mt7996_init_he_caps(struct mt7996_phy *phy, enum nl80211_band band,
 		u16 cap = IEEE80211_HE_6GHZ_CAP_TX_ANTPAT_CONS |
 			  IEEE80211_HE_6GHZ_CAP_RX_ANTPAT_CONS;
 
-		cap |= u16_encode_bits(IEEE80211_HT_MPDU_DENSITY_2,
+		cap |= u16_encode_bits(IEEE80211_HT_MPDU_DENSITY_0_5,
 				       IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START) |
 		       u16_encode_bits(IEEE80211_VHT_MAX_AMPDU_1024K,
 				       IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP) |
-- 
2.39.2


