Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:55:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51296615A4
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 09:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51296615A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqNYEijOuDGlSEH6S6+2G601MPsko8u0JMzjm7S8nUE=; b=klz72JklJvIw1O
	T/KBuZ3sYINg7aJ+OTTmOKbCVkQaBlhG92dQrbyGOLMx2/Gy0OBaoTNBoigFFIt1wewEc4m8018iU
	J6EqS0XhyRmPllFeqAw2iXQj1IomVfYNviRDoQuOlXNvVHKz3h2uRliyqCf2SoKmCCFFzwS/oG6Ix
	uAXAVkS3IAZ49LKBt4VhqyTx8Me79v5fXCrsa38hojJk7BixiOq2IS25tyzYQG+5cGQ/FnRP/FvRN
	jFUhaX19gTZwKftKvvcZRYpFYZmLlI29fR98pNYmcdtCezm6TsYDBla0nYL1ZaoY+Ma4fpaTUz/YI
	sq7Y0Nf+7JguWjGLCGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWFG0-00HMq4-V3; Fri, 01 Oct 2021 09:55:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWFF0-00HMPm-HL
 for linux-mediatek@lists.infradead.org; Fri, 01 Oct 2021 09:54:09 +0000
X-UUID: 6646c4300dfe4945bd9de8944feddfbc-20211001
X-UUID: 6646c4300dfe4945bd9de8944feddfbc-20211001
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 228092003; Fri, 01 Oct 2021 02:54:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Oct 2021 02:54:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 1 Oct 2021 17:54:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Oct 2021 17:54:00 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v5 2/8] mt76: mt7915: fix txbf starec TLV issues
Date: Fri, 1 Oct 2021 17:53:49 +0800
Message-ID: <20211001095355.10598-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211001095355.10598-1-shayne.chen@mediatek.com>
References: <20211001095355.10598-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_025406_640715_239FE5F6 
X-CRM114-Status: GOOD (  16.95  )
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

From: Ryder Lee <ryder.lee@mediatek.com>

With this patch we can append txbf starec TLVs. This is an intermediate
patch to improve HE MUMIMO performances.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 139 +++++++++---------
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |   4 +-
 2 files changed, 71 insertions(+), 72 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index f4ae53eca8fb..a6ecdf4ce4c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1768,6 +1768,45 @@ int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 				     MCU_EXT_CMD(STA_REC_UPDATE), true);
 }
 
+static inline bool
+mt7915_is_ebf_supported(struct mt7915_phy *phy, struct ieee80211_vif *vif,
+			struct ieee80211_sta *sta, bool bfee)
+{
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	int tx_ant = hweight8(phy->mt76->chainmask) - 1;
+
+	if (vif->type != NL80211_IFTYPE_STATION &&
+	    vif->type != NL80211_IFTYPE_AP)
+		return false;
+
+	if (!bfee && tx_ant < 2)
+		return false;
+
+	if (sta->he_cap.has_he) {
+		struct ieee80211_he_cap_elem *pe = &sta->he_cap.he_cap_elem;
+
+		if (bfee)
+			return mvif->cap.he_su_ebfee &&
+			       HE_PHY(CAP3_SU_BEAMFORMER, pe->phy_cap_info[3]);
+		else
+			return mvif->cap.he_su_ebfer &&
+			       HE_PHY(CAP4_SU_BEAMFORMEE, pe->phy_cap_info[4]);
+	}
+
+	if (sta->vht_cap.vht_supported) {
+		u32 cap = sta->vht_cap.cap;
+
+		if (bfee)
+			return mvif->cap.vht_su_ebfee &&
+			       (cap & IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE);
+		else
+			return mvif->cap.vht_su_ebfer &&
+			       (cap & IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE);
+	}
+
+	return false;
+}
+
 static void
 mt7915_mcu_sta_sounding_rate(struct sta_rec_bf *bf)
 {
@@ -1899,10 +1938,12 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 }
 
 static void
-mt7915_mcu_sta_bfer_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
-			struct ieee80211_vif *vif, struct mt7915_phy *phy,
-			bool enable, bool explicit)
+mt7915_mcu_sta_bfer_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
+			struct ieee80211_vif *vif, struct ieee80211_sta *sta)
 {
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_phy *phy =
+		mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
 	int tx_ant = hweight8(phy->mt76->chainmask) - 1;
 	struct sta_rec_bf *bf;
 	struct tlv *tlv;
@@ -1912,25 +1953,23 @@ mt7915_mcu_sta_bfer_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		{2, 4, 4, 0},	/* 3x1, 3x2, 3x3, 3x4 */
 		{3, 5, 6, 0}	/* 4x1, 4x2, 4x3, 4x4 */
 	};
+	bool ebf;
 
-#define MT_BFER_FREE		cpu_to_le16(GENMASK(15, 0))
+	ebf = mt7915_is_ebf_supported(phy, vif, sta, false);
+	if (!ebf && !dev->ibf)
+		return;
 
 	tlv = mt7915_mcu_add_tlv(skb, STA_REC_BF, sizeof(*bf));
 	bf = (struct sta_rec_bf *)tlv;
 
-	if (!enable) {
-		bf->pfmu = MT_BFER_FREE;
-		return;
-	}
-
 	/* he: eBF only, in accordance with spec
 	 * vht: support eBF and iBF
 	 * ht: iBF only, since mac80211 lacks of eBF support
 	 */
-	if (sta->he_cap.has_he && explicit)
+	if (sta->he_cap.has_he && ebf)
 		mt7915_mcu_sta_bfer_he(sta, vif, phy, bf);
 	else if (sta->vht_cap.vht_supported)
