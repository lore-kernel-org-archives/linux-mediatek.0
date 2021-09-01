Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C020C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 16:50:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBDE160E98
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 16:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBDE160E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlX0DQdUshh4Pc5PXvebQMue6Wrv5D6DrHtJujFm91Q=; b=bsL6cl+tKGGCKN
	Flmq7I4f66xbi/37U+ipCNRQnjTsqSEJRXXthNFEAGVDKXt10/h+dx1gk3vfDbCM249YhdGi9oaZo
	gnjr2qkcz5Gdz/P9/pd3f63L5i7LLpJKEYylZQwbzjdAo7lslWhYkBEeK1y3Ns1QsoZ4AxoxZD099
	0yotHrAIvV6kL3momvngGV9VBgNFE8cZHPoPduoBdX9hP8dvVGLQa/PjCtwxnwgS/EgE1MKPqZx3x
	LpwKflpvALOJKzb2c79rMHZU+aM8rTwP30s1+slfMBxCj9jDCAYhRKvIRFieP0BjVed6wAU9HPp19
	cbzDQS6zxzxIzZ/7j/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLTRL-006bri-Fc; Wed, 01 Sep 2021 16:50:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLTRA-006bkB-PZ
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 16:50:15 +0000
X-UUID: 7e22791d538940bbbef2695e15be8b37-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rMJMbY9zx4FFJYAN3WULh7iplhgLmlNSoviFYp5YYoo=; 
 b=p35wSxbirhhW+fzmzdEQT2wqIT6zfyiAPaUt8afJ6JAqxwIP8s0mmLlcgUBXdG2jeqTr0ufIM0ZG7LuYiZR8zSIG+Q00GN44cv39Ks1RPxizXprhvX5/ay02/AAKi2+OhRGIEQ0tSNhQvKeyLbwhuKa+ASDcVxbZN/x3OjAxRB0=;
X-UUID: 7e22791d538940bbbef2695e15be8b37-20210901
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1568086356; Wed, 01 Sep 2021 09:50:04 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 09:50:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 00:50:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Sep 2021 00:50:00 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 5/5] mt76: mt7915: rework starec TLV tags
Date: Thu, 2 Sep 2021 00:49:48 +0800
Message-ID: <20210901164948.28149-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210901164948.28149-1-shayne.chen@mediatek.com>
References: <20210901164948.28149-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_095008_929926_C4EEF4B3 
X-CRM114-Status: GOOD (  17.43  )
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

Rework starec tags to the order which firmware expected. This also fixes
some weird behaviors when generating txcmd for HE-MU.

Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   3 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 225 +++++++-----------
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |   1 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   2 -
 4 files changed, 91 insertions(+), 140 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 0aea6272fd14..bfb52514ae4b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -635,7 +635,7 @@ int mt7915_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (ret)
 		return ret;
 
-	return mt7915_mcu_add_sta_adv(dev, vif, sta, true);
+	return mt7915_mcu_add_rate_ctrl(dev, vif, sta, false);
 }
 
 void mt7915_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
