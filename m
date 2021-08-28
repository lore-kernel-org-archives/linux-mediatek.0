Return-Path: <SRS0=5qoa=NT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014B2C432BE
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Aug 2021 20:01:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1FE60EB0
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Aug 2021 20:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE1FE60EB0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rBdrYUOLHhb+4Z3EL+K9T0F/+vRgs9a1slYxL81yRjQ=; b=PLrJ7IbF1Z+Y8+
	5XGnhHAZit/jAPGiafR7Oop3imXtLMUQ/vhc6F2AzFYcNk80cGGoa+VYqaVNvAugH54YscwplEtx1
	XdEituH/9lU76D/ZrLHEJSq48oiEf/BZGRJGPkqL3OfErSOpnDAWhBA5hXAIqkDU69YkruhWznVsk
	pghaZUcDQBAkSOhsLYqU5WNR/5/PTBuIdaOBsGlBeLKCF//rThm6OH2bFkBwOF5WRFoH2Ig9Jnea0
	y0KheNHsl9nC13JQG8pk8+q3uo/BDlUPGKK66H7V79SmYzWnKDJJsOAt1Ci8+PTgoS86H4GRelkTd
	jRLU4QNpijyTfd6ntMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mK4Vw-00Ef7V-Co; Sat, 28 Aug 2021 20:01:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK4Vr-00Ef6o-8q
 for linux-mediatek@lists.infradead.org; Sat, 28 Aug 2021 20:01:15 +0000
X-UUID: 8eae74d3dc3f45ceaf843cecf834a362-20210828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CgnEvi/xJaDRh5aTP1jsSZK1TdsFIHKOhme2N4BFs0g=; 
 b=nWMNRU4ID8AQGDRwq+lA7XmzF7AeLANHeF6ymV6HXqsROTXyjEzkxw6yY7zB0OhYrmiqAwOpPm4UypltTRoxJXwZunyV3kP53TfxYA3TEqcvpUN4WM5g7b0p3mPnSP4tbw4nEw0Cd3ZUk8KySTG4NP3JFSmg/7lcvvu1CK99JtU=;
X-UUID: 8eae74d3dc3f45ceaf843cecf834a362-20210828
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1270142692; Sat, 28 Aug 2021 13:01:06 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 28 Aug 2021 13:01:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 29 Aug 2021 04:01:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 29 Aug 2021 04:01:03 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: enable configured beacon tx rate
Date: Sun, 29 Aug 2021 04:01:02 +0800
Message-ID: <f915e8849cb416eb36dc655bb6208db43cd37e32.1630180819.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210828_130111_371750_BE444FD0 
X-CRM114-Status: GOOD (  11.75  )
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

The user is allowed to change beacon tx rate (HT/VHT/HE) from hostapd.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  4 ++
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 59 +++++++++++++++----
 2 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 6208f5662704..acc83e9f409b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -325,6 +325,10 @@ mt7915_init_wiphy(struct ieee80211_hw *hw)
 	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_VHT_IBSS);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_LEGACY);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HT);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_VHT);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HE);
 
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
 	ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 1b8e37e265cb..6305f3231537 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -993,6 +993,51 @@ mt7915_mac_write_txwi_80211(struct mt7915_dev *dev, __le32 *txwi,
 	txwi[7] |= cpu_to_le32(val);
 }
 
+static u16
+mt7915_mac_tx_rate_val(struct mt76_phy *mphy, struct ieee80211_vif *vif,
+		       bool beacon, bool mcast)
+{
+	u8 mode = 0, band = mphy->chandef.chan->band;
+	int rateidx = 0, mcast_rate;
+
+	if (beacon) {
+		struct cfg80211_bitrate_mask *mask;
+
+		mask = &vif->bss_conf.beacon_tx_rate;
+		if (hweight16(mask->control[band].he_mcs[0]) == 1) {
+			rateidx = ffs(mask->control[band].he_mcs[0]) - 1;
+			mode = MT_PHY_TYPE_HE_SU;
+			goto out;
+		} else if (hweight16(mask->control[band].vht_mcs[0]) == 1) {
+			rateidx = ffs(mask->control[band].vht_mcs[0]) - 1;
+			mode = MT_PHY_TYPE_VHT;
+			goto out;
+		} else if (hweight8(mask->control[band].ht_mcs[0]) == 1) {
+			rateidx = ffs(mask->control[band].ht_mcs[0]) - 1;
+			mode = MT_PHY_TYPE_HT;
+			goto out;
+		} else if (hweight32(mask->control[band].legacy) == 1) {
+			rateidx = ffs(mask->control[band].legacy) - 1;
+			goto legacy;
+		}
+	}
+
+	mcast_rate = vif->bss_conf.mcast_rate[band];
+	if (mcast && mcast_rate > 0)
+		rateidx = mcast_rate - 1;
+	else
+		rateidx = ffs(vif->bss_conf.basic_rates) - 1;
+
+legacy:
+	rateidx = mt76_calculate_default_rate(mphy, rateidx);
+	mode = rateidx >> 8;
+	rateidx &= GENMASK(7, 0);
+
+out:
+	return FIELD_PREP(MT_TX_RATE_IDX, rateidx) |
+	       FIELD_PREP(MT_TX_RATE_MODE, mode);
+}
+
 void mt7915_mac_write_txwi(struct mt7915_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid, int pid,
 			   struct ieee80211_key_conf *key, bool beacon)
@@ -1069,23 +1114,11 @@ void mt7915_mac_write_txwi(struct mt7915_dev *dev, __le32 *txwi,
 		mt7915_mac_write_txwi_80211(dev, txwi, skb, key, &mcast);
 
 	if (txwi[2] & cpu_to_le32(MT_TXD2_FIX_RATE)) {
-		u8 band = mphy->chandef.chan->band;
-		int rateidx, mcast_rate = vif->bss_conf.mcast_rate[band];
-		u16 rate, mode;
+		u16 rate = mt7915_mac_tx_rate_val(mphy, vif, beacon, mcast);
 
 		/* hardware won't add HTC for mgmt/ctrl frame */
 		txwi[2] |= cpu_to_le32(MT_TXD2_HTC_VLD);
 
-		if (mcast && mcast_rate > 0)
-			rateidx = mcast_rate - 1;
-		else
-			rateidx = ffs(vif->bss_conf.basic_rates) - 1;
-
-		rate = mt76_calculate_default_rate(mphy, rateidx);
-		mode = rate >> 8;
-		rate &= GENMASK(7, 0);
-		rate |= FIELD_PREP(MT_TX_RATE_MODE, mode);
-
 		val = MT_TXD6_FIXED_BW |
 		      FIELD_PREP(MT_TXD6_TX_RATE, rate);
 		txwi[6] |= cpu_to_le32(val);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