-		mt7915_mcu_sta_bfer_vht(sta, phy, bf, explicit);
+		mt7915_mcu_sta_bfer_vht(sta, phy, bf, ebf);
 	else if (sta->ht_cap.ht_supported)
 		mt7915_mcu_sta_bfer_ht(sta, phy, bf);
 	else
@@ -1940,12 +1979,12 @@ mt7915_mcu_sta_bfer_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	bf->ibf_dbw = sta->bandwidth;
 	bf->ibf_nrow = tx_ant;
 
-	if (!explicit && sta->bandwidth <= IEEE80211_STA_RX_BW_40 && !bf->nc)
+	if (!ebf && sta->bandwidth <= IEEE80211_STA_RX_BW_40 && !bf->nc)
 		bf->ibf_timeout = 0x48;
 	else
 		bf->ibf_timeout = 0x18;
 
-	if (explicit && bf->nr != tx_ant)
+	if (ebf && bf->nr != tx_ant)
 		bf->mem_20m = matrix[tx_ant][bf->nc];
 	else
 		bf->mem_20m = matrix[bf->nr][bf->nc];
@@ -1965,14 +2004,20 @@ mt7915_mcu_sta_bfer_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 }
 
 static void
-mt7915_mcu_sta_bfee_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
-			struct mt7915_phy *phy)
+mt7915_mcu_sta_bfee_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
+			struct ieee80211_vif *vif, struct ieee80211_sta *sta)
 {
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_phy *phy =
+		mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
 	int tx_ant = hweight8(phy->mt76->chainmask) - 1;
 	struct sta_rec_bfee *bfee;
 	struct tlv *tlv;
 	u8 nr = 0;
 
+	if (!mt7915_is_ebf_supported(phy, vif, sta, true))
+		return;
+
 	tlv = mt7915_mcu_add_tlv(skb, STA_REC_BFEE, sizeof(*bfee));
 	bfee = (struct sta_rec_bfee *)tlv;
 
@@ -1998,68 +2043,20 @@ mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 {
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-	struct mt7915_phy *phy;
 	struct sk_buff *skb;
-	int r, len;
-	bool ebfee = false, ebfer = false;
-
-	if (vif->type != NL80211_IFTYPE_STATION &&
-	    vif->type != NL80211_IFTYPE_AP)
-		return 0;
-
-	phy = mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
-
-	if (sta->he_cap.has_he) {
-		struct ieee80211_he_cap_elem *pe = &sta->he_cap.he_cap_elem;
-
-		ebfee = mvif->cap.he_su_ebfee &&
-			HE_PHY(CAP3_SU_BEAMFORMER, pe->phy_cap_info[3]);
-		ebfer = mvif->cap.he_su_ebfer &&
-			HE_PHY(CAP4_SU_BEAMFORMEE, pe->phy_cap_info[4]);
-	} else if (sta->vht_cap.vht_supported) {
-		u32 cap = sta->vht_cap.cap;
-
-		ebfee = mvif->cap.vht_su_ebfee &&
-			(cap & IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE);
-		ebfer = mvif->cap.vht_su_ebfer &&
-			(cap & IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE);
-	}
 
-	/* must keep each tag independent */
+	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
+				       MT7915_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
 
 	/* starec bf */
-	if (ebfer || dev->ibf) {
-		len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bf);
-
-		skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
-		if (IS_ERR(skb))
-			return PTR_ERR(skb);
-
-		mt7915_mcu_sta_bfer_tlv(skb, sta, vif, phy, enable, ebfer);
-
-		r = mt76_mcu_skb_send_msg(&dev->mt76, skb,
-					  MCU_EXT_CMD(STA_REC_UPDATE), true);
-		if (r)
-			return r;
-	}
-
+	mt7915_mcu_sta_bfer_tlv(dev, skb, vif, sta);
 	/* starec bfee */
-	if (ebfee) {
-		len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bfee);
-
-		skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
-		if (IS_ERR(skb))
-			return PTR_ERR(skb);
-
-		mt7915_mcu_sta_bfee_tlv(skb, sta, phy);
-
-		r = mt76_mcu_skb_send_msg(&dev->mt76, skb,
-					  MCU_EXT_CMD(STA_REC_UPDATE), true);
-		if (r)
-			return r;
-	}
+	mt7915_mcu_sta_bfee_tlv(dev, skb, vif, sta);
 
-	return 0;
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_EXT_CMD(STA_REC_UPDATE), true);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index ee732e206751..374d44f71522 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -1006,7 +1006,7 @@ struct sta_rec_bf {
 	bool codebook75_mu;
 
 	u8 he_ltf;
-	u8 rsv[2];
+	u8 rsv[3];
 } __packed;
 
 struct sta_rec_bfee {
@@ -1107,12 +1107,14 @@ enum {
 
 #define MT7915_STA_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +	\
 					 sizeof(struct sta_rec_basic) +	\
+					 sizeof(struct sta_rec_bf) +	\
 					 sizeof(struct sta_rec_ht) +	\
 					 sizeof(struct sta_rec_he) +	\
 					 sizeof(struct sta_rec_ba) +	\
 					 sizeof(struct sta_rec_vht) +	\
 					 sizeof(struct sta_rec_uapsd) + \
 					 sizeof(struct sta_rec_amsdu) +	\
+					 sizeof(struct sta_rec_bfee) +	\
 					 sizeof(struct tlv) +		\
 					 MT7915_WTBL_UPDATE_MAX_SIZE)
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
