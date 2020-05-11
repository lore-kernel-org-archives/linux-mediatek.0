Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD79C54E8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7858A20708
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dor0fx0K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IuE7zNlk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7858A20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REyWGrqa6mzfNrdE0gYVTM+3MB9c16Y/g/IuLcPB4CA=; b=dor0fx0Kqr2uPZ
	9ru3nAMQtqz5Zt4BcnPVShxMpc6JYxZ5pG5yFQzvOtSUiAfAC9oTfvTIjaSmFGebodQeuKvvDzKfP
	uiIaDvIyUFRy0D+OPwvR2tgnSn5tjxvzu4oGthezxMGgJvffdvgDBv9EBBu/kSW2iQfnDoQy92g0/
	mfuWv4hE5CHn5AccGnXnHZERGL/40DM0YoybRSdIQBR64wrH8Llntlo+KYj78PRo5b+yjXqbL7SyF
	ErsNgX+ULKM75eoAXH/oyYzjlgOMlCYGN4WYVaog0TuJaOHNxacnFKet+ch1OzTZS1AKmqo847Hp4
	Y8WazbuMDRcBVGc683HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAxL-00050M-Rx; Mon, 11 May 2020 16:07:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAxJ-0004x3-5c
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 16:07:02 +0000
X-UUID: 4cdaa2bfc0a14706a4aa89f3a29a18b6-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FHEMH0BW/B3IHs8+yf1A994YLQsxOjuJtYLfdF1XWY4=; 
 b=IuE7zNlkdntWxNzkOVb7sIgdJb/BTG2YE/ECuQ7D1DrQtAv4GXLu0jMRwSUzWRfoOVhGVEXONbnMnlhVCGUO6XyKIgHSQPtRT0ExC4O3qXAWB8Kfs45huEUKkUWCaxFe+s13FbsvOphDvTcUm3j1/R++RcC9OMQmetAstadL/qU=;
X-UUID: 4cdaa2bfc0a14706a4aa89f3a29a18b6-20200511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 217721899; Mon, 11 May 2020 08:06:23 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 09:06:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 May 2020 00:06:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 May 2020 00:06:39 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/7] mt76: mt7915: introduce mt7915_get_he_phy_cap
Date: Tue, 12 May 2020 00:06:32 +0800
Message-ID: <388715592e47739507970be49766ffb35af95afb.1589212457.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1589212457.git.ryder.lee@mediatek.com>
References: <cover.1589212457.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A76AA779FF5C4AF74D3C76B7265B4893BA8FC5ED108C5E0E47693D5A5BD4FCA62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_090701_225922_8D36B1DB 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a helper to reduce duplicate codes.
This is a preliminary patch to add Tx beamforming support.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 31 +++++++++++--------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 3e3d6f1d555a..c147a033250a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -134,6 +134,18 @@ static u8 mt7915_mcu_chan_bw(struct cfg80211_chan_def *chandef)
 	return width_to_bw[chandef->width];
 }
 
+static const struct ieee80211_sta_he_cap *
+mt7915_get_he_phy_cap(struct mt7915_phy *phy, struct ieee80211_vif *vif)
+{
+	struct ieee80211_supported_band *sband;
+	enum nl80211_band band;
+
+	band = phy->mt76->chandef.chan->band;
+	sband = phy->mt76->hw->wiphy->bands[band];
+
+	return ieee80211_get_he_iftype_cap(sband, vif->type);
+}
+
 static u8
 mt7915_get_phy_mode(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		    enum nl80211_band band, struct ieee80211_sta *sta)
@@ -149,11 +161,12 @@ mt7915_get_phy_mode(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		he_cap = &sta->he_cap;
 	} else {
 		struct ieee80211_supported_band *sband;
+		struct mt7915_phy *phy;
+		struct mt7915_vif *mvif;
 
-		if (band == NL80211_BAND_2GHZ)
-			sband = &dev->mphy.sband_2g.sband;
-		else
-			sband = &dev->mphy.sband_5g.sband;
+		mvif = (struct mt7915_vif *)vif->drv_priv;
+		phy = mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
+		sband = phy->mt76->hw->wiphy->bands[band];
 
 		ht_cap = &sband->ht_cap;
 		vht_cap = &sband->vht_cap;
@@ -884,19 +897,11 @@ mt7915_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 {
 #define DEFAULT_HE_PE_DURATION		4
 #define DEFAULT_HE_DURATION_RTS_THRES	1023
-	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
-	enum nl80211_band band = chandef->chan->band;
-	struct ieee80211_supported_band *sband;
 	const struct ieee80211_sta_he_cap *cap;
 	struct bss_info_he *he;
 	struct tlv *tlv;
 
-	if (band == NL80211_BAND_2GHZ)
-		sband = &phy->mt76->sband_2g.sband;
-	else
-		sband = &phy->mt76->sband_5g.sband;
-
-	cap = ieee80211_get_he_iftype_cap(sband, vif->type);
+	cap = mt7915_get_he_phy_cap(phy, vif);
 
 	tlv = mt7915_mcu_add_tlv(skb, BSS_INFO_HE_BASIC, sizeof(*he));
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
