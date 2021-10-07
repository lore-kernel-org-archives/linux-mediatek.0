Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B5FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 09:53:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B53611C1
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 09:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45B53611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2KhXXDmz64ntNtkloHtSXrvB2Ewrl699npvaAGPnbg=; b=aTePU4K9DkZA+j
	eg4fMKWni8sDZsL57/Aqgg5aF9KzhglcaIZFQlCII+8zHdmP1GNIXo+SY5t8wDRNjaWOLFtTiFSNz
	km6xAJINm5+SKK6XtknbYb7P08GYUWIg0iy7Og5JkplEbKdNX1ZIpVQwinkh8Ho//7ZHisRLgUTKo
	NUQhDVdeblAmFEj+dKI1V7U5SJpOVse0rPIjlKKQYiLQj9d32mRMxmKsuDFGQUNBgX0MGyJeY/qwk
	OXcgvioWlMQ/bervruxSfFlrECQQikyI3xM4XoRPtS/mDwvGm1X36lzeG2CC+HgJRs5ItmdxMW/C7
	7qT/L67o94PHluP3FPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYQ5J-00GmGA-I6; Thu, 07 Oct 2021 09:53:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYQ5G-00GmEw-Mw
 for linux-mediatek@lists.infradead.org; Thu, 07 Oct 2021 09:53:04 +0000
X-UUID: 8b2c36b8a1764643ab509e12f792461d-20211007
X-UUID: 8b2c36b8a1764643ab509e12f792461d-20211007
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1465016952; Thu, 07 Oct 2021 02:52:59 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Oct 2021 02:52:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 7 Oct 2021 17:52:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 Oct 2021 17:52:43 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 2/2] mt76: mt7915: fix missing HE phy cap
Date: Thu, 7 Oct 2021 17:49:41 +0800
Message-ID: <20211007094941.6641-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211007094941.6641-1-shayne.chen@mediatek.com>
References: <20211007094941.6641-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_025302_776459_0A968B02 
X-CRM114-Status: GOOD (  10.57  )
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
index 24c4377e9681..d8391d61240d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -626,7 +626,6 @@ mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
 			       int vif, int nss)
 {
 	struct ieee80211_he_cap_elem *elem = &he_cap->he_cap_elem;
-	struct ieee80211_he_mcs_nss_supp *mcs = &he_cap->he_mcs_nss_supp;
 	u8 c;
 
 #ifdef CONFIG_MAC80211_MESH
@@ -678,8 +677,11 @@ mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
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
 
 	c = IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMING_FB |
@@ -785,7 +787,11 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
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
index f48ece0fc569..a4ca6d12f3a8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1395,6 +1395,10 @@ mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	    IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ)
 		cap |= STA_REC_HE_CAP_LE_EQ_80M_RX_STBC;
 
+	if (elem->phy_cap_info[6] &
+	    IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB)
+		cap |= STA_REC_HE_CAP_TRIG_CQI_FK;
+
 	if (elem->phy_cap_info[6] &
 	    IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE)
 		cap |= STA_REC_HE_CAP_PARTIAL_BW_EXT_RANGE;
@@ -1419,10 +1423,6 @@ mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
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
