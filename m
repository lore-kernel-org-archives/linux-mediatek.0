Return-Path: <SRS0=qrwZ=H5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965B9C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Feb 2021 07:40:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A0464E24
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Feb 2021 07:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00A0464E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8s+D7K9Kq265OxzQhgnGx7wpPY1x9ZTWHFPwe34yo0o=; b=Eexth2a2iAf4OUwhcJXC0UvK+
	3xh7l7zni1zX7QNSqMfDLyHiQ8A1lWxXG4+rXr+/Bnx25vnZiMYaCUj/i4QfZC/yYYTyyrqDHx8PF
	7d9TCUtHMefcWA3q5M0bNdJWIB/Lck6FgZlKNMrZyKyqHkyngtkPPRD6tzR/su+AibYz/WGFjsOaB
	eTOy254uafWwUd/pFup9c4MMQ3DgmjT2YL/ikex2JYgIoRQEoRGEVHNe09f4IeHNPc+VcRTne3Bj1
	HhNfWpy1Bnqm0TRnJrO+zndqspD2WQatM7PyTp90hu3Yiy1ZNdTYdATkDsO4lTKb3uGljWBzF4Wa0
	6BZ2wbB0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFuDO-0007RT-4T; Sat, 27 Feb 2021 07:40:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFuDL-0007Pt-3L
 for linux-mediatek@lists.infradead.org; Sat, 27 Feb 2021 07:40:36 +0000
X-UUID: fca83c5e44c14759b3d70a391a036e6a-20210226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bjsNmR7bUQTlau8073HoFHSMumBuzlSdOYXIwG7GPQU=; 
 b=ZVWV30Du+HaN3rAECoadfi9k+dw2AVbYQ2vPamdm8RiiunEmyDPmgXQvHrdmzyNTiBcz4opsfq2VLNWQtu/wA8Blo0wXi2Kb1itmMqca9ZL0hck/OedlwFulQA2S0i4kOb/Ji44jt5bWZps87B5zaO1uR451CSzTPXR2akUSHVM=;
X-UUID: fca83c5e44c14759b3d70a391a036e6a-20210226
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1907054864; Fri, 26 Feb 2021 23:40:28 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 23:40:27 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 27 Feb 2021 15:40:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 27 Feb 2021 15:40:25 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 5/5] mt76: mt7915: fix PHY mode for DBDC
Date: Sat, 27 Feb 2021 15:39:46 +0800
Message-ID: <131cd1018ac752d4250a8e6abb8b841707275424.1614411256.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <d6f2573790582538e8ba82f87a4c35329692ee32.1614411256.git.ryder.lee@mediatek.com>
References: <d6f2573790582538e8ba82f87a4c35329692ee32.1614411256.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C580781EF9BD32FA0D43A1F34BA3C0A4545597197217040140EA547A0C68B3492000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210227_024035_326790_4CC32C89 
X-CRM114-Status: GOOD (  10.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix PHY mode configuration for DBDC.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 4abe32357edc..e0c03b7f278d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -147,9 +147,10 @@ mt7915_get_he_phy_cap(struct mt7915_phy *phy, struct ieee80211_vif *vif)
 }
 
 static u8
-mt7915_get_phy_mode(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-		    enum nl80211_band band, struct ieee80211_sta *sta)
+mt7915_get_phy_mode(struct mt76_phy *mphy, struct ieee80211_vif *vif,
+		    struct ieee80211_sta *sta)
 {
+	enum nl80211_band band = mphy->chandef.chan->band;
 	struct ieee80211_sta_ht_cap *ht_cap;
 	struct ieee80211_sta_vht_cap *vht_cap;
 	const struct ieee80211_sta_he_cap *he_cap;
@@ -161,12 +162,8 @@ mt7915_get_phy_mode(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		he_cap = &sta->he_cap;
 	} else {
 		struct ieee80211_supported_band *sband;
-		struct mt7915_phy *phy;
-		struct mt7915_vif *mvif;
 
-		mvif = (struct mt7915_vif *)vif->drv_priv;
-		phy = mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
-		sband = phy->mt76->hw->wiphy->bands[band];
+		sband = mphy->hw->wiphy->bands[band];
 
 		ht_cap = &sband->ht_cap;
 		vht_cap = &sband->vht_cap;
@@ -676,8 +673,6 @@ mt7915_mcu_bss_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 			 struct mt7915_phy *phy, bool enable)
 {
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
-	enum nl80211_band band = chandef->chan->band;
 	struct bss_info_basic *bss;
 	u16 wlan_idx = mvif->sta.wcid.idx;
 	u32 type = NETWORK_INFRA;
@@ -727,7 +722,7 @@ mt7915_mcu_bss_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 		memcpy(bss->bssid, vif->bss_conf.bssid, ETH_ALEN);
 		bss->bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int);
 		bss->dtim_period = vif->bss_conf.dtim_period;
-		bss->phy_mode = mt7915_get_phy_mode(phy->dev, vif, band, NULL);
+		bss->phy_mode = mt7915_get_phy_mode(phy->mt76, vif, NULL);
 	} else {
 		memcpy(bss->bssid, phy->mt76->macaddr, ETH_ALEN);
 	}
@@ -2069,25 +2064,30 @@ mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 
 static void
 mt7915_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb, struct mt7915_dev *dev,
-			     struct ieee80211_vif *vif,
-			     struct ieee80211_sta *sta)
+			     struct ieee80211_vif *vif, struct ieee80211_sta *sta)
 {
-	struct cfg80211_chan_def *chandef = &dev->mphy.chandef;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct mt76_phy *mphy = &dev->mphy;
+	enum nl80211_band band;
 	struct sta_rec_ra *ra;
 	struct tlv *tlv;
-	enum nl80211_band band = chandef->chan->band;
-	u32 supp_rate = sta->supp_rates[band];
-	int n_rates = hweight32(supp_rate);
-	u32 cap = sta->wme ? STA_CAP_WMM : 0;
+	u32 supp_rate, n_rates, cap = sta->wme ? STA_CAP_WMM : 0;
 	u8 i, nss = sta->rx_nss, mcs = 0;
 
 	tlv = mt7915_mcu_add_tlv(skb, STA_REC_RA, sizeof(*ra));
-
 	ra = (struct sta_rec_ra *)tlv;
+
+	if (msta->wcid.ext_phy && dev->mt76.phy2)
+		mphy = dev->mt76.phy2;
+
+	band = mphy->chandef.chan->band;
+	supp_rate = sta->supp_rates[band];
+	n_rates = hweight32(supp_rate);
+
 	ra->valid = true;
 	ra->auto_rate = true;
-	ra->phy_mode = mt7915_get_phy_mode(dev, vif, band, sta);
-	ra->channel = chandef->chan->hw_value;
+	ra->phy_mode = mt7915_get_phy_mode(mphy, vif, sta);
+	ra->channel = mphy->chandef.chan->hw_value;
 	ra->bw = sta->bandwidth;
 	ra->rate_len = n_rates;
 	ra->phy.bw = sta->bandwidth;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
