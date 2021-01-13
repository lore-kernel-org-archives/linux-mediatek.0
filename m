Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FD9C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:10:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4787B233F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4787B233F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UCQFM4ZShNjJJTTSv+o7o1odKOJ4v7pRHkWQUUl/i4s=; b=OQB22ThN91H83nPKz426+KcygM
	iKgNj26nNmXKFSuNlfraW8ZMufO98caeI0qKplBAdWucfqh5MSJW3/JPVGl/EAn1Oc7uGQKnHsi7d
	iSUPckb96tct1lGbIPgsvvqPpG6VfDRWnnuE0AOS6ucIGdrX7/kKhbWN0RxQxzingrcj9EDiq17Uj
	eOIiJVe8vAp+EVgFR+5Oh2M0JepdDi4LT2mF6RJW985hnSzd3Lg5GNiYgjJbwrLeI58NLQXWzRpkG
	nBhe/dJFjdjkmwXf7Zg2+oXq0MfMjOy0IGbD1mdrh+vSEbebj/pacGi5n4QwiGvU2lONGcOpci89a
	3I5C0DKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzeyB-0000wh-OU; Wed, 13 Jan 2021 12:09:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzey8-0000vP-W8
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 12:09:46 +0000
X-UUID: ecb7245298f748d9a505bd48a3566cc1-20210113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NftRybXrbT8qgd7kKNXTnN6hUoz/Zvp6jp0PTrpmWQ4=; 
 b=uiu3p2PFMu6cmQwHUHWEemVaxh5wIZlnZgT2rouwel6rNOEQVy+2iZfiUp0ao/XI5JQgGfDXPu5dgOuafsusKlyJcwRLKA6v/hGNLXRK59usF8yonwASHVy7p1zGkr8x8XfEMKrzLeNk2qVUypup13bIhcFT+WAQnrd1wxq2fDY=;
X-UUID: ecb7245298f748d9a505bd48a3566cc1-20210113
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1714212240; Wed, 13 Jan 2021 04:09:38 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 04:09:37 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 20:09:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 13 Jan 2021 20:09:35 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/2] mt76: mt7915: simplify peer's TxBF capability check
Date: Wed, 13 Jan 2021 20:09:32 +0800
Message-ID: <287bbdb0193bd74069219b97199ba4ec72127bd8.1610539467.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_070945_240682_08E3A7DE 
X-CRM114-Status: GOOD (  12.98  )
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

This is a preliminary patch for implicit beamforming support.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 50 +++++++------------
 1 file changed, 17 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 0baef70fc522..f38bc421ea8e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -66,9 +66,6 @@ struct mt7915_fw_region {
 
 #define MCU_PATCH_ADDRESS		0x200000
 
-#define MT_STA_BFER			BIT(0)
-#define MT_STA_BFEE			BIT(1)
-
 #define FW_FEATURE_SET_ENCRYPT		BIT(0)
 #define FW_FEATURE_SET_KEY_IDX		GENMASK(2, 1)
 #define FW_FEATURE_OVERRIDE_ADDR	BIT(5)
@@ -1948,16 +1945,23 @@ mt7915_mcu_sta_bfee_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		bfee->fb_identity_matrix = true;
 }
 
-static u8
-mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *vif,
-			 struct ieee80211_sta *sta)
+static int
+mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+		    struct ieee80211_sta *sta, bool enable)
 {
-	u8 type = 0;
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct mt7915_phy *phy;
+	struct sk_buff *skb;
+	int r, len;
+	bool ebfee = 0, ebf = 0;
 
 	if (vif->type != NL80211_IFTYPE_STATION &&
 	    vif->type != NL80211_IFTYPE_AP)
 		return 0;
 
+	phy = mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
+
 	if (sta->he_cap.has_he) {
 		struct ieee80211_he_cap_elem *pe;
 		const struct ieee80211_he_cap_elem *ve;
@@ -1970,12 +1974,12 @@ mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 		if ((HE_PHY(CAP3_SU_BEAMFORMER, pe->phy_cap_info[3]) ||
 		     HE_PHY(CAP4_MU_BEAMFORMER, pe->phy_cap_info[4])) &&
 		    HE_PHY(CAP4_SU_BEAMFORMEE, ve->phy_cap_info[4]))
-			type |= MT_STA_BFEE;
+			ebfee = true;
 
 		if ((HE_PHY(CAP3_SU_BEAMFORMER, ve->phy_cap_info[3]) ||
 		     HE_PHY(CAP4_MU_BEAMFORMER, ve->phy_cap_info[4])) &&
 		    HE_PHY(CAP4_SU_BEAMFORMEE, pe->phy_cap_info[4]))
-			type |= MT_STA_BFER;
+			ebf = true;
 	} else if (sta->vht_cap.vht_supported) {
 		struct ieee80211_sta_vht_cap *pc;
 		struct ieee80211_sta_vht_cap *vc;
@@ -1989,36 +1993,16 @@ mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 		     IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
 		if ((pc->cap & cr) && (vc->cap & ce))
-			type |= MT_STA_BFEE;
+			ebfee = true;
 
 		if ((vc->cap & cr) && (pc->cap & ce))
-			type |= MT_STA_BFER;
-	} else if (sta->ht_cap.ht_supported) {
-		/* TODO: iBF */
+			ebf = true;
 	}
 
-	return type;
-}
-
-static int
-mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-		    struct ieee80211_sta *sta, bool enable)
-{
-	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-	struct mt7915_phy *phy;
-	struct sk_buff *skb;
-	int r, len;
-	u8 type;
-
-	phy = mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
-
-	type = mt7915_mcu_sta_txbf_type(phy, vif, sta);
-
 	/* must keep each tag independent */
 
 	/* starec bf */
-	if (type & MT_STA_BFER) {
+	if (ebf) {
 		len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bf);
 
 		skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
@@ -2034,7 +2018,7 @@ mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	}
 
 	/* starec bfee */
-	if (type & MT_STA_BFEE) {
+	if (ebfee) {
 		len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bfee);
 
 		skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
