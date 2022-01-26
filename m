Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF43C3525A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 02:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Q3tJRUvMW1eUUpQGq6AS+p3XsXj+lA8IVZOCkhWZc0=; b=ZVR+f/eu5I2ZIx
	C/qppqV2/LUSfmS/jIjYPYM88lJmZA4mQaPN0uDileKUbKGZRoRA4Bd1UQqhTIxlKPAAX0ttMBqif
	gOxqZ97+Ri+T/ZjJ3N5EjqJXkGlNuWfC705fRKHess+v0kPcoZjmDnLbzgpbyON9g2nzrRghfeqEz
	FdDi0i2gzQY8Z+PnI6YswIDGFuCSqM8NmNt2iXvcIgX5r7K6lB4xQ5bYkYKDt1kBhAtK9HPfM0LF4
	ucZG/Hrb0BXTQ3UqegEjafWNGiPv1IKvlydbWhkNQYMFZ91T+yTOOQY3WWrsRZRsVwZB0JtruuMK/
	nW40KRuXVufKG8hzzMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCXgr-009rMh-MA; Wed, 26 Jan 2022 02:05:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCXgm-009rLp-Vb
 for linux-mediatek@lists.infradead.org; Wed, 26 Jan 2022 02:05:39 +0000
X-UUID: d931af23a0934e41aba155760bbe9e7d-20220125
X-UUID: d931af23a0934e41aba155760bbe9e7d-20220125
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chui-hao.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 818054599; Tue, 25 Jan 2022 19:05:33 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 18:05:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 10:05:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 10:05:30 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix mcs_map in mt7915_mcu_set_sta_he_mcs()
Date: Wed, 26 Jan 2022 10:05:29 +0800
Message-ID: <20220126020529.12000-2-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220126020529.12000-1-chui-hao.chiu@mediatek.com>
References: <20220126020529.12000-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_180537_045597_76E1D825 
X-CRM114-Status: GOOD (  12.47  )
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

Should use peer's bandwidth instead of chandef->width to
get correct mcs_map.

Fixes: 76be6c076c077 ("mt76: mt7915: add .set_bitrate_mask() callback")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 29 +++++--------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 66f8daf3168c..efcadd69ecd7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -86,24 +86,12 @@ mt7915_mcu_get_sta_nss(u16 mcs_map)
 
 static void
 mt7915_mcu_set_sta_he_mcs(struct ieee80211_sta *sta, __le16 *he_mcs,
-			  const u16 *mask)
+			  u16 mcs_map)
 {
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-	struct cfg80211_chan_def *chandef = &msta->vif->phy->mt76->chandef;
+	enum nl80211_band band = msta->vif->phy->mt76->chandef.chan->band;
+	const u16 *mask = msta->vif->bitrate_mask.control[band].he_mcs;
 	int nss, max_nss = sta->rx_nss > 3 ? 4 : sta->rx_nss;
-	u16 mcs_map;
-
-	switch (chandef->width) {
-	case NL80211_CHAN_WIDTH_80P80:
-		mcs_map = le16_to_cpu(sta->he_cap.he_mcs_nss_supp.rx_mcs_80p80);
-		break;
-	case NL80211_CHAN_WIDTH_160:
-		mcs_map = le16_to_cpu(sta->he_cap.he_mcs_nss_supp.rx_mcs_160);
-		break;
-	default:
-		mcs_map = le16_to_cpu(sta->he_cap.he_mcs_nss_supp.rx_mcs_80);
-		break;
-	}
 
 	for (nss = 0; nss < max_nss; nss++) {
 		int mcs;
@@ -760,11 +748,9 @@ static void
 mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		      struct ieee80211_vif *vif)
 {
-	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 	struct ieee80211_he_cap_elem *elem = &sta->he_cap.he_cap_elem;
-	enum nl80211_band band = msta->vif->phy->mt76->chandef.chan->band;
-	const u16 *mcs_mask = msta->vif->bitrate_mask.control[band].he_mcs;
+	struct ieee80211_he_mcs_nss_supp mcs_map;
 	struct sta_rec_he *he;
 	struct tlv *tlv;
 	u32 cap = 0;
@@ -854,22 +840,23 @@ mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 
 	he->he_cap = cpu_to_le32(cap);
 
+	mcs_map = sta->he_cap.he_mcs_nss_supp;
 	switch (sta->bandwidth) {
 	case IEEE80211_STA_RX_BW_160:
 		if (elem->phy_cap_info[0] &
 		    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)
 			mt7915_mcu_set_sta_he_mcs(sta,
 						  &he->max_nss_mcs[CMD_HE_MCS_BW8080],
-						  mcs_mask);
+						  le16_to_cpu(mcs_map.rx_mcs_80p80));
 
 		mt7915_mcu_set_sta_he_mcs(sta,
 					  &he->max_nss_mcs[CMD_HE_MCS_BW160],
-					  mcs_mask);
+					  le16_to_cpu(mcs_map.rx_mcs_160));
 		fallthrough;
 	default:
 		mt7915_mcu_set_sta_he_mcs(sta,
 					  &he->max_nss_mcs[CMD_HE_MCS_BW80],
-					  mcs_mask);
+					  le16_to_cpu(mcs_map.rx_mcs_80));
 		break;
 	}
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
