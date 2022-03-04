Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBF5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 08:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5hBS5HjfSkng9Bz9vxADn1PgVlUs+qN0GYw9jgnUGrc=; b=AmCndNsb7TZUEU
	wBER2ERUbYKHHFarShzfWVIn2YSO+kUKh+x6W1QOWwtyHc3KBAYR8MUHUsHf8XbWNR+jfZo9yIVWI
	TzuP6PbLLsJJLIVpcgdKjbuBsgjfL2jBxb4+FPr7dgs5uxgeaaAx1kCHpGLpgtfFK9+/7/tphnuP/
	i7HNdc9JAsxDK8f2MKQI2rrSep4UwERQrSRoXDVnPL8uG4XI5A+x9DL8DUb76Al5EVwzQLOTINhYE
	aVGFsiiudknLluoyTOMEAB/GKrqEV0yLG+zPtVpSkx/Jj3QOT+ADBuHdgkIrLElLYSmob9hlFakB2
	GdUV27Ts/R6ywEZlzRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ2su-008tdR-4b; Fri, 04 Mar 2022 08:01:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ2sq-008taP-5e
 for linux-mediatek@lists.infradead.org; Fri, 04 Mar 2022 08:01:54 +0000
X-UUID: b8fad8ed8ad44fdfa37656a40c204d8b-20220304
X-UUID: b8fad8ed8ad44fdfa37656a40c204d8b-20220304
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <meichia.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1370599311; Fri, 04 Mar 2022 01:01:45 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 00:01:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 4 Mar 2022 16:01:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Mar 2022 16:01:41 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee
 <ryder.lee@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, MeiChia Chiu
 <MeiChia.Chiu@mediatek.com>, Money Wang <Money.Wang@mediatek.com>
Subject: [PATCH 1/4] mt76: connac: add 6 GHz support for wtbl and starec
 configuration
Date: Fri, 4 Mar 2022 16:01:17 +0800
Message-ID: <20220304080120.3907-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_000152_256548_AEBA7B70 
X-CRM114-Status: GOOD (  13.15  )
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

Since there are no HT & VHT IEs being sent in 6ghz,
some capabilities judgement and parsing for wtbl &
starec configuration should be modified to reflect such changes.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Money Wang <Money.Wang@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
---
The series is based on https://patchwork.kernel.org/project/linux-wireless/patch/20220302061406.24797-1-MeiChia.Chiu@mediatek.com/
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 6c762fbf9aaa..9f83fa379396 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -905,18 +905,27 @@ void mt76_connac_mcu_wtbl_ht_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 	struct tlv *tlv;
 	u32 flags = 0;
 
-	if (sta->ht_cap.ht_supported) {
+	if (sta->ht_cap.ht_supported || sta->he_6ghz_capa.capa) {
 		tlv = mt76_connac_mcu_add_nested_tlv(skb, WTBL_HT, sizeof(*ht),
 						     wtbl_tlv, sta_wtbl);
 		ht = (struct wtbl_ht *)tlv;
 		ht->ldpc = ht_ldpc &&
 			   !!(sta->ht_cap.cap & IEEE80211_HT_CAP_LDPC_CODING);
-		ht->af = sta->ht_cap.ampdu_factor;
-		ht->mm = sta->ht_cap.ampdu_density;
+
+		if (sta->ht_cap.ht_supported) {
+			ht->af = sta->ht_cap.ampdu_factor;
+			ht->mm = sta->ht_cap.ampdu_density;
+		} else {
+			ht->af = FIELD_GET(IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP,
+					   sta->he_6ghz_capa.capa);
+			ht->mm = FIELD_GET(IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START,
+					   sta->he_6ghz_capa.capa);
+		}
+
 		ht->ht = true;
 	}
 
-	if (sta->vht_cap.vht_supported) {
+	if (sta->vht_cap.vht_supported || sta->he_6ghz_capa.capa) {
 		struct wtbl_vht *vht;
 		u8 af;
 
@@ -1242,7 +1251,7 @@ u8 mt76_connac_get_phy_mode(struct mt76_phy *phy, struct ieee80211_vif *vif,
 
 		if (he_cap && he_cap->has_he)
 			mode |= PHY_MODE_AX_24G;
-	} else if (band == NL80211_BAND_5GHZ || band == NL80211_BAND_6GHZ) {
+	} else if (band == NL80211_BAND_5GHZ) {
 		mode |= PHY_MODE_A;
 
 		if (ht_cap->ht_supported)
@@ -1251,8 +1260,11 @@ u8 mt76_connac_get_phy_mode(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		if (vht_cap->vht_supported)
 			mode |= PHY_MODE_AC;
 
-		if (he_cap && he_cap->has_he && band == NL80211_BAND_5GHZ)
+		if (he_cap && he_cap->has_he)
 			mode |= PHY_MODE_AX_5G;
+	} else if (band == NL80211_BAND_6GHZ) {
+		mode |= PHY_MODE_A | PHY_MODE_AN |
+			PHY_MODE_AC | PHY_MODE_AX_5G;
 	}
 
 	return mode;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
