Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE532C531DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptRPaWl1szcKHuHfagd2krGpBPW8GYQu7WsNVr49tGU=; b=cpuaBFlD7pzhu9QIONMmduUP9/
	b+g7+xPAtML0uzVlU+Ork7qNtYPtZ4e/qa/5zi0kUZAIjI/Y62kXsaejmnl/rh37hLKqnNkURvKUR
	6RpyiXJuSYbwuTv7qmCBZtbuzeu1EjGAVWzWtBABfYLATwv0CriMJCQKpW/IPs5aVTTyD1coEtA66
	mtWIpQU4RJFZU+t1/lxZqXNpdBgHyDy6GiPGzBuRamIp08ohc6qOCFN2eEsha4pna9YV0RHq8zPwm
	keT0wwX47RZgzTYe7U5fuZF9r6ur5LzOhqaYluBslGoA11W/1f8TVrFsbTtqOhKIgZg2N/93FjPal
	23FJqQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setdw-0000000CV7B-0yzI;
	Fri, 16 Aug 2024 09:53:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setc4-0000000CUaa-1Bol
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 09:51:17 +0000
X-UUID: 10c53b245bb511efb3adad29d29602c1-20240816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ptRPaWl1szcKHuHfagd2krGpBPW8GYQu7WsNVr49tGU=;
	b=UannrS8masHA3SqvD1uYKBBVX9MogQkJtjicthAGnlvOzA3Y4ZzI9Dbh0eDpnaf0nLCBoGafaz7HEn1/NPCKtWTMJRMwSSkKWBGS48K5AiUbIsgbE9SrfW4hqPDz1TWmPQAgdAginGLS81GCdThztMsY0qyn3ucJ4pHdEb4I3IY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:20d0dedc-358b-410a-b92c-60cc497a9d5a,IP:0,U
	RL:0,TC:0,Content:55,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:55
X-CID-META: VersionHash:6dc6a47,CLOUDID:c963b1fe-77bb-433c-b174-ffb8012693b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:4|8,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 10c53b245bb511efb3adad29d29602c1-20240816
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1610184167; Fri, 16 Aug 2024 02:51:10 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Aug 2024 17:50:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Aug 2024 17:50:15 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 06/12] wifi: mt76: mt7996: fix HE and EHT beamforming capabilities
Date: Fri, 16 Aug 2024 17:46:29 +0800
Message-ID: <20240816094635.2391-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240816094635.2391-1-shayne.chen@mediatek.com>
References: <20240816094635.2391-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.682400-8.000000
X-TMASE-MatchedRID: ptJ0KTv/UXDPvAv72Y9dJfmF8IFnUmgvMZm0+sEE9mup+RClYacCxuLg
	gUiYkYyHa/XjyNax2z/bHihwcxI1hDI0UzRdrW2o4RtSDjG+z7CuiRuR9mCaupFghxqVuczoRtt
	YY7T3bpME1SjWqrnJaAaxDKyiq5EE9X41s3bshlbil2r2x2PwtX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07fhmFHnZFzVqX/q4nAaH3d9FtN+OtStsdivB5Acdtotx5afv4NZF1Ed1aXxxoCpt4SWqf
	Vt6gRAMK6qLPEKJ3H8ZZTTAb7IQTdV9NPlsHF6RSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvr
	HlT8euJ0YHKn7N1oOA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.682400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F7DE47DD94AE57FBFADD57BFA68EF01070F16F67C46BD5D2956621662FB6C6082000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_025116_358808_9EF22A53 
