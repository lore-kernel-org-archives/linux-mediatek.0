Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41071C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 03:32:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38E160F6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 03:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F38E160F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PdlU+eW3RJ7tXCprbEmQHtOCa7qj6TNvDFlm4fkuhg=; b=KbQX1e9u1tk6ol
	KCoh9YOSWb14JcaBRUCZMhmIpXm1teLnsCUuyZ2R5/cpc1zgBPMfyppYnrm7YTHXR8eSWM7gkA44s
	bvS6PGqXwBnbcJq8cPbl3zQ+KGyrp9YgzxTbEJlk3oy52IwH8tmk2AiVVkV1JklFvq3gL0UL3Bj3g
	dRZgj77OxgbwtM+uhS40dbMs67CPaB5J2B1PGzJKX33kSySD6CRNTMfc25zgbGeRkbQGhKFh3/h9d
	ep50d5ZrTRBx+uv1NTtfI3X8S0rbOKfelS9ErBckKagIqPb8ZALQWZNb5UuC9zETJ4U/fcklwQCGU
	Mbd3JUMtWxfLa7zhBRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbDx0-005JxF-Cf; Fri, 15 Oct 2021 03:32:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbDwy-005JwW-Jp
 for linux-mediatek@lists.infradead.org; Fri, 15 Oct 2021 03:32:05 +0000
X-UUID: ae21b459a7334a4da82d1a9facdb45a2-20211014
X-UUID: ae21b459a7334a4da82d1a9facdb45a2-20211014
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2098638412; Thu, 14 Oct 2021 20:32:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 20:31:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Oct 2021 11:31:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Oct 2021 11:31:56 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 2/2] mt76: mt7915: fix missing HE phy cap
Date: Fri, 15 Oct 2021 11:31:45 +0800
Message-ID: <20211015033145.8738-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211015033145.8738-1-shayne.chen@mediatek.com>
References: <20211015033145.8738-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_203204_692299_84D70E6B 
X-CRM114-Status: GOOD (  10.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix missing HE phy cap related to vif and starec setting.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 12 +++++++++---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  |  8 ++++----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 7f76907..bf81580 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -629,7 +629,6 @@ mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
 			       int vif, int nss)
 {
 	struct ieee80211_he_cap_elem *elem = &he_cap->he_cap_elem;
-	struct ieee80211_he_mcs_nss_supp *mcs = &he_cap->he_mcs_nss_supp;
 	u8 c;
 
 #ifdef CONFIG_MAC80211_MESH
@@ -681,8 +680,11 @@ mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
 	elem->phy_cap_info[3] |= IEEE80211_HE_PHY_CAP3_SU_BEAMFORMER;
 	elem->phy_cap_info[4] |= IEEE80211_HE_PHY_CAP4_MU_BEAMFORMER;
 
-	/* num_snd_dim */
-	c = (nss - 1) | (max_t(int, le16_to_cpu(mcs->tx_mcs_160), 1) << 3);
+	/* num_snd_dim
+	 * for mt7915, max supported nss is 2 for bw > 80MHz
+	 */
+	c = (nss - 1) |
+	    IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_2;
 	elem->phy_cap_info[5] |= c;
 
 	c = IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMER_FB |
@@ -790,7 +792,11 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
 				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_QPSK;
 			he_cap_elem->phy_cap_info[6] |=
+				IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
 				IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
+			he_cap_elem->phy_cap_info[9] |=
+				IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU |
+				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_THAN_242_TONE_RU;
 			break;
 		case NL80211_IFTYPE_STATION:
 			he_cap_elem->mac_cap_info[1] |=
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index e4da804..fd532b4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1396,6 +1396,10 @@ mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	    IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ)
 		cap |= STA_REC_HE_CAP_LE_EQ_80M_RX_STBC;
 
+	if (elem->phy_cap_info[6] &
+	    IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB)
+		cap |= STA_REC_HE_CAP_TRIG_CQI_FK;
+
 	if (elem->phy_cap_info[6] &
 	    IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE)
 		cap |= STA_REC_HE_CAP_PARTIAL_BW_EXT_RANGE;
@@ -1420,10 +1424,6 @@ mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	    IEEE80211_HE_PHY_CAP8_HE_ER_SU_1XLTF_AND_08_US_GI)
 		cap |= STA_REC_HE_CAP_ER_SU_PPDU_1LTF_8US_GI;
 
-	if (elem->phy_cap_info[9] &
-	    IEEE80211_HE_PHY_CAP9_NON_TRIGGERED_CQI_FEEDBACK)
-		cap |= STA_REC_HE_CAP_TRIG_CQI_FK;
-
 	if (elem->phy_cap_info[9] &
 	    IEEE80211_HE_PHY_CAP9_TX_1024_QAM_LESS_THAN_242_TONE_RU)
 		cap |= STA_REC_HE_CAP_TX_1024QAM_UNDER_RU242;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