@@ -644,7 +644,6 @@ void mt7915_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 
-	mt7915_mcu_add_sta_adv(dev, vif, sta, false);
 	mt7915_mcu_add_sta(dev, vif, sta, false);
 
 	mt7915_mac_wtbl_update(dev, msta->wcid.idx,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 9c29b1567d89..6ede406c7846 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1322,14 +1322,16 @@ mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 {
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
-	struct ieee80211_he_cap_elem *elem = &he_cap->he_cap_elem;
+	struct ieee80211_he_cap_elem *elem = &sta->he_cap.he_cap_elem;
 	enum nl80211_band band = msta->vif->phy->mt76->chandef.chan->band;
 	const u16 *mcs_mask = msta->vif->bitrate_mask.control[band].he_mcs;
 	struct sta_rec_he *he;
 	struct tlv *tlv;
 	u32 cap = 0;
 
+	if (!sta->he_cap.has_he)
+		return;
+
 	tlv = mt7915_mcu_add_tlv(skb, STA_REC_HE, sizeof(*he));
 
 	he = (struct sta_rec_he *)tlv;
@@ -1494,11 +1496,13 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 			struct ieee80211_vif *vif)
 {
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
-	struct ieee80211_he_cap_elem *elem = &he_cap->he_cap_elem;
+	struct ieee80211_he_cap_elem *elem = &sta->he_cap.he_cap_elem;
 	struct sta_rec_muru *muru;
 	struct tlv *tlv;
 
+	if (!sta->vht_cap.vht_supported && !sta->he_cap.has_he)
+		return;
+
 	tlv = mt7915_mcu_add_tlv(skb, STA_REC_MURU, sizeof(*muru));
 
 	muru = (struct sta_rec_muru *)tlv;
@@ -1544,12 +1548,27 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		HE_PHY(CAP2_UL_MU_PARTIAL_MU_MIMO, elem->phy_cap_info[2]);
 }
 
+static void
+mt7915_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+{
+	struct sta_rec_ht *ht;
+	struct tlv *tlv;
+
+	tlv = mt7915_mcu_add_tlv(skb, STA_REC_HT, sizeof(*ht));
+
+	ht = (struct sta_rec_ht *)tlv;
+	ht->ht_cap = cpu_to_le16(sta->ht_cap.cap);
+}
+
 static void
 mt7915_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 {
 	struct sta_rec_vht *vht;
 	struct tlv *tlv;
 
+	if (!sta->vht_cap.vht_supported)
+		return;
+
 	tlv = mt7915_mcu_add_tlv(skb, STA_REC_VHT, sizeof(*vht));
 
 	vht = (struct sta_rec_vht *)tlv;
@@ -1559,12 +1578,17 @@ mt7915_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 }
 
 static void
-mt7915_mcu_sta_amsdu_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+mt7915_mcu_sta_amsdu_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
+			 struct ieee80211_sta *sta)
 {
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct sta_rec_amsdu *amsdu;
 	struct tlv *tlv;
 
+	if (vif->type != NL80211_IFTYPE_STATION &&
+	    vif->type != NL80211_IFTYPE_AP)
+		return;
+
 	if (!sta->max_amsdu_len)
 		return;
 
@@ -1577,44 +1601,6 @@ mt7915_mcu_sta_amsdu_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 	msta->wcid.amsdu = true;
 }
 
-static bool
-mt7915_hw_amsdu_supported(struct ieee80211_vif *vif)
-{
-	switch (vif->type) {
-	case NL80211_IFTYPE_AP:
-	case NL80211_IFTYPE_STATION:
-		return true;
-	default:
-		return false;
-	}
-}
-
-static void
-mt7915_mcu_sta_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
-		   struct ieee80211_sta *sta, struct ieee80211_vif *vif)
-{
-	struct tlv *tlv;
-
-	/* starec ht */
-	if (sta->ht_cap.ht_supported) {
-		struct sta_rec_ht *ht;
-
-		tlv = mt7915_mcu_add_tlv(skb, STA_REC_HT, sizeof(*ht));
-		ht = (struct sta_rec_ht *)tlv;
-		ht->ht_cap = cpu_to_le16(sta->ht_cap.cap);
-
-		if (mt7915_hw_amsdu_supported(vif))
-			mt7915_mcu_sta_amsdu_tlv(skb, sta);
-	}
-
-	/* starec he */
-	if (sta->he_cap.has_he)
-		mt7915_mcu_sta_he_tlv(skb, sta, vif);
-
-	/* starec uapsd */
-	mt7915_mcu_sta_uapsd_tlv(skb, sta, vif);
-}
-
 static void
 mt7915_mcu_wtbl_smps_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 			 void *sta_wtbl, void *wtbl_tlv)
@@ -1625,9 +1611,7 @@ mt7915_mcu_wtbl_smps_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	tlv = mt7915_mcu_add_nested_tlv(skb, WTBL_SMPS, sizeof(*smps),
 					wtbl_tlv, sta_wtbl);
 	smps = (struct wtbl_smps *)tlv;