X-CRM114-Status: UNSURE (   9.05  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

Fix HE and EHT beamforming capabilities for different bands and
interface types.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Fixes: 348533eb968d ("wifi: mt76: mt7996: add EHT capability init")
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 65 ++++++++++++-------
 1 file changed, 43 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 4d6157e49b16..7e7e42b54c2e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1012,8 +1012,6 @@ mt7996_set_stream_he_txbf_caps(struct mt7996_phy *phy,
 		return;
 
 	elem->phy_cap_info[3] |= IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
-	if (vif == NL80211_IFTYPE_AP)
-		elem->phy_cap_info[4] |= IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
 
 	c = FIELD_PREP(IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK,
 		       sts - 1) |
@@ -1021,6 +1019,11 @@ mt7996_set_stream_he_txbf_caps(struct mt7996_phy *phy,
 		       sts - 1);
 	elem->phy_cap_info[5] |= c;
 
+	if (vif != NL80211_IFTYPE_AP)
+		return;
+
+	elem->phy_cap_info[4] |= IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
+
 	c = IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMING_FB |
 	    IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMING_PARTIAL_BW_FB;
 	elem->phy_cap_info[6] |= c;
@@ -1180,7 +1183,6 @@ mt7996_init_eht_caps(struct mt7996_phy *phy, enum nl80211_band band,
 		IEEE80211_EHT_MAC_CAP0_OM_CONTROL;
 
 	eht_cap_elem->phy_cap_info[0] =
-		IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ |
 		IEEE80211_EHT_PHY_CAP0_NDP_4_EHT_LFT_32_GI |
 		IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMER |
 		IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMEE;
@@ -1194,30 +1196,36 @@ mt7996_init_eht_caps(struct mt7996_phy *phy, enum nl80211_band band,
 		u8_encode_bits(u8_get_bits(val, GENMASK(2, 1)),
 			       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_80MHZ_MASK) |
 		u8_encode_bits(val,
-			       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_160MHZ_MASK) |
-		u8_encode_bits(val,
-			       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK);
+			       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_160MHZ_MASK);
 
 	eht_cap_elem->phy_cap_info[2] =
 		u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_80MHZ_MASK) |
-		u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_160MHZ_MASK) |
-		u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK);
+		u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_160MHZ_MASK);
+
+	if (band == NL80211_BAND_6GHZ) {
+		eht_cap_elem->phy_cap_info[0] |=
+			IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
+
+		eht_cap_elem->phy_cap_info[1] |=
+			u8_encode_bits(val,
+				       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK);
+
+		eht_cap_elem->phy_cap_info[2] |=
+			u8_encode_bits(sts - 1,
+				       IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK);
+	}
 
 	eht_cap_elem->phy_cap_info[3] =
 		IEEE80211_EHT_PHY_CAP3_NG_16_SU_FEEDBACK |
 		IEEE80211_EHT_PHY_CAP3_NG_16_MU_FEEDBACK |
 		IEEE80211_EHT_PHY_CAP3_CODEBOOK_4_2_SU_FDBK |
-		IEEE80211_EHT_PHY_CAP3_CODEBOOK_7_5_MU_FDBK |
-		IEEE80211_EHT_PHY_CAP3_TRIG_SU_BF_FDBK |
-		IEEE80211_EHT_PHY_CAP3_TRIG_MU_BF_PART_BW_FDBK |
-		IEEE80211_EHT_PHY_CAP3_TRIG_CQI_FDBK;
+		IEEE80211_EHT_PHY_CAP3_CODEBOOK_7_5_MU_FDBK;
 
 	eht_cap_elem->phy_cap_info[4] =
 		u8_encode_bits(min_t(int, sts - 1, 2),
 			       IEEE80211_EHT_PHY_CAP4_MAX_NC_MASK);
 
 	eht_cap_elem->phy_cap_info[5] =
-		IEEE80211_EHT_PHY_CAP5_NON_TRIG_CQI_FEEDBACK |
 		u8_encode_bits(IEEE80211_EHT_PHY_CAP5_COMMON_NOMINAL_PKT_PAD_16US,
 			       IEEE80211_EHT_PHY_CAP5_COMMON_NOMINAL_PKT_PAD_MASK) |
 		u8_encode_bits(u8_get_bits(0x11, GENMASK(1, 0)),
@@ -1231,14 +1239,6 @@ mt7996_init_eht_caps(struct mt7996_phy *phy, enum nl80211_band band,
 			       IEEE80211_EHT_PHY_CAP6_MAX_NUM_SUPP_EHT_LTF_MASK) |
 		u8_encode_bits(val, IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_MASK);
 
-	eht_cap_elem->phy_cap_info[7] =
-		IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_80MHZ |
-		IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_160MHZ |
-		IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ |
-		IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_80MHZ |
-		IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_160MHZ |
-		IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;
-
 	val = u8_encode_bits(nss, IEEE80211_EHT_MCS_NSS_RX) |
 	      u8_encode_bits(nss, IEEE80211_EHT_MCS_NSS_TX);
 #define SET_EHT_MAX_NSS(_bw, _val) do {				\
@@ -1249,8 +1249,29 @@ mt7996_init_eht_caps(struct mt7996_phy *phy, enum nl80211_band band,
 
 	SET_EHT_MAX_NSS(80, val);
 	SET_EHT_MAX_NSS(160, val);
-	SET_EHT_MAX_NSS(320, val);
+	if (band == NL80211_BAND_6GHZ)
+		SET_EHT_MAX_NSS(320, val);
 #undef SET_EHT_MAX_NSS
+
+	if (iftype != NL80211_IFTYPE_AP)
+		return;
+
+	eht_cap_elem->phy_cap_info[3] |=
+		IEEE80211_EHT_PHY_CAP3_TRIG_SU_BF_FDBK |
+		IEEE80211_EHT_PHY_CAP3_TRIG_MU_BF_PART_BW_FDBK;
+
+	eht_cap_elem->phy_cap_info[7] =
+		IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_80MHZ |
+		IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_160MHZ |
+		IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_80MHZ |
+		IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_160MHZ;
+
+	if (band != NL80211_BAND_6GHZ)
+		return;
+
+	eht_cap_elem->phy_cap_info[7] |=
+		IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ |
+		IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;
 }
 
 static void
-- 
2.39.2


