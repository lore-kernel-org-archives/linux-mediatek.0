Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B508C46467
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 14:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s02Nzo/o8DkPnFzi7Rk9w5YRYVFFFZhDcys5ZCrLGfw=; b=kXXNl/HesWfBV7bgC+KDKMMZ+4
	Rf3HTlyaNEq/ujtAAlx64CY+5v5JG5QGIU9Vyu5hc/D8YIH0IhUDC1SOiOzLpATqTAbFUrXeeypws
	h8H3T4qYEX3aq7ysxTAUpk1BT/vMcxT3eY3AQ7pWez6CDMWMdkrhXzznVzbnSOQ+c5lEr3hRGJMEZ
	G9gzPC6g0WhwXb4arcYI5Z5U0eR+YAnzuWMFfl/uFPkeyO/lyHVyCBKWqbEyg6XpLKuofdLayuJmh
	Y0ovs96FqgORDT42p5+M/MGGJw0NfTHdssslce08zRDs+5jdgr+5pj+63OJb/SEUD/jAX3fw37BIH
	FPPg16wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4KW-009XeK-KM; Wed, 04 Jan 2023 14:01:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0md-008Kxu-Ra
	for linux-mediatek@bombadil.infradead.org; Wed, 04 Jan 2023 10:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=s02Nzo/o8DkPnFzi7Rk9w5YRYVFFFZhDcys5ZCrLGfw=; b=mgkmCVm7AhWChgmW507fwxzzzk
	CoJ1p47go3BQM+YXAajRd5cZMn4AeIgZuEbgSJlg9su35aBERcfYRwD+XUZ6oCFROUViKeN1AuyI7
	4wClUOpa4y+dpaR4UYobyjFdCID5pzH8Pj2Uqx2dzFXgNodJGJDx628/YZIiJTRks18UB9YsOIN83
	8UGefLaKD1ag/mwbXOPdiwziKHSv1kkvqs37Hfoj6S/4uJtGqPgta1+B6s7KQwvwUAqaMVk57SHz4
	4U7fXWHhPnbR+H5WVdBkGv/pEsGchs++cjylvOQqdemjj+lg6g1lajoy4uWPzJa2rxixoTWrkbMxu
	fv4nTHSg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCzhb-000rn4-0c
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Jan 2023 09:04:54 +0000
X-UUID: 93b8da8186f6456ca72acf67203f831d-20230104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=s02Nzo/o8DkPnFzi7Rk9w5YRYVFFFZhDcys5ZCrLGfw=;
	b=Ed+FIcfJh9mvthkWmDSPCANCKXensFyXDxV8dgfR80RlF3BH6k/D9bTarQBHqkwicmqXjvgY0k/6Gpc93DSePixZShu93wUEVrOqPDbztC0x+yB+gdeyBfiogPwyItYPn3iwqcAP5Z2j2ep4vnGd+LBLmv2TaYeEaEZpxUGYrhs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:c73de22d-49d2-4fa2-a0d4-0da1b023dc8f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:4a10c5f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 93b8da8186f6456ca72acf67203f831d-20230104
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <meichia.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1536463718; Wed, 04 Jan 2023 02:04:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 4 Jan 2023 17:04:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 4 Jan 2023 17:04:10 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, MeiChia Chiu
	<MeiChia.Chiu@mediatek.com>, Money Wang <Money.Wang@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7915: remove BW160 and BW80+80 support
Date: Wed, 4 Jan 2023 17:03:52 +0800
Message-ID: <20230104090352.31938-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_090451_659858_779FB864 
X-CRM114-Status: GOOD (  15.60  )
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