-
-	if (sta->smps_mode == IEEE80211_SMPS_DYNAMIC)
-		smps->smps = true;
+	smps->smps = (sta->smps_mode == IEEE80211_SMPS_DYNAMIC);
 }
 
 static void
@@ -1701,6 +1685,32 @@ mt7915_mcu_wtbl_hdr_trans_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	}
 }
 
+static int
+mt7915_mcu_sta_wtbl_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
+			struct ieee80211_vif *vif, struct ieee80211_sta *sta)
+{
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_sta *msta;
+	struct wtbl_req_hdr *wtbl_hdr;
+	struct tlv *tlv;
+
+	msta = sta ? (struct mt7915_sta *)sta->drv_priv : &mvif->sta;
+
+	tlv = mt7915_mcu_add_tlv(skb, STA_REC_WTBL, sizeof(struct tlv));
+	wtbl_hdr = mt7915_mcu_alloc_wtbl_req(dev, msta, WTBL_RESET_AND_SET,
+					     tlv, &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
+	mt7915_mcu_wtbl_generic_tlv(skb, vif, sta, tlv, wtbl_hdr);
+	mt7915_mcu_wtbl_hdr_trans_tlv(skb, vif, sta, tlv, wtbl_hdr);
+
+	if (sta)
+		mt7915_mcu_wtbl_ht_tlv(skb, vif, sta, tlv, wtbl_hdr);
+
+	return 0;
+}
+
 int mt7915_mcu_sta_update_hdr_trans(struct mt7915_dev *dev,
 				    struct ieee80211_vif *vif,
 				    struct ieee80211_sta *sta)
@@ -2020,28 +2030,6 @@ mt7915_mcu_sta_bfee_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 	bfee->fb_identity_matrix = (nrow == 1 && tx_ant == 2);
 }
 
-static int
-mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-		    struct ieee80211_sta *sta, bool enable)
-{
-	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-	struct sk_buff *skb;
-
-	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
-				       MT7915_STA_UPDATE_MAX_SIZE);
-	if (IS_ERR(skb))
-		return PTR_ERR(skb);
-
-	/* starec bf */
-	mt7915_mcu_sta_bfer_tlv(dev, skb, vif, sta);
-	/* starec bfee */
-	mt7915_mcu_sta_bfee_tlv(dev, skb, vif, sta);
-
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				     MCU_EXT_CMD(STA_REC_UPDATE), true);
-}
-
 int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
@@ -2280,7 +2268,7 @@ int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	 * control, so when dev->rc_work changes the settings driver should
 	 * update sta_rec_he here as well.
 	 */
