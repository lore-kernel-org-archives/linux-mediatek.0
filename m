Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F06AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 02:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7isSX3cY3PmUFv07+6GIMgRM7vpDayp8dpRnd4LPrrM=; b=AEXhy9knKXaiDG3+V4tO0U7WBR
	fimyTmiJNBTwDATFsrTz2YmP/CzyHj0ksoFW2GKeEQrZ2ddhWnA4rBhmBf5hT7AJoC6XtPZODprwz
	QT1PWMn7OaOjnJWOmHNZpNTfJ9iaYtMwvvVyACYEdoCRLd/Fi58o8MVf3oFXJuY7Akk5Q8E2DSFnF
	2RrDQLGML4UCPuE6vmuEMZxoqleMzifJoZBOIpf/WmlD6+ZGs2p1S5GzHlgT6981lh/GA3xepncEE
	DarmxIFcZRdyWCA7DEChmo/vbACM2syX3qQklvOmUg9oo9tQ4VLyn7UL29odAocBSVEEF9hOxrvDB
	/VazXopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAj2f-00B0Eu-43; Thu, 29 Dec 2022 02:53:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAj2c-00B0C6-L5
	for linux-mediatek@bombadil.infradead.org; Thu, 29 Dec 2022 02:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7isSX3cY3PmUFv07+6GIMgRM7vpDayp8dpRnd4LPrrM=; b=q9Jwz+FSJYdd1C7zS4npSI9yJ8
	6F8G1l/4QfeoZ+aayzApBJOipByNoZ0d5Wnzn23bAeJf/L4A0P3Lqt3dGzMV3JcdH715ga+grJm/V
	dnadeVhhs4Ks5Wfriwr6R/uFrLuk3yZ5JEgtCKJo3+w1f1bV0BhUSmy1O3OxCdTxIRGyJxhirHj/S
	j4nWBOWJtg9OxKgLB/JniUkQJMHNcxBYscOsclHBrfzGJ4rWR7Vwl91H14wqI9O/2Afcm7m/9d+Wp
	lOf8lcocMqLxAJIz9l83Pn/o5DGS2CmfGy8GAzUH0b0l11VBKq2moNz4okm7v5qwz9gagNR7INAAY
	IvSII1RA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pAj2S-00GHHI-2F
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Dec 2022 02:53:04 +0000
X-UUID: 369935d34ec44500a6a4f43116af3bfd-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7isSX3cY3PmUFv07+6GIMgRM7vpDayp8dpRnd4LPrrM=;
	b=MzLlqTJvrjNRPcI7TUU6GmuEgfwfl8mCDCBsM7VbsYQIY9lLOSQzb2SeTzl62Sp296K4qAtzeGjD+1MXl811Ccoxy9V+RJFNenoWLypiNkYCNRV56btiv6sP9OnRPH4QCTELnHiSYuTzGwJM7oQ52yNtIw91ksJLbHWYzyUuqWU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:c7e0c303-7bf8-4b09-b3f8-508663d58212,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:f904b18a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 369935d34ec44500a6a4f43116af3bfd-20221228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <meichia.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 67320925; Wed, 28 Dec 2022 19:52:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 29 Dec 2022 10:12:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Dec 2022 10:12:04 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, MeiChia Chiu
	<MeiChia.Chiu@mediatek.com>, Money Wang <Money.Wang@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: remove BW80+80 support
Date: Thu, 29 Dec 2022 10:11:31 +0800
Message-ID: <20221229021131.9361-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_025301_646023_C4667965 
X-CRM114-Status: GOOD (  13.33  )
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

mt7915 doesn't support bw80+80.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Money Wang<Money.Wang@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
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