Remove BW160 and BW80+80 capability in mt7915.

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Money Wang<Money.Wang@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
---
v2: update commit message and title
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 38 +++++--------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 571c94835942..c72d673f02dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -38,8 +38,7 @@ static const struct ieee80211_iface_combination if_comb[] = {
 				       BIT(NL80211_CHAN_WIDTH_20) |
 				       BIT(NL80211_CHAN_WIDTH_40) |
 				       BIT(NL80211_CHAN_WIDTH_80) |
-				       BIT(NL80211_CHAN_WIDTH_160) |
-				       BIT(NL80211_CHAN_WIDTH_80P80),
+				       BIT(NL80211_CHAN_WIDTH_160),
 	}
 };
 
@@ -394,11 +393,6 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
 			phy->mt76->sband_5g.sband.vht_cap.cap |=
 				IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_7991 |
 				IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK;
-
-			if (!dev->dbdc_support)
-				phy->mt76->sband_5g.sband.vht_cap.cap |=
-					IEEE80211_VHT_CAP_SHORT_GI_160 |
-					IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ;
 		} else {
 			phy->mt76->sband_5g.sband.vht_cap.cap |=
 				IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454 |
@@ -834,13 +828,9 @@ mt7915_set_stream_he_txbf_caps(struct mt7915_phy *phy,
 	int sts = hweight8(phy->mt76->chainmask);
 	u8 c, sts_160 = sts;
 
-	/* Can do 1/2 of STS in 160Mhz mode for mt7915 */
-	if (is_mt7915(&dev->mt76)) {
-		if (!dev->dbdc_support)
-			sts_160 /= 2;
-		else
-			sts_160 = 0;
-	}
+	/* mt7915 doesn't support bw160 */
+	if (is_mt7915(&dev->mt76))
+		sts_160 = 0;
 
 #ifdef CONFIG_MAC80211_MESH
 	if (vif == NL80211_IFTYPE_MESH_POINT)
@@ -894,9 +884,6 @@ mt7915_set_stream_he_txbf_caps(struct mt7915_phy *phy,
 	elem->phy_cap_info[3] |= IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
 	elem->phy_cap_info[4] |= IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
 
-	/* num_snd_dim
-	 * for mt7915, max supported sts is 2 for bw > 80MHz and 0 if dbdc
-	 */
 	c = FIELD_PREP(IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK,
 		       sts - 1);
 	if (sts_160)
@@ -944,15 +931,10 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 	int i, idx = 0, nss = hweight8(phy->mt76->antenna_mask);
 	u16 mcs_map = 0;
 	u16 mcs_map_160 = 0;
-	u8 nss_160;
+	u8 nss_160 = nss;
 
-	if (!is_mt7915(&dev->mt76))
-		nss_160 = nss;
-	else if (!dev->dbdc_support)
-		/* Can do 1/2 of NSS streams in 160Mhz mode for mt7915 */
-		nss_160 = nss / 2;
-	else
-		/* Can't do 160MHz with mt7915 dbdc */
+	/* Can't do 160MHz with mt7915 */
+	if (is_mt7915(&dev->mt76))
 		nss_160 = 0;
 
 	for (i = 0; i < 8; i++) {
@@ -1002,8 +984,7 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 		else if (nss_160)
 			he_cap_elem->phy_cap_info[0] =
 				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
-				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G |
-				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
+				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
 		else
 			he_cap_elem->phy_cap_info[0] =
 				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G;
@@ -1075,12 +1056,11 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 			break;
 		}
 
+		memset(he_mcs, 0, sizeof(*he_mcs));
 		he_mcs->rx_mcs_80 = cpu_to_le16(mcs_map);
 		he_mcs->tx_mcs_80 = cpu_to_le16(mcs_map);
 		he_mcs->rx_mcs_160 = cpu_to_le16(mcs_map_160);
 		he_mcs->tx_mcs_160 = cpu_to_le16(mcs_map_160);
-		he_mcs->rx_mcs_80p80 = cpu_to_le16(mcs_map_160);
-		he_mcs->tx_mcs_80p80 = cpu_to_le16(mcs_map_160);
 
 		mt7915_set_stream_he_txbf_caps(phy, he_cap, i);
 
-- 
2.18.0