-	if (sta->he_cap.has_he && changed)
+	if (changed)
 		mt7915_mcu_sta_he_tlv(skb, sta, vif);
 
 	/* sta_rec_ra accommodates BW, NSS and only MCS range format
@@ -2326,67 +2314,13 @@ mt7915_mcu_add_group(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 				 sizeof(req), true);
 }
 
-static int
-mt7915_mcu_add_mu(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-		  struct ieee80211_sta *sta)
-{
-	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-	struct sk_buff *skb;
-	int len, ret;
-
-	if (!sta->vht_cap.vht_supported && !sta->he_cap.has_he)
-		return 0;
-
-	ret = mt7915_mcu_add_group(dev, vif, sta);
-	if (ret)
-		return ret;
-
-	len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_muru) +
-	      sizeof(struct sta_rec_vht);
-	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
-	if (IS_ERR(skb))
-		return PTR_ERR(skb);
-
-	/* wait until TxBF and MU ready to update stare vht */
-
-	/* starec muru */
-	mt7915_mcu_sta_muru_tlv(skb, sta, vif);
-	/* starec vht */
-	mt7915_mcu_sta_vht_tlv(skb, sta);
-
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				     MCU_EXT_CMD(STA_REC_UPDATE), true);
-}
-
-int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-			   struct ieee80211_sta *sta, bool enable)
-{
-	int ret;
-
-	if (!sta)
-		return 0;
-
-	/* must keep the order */
-	ret = mt7915_mcu_add_txbf(dev, vif, sta, enable);
-	if (ret || !enable)
-		return ret;
-
-	ret = mt7915_mcu_add_mu(dev, vif, sta);
-	if (ret)
-		return ret;
-
-	return mt7915_mcu_add_rate_ctrl(dev, vif, sta, false);
-}
-
 int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta, bool enable)
 {
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct wtbl_req_hdr *wtbl_hdr;
 	struct mt7915_sta *msta;
-	struct tlv *sta_wtbl;
 	struct sk_buff *skb;
+	int ret;
 
 	msta = sta ? (struct mt7915_sta *)sta->drv_priv : &mvif->sta;
 
@@ -2395,24 +2329,43 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
+	/* starec basic */
 	mt7915_mcu_sta_basic_tlv(skb, vif, sta, enable);
-	if (enable && sta)
-		mt7915_mcu_sta_tlv(dev, skb, sta, vif);
+	if (!enable)
+		goto out;
 
-	sta_wtbl = mt7915_mcu_add_tlv(skb, STA_REC_WTBL, sizeof(struct tlv));
+	/* tag order is in accordance with firmware dependency. */
+	if (sta && sta->ht_cap.ht_supported) {
+		/* starec bfer */
+		mt7915_mcu_sta_bfer_tlv(dev, skb, vif, sta);
+		/* starec ht */
+		mt7915_mcu_sta_ht_tlv(skb, sta);
+		/* starec vht */
+		mt7915_mcu_sta_vht_tlv(skb, sta);
+		/* starec uapsd */
+		mt7915_mcu_sta_uapsd_tlv(skb, sta, vif);
+	}
 
-	wtbl_hdr = mt7915_mcu_alloc_wtbl_req(dev, msta, WTBL_RESET_AND_SET,
-					     sta_wtbl, &skb);
-	if (IS_ERR(wtbl_hdr))
-		return PTR_ERR(wtbl_hdr);
+	ret = mt7915_mcu_sta_wtbl_tlv(dev, skb, vif, sta);
+	if (ret)
+		return ret;
 
-	if (enable) {
-		mt7915_mcu_wtbl_generic_tlv(skb, vif, sta, sta_wtbl, wtbl_hdr);
-		mt7915_mcu_wtbl_hdr_trans_tlv(skb, vif, sta, sta_wtbl, wtbl_hdr);
-		if (sta)
-			mt7915_mcu_wtbl_ht_tlv(skb, vif, sta, sta_wtbl, wtbl_hdr);
+	if (sta && sta->ht_cap.ht_supported) {
+		/* starec amsdu */
+		mt7915_mcu_sta_amsdu_tlv(skb, vif, sta);
+		/* starec he */
+		mt7915_mcu_sta_he_tlv(skb, sta, vif);
+		/* starec muru */
+		mt7915_mcu_sta_muru_tlv(skb, sta, vif);
+		/* starec bfee */
+		mt7915_mcu_sta_bfee_tlv(dev, skb, vif, sta);
+
+		ret = mt7915_mcu_add_group(dev, vif, sta);
+		if (ret)
+			return ret;
 	}
 
+out:
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_EXT_CMD(STA_REC_UPDATE), true);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index d604a39f8413..6344faf3f394 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -1104,6 +1104,7 @@ enum {
 					 sizeof(struct sta_rec_vht) +	\
 					 sizeof(struct sta_rec_uapsd) + \
 					 sizeof(struct sta_rec_amsdu) +	\
+					 sizeof(struct sta_rec_muru) +	\
 					 sizeof(struct sta_rec_bfee) +	\
 					 sizeof(struct tlv) +		\
 					 MT7915_WTBL_UPDATE_MAX_SIZE)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index d68e345765e8..f8f0bb3ca7cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -304,8 +304,6 @@ int mt7915_mcu_add_bss_info(struct mt7915_phy *phy,
 			    struct ieee80211_vif *vif, int enable);
 int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta, bool enable);
-int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-			   struct ieee80211_sta *sta, bool enable);
 int mt7915_mcu_sta_update_hdr_trans(struct mt7915_dev *dev,
 				    struct ieee80211_vif *vif,
 				    struct ieee80211_sta *sta);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
