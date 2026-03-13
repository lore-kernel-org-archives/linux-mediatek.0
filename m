Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E00106FD87
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 06:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToG08eSiKjJV3VqptVXImyuqNUPfUBbEss8R/TV/gYI=; b=Sm+m+S6GvxIrUhn0J4/kN+/LNP
	ooZDdatSgNBNILAKKGJWaqSZHM8JJ4BFpCqXlnFxBUQvQeAET8gTvGmJfY56XBKufNwI7jLg73wwE
	YhWuGKudLTdq5QBBjFItIJQ6eipIm6Xs+7qUpKF6Fn7pCdPvOXnXs5hStr8rgrBhrPWQBXC/ahgXm
	6JDk27p39jreDmNeEx4mYc8VQp6M/6zUrhWSmpSyZaj9CSjuN+L/5ILKndxa7rATmkI4nLmRs1PJX
	+PmrH0DTJ6oD40wcySoLHfjUXGEMw8wM96IHlti57SQ5qftFHwLBtH/Stw5ubAWjQI24JuRKzP49q
	q1acVJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vvc-0000000GqCK-3Gjq;
	Fri, 13 Mar 2026 06:23:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vvZ-0000000GqBU-0mJB
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Mar 2026 06:23:19 +0000
X-UUID: 1d4986e81ea511f1a6de359d7043e138-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ToG08eSiKjJV3VqptVXImyuqNUPfUBbEss8R/TV/gYI=;
	b=QW20RXfWO4Y3C9IGyboYw/Dx1TofqiBjJZx1gVDYiY3ahW9ovWBO69YKtIrC7KIl5TNYhcwuXcjJAxp3Nj+Fl2Xvyk0AWsqFw7kTjCAjKq7ERMhNqVXFBeRRng4yXJHY1/S5WU1yIP9RyT88HVF2yGHzUoJkPTFshf8w2UQE3k0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1e43e25c-000f-4d9c-a11a-97ce684ec2e9,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:bca8f6f9-dfaf-419f-9dd3-d093c7e8f968,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:5,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d4986e81ea511f1a6de359d7043e138-20260312
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 855875841; Thu, 12 Mar 2026 23:23:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 13 Mar 2026 14:23:11 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 13 Mar 2026 14:23:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
	<shayne.chen@mediatek.com>
Subject: [PATCH wireless-next 2/2] wifi: mt76: mt7996: fix capability of EHT-MCS 15 in MRU
Date: Fri, 13 Mar 2026 14:21:50 +0800
Message-ID: <20260313062150.3165433-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260313062150.3165433-1-shayne.chen@mediatek.com>
References: <20260313062150.3165433-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_232317_253794_23B51A9C 
X-CRM114-Status: GOOD (  10.29  )
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

According to the definition in IEEE Std 802.11be-2024, Table 9-417r:
- If 80 MHz is not supported, bit 1-3 are set to 0.
- If 160 MHz is not supported, bit 2-3 are set to 0.
- If 320 MHz is not supported, bit 3 is set to 0.

Fixes: 348533eb968d ("wifi: mt76: mt7996: add EHT capability init")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 00a8286bd136..a08bc07a7f93 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1492,7 +1492,6 @@ mt7996_init_eht_caps(struct mt7996_phy *phy, enum nl80211_band band,
 	struct ieee80211_sta_eht_cap *eht_cap = &data->eht_cap;
 	struct ieee80211_eht_cap_elem_fixed *eht_cap_elem = &eht_cap->eht_cap_elem;
 	struct ieee80211_eht_mcs_nss_supp *eht_nss = &eht_cap->eht_mcs_nss_supp;
-	enum nl80211_chan_width width = phy->mt76->chandef.width;
 	int nss = hweight8(phy->mt76->antenna_mask);
 	int sts = hweight16(phy->mt76->chainmask);
 	u8 val;
@@ -1568,11 +1567,16 @@ mt7996_init_eht_caps(struct mt7996_phy *phy, enum nl80211_band band,
 		u8_encode_bits(u8_get_bits(1, GENMASK(1, 0)),
 			       IEEE80211_EHT_PHY_CAP5_MAX_NUM_SUPP_EHT_LTF_MASK);
 
-	val = width == NL80211_CHAN_WIDTH_320 ? 0xf :
-	      width == NL80211_CHAN_WIDTH_160 ? 0x7 :
-	      width == NL80211_CHAN_WIDTH_80 ? 0x3 : 0x1;
-	eht_cap_elem->phy_cap_info[6] =
-		u8_encode_bits(val, IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_MASK);
+	eht_cap_elem->phy_cap_info[6] = IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_MASK;
+	if (band != NL80211_BAND_6GHZ) {
+		eht_cap_elem->phy_cap_info[6] &=
+			~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
+
+		if (band != NL80211_BAND_5GHZ)
+			eht_cap_elem->phy_cap_info[6] &=
+				~(IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_160MHZ |
+				  IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_80MHZ);
+	}
 
 	val = u8_encode_bits(nss, IEEE80211_EHT_MCS_NSS_RX) |
 	      u8_encode_bits(nss, IEEE80211_EHT_MCS_NSS_TX);
-- 
2.51.0


